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
<br>
	<!-- row -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-animalCapacity-grid-->
				<div id="huntgroundeval_grid_content">
					<jsp:include page="huntgroundeval_grid.jsp"></jsp:include>
				</div>
			<!-- END widget-huntgroundeval-plan-grid -->
		
		</article>
		<!-- END NEW WIDGET -->		
	</div>
	<!-- end row -->
	
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-huntgroundeval-grid-->
				<div id="huntgroundeval_form_content">
					<jsp:include page="huntgroundeval_form.jsp"></jsp:include>
				</div>
			<!-- END widget-huntgroundeval-plan-grid -->
		
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
