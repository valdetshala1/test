<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="indicator_strat_form_content">
		<form id="indicator_strat_form" class="form-horizontal" action="StratIndicatorSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="indicator.id" name="indicator.id" value="<s:property value="indicator.id"/>" />
			<input type="hidden" id="indicator.person.id" name="indicator.person.id" value="<s:property value="indicator.person.id"/>" />
			<input type="hidden" id="indicator.createdDate" name="indicator.createdDate" value="<s:property value="indicator.createdDate"/>" />
			<input type="hidden" id="indicator.merStrategy.id" name="indicator.merStrategy.id" value="<s:property value="indicator.merStrategy.id"/>" />
			<input type="hidden" id="indicator.type" name="indicator.type" value="S" />
			<fieldset>
				<!-- START indicator.name -->
				<s:if test="fieldErrors.get('indicator.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.name'/></label>
						<div class="col-md-10">
							<input id="indicator.name" name="indicator.name" class="form-control" placeholder="<s:text name='mer.project.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('indicator.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name'/></label>
						<div class="col-md-10">
							<input id="indicator.name" name="indicator.name" value="<s:property value='indicator.name'/>" class="form-control" placeholder="<s:text name='mer.project.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END indicator.name -->
				<!-- START indicator.nameEn -->
				<s:if test="fieldErrors.get('indicator.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameEn'/></label>
						<div class="col-md-10">
							<input id="indicator.nameEn" name="indicator.nameEn" class="form-control" placeholder="<s:text name='mer.project.nameEn'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('indicator.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameEn'/></label>
						<div class="col-md-10">
							<input id="indicator.nameEn" name="indicator.nameEn" value="<s:property value='indicator.nameEn'/>" class="form-control" placeholder="<s:text name='mer.project.nameEn'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END indicator.nameEn -->
				<!-- START indicator.nameSr -->
				<s:if test="fieldErrors.get('indicator.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameSr'/></label>
						<div class="col-md-10">
							<input id="indicator.nameSr" name="indicator.nameSr" class="form-control" placeholder="<s:text name='mer.project.nameSr'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('indicator.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameSr'/></label>
						<div class="col-md-10">
							<input id="indicator.nameSr" name="indicator.nameSr" value="<s:property value='indicator.nameSr'/>" class="form-control" placeholder="<s:text name='mer.project.nameSr'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END indicator.nameSr -->
				<!-- START indicator.description -->
				<s:if test="fieldErrors.get('indicator.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="mer.execution.note"/></label>
						<div class="col-md-10">
							<textarea id="indicator.note" name="indicator.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('indicator.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.execution.note'/></label>
						<div class="col-md-10">
							<textarea id="indicator.note" name="indicator.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"><s:property value='indicator.note'/></textarea>
						</div>									
					</div>
				</s:else>
			<!-- END indicator.description -->
			<!-- end widget div -->
				<div class="form-actions">
					<div class="row">
						<div class="col-md-12">
							<button id="cancelStratIndc" class="btn btn-default" type="button">
								<s:text name="label.button.cancel"></s:text>
							</button>
							<button id="saveStratIndc" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#indicator\\.merStrategy\\.id").val($("#stratId").val());

		Ladda.bind('#saveStratIndc');
		$("#saveStratIndc").on('click', function () {  
			$("#indicator_strat_form :button").prop('disabled','disabled');             
			$('#indicator_strat_form').submit();
			return false;        
		});

		$("#cancelStratIndc").on('click', function() {
			$.ajax({
				type : "GET",
				url : "StratIndicator.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#indicator_strat_form_content").html(jqXHR.responseText);
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
					$("#indicator_strat_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#indicator_strat_form_content").html(jqXHR.responseText);
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
			$("#indicator_strat_form :button").prop('disabled',false);
		})();		
});
	
</script>