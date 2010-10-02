<?php use_helper('sfFacebookConnect') ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
  <head>
    <?php include_http_metas() ?>
    <?php include_metas() ?>
    <?php include_title() ?>
    <?php include_stylesheets() ?>
    <?php include_javascripts() ?>
    <script type="text/javascript" src="/sfFacebookConnectPlugin/js/animation/animation.js"></script>
  </head>
  <body>
    
    <?php $sfGuardUser = sfFacebook::getSfGuardUserByFacebookSession(); ?>
    Hello <fb:name uid="<?php echo $sfGuardUser ? $sfGuardUser->getProfile()->getFacebookUid() : '' ?>"></fb:name>

    <?php echo $sf_content ?>
    <?php include_bottom_facebook_connect_script(); ?>
  </body>
</html>