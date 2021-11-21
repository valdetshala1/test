<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<style type="text/css">
/* General settings test */
/* The map and the location bar */
	#map_m {
		clear: both;
		position: relative;
		width: auto;
		height: 700px;
		border: 0px solid black;
	}
	
	#map_act {
		clear: both;
		position: relative;
		width: auto;
		height: 700px;
		border: 0px solid black;
	}
</style>
<!-- widget div-->


	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
	<!-- start tab content -->
		<div class="tab-content">
		<!-- 	start row -->
			<div class="row">
<!-- 			start planting form  -->
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
		       		<div class="jarviswidget jarviswidget-color-green" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false"  data-widget-collapsed="true">
		       			<header>
							<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
							<h2><s:text name="annual.plan.planting"/></h2>	
						</header>
						<div>
							<div class="widget-body no-padding">
								<div id="plan_content_planting">
									<jsp:include page="stand_planting_form.jsp"></jsp:include>	
								</div>					
							</div>
						</div>
					</div>
<!-- 					end planting form -->
		      	</div>
<!-- 		      	start stand details -->
		      	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
      				<div class="jarviswidget jarviswidget-color-green" id="wid-id-2" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-collapsed="true">
						<header>
							<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
							<h2><s:text name="dashboard.forest.map"/></h2>
								<div class="widget-toolbar pull-right no-border" id="coordbar-widget">
								<div class="label label-warning" style="width: 100%;">
										<span id="scale"></span>
									</div>
								</div>	
								<div class="widget-toolbar pull-right no-border" id="coordbar-widget">
									<div class="label label-warning">
										<span id="coordbar"></span>
									</div>
								</div>
						</header>
						<div>
						<div class="no-padding">
							<ul class="nav nav-tabs tabs-pull-left"   id="plantboard">
								<li class="active">
									<a class="tab-color" href="#standmapTab"  data-toggle="tab"><s:text name='home.page.map'/></a>
								</li>
								<li>
									<a class="tab-color" href="Stand.form.do?standId=<s:property value='stand.id'/>" role="tab" data-target="#plantstandDataTab" data-toggle="boardajax"><s:text name='law.suit.label.stand'/> </a>
								</li>
								<li>
									<a class="tab-color"  href="StandTreatment.page.do?standId=<s:property value='stand.id'/>" role="tab" data-target="#planttreatmentsTab" data-toggle="boardajax"><s:text name='frm.stand.treatment.name.label'/> </a>
								</li>
								<li>
									<a class="tab-color"  href="StandBiodiversity.page.do?standId=<s:property value='stand.id'/>"  role="tab" data-target="#plantbiodiversityTab" data-toggle="boardajax"><s:text name='frm.stand.biodiversity.name.label'/> </a>
								</li>
								<li>
									<a class="tab-color"  href="Audit.auditDataGeom.do?entity_name=Activity&entity_id=<s:property value='activity.id'/>"  role="tab" data-target="#auditTab" data-toggle="boardajax"><s:text name='audit.title'/></a>
								</li>
							</ul>
							<div class="tab-content no-padding">
								<!-- start map tab -->
									<div class="tab-pane fade in active" id="standmapTab">
												<div class="widget-body">
													<div class="widget-toolbar pull-left no-border" id="mapcontrols-widget">
														<div id="mapcontrols" class="olControlEditingToolbar"></div>
													</div>
													<div class="widget-toolbar pull-left no-border">
														<span class="onoffswitch-title" rel="tooltip" data-placement="bottom" title="Krahasimi Ortofotove"><i class="fa fa-info "></i></span>
														<span class="onoffswitch">
															<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox"  id="infoON" 
															onclick="infoOnOf(this);"/>
														<label class="onoffswitch-label" for="infoON"> <span class="onoffswitch-inner" data-swchon-text="On" data-swchoff-text="Off"></span> <span class="onoffswitch-switch"></span> </label> </span>
													</div>
													<div class="widget-toolbar pull-left no-border" id="panel1-widget">
														<div id="panel1"></div>
													</div>
													<a  id="printPopup"  class="widget-toolbar  pull-left no-border">
														<i class="fa fa-print"></i>
													</a>
													<s:if test="activity.id!=null">
														<a  id="exportBtn"  title="<s:text name='export.shape.file'/>" onclick="exportShape('id',<s:property value='activity.id'/>,'ex_v_annual_planning_activity_detail','zip','Shapefile');" class="widget-toolbar  pull-left no-border">
															<i class="fa fa-share-alt"></i>
														</a>	
													</s:if>	
													<div class="widget-toolbar">
														 <select id="projection">
															  <option value="EPSG:900916">KosovaRef: 900916</option>
														      <option value="EPSG:4326">WGS:4326</option>
														      <option value="EPSG:900913">GoogleMap: 900913</option>
													    </select>
													</div>
												
												
							<div class="widget-toolbar  pull-left no-border">
	
		                    <div>
					            <a class="dropdown-toggle" href="#" data-toggle="dropdown" id="navLogin"   rel="tooltip" data-placement="bottom" title="Snapping Setting">
					            	<i class="icon-append fa fa-cogs"></i>
					            </a>
					            	
					            <div id="snappbox" class="dropdown-menu pull-right">
						            <ul>	
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
															</tbody>
														</table>
													</div>
												</form>
											</div>
										</li>
									</ul>	
			                    </div>	
			                    
					   	 	</div>
				    
				    	</div>	
													<div  id="map_act" class="map_act"></div>
													<jsp:include page="planting_map.jsp"></jsp:include>
												</div>
									</div>
								<!-- end map tab -->
								<!-- start stand data tab -->
									<div class="tab-pane fade" id="plantstandDataTab">
									</div>
								<!-- end stand data tab -->
								<!-- start treatments tab -->
									<div class="tab-pane fade " id="planttreatmentsTab">
							                  
									</div>
								<!-- end treatments tab -->
								<!-- start biodiversity tab -->
									<div class="tab-pane fade" id="plantbiodiversityTab">
							                
									</div>
								<!-- end biodiversity tab -->
								<!-- start auditTab tab -->
									<div class="tab-pane fade" id="auditTab">
									</div>
								<!-- end auditTab tab -->
								
							</div>
						
						</div>
	
					
				</div>
 
				<!-- end widget div -->
				
			</div>
      </div>
      
		    <!-- 	end row -->
			</div>
		<!-- end tab content -->
		</div>
		<div class="col-xs-10 col-sm-6">
<!-- 		<fieldset> -->
<%-- 			<jsp:include page="stand_planting_form.jsp"></jsp:include>						 --%>
<!-- 		</fieldset> -->
<!-- 		</div> -->
<!-- 		 <div class="col-xs-4 col-sm-6">	 -->
<!-- 		<fieldset> -->
<%-- 			<jsp:include page="../../stand/stand_form.jsp"></jsp:include> --%>
<!-- 		</fieldset> -->
		</div>
		
		
	</div>
	<!-- end widget content -->
<!-- end widget div -->


<script type="text/javascript">
	pageSetUp();
	
	init();
	initSnap();
	var implNumber=0;//number of impl grid elements
	function infoOnOf(element) {
 	    if (element.checked) {
 	    	showInfo=true;
 	    } else {
 	    	showInfo=false;
 	    }
 	} 
	var c="<s:property value='user.getOperationalLevelVal()'/>";
	if(c=="C" || c=="M" || ("<s:property value='activityStatus.status.getDOMVALUE()'/>"=='SUBMITTED' || "<s:property value='activityStatus.status.getDOMVALUE()'/>"=='REJECTED')){
		$("#mapcontrols-widget").html('');
	}
	function handleResize(){
		$("#plantboard > li").show();
		$("#plantboard .dropdown").hide();
		$("#plantboard .dropdown-menu li").hide();
		 
		var width = $("#plantboard").width();
		var tmpWidth = 0;
		var moreWidth = 80;
		$("#plantboard > li").each(function(){
			tmpWidth += $(this).width();
			if (tmpWidth+moreWidth > width){
				$(this).hide();
				$("#plantboard > .dropdown").show();
				$("#plantboard .dropdown-menu li a[href='"+$(this).find('a').attr('href')+"']").parent().show();
			}
			return;
		});
	}
	var activity_status=$("#planting\\.activityStatus\\.status").val();
	if(activity_status==''){
		loadStandPlantFeature('<s:property value='stand.id'/>');
	}
// 	else if(activity_status=='APPROVED' && $("#implementPlanedGeom").val()){
// 		loadImplementFeature($("#planting\\.id").val());
// 	}
	else{
		loadPlanFeature($("#planting\\.id").val());
	}


	
	function addRow(){
		$im_area='';
		if(rowId!=0){
			$("#planting_declare").jqGrid('saveRow', rowId);
			$im_area=jQuery('#planting_declare').jqGrid ('getCell', rowId, 'im_area');
		}
		if(rowId==0 || $im_area!=''){
			$("#planting_declare").jqGrid('saveRow', rowId);
			   rowId++;
			   var parameters =
		        {
		            rowID: rowId,
		            initdata: {
		            },
		            position: "last",
		            useDefValues: true,
		            useFormatter: false,
		            addRowParams: { extraparam: {} }
		        };
	
		    $("#planting_declare").jqGrid('addRow', parameters);
		    $("#planting_declare").jqGrid('setGridParam', {editable: true});    	   
		}
	}
	function setArea(area){
		 $("#planting_declare").jqGrid('setCell',rowId,'im_area', area);
	 }
	 
	$(document).ready(function() {
		$("#printPopup").on("click",function(){
			var link = "PrintMap.print_a.do";
			openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,150);
		});

		$('[data-toggle="boardajax"]').click(function(e) {
		    var $this = $(this),
		        loadurl = $this.attr('href'),
		        targ = $this.attr('data-target');
	
		    $.get(loadurl, function(data) {
		        $(targ).html(data);
		    });
		    
		    $this.tab('show');
		    $("#plantboard > .dropdown .dropdown-menu").hide();
		    return false;
		});
		
	    $('#stand_form :input').attr('readonly','readonly');
	    $('#stand_form :button').hide();
	    $('#stand_form :button').attr('disabled','disabled');
	    $('#stand_form select').attr('disabled','disabled');
	    $("#hide_in_plan").hide();
	    $("#fields_to_hide").hide();
	    
		if($("#compId").val()){
			$("#stand\\.compartment\\.id").val($("#compId").val());
		}
	});

	$(window).load(function(){
		implNumber = $("#planting_declare").getRowData().length;
	});

	
</script>