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
	<div id="employee_document_grid_content" class="custom-scroll table-responsive"
		style="height: 290px; overflow-y: scroll;">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th></th>
					<th><i class="fa fa-download text-warning"></i><s:text name="hum.employee.label.file.name"/></th>
					<th><s:text name="hum.employee.label.document.type"/><i class="text-danger">!</i></th>
					<th><s:text name="hum.employee.label.created.date"/></th>
					<th><s:text name="hum.employee.label.comment"/></th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="employeeDocumentList">
					<tr>
						<td>
							<div class="btn-group btn-group-xs">
								<button class="btn btn-primary btn-xs"
									data-placement="top"
									data-original-title="<s:text name="label.button.edit"></s:text>"
									data-html="true" type="submit"
									value="<s:property value='id' />"
									onclick="editDocumentButton(this)">
									<i class="fa fa-edit"></i>
								</button>
							</div>
						</td>
						<td><button value="<s:property value='id' />" onclick="generateDocument(this);"><i class="fa fa-download  btn-xs"></i></button><s:property value='docName'/></td>
						<s:if test="#lang=='en'">
							<td><b><i><s:property value='documentType.getDOMTEXT_EN()' /></i></b></td>
						</s:if>
						<s:elseif test="#lang=='al'">
							<td><b><i><s:property value='documentType.getDOMTEXT()' /></i></b></td>
						</s:elseif>
						<s:else>
							<td><b><i><s:property value='documentType.getDOMTEXT_SR()' /></i></b></td>
						</s:else>
						<td><b><s:property value='createdDate' /></b></td>
						<td><b><i><s:property value='comments' /></i></b></td>
					<tr />
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="form-actions">
		<div class="row">
			<div class="col-md-12">
				<button id="addDocumentButton" class="btn btn-primary" type="submit">
					<i class="fa fa-plus"></i>
					<s:text name="label.button.add"></s:text>
				</button>
			</div>
		</div>
	</div>
<script type="text/javascript">
function editDocumentButton(objButton){
	var link = "EmployeeDocument.form.do?documentId=" + objButton.value;
	openDialogForm('employee_document_form_content',link,"<s:text name="employee.doc"/>",800,450); 
	return false;
};
function generateDocument(obj){
	window.open("DocumentGenerator.do?attachmentId="+obj.value, "_blank");
};
$(document).ready(function () {
	$("#addDocumentButton").on('click', function() {
		$("#addDocumentButton").prop('disabled','disabled');
		var link= "EmployeeDocument.form.do";
		openDialogForm('employee_document_form_content',link,"<s:text name="employee.doc"/>",800,450);
		return false;
	});
});
</script>
</body>
</html>