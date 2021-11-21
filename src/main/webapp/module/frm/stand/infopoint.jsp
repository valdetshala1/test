<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache_session.jsp"%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
.headInfo{
	font-size: 13px; 
	font-weight: bold; 
	color: white;
	background-color: #416859
}
.bodyInfo{
	font-size: 10px; 
	font-weight: bold; 
	background-color: #b2c8bf
}
.buttonInfo{
	background-color: #273C34;
	width:100%;
	color: #ffffff;
	box-shadow: 3px 1px 1px #888888
}
.buttonInfoDiv{
	margin-right: 25%;
	margin-left: 25%;
}
</style>
<title> Stand Info</title>
</head>
	<body>
		<s:if test="stand != null">
			<table border="1" cellpadding="0" > 
				<tr>
					<td style="font-size: 10px;" colspan="4"><div class="infocontent10">
						<table border="1" width="350px">
						<th class="headInfo">
							<div class="infocontent10">
								<s:text name="frm.stand.stand"/>: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<b><s:property value="stand.standId"/></b>
							</div>
							</th>
						</table>
						</div>
					</td>
				</tr>
				<tr>
					<td style="font-size: 10px;" colspan="4"><div class="infocontent10">
						<table border="1" width="350px">
							<tr> 
								<th class="bodyInfo"><div class="infocontent10b"><s:text name="frm.stand.basal.area"></s:text></div></th>
								<th style="font-size: 10px;"><div class="infocontent10"><s:property value="stand.basalArea"/></div></th>
							</tr>
								
							<tr>
								<th class="bodyInfo"><div class="infocontent10b"><s:text name="stand.stand.mngmClass.name"></s:text></div></th>
								<th style="font-size: 10px;"><div class="infocontent10">
									<s:if test="%{locale.language=='al'}"><s:property value="stand.mngmClass.getDOMTEXT()" /></s:if>
									<s:elseif test="%{locale.language=='sr'}"><s:property value="stand.mngmClass.getDOMTEXT_SR()"/></s:elseif>
									<s:else><s:property value="stand.mngmClass.getDOMTEXT_EN()" /></s:else>
							</tr>
							
					 	</table>
					 	</div>
					 </td>
				</tr>
				<tr>
					<td style="font-size: 10px;" colspan="4"><div class="infocontent10">
						<table border="1" width="350px">
							<tr> 
								<th><div class="infocontent10 buttonInfoDiv">
								<button class="buttonInfo" onclick="standInfo('<s:property value='stand.id'/>','<s:property value='stand.compartment.id'/>','<s:property value='stand.compartment.managementUnitPeriod.id'/>');">Te dhenat e nngastres</button>
								</div></th>
							</tr>
					 	</table>
					 	</div>
					 </td>
				</tr>	
   			</table>  
		</s:if>
		<s:else>
			no results
		</s:else>
	</body>
</html>