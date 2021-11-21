<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
	
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">
<!-- enctype="multipart/form-data" -->
		<form id="employee_soscontact_form" class="form-horizontal" action="EmployeeSosContactSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
				<input id="sosContact.id" name="sosContact.id" value="<s:property value='sosContact.id'/>" type="hidden">
				<input id="sosContact.employee.id" name="sosContact.employee.id" value="<s:property value='sosContact.employee.id'/>" type="hidden">
				<!-- START sosContact.contactName -->
				<s:if test="fieldErrors.get('sosContact.contactName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.contact.name"/></label>
							<div class="col-md-10">
								<input id="sosContact.contactName" name="sosContact.contactName" class="form-control" placeholder="<s:text name="hum.employee.label.contact.name"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('sosContact.contactName')"/></span> 
							</div>
							
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.contact.name"/></label>
						<div class="col-md-10">
							<input id="sosContact.contactName" name="sosContact.contactName" value="<s:property value='sosContact.contactName'/>" class="form-control" placeholder="<s:text name="hum.employee.label.contact.name"/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END sosContact.contactName-->
				<!-- START sosContact.relationship -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.relationship"/></label>
						<div class="col-md-10">
							<input id="sosContact.relationship" name="sosContact.relationship" value="<s:property value='sosContact.relationship'/>" class="form-control" placeholder="<s:text name="hum.employee.label.relationship"/>" type="text">
						</div>
					</div>
				<!-- END sosContact.relationship-->
				<!-- START sosContact.homePhone -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.home.phone"/></label>
						<div class="col-md-10">
							<input id="sosContact.homePhone" name="sosContact.homePhone" value="<s:property value='sosContact.homePhone'/>" class="form-control" placeholder="<s:text name="hum.employee.label.home.phone"/>" type="text">
						</div>
					</div>
				<!-- END sosContact.homePhone-->
				<!-- START sosContact.workPhone -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.work.phone"/></label>
						<div class="col-md-10">
							<input id="sosContact.workPhone" name="sosContact.workPhone" value="<s:property value='sosContact.workPhone'/>" class="form-control" placeholder="<s:text name="hum.employee.label.work.phone"/>" type="text">
						</div>
					</div>
				<!-- END sosContact.workPhone-->
				<!-- START sosContact.mobilePhone -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.mobile.phone"/></label>
						<div class="col-md-10">
							<input id="sosContact.mobilePhone" name="sosContact.mobilePhone" value="<s:property value='sosContact.mobilePhone'/>" class="form-control" placeholder="<s:text name="hum.employee.label.mobile.phone"/>" type="text">
						</div>
					</div>
				<!-- END sosContact.mobilePhone-->
				<!-- START sosContact.email -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.email"/></label>
						<div class="col-md-10">
							<input id="sosContact.email" name="sosContact.email" value="<s:property value='sosContact.email'/>" class="form-control" placeholder="<s:text name="hum.employee.label.email"/>" type="text">
						</div>
					</div>
				<!-- END sosContact.email-->
			<footer class="form-actions">
				<button id="cancelSos" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
				<button id="saveSos" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
					<i class="fa fa-save"></i>
					<s:text name="label.button.save"></s:text>
				</button>
			</footer>				
		</form>
	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
		
<script type="text/javascript">

	$(document).ready(function () {
		$("#sosContact\\.employee\\.id").val($("#employeeId").val());
		$("#cancelSos").on('click', function(){
			$("#employee_soscontact_form_content").dialog('close');
			});

		$("#employee_soscontact_form_content").on('remove',function(){
			$("#addSoscontactButton").prop('disabled',false);
		});	
		Ladda.bind('#saveSos');
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					alert(err);
					$("#employee_soscontact_form_content").html(response);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#employee_soscontact_form_content").html(jqXHR.responseText);
			    	var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						var link = "Employee.soscontact.do?employeeId=" + $("#employeeId").val();
						loadURL(link, $("#sosTab"));
						$("#employee_soscontact_form_content").dialog("close");	
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});								
					}  
					else{
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});

						} 
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();

				}
			});		
		})();

	});     
       
</script>