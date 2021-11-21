<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>

<style>
.widget-toolbar {
    display: inline-block;
    float: right;
    width: auto;
    height: 32px;
    line-height: 32px;
    position: relative;
    border-left: 1px solid rgba(0, 0, 0, .09);
    cursor: pointer;
    padding: 0 8px;
    text-align: center;
}
.tzgspliter{
	left: 49% !important;
	display: none;
}
.no-padding {
    padding: 0!important;
}
.no-padding>pre {
    margin: 30px;
}
.splitter_panel .right_panel{
    position: absolute;
}
.splitter_panel .right_panel {
    right: 1.3% !important;
}
#tzgmap{
	float: left; 
	width: 50% !important; 
	height: 100%;
	position: relative;
}

#map_tzg {
	clear: both;
	position: relative;
	width: auto;
	height: 700px;
	border: 0px solid black;
}
@media (max-width: 800px){
	
	#tzgform{
		clear:both !important;
		position: relative !important;
		width: 100% !important;
	}
	
	.tzgspliter{
 		display: none !important;
	}
	#tzgmap{
		width:100% !important;
	}
	#map_content_tzg {
		width:98% !important;
	}
}
</style>
<head>
</head>
<body>    		    
<div id="container">

<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-compartment-map" data-widget-fullscreenbutton="true" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
<%-- 					<span class="widget-icon"> <i class="fa fa-eye"></i></span> --%>
<%-- 					<h2><s:text name="frm.compartment.data.grid"/></h2> --%>

						<div class="widget-toolbar pull-left no-border" id="mapcontrols-widget">
							<div id="mapcontrols" class="olControlEditingToolbar"></div>
						</div>
						<div class="widget-toolbar pull-left no-border" id="panel1-widget" style="margin-left: -17px;">
							<div id="panel1"></div>
						</div>
						
						<div class="widget-toolbar">
						<!-- add: non-hidden - to disable auto hide -->
							<div class="btn-group">
								<button class="btn dropdown-toggle btn-xs btn-success" data-toggle="dropdown">
									<span id="scale_tzg"></span> <i class="fa fa-caret-down"></i>
								</button>
								<ul class="dropdown-menu pull-right js-status-update">
									<li>
										<a href="javascript:scaleToSpecific(1000000);"><i class="fa fa-circle txt-color-green"></i> 1:1000000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(500000);"><i class="fa fa-circle txt-color-green"></i> 1:500000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(250000);"><i class="fa fa-circle txt-color-green"></i> 1:250000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(125000);"><i class="fa fa-circle txt-color-green"></i> 1:125000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(100000);"><i class="fa fa-circle txt-color-green"></i> 1:100000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(75000);"><i class="fa fa-circle txt-color-green"></i> 1:75000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(50000);"><i class="fa fa-circle txt-color-green"></i> 1:50000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(25000);"><i class="fa fa-circle txt-color-green"></i> 1:25000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(10000);"><i class="fa fa-circle txt-color-green"></i> 1:10000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(5000);"><i class="fa fa-circle txt-color-green"></i> 1:5000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(2000);"><i class="fa fa-circle txt-color-green"></i> 1:2000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(1000);"><i class="fa fa-circle txt-color-green"></i> 1:1000</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(500);"><i class="fa fa-circle txt-color-green"></i> 1:500</a>
									</li>
									<li>
										<a href="javascript:scaleToSpecific(250);"><i class="fa fa-circle txt-color-green"></i> 1:250</a>
									</li>
								</ul>
							</div>
						</div>
						
<!-- 						<div class="widget-toolbar"> -->
<!-- 							<div class="btn-group"> -->
<!-- 								<button class="btn dropdown-toggle btn-xs btn-success" data-toggle="dropdown"> -->
<!-- 									Print <i class="fa fa-caret-down"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
						<div class="widget-toolbar" id="coordbar-widget">
						
							<div class="label label-warning" style="width: 100%;">
								<span id="coordbar"></span>
							</div>
						</div>
						
						<div class="widget-toolbar">
						<!-- add: non-hidden - to disable auto hide -->
							 <select id="projection_tzg">
							   <option value="EPSG:900916">KosovaRef: 900916</option>
						      <option value="EPSG:4326">WGS: 4326</option>
						      <option value="EPSG:900913">GoogleMap: 900913</option>
						    </select>
						</div>
						
					
						<div class="widget-toolbar  pull-left no-border">
	
		                    <div>
					            <a class="dropdown-toggle" href="#" data-toggle="dropdown" id="nav_tzg"   rel="tooltip" data-placement="bottom" title="Snapping Setting">
					            	<i class="icon-append fa fa-cogs"></i>
					            </a>
					            	
					            <div id="snappbox" class="dropdown-menu pull-right">
					            	<li class="dropdown" id="snap_tzg">
					            		<div  >
											<form action="" id="snapp-form" class="smart-form" novalidate="novalidate">
												<div class="table-responsive">
													<input type="checkbox" id="snap_toggle" />
													<label>Snapping Setting</label>
														<table class="table table-bordered" id="snap_options">
															<thead>
																<tr>
																	<th>layers</th>
																	<th>node</th>
																	<th>vertex</th>
																	<th>edge</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>vectorLayer</td>
																	<td><input type="checkbox" id="0_node" /><input id="0_nodeTolerance" type="text" size="3" /></td>
																	<td><input type="checkbox" id="0_vertex" /><input id="0_vertexTolerance" type="text" size="3" /></td>
																	<td><input type="checkbox" id="0_edge" /><input id="0_edgeTolerance" type="text" size="3" /></td>
																</tr>
																<tr>
													                <td>vgis_stand_active</td>
													                <td><input type="checkbox" id="1_node" /><input id="1_nodeTolerance" type="text" size="3" /></td>
													                <td><input type="checkbox" id="1_vertex" /><input id="1_vertexTolerance" type="text" size="3" /></td>
													                <td><input type="checkbox" id="1_edge" /><input id="1_edgeTolerance" type="text" size="3" /></td>
													            </tr>
													            <tr>
													                <td>Tracking </td>
													                <td><input type="checkbox" id="2_node" /><input id="2_nodeTolerance" type="text" size="3" /></td>
													                <td><input type="checkbox" id="2_vertex" /><input id="2_vertexTolerance" type="text" size="3" /></td>
													                <td><input type="checkbox" id="2_edge" /><input id="2_edgeTolerance" type="text" size="3" /></td>
													            </tr>
													            <tr>
													                <td>GPS </td>
													                <td><input type="checkbox" id="3_node" /><input id="3_nodeTolerance" type="text" size="3" /></td>
													                <td><input type="checkbox" id="3_vertex" /><input id="3_vertexTolerance" type="text" size="3" /></td>
													                <td><input type="checkbox" id="3_edge" /><input id="3_edgeTolerance" type="text" size="3" /></td>
													            </tr>													            
															</tbody>
														</table>
												</div>
											</form>
										</div>
									</li>	
			                    </div>	
					   	 	</div>
				    	</div>		
				    	
						<a  id="printPopup"  class="widget-toolbar  pull-left no-border">
							<i class="fa fa-print"></i>
						</a>
				    	
				    	<div class="widget-toolbar pull-left no-border">
					    	<div class="widget-toolbar pull-left no-border">
								<span class="onoffswitch-title" rel="tooltip" data-placement="bottom" title="Krahasimi Ortofotove"><i class="fa fa-info "></i></span>
								<span class="onoffswitch">
									<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox"  id="infoON" 
									onclick="infoOnOf(this);"/>
									<label class="onoffswitch-label" for="infoON"> <span class="onoffswitch-inner" data-swchon-text="On" data-swchoff-text="Off"></span> <span class="onoffswitch-switch"></span> </label> </span>
							</div>
						</div>
				</header>
				
				<div id="tzg_spliter" style="width: auto; height: 100%; padding-right: 0px;">
					<div id="tzgmap" > 
						<div id="map_content_tzg" style="float: left; width: 95%; height: 100%;"> 
							<div class="widget-body no-padding">
								<jsp:include page="tourist_zone_geoms_map.jsp"></jsp:include>
							</div>
						</div>
					</div>
					<div id="tzgform" class="row">	
					<br/>
						<article class="col-sm-12">
<!-- 						<div id="data_tzg" style="float: left; width: 95%; height: 100%;">  -->
							<div class="widget-body no-padding">
								<jsp:include page="tourist_zone_geoms_grid.jsp"></jsp:include>
							</div>
<!-- 						</div> -->
						</article>
					</div>
				</div>
			</div>
		</article>
		<!-- END NEW WIDGET -->
		</div>
	<!-- end row -->
</section>	
<!-- end widget grid -->
<script type="text/javascript">
	init();
	initSnap();
	
	$('#tzg_spliter').css({width: '100%', height: '100%'}).split({orientation: 'vertical', position:'50%'});
  
    window.dispatchEvent(new Event('resize'));
    $(document).ready(function() {
    	$("#printPopup").on("click",function(){
			var link = "PrintMap.form.do";
			openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,150);
		});
    });
</script>
</div>
</body>
</html>
