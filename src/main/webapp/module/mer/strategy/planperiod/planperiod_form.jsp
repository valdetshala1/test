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
		<form id="planperiod_form" class="form-horizontal" action="PlanPeriodSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="period.id" name="period.id" value="<s:property value="period.id"/>" />
			<input type="hidden" id="period.person.id" name="period.person.id" value="<s:property value="period.person.id"/>" />
			<input type="hidden" id="period.createdDate" name="period.createdDate" value="<s:property value="period.createdDate"/>" />
			<fieldset>
				<legend><s:text name='mer.planperiod.data'/></legend>
				<!-- START period.startYear -->
				<s:if test="fieldErrors.get('period.startYear')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.planperiod.start.year'/></label>
						<div class="col-md-10">
							<input data="number" id="period.startYear" name="period.startYear" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('period.startYear')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.planperiod.start.year'/></label>
						<div class="col-md-10">
							<input data="number" id="period.startYear" name="period.startYear" value="<s:property value='period.startYear'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END period.startYear -->
				<!-- START period.endYear -->
				<s:if test="fieldErrors.get('period.endYear')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.planperiod.endYear'/></label>
						<div class="col-md-10">
							<input data="number" id="period.endYear" name="period.endYear" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('period.endYear')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.planperiod.endYear'/></label>
						<div class="col-md-10">
							<input data="number" id="period.endYear" name="period.endYear" value="<s:property value='period.endYear'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END period.endYear -->
				<!-- START period.note -->
				<s:if test="fieldErrors.get('period.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="period.note" name="period.note" class="form-control"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('project.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='hum.employee.label.notes'/></label>
						<div class="col-md-10">
							<textarea id="period.note" name="period.note" class="form-control" ><s:property value="period.note"/></textarea>
						</div>									
					</div>
				</s:else>
		<!-- END period.note -->
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelPLP" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="savePLP" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
$(document).ready(function () {
		$("input[data='number']").mask("9999");

		Ladda.bind('#savePLP');
		$("#savePLP").on('click', function () {    
			$("#planperiod_form :button").prop('disabled','disabled');           
			$('#planperiod_form').submit();
			return false;        
		});

		$("#cancelPLP").on('click', function() {
			$.ajax({
				type : "GET",
				url : "PlanPeriod.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#planperiod_form_content").html(jqXHR.responseText);
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
					$("#planperiod_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#planperiod_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
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
						jQuery("#planperiod_grid").trigger("reloadGrid");
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
			$("#planperiod_form :button").prop('disabled',false);
		})();		
});
	
</script>