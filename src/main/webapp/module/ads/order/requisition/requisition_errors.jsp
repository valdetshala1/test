<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>

<s:if test="hasActionErrors() || hasFieldErrors()">
<fieldset>
	<legend><span class="label label-warning"><s:text name="frm.harvest.planning.validations"/></span></legend>
	<table class="errors"> 
	<s:iterator value="actionErrors">
	<tr>
	<td colspan="5">
		<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
		<strong></strong>  <s:property escape="false"/>
	</td>
	</tr>
	</s:iterator>
	<s:iterator value="fieldErrors">
	<tr>
	<td colspan="5">
		<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
		<strong></strong>  <s:property escape="false"/>
	</td>
	</tr>
	</s:iterator>				
	</table>	
</fieldset>
</s:if>	
<s:else>
<h3><span class="label label-success"><s:text name="requisition.save.successful"/></span></h3>
</s:else>
</body>
</html>			