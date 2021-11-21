<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<div>
	<div class="widget-body">
		<form id="request_type_form" class="form-horizontal" action="RequestTypeSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="requestType.id" name="requestType.id" value="<s:property value='requestType.id'/>" type="hidden">
				<input id="requestType.employee.id" name="requestType.employee.id" value="<s:property value='requestType.employee.id'/>" type="hidden">
				<input id="requestType.createdDate" name="requestType.createdDate" value="<s:property value='requestType.createdDate'/>" type="hidden">
				
				<!-- START requestType.nameAl -->
				<s:if test="fieldErrors.get('requestType.nameAl')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.al" />:</label>
						<div class="col-md-10">
							<input id="requestType.nameAl" name="requestType.nameAl" class="form-control" type="text"/> 
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('requestType.nameAl')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.al" />:</label>
						<div class="col-md-10">
							<input id="requestType.nameAl" name="requestType.nameAl"
								value="<s:property value='requestType.nameAl'/>" class="form-control" type="text"/>
						</div>
					</div>
				</s:else>
				<!-- END requestType.nameAl -->
				
				<!-- START requestType.nameEn -->
				<s:if test="fieldErrors.get('requestType.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.en" />:</label>
						<div class="col-md-10">
							<input id="requestType.nameEn" name="requestType.nameEn" class="form-control" type="text"/> 
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('requestType.nameEn')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.en" />:</label>
						<div class="col-md-10">
							<input id="requestType.nameEn" name="requestType.nameEn"
								value="<s:property value='requestType.nameEn'/>" class="form-control" type="text"/>
						</div>
					</div>
				</s:else>
				<!-- END requestType.nameEn -->
				
				<!-- START requestType.nameSr -->
				<s:if test="fieldErrors.get('requestType.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.sr" />:</label>
						<div class="col-md-10">
							<input id="requestType.nameSr" name="requestType.nameSr" class="form-control" type="text"/> 
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('requestType.nameSr')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.sr" />:</label>
						<div class="col-md-10">
							<input id="requestType.nameSr" name="requestType.nameSr"
								value="<s:property value='requestType.nameSr'/>" class="form-control" type="text"/>
						</div>
					</div>
				</s:else>
				<!-- END requestType.nameSr -->
				
				<!-- START requestType.periodType -->
				<s:if test="fieldErrors.get('requestType.periodType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="fal.requesttype.periodtype"/>:</label>
						<div class="col-md-10">
							<select class="form-control" name="requestType.periodType" id="requestType.periodType" >
								<option></option>
								<s:iterator value="periodtypes" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#el.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#el.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#el.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>	
							</select>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('requestType.periodType')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="fal.requesttype.periodtype"/>:</label>
						<div class="col-md-10">
							<select class="form-control"  name="requestType.periodType" id="requestType.periodType" >
								<option></option>
								<s:iterator value="periodtypes" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#el.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#el.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#el.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>	
							</select>
						</div>
					</div>
				</s:else>
				<!-- END requestType.periodType -->
				
				
				<!-- START requestType.price -->
				<s:if test="fieldErrors.get('requestType.price')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="seed.inv.price" /> /ha:</label>
						<div class="col-md-10">
							<input id="requestType.price" name="requestType.price" class="form-control" type="number"/> 
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('requestType.price')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="seed.inv.price" /> /ha:</label>
						<div class="col-md-10">
							<input id="requestType.price" name="requestType.price"
								value="<s:property value='requestType.price'/>" class="form-control" type="number"/>
						</div>
					</div>
				</s:else>
				<!-- END requestType.price -->
			
				
			</fieldset>
			<div id="request_buttons">
				<footer class="form-actions" id="leaseRequest-button">
					<button id="cancelRequestType" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
					<button id="saveRequestType" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				</footer>
			</div>
			
		</form>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#requestType\\.periodType').val('<s:property value="requestType.periodType.DOMVALUE"/>');
		
		$("#cancelRequestType").on('click', function() {
			loadURL("RequestType.form.do",$("#request_type_form_content"));
			return false;
		});
		
		$("#saveRequestType").on('click', function() {
			var thisForm = $("#request_type_form");
			var reqArray = $("#request_coord_grid").jqGrid('getRowData');
			var jsonText = JSON.stringify(reqArray);
			$('<input>').attr({
				type : 'hidden',
				name : "jsonDetails",
				value : jsonText
			}).appendTo(thisForm);
			$('#request_type_form').submit();
			return false;
		});
		
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#request_type_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(errors){
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});						
					}else{
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
						jQuery("#request_type_grid").trigger("reloadGrid");
					} 	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();

	});

</script>
</html>