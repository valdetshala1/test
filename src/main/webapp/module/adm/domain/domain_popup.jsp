<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<script type="text/javascript">
	$(document).ready(function () {
		$('#btnSave').click(function() {
			isValid = $('#domain_popup_form').submit();
			if(isValid == true){
				$("#grant_dialog").dialog('close');
			}
			return false;	 
		});		
		
		$('#btnCancel').click(function() {
			$("#domain_dialog").dialog('close');
		});		
			
		$("#domain_popup_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#domain_popup_content").html(jqXHR.responseText);
					
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			
		});
		
		 $('#domainIdList').multiselect({
				filterBehavior: 'both',
				buttonContainer: '<div class="btn-group" />',
				numberDisplayed: 5,
				enableFiltering: true,
				includeSelectAllDivider: true,
				selectAllValue: 'multiselect-all',
				maxHeight: '200',
		});

		 $('#privilegIdList').multiselect({
				filterBehavior: 'both',
				buttonContainer: '<div class="btn-group" />',
				numberDisplayed: 5,
				enableFiltering: true,
				includeSelectAllDivider: true,
				selectAllValue: 'multiselect-all',
				maxHeight: '200',
		});							
	});
</script>
<div id="domain_popup_content">
<form id="domain_popup_form" class="form-horizontal" action="PermissionSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
<input id="roleId" name="roleId" type="hidden" value="<s:property value="roleId"/>">
<input id="domainId" name="domainId" type="hidden" value="<s:property value="domainId"/>">
<input id="privilegeId" name="privilegeId" type="hidden" value="<s:property value="privilegeId"/>">
	
<div class="modal-body">
	<s:if test="roleId!=null">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<div class="col-md-10">
					<div class="input-group btn-group">
						<select class="form-col-md-10" id="domainIdList" name="domainIdList" multiple="multiple">
							<s:iterator value="domainList" var="rb">
								<option value="<s:property value="id"/>"><s:property value="name"/></option>
							</s:iterator>						
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	</s:if>
	<s:if test="domainId!=null">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" for="role">Privileges</label>
				<div class="col-md-10">
					<div class="input-group btn-group">
						<select class="form-col-md-10" id="privilegIdList" name="privilegIdList" multiple="multiple">
							<s:iterator value="privilegeList" var="rb">
								<option value="<s:property value="id"/>"><s:property value="name"/></option>
							</s:iterator>						
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	</s:if>
</div>
<div class="modal-footer">
	<button id="btnCancel" type="button" class="btn btn-default" data-dismiss="modal">
		Cancel
	</button>
	<button id="btnSave" type="button" class="btn btn-success btn-sm">
		<span class="glyphicon glyphicon-floppy-disk"></span> Save
	</button>	
</div>
</form>			
</div>