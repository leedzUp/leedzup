<?php

// Ceci est un simple script PHP pour afficher les informations de configuration de PHP.

echo "<h1>Informations PHP</h1>";

// La fonction phpinfo() affiche une grande quantité d'informations sur la configuration actuelle de PHP.
// Cela inclut les versions de PHP, les informations sur le système d'exploitation, les modules chargés,
// les variables d'environnement, les informations sur la gestion de PHP, les directives de configuration
// (php.ini) et les en-têtes HTTP.

phpinfo();

// Vous pouvez commenter ou supprimer certaines sections de phpinfo() si vous ne souhaitez pas
// afficher toutes les informations. Par exemple :
// phpinfo(INFO_GENERAL); // Affiche uniquement les informations générales.
// phpinfo(INFO_CONFIGURATION); // Affiche uniquement les informations de configuration.
// phpinfo(INFO_MODULES); // Affiche uniquement les informations sur les modules chargés.

?>