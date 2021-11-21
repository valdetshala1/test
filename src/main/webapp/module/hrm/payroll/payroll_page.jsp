<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/module/base/nocache.jsp"%>
<html>
<head>

<style type="text/css">
.wrapper{
    margin: auto;
    width: 100%;
    max-width: 1000px;
    padding:10px;
    background-color: #ccc;
}
.hideDiv {
   display: none!important;
}
</style>
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
			<!-- START widget-salary-grid-->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-salary1-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="hrm.employee.payroll.list"/></h2>
				</header>
				
				<div id="payroll_grid_content">
					<jsp:include page="payroll_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-salary-grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row	 -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-salary1-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="hrm.employee.payroll.form"/></h2>
				</header>
				
				<div id="payroll_form_content">
					<jsp:include page="payroll_form.jsp"></jsp:include>
				</div>
			</div>
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
