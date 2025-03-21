<?php

require_once dirname(__FILE__).'/../../config/config.inc.php';
require_once dirname(__FILE__).'/../../init.php';
require_once dirname(__FILE__).'/ps_facetedsearch.php';

// set precision currency
$currency = Currency::getCurrencyInstance(1);
$currency->precision = 0;
$currency->update();

$currency = Currency::getCurrencyInstance(2);
$currency->precision = 0;
$currency->update();

exit;