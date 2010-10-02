<?php sfConfig::set('sf_web_debug', false); ?>
<fb:title><?php echo sfContext::getInstance()->getResponse()->getTitle() ?></fb:title>
<?php echo $sf_content ?>