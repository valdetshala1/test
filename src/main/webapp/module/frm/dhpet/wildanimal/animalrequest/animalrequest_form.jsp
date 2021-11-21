<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div class="widget-body">
		<form id="animalrequest_form" class="form-horizontal" action="AnimalRequestSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="animal.location.data"/></legend>
				
				<input id="animalsRequest.id" name="animalsRequest.id" value="<s:property value='animalsRequest.id'/>" type="hidden">
				<input id="animalsRequest.dhpetWildAnimals.id" name="animalsRequest.dhpetWildAnimals.id" value="<s:property value='animalsRequest.dhpetWildAnimals.id'/>" type="hidden">
				
				<input id="animalsRequest.employee.id" name="animalsRequest.employee.id" value="<s:property value='animalsRequest.employee.id'/>" type="hidden">
				<input id="animalsRequest.createdDate" name="animalsRequest.createdDate" value="<s:property value="animalsRequest.createdDate"/>" type="hidden">
				<input id="lang" name="lang" value="<s:property value="locale.language"/>" type="hidden">
				<!-- START animalsRequest.requestFor -->
				<s:if test="fieldErrors.get('animalsRequest.requestFor')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.maint.of.mong.label.request.for"/></label>
						<div class="col-md-10">
							<select  class="form-control" id="animalsRequest.requestFor"
								name="animalsRequest.requestFor">
								<s:iterator value="animalneedsList" var="la">
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
								value="fieldErrors.get('animalsRequest.requestFor')" /> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.maint.of.mong.label.request.for"/></label>
						<div class="col-md-10">
							<select class="form-control" id="animalsRequest.requestFor"
								name="animalsRequest.requestFor">
								<s:iterator value="animalneedsList" var="la">
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
				<!-- END animalsRequest.requestFor -->
				
				<!-- START  animalsRequest.maxPoint -->
				<s:if test="fieldErrors.get('animalsRequest.maxPoint')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="animals.request.max.point"/></label>
						<div class="col-md-10">
							<input id="animalsRequest.maxPoint" data="number_long" name="animalsRequest.maxPoint" class="form-control" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('animalsRequest.maxPoint')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="animals.request.max.point"/></label>
						<div class="col-md-10">
							<input id="animalsRequest.maxPoint" data="number_long" name="animalsRequest.maxPoint" value="<s:property value='animalsRequest.maxPoint'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END  animalsRequest.maxPoint-->
				
				<!-- START dhpetLocation.note -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dhpet.location.label.comments"/></label>
						<div class="col-md-10">
							<textarea id="animalsRequest.note" name="animalsRequest.note"class="form-control" placeholder="<s:text name="dhpet.location.label.comments"/>"><s:property value='animalsRequest.note'/></textarea> 
						</div>									
					</div>
				<!-- END dhpetLocation.note -->
			
		</fieldset>
		<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAL" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveAL" class="btn btn-primary" type="submit">
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
		$("input[data='number_long']").autoNumeric('init',{aDec:".",aSep:",",mDec:"0"});
		$('#animalsRequest\\.requestFor').val('<s:property value="animalsRequest.requestFor.DOMVALUE"/>');

		$("#animalsRequest\\.dhpetWildAnimals\\.id").val($("#dhpetWildAnimalId").val());
		$("#cancelAL").on('click', function () {
			$.ajax({
				type : "GET",
				url : "AnimalRequest.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#animalrequest_form_content").html(jqXHR.responseText);
					//alert after cancel action
					$.smallBox({
						title : "<s:text name="small.box.on.cancel.title"/>",
						content : "<s:text name="small.box.content"/>",
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
				
		$("#saveAL").on('click', function () {
			$('#animalrequest_form').submit();
			return false;        
		});
		$("#animalrequest_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#animalrequest_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						jQuery("#animalrequest_grid").trigger("reloadGrid");
						$.smallBox({
							title : "<s:text name="small.box.on.save.title.success"/>",
							content : "<s:text name="small.box.content"/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : "<s:text name="small.box.on.save.title.failed"/>",
							content : "<s:text name="small.box.content"/>",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}
				},
				complete:function(jqXHR, textStatus){
					//$('#ajaxBusyFarmer').hide();
				}
			});
			return false;
		});
			    	
	});            
</script>