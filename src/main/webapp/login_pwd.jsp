<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="module/base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<title> KFIS Login Change</title>
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
		
		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

		<!-- #APP SCREEN / ICONS -->
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

	</head>
	
	<body class="animated fadeInDown">

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
	
		</header>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->
			<div id="content" class="container">

					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
						<div class="well no-padding">
							<form action="PwdSave.do" id="login-pwd-form" class="smart-form client-form" method="post">
								<input type="hidden" name="language" value="<s:property value="language"/>"> 							
								<header style="background-color:rgb(169,3,41);color:white">
									<s:text name="login.password.change"/>
								</header>

									<fieldset>
										<section>
											<label class="label"><s:text name="login.form.user.email" /></label>
											<label class="input"> <i class="icon-append fa fa-user"></i>
												<input type="text" readonly="readonly" name="username" placeholder="Username" value="<s:property value="kuser.username"/>">
												<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i><s:text name="login.tooltip.user.email" /></b></label>
										</section>
										<section>
											<s:if test="fieldErrors.get('pwdold') != null">
											<label class="label state-error"><s:text name="login.form.old.password" /></label>
											<label class="input state-error"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdold" placeholder="<s:text name="login.tooltip.old.password" />">
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i>&nbsp;<s:text name="login.tooltip.old.password" /></b> </label>
											</s:if>
											<s:else>
											<label class="label"><s:text name="login.form.old.password" /></label>
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdold" placeholder="">
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i>&nbsp;<s:text name="login.tooltip.old.password" /></b></label>
											</s:else>
										</section>
										<section>
											<s:if test="fieldErrors.get('pwdnew') != null">
											<label class="label state-error"><s:text name="login.form.new.password" /></label>
											<label class="input state-error"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdnew" placeholder="<s:text name="login.tooltip.new.password" />">
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i><s:text name="login.tooltip.new.password" /></b> </label>
											</s:if>
											<s:else>
											<label class="label"><s:text name="login.form.new.password" /></label>
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdnew" placeholder="">
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i><s:text name="login.tooltip.new.password" /></b> </label>
											</s:else>											
										</section>
										<section>
											<s:if test="fieldErrors.get('pwdnew') != null">
											<label class="label state-error"><s:text name="login.form.retype.new.password" /></label>
											<label class="input state-error"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdnewrepeat" placeholder="<s:text name="login.tooltip.retype.new.password" />">
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i><s:text name="login.tooltip.retype.new.password" /></b> </label>
											</s:if>
											<s:else>
											<label class="label"><s:text name="login.form.retype.new.password" /></label>
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdnewrepeat">
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i><s:text name="login.tooltip.retype.new.password" /></b> </label>

											</s:else>		
																												
										</section>
	
										<section>
											<label class="checkbox">
												<input type="checkbox" name="remember" checked="">
												<i></i><s:text name="login.form.stay.sign" /></label>
										</section>
										<section>
										<div id="messages"></div>
										</section>
										
									</fieldset>
									
									<footer>
										<button type="submit" class="btn btn-primary">
											<s:text name="login.form.button.save.sign" />
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

	    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script> if (!window.jQuery) { document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');} </script>

	    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script> if (!window.jQuery.ui) { document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');} </script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="js/bootstrap/bootstrap.min.js"></script>
		<script src="js/bootstrap/pwstrength-bootstrap-1.2.2.js"></script>	

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
	        jQuery(document).ready(function () {
	        	"use strict";
	            var options = {};
	            options.ui = {
	                    showPopover: false,
	                    showErrors: true,
	                    showProgressBar: true,
	                    showVerdictsInsideProgressBar: true
	            };
	            options.rules = {
	                    activated: {
	                        wordTwoCharacterClasses: true,
	                        wordRepetitions: true,
	                        wordNotEmail: true,
	                        wordLength: true,
	                        wordSimilarToUsername: true,
	                        wordLowercase: true,
	                        wordUppercase: true,
	                        wordOneNumber: true,
	                        wordThreeNumbers: true,
	                        wordOneSpecialChar: true,
	                        wordTwoSpecialChar: true,
	                        wordUpperLowerCombo: true,
	                        wordLetterNumberCombo: true,
	                        wordLetterNumberCharCombo: true	                        
	                    }
	            };
	            options.common = {
		            	container: "#pwd-container",
		           		usernameField: "#username",
		           		minChar: 8,    	            
	                    onLoad: function () {
	                        $('#messages').text('Start typing password');
	                    },
	                    onKeyUp: function (evt, data) {
	                        $("#messages").text("Current length: " + $(evt.target).val().length + " and score: " + data.score);
	                    }	                                       
	                    
	                };                	            	            
	            $(':password').pwstrength(options);
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
							maxlength : 20
						}
					},

					// Messages for form validation
					messages : {
						email : {
							required : '<s:text name="login.tooltip.user.email" />',
							email : '<s:text name="login.tooltip.user.email" />'
						},
						password : {
							required : '<s:text name="login.tooltip.password" />'
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