<?php

// Original.
// require_once '/home/demian/Programming/taller_desarrollo_workspace/symfony/lib/autoload/sfCoreAutoload.class.php';

// Por Demian.
require_once '../symfony/lib/autoload/sfCoreAutoload.class.php';
sfCoreAutoload::register();

class ProjectConfiguration extends sfProjectConfiguration
{
  public function setup()
  {
    $this->enablePlugins('sfDoctrinePlugin');
  }
}
