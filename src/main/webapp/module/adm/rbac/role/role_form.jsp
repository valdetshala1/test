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
		<form id="role_form" class="form-horizontal" action="RoleSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="role.id" name="role.id" value="<s:property value="role.id"/>" />
			<input type="hidden" id="jsonObjectOperation" name="jsonObjectOperation" value="jsonObjectOperation">
			<fieldset>
				<legend><s:text name='adm.rbac.role.data'/></legend>
				
				<!-- START role.name -->
				<s:if test="fieldErrors.get('role.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name'/></label>
						<div class="col-md-10">
							<input id="role.name" name="role.name" class="form-control" placeholder="<s:text name='leave.type.label.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('role.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name'/></label>
						<div class="col-md-10">
							<input id="role.name" name="role.name" value="<s:property value='role.name'/>" class="form-control" placeholder="<s:text name='leave.type.label.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END role.name -->
				
				<!-- START role.nameEn -->
				<s:if test="fieldErrors.get('role.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name.en'/></label>
						<div class="col-md-10">
							<input id="role.nameEn" name="role.nameEn" class="form-control" placeholder="<s:text name='leave.type.label.name.en'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('role.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name.en'/></label>
						<div class="col-md-10">
							<input id="role.nameEn" name="role.nameEn" value="<s:property value='role.nameEn'/>" class="form-control" placeholder="<s:text name='leave.type.label.name.en'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END role.nameEn -->
				
				<!-- START role.nameSr -->
				<s:if test="fieldErrors.get('role.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name.sr'/></label>
						<div class="col-md-10">
							<input id="role.nameSr" name="role.nameSr" class="form-control" placeholder="<s:text name='leave.type.label.name.sr'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('role.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name.sr'/></label>
						<div class="col-md-10">
							<input id="role.nameSr" name="role.nameSr" value="<s:property value='role.nameSr'/>" class="form-control" placeholder="<s:text name='leave.type.label.name.sr'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END role.nameSr -->
				
				<!-- START role.code -->
				<s:if test="fieldErrors.get('role.code')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.code'/></label>
						<div class="col-md-10">
							<input id="role.code" name="role.code" class="form-control" placeholder="<s:text name='leave.type.label.code'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('role.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.code'/></label>
						<div class="col-md-10">
							<input id="role.code" name="role.code" value="<s:property value='role.code'/>" class="form-control" placeholder="<s:text name='leave.type.label.code'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END role.code -->
				
				<!-- START role.permissions -->
				<div id="permissions_container">
					<table id="perm_grid" class="scroll" cellpadding="0" cellspacing="0"></table>
					<div id="role_grid_pager" class="scroll"
				style="text-align: center;">
			</div>
				</div>
				<!-- END role.permissions -->
			</fieldset>	
			<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_rbacobject_container">
			
			<table id="object_grid" class="scroll"></table>
			<div id="object_grid_pager" class="scroll"
				style="text-align: center;">
			</div>
			
		</div>

	</div>
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

		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
<script type="text/javascript">
$(document).ready(function () {

	if($("#role\\.id").val()){
		$("#role\\.code").attr('readonly',true);
	}
	Ladda.bind('#save');
	$("#save").on('click', function () { 
		$("#role_form :button").prop('disabled','disabled');              
		$('#role_form').submit();
		return false;        
	});

		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "Role.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#role_form_content").html(jqXHR.responseText);
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
			    },
				error : function(response, status, err){
					$("#role_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#role_form_content").html(jqXHR.responseText);
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
						jQuery("#role_grid").trigger("reloadGrid");
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
		})();		
});

$(window).bind('resize', function() {
	var width = $('#jqGrid_role_container').width();
	$('#role_grid').setGridWidth(width);
});
	
</script>