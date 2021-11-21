<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/module/base/nocache.jsp"%>
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
			<!-- START widget-widget-id-taxrate-grid-grid-->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-taxrate1-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="hrm.employee.salary.taxrate.grid"/></h2>
					
				</header>
				
				<div id="taxrate_grid_content">
					<jsp:include page="taxrate_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-id-taxrate-grid -->
		
		</article>
		<!-- END NEW WIDGET -->
		
	<!-- NEW WIDGET START -->
		<article class="col-sm-12 ">
			<!-- START widget-id-taxrate-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-taxrate1-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-pencil"></i></span>
					<h2><s:text name="hrm.employee.salary.taxrate.menu"/></h2>
					
				</header>
				
				<div id="taxrate_form_content">
					<jsp:include page="taxrate_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-id-taxrate-form -->
		
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
