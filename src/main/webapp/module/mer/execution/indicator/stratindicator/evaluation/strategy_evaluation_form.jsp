<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="strat_evaluation_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">
		<form id="strategy_evaluation_form" class="form-horizontal" action="StratEvaluationSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="stratEval.id" name="stratEval.id" value="<s:property value="stratEval.id"/>" />
			
			<input type="hidden" id="stratEval.person.id" name="stratEval.person.id" value="<s:property value="stratEval.person.id"/>" />
			<input type="hidden" id="stratEval.createdDate" name="stratEval.createdDate" value="<s:property value="stratEval.createdDate"/>" />
			
			<input type="hidden" id="stratEval.merIndicator.id" name="stratEval.merIndicator.id" value="<s:property value="stratEval.merIndicator.id"/>" />
			
			<input type="hidden" id="language" name="locale.language" value="<s:property value="locale.language"/>" />
			
			<fieldset>
				<legend><s:text name='mer.stratEval.data'/></legend>
				
				<!-- START stratEval.evalDate -->
				<s:if test="fieldErrors.get('stratEval.evalDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-3 control-label">*<s:text name='mer.stratEval.evalDate'/></label>
						<div class="col-md-9">
							<input id="stratEval.evalDate" name="stratEval.evalDate" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stratEval.evalDate')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-3 control-label">*<s:text name='mer.stratEval.evalDate'/></label>
						<div class="col-md-9">
							<input id="stratEval.evalDate" name="stratEval.evalDate" class="form-control" value="<s:property value='stratEval.evalDate'/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END stratEval.evalDate -->
				
				<!-- START stratEval.programResults -->
				<s:if test="fieldErrors.get('stratEval.programResults')!=null">
					<div class="form-group has-error">
						<label class="col-md-3 control-label">*<s:text name="mer.stratEval.programResults"/></label>
						<div class="col-md-9">
							<textarea id="stratEval.programResults" name="stratEval.programResults" class="form-control"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stratEval.programResults')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-3 control-label">*<s:text name='mer.stratEval.programResults'/></label>
						<div class="col-md-9">
							<textarea id="stratEval.programResults" name="stratEval.programResults" class="form-control" ><s:property value="stratEval.programResults"/></textarea>
						</div>									
					</div>
				</s:else>
				<!-- END stratEval.programResults -->
				
				
				<!-- START stratEval.note -->
					<div class="form-group">
						<label class="col-md-3 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-9">
							<textarea id="stratEval.note" name="stratEval.note" class="form-control"><s:property value="stratEval.note"/></textarea>
						</div>									
					</div>
				<!-- END stratEval.note -->
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelSE" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveSE" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#stratEval\\.merIndicator\\.id").val($("#stratIndicatorId").val());
		$('#stratEval\\.evalDate').datetimepicker({
			timepicker:false,
			format:'d.m.Y', 
			mask:false,
			formatDate:'d.m.Y'
		});
		
		
		$("#cancelSE").on('click', function() {
			$("#strat_evaluation_form_content").dialog("close");
			return false;
		});		

		Ladda.bind('#saveSE');
		$("#saveSE").on('click', function () {      
			$("#strategy_evaluation_form :button").prop('disabled','disabled');           
			$('#strategy_evaluation_form').submit();
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
					$("#strat_evaluation_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#strat_evaluation_form_content").html(jqXHR.responseText);
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
						jQuery("#strat_indicator_grid").trigger("reloadGrid");
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
			$("#strategy_evaluation_form :button").prop('disabled',false);
		})();	
});
	
</script>