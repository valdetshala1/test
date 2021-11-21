<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head></head>
<body>    		    
<div id="container_object_operation">

<!-- widget grid -->
<section id="widget-grid" class="">
	<input type="hidden" id="permissionId" name="permissionId" value="<s:property value='permissionId'/>" />
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-employee-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-employee-grid" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2>Operation Grid</h2>
				</header>
				
				<div id="operation_grid_content">
					<jsp:include page="operation_grid.jsp"></jsp:include>
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
		
			<!-- START widget-object-grid -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-employee-form" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2>Object Data</h2>
				</header>
				
				<div id="object_form_content">
					<jsp:include page="object_grid.jsp"></jsp:include>				
				</div>
			</div>
			<!-- END widget-object-grid -->
		
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
