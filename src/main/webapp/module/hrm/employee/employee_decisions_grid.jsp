<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
	<div class="custom-scroll table-responsive"
		style="height: 290px; overflow-y: scroll;">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th><s:text name="adm.humman.resource.decision.menu"/></th>
					<th><s:text name="official.travel.status"/></th>
					<th><s:text name="hrm.official.travel.grid.req.date"/></th>
					<th><s:text name="mer.execution.note"/></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="employeeDecisionsList">
					<tr>
						<s:if test="#lang=='al'">
							<td><b><i><s:property value='decisionType.nameAl' /></i></b></td>
							<td><b><i><s:property value='decisionStatus.status.getDOMTEXT()' /></i></b></td>
						</s:if>
						<s:elseif test="#lang=='en'">
							<td><b><i><s:property value='decisionType.nameEn' /></i></b></td>
							<td><b><i><s:property value='decisionStatus.status.getDOMTEXT_EN()' /></i></b></td>
						</s:elseif>
						<s:else>
							<td><b><i><s:property value='decisionType.nameSr' /></i></b></td>
							<td><b><i><s:property value='decisionStatus.status.getDOMTEXT_SR()' /></i></b></td>
						</s:else>
						<td><b><i><s:property value='dateOfRequest' /></i></b></td>
						<td><b><i><s:property value='note' /></i></b></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
</html>