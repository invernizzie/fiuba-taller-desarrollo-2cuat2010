<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
        <link rel="stylesheet" type="text/css" href="css/slides.css" media="screen" />

		<style type="text/css" media="screen">
		#nav {
			margin-top:20px;
			margin-left:30px;
			width:228px;
			float:left;
		}

		.homePagePanel * {
			margin:0px;
		}
		.homePagePanel .panelBody ul {
			list-style-type:none;
			margin-bottom:10px;
		}
		.homePagePanel .panelBody h1 {
			text-transform:uppercase;
			font-size:1.1em;
			margin-bottom:10px;
		}
		.homePagePanel .panelBody {
			background: url(images/leftnav_midstretch.png) repeat-y top;
			margin:0px;
			padding:15px;
		}
		.homePagePanel .panelBtm {
			background: url(images/leftnav_btm.png) no-repeat top;
			height:20px;
			margin:0px;
		}

		.homePagePanel .panelTop {
			background: url(images/leftnav_top.png) no-repeat top;
			height:11px;
			margin:0px;
		}
		h2 {
			margin-top:15px;
			margin-bottom:15px;
			font-size:1.2em;
		}
		#pageBody {
			margin-left:280px;
			margin-right:20px;
		}
        </style>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
        <g:javascript library="slides.min.jquery"/>
        <script type="text/javascript" language="javascript">
			$(function(){
				$('#slides').slides({
					preload: true,
					preloadImage: 'images/slides/loading.gif',
					play: 5000,
					pause: 2500,
					hoverPause: true,
					animationStart: function(){
						$('.caption').animate({
							bottom:-35
						},100);
					},
					animationComplete: function(current){
						$('.caption').animate({
							bottom:0
						},200);
						if (window.console && console.log) {
							// example return of current slide number
							console.log(current);
						};
					}
				});
			});
		</script>
    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Application Status</h1>
                    <ul>
                        <li>App version: <g:meta name="app.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                    <h1>Installed Plugins</h1>
                    <ul>
                        <g:set var="pluginManager"
                               value="${applicationContext.getBean('pluginManager')}"></g:set>

                        <g:each var="plugin" in="${pluginManager.allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>

                    </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>

		
		
		 <div id="pageBody">
            <h1>Welcome to Grails</h1>
            <p>Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display whatever
            content you may choose. Below is a list of controllers that are currently deployed in this application,
            click on each to execute its default action:</p>

            <div id="controllerList" class="dialog">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
        
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
