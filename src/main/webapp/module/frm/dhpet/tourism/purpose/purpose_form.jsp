<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>

<div>
	<!-- widget content -->
	<div class="widget-body">
		<form id="purpose_form" class="form-horizontal" action="TouristPurposeSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="purpose.id" name="purpose.id" value="<s:property value="purpose.id"/>" />
			<input type="hidden" id="purpose.employee.id" name="purpose.employee.id" value="<s:property value="purpose.employee.id"/>" />
			<input type="hidden" id="purpose.createdDate" name="purpose.createdDate" value="<s:property value="purpose.createdDate"/>" />
			<fieldset>
				<legend>Tourism purpose</legend>
				
				<!-- START purpose.name -->
				<s:if test="fieldErrors.get('purpose.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name'/></label>
						<div class="col-md-10">
							<input id="purpose.name" name="purpose.name" class="form-control" placeholder="<s:text name='leave.type.label.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('purpose.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name'/></label>
						<div class="col-md-10">
							<input id="purpose.name" name="purpose.name" value="<s:property value='purpose.name'/>" class="form-control" placeholder="<s:text name='leave.type.label.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END purpose.name -->
				
				<!-- START purpose.nameEn -->
				<s:if test="fieldErrors.get('purpose.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name.en'/></label>
						<div class="col-md-10">
							<input id="purpose.nameEn" name="purpose.nameEn" class="form-control" placeholder="<s:text name='leave.type.label.name.en'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('purpose.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name.en'/></label>
						<div class="col-md-10">
							<input id="purpose.nameEn" name="purpose.nameEn" value="<s:property value='purpose.nameEn'/>" class="form-control" placeholder="<s:text name='leave.type.label.name.en'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END purpose.nameEn -->
				
				<!-- START purpose.nameSr -->
				<s:if test="fieldErrors.get('purpose.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name.sr'/></label>
						<div class="col-md-10">
							<input id="purpose.nameSr" name="purpose.nameSr" class="form-control" placeholder="<s:text name='leave.type.label.name.sr'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('purpose.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='leave.type.label.name.sr'/></label>
						<div class="col-md-10">
							<input id="purpose.nameSr" name="purpose.nameSr" value="<s:property value='purpose.nameSr'/>" class="form-control" placeholder="<s:text name='leave.type.label.name.sr'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END purpose.nameSr -->
				
				<!-- START purpose.note -->
				<s:if test="fieldErrors.get('purpose.note')!=null"> 
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<input id="purpose.note" name="purpose.note" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('purpose.note')"/></span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="purpose.note" name="purpose.note" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='purpose.note'/></textarea>
						</div>									
					</div>
				</s:else>
				<!-- END purpose.note -->
			</fieldset>	
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

	Ladda.bind('#save');
	$("#save").on('click', function () { 
		$("#purpose_form :button").prop('disabled','disabled');              
		$('#purpose_form').submit();
		return false;        
	});

		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "TouristPurpose.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#purpose_form_content").html(jqXHR.responseText);
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
					$("#purpose_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#purpose_form_content").html(jqXHR.responseText);
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
						jQuery("#purpose_grid").trigger("reloadGrid");
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
</script>