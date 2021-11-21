<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
<style>
    .btn-file {
    position: relative;
    overflow: hidden;
    }
    .btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
    }
    
</style>
</head>
<body> 
		<!-- start wizard steps control -->
		<div class="row">
				<div id="steps_control" class="form-bootstrapWizard">
						<ul class="bootstrapWizard form-wizard">
								<li  id="validation_li_1" >
									<a  id="validation_a_1"> <span class="step" id="step_1">1</span> <span class="title"><s:text name='dem.import.shape.validation_1'/></span> </a>
								</li>
								<li  id="validation_li_2" >
									<a  id="validation_a_2"> <span class="step" id="step_2">2</span> <span class="title"><s:text name='dem.import.shape.validation_2'/></span> </a>
								</li>
								<li id="validation_li_3">
									<a  id="validation_a_3"> <span class="step" id="step_3" >3</span> <span class="title"><s:text name='dem.import.shape.validation_3'/></span> </a>
								</li>
								<li id="validation_li_4" >
									<a  id="validation_a_4"> <span class="step" id="step_4">4</span> <span class="title"><s:text name='dem.import.shape.validation_4'/></span> </a>
								</li>
								<li id="validation_li_5" >
									<a  id="validation_a_5"> <span class="step" id="step_5">5</span> <span class="title"><s:text name='dem.import.shape.validation_5'/></span> </a>
								</li>
								<li id="validation_li_6" >
									<a  id="validation_a_6"> <span class="step" id="step_6">6</span> <span class="title"><s:text name='dem.import.shape.validation_6'/> </span> </a>
								</li>
						</ul>
						<div class="clearfix"></div>
				 </div>
				 <br/>
				 <br/>
		 </div>
		<!--start include shape_overlap_stand_grid-->
				 <div id="import_plot_form_content" class="col-sm-12">
				 <jsp:include page="import_plot_form.jsp"></jsp:include>
				 </div>	
		<!--end include shape_overlap_stand_grid-->
		
		
		<!-- end  wizard control -->
				<!--start include plot_without_stand_grid-->
				 <div id="plot_without_stand_grid_content" class="col-sm-12">
				 <jsp:include page="plot_without_stand_grid.jsp"></jsp:include>
				 </div>	
		<!--end include plot_without_stand_grid-->
		<!-- end  wizard control -->
				<!--start include plot_trees_without_plot_grid-->
				 <div id="plot_trees_without_plot_grid_content" class="col-sm-12">
				 <jsp:include page="plot_trees_without_plot_grid.jsp"></jsp:include>
				 </div>	
		<!--end include plot_trees_without_plot_grid-->
		
		<!-- end  wizard control -->
				<!--start include plot_out_stand_grid-->
				 <div id="plot_out_stand_grid_content" class="col-sm-12">
				 <jsp:include page="plot_out_stand_grid.jsp"></jsp:include>
				 </div>	
		<!--end include plot_out_stand_grid-->
		
<script type="text/javascript">

function checkExistingPlots(region_code,mu_code){
	$.ajax({
		type : "GET",
		url : "ExistingPlot.do?regionCode="+region_code+"&muCode="+mu_code,
		async : false,
		beforeSend : function(jqXHR, settings) {
		},
		error : function(errorThrown, status, jqXHR) {
			alert("error:" + errorThrown + ", status:" + status);
		},
		success : function(data, status, jqXHR) {
			
			var errors = jqXHR.getResponseHeader("errors_exits");
			if(!errors){
				$.smallBox({
					title : "<s:text name="small.box.on.save.title.success"/>", 
					content : "<s:text name="small.box.content"/>", 
					color : "#739E73",
					timeout: 5000,
					icon : "fa fa-check",
					number : "1"
				});	
				$("#step_2").css("background","#34712A");
				$("#validation_li_2").removeClass("active");
				$("#validation_li_3").addClass("active");
				var url="DemGrid.plotTreesWithoutPlot.do";
				jQuery("#plot_tree_without_plot").jqGrid('setGridParam', {url:url});
	            jQuery("#plot_tree_without_plot").trigger('reloadGrid');
			}else{
				$("#plot_import_form_content").html(jqXHR.responseText);
				$.ajax({
					    type : "GET",
					    url : "ImportPlot.onFailImportStatus.do?import_type='P'",
					    async : false,
					    beforeSend : function(jqXHR, settings) {
					    },
					    error : function(errorThrown, status, jqXHR) {
					     alert("error:" + errorThrown + ", status:" + status);
					    },
					    success : function(data, status, jqXHR) {
//	   					     alert("Import failed");
					    },
					    complete : function(jqXHR, textStatus) {
					    }
				   });
				$.smallBox({
					title : "<s:text name="small.box.on.save.title.failed"/>", 
					content : "<s:text name="small.box.content"/>", 
					color : "#C79121",
					timeout: 5000,
					icon : "fa fa-shield fadeInLeft animated",
					number : "2"
				});
				$("#import_plot_form_content").hide();
				$("#plots_existing_grid_content").show();
				$("#step_2").css("background","#D84C4C");
			}
		},
		complete : function(jqXHR, textStatus) {
		}
	});
	
}
$(document).ready(function() {
	$("#plot_trees_without_plot_grid_content").hide();
	$("#plot_without_stand_grid_content").hide();
	$("#plot_out_stand_grid_content").hide();
});
</script>		
   		    
</body>
</html>