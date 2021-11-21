<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
</head>
<body> 
		<!-- start wizard steps control -->
		<div class="row">
				 <br/>
				 <br/>
		 </div>
		 <div class="row">
		<!--start include export_biodiv_content-->
				<div id="export_biodiv_content">
					<jsp:include page="export_form.jsp"></jsp:include>
				</div>	
		<!--end include export_biodiv_content-->
		</div>
<script type="text/javascript">
$(document).ready(function() {
});
</script>		
   		    
</body>
</html>