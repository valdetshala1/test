<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<script type="text/javascript" src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/ajaxwidget/ui.combobox-custom.css">		
	
<!-- widget div-->
<div id="employee_training_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="employee_training_form" class="form-horizontal" action="EmployeeTrainingSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="employeeSkill.id" name="employeeSkill.id" value="<s:property value="employeeSkill.id"/>" />
			<input type="hidden" id="employeeSkill.employee.id" name="employeeSkill.employee.id" value="<s:property value="employeeSkill.employee.id"/>"/>
			<input type="hidden" id="employeeSkill.docType" name="employeeSkill.docType" value="<s:property value="employeeSkill.docType"/>" />
			<input type="hidden" id="employeeSkill.docName" name="employeeSkill.docName" value="<s:property value="employeeSkill.docName"/>" />	
				<!-- START employeeSkill.skillName -->
				<s:if test="fieldErrors.get('employeeSkill.skillName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.skill.grid.training.name"/></label>
						<div class="col-md-10">
							<input id="employeeSkill.skillName" name="employeeSkill.skillName" class="form-control" placeholder="<s:text name="hrm.skill.grid.training.name"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('employeeSkill.skillName')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrm.skill.grid.training.name"/></label>
						<div class="col-md-10">
							<input id="employeeSkill.skillName" name="employeeSkill.skillName" value="<s:property value='employeeSkill.skillName'/>" class="form-control" placeholder="<s:text name="hrm.skill.grid.training.name"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END employeeSkill.skillName -->
				<!-- START employeeSkill.institute -->
				<s:if test="fieldErrors.get('employeeSkill.institute')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hrm.skill.label.institute"/></label>
						<div class="col-md-10">
							<input id="employeeSkill.institute" name="employeeSkill.institute" class="form-control" placeholder="<s:text name="hrm.skill.label.institute"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('employeeSkill.institute')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hrm.skill.label.institute"/></label>
						<div class="col-md-10">
							<input id="employeeSkill.institute" name="employeeSkill.institute" value="<s:property value='employeeSkill.institute'/>" class="form-control" placeholder="<s:text name="hrm.skill.label.institute"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END employeeSkill.institute -->
				
				<!-- START employeeSkill.dateStart -->
				<s:if test="fieldErrors.get('employeeSkill.dateStart')!=null">
				<div class="form-group has-error">
					<label class="col-md-2 control-label">*<s:text name="hrm.skill.label.start.date"/> </label>
					<div class="col-md-10">
						<input id="employeeSkill.dateStart" name="employeeSkill.dateStart" value="<s:property value='employeeSkill.dateStart'/>" class="form-control" placeholder="dd.mm.yy" type="text">
						<span class="help-block"><i class="fa fa-warning"></i> <s:text name='payment.start.date.empty'/> </span>
						
					</div>
				</div>
				</s:if>
				<s:elseif test="fieldErrors.get('employeeSkill.dateStart.toLarge')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.skill.label.start.date"/></label>
						<div class="col-md-10">
						<input id="employeeSkill.dateStart" name="employeeSkill.dateStart" value="<s:property value='employeeSkill.dateStart'/>" class="form-control" placeholder="dd.mm.yy" type="text">
						<span class="help-block"><i class="fa fa-warning"></i> <s:text name='employee.start.date.greater'/> </span>
						
						</div>					
					</div>
				</s:elseif>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="hrm.skill.label.start.date"/> </label>
					<div class="col-md-10">
						<input id="employeeSkill.dateStart" name="employeeSkill.dateStart" value="<s:property value='employeeSkill.dateStart'/>" class="form-control" placeholder="dd.mm.yy" type="text">
					</div>
				</div>
				</s:else>
				<!-- END employeeSkill.dateStart -->
				
				<!-- START employeeSkill.dateEnd -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hrm.skill.label.end.date"/></label>
					<div class="col-md-10">
						<input id="employeeSkill.dateEnd" name="employeeSkill.dateEnd" value="<s:property value='employeeSkill.dateEnd'/>" class="form-control" placeholder="dd.mm.yy" type="text">
					</div>
				</div>
				<!-- END employeeSkill.dateEnd -->
				<!-- START employeeSkill.attachment -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hrm.skill.label.attachment"/></label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default" id="file" name="file" onchange="getFileData(this);">
					</div>
				</div>
				<!-- END employeeSkill.attachment -->
				<!-- START employeeSkill.details -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hrm.skill.label.details"/></label>
					<div class="col-md-10">
						<textarea class="form-control" placeholder="Textarea"  name="employeeSkill.details" rows="4"><s:property value="employeeSkill.details"/></textarea>
					</div>
				</div>
			<!-- End employeeSkill.details -->
			<footer class="form-actions">
				<button id="cancelTra" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
				<button id="saveTra" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
    $("#employeeSkill\\.docName").val(filename);
    $("#employeeSkill\\.docType").val('.'+fileExt);
 }		
	$(document).ready(function () {
		var lang='<s:property value="locale.language"/>';
		$('#employeeSkill\\.dateStart').datetimepicker({
			lang: lang,
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});
		$('#employeeSkill\\.dateEnd').datetimepicker({
			lang: lang,
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});
		$("#employeeSkill\\.employee\\.id").val($("#employeeId").val());
		$('#employeeSkill\\.educationType').val('<s:property value="employeeSkill.educationType.DOMVALUE"/>');

		$("#cancelTra").on('click', function(){
			$("#employee_training_form_content").dialog('close');
			});
		
// 		$("#saveTra").on('click', function(){
// 			$('#employee_training_form').submit();
// 			});

		$("#employee_training_form_content").on('remove',function(){
			$("#addTrainingButton").prop('disabled',false);
		});
		Ladda.bind('#saveTra');
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					alert(err);
					$("#employee_training_form_content").html(response);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#employee_training_form_content").html(jqXHR.responseText);
			    	var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						var link = "Employee.training.do?employeeId=" + $("#employeeId").val();
						loadURL(link, $("#trainingTab"));
						$("#employee_training_form_content").dialog("close");			
						$.smallBox({
							title : "<s:text name="small.box.on.save.title.success"/>",
							content : "<s:text name="small.box.content"/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					} else{
						$.smallBox({
						title : "<s:text name="small.box.on.save.title.failed"/>",
						content : "<s:text name="small.box.content"/>",
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