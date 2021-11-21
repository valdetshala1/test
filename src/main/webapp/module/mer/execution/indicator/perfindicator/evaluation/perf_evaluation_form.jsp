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
	<div class="widget-body" id="perf_evaluation_form_content">
		<form id="perf_eval_form" class="form-horizontal" action="PerfEvaluationSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="subproject.id" name="perfEvaluation.id" value="<s:property value="perfEvaluation.id"/>" />
			<input type="hidden" id="perfEvaluation.merSubIndicator.id" name="perfEvaluation.merSubIndicator.id" value="<s:property value="perfEvaluation.merSubIndicator.id"/>" />
			<input type="hidden" id="perfEvaluation.person.id" name="perfEvaluation.person.id" value="<s:property value="perfEvaluation.person.id"/>" />
			<input type="hidden" id="perfEvaluation.createdDate" name="perfEvaluation.createdDate" value="<s:property value="perfEvaluation.createdDate"/>" />
			<fieldset>
				<legend><s:text name='mer.perfEvaluation.data'/></legend>
				<!-- START perfEvaluation.evalDate-->
				<s:if test="fieldErrors.get('perfEvaluation.evalDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.execution.date'/></label>
						<div class="col-md-10">
							<input id="perfEvaluation.evalDate" name="perfEvaluation.evalDate" class="form-control" placeholder="<s:text name='mer.execution.date'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('perfEvaluation.evalDate')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.execution.date'/></label>
						<div class="col-md-10">
							<input id="perfEvaluation.evalDate" name="perfEvaluation.evalDate" value="<s:property value='perfEvaluation.evalDate'/>" class="form-control" placeholder="<s:text name='mer.execution.date'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END perfEvaluation.evalDate -->
				<!-- START perfEvaluation.target -->
<%-- 				<s:if test="fieldErrors.get('perfEvaluation.target')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label">*<s:text name='mer.perfEvaluation.target'/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<input id="perfEvaluation.target" name="perfEvaluation.target" class="form-control" placeholder="<s:text name='mer.perfEvaluation.target'/>" type="text"> --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('perfEvaluation.target')"/> </span> --%>
<!-- 						</div>					 -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label">*<s:text name='mer.perfEvaluation.target'/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<input id="perfEvaluation.target" name="perfEvaluation.target" value="<s:property value='perfEvaluation.target'/>" class="form-control" placeholder="<s:text name='mer.perfEvaluation.target'/>" type="text"> --%>
<!-- 						</div>									 -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END perfEvaluation.target-->
				<!-- START perfEvaluation.actual -->
				<s:if test="fieldErrors.get('perfEvaluation.actual')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.perfEvaluation.actual'/></label>
						<div class="col-md-10">
							<input id="perfEvaluation.actual" name="perfEvaluation.actual" class="form-control" placeholder="<s:text name='mer.perfEvaluation.actual'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('perfEvaluation.actual')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.perfEvaluation.actual'/></label>
						<div class="col-md-10">
							<input id="perfEvaluation.actual" name="perfEvaluation.actual" value="<s:property value='perfEvaluation.actual'/>" class="form-control" placeholder="<s:text name='mer.perfEvaluation.actual'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END perfEvaluation.actual -->
				<!-- START perfEvaluation.note -->
				<s:if test="fieldErrors.get('perfEvaluation.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="mer.execution.note"/></label>
						<div class="col-md-10">
							<textarea id="perfEvaluation.note" name="perfEvaluation.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('perfEvaluation.note')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.execution.note'/></label>
						<div class="col-md-10">
							<textarea id="perfEvaluation.note" name="perfEvaluation.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"><s:property value='perfEvaluation.note'/></textarea>
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
$(document).ready(function () {
	$("#perfEvaluation\\.merSubIndicator\\.id").val($("#subIndicId").val());
	$('#perfEvaluation\\.evalDate').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		timepicker: false,
    			
	});
	$("#perfEvaluation\\.target").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	$("#perfEvaluation\\.actual").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});

	Ladda.bind('#savePerfEval');
	$("#savePerfEval").on('click', function () {      
			$("#perf_eval_form :button").prop('disabled','disabled');           
			$('#perf_eval_form').submit();
			return false;        
		});
	$("#cancelPerfEval").on('click', function() {
			$.ajax({
				type : "GET",
				url : "PerfEvaluation.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#perf_evaluation_form_content").html(jqXHR.responseText);
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
				$("#perf_evaluation_form_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
		    	$("#perf_evaluation_form_content").html(jqXHR.responseText);
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
					jQuery("#perf_eval_grid").trigger("reloadGrid");
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
		$("#perf_eval_form :button").prop('disabled',false);
	})();		
});
	
</script>