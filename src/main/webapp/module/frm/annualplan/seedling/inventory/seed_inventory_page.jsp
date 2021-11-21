<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<html>
<head></head>
<body>        
<div id="container">
<input id="seedActId" name="seedActId" value="<s:property value='seedActivity.id'/>" type="hidden">

<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-employee-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-inventory-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="seed.inv.grid"/></h2>
				</header>
				<div id="seed_inventory_grid_content">
						<jsp:include page="seed_inventory_grid.jsp"></jsp:include>					
				</div>
			<!-- END widget-employee-form -->
		</div>
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-inventory-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="seed.inv.form"/></h2>
				</header>
			<!-- START widget-seed-inventory-form -->
				
				<div id="seed_inventory_form_content">
					<jsp:include page="seed_inventory_form.jsp"></jsp:include>
				</div>
			<!-- END widget-role-form -->
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
