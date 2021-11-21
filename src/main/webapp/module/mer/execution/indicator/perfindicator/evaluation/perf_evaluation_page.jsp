<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../../base/nocache.jsp"%>
<html>
<head>

</head>
<body>    		    
<div id="container">
<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">
    <input type="hidden" id=subIndicId name="subIndicId" value="<s:property value="subIndicId"/>" />
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
				<div id="perf_eval_grid_content">
					<jsp:include page="perf_evaluation_grid.jsp"></jsp:include>
				</div>
		
		</article>
		<!-- END NEW WIDGET -->
	</div>
	<!-- end row -->
	<!-- row -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
				<div id="perf_eval_form_content">
					<jsp:include page="perf_evaluation_form.jsp"></jsp:include>
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
