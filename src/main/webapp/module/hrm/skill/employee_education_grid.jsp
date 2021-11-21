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
	<div id="employee_education_grid_content" class="custom-scroll table-responsive"
		style="height: 290px; overflow-y: scroll;">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th></th>
					<th><s:text name="hrm.skill.grid.education"/></th>
					<th><s:text name="hrm.skill.label.start.date"/></th>
					<th><s:text name="hrm.skill.label.end.date"/></th>
					<th><s:text name="hrm.skill.label.details"/></th>
					<th><i class="fa fa-download text-warning"></i><s:text name="hrm.skill.label.attachment"/></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="employeeEducationList">
					<tr>
						<td>
							<div class="btn-group btn-group-xs">
								<button class="btn btn-primary btn-xs" rel="tooltip"
									data-placement="top"
									data-original-title="<s:text name="label.button.edit"></s:text>"
									data-html="true" type="submit"
									value="<s:property value='id' />"
									onclick="editEducationButton(this)">
									<i class="fa fa-edit"></i>
								</button>
							</div>
						</td>
						<s:if test="#lang=='en'">
							<td><b><i><s:property value='educationType.getDOMTEXT_EN()' /></i></b></td>
						</s:if>
						<s:elseif test="#lang=='al'">
							<td><b><i><s:property value='educationType.getDOMTEXT()' /></i></b></td>
						</s:elseif>
						<s:else>
							<td><b><i><s:property value='educationType.getDOMTEXT_SR()' /></i></b></td>
						</s:else>
						<td><b><s:property value='dateStart' /></b></td>
						<td><b><i><s:property value='dateEnd' /></i></b></td>
						<td><b><i><s:property value='details' /></i></b></td>
						<td><s:if test="%{docName!=null}"><button value="<s:property value='id' />" onclick="generateAttachment(this);"><i class="fa fa-download  btn-xs"></i></button><s:property value='docName'/></s:if></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		
	</div>
	<div class="form-actions">
		<div class="row">
			<div class="col-md-12">
				<button id="addEducationButton" class="btn btn-primary" type="submit">
					<i class="fa fa-plus"></i>
					<s:text name="label.button.add"></s:text>
					</button>
				</div>
			</div>
	</div>
</body>
<script type="text/javascript">
function editEducationButton(objButton){
	var link = "EmployeeSkill.education.do?skillId=" + objButton.value;
	openDialogForm('employee_education_form_content',link,"<s:text name="employee.doc"/>",800,500);
	return false;
};
$(document).ready(function(){
	$("#addEducationButton").on('click', function() {
		$("#addEducationButton").prop('disabled','disabled');
		var link= "EmployeeSkill.education.do";
		openDialogForm('employee_education_form_content',link,"<s:text name="employee.education"/>",800,500);
		return false;
	});
});
</script>
</html>