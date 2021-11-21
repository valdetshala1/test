<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../../base/nocache.jsp"%>
<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body" id="indicator_target_form_content">
		<form id="indicator_target_form" class="form-horizontal" action="IndicatorTargetSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="indicatorTarget.merSubIndicator.id" name="indicatorTarget.merSubIndicator.id" value="<s:property value="indicatorTarget.merSubIndicator.id"/>" />
			<input type="hidden" id="indicatorTarget.id" name="indicatorTarget.id" value="<s:property value="indicatorTarget.id"/>" />
			<input type="hidden" id="indicatorTarget.person.id" name="indicatorTarget.person.id" value="<s:property value="indicatorTarget.person.id"/>" />
			<input type="hidden" id="indicatorTarget.createdDate" name="indicatorTarget.createdDate" value="<s:property value="indicatorTarget.createdDate"/>" />
				<input id="sPlanPer" name="sPlanPer" value="<s:property value='sPlanPer'/>" type="hidden">
		     	 <input id="ePlanPer" name="ePlanPer" value="<s:property value='ePlanPer'/>" type="hidden">
			<fieldset>
				<legend></legend>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.strategy.merPlanPeriod'/></label>
						<div class="col-md-10">
							<input id="sPlanPeriod" name="sPlanPeriod" value="<s:property value='sPlanPer'/>" type="text">
		     				- <input id="ePlanPeriod" name="ePlanPeriod" value="<s:property value='ePlanPer'/>" type="text">
						</div>									
				</div>
				<!-- START indicatorTarget.year-->
				<s:if test="fieldErrors.get('indicatorTarget.year')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='annu.felling.label.year'/></label>
						<div class="col-md-10">
							<input maxlength="4" onchange="controlYear(this.value)" id="indicatorTarget.year" name="indicatorTarget.year" class="form-control" placeholder="<s:text name='annu.felling.label.year'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('indicatorTarget.year')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='annu.felling.label.year'/></label>
						<div class="col-md-10">
							<input maxlength="4" onchange="controlYear(this.value)" id="indicatorTarget.year" name="indicatorTarget.year" value="<s:property value='indicatorTarget.year'/>" class="form-control" placeholder="<s:text name='annu.felling.label.year'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END indicatorTarget.year -->
				<!-- START perfEvaluation.target -->
				<s:if test="fieldErrors.get('indicatorTarget.target')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.perfEvaluation.target'/></label>
						<div class="col-md-10">
							<input id="indicatorTarget.target" name="indicatorTarget.target" class="form-control" placeholder="<s:text name='mer.perfEvaluation.target'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('indicatorTarget.target')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.perfEvaluation.target'/></label>
						<div class="col-md-10">
							<input id="indicatorTarget.target" name="indicatorTarget.target" value="<s:property value='indicatorTarget.target'/>" class="form-control" placeholder="<s:text name='mer.perfEvaluation.target'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END perfEvaluation.target-->
				<!-- START perfEvaluation.note -->
				<s:if test="fieldErrors.get('indicatorTarget.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="mer.execution.note"/></label>
						<div class="col-md-10">
							<textarea id="indicatorTarget.note" name="indicatorTarget.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('perfEvaluation.note')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.execution.note'/></label>
						<div class="col-md-10">
							<textarea id="indicatorTarget.note" name="indicatorTarget.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"><s:property value='perfEvaluation.note'/></textarea>
						</div>									
					</div>
				</s:else>
		<!-- END execution.note -->
		<!-- end widget div -->
					<div class="form-actions">
						<div class="row">
							<div class="col-md-12">
								<button id="cancelPerfEval" class="btn btn-default" type="button">
									<s:text name="label.button.cancel"></s:text>
								</button>
								<button id="savePerfEval" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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

function controlYear(val) {
	if(val<$("#startPlanPeriod").val()||val>$("#endPlanPeriod").val()){
	$('#indicatorTarget\\.year').val("");
	alert('<s:text name='indicatorTarget.year.is.not.in.period'/>');	
	val=null;
	}
}
$(document).ready(function () {
// 	$('#indicatorTarget\\.year').bind('input',function() {alert("Change detected!");});
// 	$('#indicatorTarget\\.year').keyup(function() {
// 	alert("Change detected!");
// 	});
	$("#indicatorTarget\\.merSubIndicator\\.id").val($("#subIndicId").val());
	$("#indicatorTarget\\.target").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
// 	indicatorTarget.year
	$("#sPlanPeriod").val($("#startPlanPeriod").val());
	$("#ePlanPeriod").val($("#endPlanPeriod").val());
	$("#sPlanPer").val($("#startPlanPeriod").val());
	$("#ePlanPer").val($("#endPlanPeriod").val());
	$("#sPlanPeriod").prop('disabled','disabled'); 
	$("#ePlanPeriod").prop('disabled','disabled'); 

	$('#indicatorTarget\\.year').mask('9999');
	Ladda.bind('#savePerfEval');
	$("#savePerfEval").on('click', function () {      
			$("#indicator_target_form :button").prop('disabled','disabled');           
			$('#indicator_target_form').submit();
			return false;        
		});
	$("#cancelPerfEval").on('click', function() {
			$.ajax({
				type : "GET",
				url : "IndicatorTarget.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#indicator_target_form_content").html(jqXHR.responseText);
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
				$("#indicator_target_form_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
		    	$("#indicator_target_form_content").html(jqXHR.responseText);
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
					jQuery("#indicator_target_grid").trigger("reloadGrid");
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
		$("#indicator_target_form :button").prop('disabled',false);
	})();		
});
	
</script>