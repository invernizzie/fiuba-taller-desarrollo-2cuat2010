<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
  <head>
    <?php use_helper('sfFacebookConnect') ?>
    <?php include_http_metas() ?>
    <?php include_metas() ?>
    <?php include_title() ?>
    <?php include_stylesheets() ?>
    <?php include_javascripts() ?>
    <script type="text/javascript" src="/sfFacebookConnectPlugin/js/animation/animation.js"></script>
    <title><?php include_slot('title', 'Teambook') ?></title>
  </head>
  <body>
    <div id="container">
        <div id="header">
            <div class="content">
                <h1><a href="<?php echo url_for('homepage') ?>" title="Teambook"></a></h1>

                <div id="sub_header">
                    <div class="post">
                        <h2>Start playing now</h2>
                        <div>
                            <a href="<?php echo url_for('job/index') ?>">Post a new match</a>
                        </div>
                    </div>

                    <div class="search">
                        <h2>Look for a match</h2>
                        <form action="" method="get">
                            <input type="text" name="keywords" id="search_keywords"/>
                            <input type="submit" value="search"/>
                            <div class="help">
                                Ingresa palabras clave (soccer, tennis, Rosario, ...)
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="content">
            <?php if ($sf_user->hasFlash('notice')): ?>
                <div class="flash_notice">
                    <?php echo $sf_user->getFlash('notice') ?>
                </div>
            <?php endif ?>

            <?php if ($sf_user->hasFlash('error')): ?>
                <div class="flash_error">
                    <?php echo $sf_user->getFlash('error') ?>
                </div>
            <?php endif ?>

            <div class="content">
                <?php echo $sf_content ?>
            </div>
        </div>

        <div id="footer">
            <div class="content">
                <span class="symfony">
                    <img src="http://www.jobeet.org/images/jobeet-mini.png">
                    powered by <a href="http://www.symfony-project.org/">
                    <img src="http://www.jobeet.org/images/symfony.gif" alt="symfony framework">
                    </a>
                </span>
                <ul>
                    <li><a href="">About Teambook</a></li>
                    <li class="feed"><a href="">Full feed</a></li>
                    <li><a href ="">Teambook API</a></li>
                    <li class="last"><a href="">Affiliates</a></li>
                </ul>
            </div>
        </div>
    </div>

    <?php $sfGuardUser = sfFacebook::getSfGuardUserByFacebookSession(); ?>
    Hello <fb:name uid="<?php echo $sfGuardUser ? $sfGuardUser->getProfile()->getFacebookUid() : '' ?>"></fb:name>

    <?php //echo include_facebook_connect_script() ?>
    <?php include_bottom_facebook_connect_script(); ?>
  </body>
</html>