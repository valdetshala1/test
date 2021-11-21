<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<style type="text/css">
	/* General settings test */
	/* The map and the location bar */
#map_act {
			clear: both;
			position: relative;
			width: auto;
			height: 700px;
			border: 0px solid black;
		}
</style>
<!-- widget div-->
<div id="page_slv_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
	<input id="imSlvGeom" name="imSlvGeom" value=""	type="hidden">
	<input id="implArea" name="implArea" type="hidden">
	<!-- start tabs definition -->
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
		       <div class="jarviswidget jarviswidget-color-green" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false"  data-widget-collapsed="true">
		       	<header>
					<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
					<h2><s:text name="annual.plan.silviculture"/></h2>	
				</header>
				<div>
					<div class="widget-body no-padding">
						<jsp:include page="stand_silviculture_form.jsp"></jsp:include>						
					</div>
				</div>
			</div>
		</div>
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
      <div class="jarviswidget jarviswidget-color-green" id="wid-id-2" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-collapsed="true">
				<header>
					<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
					<h2><s:text name="dashboard.forest.map"/></h2>	
					<div class="widget-toolbar" id="coordbar-widget">
						<div class="label label-warning" style="width: 100%;">
							<span id="scale"></span>
						</div>
					</div>
					<div class="widget-toolbar" id="coordbar-widget">
						<div class="label label-warning" >
							<span id="coordbar"></span>
					</div>
					</div>
				
				</header>
				<div>
						<div class="no-padding">
							<ul class="nav nav-tabs tabs-pull-left"   id="slvboard">
								<li class="active">
									<a class="tab-color" href="#mapTab"  data-toggle="tab"><s:text name='home.page.map'/> </a>
								</li>
								<li>
									<a class="tab-color" href="Stand.form.do?standId=<s:property value='stand.id'/>" role="tab" data-target="#standDataTab" data-toggle="boardajax"><s:text name='law.suit.label.stand'/></a>
								</li>
								<li>
									<a class="tab-color"  href="StandTreatment.page.do?standId=<s:property value='stand.id'/>" role="tab" data-target="#treatmentsTab" data-toggle="boardajax"><s:text name='frm.stand.treatment.name.label'/> </a>
								</li>
								<li>
									<a class="tab-color"  href="StandBiodiversity.page.do?standId=<s:property value='stand.id'/>"  role="tab" data-target="#biodiversityTab" data-toggle="boardajax"><s:text name='frm.stand.biodiversity.name.label'/> </a>
								</li>
								<li>
									<a class="tab-color"  href="Audit.auditDataGeom.do?entity_name=Activity&entity_id=<s:property value='activity.id'/>"  role="tab" data-target="#auditTab" data-toggle="boardajax"><s:text name='audit.title'/></a>
								</li>
							</ul>
							<div class="tab-content no-padding">
								<!-- start map tab -->
									<div class="tab-pane fade in active" id="mapTab">
												
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
														<div class="widget-toolbar pull-left no-border" id="panel1-widget" style="margin-left: -17px;">
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
														<!-- add: non-hidden - to disable auto hide -->
															 <select id="projection">
																  <option value="EPSG:900916">KosovaRef: 900916</option>
															      <option value="EPSG:4326">WGS: 4326</option>
															      <option value="EPSG:900913">GoogleMap: 900913</option>
														    </select>
														</div>
													<div>
														<jsp:include page="silviculture_map.jsp"></jsp:include>
													</div>
										</div>
									</div>
								<!-- end map tab -->
								<!-- start stand data tab -->
									<div class="tab-pane fade" id="standDataTab">
									</div>
								<!-- end stand data tab -->
								<!-- start treatments tab -->
									<div class="tab-pane fade " id="treatmentsTab">
							                  
									</div>
								<!-- end treatments tab -->
								<!-- start biodiversity tab -->
									<div class="tab-pane fade" id="biodiversityTab">
							                
									</div>
									<div class="tab-pane fade" id="auditTab">
									</div>
								<!-- end biodiversity tab -->
							</div>
						
						</div>
	
					
				</div>
 
				<!-- end widget div -->
				
			</div>
      </div>
		
<!-- 	</div> -->
	<!-- end tab content -->
		
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	pageSetUp();
	init();
	var implNumber=0;
	function infoOnOf(element) {
 	    if (element.checked) {
 	    	showInfo=true;
 	    } else {
 	    	showInfo=false;
 	    }
 	}
	function handleResize(){
		$("#slvboard > li").show();
		$("#slvboard .dropdown").hide();
		$("#slvboard .dropdown-menu li").hide();
		 
		var width = $("#slvboard").width();
		var tmpWidth = 0;
		var moreWidth = 80;
		$("#slvboard > li").each(function(){
			tmpWidth += $(this).width();
			if (tmpWidth+moreWidth > width){
				$(this).hide();
				$("#slvboard > .dropdown").show();
				$("#slvboard .dropdown-menu li a[href='"+$(this).find('a').attr('href')+"']").parent().show();
			}
			return;
		});
	}
	var standslvId='<s:property value='silviculture.id'/>';
	var standId='<s:property value='stand.id'/>';

	var activity_status=$("#silviculture\\.activityStatus\\.status").val();
	if(activity_status==''){
		loadStandActFeature(standId);
	}else if(activity_status=='APPROVED' && $("#imSlvGeom").val()){
		loadImSlvFeature(standslvId);
	}else{
		loadPlSlvFeature(standslvId);
	}
	var oplevel="<s:property value='user.getOperationalLevelVal()'/>";
	if(oplevel=="C" || oplevel=="M"  || (oplevel=="R" && (activity_status=="SUBMITTED" || activity_status=="REJECTED") ) ){
		$("#mapcontrols-widget").html('');
		}
	function addRow(){
		var im_area='';
		if(rowId!=0){
			$("#silviculture_declare").jqGrid('saveRow', rowId);
			im_area=jQuery('#silviculture_declare').jqGrid ('getCell', rowId, 'im_area');
		}
		if(rowId==0 || im_area!=''){
			$("#silviculture_declare").jqGrid('saveRow', rowId);
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
			    $("#silviculture_declare").jqGrid('addRow', parameters);
			    $("#silviculture_declare").jqGrid('setGridParam', {editable: true}); 
		}
	}
	function setAreaGeom(area,rId,imGeom){
		$("#silviculture_declare").jqGrid('setCell',rId,'im_area', area);
		$("#silviculture_declare").jqGrid('setCell',rId,'im_geom', imGeom);
		 }
	$(window).load(function(){
		implNumber = $("#silviculture_declare").getRowData().length;
	});


 	
	$(document).ready(function() {
		$("#printPopup").on("click",function(){
			var link = "PrintMap.print_a.do";
			openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,150);
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
	    $(".dropdown-toggle").on("click",function(){
			$("#slvboard > .dropdown .dropdown-menu").show();
		});
		$('[data-toggle="boardajax"]').click(function(e) {
		    var $this = $(this),
		        loadurl = $this.attr('href'),
		        targ = $this.attr('data-target');
	
		    $.get(loadurl, function(data) {
		        $(targ).html(data);
		    });
		    
		    $this.tab('show');
		    $("#slvboard > .dropdown .dropdown-menu").hide();
		    return false;
		});
		
	});

	
</script>