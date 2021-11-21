<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<link rel="stylesheet" type="text/css" media="all" href="css/fileinput.min.css" />
<script type="text/javascript" src="js/bootstrap/fileinput.min.js"></script>
<script type="text/javascript" src="js/plugin/tokenize/jquery.tokenize.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/tokenize/jquery.tokenize.css">
<style type="text/css">
.tokenize-sample{ width:100% !important; }
</style>	
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="annual_plan_form" class="form-horizontal" action="HrmAnnPlanSave.do" accept-charset="utf8" method="post">
			
			<fieldset>
				<legend><s:text name="hrm.ann.plan.form"/></legend>
				<input id="plan.id" name="plan.id" value="<s:property value='plan.id'/>" type="hidden">	
				<input id="status.id" name="status.id" value="<s:property value='status.id'/>" type="hidden">
				<input id="status.employee.id" name="status.employee.id" value="<s:property value='status.employee.id'/>" type="hidden">
				<input id="status.createDate" name="status.createDate" value="<s:property value='status.createDate'/>" type="hidden">
				<input id="status.status" name="status.status" value="<s:property value='status.status.getDOMVALUE()'/>" type="hidden">
				
				
				<div class="form-group ">
					<!-- START plan.annualPlanAl -->
					<s:if test="fieldErrors.get('plan.annualPlanAl')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name"/></label>
							<div class="col-md-4">
								<input maxlength="50" id="plan.annualPlanAl" name="plan.annualPlanAl" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('plan.annualPlanAl')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name"/></label>
							<div class="col-md-4">
								<input maxlength="50" id="plan.annualPlanAl" name="plan.annualPlanAl" value="<s:property value='plan.annualPlanAl'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END plan.annualPlanAl -->
					
					<!-- START plan.annualPlanEn -->
					<s:if test="fieldErrors.get('plan.annualPlanEn')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.en"/></label>
							<div class="col-md-4">
								<input maxlength="50" id="plan.annualPlanEn" name="plan.annualPlanEn" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('plan.annualPlanEn')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.en"/></label>
							<div class="col-md-4">
								<input maxlength="50" id="plan.annualPlanEn" name="plan.annualPlanEn" value="<s:property value='plan.annualPlanEn'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END plan.annualPlanEn -->
				</div>
				<div class="form-group ">
					<!-- START plan.annualPlanSr -->
					<s:if test="fieldErrors.get('plan.annualPlanSr')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.sr"/></label>
							<div class="col-md-4">
								<input maxlength="50" id="plan.annualPlanSr" name="plan.annualPlanSr" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('plan.annualPlanSr')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.sr"/></label>
							<div class="col-md-4">
								<input maxlength="50" id="plan.annualPlanSr" name="plan.annualPlanSr" value="<s:property value='plan.annualPlanSr'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END plan.annualPlanSr -->
					
					<!-- START plan.submissionDate -->
					<s:if test="fieldErrors.get('plan.code')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label"><s:text name="hrm.ann.plan.submission.date"/></label>
							<div class="col-md-4">
								<input id="plan.submissionDate" name="plan.submissionDate" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('plan.submissionDate')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label"><s:text name="hrm.ann.plan.submission.date"/></label>
							<div class="col-md-4">
								<input id="plan.submissionDate" name="plan.submissionDate" value="<s:property value='plan.submissionDate'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END plan.submissionDate -->
				</div>
				<!-- START plan.employee-->
				    <div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hrm.decision.employee"/></label>
						<div class="col-md-10">
							<select class="tokenize-sample" id="employeeIdList" name="employeeIdList" multiple="multiple" >
									<s:iterator value="plan.hrmAnnPlanEmployees" var="rb">
											<option value="<s:property value="employee.id"/>" selected="selected"><s:property value="employee.firstName"/> <s:property value="employee.lastName"/></option>
									</s:iterator>						
							</select>
						</div>
					</div>	
				<!-- END plan.employee -->
				<!--  START plan.comment -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.comment"/></label>
					<div class="col-md-10">
						<textarea id="plan.comment" name="plan.comment"  class="form-control"><s:property value='plan.comment'/></textarea>
					</div>									
				</div>
				<!-- END plan.comment -->
			</fieldset>
			<fieldset>
			<legend><s:text name="tender.request.attachment"/></legend>
			<div class="">
				<!--  START doc.file -->
				<div class="form-group">
					  <label class="control-label col-sm-2"><s:text name="dp.doc.attachments"/></label>
					  <div class="col-md-10">
						<input id="fileUpload" name="fileUpload" class="file-loading" type="file" multiple=true data-preview-file-type="any" data-upload-url="#">			  
					  </div>
			  	</div>
				<!-- END doc.file -->
				
				<!--  START doc.note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.comment"/></label>
					<div class="col-md-10">
						<textarea id="doc.note" name="doc.note"  class="form-control"><s:property value='doc.note'/></textarea>
					</div>									
				</div>
				<!-- END doc.note -->
			</div>
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAP" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveAP" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>

			

		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
		
<script type="text/javascript">
	$(document).ready(function () {
		$("#fileUpload").fileinput({});
		$('#plan\\.submissionDate').datetimepicker({
			lang: 'en',
			format: 'd.m.Y',
			mask: false,
			timepicker: false
		});
		$('#employeeIdList').tokenize({
		    datas: "Input.employee.do",
		    searchParam: 'name_startsWith',
		    newElements: true,
		    valueField: 'id',
		    textField: 'name',
		    dataType: 'json',
		    onAddToken: function(value, text){
			}
		});
		$("#cancelAP").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "HrmAnnPlan.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#annual_plan_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						//timeout: 6000,
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});			
			return false;        
		});
		Ladda.bind('#saveAP');
		$("#saveAP").on('click', function () {  
			$("#annual_plan_form :button").prop('disabled','disabled');                 
			$('#annual_plan_form').submit();
			return false;        
		});
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					$("#annual_plan_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
				success : function(data, status, jqXHR) { // on success..
					$("#annual_plan_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#annual_plan_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
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
			$("#annual_plan_form :button").prop('disabled',false);				
		})();
			
	});            
</script>