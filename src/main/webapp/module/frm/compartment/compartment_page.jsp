<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
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
.vsplitter{
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
#vmap{
	float: left; 
	width: 50% !important; 
	height: 100%;
	position: relative;
}

#map_comp {
	clear: both;
	position: relative;
	width: auto;
	height: 700px;
	border: 0px solid black;
}
@media (max-width: 800px){
	
	#ctabs{
		clear:both !important;
		position: relative !important;
		width: 100% !important;
	}
	
	.vsplitter{
 		display: none !important;
	}
	#vmap{
		width:100% !important;
	}
	#map_content_comp {
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
	<input id="mu_id" name="mu_id" value="<s:property value='mu_id'/>" type="hidden">
	<input id="region_id" name="region_id" value="<s:property value='region_id'/>" type="hidden">
	<input id="mup_id" name="mup_id" value="<s:property value='mup_id'/>" type="hidden">
	<input id="comp_id" name="comp_id" value="<s:property value='comp_id'/>" type="hidden">
	<input id="mun_id" name="mun_id" value="<s:property value='mun_id'/>" type="hidden">
	<input id="mun_name" name="mun_name" value="<s:property value='mun_name'/>" type="hidden">
	<input id="standId" name="standId" value="<s:property value='standId'/>" type="hidden">
	<input id="printLayers" name="printLayers" value="<s:property value='printLayers'/>" class="form-control" type="hidden">
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
						
<!-- 						<div class="widget-toolbar"> -->
<!-- 							<div class="btn-group"> -->
<!-- 								<button class="btn dropdown-toggle btn-xs btn-success" data-toggle="dropdown"> -->
<!-- 									Print <i class="fa fa-caret-down"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
				
						<div class="widget-toolbar  pull-left no-border">
	
		                    <div>
					            <a class="dropdown-toggle" href="#" data-toggle="dropdown" id="navLogin"   rel="tooltip" data-placement="bottom" title="Snapping Setting">
					            	<i class="icon-append fa fa-cogs"></i>
					            </a>
					            	
					            <div id="snappbox" class="dropdown-menu pull-right">
					            	<li class="dropdown" id="snapDD">
					            		<div>
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
<!-- 				    	<div class="widget-toolbar  pull-left no-border"> -->
	
<!-- 		                    <div> -->
<!-- 					            <a class="dropdown-toggle" href="#" data-toggle="dropdown" id="navLogin"   rel="tooltip" data-placement="bottom" title="Snapping Setting"> -->
<!-- 					            	<i class="icon-append fa fa-cogs"></i> -->
<!-- 					            </a> -->
					            	
<!-- 					            <div id="snappPr" class="dropdown-menu pull-left"> -->
<!-- 					            	<li class="dropdown" id="snapPrint" > -->
<%-- 					            		<jsp:include page="../../fal/print_test.jsp"></jsp:include> --%>
<!-- 									</li>	 -->
<!-- 			                    </div>	 -->
<!-- 					   	 	</div> -->
<!-- 				    	</div>	 -->
				    	
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
				
				<div id="vpage_splitter" style="width: auto; height: 100%; padding-right: 0px;">
					<div id="vmap" > 
						<div id="map_content_comp" style="float: left; width: 95%; height: 100%;"> 
							<div class="widget-body no-padding">
<!-- 								<div  id="map_comp" class="map_comp"></div> -->
									<jsp:include page="compartment_map.jsp"></jsp:include>
							</div>
						</div>
					</div>
					<div id="ctabs" style="border: none; float: right; width: 50%; height: 98%;  font-size:90%;">	
					    <div class="jarviswidget jarviswidget-color-blueLight" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false"  data-widget-collapsed="true" style="margin-bottom: 0px;">
					       	<header>
					       	<div class="widget-toolbar">
						<!-- add: non-hidden - to disable auto hide -->
								<div class="btn-group">
									<button class="btn dropdown-toggle btn-xs btn-success" data-toggle="dropdown">
										<span id="scale"></span> <i class="fa fa-caret-down"></i>
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
								<div class="widget-toolbar">
								<!-- add: non-hidden - to disable auto hide -->
									 <select id="projection">
										  <option value="EPSG:900916">KosovaRef: 900916</option>
									      <option value="EPSG:4326">WGS: 4326</option>
									      <option value="EPSG:900913">GoogleMap: 900913</option>
								    </select>
								</div>
								<div class="widget-toolbar" id="coordbar-widget">
									<div class="label label-warning" style="width: 100%;">
										<span id="coordbar"></span>
									</div>
								</div>
							</header>
						</div>
						<div id="com_tab" style="border: none;">
							<ul>
								<li id="mUnitTab">
									<a href="#munit_tab"><i class="fa fa-fw fa-sm fa-search "></i><s:text name="frm.compartment.mgmt.unit"/></a>
								</li>
								<li id="compTab">
									<a href="#compartment_tab"><i class="fa fa-fw fa-sm fa-search "></i><s:text name="frm.stand.compartment"/></a>
								</li>
								<li id="standTab">
									<a href="#stand_tab"><i class="fa fa-fw fa-sm fa-user"></i><s:text name="frm.stand.stand"/></a>
								</li>
								<li id="lineImportTab">
									<a href="#line_import_tab"><i class="fa fa-fw fa-sm fa-cloud"></i><s:text name="frm.line.import.tab"/></a>
								</li>
								<li id="layersgridTab">
									<a href="#layers_grid_tab"><i class="fa fa-fw fa-sm fa-cloud"></i><s:text name="frm.layers.tab"/></a>
								</li>
								<li id="searchTab">
									<a href="#search_tab"><i class="fa fa-fw fa-sm fa-print"></i><s:text name="frm.compartment.tab.search"/></a>
								</li>
								<li id="altitudeProfileTab">
									<a href="#profile_tab"><i class="fa fa-fw fa-sm fa-print"></i><s:text name="frm.compartment.tab.profile"/></a>
								</li>
							</ul>
							<div id="munit_tab" style="height: 100%;">
								<jsp:include page="../managementunit/management_unit_grid.jsp"></jsp:include>
							</div>
							<div id="compartment_tab" style="height: 100%;">
							
							</div>
							<div id="stand_tab" style="height: 100%;">

							</div>
							<div id="line_import_tab" style="height: 100%;">

							</div>
							<div id="layers_grid_tab" style="height: 100%;">

							</div>
							<div id="search_tab">

							</div>
							<div id="profile_tab">
								<jsp:include page="altitude_profile.jsp"></jsp:include>
							</div>
						</div>	
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
	 function toolsToEditCompartments(polygonControls){
	 	 map.removeControl(wigdet_panel);
	 	 wigdet_panel = new OpenLayers.Control.Panel({'displayClass': 'olControlEditingToolbar', 'div': OpenLayers.Util.getElement('mapcontrols')});
	         for(var key in controlEdit){
	         	wigdet_panel.addControls([controlEdit[key]]);
	             }
	         if(polygonControls==false){
					for(var key in controlEditLine){
						wigdet_panel.addControls([controlEditLine[key]]);
					}
	         }else{
	         	for(var key in controlEditPolygon){
						wigdet_panel.addControls([controlEditPolygon[key]]);
					}
	         }
			 map.addControl(wigdet_panel );
	 };
	 
	 $(document).ready(function () {	
		$("#printPopup").on("click",function(){
			var link = "PrintMap.form.do";
			openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,180);
		});
	 });
	$('#vpage_splitter').css({width: '100%', height: '100%'}).split({orientation: 'vertical', position:'50%'});

	var $tabs = $('#com_tab').tabs({
		activate: function(event ,ui){
    		var actNr = $("#com_tab").tabs("option", "active");
    		$("#drawRoadId").hide();
    		$("#modifyRoadId").hide();
    		if(actNr==0){
    			$( "#com_tab" ).tabs( "disable", 1 );
    			$( "#com_tab" ).tabs( "disable", 2 );
    			$("#mup_id").val(null);
    			$("#comp_id").val(null);
    			$("#standId").val(null);
    			var link = "ManagementUnit.grid.do";
	        	loadURL(link, $("#munit_tab"));
	        	$( "#com_tab" ).tabs( "disable", 6 );
	        	featureEdit.removeAllFeatures();
	        	vectorLayer.removeAllFeatures();
	        	$("#drawRoadId").hide();
	    		$("#modifyRoadId").hide();
	    		toolsToEditCompartments(true);
	    		splitFeature="";
        	}else if(actNr==1){
        		$("#comp_id").val(null);
    			$("#standId").val(null);
				var link = "Compartment.grid.do?mu_id=" + $("#mu_id").val()+"&mup_id="+$("#mup_id").val();
				$( "#com_tab" ).tabs( "disable", 2 );
	        	loadURL(link, $("#compartment_tab"));
	        	$( "#com_tab" ).tabs( "disable", 6 );
	        	featureEdit.removeAllFeatures();
	        	vectorLayer.removeAllFeatures();
	        	$("#drawRoadId").hide();
	    		$("#modifyRoadId").hide();
	    		toolsToEditCompartments(true);
	    		splitFeature="";
	        	
			}else if(actNr==2){
				var link = "Stand.grid.do?compId=" + $("#comp_id").val()+"&mupId=" + $("#mup_id").val()+"&standId="+$("#standId").val();
	        	loadURL(link, $("#stand_tab"));
	        	$("#standId").val(null);
	        	$( "#com_tab" ).tabs( "disable", 6 );
	        	featureEdit.removeAllFeatures();
	        	vectorLayer.removeAllFeatures();
	        	$("#drawRoadId").hide();
	    		$("#modifyRoadId").hide();
	    		toolsToEditCompartments(true);
	    		
			}
			else if(actNr==3){
				window.dispatchEvent(new Event('resize'));
				var link = "ImportLine.page.do?";
	        	loadURL(link, $("#line_import_tab"));
	        	$("#com_tab").tabs( "disable", 6 );
	        	featureEdit.removeAllFeatures();
	        	vectorLayer.removeAllFeatures();
	        	$("#drawRoadId").show();
	    		$("#modifyRoadId").show();
	    		toolsToEditCompartments(false);
	    		splitFeature="";
	    		
			}
			else if(actNr==4){
				window.dispatchEvent(new Event('resize'));
				var link = "Compartment.layersgrid.do?";
	        	loadURL(link, $("#layers_grid_tab"));
	        	$("#com_tab").tabs( "disable", 6 );
	        	featureEdit.removeAllFeatures();
	        	vectorLayer.removeAllFeatures();
	        	$("#drawRoadId").hide();
	    		$("#modifyRoadId").hide();
	    		toolsToEditCompartments(true);
	    		splitFeature="";
			}
			else if(actNr==5){
				window.dispatchEvent(new Event('resize'));
				var link = "Stand.search.do?";
	        	loadURL(link, $("#search_tab"));
	        	$("#com_tab").tabs( "disable", 6 );
	        	featureEdit.removeAllFeatures();
	        	vectorLayer.removeAllFeatures();
	        	$("#drawRoadId").hide();
	    		$("#modifyRoadId").hide();
	    		toolsToEditCompartments(true);
	    		splitFeature="";
	    		
			}
			else if(actNr==6){
				window.dispatchEvent(new Event('resize'));
				$("#drawRoadId").hide();
	    		$("#modifyRoadId").hide();
	    		toolsToEditCompartments(true);
	    		splitFeature="";
			}
        }
    });	

    //start page with compTab and standTab disabled
	$( "#com_tab" ).tabs( "disable", 1 );
	$( "#com_tab" ).tabs( "disable", 2 );
// 	$( "#com_tab" ).tabs( "disable", 6 );
    window.dispatchEvent(new Event('resize'));

//     $(document).ready(function (){
// 	    var layerForPprint = printLayers();
// 		$("#printLayers").val(layerForPprint);
// 		alert($("#printLayers").val());
//     });
</script>
</div>
</body>
</html>
