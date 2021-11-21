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
		<form id="object_form" class="form-horizontal" action="RbacObjectSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input id="rbacObject.id" name="rbacObject.id" value="<s:property value='rbacObject.id'/>" type="hidden">
			<fieldset>
				<legend><s:text name="adm.object.data"/></legend>
				
				<!-- START rbacObject.name -->
				<s:if test="fieldErrors.get('rbacObject.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hrm.skill.grid.name"/></label>
						<div class="col-md-10">
							<input id="rbacObject.name" name="rbacObject.name" class="form-control" placeholder="<s:text name="hrm.skill.grid.name"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('rbacObject.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hrm.skill.grid.name"/></label>
						<div class="col-md-10">
							<input id="rbacObject.name" name="rbacObject.name" value="<s:property value='rbacObject.name'/>" class="form-control" placeholder="<s:text name="hrm.skill.grid.name"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END rbacObject.name -->
				
				<!-- START rbacObject.parentId -->
				<s:if test="fieldErrors.get('rbacObject.parentId')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="adm.organisation.label.parent"/></label>
						<div class="col-md-10">
							<input id="parentName" name="parentName" class="form-control" placeholder="<s:text name="adm.organisation.label.parent"/>" type="text">
							<input id="rbacObject.parentId" name="rbacObject.parentId" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('rbacObject.parentId')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.organisation.label.parent"/></label>
						<div class="col-md-10">
							<input id="parentName" name="parentName" value="<s:property value='rbacObjectParent.name'/>" class="form-control" placeholder="<s:text name="adm.organisation.label.parent"/>" type="text">
							<input id="rbacObject.parentId" name="rbacObject.parentId" value="<s:property value='rbacObject.parentId'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END rbacObject.name -->
								
				<!-- START rbacObject.code -->
				<s:if test="fieldErrors.get('rbacObject.code')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="adm.organisation.label.code"/></label>
						<div class="col-md-10">
							<input id="rbacObject.code" name="rbacObject.code" class="form-control" placeholder="<s:text name="adm.organisation.label.code"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('rbacObject.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.organisation.label.code"/></label>
						<div class="col-md-10">
							<input id="rbacObject.code" name="rbacObject.code" value="<s:property value='rbacObject.code'/>" class="form-control" placeholder="<s:text name="adm.organisation.label.code"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END rbacObject.code -->
				
				<!-- START rbacObject.locked -->
				<s:if test="fieldErrors.get('rbacObject.locked')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="adm.objects.locked"/></label>
						<div class="col-md-10">
							<input id="rbacObject.locked" name="rbacObject.locked" class="form-control" placeholder="<s:text name="adm.objects.locked"/>" type="checkbox">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('rbacObject.locked')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.objects.locked"/></label>
						<div class="col-md-10">
							<input id="rbacObject.locked" name="rbacObject.locked" placeholder="<s:text name="adm.objects.locked"/>" type="checkbox">
						</div>									
					</div>
				</s:else>
				<!-- END rbacObject.code -->
			
			</fieldset>

			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancel" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="save" class="btn btn-primary" type="submit">
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
$(document).ready(function() {
		$("#parentName").autocomplete({
			source: function( request, response ) {
				$.ajax({
					url: "Input.rbacObjects.do",
					dataType: "json",
					data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						minLength: 2,
						name_startsWith: request.term
					},
					success: function( data ) {
						response( $.map( data, function(item) {
							return {
								label: item.name, 
								value: item.name,
								id: item.id 
							};
						}));
					}
				});
			},
			maxRows: 12,
			minLength: 2,
			change: function(event, ui) {
			},
			select: function( event, ui ) {
	            $("#rbacObject\\.parentId" ).val( ui.item.id);
			},
			focus: function(event, ui) {
			}
		});	


		$("#save").on('click', function () {               
			$('#object_form').submit();
			return false;        
		});

		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "RbacObject.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#object_form_content").html(jqXHR.responseText);
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
					$("#object_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#object_form_content").html(jqXHR.responseText);
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
						jQuery("#object_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}	    	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();		

});
</script>