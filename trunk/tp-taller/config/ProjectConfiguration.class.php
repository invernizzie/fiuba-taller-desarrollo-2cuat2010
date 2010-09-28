<?php

// Original.
// require_once '/home/demian/Programming/taller_desarrollo_workspace/symfony/lib/autoload/sfCoreAutoload.class.php';

// Por Demian.
require_once dirname(__FILE__).'/../../symfony/lib/autoload/sfCoreAutoload.class.php';
sfCoreAutoload::register();

class ProjectConfiguration extends sfProjectConfiguration
{
  public function setup()
  {
    $this->enablePlugins(array(
      'sfDoctrinePlugin',
      'sfDoctrineGuardPlugin',
      'sfFacebookConnectPlugin'
    ));
  }
}
