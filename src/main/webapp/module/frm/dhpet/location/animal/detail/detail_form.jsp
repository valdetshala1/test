<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../../base/nocache.jsp"%>
<jsp:include page="../../../../../base/validation.jsp"></jsp:include>
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
		<form id="locationDetail_form" class="form-horizontal" action="DhpetAnimalLocationDetailSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="animal.location.data"/></legend>
				
				<input id="locationDetail.id" name="locationDetail.id" value="<s:property value='locationDetail.id'/>" type="hidden">
				<input id="locationDetail.dhpetAnimalLocation.id" name="locationDetail.dhpetAnimalLocation.id" value="<s:property value='locationDetail.dhpetAnimalLocation.id'/>" type="hidden">
				<input id="locationDetail.dhpetAnimalLocation.quantity" name="locationDetail.dhpetAnimalLocation.quantity" value="<s:property value="locationDetail.dhpetAnimalLocation.quantity"/>" type="hidden">
				
				<input id="locationDetail.employee.id" name="locationDetail.employee.id" value="<s:property value='locationDetail.employee.id'/>" type="hidden">
				<input id="locationDetail.createdDate" name="locationDetail.createdDate" value="<s:property value="locationDetail.createdDate"/>" type="hidden">
				<input id="lang" name="lang" value="<s:property value="locale.language"/>" type="hidden">
				
				<!-- START locationDetail.gender -->
				<s:if test="fieldErrors.get('locationDetail.gender')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/>:</label>
						<div class="col-md-10">
							<select  class="form-control" id="locationDetail.gender"
								name="locationDetail.gender">
								<option value=""></option>
								<s:iterator value="genderList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
											<s:property value="#la.getDOMTEXT()" /> 
										</s:if>
										<s:elseif test="%{#lang=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" /> 
										</s:else>
									</option>
								</s:iterator>
							</select> 
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('locationDetail.gender')" /> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="locationDetail.gender"
								name="locationDetail.gender">
								<option value=""></option>
								<s:iterator value="genderList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{#lang=='sr'}">
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
				<!-- END locationDetail.gender -->
				
				<!-- START locationDetail.ageType -->
				<s:if test="fieldErrors.get('locationDetail.ageType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="animal.location.detail.age.type"/>:</label>
						<div class="col-md-10">
							<select  class="form-control" id="locationDetail.ageType"
								name="locationDetail.ageType">
								<option value=""></option>
								<s:iterator value="agetypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
											<s:property value="#la.getDOMTEXT()" /> 
										</s:if>
										<s:elseif test="%{#lang=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" /> 
										</s:else>
									</option>
								</s:iterator>
							</select> 
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('locationDetail.ageType')" /> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="animal.location.detail.age.type"/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="locationDetail.ageType"
								name="locationDetail.ageType">
								<option value=""></option>
								<s:iterator value="agetypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{#lang=='sr'}">
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
				<!-- END locationDetail.ageType -->
				
				<!-- START locationDetail.quantity -->
				<s:if test="fieldErrors.get('locationDetail.quantity')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="animal.quantity"/></label>
						<div class="col-md-10">
							<input id="locationDetail.quantity" data="numberLong" name="locationDetail.quantity" class="form-control" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('locationDetail.quantity')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="animal.quantity"/></label>
						<div class="col-md-10">
							<input id="locationDetail.quantity" data="numberLong" name="locationDetail.quantity" value="<s:property value='locationDetail.quantity'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END locationDetail.oneYearsOld -->
				
				<!-- START dhpetLocation.note -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dhpet.location.label.comments"/></label>
						<div class="col-md-10">
							<textarea id="locationDetail.note" name="locationDetail.note"class="form-control" placeholder="<s:text name="dhpet.location.label.comments"/>"><s:property value='locationDetail.note'/></textarea> 
						</div>									
					</div>
				<!-- END dhpetLocation.note -->
			
		</fieldset>
		<div class="form-actions">
				<div class="row">
					<div class="col-sm-12">
						<button id="cancelALD" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveALD" class="btn btn-primary" type="submit">
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
		$("#locationDetail\\.dhpetAnimalLocation\\.quantity").val($("#animalQuantity").val());
		$('#locationDetail\\.dhpetAnimalLocation\\.id').val($("#w_animal_location_id").val());
		$('#locationDetail\\.gender').val('<s:property value="locationDetail.gender.DOMVALUE"/>');
		$('#locationDetail\\.ageType').val('<s:property value="locationDetail.ageType.DOMVALUE"/>');
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"99999999.99",mDec: '2'});
  		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0',vMax:"999999999"});

		$("#cancelALD").on('click', function () {
			$.ajax({
				type : "GET",
				url : "DhpetAnimalLocationDetail.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#locationdetail_form_content").html(jqXHR.responseText);
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
				
		$("#saveALD").on('click', function () {
			$('#locationDetail_form').submit();
			return false;        
		});
		$("#locationDetail_form").submit(function() {
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
					$("#locationdetail_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						jQuery("#locationdetail_grid").trigger("reloadGrid");
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