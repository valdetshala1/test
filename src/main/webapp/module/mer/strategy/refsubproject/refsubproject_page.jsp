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
	<br>
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
				<div id="refsubproject_grid_content">
					<jsp:include page="refsubproject_grid.jsp"></jsp:include>
				</div>
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
	<br>	
	<!-- row	 -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
				<div id="refsubproject_form_content">
					<jsp:include page="refsubproject_form.jsp"></jsp:include>
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
