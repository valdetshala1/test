<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<script type="text/javascript" src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/ajaxwidget/ui.combobox-custom.css">		
	
<!-- widget div-->
<div id="employee_document_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
<!-- enctype="multipart/form-data" -->
<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
		<form id="employee_document_form" class="form-horizontal" action="EmployeeDocumentSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
				<input id="employeeDocument.employee.id" name="employeeDocument.employee.id" value="<s:property value='employeeDocument.employee.id'/>" type="hidden">
				<input id="employeeDocument.docName" name="employeeDocument.docName" value="<s:property value='employeeDocument.docName'/>" type="hidden">
				<input id="employeeDocument.docType" name="employeeDocument.docType" value="<s:property value='employeeDocument.docType'/>" type="hidden">
				<input id="employeeDocument.id" name="employeeDocument.id" value="<s:property value='employeeDocument.id'/>" type="hidden">
				
				<!-- START employeeDocument.fileContent -->
				<s:if test="fieldErrors.get('employeeDocument.fileContent')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="fileDocument">*<s:text name="hum.employee.label.document"/></label>
							<div class="col-md-10">
									<div class="col-md-10">
										<input type="file" class="btn btn-default" id="fileDocument" name="fileDocument" onchange="getFileData(this);">
										<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('employeeDocument.fileContent')"/></span>
									</div>
									 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="fileDocument">*<s:text name="hum.employee.label.document"/></label>
						<div class="col-md-10">
							<input type="file" class="btn btn-default" id="fileDocument" name="fileDocument" onchange="getFileData(this);">
						</div>
					</div>
				</s:else>
				<!-- START employeeDocument.fileContent -->
				<s:if test="fieldErrors.get('employeeDocument.documentType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name=""/><s:text name="hum.employee.label.document.type"/></label>
							<div class="col-md-10">
								<select class="form-control" id="employeeDocument.documentType" name="employeeDocument.documentType">
									<s:iterator value="documentTypeList" var="el">
										<option value="<s:property value="#el.getDOMVALUE()" />">
											<s:if test="%{#lang=='al'}">
												<s:property value="#el.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{#lang=='sr'}">
												<s:property value="#el.getDOMTEXT_SR()" />
											</s:elseif>
											<s:else>
												<s:property value="#el.getDOMTEXT_EN()" />
											</s:else>
										</option>
									</s:iterator>						
								</select>
								<span class="help-block"><i class="fa fa-warning"></i>
									<s:property value="fieldErrors.get('employeeDocument.documentType')"/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hum.employee.label.document.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employeeDocument.documentType" name="employeeDocument.documentType">
								<s:iterator value="documentTypeList" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
												<s:property value="#el.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{#lang=='sr'}">
												<s:property value="#el.getDOMTEXT_SR()" />
											</s:elseif>
											<s:else>
												<s:property value="#el.getDOMTEXT_EN()" />
											</s:else>
									</option>
								</s:iterator>						
							</select>
						</div>
					</div>
					</s:else>
				<!-- END employeeDocument.documentType -->	
					<!-- START employeeDocument.comments -->
				 <div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.comment"/></label>
						<div class="col-md-10">
							<textarea class="form-control" name="employeeDocument.comments" placeholder="<s:text name="hum.employee.label.comment"/>" rows="4"><s:property value="employeeDocument.comments"/></textarea>
						</div>
				</div>
			<!-- END employeeDocument.comments -->
			<footer class="form-actions">
				<button id="cancelDoc" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
				<button id="saveDoc" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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


function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#employeeDocument\\.docName").val(filename);
    $("#employeeDocument\\.docType").val('.'+fileExt);
 }
	$(document).ready(function () {
		$("#employeeDocument\\.employee\\.id").val($("#employeeId").val());
		$('#employeeDocument\\.documentType').val('<s:property value="employeeDocument.documentType.DOMVALUE"/>');
		$("#cancelDoc").on('click', function(){
			$("#employee_document_form_content").dialog('close');
			});

		$("#employee_document_form_content").on('remove',function(){
			$("#addDocumentButton").prop('disabled',false);
		});
		
		Ladda.bind('#saveDoc');
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					$("#employee_form_content").html(response);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#employee_document_form_content").html(jqXHR.responseText);
			    	var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						var link = "Employee.document.do?employeeId=" + $("#employeeId").val();
						loadURL(link, $("#documentsTab"));
						$("#employee_document_form_content").dialog("close");	
						// alert when have error
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