<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
		<!-- KFIS Custom CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/start/jquery-ui-1.10.4.custom.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="css/ui.multiselect.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/jquery-datetimepicker/jquery.datetimepicker.css"/>
		<link rel="stylesheet" type="text/css" media="screen" href="js/libs/custom/jquery.combo.custom-1.0.css" />

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
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-employee-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="hum.employee.legend.employee.grid"/></h2>
				</header>
				
				<div id="employee_grid_content">
					<jsp:include page="employee_grid.jsp"></jsp:include>
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
		<article class="col-sm-12 col-md-12 col-lg-6">
			<!-- START widget-employee-list -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-employee-profile" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2><s:text name="hum.employee.legend.employee.profile"/></h2>
				</header>
				
				<div id="employee_profile_content">
<%-- 					<jsp:include page="employee_profile.jsp"></jsp:include> --%>
				</div>
			</div>
			<!-- END widget-employee-list -->
		</article>	
		<!-- END NEW WIDGET -->
		
		<!-- START NEW WIDGET -->
		<article class="col-sm-12 col-md-12 col-lg-6">
		
			<!-- START widget-employee-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-employee-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<!--<span class="ui-icon ui-icon-home" style="display: inline-block"></span>-->			
					<span class="ui-icon ui-icon-pin-w" style="display: inline-block"></span>
					<h2><s:text name="hum.employee.legend.employee.data"/></h2>
				</header>
				
				<div id="employee_form_content">
					<jsp:include page="employee_form.jsp"></jsp:include>
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
