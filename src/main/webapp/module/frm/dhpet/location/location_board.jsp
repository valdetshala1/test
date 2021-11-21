<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>
		<input id="dhpetLocationId" name="dhpetLocationId" value="<s:property value='dhpetLocation.id'/>" type="hidden">
		<!-- start tabs definition -->
		<div id="locationTabs">
			<ul >
			  <li><a href="#location_content" ><i class="fa fa-compass"></i> <s:text name="dhpet.location"/></a></li>

			</ul>
			<!-- end tabs definition -->
			
			<!-- start tab content -->
			<div class="tab-content">									
					<div class="tab-pane active" id="location_content">
						<jsp:include page="location_page.jsp"></jsp:include>
					</div>
<%-- 					href="Location.page.do?dhpetLocationId=<s:property value='dhpetLocation.id'/>" --%>


			</div>
		<!-- end tab content -->
		</div>
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
		$(document).ready(function(){
			$('#locationTabs').tabs({ active: 1 });
		
		});
	
</script>

</body>
</html>
