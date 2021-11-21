<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en-us">	
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title> KFIS</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" >

		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/ladda/ladda-themeless.min.css">
		<link rel="stylesheet" type="text/css" media="all" href="css/fileinput.min.css" />

		<!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-geoland.css">		
		
		<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

		<!-- KFIS Custom CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/start/jquery-ui-1.10.4.custom.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="css/ui.multiselect.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/jquery-datetimepicker/jquery.datetimepicker.css"/>
		<link rel="stylesheet" type="text/css" media="screen" href="js/libs/custom/jquery.combo.custom-1.0.css" />
		
		<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/select2/select2-bootstrap.css"/>
		
		<!-- OpenLayers STYLE -->
 		<link rel="stylesheet" href="js/openlayers/theme/default/style.css" type="text/css" />		
 		<link rel="stylesheet" href="js/openlayers/ole/theme/geosilk/geosilk.css" type="text/css" />
 		<link rel="stylesheet" href="js/openlayers/theme/default/swipe.css" type="text/css" />
		
		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

		<!-- #GOOGLE FONT -->
		<!-- 
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
		-->

		<!-- #APP SCREEN / ICONS -->
		<!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
		<link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
		
		<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
		<!-- Startup image for web apps -->
		<link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
		<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/tokenize/jquery.tokenize.css">

	</head>

	<!--

	TABLE OF CONTENTS.
	
	Use search to find needed section.
	
	===================================================================
	
	|  01. #CSS Links                |  all CSS links and file paths  |
	|  02. #FAVICONS                 |  Favicon links and file paths  |
	|  03. #GOOGLE FONT              |  Google font link              |
	|  04. #APP SCREEN / ICONS       |  app icons, screen backdrops   |
	|  05. #BODY                     |  body tag                      |
	|  06. #HEADER                   |  header tag                    |
	|  07. #PROJECTS                 |  project lists                 |
	|  08. #TOGGLE LAYOUT BUTTONS    |  layout buttons and actions    |
	|  09. #MOBILE                   |  mobile view dropdown          |
	|  10. #SEARCH                   |  search field                  |
	|  11. #NAVIGATION               |  left panel & navigation       |
	|  12. #MAIN PANEL               |  main panel                    |
	|  13. #MAIN CONTENT             |  content holder                |
	|  14. #PAGE FOOTER              |  page footer                   |
	|  15. #SHORTCUT AREA            |  dropdown shortcuts area       |
	|  16. #PLUGINS                  |  all scripts and plugins       |
	
	===================================================================
	
	-->
	
	<!-- #BODY -->
	<!-- Possible Classes

		* 'smart-skin-{SKIN#}'
		* 'smart-rtl'         - Switch theme mode to RTL (will be avilable from version SmartAdmin 1.5)
		* 'menu-on-top'       - Switch to top navigation (no DOM change required)
		* 'hidden-menu'       - Hides the main menu but still accessable by hovering over left edge
		* 'fixed-header'      - Fixes the header
		* 'fixed-navigation'  - Fixes the main menu
		* 'fixed-ribbon'      - Fixes breadcrumb
		* 'fixed-footer'      - Fixes footer
		* 'container'         - boxed layout mode (non-responsive: will not work with fixed-navigation & fixed-ribbon)
	-->
	<body class="">
		<script src="js/libs/jquery-2.0.2.min.js"></script>
		
		<!-- start: Header -->
		<s:include value="header.jsp"></s:include>			
		<!-- end: Header -->

		<!-- #NAVIGATION -->
		<!-- Left panel : Navigation area -->
		<!-- Note: This width of the aside area can be adjusted through LESS variables -->
		<aside id="left-panel">
			<!-- User info -->
			<div class="login-info">
				<span> <!-- User image size is adjusted inside CSS, it should stay as it --> 
					
					<a href="javascript:void(0);" id="show-shortcut">
						<img src="img/avatars/male.png" alt="me" class="online" /> 
						<span>
							<s:property value="user.user.username"/>
						</span>
						<i class="fa fa-angle-down"></i>
					</a> 
					
				</span>
			</div>
			<!-- end user info -->

			<!-- NAVIGATION : This navigation is also responsive

			To make this navigation dynamic please make sure to link the node
			(the reference to the nav > ul) after page load. Or the navigation
			will not initialize.
			-->
			<jsp:include page="menu/menu.jsp"></jsp:include>
			
			<span class="minifyme" data-action="minifyMenu"> <i class="fa fa-arrow-circle-left hit"></i> </span>
			

		</aside>
		<!-- END NAVIGATION -->

		<!-- #MAIN PANEL -->
		<div id="main" role="main">

			<!-- RIBBON -->
			<div id="ribbon">

				<span class="ribbon-button-alignment"> 
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh" rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true" data-reset-msg="Would you like to RESET all your saved widgets and clear LocalStorage?"><i class="fa fa-refresh"></i></span> 
				</span>
				

				<!-- breadcrumb -->
				<ol class="breadcrumb">
					<!-- This is auto generated -->
				</ol>
				<!-- end breadcrumb -->

				<!-- You can also add more buttons to the
				ribbon for further usability

				Example below:

				<span class="ribbon-button-alignment pull-right">
				<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
				<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
				<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
				</span> -->

			</div>
			<!-- END RIBBON -->

			<!-- #MAIN CONTENT -->
			<div id="content">

			</div>
			
			<!-- END #MAIN CONTENT -->

		</div>
		<!-- END #MAIN PANEL -->

		<!-- #PAGE FOOTER -->
		<div class="page-footer">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 text-center">
					<span class="txt-color-white"><s:text name="home.page.copyright"/></span>
				</div>

<!-- 				<div class="col-xs-6 col-sm-6 text-right hidden-xs"> -->
<!-- 					<div class="txt-color-white inline-block"> -->
<%-- 						<i class="txt-color-blueLight hidden-mobile">Last account activity <i class="fa fa-clock-o"></i> <strong>52 mins ago &nbsp;</strong> </i> --%>
<!-- 						<div class="btn-group dropup"> -->
<!-- 							<button class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white" data-toggle="dropdown"> -->
<%-- 								<i class="fa fa-link"></i> <span class="caret"></span> --%>
<!-- 							</button> -->
<!-- 							<ul class="dropdown-menu pull-right text-left"> -->
<!-- 								<li> -->
<!-- 									<div class="padding-5"> -->
<!-- 										<p class="txt-color-darken font-sm no-margin">Download Progress</p> -->
<!-- 										<div class="progress progress-micro no-margin"> -->
<!-- 											<div class="progress-bar progress-bar-success" style="width: 50%;"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</li> -->
<!-- 								<li class="divider"></li> -->
<!-- 								<li> -->
<!-- 									<div class="padding-5"> -->
<!-- 										<p class="txt-color-darken font-sm no-margin">Server Load</p> -->
<!-- 										<div class="progress progress-micro no-margin"> -->
<!-- 											<div class="progress-bar progress-bar-success" style="width: 20%;"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</li> -->
<!-- 								<li class="divider"></li> -->
<!-- 								<li > -->
<!-- 									<div class="padding-5"> -->
<%-- 										<p class="txt-color-darken font-sm no-margin">Memory Load <span class="text-danger">*critical*</span></p> --%>
<!-- 										<div class="progress progress-micro no-margin"> -->
<!-- 											<div class="progress-bar progress-bar-danger" style="width: 70%;"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</li> -->
<!-- 								<li class="divider"></li> -->
<!-- 								<li> -->
<!-- 									<div class="padding-5"> -->
<!-- 										<button class="btn btn-block btn-default">refresh</button> -->
<!-- 									</div> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						end btn-group -->
<!-- 					</div> -->
<!-- 					end div -->
<!-- 				</div> -->
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- END FOOTER -->

		<!-- #SHORTCUT AREA : With large tiles (activated via clicking user name tag)
			 Note: These tiles are completely responsive, you can add as many as you like -->
		<div id="shortcut">
			<ul>
				<li>
					<a href="#ajax/inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail <span class="label pull-right bg-color-darken">14</span></span> </span> </a>
				</li>
				<li>
					<a href="#ajax/calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
				</li>
				<li>
					<a href="#ajax/gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
				</li>
				<li>
					<a href="#ajax/invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
				</li>
				<li>
					<a href="#ajax/gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
				</li>
				<li>
					<a href="#ajax/profile.html" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
				</li>
			</ul>
		</div>
		<!-- END SHORTCUT AREA -->

		<!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>-->
		
		<!-- #PLUGINS -->
		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		
		<script src="js/libs/jquery-ui-1.10.3.min.js"></script>
		
    	<script type="text/javascript" src="js/libs/i18n/grid.locale-en.js"></script>
    	<script type="text/javascript" src="js/libs/i18n/grid.locale-sq.js"></script>
    	
<%--     	<script type="text/javascript" src="js/libs/i18n/grid.locale-al.js"></script> --%>
<%--  		<script type="text/javascript" src='<s:text name="gridLangScript"/>'></script> --%>
    	<script type="text/javascript" src="js/libs/jquery.jqGrid.min.js"></script>
    	<script type="text/javascript" src="js/libs/jquery.jqGrid.dynamicLink.js"></script>
		<script type="text/javascript">
			$.jgrid.no_legacy_api = true;
			$.jgrid.useJSON = true;
		</script>
		<script type="text/javascript" src="js/libs/jquery.bb.custom.js"></script>
		<script type="text/javascript" src="js/plugin/jqgrid/jquery.contextmenu.js"></script>
		<script type="text/javascript" src="js/plugin/jquery-datetimepicker/jquery.datetimepicker.js"></script>
		<script type="text/javascript" src="js/plugin/jquery-form/jquery-form.min.js"></script>
		<script type="text/javascript" src="js/libs/custom/jquery.combo.custom-1.0.js"></script>
		<script type="text/javascript" src="js/libs/jquery.dialogextend.1_0_1.js"></script>
		<script type="text/javascript" src="js/libs/jquery.binarytransport.js"></script>
		
		
		
		<link href="css/jquery.splitter.css" rel="stylesheet"/>
 		<script src="js/plugin/jquery-splitter/jquery.splitter-0.14.0.js"></script>
 		
		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
		<script src="js/bootstrap/bootstrap-multiselect.js" type="text/javascript"></script>
		
		<!-- BOOTSTRAP JS -->
		<script type="text/javascript" src="js/bootstrap/fileinput.min.js"></script>
		<script type="text/javascript" src="js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/ladda/spin.min.js"></script> 
		<script type="text/javascript" src="js/ladda/ladda.min.js"></script>		


		<script src="js/libs/autoNumeric.js" type="text/javascript"></script>
		
		<!-- CUSTOM NOTIFICATION -->
		<script src="js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices: you can disable this in app.js -->
		<script src="js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
		<![endif]-->

		<!-- OpenLayers core Java script -->
		<script src="js/openlayers/OpenLayers.js"></script>
		<!-- OpenStreetMap base layer Java script -->
		<script src="js/openlayers/OpenStreetMap.js"></script>
		<!-- Projection for Java script -->
		<script src="js/proj4js/proj4js-combined.js"></script>
		<script src="js/proj4js/EPSG900916.js"></script> 
		<script src="js/maps/forestmap.js"></script>
		<script src="js/maps/featurestyles.js"></script>
	
			
		<!-- Google Maps -->
		<!-- 
		<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
		 -->
		 
		<!--OLE Editor-->
		<script  src="js/openlayers/ole/lib/Editor/Lang/en.js"></script>
		<script  src="js/openlayers/ole/lib/loader.js"></script>
		<script  src="js/openlayers/lib/OpenLayers/Control/Swipe.js"></script>
		<script  src="js/openlayers/lib/OpenLayers/Control/OpenLayers.Control.Swipe.prototype.clipFirstLayer.js"></script>
		<!-- 
		<script  src="http://gis.ibbeck.de/ginfo/apps/OLExamples/OL212/SwipeControl/swipe/OpenLayers.Control.Swipe.prototype.clipFirstLayer.js"></script>
		-->
		<script  src="js/openlayers/lib/OpenLayers/Control/DynamicMeasure.js"></script>
		
		<script  src="js/openlayers/ole/lib/Editor/Lang/en.js"></script>
		<script  src="js/openlayers/ole/lib/loader.js"></script>
		
		<!-- Demo purpose only -->
		<!-- 
		<script src="js/demo.js"></script>
		-->

		<!-- MAIN APP JS FILE -->
		<script src="js/app.min.js"></script>


		<script src="js/chart/highcharts.js"></script>
		<script src="js/chart/modules/exporting.js"></script>
		
		<script type="text/javascript" src="js/plugin/tokenize/jquery.tokenize.js"></script>
		<script type="text/javascript" src="js/plugin/noUiSlider/jquery.nouislider.min.js"></script>
		
		
		<!-- Your GOOGLE ANALYTICS CODE Below -->
		<!-- Global Site Tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-106212977-3"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments)};
		  gtag('js', new Date());
		
		  gtag('config', 'UA-106212977-3');
		</script>
		<script type="text/javascript">
		function characterReplace(string){
			var index=string.indexOf('&euml;');
			if(index !== -1){
		    	var name=string.substring(0, index) + "ë";//+string.substring(index+6);
		    	var sub=string.substring(index+6);
		    	var index2=sub.indexOf('&euml;');
		    	if(index2!==-1){
					name+=characterReplace(sub);
			    }else {
					name+=sub;
				}
		    	return name;
			}
		    else{
		    	return string;
		    }
		};
		$(document).ready(function () {
			var appLang='<s:property value="locale.getLanguage()"/>';
			if(appLang=='al'){
			$.jgrid = $.jgrid || {};
			if(!$.jgrid.hasOwnProperty("regional")) {
				$.jgrid.regional = [];
			}
			$.jgrid.regional["en"] = {
				defaults : {
					recordtext: "Shfaq {0} - {1}/{2}",
					emptyrecords: "Nuk ka rreshta për të shfaqur",
					loadtext: "Duke u ngarkuar...",
					savetext: "Duke ruajtur...",
					pgtext : "Faqja {0}/{1}",
					pgfirst : "Faqja e parë",
					pglast : "Faqja e fundit",
					pgnext : "Faqja tjetër",
					pgprev : "Faqja mëparshme",
					pgrecs : "Rreshta për faqe",
					showhide: "Shpalos ose mbyll tabelën",
					// mobile
					pagerCaption : "Tabela::Kruskoti i faqes",
					pageText : "Faqja:",
					recordPage : "Rreshta për faqe",
					nomorerecs : "Nuk ka rreshta të tjerë...",
					scrollPullup: "Tërhiq për lart për të tjerë...",
					scrollPulldown : "Tërqiq për poshtë për rifreskim...",
					scrollRefresh : "Lësho për rifreskim..."
				},
				search : {
					caption: "Kërko...",
					Find: "Gjej",
					Reset: "Pastro",
					odata: [{ oper:'eq', text:'baraz'},{ oper:'ne', text:'jo baraz'},{ oper:'lt', text:'me e vogel'},{ oper:'le', text:'me e vogel ose baraz'},{ oper:'gt', text:'me e madhe'},{ oper:'ge', text:'me e madhe ose baraz'},{ oper:'bw', text:'fillon me'},{ oper:'bn', text:'nuk fillon me'},{ oper:'in', text:'brenda'},{ oper:'ni', text:'jo brenda'},{ oper:'ew', text:'mbaron me'},{ oper:'en', text:'nuk mbaron me'},{ oper:'cn', text:'permban'},{ oper:'nc', text:'nuk permban'},{ oper:'nu', text:'eshte bosh'},{ oper:'nn', text:'nuk eshte bosh'}, {oper:'bt', text:'between'}],
					groupOps: [{ op: "AND", text: "te gjithe" },{ op: "OR",  text: "cfaredo" }],
					operandTitle : "Kliko per te zgjedhur veprimin.",
					resetTitle : "Fshi vlerat e kerkimit",
					addsubgrup : "Add subgroup",
					addrule : "Add rule",
					delgroup : "Delete group",
					delrule : "Delete rule"

				},
				edit : {
					addCaption: "Shto rresht",
					editCaption: "Fshi rresht",
					bSubmit: "Vendos",
					bCancel: "Anullo",
					bClose: "Mbyll",
					saveData: "Te dhenat jane ndryshuar! Deshironi ti ruani ndryshimet?",
					bYes : "Po",
					bNo : "Jo",
					bExit : "Anullo",
					msg: {
						required:"Kjo fushe eshte e detyrueshme",
						number:"Ju lutem, vendosni nje numer te vlefshem",
						minValue:"vlera duhet te jete me e madhe ose e njejte me ",
						maxValue:"vlera duhet te jete me e vogel ose e njejte me",
						email: "nuk eshte adrese poste elektronike e vlefshme",
						integer: "Ju lutem, vendosni nje numer te plote te vlefshem",
						date: "Ju lutem, vendosni nje date te vlefshme",
						url: "nuk eshte URL e vlefshme. Nevojitet prefiksi ('http://' ose 'https://')",
						nodefined : " nuk eshte percaktuar!",
						novalue : " vlera si pergjigje eshte e detyreshme!",
						customarray : "Funksioni i personalizuar duhet te ktheje nje array!",
						customfcheck : "unksioni i personalizuar duhet te egzistoje ne rast kontrolli te personalizuar!"
						
					}
				},
				view : {
					caption: "Shfaq Rreshtin",
					bClose: "Mbyll"
				},
				del : {
					caption: "Fshi",
					msg: "Deshironi te fshini rreshtin/rreshtat e zgjedhur?",
					bSubmit: "Fshi",
					bCancel: "Anullo"
				},
				nav : {
					edittext: "",
					edittitle: "Modifiko rreshtin e zgjedhur",
					addtext:"",
					addtitle: "Shto rresht te ri",
					deltext: "",
					deltitle: "Fshi rreshtin e zgjedhur",
					searchtext: "",
					searchtitle: "Gjej rreshtat",
					refreshtext: "",
					refreshtitle: "Ringarko listen",
					alertcap: "Paralajmerim",
					alerttext: "Ju lutem, zgjidh nje rresht",
					viewtext: "",
					viewtitle: "Shfaq rreshtin e zgjedhur",
					savetext: "",
					savetitle: "Ruaj rreshtin",
					canceltext: "",
					canceltitle : "Anullo modifikim rreshti",
					selectcaption : "Veprime..."
				},
				col : {
					caption: "Zgjidh kolona",
					bSubmit: "Ok",
					bCancel: "Anullo"
				},
				errors : {
					errcap : "Gabim",
					nourl : "Nuk eshte percaktuar asnje URL",
					norecords: "Nuk ka rreshta per perpunim",
					model : "Gjatesia e emrit te kolones <> modeli i kolones!"
				},
				formatter : {
					integer : {thousandsSeparator: ",", defaultValue: '0'},
					number : {decimalSeparator:".", thousandsSeparator: ",", decimalPlaces: 2, defaultValue: '0.00'},
					currency : {decimalSeparator:".", thousandsSeparator: ",", decimalPlaces: 2, prefix: "", suffix:"", defaultValue: '0.00'},
					date : {
						dayNames:   [
							"Dje", "Hën", "Mar", "Mër", "Enj", "Pre", "Sht",
							"Djelë", "Hënë", "Martë", "Mërkurë", "Enjte", "Premte", "Shtunë"
						],
						monthNames: [
							"Jan", "Shk", "Mar", "Pri", "Maj", "Qer", "Kor", "Gus", "Sht", "Tet", "Nën", "Dhj",
							"Janar", "Shkurt", "Mars", "Prill", "Maj", "Qershor", "Korrik", "Gusht", "Shtator", "Tetor", "Nëntor", "Dhjetor"
						],
						AmPm : ["am","pm","AM","PM"],
						S: function (j) {return j < 11 || j > 13 ? ['st', 'nd', 'rd', 'th'][Math.min((j - 1) % 10, 3)] : 'th';},
						srcformat: 'Y-m-d',
						newformat: 'n/j/Y',
						parseRe : /[#%\\\/:_;.,\t\s-]/,
						masks : {
							// see http://php.net/manual/en/function.date.php for PHP format used in jqGrid
							// and see http://docs.jquery.com/UI/Datepicker/formatDate
							// and https://github.com/jquery/globalize#dates for alternative formats used frequently
							// one can find on https://github.com/jquery/globalize/tree/master/lib/cultures many
							// information about date, time, numbers and currency formats used in different countries
							// one should just convert the information in PHP format
							ISO8601Long:"Y-m-d H:i:s",
							ISO8601Short:"Y-m-d",
							// short date:
							//    n - Numeric representation of a month, without leading zeros
							//    j - Day of the month without leading zeros
							//    Y - A full numeric representation of a year, 4 digits
							// example: 3/1/2012 which means 1 March 2012
							ShortDate: "n/j/Y", // in jQuery UI Datepicker: "M/d/yyyy"
							// long date:
							//    l - A full textual representation of the day of the week
							//    F - A full textual representation of a month
							//    d - Day of the month, 2 digits with leading zeros
							//    Y - A full numeric representation of a year, 4 digits
							LongDate: "l, F d, Y", // in jQuery UI Datepicker: "dddd, MMMM dd, yyyy"
							// long date with long time:
							//    l - A full textual representation of the day of the week
							//    F - A full textual representation of a month
							//    d - Day of the month, 2 digits with leading zeros
							//    Y - A full numeric representation of a year, 4 digits
							//    g - 12-hour format of an hour without leading zeros
							//    i - Minutes with leading zeros
							//    s - Seconds, with leading zeros
							//    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
							FullDateTime: "l, F d, Y g:i:s A", // in jQuery UI Datepicker: "dddd, MMMM dd, yyyy h:mm:ss tt"
							// month day:
							//    F - A full textual representation of a month
							//    d - Day of the month, 2 digits with leading zeros
							MonthDay: "F d", // in jQuery UI Datepicker: "MMMM dd"
							// short time (without seconds)
							//    g - 12-hour format of an hour without leading zeros
							//    i - Minutes with leading zeros
							//    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
							ShortTime: "g:i A", // in jQuery UI Datepicker: "h:mm tt"
							// long time (with seconds)
							//    g - 12-hour format of an hour without leading zeros
							//    i - Minutes with leading zeros
							//    s - Seconds, with leading zeros
							//    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
							LongTime: "g:i:s A", // in jQuery UI Datepicker: "h:mm:ss tt"
							SortableDateTime: "Y-m-d\\TH:i:s",
							UniversalSortableDateTime: "Y-m-d H:i:sO",
							// month with year
							//    Y - A full numeric representation of a year, 4 digits
							//    F - A full textual representation of a month
							YearMonth: "F, Y" // in jQuery UI Datepicker: "MMMM, yyyy"
						},
						reformatAfterEdit : false,
						userLocalTime : false
					},
					baseLinkUrl: '',
					showAction: '',
					target: '',
					checkbox : {disabled:true},
					idName : 'id'
				},
				colmenu : {
					sortasc : "Sort Ascending",
					sortdesc : "Sort Descending",
					columns : "Columns",
					filter : "Filter",
					grouping : "Group By",
					ungrouping : "Ungroup",
					searchTitle : "Get items with value that:",
					freeze : "Freeze",
					unfreeze : "Unfreeze",
					reorder : "Move to reorder"
				}
			};
			}
		});


		</script>
	</body>

</html>