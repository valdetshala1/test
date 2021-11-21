<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
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
		<article class="col-sm-12 article-grid-gl">
			<!-- START widget-location-grid-->
			<div class="jarviswidget jarviswidget-color-blueLight div-border-top" id="widget-id-dhpet-location-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">	
				
				<div id="location_grid_content">
					<jsp:include page="location_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-protection-plan-grid -->
		
		</article>
		<!-- END NEW WIDGET -->		
	</div>
	<!-- end row -->
	
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-location-grid-->
			<div class="jarviswidget jarviswidget-color-blueLight div-border-top" id="widget-id-dhpet-location-board" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<div  id="location_form_content" class="form-content-gl">
					<jsp:include page="location_form.jsp"></jsp:include>
				</div>
<!-- 				<div id="location_board_content"> -->
<%-- 					<jsp:include page="location_board.jsp"></jsp:include> --%>
<!-- 				</div> -->
			</div>
			<!-- END widget-location-plan-grid -->
		
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
