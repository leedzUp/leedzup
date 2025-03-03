<?php

require_once dirname(__FILE__).'/../../config/config.inc.php';
require_once dirname(__FILE__).'/../../init.php';


  // Considering the indexing task can be really long, we ask the PHP process to not stop before 2 hours.
  ini_set('max_execution_time', '7200');
  Category::regenerateEntireNtree();



