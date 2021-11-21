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
	<div id="employee_soscontact_grid_content" class="custom-scroll table-responsive"
		style="height: 290px; overflow-y: scroll;">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th></th>
					<th><s:text name="hum.employee.label.contact.name"/></th>
					<th><s:text name="hum.employee.label.relationship"/></th>
					<th><s:text name="hum.employee.label.home.phone"/></th>
					<th><s:text name="hum.employee.label.work.phone"/></th>
					<th><s:text name="hum.employee.label.mobile.phone"/></th>
					<th><s:text name="hum.employee.label.email"/></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="employeeSosContactList">
					<tr>
						<td>
							<div class="btn-group btn-group-xs" >
								<button class="btn btn-primary btn-xs"
									data-placement="top"
									data-original-title="<s:text name="label.button.edit"></s:text>"
									data-html="true" type="submit"
									value="<s:property value='id' />"
									onclick="editSosContactButton(this)">
									<i class="fa fa-edit"></i>
								</button>
							</div>
						</td>
						<td><b><s:property value='contactName' /></b></td>
						<td><b><i><s:property value='relationship' /></i></b></td>
						<td><b><s:property value='homePhone' /></b></td>
						<td><b><i><s:property value='workPhone' /></i></b></td>
						<td><b><s:property value='mobilePhone' /></b></td>
						<td><b><i><s:property value='email' /></i></b></td>
					<tr/>
					
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="form-actions">
		<div class="row">
			<div class="col-md-12">
				<button id="addSoscontactButton" class="btn btn-primary" type="submit">
					<i class="fa fa-plus"></i>
					<s:text name="label.button.add"></s:text>
				</button>
			</div>
		</div>
	</div>
<script type="text/javascript">
function editSosContactButton(objButton){
	var link = "EmployeeSosContact.form.do?sosContactId=" + objButton.value;
	openDialogForm('employee_soscontact_form_content',link,"<s:text name="employee.sos.contact"/>",800,550);
	return false;
//		   return objButton.value;
};
$(document).ready(function () {
	$("#addSoscontactButton").on('click', function() {
		$("#addSoscontactButton").prop('disabled','disabled');
		var link= "EmployeeSosContact.form.do";
		openDialogForm('employee_soscontact_form_content',link,"<s:text name="employee.sos.contact"/>",800,550);
		return false;
	});
});
</script>	
</body>
</html>