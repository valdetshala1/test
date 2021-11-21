<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="module/base/nocache.jsp"%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">

		<title><s:text name="home.page.title"/></title>

		<!-- #Bootstrap Core CSS -->
		<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">

		<!-- #SLIDER REVOLUTION 4.x CSS SETTINGS -->
		<link rel="stylesheet" type="text/css" href="css/landing-page/extralayers.css" media="screen">
		<link rel="stylesheet" type="text/css" href="css/landing-page/settings.css" media="screen">
		<link rel="stylesheet" type="text/css" href="css/landing-page/style.css" media="screen">
		<link rel="stylesheet" type="text/css" href="css/landing-page/your_main.css" media="screen">

		<!-- #RELATED CSS -->
		<link type="text/css" href="fonts/font-awesome.min.css" rel="stylesheet">
		<link type="text/css" href="css/landing-page/nivo-lightbox.css" rel="stylesheet">
		<link type="text/css" href="css/landing-page/nivo-lightbox-theme/default/default.css" rel="stylesheet">
		<link type="text/css" href="css/landing-page/animate.css" rel="stylesheet">

		<!-- #SMARTADMIN LANDING CSS -->
		<link type="text/css" href="css/landing-page/main.css" rel="stylesheet">
		<link type="text/css" href="css/landing-page/default.css" rel="stylesheet">
		
		

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/landing-page/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
		
		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
		
				
		<!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-geoland.css">	
		
	</head>

	<body data-spy="scroll">
	<div class="top-bar" id="top_bar">
    <div class="container">
      <ul id="main_buttons" class="right-bar-side">
        <li>
        <s:if test="user==null">
			<p><i class="fa fa-lock"></i> <a href="Base.loginPage.do"><s:text name="home.page.login.button"/></a></p>
		</s:if>
		<s:else>
			<p><i class="fa fa-lock"></i> <a href="Login.do"><s:text name="home.page.login.button"/></a></p>
		</s:else>
          	
        </li>
        <li>
        	<a  class="lang_button" href="#" id="Language.do?request_locale=al&language=al"><img alt="" src="img/flags/sq.gif"> </a>
        </li>
        <li>
			<a class="lang_button" href="#" id="Language.do?request_locale=en&language=en"><img alt="" src="img/flags/us.png"> </a>
		</li>
		<li>
			<a class="lang_button" href="#" id="Language.do?request_locale=sr&language=sr"><img alt="" src="img/flags/srb.png"> </a>
		</li>
      </ul>
      
      <!-- multiple lang dropdown : find all flags in the flags page -->
<!-- 				<ul class="header-dropdown-list hidden-xs"> -->
					
<!-- 				</ul> -->
				<!-- end multiple lang -->
    </div>
  </div>

		<div id="undefined-sticky-wrapper" class="sticky-wrapper" style="height: 70px;">
			<header class="sticky" style="">
				<div class="container"> 
				  
				  <!--======= LOGO =========-->
				  <div class="logo"> <a href="#."><img src="img/landing-page/img/apk.png" alt=""></a> </div>
				  <!--======= NAV =========-->
				  <nav> 
					
					<!--======= MENU START =========-->
					<ul class="ownmenu">
				
					  <li style=""><a onclick="goToByScroll(<s:text name="home.page.nav.home"/>.id);return false;" ><s:text name="home.page.nav.home.title"/></a></li>
					  <li style=""><a onclick="goToByScroll(<s:text name="home.page.nav.about"/>.id);return false;" ><s:text name="home.page.nav.about.title"/></a></li>
					  <li style=""><a onclick="goToByScroll(<s:text name="home.page.nav.news"/>.id);return false;" ><s:text name="home.page.nav.news.title"/></a></li>
					  <li style=""><a onclick="goToByScroll(<s:text name="home.page.nav.statistics"/>.id);return false;" ><s:text name="home.page.nav.statistics.title"/></a></li>
					</ul>
					
				  </nav>
				</div>
			</header>
		</div>
		<!-- Section: #ballina -->
		<section id ="<s:text name="home.page.nav.home"/>" class="intro">
				<div class="tp-banner-container">
					<div class="tp-banner" >
						<ul class="sliderin">
							<!-- SLIDE  -->
							<li data-transition="slideleft" data-slotamount="7" data-masterspeed="2000" data-thumb="img/landing-page/img/slider/img1.jpg" data-delay="10000"  data-saveperformance="off"  data-title="">
								<!-- MAIN IMAGE -->
								<img src="img/landing-page/img/slider/dummy.png"  alt="laptopmockup_sliderdy" data-lazyload="img/landing-page/img/slider/img1.jpg" data-bgposition="right top" data-kenburns="on" data-duration="12000" data-ease="Power0.easeInOut" data-bgfit="115" data-bgfitend="100" data-bgpositionend="center bottom">
								<!-- LAYERS -->

							</li>
							<!-- SLIDE  -->
							<li data-transition="zoomin" data-slotamount="7" data-masterspeed="1500" data-thumb="img/landing-page/img/slider/img2.jpg"  data-saveperformance="off"  data-title="">
								<!-- MAIN IMAGE -->
								<img src="img/landing-page/img/slider/dummy.png"  alt="slidebg1" data-lazyload="img/landing-page/img/slider/img2.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
								<!-- LAYERS -->
							</li>
								<li data-transition="zoomin" data-slotamount="7" data-masterspeed="1500" data-thumb="img/landing-page/img/slider/img3.jpg"  data-saveperformance="off"  data-title="">
								<!-- MAIN IMAGE -->
								<img src="img/landing-page/img/slider/dummy.png"  alt="slidebg1" data-lazyload="img/landing-page/img/slider/img3.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
								<!-- LAYERS -->
							</li>
						</ul>
					</div>
				</div>

		</section>
		<!-- /Section: INTRO -->

		<!-- Section: #rrethnesh -->
		<section id="<s:text name="home.page.nav.about"/>" class="home-section">
			<div class="heading-about marginbot-50  ">
				<div class="container ">
					<div class="row">
						<div class="col-lg-8 col-lg-offset-2">

							<div class="section-heading text-center">
								<h2><s:text name="home.page.nav.about.title"/></h2>
							</div>

						</div>
					</div>
				</div>
				
				<div class="container">
					<div class="col-xs-12 col-sm-12 col-md-12 text-center">
						<h2 class="font-about"><s:text name="home.page.apk"/></h2>
						<p><s:text name="home.page.about.apk.content"/></p>
					</div>
					
					<div class="col-xs-12 col-sm-12 col-md-12 ">
						<h2 class="font-about text-center"><s:text name="home.page.apk.resp"/></h2>
						<ul>
							<li><s:text name="home.page.apk.resp1"/></li>
							<li><s:text name="home.page.apk.resp2"/></li>
							<li><s:text name="home.page.apk.resp3"/></li>
							<li><s:text name="home.page.apk.resp4"/></li>
							<li><s:text name="home.page.apk.resp5"/></li>
							<li><s:text name="home.page.apk.resp6"/></li>
							<li><s:text name="home.page.apk.resp7"/></li>
						</ul>
					</div>
		
				</div>
				
		</div>
			
			
		</section>
		<!-- /Section: -->

		<!-- Section: #lajmet -->
		<section id="<s:text name="home.page.nav.news"/>" class="home-section bg-gray">
		<div class="heading-about marginbot-50 text-center ">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-lg-offset-2">

							<div class="section-heading">
								<h2><s:text name="home.page.nav.news.title"/></h2>
							</div>

						</div>
					</div>
				</div>
		</div>
			
			<div class="container">
			<div class="col-xs-12 col-sm-6 col-md-4" id="news_container">
		        <div class="panel panel-success pricing-big">
		            <div class="panel-body no-padding ">
				
						<div class="padding-10">
						
<!-- 							<ul class="nav nav-tabs tabs-pull-left"> -->
<!-- 								<li class="active"> -->
<%-- 									<a href="#a1" data-toggle="tab"><s:text name="home.page.nav.news.title"/></a> --%>
<!-- 								</li> -->
<!-- 							</ul> -->
						
<!-- 							<div class="tab-content padding-top-10"> -->
<!-- 								<div class="tab-pane fade active in" id="a1"> -->
						
									<div class="row" id="news_div">
										<div class="news-body news-message">
											<ul id="news_ul">
										
											</ul>
										</div>
									</div>
									
									<div class="text-center">
										<ul class="pagination pagination-sm">
											<li><a id="loadMore" onclick="getTitles();return false;" class="btn btn-primary" > <s:text name="home.page.more.button"/>  </a></li>
										</ul>
									</div>
						
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>
			</div>	
		
			<div class="col-xs-12 col-sm-8 col-md-8" >
		        <div class="panel panel-success pricing-big" id="news_content_container">
		            <div class="panel-body no-padding ">
					<div class="row">
								<div class="col-md-4" id="main_img">
									
								</div>
								<div class="col-md-8 padding-left-0" style="padding: 20px 20px 20px 0;">
									<div id="newsContent" style="overflow:auto;">
									
									</div>
								</div>
					</div>
					</div>
				</div>
			</div>
			</div>		
		</section>
		<!-- /Section: TEAM -->

		<!-- Section: #FEATURES -->
		<section id="<s:text name="home.page.nav.statistics"/>" class="home-section text-center">

			<div class="heading-about marginbot-50">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-lg-offset-2">

							<div class="section-heading">
								<h2><s:text name="home.page.nav.statistics.title"/></h2>
								<label class="input col col-3">
									<s:text name='annual.plan.year'/>:
								</label>
								<input type="text" name="pvtYear" id="pvtYear" placeholder="<s:text name='annual.plan.year'/>" data-mask="9999">
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="container">
					<!-- NEW WIDGET START -->
						<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget" id="wid-id-6" data-widget-editbutton="false">
								<header>
									<span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
									<h2><s:text name="home.page.stat.harvest"/></h2>

								</header>

								<!-- widget div-->
								<div>
									<div class="smart-form">
												<div class="inline-group">
													<label id="tech" class="radio radio-inline"> 
													<input type="radio" class="radiobox" name="statHarvType" id="techVolume" value="techVolume" checked="checked"/>
														<span><s:text name='frm.harvest.planning.pl.tech.volume'/></span>
													</label>
													<label id="fire" class="radio radio-inline"> <input type="radio"
														class="radiobox" name="statHarvType" id="fireVolume" value="fireVolume"/>
														<span><s:text name='frm.harvest.planning.pl.fire.volume'/></span>
													</label>
													<label id="pulp" class="radio radio-inline"> <input type="radio"
														class="radiobox" name="statHarvType" id="pulpVolume" value="pulpVolume" />
														<span><s:text name='frm.harvest.planning.pl.pulp.volume'/></span>
													</label>
													<label>
													<i><img src='img/status/stat_plan.png'/></i>  <s:text name='home.page.nav.harv.plan'/>
													</label>
												     <label >
													<i><img src='img/status/stat_impl.png'/></i> <s:text name='home.page.nav.harv.imp'/>
													</label>
												</div>
									</div>

									<!-- widget content -->
									<div class="padding-10">
										<div id="harv-bar-chart" class="chart"></div>
									</div>
									<!-- end widget content -->

								</div>
								<!-- end widget div -->

							</div>
							<!-- end widget -->

						</article>
						<!-- NEW WIDGET START -->
						<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget" id="wid-id-4" data-widget-editbutton="false">
								<header>
									<span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
									<h2><s:text name='annual.plan.private.menu'/></h2>
								</header>

								<!-- widget div-->
								<div>

									<div class="widget-body-toolbar bg-color-white smart-form" id="rev-toggles">
										<div class="inline-group">
											<label for="gra-0" class="checkbox status-label-new">
												<input type="checkbox" name="gra-0" id="gra-0" checked="checked">
												<i></i> <s:text name='home.statistic.status.request.new'/>
												</label>
											<label for="gra-1" class="checkbox status-label-apr">
												<input type="checkbox" name="gra-1" id="gra-1" checked="checked">
												<i></i> <s:text name='home.statistic.status.request.approved'/></label>
											<label for="gra-2" class="checkbox status-label-rej" >
												<input type="checkbox" name="gra-2" id="gra-2" checked="checked">
												<i></i><s:text name='home.statistic.status.request.rejected'/></label>
											</div>
									</div>

									</div>
									<!-- end widget edit box -->

									<!-- widget content -->
									<div class="padding-10">
										<div id="flotcontainer" class="chart-large has-legend-unique"></div>
									</div>
									<!-- end widget content -->

								</div>
								<!-- end widget div -->

<!-- 							</div> -->
							<!-- end widget -->

						</article>
				</div>
		</section>
		<!-- /Section: FEATURES -->

		<!-- #FOOTER -->
		<footer>

			<div class="footer-content clearfix">
				<div class="container custom-container">
					<div class="row">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<a href="#." class="footer-logo"><s:text name="home.page.contact"/></a>
								
								<p>
								<s:text name="home.page.contact.info"/>
								</p>
								<p>
									<a href="#."><i class="fa fa-facebook"></i> </a>
									&nbsp;&nbsp;<a href="#."><i class="fa fa-twitter"></i> </a>
									&nbsp;&nbsp;<a href="#."><i class="fa fa-linkedin"></i> </a>
									&nbsp;&nbsp;<a href="#."><i class="fa fa-tumblr"></i> </a>
								</p>
						</div>
						
					      
						<div class="col-md-8 col-sm-6 col-xs-12">
							<div class="google-maps">
								<a href="#." class="footer-logo"><s:text name="home.page.map"/></a>
								<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d46940.20601141889!2d21.1587273!3d42.666380100000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1431437994060" width="750" height="200" frameborder="0" style="border:0"></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="bottom-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12 text-center">
							<p>
								<s:text name="home.page.copyright"/>
							</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<input type="hidden" id="limit" name="limit" value="<s:property value="limit"/>">
		<input type="hidden" id="hasMore" name="hasMore" value="<s:property value="hasMore"/>">
		<input type="hidden" id="count" name="count" value="<s:property value="count"/>">
		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		<script src="js/libs/jquery-2.0.2.min.js"></script>

		<script src="js/libs/jquery-ui-1.10.3.min.js"></script>
		<!--# JS PLUGINS -->
		<script src="js/landing-page/plugins/classie.js"></script>
		<script src="js/landing-page/plugins/jquery.scrollUp.js"></script>
		<script src="js/landing-page/plugins/nivo-lightbox.min.js"></script>
		<script src="js/landing-page/plugins/smoothscroll.js"></script>
		<script src="js/landing-page/plugins/jquery.themepunch.plugins.min.js"></script>
		<script src="js/landing-page/plugins/jquery.themepunch.revolution.min.js"></script>

		<!-- # Custom Theme JavaScript -->
		<script src="js/custom.js"></script>

		<!-- #PAGE SCRIPT -->
		<script type="text/javascript">
		
		function goToByScroll(id){
		    $('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
		}
		
		function genHarvSatat(){
			var $chrt_border_color = "#efefef";
			var $chrt_second = "#6595b4";
			var $chrt_fourth = "#7e9d3a";
			/* bar chart */
			if ($("#harv-bar-chart").length) {
				var pl_tech = new Array();
				var im_tech = new Array();
				var reg_name=new Array();
				var im_fire= new Array();
				var pl_fire=new Array();
				var pl_pulp=new Array();
				var im_pulp=new Array();

				
		    	$.ajax({
					type : "GET", // GET or POST
					url : "PublishGrid.harvestStatisitc.do?year="+$("#pvtYear").val(), // the file to call
					async : false,
					beforeSend:function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
// 						alert("error:" + errorThrown + ", status:" + status);
					},
					dataType: "json",
			        data: {
						featureClass: "P",
						style: "full",
					},
					success : function(data, status, jqXHR) { // on success..
						if(!jQuery.isEmptyObject(data)){
							var j = 1354586000000;
							for(var i=0;i<data.length;i++){
	//	 						alert(data[i].number_of_requests);
								reg_name.push([i,data[i].reg_name]);
	//	 						var j = 1354586000000+data[i].reg_id*1000000000;
								pl_tech.push([i,data[i].pl_tech_volume]);
								im_tech.push([i,data[i].im_tech_volume]);
								pl_fire.push([i,data[i].pl_fire_volume]);
								im_fire.push([i,data[i].im_fire_volume]);
								pl_pulp.push([i,data[i].pl_pulp_volume]);
								im_pulp.push([i,data[i].im_pulp_volume]);
								j=j+10001000000;
	//	 						quant.push(data[i].number_of_requests);
							}
						}
					},
					complete:function(jqXHR, textStatus){
					}
				});


				var ds = new Array();
				
				var statHarvType=$("input[name='statHarvType']:checked").val();
				
				if(statHarvType=='fireVolume'){
						ds.push({
							data : pl_fire,
							bars : {
								show : true,
								barWidth : 0.2,
								order : 1,
							}
						});
						ds.push({
							data : im_fire,
							bars : {
								show : true,
								barWidth : 0.2,
								order : 2
							}
						});
					}else if(statHarvType=='pulpVolume'){
						ds.push({
							data : pl_pulp,
							bars : {
								show : true,
								barWidth : 0.2,
								order : 1,
							}
						});
						ds.push({
							data : im_pulp,
							bars : {
								show : true,
								barWidth : 0.2,
								order : 2
							}
						});

						}else{
							ds.push({
								data : pl_tech,
								bars : {
									show : true,
									barWidth : 0.2,
									order : 1,
								}
							});
							ds.push({
								data : im_tech,
								bars : {
									show : true,
									barWidth : 0.2,
									order : 2
								}
							});

							}

				
				
				//Display graph
				$.plot($("#harv-bar-chart"), ds, {
		            xaxis: {
		                mode: "time",
	                    ticks:reg_name
		            },
					colors : [$chrt_second, $chrt_fourth, "#666", "#BBB"],
					grid : {
						show : true,
						hoverable : false,
						clickable : true,
						tickColor : $chrt_border_color,
						borderWidth : 0,
						borderColor : $chrt_border_color,
					},
					legend : true,
					tooltip : true,
					tooltipOpts : {
						content : "<b>%x</b> = <span>%y</span>",
						defaultTheme : false
					}

				});

			}
			/* end bar chart */
			return false;
		};
		function genPvtStat(){
		
		    $(function () {
		    	var trgt1 =new Array();
		    	var ticksReg=new Array();
		    	var push=new Array();
		    	var pvtApr=new Array();
		    	var pvtRej=new Array();
		    	$.ajax({
					type : "GET", // GET or POST
					url : "PublishGrid.pvtRequestStatisitc.do?year="+$("#pvtYear").val(), // the file to call
					async : false,
					beforeSend:function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
// 						alert("error:" + errorThrown + ", status:" + status);
					},
					dataType: "json",
			        data: {
						featureClass: "P",
						style: "full",
					},
					success : function(data, status, jqXHR) { // on success..
						if(!jQuery.isEmptyObject(data)){
							var j = 1354586000000;
							for(var i=0;i<data.length;i++){
	//	 						alert(data[i].number_of_requests);
								ticksReg.push([j,data[i].reg_name]);
	//	 						var j = 1354586000000+data[i].reg_id*1000000000;
								trgt1.push([j,data[i].number_of_requests]);
								j=j+10001000000;
	//	 						quant.push(data[i].number_of_requests);
							}
						}
						//get minimalen prej quantity
//	 					 min = Math.min.apply(null, quant);
						 
					},
					complete:function(jqXHR, textStatus){
					}
				});


		    	$.ajax({
					type : "GET", // GET or POST
					url : "PublishGrid.pvtRequestStatisitc.do?year="+$("#pvtYear").val()+"&pvtStatus=APR", // the file to call
					async : false,
					beforeSend:function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
// 						alert("error:" + errorThrown + ", status:" + status);
					},
					dataType: "json",
			        data: {
						featureClass: "P",
						style: "full",
					},
					success : function(data, status, jqXHR) { // on success..
						if(!jQuery.isEmptyObject(data)){
							var j = 1354586000000;
							for(var i=0;i<data.length;i++){
								pvtApr.push([j,data[i].number_of_requests]);
								j=j+10001000000;
							}
						}
						//get minimalen prej quantity
//	 					 min = Math.min.apply(null, quant);
						 
					},
					complete:function(jqXHR, textStatus){
					}
				});
					//source
				$.ajax({
					type : "GET", // GET or POST
					url : "PublishGrid.pvtRequestStatisitc.do?year="+$("#pvtYear").val()+"&pvtStatus=REJ", // the file to call
					async : false,
					beforeSend:function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
// 						alert("error:" + errorThrown + ", status:" + status);
					},
					dataType: "json",
			        data: {
						featureClass: "P",
						style: "full",
					},
					success : function(data, status, jqXHR) { // on success..
						if(!jQuery.isEmptyObject(data)){
							var j = 1354586000000;
							for(var i=0;i<data.length;i++){
								pvtRej.push([j,data[i].number_of_requests]);
								j=j+10001000000;
							}
						}
						//get minimalen prej quantity
//	 					 min = Math.min.apply(null, quant);
						 
					},
					complete:function(jqXHR, textStatus){
					}
				});
		
		        var trgt = trgt1,
		            prft = pvtApr,
		            pvrj= pvtRej;
		            
		            toggles = $("#rev-toggles"),
		            target = $("#flotcontainer");


	            
		
		        var data = [{
		            label: "<s:text name='home.statistic.status.request.new'/>",
		            data: trgt,
		            color: '#337DDD',
		            bars: {
		                show: true,
		                align: "center",
		                barWidth: 30 * 30 * 60 * 1000 * 80
		            }
		        }, {
		            label: "<s:text name='home.statistic.status.request.approved'/>",
		            data: prft,
		            color: '#15B54D',
		            bars: {
		                show: true,
		                align: "center",
		                barWidth: 30 * 30 * 60 * 1000 * 80
		            }
		        }, {
		            label: "<s:text name='home.statistic.status.request.rejected'/>",
		            data: pvrj,
		            color: '#E84545',
		            bars: {
		                show: true,
		                align: "center",
		                barWidth: 30 * 30 * 60 * 1000 * 80
		            } 
	            }];
		
		        var options = {
		            grid: {
		                hoverable: true
		            },
		            xaxis: {
		                mode: "time",
	                    ticks:ticksReg
		                
		            },
		            yaxes: {
		     
		            }
		
		        };
		
		        plot2 = null;
		
		        function plotNow() {
		            var d = [];
		            toggles.find(':checkbox').each(function () {
		                if ($(this).is(':checked')) {
		                    d.push(data[$(this).attr("name").substr(4, 1)]);
		                 
		                }
		            });
		            if (d.length > 0) {
		                if (plot2) {
		                    plot2.setData(d);
		                    plot2.draw();
		                } else {
		                    plot2 = $.plot(target, d, options);
		                }
		            }
		
		        };
		
		        toggles.find(':checkbox').on('change', function () {
		            plotNow();
		        });
		        plotNow();
		        return false;
		    });
		    return false;
		};

			function getTitles(){
				if($("#hasMore").val()=="true"){
					$.ajax({
						type : "GET",
						url : "PublishGrid.newsTitle.do?limit="+$("#limit").val(),//+limit,
						async : false,
				        beforeSend:function(jqXHR, settings) {
				        },
				        error : function(errorThrown, status, jqXHR) { // on error..
// 				         alert("error:" + errorThrown + ", status:" + status);
				        },
				        dataType: "json",
				        data: {
					      featureClass: "P",
					      style: "full",
					      maxRows: 12,
					     },
				        success : function(data, status, jqXHR) { // on success..
					        if(!jQuery.isEmptyObject(data)){
					        	$("#hasMore").val(data[0].hasMore);
						        $("#count").val(data[0].count);
						        $("#count").html(data[0].count);
						        $("#limit").val(data[0].limit);
						        $("#limit").html(data[0].limit);
						        for(var i=0;i<data.length;i++){
						        	var li='<li class="message"><img src="img/landing-page/img/news/news.png" class="linenews"><span class="message-text"> <a href="#." onclick="getContent('+data[i].id+');return false; ">'+  data[i].title+' </a><br><small class="text-muted ultra-light"><s:text name="pub.publishing.publishedDate.label"/>: '+data[i].published_date+' </small>';
									if(!jQuery.isEmptyObject(data[i].no_translation)){
										li+='<button class="test12" disabled title="<s:text name="home.page.no.translation"/>"><i class="fa fa-question-circle"/>';
									}
									li+='</span></li><hr>';
									$("#news_ul").append(li);
									if($('#news_ul li').length ===5 ){
										$("#news_div").css({"height":$("#news_div").height(),"overflow-y":"auto"});
									}
							   }
					       }
				        }
					});
				}
				return false;
		   	};
			function getContent(id){
		   		$.ajax({
					type : "GET",
					url : "PublishGrid.newsContent.do?pub_id="+id,
					async : false,
			        beforeSend:function(jqXHR, settings) {
			        },
			        error : function(errorThrown, status, jqXHR) { // on error..
// 			         alert("error:" + errorThrown + ", status:" + status);
			        },
			        dataType: "json",
			        data: {
				      featureClass: "P",
				      style: "full",
				      maxRows: 12,
				     },
			        success : function(data, status, jqXHR) { // on success..
			        	if(!jQuery.isEmptyObject(data)){
			        		var content='<h3 class="margin-top-0"><a href="javascript:void(0);"> '+data.title+' </a><br></h3><p class="text-news">'+data.news_content+' </p>';
							var img;
							if(!jQuery.isEmptyObject(data.img)){
								img='<img src="data:image/jpeg;base64,'+data.img+'" class="img-responsive" alt="'+data.title+'"  style="padding: 20px 20px 20px 20px;">';
							}else{
								img='<img src="img/news.png" class="img-responsive" alt="'+data.title+'"  style="padding: 20px 20px 20px 20px;">';
							}
							$("#main_img").html(img);
			         		$("#newsContent").html(content);
				        }
			        }
				});
		   		return false;
			}
			jQuery(document).ready(function() {
				/* Language button on click: change language and reload page*/
			    /*start language button*/
			    $("#main_buttons li .lang_button").click(function(event) {
					event.preventDefault();
					
					var url=this.id;
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
						return false;
				});
				
				$('html, body').animate({ scrollTop: $('#top_bar').offset().top }, 'slow');
				$("#hasMore").val(true);
				$("#limit").val("");
				getTitles();
				getContent(null);

				var  pYear=(new Date).getFullYear();
				$("#pvtYear").val( pYear );
				genPvtStat();
				genHarvSatat();
				
			    $("#pvtYear").change(function(){
				    if(!$("#pvtYear").val()){
				    	$("#pvtYear").val(pYear);
					    }
				    genPvtStat();
				    genHarvSatat();
			    });

			    $("input[name='statHarvType']:radio").change(function () {
				    var statHarvType=$("input[name='statHarvType']:checked").val();
			    	genHarvSatat();
				    });

			    
			    /*end language button*/
			    
// 				$("#news_ul").css({"height":$("#news_ul").height(),"overflow-y":"auto"});
// 				$("#news_content_container").css({"height":$("#news_container").height()});
// 				$("#newsContent").css({"width":"100%","overflow":"auto"});
// 				alert($("#news_ul").height());
				jQuery('.tp-banner').show().revolution({
					dottedOverlay : "none",
					delay : 8000,
					startwidth : 1170,
					startheight : 400,
					hideThumbs : 200,

					thumbWidth : 100,
					thumbHeight : 50,
					thumbAmount : 5,

					navigationStyle : "preview4",

					touchenabled : "on",
					onHoverStop : "off",

					swipe_velocity : 0.7,
					swipe_min_touches : 1,
					swipe_max_touches : 1,
					drag_block_vertical : false,

					parallax : "mouse",
					parallaxBgFreeze : "on",
					parallaxLevels : [7, 4, 3, 2, 5, 4, 3, 2, 1, 0],

					keyboardNavigation : "off",

					navigationHAlign : "center",
					navigationVAlign : "bottom",
					navigationHOffset : 0,
					navigationVOffset : 20,

					soloArrowLeftHalign : "left",
					soloArrowLeftValign : "center",
					soloArrowLeftHOffset : 20,
					soloArrowLeftVOffset : 0,

					soloArrowRightHalign : "right",
					soloArrowRightValign : "center",
					soloArrowRightHOffset : 20,
					soloArrowRightVOffset : 0,

					shadow : 0,
					fullWidth : "off",
					fullScreen : "on",

					spinner : "spinner4",

					stopLoop : "off",
					stopAfterLoops : -1,
					stopAtSlide : -1,

					shuffle : "off",

					autoHeight : "off",
					forceFullWidth : "off",

					hideThumbsOnMobile : "off",
					hideNavDelayOnMobile : 1500,
					hideBulletsOnMobile : "off",
					hideArrowsOnMobile : "off",
					hideThumbsUnderResolution : 0,

					hideSliderAtLimit : 0,
					hideCaptionAtLimit : 0,
					hideAllCaptionAtLilmit : 0,
					startWithSlide : 0,
					fullScreenOffsetContainer : ""
				});
				
				
			});
			//ready

			$.scrollUp();
			$('#scrollUp').text('<s:text name="home.page.scroll.top"/>');
		</script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="js/landing-page/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="js/bootstrap/bootstrap.min.js"></script>

	


		<!-- MAIN APP JS FILE -->
		<script src="js/app.min.js"></script>

		<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
		<!-- Voice command : plugin -->
<%-- 		<script src="js/speech/voicecommand.min.js"></script> --%>

		<!-- SmartChat UI : plugin -->
<%-- 		<script src="js/smart-chat-ui/smart.chat.ui.min.js"></script> --%>
<%-- 		<script src="js/smart-chat-ui/smart.chat.manager.min.js"></script> --%>
		
		<!-- PAGE RELATED PLUGIN(S) -->
		<!-- Flot Chart Plugin: Flot Engine, Flot Resizer, Flot Tooltip -->
		<script src="js/plugin/flot/jquery.flot.cust.min.js"></script>
		<script src="js/plugin/flot/jquery.flot.resize.min.js"></script>
		<script src="js/plugin/flot/jquery.flot.fillbetween.min.js"></script>
		<script src="js/plugin/flot/jquery.flot.orderBar.min.js"></script>
		<script src="js/plugin/flot/jquery.flot.pie.min.js"></script>
		<script src="js/plugin/flot/jquery.flot.time.min.js"></script>
		<script src="js/plugin/flot/jquery.flot.tooltip.min.js"></script>
		
		<!-- Vector Maps Plugin: Vectormap engine, Vectormap language -->
		<script src="js/plugin/vectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="js/plugin/vectormap/jquery-jvectormap-world-mill-en.js"></script>
		
	


		<!-- Your GOOGLE ANALYTICS CODE Below -->
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
			_gaq.push(['_trackPageview']);

			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();

		</script>


		

	</body>

</html>
