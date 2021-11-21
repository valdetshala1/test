<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<s:if test="hasActionErrors() || hasFieldErrors()">
	<form id="errors_form" method="get">
	<input type="hidden" id="errors_exists" name="errors_exists" value="true">
	<div class="well">
	<fieldset>
		<legend><span class="label label-warning"><s:text name="frm.harvest.planning.validations"/></span></legend>
		<table> 
		<s:iterator value="actionErrors">
		<tr>
		<td>
			<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>&nbsp;<s:property escape="false"/>
		</td>
		</tr>
		</s:iterator>
		<s:iterator value="fieldErrors" var="fe">
		<tr>
		<td>
			<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;" title="<s:property value="key" escape="false"/>"></span>
			<s:set var="i18text" value="" scope="page" />
			<s:iterator value="value" var="tval">
				<s:property value="%{getText(#tval)}" />
				<s:set var="i18text" value="%{getText(#tval)}" />
			</s:iterator>
			<label class="fieldErrors" style="visibility: hidden;" id="<s:property value="key" escape="false"/>">${i18text}</label>
		</td>
		</tr>
		</s:iterator>				
		</table>	
	</fieldset>
	</div>
	</form>
	</s:if>