<html>
<head>
    <title>Teambook - Home</title>
    <meta name="layout" content="main"/>
</head>
<body>
<link rel="stylesheet" type="text/css" href="css/slides.css" media="screen"/>
<g:javascript library="slides.min.jquery"/>

<script type="text/javascript" language="javascript">
    (function($) {
        $(function() {
            $('#slides').slides({
                preload: true,
                preloadImage: 'images/slides/loading.gif',
                play: 5000,
                pause: 2500,
                hoverPause: true,
                animationStart: function() {
                    $('.caption').animate({
                        bottom:-35
                    }, 100);
                },
                animationComplete: function(current) {
                    $('.caption').animate({
                        bottom:0
                    }, 200);
                }
            });
        });
    })(jQuery);
</script>
<h1>Welcome to Teambook</h1>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>



<div id="container">
    <div id="example">
        <div id="slides">
            <div class="slides_container">
                <div class="slide">
                    <a href="http://www.claudiomarangoni.com.ar/escuela.php" title="Marangoni" target="_blank"><img src="images/slides/marangoniFutbol.jpg" width="400" height="270" alt="Slide 1"></a>
                    <div class="caption">
                        <p>Marangoni</p>
                    </div>
                </div>
                <div class="slide">
                    <a href="http://www.facebook.com/group.php?gid=2363980608" title="Ocampo" target="_blank"><img src="images/slides/ocampoFutbol.jpg" width="400" height="270" alt="Slide 2"></a>
                    <div class="caption" style="bottom:0">
                        <p>Ocampo Futbol</p>
                    </div>
                </div>
                <div class="slide">
                    <a href="http://en.wikipedia.org/wiki/Buenos_Aires_Lawn_Tennis_Club" title="Lawn Tennis" target="_blank"><img src="images/slides/lawnTennis.jpg" width="400" height="270" alt="Slide 3"></a>
                    <div class="caption">
                        <p>Lawn Tennis</p>
                    </div>
                </div>

            </div>
            <a href="#" class="prev"><img src="images/slides/arrow-prev.png" width="24" height="43" alt="Arrow Prev"></a>
            <a href="#" class="next"><img src="images/slides/arrow-next.png" width="24" height="43" alt="Arrow Next"></a>
        </div>
        <img src="images/slides/example-frame.png" width="550" height="341" alt="Example Frame" id="frame">
    </div>
</div>

</body>
</html>
