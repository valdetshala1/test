<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="module/base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<title>KFIS</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
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
		
		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

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
		<!--
		1) bg-modern-living.jpg
		2) bg-bubbles-wallpaper.jpg
		3) bg-gradient-large.jpg
		 -->
<style>
.col-xs-12{
	width:30% !important;
}
	.header-shadow {
		/*background-image: url('img/background/forest-desktop.jpg');*/
		min-height: 100%;
		min-width: 1024px;
		background-size: 100% 100%;
   		background-repeat: no-repeat;
		/* Set up positioning */
		position: fixed;
		top: 0;
		left: 0;
		min-width: 1024px;
		/* Set up proportionate scaling */
		width: 100%;
		height: auto;
		/* Set up positioning */
		position: fixed;
		top: 0;
	}
</style>

</head>
	
<body class="animated fadeInDown header-shadow">
 
		<header id="header">

			<div id="logo-group">
			
				<div id="logo">
					<img border="0" src="img/kosova_logo_2.png" alt="KFIS"/>
				</div>			
				<div id="title">
					<p>
					<span style="font-size: 13px;"><s:text name="menu.header.title.mafrd"/></span><br />
					<span style="font-size: 12px;"><s:text name="menu.header.title.apk"/></span><br/>					
					<span style="font-size: 11px;"><s:text name="menu.header.title.kfis"/></span><br />
					</p>
				</div>
			</div>	
			
			<div class="pull-right">

				<!-- multiple lang dropdown : find all flags in the flags page -->
				<ul class="header-dropdown-list hidden-xs">
					<li>
	
						<s:if test="%{locale.toString() == 'al_AL'}">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="img/flags/sq.gif"> <span> <s:text name="menu.header.lang.sq" /></span> <i class="fa fa-angle-down"></i> </a>
						</s:if>
						<s:elseif test="%{locale.toString() == 'en_EN'}">	
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="img/flags/us.png"> <span> <s:text name="menu.header.lang.en" /></span> <i class="fa fa-angle-down"></i> </a>
						</s:elseif>
						<s:elseif test="%{locale.toString() == 'sr_SR'}">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="img/flags/srb.png"> <span> <s:text name="menu.header.lang.sr" /></span> <i class="fa fa-angle-down"></i> </a>								
						</s:elseif>
						
						<ul id="lang_buttons" class="dropdown-menu pull-right">
							<s:if test="%{locale.toString() == 'al_AL'}">
							<li  class="active">
								<a href="#" id="Language.do?request_locale=al&language=al"><img alt="" src="img/flags/sq.gif"> <span> <s:text name="menu.header.lang.sq" /></span></a>
							</li>						
							<li>
								<a href="#" id="Language.do?request_locale=en&language=en"><img alt="" src="img/flags/us.png"> <span> <s:text name="menu.header.lang.en" /></span></a>
							</li>
							<li>
								<a href="#" id="Language.do?request_locale=sr&language=sr"><img alt="" src="img/flags/srb.png"> <span> <s:text name="menu.header.lang.sr" /></span></a>
							</li>
							</s:if>
							<s:elseif test="%{locale.toString() == 'en_EN'}">	
							<li>
								<a href="#" id="Language.do?request_locale=al&language=al"><img alt="" src="img/flags/sq.gif"> <span> <s:text name="menu.header.lang.sq" /></span></a>
							</li>						
							<li class="active">
								<a href="#" id="Language.do?request_locale=en&language=en"><img alt="" src="img/flags/us.png"> <span> <s:text name="menu.header.lang.en" /></span></a>
							</li>
							<li>
								<a href="#" id="Language.do?request_locale=sr&language=sr"><img alt="" src="img/flags/srb.png"> <span> <s:text name="menu.header.lang.sr" /></span></a>
							</li>
							</s:elseif>
							<s:elseif test="%{locale.toString() == 'sr_SR'}">		
							<li>
								<a href="#" id="Language.do?request_locale=al&language=al"><img alt="" src="img/flags/sq.gif"> <span> <s:text name="menu.header.lang.sq" /></span></a>
							</li>						
							<li>
								<a href="#" id="Language.do?request_locale=en&language=en"><img alt="" src="img/flags/us.png"> <span> <s:text name="menu.header.lang.en" /></span></a>
							</li>
							<li class="active">
								<a href="#" id="Language.do?request_locale=sr&language=sr"><img alt="" src="img/flags/srb.png"> <span> <s:text name="menu.header.lang.sr" /></span></a>
							</li>																			
							</s:elseif>
							<s:else>
							<li  class="active">
								<a href="#" id="Language.do?request_locale=al&language=al"><img alt="" src="img/flags/sq.gif"> <span> <s:text name="menu.header.lang.sq" /></span></a>
							</li>						
							<li>
								<a href="#" id="Language.do?request_locale=en&language=en"><img alt="" src="img/flags/us.png"> <span> <s:text name="menu.header.lang.en" /></span></a>
							</li>
							<li>
								<a href="#" id="Language.do?request_locale=sr&language=sr"><img alt="" src="img/flags/srb.png"> <span> <s:text name="menu.header.lang.sr" /></span></a>
							</li>							
							</s:else>														
						</ul>
					</li>
				</ul>
				<!-- end multiple lang -->			
			
			</div>
			
		</header>

		<div id="main" role="main">

			<!-- MAIN CONTENT border-style: double; max-width: 450px;-->
			<div id="content" class="container" style="">

					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
						<div class="well no-padding">

								<form action="Login.do" id="login-form" class="smart-form client-form" method="post">
									<header style="background-color:rgb(169,3,41);color:white">
										<b><s:text name="login.form.signin" /></b>
									</header>
									<fieldset>
										<section>
										<s:if test="fieldErrors.get('username') != null">
											<label class="label state-error"><s:text name="login.form.user.email" /></label>
											<label class="input state-error"> <i class="icon-append fa fa-user"></i>
												<input type="text" name="username" placeholder="<s:text name="login.form.user.email" />" >
												<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('username')" /> </span>												
												<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i><s:text name="login.tooltip.user.email" /></b></label>
										</s:if>
										<s:else>
											<label class="label"><s:text name="login.form.user.email" /></label>
											<label class="input"> <i class="icon-append fa fa-user"></i>
												<input type="text" name="username" value="<s:property value="username"/>" placeholder="<s:text name="login.form.user.email" />" >
												<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i><s:text name="login.tooltip.user.email" /></b></label>
										
										</s:else>		
										</section>
	
										<section>
										<s:if test="fieldErrors.get('password') != null">
											<label class="label state-error"><s:text name="login.form.password" /></label>
											<label class="input state-error"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="password" placeholder="<s:text name="login.tooltip.password" />">
												<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('password')" /> </span>
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i><s:text name="login.tooltip.password" /></b> </label>
										</s:if>
										<s:else>
											<label class="label"><s:text name="login.form.password" /></label>
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="password" placeholder="<s:text name="login.tooltip.password" />">
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i><s:text name="login.tooltip.password" /></b> </label>

										</s:else>											
										</section>
										<!-- 
										<section>
											<label class="checkbox">
												<input type="checkbox" name="remember" checked="">
												<i></i><s:text name="login.form.stay.sign" /></label>
										</section>
										-->
									</fieldset>
									<footer>
										<button type="submit" class="btn btn-primary">
											<s:text name="login.form.button.sign" />
										</button>
									</footer>
								</form>

						</div>

					</div>
				</div>
		</div>


		<!--================================================== -->	

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script src="js/plugin/pace/pace.min.js"></script>

		<script src="js/libs/jquery-2.0.2.min.js"></script>


		<!-- BOOTSTRAP JS -->		
		<script src="js/bootstrap/bootstrap.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>
		
		<!-- JQUERY MASKED INPUT -->
		<script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>
		
		<!--[if IE 8]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->

		<!-- MAIN APP JS FILE -->
		<script src="js/app.min.js"></script>

		<script type="text/javascript">
			runAllForms();
			$(document).ready(function () {
			 	$("#login-form [name='username']").focus();  

			 	$("#lang_buttons li a").click(function(event) {
					event.preventDefault();
					var url=this.id;
					if(url){
						$.ajax({
							type : "POST",
							url : url,
							async : false,
							beforeSend : function(jqXHR, settings) {
							},
							error : function(errorThrown, status, jqXHR) { // on error..
							},
							success : function(data, status, jqXHR) { // on success..
								localStorage.clear();//clear local storage and reset widgets
								location.reload();//reload page 
								
							},
							complete : function(jqXHR, textStatus) {
							}
						});
					}
						return false;
				});   
			});
			
			$(function() {
				
				// Validation
				$("#login-form").validate({
					// Rules for form validation
					rules : {
						email : {
							required : true,
							email : true
						},
						password : {
							required : true,
							minlength : 6,
							maxlength : 100
						}
					},

					// Messages for form validation
					messages : {
						email : {
							required : '<s:text name="login.validate.enter.username"/>',
							email : 'Please enter a VALID email address'
						},
						password : {
							required : '<s:text name="login.validate.enter.password"/>'
						}
					},

					// Do not change code below
					errorPlacement : function(error, element) {
						error.insertAfter(element.parent());
					}
				});
			});
		</script>

	</body>
</html>