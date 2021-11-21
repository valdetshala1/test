<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">
		<form id="annualplan_form" class="form-horizontal" action="DhpetAnnualPlanSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="annualplan.id" name="annualplan.id" value="<s:property value="annualplan.id"/>" />
			<input type="hidden" id="annualplan.employee.id" name="annualplan.employee.id" value="<s:property value="annualplan.employee.id"/>" />
			<input type="hidden" id="annualplan.createdDate" name="annualplan.createdDate" value="<s:property value="annualplan.createdDate"/>" />
			<fieldset>
				<legend><s:text name='tender.request.annual.plan'/></legend>
				
				<!-- START annualplan.dhpetPeriodPlan -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='tender.request.annual.plan'/></label>
						<div class="col-md-10">
							<input readonly id="period" name="period" value="" class="form-control" type="text">
						</div>
						<input id="annualplan.dhpetPeriodPlan.id" name="annualplan.dhpetPeriodPlan.id" value="<s:property value='annualplan.dhpetPeriodPlan.id'/>"class="form-control" type="hidden" >									
					</div>
				<!-- END annualplan.dhpetPeriodPlan -->
				
				<div class="form-group ">
					<!-- START annualplan.year -->
					<s:if test="fieldErrors.get('annualplan.year')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name='annual.plan.year'/></label>
							<div class="col-md-10">
								<input data="number" id="annualplan.year" name="annualplan.year" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('annualplan.year')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<label class="col-md-2 control-label">*<s:text name='annual.plan.year'/></label>
						<div class="col-md-10">
							<input data="number" id="annualplan.year" name="annualplan.year" value="<s:property value='annualplan.year'/>" class="form-control" type="text">
						</div>									
					</s:else>
					<!-- END annualplan.year -->
				</div>
				
				<!-- START attachment -->
				<s:if test="fieldErrors.get('file')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="tender.request.attachment"/>:</label>
					 	  <div class="col-md-10">
					      	<input class="form-control input-xs-g" id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('file')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
						<div class="col-md-10">
							<input class="form-control input-xs-g" id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">							
						</div>
					</div>
				</s:else>
				<input id="annualplan.docName" name="annualplan.docName" type="hidden" value="<s:property value='annualplan.docName'/>">
				<input id="annualplan.docType" name="annualplan.docType" type="hidden" value="<s:property value='annualplan.docType'/>">
				<!-- END attachment -->
				
				<!-- START annualplan.note -->
				<s:if test="fieldErrors.get('annualplan.remark')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="annualplan.remark" name="annualplan.remark" class="form-control"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('annualplan.remark')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='hum.employee.label.notes'/></label>
						<div class="col-md-10">
							<textarea id="annualplan.remark" name="annualplan.remark" class="form-control" ><s:property value="annualplan.remark"/></textarea>
						</div>									
					</div>
				</s:else>
				
		<!-- END annualplan.note -->
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancel" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="save" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>
		</fieldset>
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
   $("#annualplan\\.docName").val(filename);
   $("#annualplan\\.docType").val('.'+fileExt);
}
$(document).ready(function () {
		$("input[data='number']").mask("9999");
		$("#period").val('<s:property value='annualplan.dhpetPeriodPlan.startYear'/> - <s:property value='annualplan.dhpetPeriodPlan.endYear'/>');
		Ladda.bind('#savePLP');
		$("#save").on('click', function () {    
			$("#annualplan_form :button").prop('disabled','disabled');           
			$('#annualplan_form').submit();
			return false;        
		});

		
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "DhpetAnnualPlan.form.do?periodId="+$("#annualplan\\.dhpetPeriodPlan\\.id").val(),
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#annualplan_form_content").html(jqXHR.responseText);
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
				complete : function(jqXHR, textStatus) {
				}
			});
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
					$("#annualplan_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#annualplan_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exist");
					if (errors_exits == "true") {
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					} else {
						jQuery("#annualplan_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
						//$("#farmer_expander").html(jqXHR.responseText);
					}
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});		
			$("#annualplan_form :button").prop('disabled',false);
		})();		
});
	
</script>