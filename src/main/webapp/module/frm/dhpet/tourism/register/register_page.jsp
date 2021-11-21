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
			<!-- START widget-register_grid -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-register-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2>Tourism register Grid</h2>
				</header>
				
				<div id="register_grid_content">
						<jsp:include page="register_grid.jsp"></jsp:include>					
				</div>
			</div>
			<!-- END widget-register_grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<!-- START widget-register-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-register-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2>Register Form</h2>
				</header>
				
				<div id="register_form_content">
					<jsp:include page="register_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-register-form -->
		
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
