<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<style type="text/css">
/* General settings test */
/* The map and the location bar */
	
	#map_seed {
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
	<div class="widget-body" id="seedactivity_plan_page_content">
	<!-- start tab content -->
		<div class="tab-content">
		<!-- 	start row -->
			<div class="row">
<!-- 			start planting form  -->
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
		       		<div class="jarviswidget jarviswidget-color-green" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false"  data-widget-collapsed="true">
		       			<header>
							<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
							<h2><s:text name="annual.plan.seedling"/></h2>	
						</header>
						<div>
							<div class="widget-body no-padding">
								<div id="seedactivity_form_content">
									<jsp:include page="seedactivity_form.jsp"></jsp:include>	
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
						</header>
						<div>
						<div class="no-padding">
							<div class="widget-body ">
								<div class="widget-toolbar pull-left no-border" id="mapcontrols-widget">
									<div id="mapcontrols" class="olControlEditingToolbar"></div>
								</div>
								<div class="widget-toolbar pull-left no-border" id="panel1-widget">
									<div id="panel1"></div>
								</div>
								<div class="widget-toolbar pull-right no-border" id="coordbar-widget">
									<div class="label label-warning" style="width: 100%;">
										<span id="scale"></span>
									</div>
								</div>	
								<div class="widget-toolbar pull-right no-border" id="coordbar-widget">
									<div class="label label-warning" style="width: 100%;">
										<span id="coordbar"></span>
									</div>
								</div>
							<div  id="map_seed" class="map_seed"></div>
								<jsp:include page="seedactivity_map.jsp"></jsp:include>
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
	</div>
	<!-- end widget content -->
<!-- end widget div -->


<script type="text/javascript">
	pageSetUp();
	
	init();
	var c="<s:property value='isForestInstituteUser()'/>";
	var activity_status=$("#seedActivity\\.activityStatus\\.status").val();
	if(activity_status=='SUBMITTED' || activity_status=='REJECTED' || c=='false'){
		$("#mapcontrols").html('');
	}
	if(activity_status=='APPROVED' && $("#implementPlanedGeom").val()){
		loadImplementFeature($("#seedActivity\\.id").val());
	}else{
		loadPlanFeature($("#seedActivity\\.id").val());
	}
	
	$(document).ready(function() {
	});

	
</script>