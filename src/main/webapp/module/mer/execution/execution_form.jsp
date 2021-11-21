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
		<form id="execution_form" class="form-horizontal" action="ExecutionSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="execution.id" name="execution.id" value="<s:property value="execution.id"/>" />
			<input type="hidden" id="execution.person.id" name="execution.person.id" value="<s:property value="execution.person.id"/>" />
			<input type="hidden" id="execution.createdDate" name="execution.createdDate" value="<s:property value="execution.createdDate"/>" />
			<input type="hidden" id="execution.merStrategy.id" name="execution.merStrategy.id" value="<s:property value="execution.merStrategy.id"/>" />
			<fieldset>
				<!-- START execution.executionDate -->
				<s:if test="fieldErrors.get('execution.executionDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.execution.date'/></label>
						<div class="col-md-10">
							<input id="execution.executionDate" name="execution.executionDate" class="form-control" placeholder="<s:text name='mer.execution.date'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('execution.executionDate')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.execution.date'/></label>
						<div class="col-md-10">
							<input id="execution.executionDate" name="execution.executionDate" value="<s:property value='execution.executionDate'/>" class="form-control" placeholder="<s:text name='mer.execution.date'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END execution.executionDate -->
				<!-- START execution.status -->
				<s:if test="fieldErrors.get('execution.status')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.execution.status'/></label>
						<div class="col-md-10">
							<select  class="form-control" id="execution.status"
								name="execution.status">
								<s:iterator value="merstrategystatusList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" /> 
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" /> 
										</s:else>
									</option>
								</s:iterator>
							</select><span
								class="help-block"><i class="fa fa-warning"></i> <s:property
								value="fieldErrors.get('execution.status')" /> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.execution.status'/></label>
						<div class="col-md-10">
							<select class="form-control" id="execution.status"
								name="execution.status">
								<s:iterator value="merstrategystatusList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" /> 
										</s:else>
									</option>
								</s:iterator>
							</select>
						</div>									
					</div>
				</s:else>
				<!-- END execution.status -->
				<!-- START execution.note -->
				<s:if test="fieldErrors.get('execution.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="mer.execution.note"/></label>
						<div class="col-md-10">
							<textarea id="execution.note" name="execution.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('project.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.execution.note'/></label>
						<div class="col-md-10">
							<textarea id="execution.note" name="execution.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"><s:property value='execution.note'/></textarea>
						</div>									
					</div>
				</s:else>
		<!-- END execution.note -->
		
				
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
$(document).ready(function () {
		$("#execution\\.merStrategy\\.id").val($("#stratId").val());
		$('#execution\\.status').val('<s:property value="execution.status.DOMVALUE"/>');
		$('#execution\\.executionDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});

		Ladda.bind('#save');
		$("#save").on('click', function () {   
			$("#execution_form :button").prop('disabled','disabled');             
			$('#execution_form').submit();
			return false;        
		});

		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "Execution.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#execution_form_content").html(jqXHR.responseText);
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
					$("#execution_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#execution_form_content").html(jqXHR.responseText);
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
						jQuery("#execution_grid").trigger("reloadGrid");
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
			$("#execution_form :button").prop('disabled',false);
		})();		
});
	
</script>