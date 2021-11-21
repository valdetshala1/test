<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
<%-- <script src="js/maps/activities/planting_map.js"></script> --%>
</head>
<body>    		    
<div id="planting_container">
<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<div class="jarviswidget" id="widget-id-harvest-grid" data-widget-deletebutton="false">
				
				<div id="planting_grid_content">
					<jsp:include page="planting_grid.jsp"></jsp:include>				
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
