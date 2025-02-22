#!/bin/sh

if [ $PS_ENABLE_SSL = 1 ]; then
  if [ -f ./.docker/ssl.key ]; then
    echo "\n* Remove default-ssl.conf file ...";
    rm /etc/apache2/sites-available/default-ssl.conf

    echo "\n* Enable SSL in Apache ...";
    a2enmod ssl

    echo "\n* Restart apache ...";
    service apache2 restart

    echo "\n* Add virtual host for HTTPS ...";
    echo "<VirtualHost *:443>
  ServerName localhost
  DocumentRoot /var/www/html
  ErrorLog \${APACHE_LOG_DIR}/error.log
  SSLEngine on
  SSLCertificateFile /var/www/html/.docker/ssl.crt
  SSLCertificateKeyFile /var/www/html/.docker/ssl.key
</VirtualHost>" > /etc/apache2/sites-available/001-ssl.conf

    echo "\n* Enable https site"
    a2ensite 001-ssl

    ## Stop Apache process because apache2-foreground will start it
    echo "\n* Stop apache ...";
    service apache2 stop
  else
    echo "\n* The file .docker/ssl.key has not been found.";
  fi
else
  echo "\n* HTTPS is not enabled.";
fi

if [ "${DISABLE_MAKE}" != "1" ]; then
  echo "\n* Running composer ...";
  runuser -g www-data -u www-data -- /usr/local/bin/composer install --no-interaction

  echo "\n* Build assets ...";
  runuser -g www-data -u www-data -- /usr/bin/make assets
fi

if [ "$DB_SERVER" = "<to be defined>" -a $PS_INSTALL_AUTO = 1 ]; then
    echo >&2 'error: You requested automatic PrestaShop installation but MySQL server address is not provided '
    echo >&2 '  You need to specify DB_SERVER in order to proceed'
    exit 1
elif [ "$DB_SERVER" != "<to be defined>" -a $PS_INSTALL_AUTO = 1 ]; then
    RET=1
    while [ $RET -ne 0 ]; do
        echo "\n* Checking if $DB_SERVER is available..."
        mysql -h $DB_SERVER -P $DB_PORT -u $DB_USER -p$DB_PASSWD -e "status" > /dev/null 2>&1
        RET=$?

        if [ $RET -ne 0 ]; then
            echo "\n* Waiting for confirmation of MySQL service startup";
            sleep 5
        fi
    done
        echo "\n* DB server $DB_SERVER is available, let's continue !"
fi

# From now, stop at error
set -e

if [ $PS_DEV_MODE -ne 1 ]; then
  echo "\n* Disabling DEV mode ...";
  sed -ie "s/define('_PS_MODE_DEV_', true);/define('_PS_MODE_DEV_',\ false);/g" /var/www/html/config/defines.inc.php
fi

if [ ! -f ./config/settings.inc.php ]; then
    if [ $PS_INSTALL_AUTO = 1 ]; then

        echo "\n* Installing PrestaShop, this may take a while ...";
	echo -e "\n* Variables:"
	echo -e "PS_ERASE_DB: $PS_ERASE_DB"
	echo -e "DB_SERVER: $DB_SERVER"
	echo -e "DB_PORT: $DB_PORT"
	echo -e "DB_USER: $DB_USER"
	echo -e "DB_PASSWD: $DB_PASSWD"
	echo -e "DB_NAME: $DB_NAME"
	mariadb -h $DB_SERVER -P $DB_PORT -u $DB_USER -p$DB_PASSWD -e "SHOW DATABASES;"

        if [ $PS_ERASE_DB = 1 ]; then
            echo "\n* Drop & recreate mysql database...";
            if [ $DB_PASSWD = "" ]; then
                echo "\n* Dropping existing database $DB_NAME..."
                mariadb -h $DB_SERVER -P $DB_PORT -u root -p$DB_PASSWD -e "drop database if exists $DB_NAME;"
                echo "\n* Creating database $DB_NAME..."
                mariadb -h $DB_SERVER -P $DB_PORT -u root -p$DB_PASSWD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
		echo "\n* Granting privileges to $DB_USER on $DB_NAME..."
        	mariadb -h $DB_SERVER -P $DB_PORT -u root -p$DB_PASSWD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
            else
                echo "\n* Dropping existing database $DB_NAME..."
                mariadb -h $DB_SERVER -P $DB_PORT -u root -p$DB_PASSWD -e "drop database if exists $DB_NAME;"
                echo "\n* Creating database $DB_NAME..."
                mariadb -h $DB_SERVER -P $DB_PORT -u root -p$DB_PASSWD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
		echo "\n* Granting privileges to $DB_USER on $DB_NAME..."
        	mariadb -h $DB_SERVER -P $DB_PORT -u root -p$DB_PASSWD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
            fi
        fi

        if [ "$PS_DOMAIN" = "<to be defined>" ]; then
            export PS_DOMAIN=$(hostname -i)
        fi

        echo "\n* Launching the installer script..."
        runuser -g www-data -u www-data -- php /var/www/html/$PS_FOLDER_INSTALL/index_cli.php \
        --domain="$PS_DOMAIN" --db_server=$DB_SERVER:$DB_PORT --db_name="$DB_NAME" --db_user=$DB_USER \
        --db_password=$DB_PASSWD --prefix="$DB_PREFIX" --firstname="Marc" --lastname="Beier" \
        --password="$ADMIN_PASSWD" --email="$ADMIN_MAIL" --language=$PS_LANGUAGE --country=$PS_COUNTRY \
        --all_languages=$PS_ALL_LANGUAGES --newsletter=0 --send_email=0 --ssl=$PS_ENABLE_SSL

        if [ $? -ne 0 ]; then
            echo 'warning: PrestaShop installation failed.'
        fi
    fi
else
    echo "\n* PrestaShop Core already installed...";
fi

if [ $PS_DEMO_MODE -ne 0 ]; then
    echo "\n* Enabling DEMO mode ...";
    sed -ie "s/define('_PS_MODE_DEMO_', false);/define('_PS_MODE_DEMO_',\ true);/g" /var/www/html/config/defines.inc.php
fi

echo "\n* Almost ! Starting web server now\n";

exec apache2-foreground
