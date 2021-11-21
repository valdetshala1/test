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

		<form id="leavetype_form" class="form-horizontal" action="LeaveTypeSave.do" accept-charset="utf8" method="post">
			
			<fieldset>
				<legend><s:text name="leave.type.label.leave.types"/></legend>
				<input id="leaveType.id" name="leaveType.id" value="<s:property value='leaveType.id'/>" type="hidden">	
				<!-- START leaveType.name -->
				<s:if test="fieldErrors.get('leaveType.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="leaveType.name" name="leaveType.name" class="form-control" placeholder="<s:text name="leave.type.label.name"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="leaveType.name" name="leaveType.name" value="<s:property value='leaveType.name'/>" class="form-control" placeholder="<s:text name="leave.type.label.name"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END leaveType.name -->
				
				<!-- START leaveType.nameEn -->
				<s:if test="fieldErrors.get('leaveType.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.en"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="leaveType.nameEn" name="leaveType.nameEn" class="form-control" placeholder="<s:text name="leave.type.label.name.en"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.en"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="leaveType.nameEn" name="leaveType.nameEn" value="<s:property value='leaveType.nameEn'/>" class="form-control" placeholder="<s:text name="leave.type.label.name.en"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END leaveType.nameEn -->
				
				<!-- START leaveType.nameSr -->
				<s:if test="fieldErrors.get('leaveType.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.sr"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="leaveType.nameSr" name="leaveType.nameSr" class="form-control" placeholder="<s:text name="leave.type.label.name.sr"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.sr"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="leaveType.nameSr" name="leaveType.nameSr" value="<s:property value='leaveType.nameSr'/>" class="form-control" placeholder="<s:text name="leave.type.label.name.sr"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END leaveType.nameSr -->
				
				<!-- START leaveType.code -->
				<s:if test="fieldErrors.get('leaveType.code')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.code"/></label>
						<div class="col-md-10">
							<input maxlength="3" id="leaveType.code" name="leaveType.code" class="form-control" placeholder="<s:text name="leave.type.label.code"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.code"/></label>
						<div class="col-md-10">
							<input maxlength="3" id="leaveType.code" name="leaveType.code" value="<s:property value='leaveType.code'/>" class="form-control" placeholder="<s:text name="leave.type.label.code"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END leaveType.code -->
<!-- 				START leaveType.ispaid -->
<%-- 					<s:if test="fieldErrors.get('leaveType.ispaid')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<!-- 						<label class="col-md-2 control-label">IsPaid</label> -->
<!-- 						<div class="col-md-10"> -->
<!-- 							<input id="leaveType.ispaid" name="leaveType.ispaid" type="checkbox"> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.ispaid')"/> </span> --%>
<!-- 						</div>					 -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<!-- 						<label class="col-md-2 control-label">IsPaid</label> -->
<!-- 						<div class="col-md-10"> -->
<!-- 							<input id="leaveType.ispaid" name="leaveType.ispaid" value="1" type="checkbox"> -->
<!-- 						</div>									 -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
<!-- 				END leaveType.ispaid	 -->
				
<!-- 				START leaveType.isawol -->
<%-- 					<s:if test="fieldErrors.get('leaveType.isawol')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<!-- 						<label class="col-md-2 control-label">IsAwol</label> -->
<!-- 						<div class="col-md-10"> -->
<!-- 							<input id="leaveType.isawol" name="leaveType.isawol" type="checkbox"> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.isawol')"/> </span> --%>
<!-- 						</div>					 -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<!-- 						<label class="col-md-2 control-label">IsAwol</label> -->
<!-- 						<div class="col-md-10"> -->
<!-- 							<input id="leaveType.isawol" name="leaveType.isawol" value="1" type="checkbox"> -->
<!-- 						</div>									 -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
<!-- 				END leaveType.isawol -->
				
<!-- <!-- 				START leaveType.isannual --> 
<%-- 					<s:if test="fieldErrors.get('leaveType.isannual')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<!-- 						<label class="col-md-2 control-label">IsAnnual</label> -->
<!-- 						<div class="col-md-10"> -->
<!-- 							<input id="leaveType.isannual" name="leaveType.isannual" type="checkbox"> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.isannual')"/> </span> --%>
<!-- 						</div>					 -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<!-- 						<label class="col-md-2 control-label">IsAnnual</label> -->
<!-- 						<div class="col-md-10"> -->
<%-- 							<input id="leaveType.isannual" name="leaveType.isannual" value="<s:property value="leaveType.isannual"/>" type="checkbox"> --%>
<!-- 						</div>									 -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
<!-- <!-- 				END leaveType.isannual --> 
				
				<!-- START leaveType.operationalCountryId -->
<%-- 					<s:if test="fieldErrors.get('leaveType.operationalCountryId')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="leave.type.operational.contry.id"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<input id="leaveType.operationalCountryId" name="leaveType.operationalCountryId" class="form-control" placeholder="<s:text name="leave.type.operational.contry.id"/>" type="text"> --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.operationalCountryId')"/> </span> --%>
<!-- 						</div>					 -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="leave.type.operational.contry.id"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<input id="leaveType.operationalCountryId" name="leaveType.operationalCountryId" value="<s:property value='leaveType.operationalCountryId'/>" class="form-control" placeholder="<s:text name="leave.type.operational.contry.id"/>" type="text"> --%>
<!-- 						</div>									 -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END leaveType.operationalCountryId -->
					<!-- START leaveType.bgColor -->
<%-- 				<s:if test="fieldErrors.get('leaveType.bgColor')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="leave.type.label.bg.color"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<input maxlength="20" id="leaveType.bgColor" name="leaveType.bgColor" class="form-control" placeholder="<s:text name="leave.type.label.bg.color"/>" type="text"> --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveType.bgColor')"/> </span> --%>
<!-- 						</div>					 -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="leave.type.label.bg.color"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<input maxlength="20" id="leaveType.bgColor" name="leaveType.bgColor" value="<s:property value='leaveType.bgColor'/>" class="form-control" placeholder="<s:text name="leave.type.label.bg.color"/>" type="text"> --%>
<!-- 						</div>									 -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END leaveType.bgColor -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelTT" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveTT" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
// 		$('#leaveType\\.isannual').jqCheckBox({
// 			width : 130,
// 			theme : theme
// 		});
// 		$("#leaveType\\.isannual").on('change', function(event) {
// 			if(event.args.checked) {
// 				$("#leaveType\\.isannual").val("1");
// 			}
// 			else{
// 				$("#leaveType\\.isannual").val("0");
// 			}
// 		});
		$("#cancelTT").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "LeaveType.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#leavetype_form_content").html(jqXHR.responseText);
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
				complete:function(jqXHR, textStatus){
				}
			});			
			return false;        
		});
		Ladda.bind('#saveTT');
		$("#saveTT").on('click', function () {   
			$("#leavetype_form :button").prop('disabled','disabled');                 
			$('#leavetype_form').submit();
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
					$("#leavetype_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
				success : function(data, status, jqXHR) { // on success..
					$("#leavetype_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#leavetype_grid").trigger("reloadGrid");
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
			$("#leavetype_form :button").prop('disabled',false);				
		})();
			
	});            
</script>