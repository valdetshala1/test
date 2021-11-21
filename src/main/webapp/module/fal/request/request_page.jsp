<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>


</head>
<body>    		    
<div id="container">

<!-- widget grid -->
<section id="widget-grid" class="">

	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-import-grid-->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-request-grid-grid-id" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				
				<div id="request_grid_page">
					<jsp:include page="request_list.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-import-grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->

	<!-- row	 -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-fiskos-import-form-id" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<div id="request_form_content">
			<jsp:include page="request_form.jsp"></jsp:include>
		</div>
			</div>
			<!-- END widget-assets -->
		
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
