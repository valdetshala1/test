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
	<div class="widget-body" id="project_form_content">
		<form id="project_form" class="form-horizontal" action="ProjectSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="project.id" name="project.id" value="<s:property value="project.id"/>" />
			<input type="hidden" id="project.person.id" name="project.person.id" value="<s:property value="project.person.id"/>" />
			<input type="hidden" id="project.createdDate" name="project.createdDate" value="<s:property value="project.createdDate"/>" />
			<fieldset>
				<!-- START project.name -->
				<s:if test="fieldErrors.get('project.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.name'/></label>
						<div class="col-md-10">
							<input id="project.name" name="project.name" class="form-control" placeholder="<s:text name='mer.project.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('project.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name'/></label>
						<div class="col-md-10">
							<input id="project.name" name="project.name" value="<s:property value='project.name'/>" class="form-control" placeholder="<s:text name='mer.project.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END project.name -->
				<!-- START project.nameEn -->
				<s:if test="fieldErrors.get('project.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameEn'/></label>
						<div class="col-md-10">
							<input id="project.nameEn" name="project.nameEn" class="form-control" placeholder="<s:text name='mer.project.nameEn'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('project.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameEn'/></label>
						<div class="col-md-10">
							<input id="project.nameEn" name="project.nameEn" value="<s:property value='project.nameEn'/>" class="form-control" placeholder="<s:text name='mer.project.nameEn'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END project.nameEn -->
				<!-- START project.nameSr -->
				<s:if test="fieldErrors.get('project.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameSr'/></label>
						<div class="col-md-10">
							<input id="project.nameSr" name="project.nameSr" class="form-control" placeholder="<s:text name='mer.project.nameSr'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('project.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameSr'/></label>
						<div class="col-md-10">
							<input id="project.nameSr" name="project.nameSr" value="<s:property value='project.nameSr'/>" class="form-control" placeholder="<s:text name='mer.project.nameSr'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END project.nameSr -->
				<!-- START project.code -->
				<s:if test="fieldErrors.get('project.code')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.code'/></label>
						<div class="col-md-10">
							<input id="project.code" name="project.code" class="form-control" placeholder="<s:text name='mer.project.code'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('project.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.code'/></label>
						<div class="col-md-10">
							<input id="project.code" name="project.code" value="<s:property value='project.code'/>" class="form-control" placeholder="<s:text name='mer.project.code'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END project.code -->
				
								<!-- START project.pillar -->
				<s:if test="fieldErrors.get('project.pillar')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.pillar'/></label>
						<div class="col-md-10">
							<select  class="form-control" id="project.pillar"
								name="project.pillar">
								<s:iterator value="merpillarsList" var="la">
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
								value="fieldErrors.get('project.pillar')" /> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.pillar'/></label>
						<div class="col-md-10">
							<select class="form-control" id="project.pillar"
								name="project.pillar">
								<s:iterator value="merpillarsList" var="la">
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
				<!-- END project.pillar -->
				<!-- START project.description -->
				<s:if test="fieldErrors.get('project.description')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="mer.project.description"/></label>
						<div class="col-md-10">
							<textarea id="project.description" name="project.description" class="form-control" placeholder="<s:text name="mer.project.description"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('project.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.project.description'/></label>
						<div class="col-md-10">
							<textarea id="project.description" name="project.description" class="form-control" placeholder="<s:text name="mer.project.description"/>"><s:property value="project.description"/></textarea>
						</div>									
					</div>
				</s:else>
		<!-- END project.description -->
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelProject" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveProject"  class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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

	$("#project\\.pillar").val('<s:property value="project.pillar.DOMVALUE"/>');
	
	$("#project\\.code").mask("*");

		Ladda.bind('#saveProject');
		$("#saveProject").on('click', function () {    
			$("#project_form :button").prop('disabled','disabled');           
			$('#project_form').submit();
			return false;        
		});

		$("#cancelProject").on('click', function() {
			$("#project_add_content").dialog('close');
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
					$("#project_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#project_form_content").html(jqXHR.responseText);
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
						jQuery("#project_grid").trigger("reloadGrid");
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
			$("#project_form :button").prop('disabled',false);
		})();		
});
	
</script>