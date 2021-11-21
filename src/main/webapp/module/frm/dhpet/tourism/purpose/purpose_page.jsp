<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<html>
<head></head>
<body>    		    
<div id="container">
<br>

<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-purpose_grid -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-purpose-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2>Tourism purpose Grid</h2>
				</header>
				
				<div id="purpose_grid_content">
						<jsp:include page="purpose_grid.jsp"></jsp:include>					
				</div>
			</div>
			<!-- END widget-purpose_grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<!-- START widget-purpose-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-purpose-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2>Purpose Form</h2>
				</header>
				
				<div id="purpose_form_content">
					<jsp:include page="purpose_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-purpose-form -->
		
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
