<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:include value="/module/base/nocache.jsp"></s:include>
		<!-- PAGE RELATED PLUGIN(S) -->
		<!-- Flot Chart Plugin: Flot Engine, Flot Resizer, Flot Tooltip -->
<script src="js/plugin/flot/jquery.flot.cust.min.js"></script>
<script src="js/plugin/flot/jquery.flot.resize.min.js"></script>
<script src="js/plugin/flot/jquery.flot.fillbetween.min.js"></script>
<script src="js/plugin/flot/jquery.flot.orderBar.min.js"></script>
<script src="js/plugin/flot/jquery.flot.pie.min.js"></script>
<script src="js/plugin/flot/jquery.flot.time.min.js"></script>
<script src="js/plugin/flot/jquery.flot.tooltip.min.js"></script>
		
<div class="row">
<!-- 	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4"> -->
<!-- 		<h1 class="page-title txt-color-blueDark"><em class="fa-fw fa fa-home"></em><s:text name="dashboard.menu"/> <span> My Dashboard</span></h1> -->
<!-- 	</div> -->
<br>
</div>
<!-- widget grid -->
<section  id="widget-grid" class="">

	<!-- row -->
	<div class="row">
		<article class="col-sm-12">
			<!-- new widget -->
			<div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="glyphicon glyphicon-stats txt-color-darken"></i> </span>
					<h2><s:text name="home.page.nav.statistics.title"/></h2>
						<div class="widget-toolbar pull-left">
							<input type="text" name="pvtYear" id="pvtYear" placeholder="<s:text name='annual.plan.year'/>" >
				    	</div>
					<ul class="nav nav-tabs pull-right in" id="myTab">
						<li class="active">
							<a data-toggle="tab" href="#s1"><i class="fa fa-signal"></i> <span class="hidden-mobile hidden-tablet"><s:text name="home.page.stat.harvest"/></span></a>
						</li>
						<li>
							<a data-toggle="tab" href="#s2"><i class="fa  fa-indent"></i> <span class="hidden-mobile hidden-tablet"><s:text name='annual.plan.private.menu'/></span></a>
						</li>
					</ul>

				</header>

				<!-- widget div-->
				<div class="no-padding">
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">

					</div>
					<!-- end widget edit box -->

					<div class="widget-body">
						<!-- content -->
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade active in padding-10 no-padding-bottom" id="s1">
							<!-- harvest statistic -->
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
													<label >
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
							<!-- end s1 tab pane -->

							<div class="tab-pane fade" id="s2">
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
							<!-- end s2 tab pane -->

						</div>

						<!-- end content -->
					</div>

				</div>
				<!-- end widget div -->
			</div>
			<!-- end widget -->

		</article>
	</div>

	<!-- end row -->

	<!-- row -->

	<div  class="row">

		<article class="col-sm-12 col-md-12 col-lg-12">

			<!-- new widget -->
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false" >
				<header>
					<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
					<h2><s:text name="dashboard.forest.map"/></h2>	
				</header>
				<!--	<head> -->
							<style type="text/css">
							/* General settings test */
							/* The map and the location bar */
								#map_m {
									clear: both;
									position: relative;
									width: auto;
									height: 700px;
									border: 1px solid black;
								}
							</style>
				<!--	</head> -->
				<div>
						
						<div class="widget-body no-padding">
							<div  id="map_m" class="map_m"></div>
						</div>
					<!--         <div id="wrapper">
								<div id="location">location</div>
								<div id="scale">
								</div>
							</div>
							<div id="nodelist">
								<em>Click on the map to get feature info</em>
							</div> -->
						<!-- </body> -->
				</div>
 
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->

			<!-- new widget -->
<!-- 			<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-colorbutton="false"> -->

<!-- 				widget options:
<!-- 				usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false"> -->

<!-- 				data-widget-colorbutton="false" -->
<!-- 				data-widget-editbutton="false" -->
<!-- 				data-widget-togglebutton="false" -->
<!-- 				data-widget-deletebutton="false" -->
<!-- 				data-widget-fullscreenbutton="false" -->
<!-- 				data-widget-custombutton="false" -->
<!-- 				data-widget-collapsed="true" -->
<!-- 				data-widget-sortable="false" -->

<!-- 				--> 
<!-- 				<header> -->
<!-- 					<span class="widget-icon"> <i class="fa fa-calendar"></i> </span> -->
<!-- 					<h2> Employee leave calendar</h2> -->
<!-- 					<div class="widget-toolbar"> -->
<!-- 						add: non-hidden - to disable auto hide -->
<!-- 						<div class="btn-group"> -->
<!-- 							<button class="btn dropdown-toggle btn-xs btn-default" data-toggle="dropdown"> -->
<!-- 								Showing <i class="fa fa-caret-down"></i> -->
<!-- 							</button> -->
<!-- 							<ul class="dropdown-menu js-status-update pull-right"> -->
<!-- 								<li> -->
<!-- 									<a href="javascript:void(0);" id="mt">Month</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="javascript:void(0);" id="ag">Agenda</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="javascript:void(0);" id="td">Today</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</header> -->

<!-- 				widget div -->
<!-- 				<div> -->
<!-- 					widget edit box -->
<!-- 					<div class="jarviswidget-editbox"> -->

<!-- 						<input class="form-control" type="text"> -->

<!-- 					</div> -->
<!-- 					end widget edit box -->

<!-- 					<div class="widget-body no-padding"> -->
<!-- 						content goes here -->
<!-- 						<div class="widget-body-toolbar"> -->

<!-- 							<div id="calendar-buttons"> -->

<!-- 								<div class="btn-group"> -->
<!-- 									<a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-prev"><i class="fa fa-chevron-left"></i></a> -->
<!-- 									<a href="javascript:void(0)" class="btn btn-default btn-xs" id="btn-next"><i class="fa fa-chevron-right"></i></a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div id="calendar"></div> -->

<!-- 						end content -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 				end widget div -->
<!-- 			</div> -->
			<!-- end widget -->

		</article>

<!-- 		<article class="col-sm-12 col-md-12 col-lg-6"> -->

<!-- 			<!-- new widget --> 
<!-- 			<div class="jarviswidget" id="wid-id-2" data-widget-colorbutton="false" data-widget-editbutton="false"> -->

<!-- 				widget options:
<!-- 				usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false"> -->

<!-- 				data-widget-colorbutton="false" -->
<!-- 				data-widget-editbutton="false" -->
<!-- 				data-widget-togglebutton="false" -->
<!-- 				data-widget-deletebutton="false" -->
<!-- 				data-widget-fullscreenbutton="false" -->
<!-- 				data-widget-custombutton="false" -->
<!-- 				data-widget-collapsed="true" -->
<!-- 				data-widget-sortable="false" -->

<!-- 				--> 

<!-- 				<header> -->
<!-- 					<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span> -->
<!-- 					<h2>Birds Eye</h2> -->
<!-- 					<div class="widget-toolbar hidden-mobile"> -->
<!-- 						<span class="onoffswitch-title"><i class="fa fa-location-arrow"></i> Realtime</span> -->
<!-- 						<span class="onoffswitch"> -->
<!-- 							<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" checked="checked" id="myonoffswitch"> -->
<!-- 							<label class="onoffswitch-label" for="myonoffswitch"> <span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> <span class="onoffswitch-switch"></span> </label> </span> -->
<!-- 					</div> -->
<!-- 				</header> -->

<!-- 				widget div -->
<!-- 				<div> -->
<!-- 					widget edit box -->
<!-- 					<div class="jarviswidget-editbox"> -->
<!-- 						<div> -->
<!-- 							<label>Title:</label> -->
<!-- 							<input type="text" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					end widget edit box -->

<!-- 					<div class="widget-body no-padding"> -->
<!-- 						content goes here -->

<!-- 						<div id="vector-map" class="vector-map"></div> -->
<!-- 						<div id="heat-fill"> -->
<!-- 							<span class="fill-a">0</span> -->

<!-- 							<span class="fill-b">5,000</span> -->
<!-- 						</div> -->

<!-- 						<table class="table table-striped table-hover table-condensed"> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th>Country</th> -->
<!-- 									<th>Visits</th> -->
<!-- 									<th class="text-align-center">User Activity</th> -->
<!-- 									<th class="text-align-center">Online</th> -->
<!-- 									<th class="text-align-center">Demographic</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td><a href="javascript:void(0);">USA</a></td> -->
<!-- 									<td>4,977</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline txt-color-blue text-align-center" data-sparkline-height="22px" data-sparkline-width="90px" data-sparkline-barwidth="2"> -->
<!-- 										2700, 3631, 2471, 1300, 1877, 2500, 2577, 2700, 3631, 2471, 2000, 2100, 3000 -->
<!-- 									</div></td> -->
<!-- 									<td class="text-align-center">143</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline display-inline" data-sparkline-type='pie' data-sparkline-piecolor='["#E979BB", "#57889C"]' data-sparkline-offset="90" data-sparkline-piesize="23px"> -->
<!-- 										17,83 -->
<!-- 									</div> -->
<!-- 									<div class="btn-group display-inline pull-right text-align-left hidden-tablet"> -->
<!-- 										<button class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown"> -->
<!-- 											<i class="fa fa-cog fa-lg"></i> -->
<!-- 										</button> -->
<!-- 										<ul class="dropdown-menu dropdown-menu-xs pull-right"> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-file fa-lg fa-fw txt-color-greenLight"></i> <u>P</u>DF</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-times fa-lg fa-fw txt-color-red"></i> <u>D</u>elete</a> -->
<!-- 											</li> -->
<!-- 											<li class="divider"></li> -->
<!-- 											<li class="text-align-center"> -->
<!-- 												<a href="javascript:void(0);">Cancel</a> -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><a href="javascript:void(0);">Australia</a></td> -->
<!-- 									<td>4,873</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline txt-color-blue text-align-center" data-sparkline-height="22px" data-sparkline-width="90px" data-sparkline-barwidth="2"> -->
<!-- 										1000, 1100, 3030, 1300, -1877, -2500, -2577, -2700, 3631, 2471, 4700, 1631, 2471 -->
<!-- 									</div></td> -->
<!-- 									<td class="text-align-center">247</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline display-inline" data-sparkline-type='pie' data-sparkline-piecolor='["#E979BB", "#57889C"]' data-sparkline-offset="90" data-sparkline-piesize="23px"> -->
<!-- 										22,88 -->
<!-- 									</div> -->
<!-- 									<div class="btn-group display-inline pull-right text-align-left hidden-tablet"> -->
<!-- 										<button class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown"> -->
<!-- 											<i class="fa fa-cog fa-lg"></i> -->
<!-- 										</button> -->
<!-- 										<ul class="dropdown-menu dropdown-menu-xs pull-right"> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-file fa-lg fa-fw txt-color-greenLight"></i> <u>P</u>DF</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-times fa-lg fa-fw txt-color-red"></i> <u>D</u>elete</a> -->
<!-- 											</li> -->
<!-- 											<li class="divider"></li> -->
<!-- 											<li class="text-align-center"> -->
<!-- 												<a href="javascript:void(0);">Cancel</a> -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><a href="javascript:void(0);">India</a></td> -->
<!-- 									<td>3,671</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline txt-color-blue text-align-center" data-sparkline-height="22px" data-sparkline-width="90px" data-sparkline-barwidth="2"> -->
<!-- 										3631, 1471, 2400, 3631, 471, 1300, 1177, 2500, 2577, 3000, 4100, 3000, 7700 -->
<!-- 									</div></td> -->
<!-- 									<td class="text-align-center">373</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline display-inline" data-sparkline-type='pie' data-sparkline-piecolor='["#E979BB", "#57889C"]' data-sparkline-offset="90" data-sparkline-piesize="23px"> -->
<!-- 										10,90 -->
<!-- 									</div> -->
<!-- 									<div class="btn-group display-inline pull-right text-align-left hidden-tablet"> -->
<!-- 										<button class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown"> -->
<!-- 											<i class="fa fa-cog fa-lg"></i> -->
<!-- 										</button> -->
<!-- 										<ul class="dropdown-menu dropdown-menu-xs pull-right"> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-file fa-lg fa-fw txt-color-greenLight"></i> <u>P</u>DF</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-times fa-lg fa-fw txt-color-red"></i> <u>D</u>elete</a> -->
<!-- 											</li> -->
<!-- 											<li class="divider"></li> -->
<!-- 											<li class="text-align-center"> -->
<!-- 												<a href="javascript:void(0);">Cancel</a> -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><a href="javascript:void(0);">Brazil</a></td> -->
<!-- 									<td>2,476</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline txt-color-blue text-align-center" data-sparkline-height="22px" data-sparkline-width="90px" data-sparkline-barwidth="2"> -->
<!-- 										2700, 1877, 2500, 2577, 2000, 3631, 2471, -2700, -3631, 2471, 1300, 2100, 3000, -->
<!-- 									</div></td> -->
<!-- 									<td class="text-align-center">741</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline display-inline" data-sparkline-type='pie' data-sparkline-piecolor='["#E979BB", "#57889C"]' data-sparkline-offset="90" data-sparkline-piesize="23px"> -->
<!-- 										34,66 -->
<!-- 									</div> -->
<!-- 									<div class="btn-group display-inline pull-right text-align-left hidden-tablet"> -->
<!-- 										<button class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown"> -->
<!-- 											<i class="fa fa-cog fa-lg"></i> -->
<!-- 										</button> -->
<!-- 										<ul class="dropdown-menu dropdown-menu-xs pull-right"> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-file fa-lg fa-fw txt-color-greenLight"></i> <u>P</u>DF</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-times fa-lg fa-fw txt-color-red"></i> <u>D</u>elete</a> -->
<!-- 											</li> -->
<!-- 											<li class="divider"></li> -->
<!-- 											<li class="text-align-center"> -->
<!-- 												<a href="javascript:void(0);">Cancel</a> -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><a href="javascript:void(0);">Turkey</a></td> -->
<!-- 									<td>1,476</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline txt-color-blue text-align-center" data-sparkline-height="22px" data-sparkline-width="90px" data-sparkline-barwidth="2"> -->
<!-- 										1300, 1877, 2500, 2577, 2000, 2100, 3000, -2471, -2700, -3631, -2471, 2700, 3631 -->
<!-- 									</div></td> -->
<!-- 									<td class="text-align-center">123</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline display-inline" data-sparkline-type='pie' data-sparkline-piecolor='["#E979BB", "#57889C"]' data-sparkline-offset="90" data-sparkline-piesize="23px"> -->
<!-- 										75,25 -->
<!-- 									</div> -->
<!-- 									<div class="btn-group display-inline pull-right text-align-left hidden-tablet"> -->
<!-- 										<button class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown"> -->
<!-- 											<i class="fa fa-cog fa-lg"></i> -->
<!-- 										</button> -->
<!-- 										<ul class="dropdown-menu dropdown-menu-xs pull-right"> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-file fa-lg fa-fw txt-color-greenLight"></i> <u>P</u>DF</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-times fa-lg fa-fw txt-color-red"></i> <u>D</u>elete</a> -->
<!-- 											</li> -->
<!-- 											<li class="divider"></li> -->
<!-- 											<li class="text-align-center"> -->
<!-- 												<a href="javascript:void(0);">Cancel</a> -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><a href="javascript:void(0);">Canada</a></td> -->
<!-- 									<td>146</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline txt-color-orange text-align-center" data-sparkline-height="22px" data-sparkline-width="90px" data-sparkline-barwidth="2"> -->
<!-- 										5, 34, 10, 1, 4, 6, -9, -1, 0, 0, 5, 6, 7 -->
<!-- 									</div></td> -->
<!-- 									<td class="text-align-center">23</td> -->
<!-- 									<td class="text-align-center"> -->
<!-- 									<div class="sparkline display-inline" data-sparkline-type='pie' data-sparkline-piecolor='["#E979BB", "#57889C"]' data-sparkline-offset="90" data-sparkline-piesize="23px"> -->
<!-- 										50,50 -->
<!-- 									</div> -->
<!-- 									<div class="btn-group display-inline pull-right text-align-left hidden-tablet"> -->
<!-- 										<button class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown"> -->
<!-- 											<i class="fa fa-cog fa-lg"></i> -->
<!-- 										</button> -->
<!-- 										<ul class="dropdown-menu dropdown-menu-xs pull-right"> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-file fa-lg fa-fw txt-color-greenLight"></i> <u>P</u>DF</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="javascript:void(0);"><i class="fa fa-times fa-lg fa-fw txt-color-red"></i> <u>D</u>elete</a> -->
<!-- 											</li> -->
<!-- 											<li class="divider"></li> -->
<!-- 											<li class="text-align-center"> -->
<!-- 												<a href="javascript:void(0);">Cancel</a> -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</div></td> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
<!-- 							<tfoot> -->
<!-- 								<tr> -->
<!-- 									<td colspan=5> -->
<!-- 									<ul class="pagination pagination-xs no-margin"> -->
<!-- 										<li class="prev disabled"> -->
<!-- 											<a href="javascript:void(0);">Previous</a> -->
<!-- 										</li> -->
<!-- 										<li class="active"> -->
<!-- 											<a href="javascript:void(0);">1</a> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<a href="javascript:void(0);">2</a> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<a href="javascript:void(0);">3</a> -->
<!-- 										</li> -->
<!-- 										<li class="next"> -->
<!-- 											<a href="javascript:void(0);">Next</a> -->
<!-- 										</li> -->
<!-- 									</ul></td> -->
<!-- 								</tr> -->
<!-- 							</tfoot> -->
<!-- 						</table> -->

<!-- 						end content -->

<!-- 					</div> -->

<!-- 				</div> -->
<!-- 				end widget div -->
<!-- 			</div> -->
<!-- 			<!-- end widget --> 

<!-- 			<!-- new widget --> 
<!-- 			<div class="jarviswidget jarviswidget-color-blue" id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false"> -->

<!-- 				widget options:
<!-- 				usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false"> -->

<!-- 				data-widget-colorbutton="false" -->
<!-- 				data-widget-editbutton="false" -->
<!-- 				data-widget-togglebutton="false" -->
<!-- 				data-widget-deletebutton="false" -->
<!-- 				data-widget-fullscreenbutton="false" -->
<!-- 				data-widget-custombutton="false" -->
<!-- 				data-widget-collapsed="true" -->
<!-- 				data-widget-sortable="false" -->

<!-- 				--> 

<!-- 				<header> -->
<!-- 					<span class="widget-icon"> <i class="fa fa-check txt-color-white"></i> </span> -->
<!-- 					<h2> ToDo's </h2> -->

<!-- 				</header> -->

<!-- 				widget div -->
<!-- 				<div> -->
<!-- 					widget edit box -->
<!-- 					<div class="jarviswidget-editbox"> -->
<!-- 						<div> -->
<!-- 							<label>Title:</label> -->
<!-- 							<input type="text" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					end widget edit box -->

<!-- 					<div class="widget-body no-padding smart-form"> -->
<!-- 						content goes here -->
<!-- 						<h5 class="todo-group-title"><i class="fa fa-warning"></i> Critical Tasks (<small class="num-of-tasks">1</small>)</h5> -->
<!-- 						<ul id="sortable1" class="todo"> -->
<!-- 							<li> -->
<!-- 								<span class="handle"> <label class="checkbox"> -->
<!-- 										<input type="checkbox" name="checkbox-inline"> -->
<!-- 										<i></i> </label> </span> -->
<!-- 								<p> -->
<!-- 									<strong>Ticket #17643</strong> - Hotfix for WebApp interface issue [<a href="javascript:void(0);" class="font-xs">More Details</a>] <span class="text-muted">Sea deep blessed bearing under darkness from God air living isn't. </span> -->
<!-- 									<span class="date">Jan 1, 2014</span> -->
<!-- 								</p> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 						<h5 class="todo-group-title"><i class="fa fa-exclamation"></i> Important Tasks (<small class="num-of-tasks">3</small>)</h5> -->
<!-- 						<ul id="sortable2" class="todo"> -->
<!-- 							<li> -->
<!-- 								<span class="handle"> <label class="checkbox"> -->
<!-- 										<input type="checkbox" name="checkbox-inline"> -->
<!-- 										<i></i> </label> </span> -->
<!-- 								<p> -->
<!-- 									<strong>Ticket #1347</strong> - Inbox email is being sent twice <small>(bug fix)</small> [<a href="javascript:void(0);" class="font-xs">More Details</a>] <span class="date">Nov 22, 2013</span> -->
<!-- 								</p> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<span class="handle"> <label class="checkbox"> -->
<!-- 										<input type="checkbox" name="checkbox-inline"> -->
<!-- 										<i></i> </label> </span> -->
<!-- 								<p> -->
<!-- 									<strong>Ticket #1314</strong> - Call customer support re: Issue <a href="javascript:void(0);" class="font-xs">#6134</a><small> (code review)</small> -->
<!-- 									<span class="date">Nov 22, 2013</span> -->
<!-- 								</p> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<span class="handle"> <label class="checkbox"> -->
<!-- 										<input type="checkbox" name="checkbox-inline"> -->
<!-- 										<i></i> </label> </span> -->
<!-- 								<p> -->
<!-- 									<strong>Ticket #17643</strong> - Hotfix for WebApp interface issue [<a href="javascript:void(0);" class="font-xs">More Details</a>] <span class="text-muted">Sea deep blessed bearing under darkness from God air living isn't. </span> -->
<!-- 									<span class="date">Jan 1, 2014</span> -->
<!-- 								</p> -->
<!-- 							</li> -->
<!-- 						</ul> -->

<!-- 						<h5 class="todo-group-title"><i class="fa fa-check"></i> Completed Tasks (<small class="num-of-tasks">1</small>)</h5> -->
<!-- 						<ul id="sortable3" class="todo"> -->
<!-- 							<li class="complete"> -->
<!-- 								<span class="handle"> <label class="checkbox state-disabled" style="display:none"> -->
<!-- 										<input type="checkbox" name="checkbox-inline" checked="checked" disabled="disabled"> -->
<!-- 										<i></i> </label> </span> -->
<!-- 								<p> -->
<!-- 									<strong>Ticket #17643</strong> - Hotfix for WebApp interface issue [<a href="javascript:void(0);" class="font-xs">More Details</a>] <span class="text-muted">Sea deep blessed bearing under darkness from God air living isn't. </span> -->
<!-- 									<span class="date">Jan 1, 2014</span> -->
<!-- 								</p> -->
<!-- 							</li> -->
<!-- 						</ul> -->

<!-- 						end content -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 				end widget div -->
<!-- 			</div> -->
<!-- 			<!-- end widget --> 

<!-- 		</article> -->

	</div>

	<!-- end row -->

</section>
<!-- end widget grid -->

<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	initMapDesh();
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
					alert("error:" + errorThrown + ", status:" + status);
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
// 					 min = Math.min.apply(null, quant);
					 
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
					alert("error:" + errorThrown + ", status:" + status);
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
// 					 min = Math.min.apply(null, quant);
					 
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
					alert("error:" + errorThrown + ", status:" + status);
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
// 					 min = Math.min.apply(null, quant);
					 
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
	    	
	    });
	    return false;
	};
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
					alert("error:" + errorThrown + ", status:" + status);
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
					content : "<b></b> = <span>%y</span>",
					defaultTheme : false
				}

			});

		}
		/* end bar chart */
		return false;
	};
	
	/*
	 * PAGE RELATED SCRIPTS
	 */
	
	$(".js-status-update a").click(function () {
	    var selText = $(this).text();
	    var $this = $(this);
	    $this.parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');
	    $this.parents('.dropdown-menu').find('li').removeClass('active');
	    $this.parent().addClass('active');
	});
	
	/*
	 * TODO: add a way to add more todo's to list
	 */
	
	// initialize sortable
	$(function () {
	    $("#sortable1, #sortable2").sortable({
	        handle: '.handle',
	        connectWith: ".todo",
	        update: countTasks
	    }).disableSelection();
	});
	
	// check and uncheck
	$('.todo .checkbox > input[type="checkbox"]').click(function () {
	    var $this = $(this).parent().parent().parent();
	
	    if ($(this).prop('checked')) {
	        $this.addClass("complete");
	
	        // remove this if you want to undo a check list once checked
	        //$(this).attr("disabled", true);
	        $(this).parent().hide();
	
	        // once clicked - add class, copy to memory then remove and add to sortable3
	        $this.slideUp(500, function () {
	            $this.clone().prependTo("#sortable3").effect("highlight", {}, 800);
	            $this.remove();
	            countTasks();
	        });
	    } else {
	        // insert undo code here...
	    }
	
	})
	// count tasks
	function countTasks() {
	
	    $('.todo-group-title').each(function () {
	        var $this = $(this);
	        $this.find(".num-of-tasks").text($this.next().find("li").size());
	    });
	
	}
	
	/*
	 * RUN PAGE GRAPHS
	 */
	

	jQuery(document).ready(function() {
			var  pYear=(new Date).getFullYear();
			$("#pvtYear").val( pYear );
			genHarvSatat();
			genPvtStat();
		    $("#pvtYear").change(function(){
			    if(!$("#pvtYear").val()){
			    	$("#pvtYear").val(pYear);
				    }
			    genHarvSatat();
			    genPvtStat();
		    });
		    $("input[name='statHarvType']:radio").change(function () {
		    	genHarvSatat();
			    });

		});
	

	
	/*
	 * VECTOR MAP
	 */
	
	data_array = {
	    "US": 4977,
	    "AU": 4873,
	    "IN": 3671,
	    "BR": 2476,
	    "TR": 1476,
	    "CN": 146,
	    "CA": 134,
	    "BD": 100
	};
	
	// Load Map dependency 1 then call for dependency 2
	loadScript("js/plugin/vectormap/jquery-jvectormap-1.2.2.min.js", loadMapFile);
	
	// Load Map dependency 2 then rendeder Map
	function loadMapFile() {
	    loadScript("js/plugin/vectormap/jquery-jvectormap-world-mill-en.js", renderVectorMap);
	}
	
	function renderVectorMap() {
	    $('#vector-map').vectorMap({
	        map: 'world_mill_en',
	        backgroundColor: '#fff',
	        regionStyle: {
	            initial: {
	                fill: '#c4c4c4'
	            },
	            hover: {
	                "fill-opacity": 1
	            }
	        },
	        series: {
	            regions: [{
	                values: data_array,
	                scale: ['#85a8b6', '#4d7686'],
	                normalizeFunction: 'polynomial'
	            }]
	        },
	        onRegionLabelShow: function (e, el, code) {
	            if (typeof data_array[code] == 'undefined') {
	                e.preventDefault();
	            } else {
	                var countrylbl = data_array[code];
	                el.html(el.html() + ': ' + countrylbl + ' visits');
	            }
	        }
	    });
	}
	
	/*
	 * FULL CALENDAR JS
	 */
	
	// Load Calendar dependency then setup calendar
	loadScript("js/plugin/fullcalendar/jquery.fullcalendar.min.js", iniCalendar);
	
	
	function iniCalendar() {
	    "use strict";
	
	    var date = new Date();
	    var d = date.getDate();
	    var m = date.getMonth();
	    var y = date.getFullYear();
	
	    var hdr = {
	        left: 'title',
	        center: 'month,agendaWeek,agendaDay',
	        right: 'prev,today,next'
	    };
	
	    var initDrag = function (e) {
	        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
	        // it doesn't need to have a start or end
	
	        var eventObject = {
	            title: $.trim(e.children().text()), // use the element's text as the event title
	            description: $.trim(e.children('span').attr('data-description')),
	            icon: $.trim(e.children('span').attr('data-icon')),
	            className: $.trim(e.children('span').attr('class')) // use the element's children as the event class
	        };
	        // store the Event Object in the DOM element so we can get to it later
	        e.data('eventObject', eventObject);
	
	        // make the event draggable using jQuery UI
	        e.draggable({
	            zIndex: 999,
	            revert: true, // will cause the event to go back to its
	            revertDuration: 0 //  original position after the drag
	        });	    };
	
	    var addEvent = function (title, priority, description, icon) {
	        title = title.length === 0 ? "<s:text name="leave.calendar.label.untitled.event"/>" : title;
	        description = description.length === 0 ? "<s:text name="leave.calendar.label.no.description"/>" : description;
	        icon = icon.length === 0 ? " " : icon;
	        priority = priority.length === 0 ? "label label-default" : priority;
	
	        var html = $('<li><span class="' + priority + '" data-description="' + description + '" data-icon="' +
	            icon + '">' + title + '</span></li>').prependTo('ul#external-events').hide().fadeIn();
	
	        $("#event-container").effect("highlight", 800);
	
	        initDrag(html);
	    };
	
	    /* initialize the external events
		 -----------------------------------------------------------------*/
	
	    $('#external-events > li').each(function () {
	        initDrag($(this));
	    });
	
	    $('#add-event').click(function () {
	        var title = $('#title').val(),
	            priority = $('input:radio[name=priority]:checked').val(),
	            description = $('#description').val(),
	            icon = $('input:radio[name=iconselect]:checked').val();
	
	        addEvent(title, priority, description, icon);
	    });
	
	    /* initialize the calendar
		 -----------------------------------------------------------------*/
	
	    $('#calendar').fullCalendar({
	
	        header: hdr,
	        buttonText: {
	            prev: '<i class="fa fa-chevron-left"></i>',
	            next: '<i class="fa fa-chevron-right"></i>'
	        },
	
	        editable: true,
	        droppable: false, // this allows things to be dropped onto the calendar !!!
	
	        drop: function (date, allDay) { // this function is called when something is dropped
	
	            // retrieve the dropped element's stored Event Object
	            var originalEventObject = $(this).data('eventObject');
	
	            // we need to copy it, so that multiple events don't have a reference to the same object
	            var copiedEventObject = $.extend({}, originalEventObject);
	
	            // assign it the date that was reported
	            copiedEventObject.start = date;
	            copiedEventObject.allDay = allDay;
	
	            // render the event on the calendar
	            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
	            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
	
	            // is the "remove after drop" checkbox checked?
	            if ($('#drop-remove').is(':checked')) {
	                // if so, remove the element from the "Draggable Events" list
	                $(this).remove();
	            }
	
	        },
	        select: function (start, end, allDay) {
	            var title = prompt('<s:text name="leave.calendar.label.event.title"/>');
	            if (title) {
	                calendar.fullCalendar('renderEvent', {
	                        title: title,
	                        start: start,
	                        end: end,
	                        allDay: allDay
	                    }, true // make the event "stick"
	                );
	            }
	            calendar.fullCalendar('unselect');
	        },
	        events:function( start, end, callback ) {
	            var year  = end.getFullYear();
	            var month = end.getMonth();
			    $.ajax({
                    url: "Leave.calendarDate.do?current_year="+year+"&current_month="+month,
                    dataType: 'json',
                    type: 'POST',
                    success: function( response ) {
                        callback(response);
                    }
                });
	        },
	        eventRender: function (event, element, icon) {
	            if (!event.description == "") {
	                element.find('.fc-event-title').append("<br/><span class='ultra-light'>" + event.description +
	                    "</span>");
	            }
	            if (!event.icon == "") {
	                element.find('.fc-event-title').append("<i class='air air-top-right fa " + event.icon +
	                    " '></i>");
	            }
	        },
	        windowResize: function (event, ui) {
	            $('#calendar').fullCalendar('render');
	        }
	    });
	
	    /* hide default buttons */
	    $('.fc-header-right, .fc-header-center').hide();
	}
	
	
	$('#calendar-buttons #btn-prev').click(function () {
	    $('.fc-button-prev').click();
	    return true;
	});
	
	$('#calendar-buttons #btn-next').click(function (calEvent) {
	    $('.fc-button-next').click();
	    return true;
	});	
	
	$('#calendar-buttons #btn-today').click(function () {
	    $('.fc-button-today').click();
	    return false;
	});
	
	$('#mt').click(function () {
	    $('#calendar').fullCalendar('changeView', 'month');
	});
	
	$('#ag').click(function () {
	    $('#calendar').fullCalendar('changeView', 'agendaWeek');
	});
	
	$('#td').click(function () {
	    $('#calendar').fullCalendar('changeView', 'agendaDay');
	});

	$('#calendar-buttons #btn-prev').click(function () {
	    $('.fc-button-prev').click();
	    return true;
	});
	
	$('#calendar-buttons #btn-next').click(function (calEvent) {
	    $('.fc-button-next').click();
	    return true;
	});	
	
	$('#calendar-buttons #btn-today').click(function () {
	    $('.fc-button-today').click();
	    return false;
	});
	
	$('#mt').click(function () {
	    $('#calendar').fullCalendar('changeView', 'month');
	});
	
	$('#ag').click(function () {
	    $('#calendar').fullCalendar('changeView', 'agendaWeek');
	});
	
	$('#td').click(function () {
	    $('#calendar').fullCalendar('changeView', 'agendaDay');
	});

	$('#addevent').click(function () {
		alert("addevent");
	});
	
	$('#event\\.startTime').datetimepicker({
		lang: 'al',
		format: 'd.m.Y H:i',
		mask: true,
		onShow:function( ct ){
			this.setOptions({
		      minTime:'07:00',
		      maxTime:'20:00'
	    	});
		}
	});
	
	$('#event\\.endTime').datetimepicker({
		lang: 'al',
		format: 'd.m.Y H:i',
		mask: true,
		onShow:function( ct ){
			this.setOptions({
		      minTime:'07:00',
		      maxTime:'20:00'
		    });
		}
	});

	
	/*
	 * CHAT
	 */
	
	$.filter_input = $('#filter-chat-list');
	$.chat_users_container = $('#chat-container > .chat-list-body')
	$.chat_users = $('#chat-users')
	$.chat_list_btn = $('#chat-container > .chat-list-open-close');
	$.chat_body = $('#chat-body');
	
	/*
	 * LIST FILTER (CHAT)
	 */
	
	// custom css expression for a case-insensitive contains()
	jQuery.expr[':'].Contains = function (a, i, m) {
	    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
	};
	
	function listFilter(list) { // header is any element, list is an unordered list
	    // create and add the filter form to the header
	
	    $.filter_input.change(function () {
	        var filter = $(this).val();
	        if (filter) {
	            // this finds all links in a list that contain the input,
	            // and hide the ones not containing the input while showing the ones that do
	            $.chat_users.find("a:not(:Contains(" + filter + "))").parent().slideUp();
	            $.chat_users.find("a:Contains(" + filter + ")").parent().slideDown();
	        } else {
	            $.chat_users.find("li").slideDown();
	        }
	        return false;
	    }).keyup(function () {
	        // fire the above change event after every letter
	        $(this).change();
	
	    });
	
	}
	
	// on dom ready
	listFilter($.chat_users);
	
	// open chat list
	$.chat_list_btn.click(function () {
	    $(this).parent('#chat-container').toggleClass('open');
	})
/*	
	$.chat_body.animate({
	    scrollTop: $.chat_body[0].scrollHeight
	}, 500);*/
	
	
	
	/*milaim*/
	
	
	
	// end milaim 
</script>
