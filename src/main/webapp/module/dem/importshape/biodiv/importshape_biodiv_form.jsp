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
									<a  id="validation_a_5"> <span class="step" id="step_5">5</span> <span class="title"><s:text name='dem.import.shape.validation_6'/></span> </a>
								</li>
						</ul>
						<div class="clearfix"></div>
				 </div>
				 	
				 <br/>
				 <br/>
		 </div>
		 <div class="row">
				<!--start include shape_fields_control_grid-->
				 <div id="biodiv_out_stand" class="col-sm-12">
				 <jsp:include page="validations\shape_biodiv_out_stand_grid.jsp"></jsp:include>
				 </div>	
				<!--end include shape_fields_control_grid-->
				
				<!--start include shape_fields_control_grid-->
				 <div id="biodiv_without_stand" class="col-sm-12">
				 <jsp:include page="validations\shape_biodiv_without_stand_grid.jsp"></jsp:include>
				 </div>	
				<!--end include shape_fields_control_grid-->
				
			<!--start include shape_fields_control_grid -->
				 <div id="code_not_exists" class="col-sm-12">
				 <jsp:include page="validations\biodiv_code_not_exists_grid.jsp"></jsp:include>
				 </div>	
			<!-- end include shape_fields_control_grid -->

		</div>
		 <div class="row">
		<!--start include importshape_content_form -->
		<div id="import_shape_biodiv_content">
				 <jsp:include page="importshape_biodiv_content_form.jsp"></jsp:include>
		 </div>	
		<!--end include importshape_content_form-->
		</div>
<script type="text/javascript">

$(document).ready(function() {
	$("#biodiv_out_stand").hide();
	$("#biodiv_without_stand").hide();
	$("#code_not_exists").hide();
});
</script>		
   		    
</body>
</html>