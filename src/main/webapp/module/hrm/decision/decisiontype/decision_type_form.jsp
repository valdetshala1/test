<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<form id="decision_type_form" class="form-horizontal" action="DecisionTypeSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="decision.type.legend.decision.type.data"/></legend>
				<input id="decisionType.id" name="decisionType.id" value="<s:property value='decisionType.id'/>" type="hidden">
				
				<!-- START decisionType.nameAl -->
				<s:if test="fieldErrors.get('decisionType.nameAl')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="decisionType.nameAl" name="decisionType.nameAl" class="form-control" placeholder="<s:text name="leave.type.label.name"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('decisionType.nameAl')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="leave.type.label.name"/></label>
						<div class="col-md-10">
						<input maxlength="100" id="decisionType.nameAl" name="decisionType.nameAl" class="form-control" value="<s:property value='decisionType.nameAl'/>" placeholder="<s:text name="leave.type.label.name"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END decisionType.nameAl -->
				
				<!-- START decisionType.nameEn -->
				<s:if test="fieldErrors.get('decisionType.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.en"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="decisionType.nameEn" name="decisionType.nameEn" class="form-control" placeholder="<s:text name="leave.type.label.name.en"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('decisionType.nameEn')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="leave.type.label.name.en"/></label>
						<div class="col-md-10">
						<input maxlength="100" id="decisionType.nameEn" name="decisionType.nameEn" class="form-control" value="<s:property value='decisionType.nameEn'/>" placeholder="<s:text name="leave.type.label.name.en"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END decisionType.nameEn -->
				
				<!-- START decisionType.nameSr -->
				<s:if test="fieldErrors.get('decisionType.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="leave.type.label.name.sr"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="decisionType.nameSr" name="decisionType.nameSr" class="form-control" placeholder="<s:text name="leave.type.label.name.sr"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('decisionType.nameSr')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="leave.type.label.name.sr"/></label>
						<div class="col-md-10">
						<input maxlength="100" id="decisionType.nameSr" name="decisionType.nameSr" class="form-control" value="<s:property value='decisionType.nameSr'/>" placeholder="<s:text name="leave.type.label.name.sr"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END decision.nameSr -->
				
				<!-- START decisionType.note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="adm.person.label.address.notes"/></label>
					<div class="col-md-10">
						<textarea id="decisionType.note" name="decisionType.note" class="form-control"><s:property value="decisionType.note"/></textarea>
					</div>
				
				</div>	
				<!-- END decisionType.note -->
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="canceDT" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveDT" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#canceDT").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "DecisionType.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#decision_type_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;        
		});
		Ladda.bind('#saveDT');
		$("#saveDT").on('click', function() {
			$("#decision_type_form :button").prop('disabled','disabled');
			$('#decision_type_form').submit();
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
					$("#decision_type_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#decision_type_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
					if(!errors){
						$("#decision_type_grid").trigger("reloadGrid");
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
			$("#decision_type_form :button").prop('disabled',false);
		})();
			    	
	});            
</script>