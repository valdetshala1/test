<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
</head>
<body> 
		<!-- start wizard steps control -->
		<div class="row">
<!-- 				<div id="steps_control" class="form-bootstrapWizard"> -->
<!-- 						<ul class="bootstrapWizard form-wizard"> -->
<!-- 								<li  id="validation_li_1" > -->
<%-- 									<a  id="validation_a_1"> <span class="step" id="step_1">1</span> <span class="title">Validation 1</span> </a> --%>
<!-- 								</li> -->
<!-- 								<li  id="validation_li_2" > -->
<%-- 									<a  id="validation_a_2"> <span class="step" id="step_2">2</span> <span class="title">Validation 2</span> </a> --%>
<!-- 								</li> -->
<!-- 								<li id="validation_li_3"> -->
<%-- 									<a  id="validation_a_3"> <span class="step" id="step_3" >3</span> <span class="title">Validation 3</span> </a> --%>
<!-- 								</li> -->
<!-- 								<li id="validation_li_4" > -->
<%-- 									<a  id="validation_a_4"> <span class="step" id="step_4">4</span> <span class="title">Validation 4</span> </a> --%>
<!-- 								</li> -->
<!-- 								<li id="validation_li_5" > -->
<%-- 									<a  id="validation_a_5"> <span class="step" id="step_5">5</span> <span class="title">Validation 5</span> </a> --%>
<!-- 								</li> -->
<!-- 								<li id="validation_li_6" > -->
<%-- 									<a  id="validation_a_6"> <span class="step" id="step_6">6</span> <span class="title">Export </span> </a> --%>
<!-- 								</li> -->
<!-- 						</ul> -->
<!-- 						<div class="clearfix"></div> -->
<!-- 				 </div> -->
				 <br/>
				 <br/>
		 </div>
		 <div class="row">
		<!--start include export_stand_content-->
				<div id="export_plot_content">
					<jsp:include page="export_form.jsp"></jsp:include>
				</div>	
		<!--end include export_stand_content-->
		</div>
<script type="text/javascript">
$(document).ready(function() {
});
</script>		
   		    
</body>
</html>