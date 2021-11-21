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
	<div id="employee_language_grid_content" class="custom-scroll table-responsive"
		style="height: 290px; overflow-y: scroll;">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th></th>
					<th><s:text name="hum.employee.label.language"/></th>
					<th><s:text name="hum.employee.label.reading"/></th>
					<th><s:text name="hum.employee.label.speaking"/></th>
					<th><s:text name="hum.employee.label.writing"/></th>
					<th><s:text name="hum.employee.label.understanding"/></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="employeeLanguageList">
					<tr>
						<td>
							<div class="btn-group btn-group-xs">
								<button class="btn btn-primary btn-xs" rel="tooltip"
									data-placement="top"
									data-original-title="<s:text name="label.button.edit"></s:text>"
									data-html="true" type="submit"
									value="<s:property value='id' />"
									onclick="editLanguageButton(this)">
									<i class="fa fa-edit"></i>
								</button>
							</div>
						</td>
					<s:if test="#lang=='al'">
						<td><b><i><s:property value='language.name' /></i></b></td>
						<td><b><i><s:property value='reading.getDOMTEXT()' /></i></b></td>
						<td><b><i><s:property value='speaking.getDOMTEXT()' /></i></b></td>
						<td><b><i><s:property value='writing.getDOMTEXT()' /></i></b></td>
						<td><b><i><s:property value='understanding.getDOMTEXT()' /></i></b></td>
					</s:if>
					<s:elseif test="#lang=='en'">
						<td><b><i><s:property value='language.nameEn' /></i></b></td>
						<td><b><i><s:property value='reading.getDOMTEXT_EN()' /></i></b></td>
						<td><b><i><s:property value='speaking.getDOMTEXT_EN()' /></i></b></td>
						<td><b><i><s:property value='writing.getDOMTEXT_EN()' /></i></b></td>
						<td><b><i><s:property value='understanding.getDOMTEXT_EN()' /></i></b></td>
					</s:elseif>
					<s:else>
						<td><b><i><s:property value='language.nameSr' /></i></b></td>
						<td><b><i><s:property value='reading.getDOMTEXT_SR()' /></i></b></td>
						<td><b><i><s:property value='speaking.getDOMTEXT_SR()' /></i></b></td>
						<td><b><i><s:property value='writing.getDOMTEXT_SR()' /></i></b></td>
						<td><b><i><s:property value='understanding.getDOMTEXT_SR()' /></i></b></td>
					</s:else>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		
	</div>
	<div class="form-actions">
			<div class="row">
				<div class="col-md-12">
					<button id="addLanguageButton" class="btn btn-primary" type="submit">
						<i class="fa fa-plus"></i>
						<s:text name="label.button.add"></s:text>
					</button>
				</div>
			</div>
		</div>
<script type="text/javascript">
function editLanguageButton(obj){
	var link= "EmployeeLanguage.form.do?employeeLanguageId="+obj.value;
	openDialogForm('employee_language_form_content',link,"<s:text name="employee.language"/>",800,450);
	return false;
};
$(document).ready(function(){
	$("#addLanguageButton").on('click', function() {
		$("#addLanguageButton").prop('disabled','disabled');
		var link= "EmployeeLanguage.form.do";
		openDialogForm('employee_language_form_content',link,"<s:text name="employee.language"/>",800,450);
		return false;
	});
});
</script>
</body>
</html>