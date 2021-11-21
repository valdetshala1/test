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
		<form id="subproject_form" class="form-horizontal" action="SubProjectSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="subproject.id" name="subproject.id" value="<s:property value="subproject.id"/>" />
			<input type="hidden" id="subproject.merProject.id" name="subproject.merProject.id" value="<s:property value="subproject.merProject.id"/>" />
			<input type="hidden" id="subproject.person.id" name="subproject.person.id" value="<s:property value="subproject.person.id"/>" />
			<input type="hidden" id="subproject.createdDate" name="subproject.createdDate" value="<s:property value="subproject.createdDate"/>" />
			<fieldset>
				<legend><s:text name='mer.subproject.data'/></legend>
				<!-- START subproject.name-->
				<s:if test="fieldErrors.get('subproject.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.name'/></label>
						<div class="col-md-10">
							<input id="subproject.name" name="subproject.name" class="form-control" placeholder="<s:text name='mer.project.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subproject.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name'/></label>
						<div class="col-md-10">
							<input id="subproject.name" name="subproject.name" value="<s:property value='subproject.name'/>" class="form-control" placeholder="<s:text name='mer.project.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END subproject.name -->
				<!-- START subproject.nameEn -->
				<s:if test="fieldErrors.get('subproject.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameEn'/></label>
						<div class="col-md-10">
							<input id="subproject.nameEn" name="subproject.nameEn" class="form-control" placeholder="<s:text name='mer.project.nameEn'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subproject.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameEn'/></label>
						<div class="col-md-10">
							<input id="subproject.nameEn" name="subproject.nameEn" value="<s:property value='subproject.nameEn'/>" class="form-control" placeholder="<s:text name='mer.project.nameEn'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END subproject.nameEn -->
				<!-- START subproject.nameSr -->
				<s:if test="fieldErrors.get('subproject.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameSr'/></label>
						<div class="col-md-10">
							<input id="subproject.nameSr" name="subproject.nameSr" class="form-control" placeholder="<s:text name='mer.project.nameSr'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subproject.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameSr'/></label>
						<div class="col-md-10">
							<input id="subproject.nameSr" name="subproject.nameSr" value="<s:property value='subproject.nameSr'/>" class="form-control" placeholder="<s:text name='mer.project.nameSr'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END subproject.nameSr -->
				<!-- START project.code -->
				<s:if test="fieldErrors.get('subproject.code')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.code'/></label>
						<div class="col-md-10">
							<input maxlength="3" id="subproject.code" name="subproject.code" class="form-control" placeholder="<s:text name='mer.project.code'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subproject.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.code'/></label>
						<div class="col-md-10">
							<input maxlength="3" id="subproject.code" name="subproject.code" value="<s:property value='subproject.code'/>" class="form-control" placeholder="<s:text name='mer.project.code'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END subproject.code -->
				<!-- START subproject.priority -->
				<s:if test="fieldErrors.get('subproject.priority')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='mer.subproject.priority'/></label>
						<div class="col-md-10">
							<input maxlength="2" id="subproject.priority" name="subproject.priority" class="form-control" placeholder="<s:text name='mer.subproject.priority'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subproject.priority')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.project.priority'/></label>
						<div class="col-md-10">
							<input maxlength="2" id="subproject.priority" name="subproject.priority" value="<s:property value='subproject.priority'/>" class="form-control" placeholder="<s:text name='mer.project.priority'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END subproject.priority -->
				<!-- START subproject.description -->
				<s:if test="fieldErrors.get('subproject.description')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="mer.project.description"/></label>
						<div class="col-md-10">
							<textarea id="subproject.description" name="subproject.description" class="form-control" placeholder="<s:text name="mer.project.description"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('role.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.project.description'/></label>
						<div class="col-md-10">
							<textarea id="subproject.description" name="subproject.description" class="form-control" placeholder="<s:text name="mer.project.description"/>"><s:property value='subproject.description'/></textarea>
						</div>									
					</div>
				</s:else>
		<!-- END subproject.description -->
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
	$("#subproject\\.priority").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
		$("#subproject\\.merProject\\.id").val($("#projId").val());

		Ladda.bind('#save');
		$("#save").on('click', function () {  
			$("#subproject_form :button").prop('disabled','disabled');             
			$('#subproject_form').submit();
			return false;        
		});
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "SubProject.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#subproject_form_content").html(jqXHR.responseText);
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
					$("#subproject_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#subproject_form_content").html(jqXHR.responseText);
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
						jQuery("#subproject_grid").trigger("reloadGrid");
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
			$("#subproject_form :button").prop('disabled',false);
		})();			
});
	
</script>