<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>

</head>
<body>    		    
<div id="container">
<br>

<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-employee-form -->
			<!-- data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-hrm-annual-plan-grid-" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="hrm.ann.plan.grid"/></h2>
				</header>
				
				<div id="annual_plan_grid_content">
					<jsp:include page="annual_plan_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-employee-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<!-- START widget-employee-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-hrm-annual-plan-form-" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="hrm.ann.plan.form"/></h2>
				</header>
				
				<div id="annual_plan_form_content">
					<jsp:include page="annual_plan_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-employee-form -->
		
		 </article>
		 <!-- END NEW WIDGET -->		
			
	</div>
	<!-- end row -->	
		
	
</section>
<!-- end widget grid -->
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
</script>

</div>
</body>
</html>
