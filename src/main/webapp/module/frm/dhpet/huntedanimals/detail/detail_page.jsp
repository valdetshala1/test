<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<html>
<head>

</head>
<body>    		    
<div id="container">

<!-- widget grid -->
<section id="widget-grid" class="">
<br>
<input id="huntAnimalId" name="huntAnimalId" value="<s:property value="huntAnimalId"/>" type="hidden">
<input id="animalNumber" name="animalNumber" value="<s:property value="huntDetail.dhpetHuntedAnimals.animalsNumber"/>" type="hidden">
	<!-- row -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<div id="huntdetail_grid_content">
				<jsp:include page="detail_grid.jsp"></jsp:include>
			</div>
		</article>
	<!-- END NEW WIDGET -->		
	</div>
	<!-- end row -->
	
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
				<div id="huntdetail_form_content">
					<jsp:include page="detail_form.jsp"></jsp:include>
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
