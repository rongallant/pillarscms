<!--- I am the default look for the site --->
<cfimport prefix="menu" taglib="../../pillarscms/Pages/Menus/" />
<cfimport prefix="fb" taglib="../../pillarscms/" />

<!--- I generate the blocks to be outputed on the layout --->
<fb:fusebox fuseaction="home.siteblocks" layout="none" />
<cfif isDefined('attributes.pageid') and len(attributes.pageid)>
	<fb:fusebox fuseaction="home.pageblocks" pageid="#attributes.pageid#" layout="none" />
</cfif>

<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<!--  Version: Multiflex-3 Update-7 / Overview             -->
<!--  Date:    January 15, 2007                            -->
<!--  Author:  Wolfgang                                    -->
<!--  License: Fully open source without restrictions.     -->
<!--           Please keep footer credits with a link to   -->
<!--           Wolfgang (www.1-2-3-4.info). Thank you!     -->

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="3600" />
	<meta name="revisit-after" content="2 days" />
	<meta name="robots" content="index,follow" />
	<meta name="publisher" content="PillarCMS" />
	<meta name="copyright" content="PillarCMS" />
	<meta name="author" content="Design: Wolfgang (www.1-2-3-4.info) / Modified: PillarCMS" />
	<meta name="distribution" content="global" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta http-equiv="imagetoolbar" content="no" />
	<title>#my.site.title#<cfif len(my.page.title)> - #my.page.title#</cfif></title>
	<style type="text/css" media="all">
		@import url("designs/MainStyle.css");
		@import url("designs/mainsite/main/styles/main.css");
	</style>
	<link rel="stylesheet" type="text/css" media="screen,projection,print" href="designs/mainsite/main/styles/multiflex/layout4_setup.css" />
	<link rel="stylesheet" type="text/css" media="screen,projection,print" href="designs/mainsite/main/styles/multiflex/layout4_text.css" />
	<link rel="icon" type="image/x-icon" href="../../images/multiflex/" />
	<script src="assets/scripts/scripts.js" type="text/javascript"></script>
	<cfif isDefined('request.qforms') and request.qforms eq 1>
		<script type="text/javascript" src="assets/scripts/qForm/qforms.js"></script>
		<script type="text/javascript" src="assets/scripts/qForm/pillarscms_loadqf.js"></script>
	</cfif>
</head>

<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->

<body #my.layout.bodytag#>
<a name="##top" id="top"></a>

  <!-- Main Page Container -->
  <div class="page-container">

   <!-- For alternative headers START PASTE here -->

    <!-- A. HEADER -->      
    <div class="header">
      
      <!-- A.1 HEADER TOP -->
      <div class="header-top">
        
        <!-- Sitelogo and sitename -->
        <a class="sitelogo" href="##" title="Go to Start page"></a>
        <div class="sitename">
          <h1><a href="index.html" title="Go to Start page">#my.site.title#</a></h1>
         <!---<h2>Open Source Template</h2>--->
        </div>
    
        <!-- Navigation Level 0 -->
        <div class="nav0">
			<!--- personalization --->
			<cfscript>
				function write_greeting() {
					hr = hour(now());
					if ( hr gte 1 and hr lte 11 ) greet = "Good morning";
					else if ( hr gte 12 and hr lte 17 ) greet = "Good afternoon";
					else greet = "Good evening";
					return greet;
				}
			</cfscript>
			<div class="greeting">#write_greeting()# #my.user.fname#</div>
			<div class="datetime">Today is #DateFormat(now(),"dddd, mmmm d, yyyy")#</div>
        </div>			

        <!-- Navigation Level 1 -->
        <div class="nav1">
			<!--- Site Menu --->
			<cfif isDefined('request.my.layout.sitemenu') and len(request.my.layout.sitemenu)>
				#request.my.layout.sitemenu#
			</cfif>
        </div>              
      </div>
      
      <!-- A.2 HEADER MIDDLE -->
      <div class="header-middle">    
   
        <!-- Site message -->
        <div class="sitemessage">
          <h1>EASY &bull; FLEXIBLE &bull; ROBUST</h1>
          <h2>The third generation Multiflex is<br /> here, now with cooler design<br /> features and easier code.</h2>
          <h3><a href="##">&rsaquo;&rsaquo;&nbsp;More details</a></h3>
        </div>        
      </div>
      
      <!-- A.3 HEADER BOTTOM -->
      <div class="header-bottom">
      
        <!-- Navigation Level 2 (Drop-down menus) -->
        <div class="nav2">
	
		<!--- Main Menu --->
		<cfif isDefined('request.my.layout.mainmenu') and len(request.my.layout.mainmenu)>
			#request.my.layout.mainmenu#
		</cfif>
	<!---
          <!-- Navigation item -->
          <ul>
            <li><a href="index.html">Overview</a></li>
          </ul>
          
          <!-- Navigation item -->
          <ul>
            <li><a href="##">Page Layouts<!--[if IE 7]>--></a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul>
                  <li><a href="layout1.html">Layout-1 (1-col)</a></li>
                  <li><a href="layout2.html">Layout-2 (2-col)</a></li>
                  <li><a href="layout3.html">Layout-3 (2-col)</a></li>
                  <li><a href="layout4.html">Layout-4 (3-col)</a></li>
                  <li><a href="layout5.html">Layout-5 (3-col)</a></li>                                    
                </ul>
              <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
          </ul>          

          <!-- Navigation item -->
          <ul>
            <li><a href="##">Header Layouts<!--[if IE 7]>--></a><!--<![endif]-->
              <!--[if lte IE 6]><table><tr><td><![endif]-->
                <ul>
                  <li><a href="header1.html">Header-1 (T+M+B)</a></li>
                  <li><a href="header2.html">Header-2 (T+M)</a></li>
                  <li><a href="header3.html">Header-3 (T+B)</a></li>
                  <li><a href="header4.html">Header-4 (M+B)</a></li>
                  <li><a href="header5.html">Header-5 (T)</a></li>
                  <li><a href="header6.html">Header-6 (M)</a></li>
                  <li><a href="header7.html">Header-7 (B)</a></li>
                </ul>
              <!--[if lte IE 6]></td></tr></table></a><![endif]-->
            </li>
          </ul>
		--->       
        </div>
	  </div>

      <!-- A.4 HEADER BREADCRUMBS -->

      <!-- Breadcrumbs -->
      <div class="header-breadcrumbs">

       	<!--- Page Top --->
		<cfif isDefined('request.my.layout.top') and len(request.my.layout.top)>
			#request.my.layout.top#
		</cfif>

        <!-- Search form -->                  
        <div class="searchform">
          <form action="##" method="get" class="form">
            <fieldset>
              <input value=" Search..." name="field" class="field" />
              <input type="submit" value="GO!" name="button" class="button" />
            </fieldset>
          </form>
        </div>
      </div>
    </div>

    <!-- For alternative headers END PASTE here -->

    <!-- B. MAIN -->
    <div class="main">
 
      <!-- B.1 MAIN NAVIGATION -->
      <div class="main-navigation">
	
        <!-- Navigation Level 3 -->
        <div class="round-border-topright"></div>
        <h1 class="first">&nbsp;</h1>

		<!--- Main Menu --->
		<cfif isDefined('request.my.layout.mainmenu') and len(request.my.layout.mainmenu)>
			<div class="myHorizontalMainMenu">#request.my.layout.mainmenu#</div>
		</cfif>
	
		<!--- leftcolumn --->
		<cfif isDefined('request.my.layout.leftcolumn') and len(request.my.layout.leftcolumn)>
			#request.my.layout.leftcolumn#
		</cfif>
			
        <!-- Navigation with grid style -->
        <dl class="nav3-grid">
          <dt><a href="##">Navlink 11</a></dt>
          <dt><a href="##">Navlink 12</a></dt>
            <dd><a href="##">Navlink 121</a></dd>
            <dd><a href="##">Navlink 122</a></dd>
            <dd><a href="##">Navlink 123</a></dd>		
          <dt><a href="##">Navlink 13</a></dt>
          <dt><a href="##">Navlink 14</a></dt>
          <dt><a href="##">Navlink 15</a></dt>
        </dl>                        

			<!---
        <!-- Template infos -->                
        <h1>Multiflex Series</h1>
        <p>A design series for those who want a template that can be used for almost any situation. It is recommended to have at least beginners knowledge of XHTML/CSS to work with this template in a satisfying way.</p>
        <h3>Multiflex-1</h3>
        <p>Released: 15.05.2006<br />OK for operational use, but has heavy code.<br /><a href="http://www.1-2-3-4.info/webtemplates/multiflex1/">Download latest update</a></p>
        <h3>Multiflex-2</h3>
        <p>Released: 08.06.2006<br />OK for operational use, but has heavy code.<br /><a href="http://www.1-2-3-4.info/webtemplates/multiflex2/">Download latest update</a></p>
        <h3>Multiflex-3</h3>
        <p>Released: 25.11.2006<br />BEST for operational use, with light code and 97% browser compatibility.<br /><a href="http://www.1-2-3-4.info/webtemplates/multiflex3/">Download latest update</a></p>
        <h3>Multiflex-4</h3>
        <p>Plan: Second Quarter 2007<br />Same design as Multiflex-3, but with a liquid layout. But it is still uncertain if this version will be developed due to my limited time.<br /><a href="http://www.1-2-3-4.info/webtemplates/">Check if available!</a></p> 
        <h1>Easyflex Series</h1>
        <p>A new designs series that is simple, easy and fresh, and is ideal for those who have no or very little experience of XHTML/CSS and prefer to edit their web contents in FrontPage, Dreamweaver and other similar editors.</p>
        <p>Plan: Third Quarter 2007<br /><a href="http://www.1-2-3-4.info/webtemplates/">Check if available!</a></p>
--->

      </div>
 
      <!-- B.2 MAIN CONTENT -->
      <div class="main-content">
		
		<!--- Heading --->
		<cfif isDefined('my.page.heading') and len(my.page.heading)>
			<h1>#my.page.heading#</h1>
		</cfif>

		<!--- main text content goes here --->
		#fusebox.layout#

		<!--- Page Bottom --->
		<cfif isDefined('request.my.layout.bottom') and len(request.my.layout.bottom)>
			#request.my.layout.bottom#
		</cfif>
		
		<!---
        <!-- Pagetitle -->
        <h1 class="pagetitle">Multiflex-3 Overview</h1>

        <!-- Content unit - One column -->
        <div class="column1-unit">
          <h1>Flexible and robust template</h1>                            
          <h3>Now substantially improved and simplified</h3>
          <p>Multiflex-3 is the third generation Multiflex template. Numerous improvements have been made since Multiflex-2: More modern appearance, more page layouts, new drop down menus with sticky hover zones, solid printer support, expanded browser support, fully scalable upwards and downwards when user resizes the default browser font size, and last but not least, a much better and easier code. But there is more than that. Check the navigation menu to discover all about the new Multiflex-3!</p>
        </div>
        <hr class="clear-contentunit" />          

        <!-- Content unit - One column -->
        <div class="column1-unit">        
          <h1>Content Management Systems</h1>                            
          <h3>Portings already available or in development</h3>
          <p>At the time of release, portings were being produced for various Content Management Systems, such as <a href="http://www.modxcms.com">MODx</a>, <a href="http://www.wordpress.org">WordPress</a>, and <a href="http://www.contrexx.com">Contrexx</a>.</p>
        </div>          
        <hr class="clear-contentunit" />          

        <!-- Content unit - One column -->
        <div class="column1-unit">
          <h1>Extensive browser support</h1>                            
          <h3>Tested for all common browsers and systems</h3>
          <p>Multiflex-3 has been tested live for all major browsers, and functions properly for about 97% of currently used browsers. Only exception is the outdated IE5.x which has incorrect rendering.</p>

          <p>Template successfully tested for:</p>

          <h6>Windows 2000 and XP</h6> 
          <p>IE6, IE7, Firefox 2.0, Mozilla 1.7, Netscape 7.2, and Opera 9.0.</p>

          <h6>Windows Vista</h6> 
          <p>IE7, Firefox 2.0, and Opera 9.0.</p>

          <h6>Mac OSX 10.3</h6> 
          <p>Firefox 2.0, Mozilla 1.7, Netscape 7.2, Opera 9.0, Camino 1.0, and Safari 1.3.</p>

          <h6>Mac OSX 10.4</h6> 
          <p>Firefox 2.0, Mozilla 1.7, Netscape 7.2, Opera 9.0, Camino 1.0, and Safari 2.0.</p>

          <h6>Linux (Fedora Core 4)</h6>          
          <p>Firefox 2.0, Mozilla 1.7, Opera 9.0, and Konqueror 3.4.</p>

          <h6>Check browser screenshots</h6>
          <ul>
            <li><a href="http://www.1-2-3-4.info/webtemplates/multiflex3/">View individual images</a></li>
            <li><a href="http://www.1-2-3-4.info/webtemplates/multiflex3/">Download image package</a>  (ZIP-file, 2.5 MB)</li>
          </ul>
        </div>
        <hr class="clear-contentunit" />                    
                
        <!-- Content unit - One column -->
        <div class="column1-unit">
          <h1>Release Notes</h1>                            

          <h2>Multiflex-3 / Update-7</h2>
          <h3>January 15, 2007</h3>
          <h6>Drop-down menu</h6>
          <p>Browser: Opera 9.10 / Description: In Opera 9.0.2 the drop-down meus behaved correctly, but in the latest version Opera 9.10, the drop-down main menu collapsed after hovering the main links. / Correction: In the CSS-class ".nav2 ul li a" the float statement was modified to "float:none !important /*Non-IE6*/; float:left /*IE-6*/;" in all "headerNN_setup.css" and "layoutNN_setup.css" files. The !important-float statement defines the behavior for Non-IE6 browsers including Opera, the other float-statement is for IE6.</p>
          <h6>Screenshots</h6>
          <p>Browser: All / Description: Fresh screenshots have been made for Update-7.</p>

          <h2>Multiflex-3 / Update-6</h2>
          <h3>December 18, 2006</h3>
          <h6>Drop-down menu</h6>
          <p>Browser: IE6 / Description: When hovering the drop-down menu, the rounded-corners image from the sidebar or subcontent boxes are incorrectly placed above the drop-down menu. This bug was initiated by the changes made in Update-4 (see below) / Correction: In the CSS-class ".nav2 ul li" is modified by the parameters "z-index:auto !important /*Non-IE6*/; z-index:1000 /*IE6*/;" was added to all "headerNN_setup.css" and "layoutNN_setup.css". The !important statement is for Non-IE6 browsers, the other statement for IE6.</p>
          
          <h2>Multiflex-3 / Update-5</h2>
          <h3>December 17, 2006</h3>
          <h6>Breadcrumb section background</h6>
          <p>Browser: All / Description: The replacement color (when image not found) for the background in the breadcrumbs section was set to its correct value. / Correction: For the CSS-class ".header-breadcrumbs" the replacement color-value for the parameter "background" was set to "rgb(255,255,255) in all "headerNN_setup.css" and "layoutNN_setup.css" files.</p>
          <h6>Centered images</h6>
          <p>Browser: Netscape / Description: Images positioned with "center" were displayed in left-justified position, but now correctly are displayed centered. / Correction: The CSS-class "img.center" was modified by including the parameter "display:block" and "width:auto" in all "layoutNN_text.css" files. As a result of this change, it is no longer necessary for the paragraph to be centered (&lt;p class="center"&gt;) when centering images. Paragraphs containing centered images are now simply coded as "&lt;p&gt;", without using any classes.</p>
          <h6>Footer height adjustment</h6>
          <p>Browser: All / Description: The footer did not expand sufficiently in the vertical when browser font-sizes were increased. / Correction: For the CSS-class ".footer" the parameter "height" was removed, while top and bottom paddings were introduced in "padding", all in the "layoutNN_setup.css" files.</p>
          <h6>Sitemessage width and text</h6>
          <p>Browser: All / Description: The site message in the middle header has received an increased width. / Correction: For the CSS-class ".sitemessage" the parameter "width" was increased by 50px in all "headerNN_setup.css" and "layoutNN_setup.css" files.</p>
          <h6>Corrected top drop-down menu</h6>
          <p>Browser: All / Description: Due to the changes in Update-4, an unwanted sideeffect appeared, namely that the sticky hover zones outside the drop-down submenu were missing on the right-hand side of the menu. The only way to resolve this issue was to remove the sticky hover zones altogether. / Correction: Reformulation and simplification of the CSS-classes belonging to ".nav2" in all "headerNN_setup.css" and "layoutNN_setup.css" files.</p>
          <h6>Javascript removed</h6>
          <p>Browser: All / Description: In order for the navigation menu to remain flicker-free for IE browsers, a Javascript was used in the previous versions of Multiflex-3. However, since these hover zones have been removed (see topic above), this Javascript is no longer necessary. / Correction: Link to Javascript in the HTML header section, the javascript directory "js", the javascript "ieflickerhack.js", and finally the background parameters for the sticky hovering background image in the CSS-class .nav2 were removed in all CSS and HTML files.</p>

          <h2>Multiflex-3 / Update-4</h2>
          <h3>December 11, 2006</h3>
          <h6>Drop-down menu critical bug solved</h6>
          <p>Browser: All / Description: When hovering the drop-down submenu at very large font-sizes, i.e. when the menu is shown on two or more lines, the hovered submenu is now shown on top of other main menu items. Until now, the hovered submenu would erroneously appear below other menu main items, thus making it impossible to reach those submenu links. / Correction: Removed the "z-index:1000" parameter in the CSS-class ".nav2 ul li" in all "headerNN_setup.css" and "layoutNN_setup.css" files.</p>
          <h2>Multiflex-3 / Update-3</h2>
          <h3>December 4, 2006</h3>
          <h6>Browser compatibility increased</h6>
          <p>Browser: Konqueror, Netscape and Mozilla / Description: Drop-down menus now correctly open up vertically. / Correction: Added a width-specification for the CSS-class ".nav2 ul li:hover ul" in "headerNN_setup.css" and "layoutNN_setup.css".</p>
          <h6>IE flicker hack moved</h6>
          <p>Browser: IE / Description: Flicker bug hack now moved from CSS to Javascript, for compatibility with IE6 versions before SP1. / Correction: Delted "html{expression...}" from "headerNN_setup" and "layoutNN_setup", and placed the code in the Javascript file "ieflickerhack.js" in the directory "js". Advantage is, that the CSS-file now validates correctly.</p>
          <h6>Browser screenshots</h6>
          <p>Browser: All / Modification: Individual image links removed, instead a general link to my homepage directory containing the screenshots of interest. Advantage is that screenshots can be added or deleted without breaking any links in the template.</p>          
          <h6>Footer text</h6>
          <p>Browser: All / Modification: Designer credits now reads "Design by", instead of before "Original design by".</p>          

          <h2>Multiflex-3 / Update-2</h2>
          <h3>November 29, 2006</h3>
          <h6>Printer layout and background color</h6>
          <p>Browser: All / Description: When printing, a gap was created between the header and the content section. Further, no background color was printed for the left navigation sidebar. / Correction: Removed erroneous vertical padding in CSS-class ".header-breadcrumbs in all CSS-files "layoutNN_setup.css". Further, included a printer CSS statement for the class ".main-navigation" in CSS-files "layoutNN_setup.css".</p>
          <h6>Template links</h6>
          <p>Browser: All / Modification: All template links now point to my homepage, instead of to Open Webdesign. This change was done in "index.html".</p>              

          <h2>Multiflex-3 / Update-1</h2>
          <h3>November 27, 2006</h3>
            <h6>Drop-down menu items</h6>
            <p>Browser: IE7 / Description: Misbehavior when hovering main link by showing multiple columns / Correction: Reformulated conditional "if" statements in "layoutNN.html", "headerNN.html" and "index.html".</p>
            <h6>Bottom header background</h6>
            <p>Browser: All / Description: Background gap between bottom header and breadcrumbs when browser font-size reduced / Correction: Added background to the CSS-class ".bottom-header" in "layoutNN_setup.css".</p>
            <h6>Rounded corners line</h6>
            <p>Browser: All / Description: When decreasing or increasing browser font size, a horizontal line appears above the rounded corners for subcontent boxes with boundary. Effect happens when font-size resizes, but page is not reloaded. / Solution: Simply reload the page, and the horizonal line disappears. This is a Safari bug which we have no control over.</p>
            <h6>Top search form</h6>
            <p>Browser: Konqueror 3.4 / Description: Field width available for search form widened, so that "Go" button appears to the right, and not below, the search area. / Modification: CSS-class ".header-breadrumbs" changed in "headerNN_setup.css" and "layoutNN_setup.css".</p>
            <h6>Search form layout</h6>
            <p>Browser: All / Description: Search forms now have their "Go" buttons below the search entry field (only exception is search form below the page header). Reason for this is that design remains consistent when browser font-sizes are resized / Modification: CSS-class ".button" changed in "headerNN_setup.css" and "layoutNN.css".</p>
            <h6>Button styles</h6>
            <p>Browser: All / Description: Default buttons are styled very differently for different browsers. / Correction: To harmonize button appearance we have now styled the buttons explicitly. However, Camino and Safari overrule this style with Mac-specific buttons. / Modification: CSS-class ".button" changed in "headerNN_setup.css", "layoutNN_setup.css" and "layoutNN_text.css".</p>
            <h6>Credits for flags</h6>
            <p>Credits were included for the flags.</p>
          <h2>Multiflex-3 Launched</h2>
          <h3>November 23, 2006</h3>
          <p>First public release at <a href="http://www.openwebdesign.org/">Open Webdesign</a>.</p>
        </div>
        <hr class="clear-contentunit" />                                                    
        
        <!-- Content unit - One column -->
        <div class="column1-unit">
          <h1>Development tools</h1>                            
          <p>Many people ask me what tools I use. Here is the list:</p>
          <ul>
            <li><a href="http://www.chami.com/html-kit/">HTML-Kit 292</a> freeware for coding the HTML documents.</li>
            <li><a href="http://www.newsgator.com/NGOLProduct.aspx?ProdId=TopStyle&amp;ProdView=lite">TopStyle Lite 3.10</a> freeware for coding the CSS documents.</li>
            <li><a href="http://www.browsercam.com">Browsercam</a> provides fantastic browser screenshots and live testing of all currently available browsers on various systems.</li>
          </ul>
        </div>
        <hr class="clear-contentunit" />
        
        <!-- Content unit - One column -->
        <div class="column1-unit">
          <h1>Visit <a href="http://www.opendesigns.org/">OpenDesigns.org</a></h1>                            
          <h3>Latest top website for open-source webtemplates</h3>
          <p>Maybe you have heard of the latest news in the open-source webdesign community. As of December 2006 a new community of webdesigners was launched at <a href="http://www.opendesigns.org/">OpenDesigns.org</a>, featuring some of the very best talents. If you want to stay on the cutting edge of open-source webtemplates, learn and get ideas from experienced designers in an active forum, or simply download state-of-the-art webtemplates for you to use, then this is definitely the site you want visit regularly.</p>
        </div>
        <hr class="clear-contentunit" />                                                              

        <!-- Content unit - One column -->
        <div class="column1-unit">
          <h1>Credits for ideas and reviews</h1>                            
          <p>Persons who contributed with ideas or CMS-portings for Multiflex-3:</p>
          <ul>
            <li><a href="http://www.blueskyvineyard.com">Jesse Rochman</a> (USA) -- CMS-port to <a href="http://www.modxcms.com">MODx</a>.</li>
            <li><a href="http://webgazette.co.uk">Ainslie Johnson</a> (UK) -- CMS-port to <a href="http://www.wordpress.org">WordPress</a>.</li>
            <li><a href="http://martin.thumann.eu">Martin Thumann</a> (Germany) -- CMS-port to <a href="http://www.contrexx-user.de">Contrexx</a>.</li>
            <li><a href="http://www.vertexworks.com">Ryan Thrash</a> (USA) -- IE6 hacks using "!important".</li>
            <li><a href="http://www.cssplay.co.uk/menus/drop_examples.html">Stu Nicholls</a> (UK) -- Drop-down menus.</li>
            <li><a href="http://www.positioniseverything.net/easyclearing.html">Big John</a> (USA) -- CSS-hack for clearing floats.</li>
            <li><a href="http://www.famfamfam.com/lab/icons/">Mark James</a> (UK) -- Icons and flags.</li>
            <li><a href="http://www.bartelme.at/showroom/archive/blue_crystal_desktops/">Wolfgang Bartelme</a> (Austria) -- Green header background.</li>            
          </ul>
        </div>
--->
      </div>
	
	
	<!--- rightcolumn --->
	<cfif isDefined('request.my.layout.rightcolumn') and len(request.my.layout.rightcolumn)>
        
		<!-- B.3 SUBCONTENT -->
		<div class="main-subcontent">

			#request.my.layout.rightcolumn#
	<!---
	        <!-- Subcontent unit -->
	        <div class="subcontent-unit-border">
	          <div class="round-border-topleft"></div><div class="round-border-topright"></div>
	          <h1>Layout Options</h1>
	          <p>Multiflex-3 has five layout styles, for 1-column, 2-column and 3-column pages.</p>
	          <p>Multiflex-3 also has seven header layout styles.</p>
	          <p>See links in navigation bar for more details.</p>
	        </div>
	
	        <!-- Subcontent unit -->
	        <div class="subcontent-unit-border">
	          <div class="round-border-topleft"></div><div class="round-border-topright"></div>
	          <h1>Code Structure</h1>
	          <p>The CSS code has been modularized into two files for easier maintenance:</p>   
	          <p>1) <strong>setup.css</strong> defines the basic layout structure of the page.</p>
	          <p>2) <strong>text.css</strong> defines the text formats available for the page main section.</p>
	        </div>
	
	        <!-- Subcontent unit -->
	        <div class="subcontent-unit-border-orange">
	          <div class="round-border-topleft"></div><div class="round-border-topright"></div>
	          <h1 class="orange">About me</h1>
	          <p>My name is Wolfgang, and you may be surprised to hear that for my real job I work as a full-time pastor for a Christian church. Feel free to visit our global <a href="http://www.sda.org/">church website</a>.</p>
	          <p>In 2006 I decided to start my own website. When surfing around I didn't find the template I needed. So I began to develop my own, with trials, errors and many long nights. About half a dozen experiments and six months later, I feel that I am coming closer to the design I need! But I will try to push it one step further, and make a liquid layout.</p>
	          <p>I have profited much from others who have shared their CSS-knowledge on the internet. The best way to show my appreciation is by sharing my results with others. So if this template is what you were looking for, then feel free to use and enjoy it!</p>
	          <p>If you want to get in touch with me, you can check my <a href="http://www.1-2-3-4.info/"> website</a> or email me via <a href="http://www.oswd.org/user/profile/id/10227/">OSWD.org</a> contact form.</p>
	          <p class="center"><img class="center" src="./img/myphoto.jpg" alt="Image description" /></p>
	        </div>
	
	        <!-- Subcontent unit -->
	        <div class="subcontent-unit-border-green">
	          <div class="round-border-topleft"></div><div class="round-border-topright"></div>
	          <h1 class="green">It's free!</h1>
	          <p>Enjoy the template for free. There are no restrictions in the license. As a sign of appreciation, please keep the author credits "<a href="http://www.1-2-3-4.info/">Design by Wolfgang</a>" in the template footer. Thanks!</p>
	        </div>
			--->
		
			</div>
		</cfif>
	</div>
      
    <!-- C. FOOTER AREA -->      
	<div class="footer">
		<p>Copyright &copy; 2010 PillarsCMS | All Rights Reserved</p>
		<p class="credits">Design by <a href="http://www.1-2-3-4.info/" title="Designer Homepage">Wolfgang</a>  | Powered by <a href="##" title="CMS Homepage">PillarsCMS</a></p>
		
		<!--- Admin Menu --->
		<cfif isDefined('request.my.layout.adminmenu') and len(request.my.layout.adminmenu)>
			#request.my.layout.adminmenu#
		</cfif>
	</div>
     
</div> 
	  
</body>
</html>
</cfoutput>