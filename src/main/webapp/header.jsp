<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>

		<!-- #HEADER -->
		<header id="header">
		
			<div id="logo-group">
			
				<div id="logo">
					<img border="0" src="img/kosova_logo_2.png"/>
				</div>			
				<div id="title" class="btn-header transparent pull-left">
					<p>
					<span style="font-size: 13px;"><s:text name="menu.header.title.mafrd"/></span><br />
					<span style="font-size: 12px;"><s:text name="menu.header.title.apk"/></span><br/>					
					<span style="font-size: 11px;"><s:text name="menu.header.title.kfis"/></span><br />
					</p>
				</div>

				<!-- Note: The activity badge color changes when clicked and resets the number to 0
					 Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
<%-- 				<span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> 21 </b> </span> --%>

<!-- 				AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
<!-- 				<div class="ajax-dropdown"> -->

<!-- 					the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
<!-- 					<div class="btn-group btn-group-justified" data-toggle="buttons"> -->
<!-- 						<label class="btn btn-default"> -->
<!-- 							<input type="radio" name="activity" id="ajax/notify/mail.html"> -->
<!-- 							Msgs (14) </label> -->
<!-- 						<label class="btn btn-default"> -->
<!-- 							<input type="radio" name="activity" id="ajax/notify/notifications.html"> -->
<!-- 							notify (3) </label> -->
<!-- 						<label class="btn btn-default"> -->
<!-- 							<input type="radio" name="activity" id="ajax/notify/tasks.html"> -->
<!-- 							Tasks (4) </label> -->
<!-- 					</div> -->

<!-- 					notification content -->
<!-- 					<div class="ajax-notifications custom-scroll"> -->

<!-- 						<div class="alert alert-transparent"> -->
<!-- 							<h4>Click a button to show messages here</h4> -->
<!-- 							This blank page message helps protect your privacy, or you can show the first message here automatically. -->
<!-- 						</div> -->

<!-- 						<i class="fa fa-lock fa-4x fa-border"></i> -->

<!-- 					</div> -->
<!-- 					end notification content -->

<!-- 					footer: refresh area -->
<%-- 					<span> Last updated on: 12/12/2013 9:43AM --%>
<%-- 						<button type="button" data-loading-text="<i class='fa fa-refresh fa-spin'></i> Loading..." class="btn btn-xs btn-default pull-right"> --%>
<!-- 							<i class="fa fa-refresh"></i> -->
<%-- 						</button> </span> --%>
<!-- 					end footer -->

<!-- 				</div> -->
				<!-- END AJAX-DROPDOWN -->				

			</div>

			<!-- #PROJECTS: projects dropdown -->
<!-- 			<div class="project-context hidden-xs"> -->

<%-- 				<span class="label">Projects:</span> --%>
<%-- 				<span class="project-selector dropdown-toggle" data-toggle="dropdown">Recent projects <i class="fa fa-angle-down"></i></span> --%>

<!-- 				Suggestion: populate this list with fetch and push technique -->
<!-- 				<ul class="dropdown-menu"> -->
<!-- 					<li> -->
<!-- 						<a href="javascript:void(0);">Online e-merchant management system - attaching integration with the iOS</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="javascript:void(0);">Notes on pipeline upgradee</a> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<a href="javascript:void(0);">Assesment Report for merchant account</a> -->
<!-- 					</li> -->
<!-- 					<li class="divider"></li> -->
<!-- 					<li> -->
<!-- 						<a href="javascript:void(0);"><i class="fa fa-power-off"></i> Clear</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 				end dropdown-menu -->

<!-- 			</div> -->
			<!-- end projects dropdown -->
			
			<!-- #TOGGLE LAYOUT BUTTONS -->
			<!-- pulled right: nav area -->
			<div class="pull-right">
			
				<!-- logout button -->
				<div id="logout" class="btn-header transparent pull-right">
					<span> <a href="Logout.do" title="<s:text name="menu.header.sign.out" />" data-action="userLogout" data-logout-msg="You can improve your security further after logging out by closing this opened browser" ><i class="fa fa-sign-out"></i></a> </span>
				</div>
				<!-- end logout button -->
				
				<!-- fullscreen button -->
				<div id="fullscreen" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="<s:text name="menu.header.full.screen"/>" ><i class="fa fa-arrows-alt" ></i></a> </span>
				</div>
				<!-- end fullscreen button -->
				
				<!-- change password button -->
				<div id="changePass" class="btn-header transparent pull-right">
					<span><a onclick="openDialogForm('passwordChange','Base.changePassword.do','<s:text name="login.password.change"/>',500,500);return false;" title="<s:text name="menu.header.change.password"/>" ><i class="fa fa-edit"></i></a>   </span>
				
				</div>
				<!-- end change password button -->
				
				<!-- collapse menu button -->
				<div id="hide-menu" class="btn-header pull-right">
					<span> <a href="javascript:void(0);" data-action="toggleMenu" title="<s:text name="menu.header.collapse.menu"/>" ><i class="fa fa-reorder" ></i></a> </span>
				</div>
				<!-- end collapse menu -->
				
				<!-- logout button -->
				<div id="home" class="btn-header transparent pull-right">
					<span> <a href="Welcome.do" title="<s:text name="menu.header.home.page" />"  ><i class="fa fa-home"></i></a> </span>
				</div>
				<!-- end logout button -->
				<!-- multiple lang dropdown : find all flags in the flags page -->
				<ul id="multilang" class="header-dropdown-list hidden-xs">
					<li>
						<s:if test="%{locale.toString() == 'al_AL'}">
						<a href="#"  onclick="navigateToLang('sq')" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="img/flags/sq.gif"> <span> <s:text name="menu.header.lang.sq" /></span> <i class="fa fa-angle-down"></i> </a>
						</s:if>
						<s:elseif test="%{locale.toString() == 'en_EN'}">
						<a href="#"   onclick="navigateToLang('en')" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="img/flags/us.png"> <span> <s:text name="menu.header.lang.en" /></span> <i class="fa fa-angle-down"></i> </a>
						</s:elseif>
						<s:elseif test="%{locale.toString() == 'sr_SR'}">
						<a href="#"  onclick="navigateToLang('sr')"  class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="img/flags/srb.png"> <span> <s:text name="menu.header.lang.sr" /></span> <i class="fa fa-angle-down"></i> </a>								
						</s:elseif>
						
						<ul id="lang_button" class="dropdown-menu pull-right">
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
			<!-- end pulled right: nav area -->
<script type="text/javascript">

jQuery(document).ready(function(){
	function navigateToLang(lng) {
		//$("#annualplan_grid").jqGrid({regional : lng});
	}
	$("#lang_button li a").click(function(event) {
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
</script>
		</header>
		<!-- END HEADER -->
		
