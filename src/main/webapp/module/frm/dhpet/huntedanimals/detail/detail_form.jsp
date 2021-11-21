<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<jsp:include page="../../../../base/validation.jsp"></jsp:include>
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
		<form id="huntDetail_form" class="form-horizontal" action="DhpetHuntedAnimalDetailSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="animal.location.data"/></legend>
				
				<input id="huntDetail.id" name="huntDetail.id" value="<s:property value='huntDetail.id'/>" type="hidden">
				<input id="huntDetail.dhpetHuntedAnimals.id" name="huntDetail.dhpetHuntedAnimals.id" value="<s:property value='huntDetail.dhpetHuntedAnimals.id'/>" type="hidden">
				<input id="huntDetail.dhpetHuntedAnimals.animalsNumber" name="huntDetail.dhpetHuntedAnimals.animalsNumber" value="<s:property value="huntDetail.dhpetHuntedAnimals.animalsNumber"/>" type="hidden">
				
				<input id="huntDetail.employee.id" name="huntDetail.employee.id" value="<s:property value='huntDetail.employee.id'/>" type="hidden">
				<input id="huntDetail.createdDate" name="huntDetail.createdDate" value="<s:property value="huntDetail.createdDate"/>" type="hidden">
				
				<!-- START huntDetail.gender -->
				<s:if test="fieldErrors.get('huntDetail.gender')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/>:</label>
						<div class="col-md-10">
							<select  class="form-control" id="huntDetail.gender"
								name="huntDetail.gender">
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
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('huntDetail.gender')" /> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="huntDetail.gender"
								name="huntDetail.gender">
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
				<!-- END huntDetail.gender -->
				
				<!-- START huntDetail.deathCause -->
				<s:if test="fieldErrors.get('huntDetail.deathCause')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hunt.deathCause"/>:</label>
						<div class="col-md-10">
							<select  class="form-control" id="huntDetail.deathCause"
								name="huntDetail.deathCause">
								<option value=""></option>
								<s:iterator value="deathCauseList" var="la">
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
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('huntDetail.deathCause')" /> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hunt.deathCause"/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="huntDetail.deathCause"
								name="huntDetail.deathCause">
								<option value=""></option>
								<s:iterator value="deathCauseList" var="la">
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
				<!-- END huntDetail.deathCause -->
				
				<!-- START huntDetail.animalsNumber -->
				<s:if test="fieldErrors.get('huntDetail.animalsNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hunt.animalsNumber"/></label>
						<div class="col-md-10">
							<input id="huntDetail.animalsNumber" data="numberLong" name="huntDetail.animalsNumber" class="form-control" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('huntDetail.animalsNumber')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hunt.animalsNumber"/></label>
						<div class="col-md-10">
							<input id="huntDetail.animalsNumber" data="numberLong" name="huntDetail.animalsNumber" value="<s:property value='huntDetail.animalsNumber'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END huntDetail.animalsNumber -->
				
				<!-- START huntDetail.age -->
				<s:if test="fieldErrors.get('huntDetail.age')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="animal.location.detail.age.type"/></label>
						<div class="col-md-10">
							<input id="huntDetail.age" data="numberLong" name="huntDetail.age" class="form-control" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('huntDetail.age')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="animal.location.detail.age.type"/></label>
						<div class="col-md-10">
							<input id="huntDetail.age" data="numberLong" name="huntDetail.age" value="<s:property value='huntDetail.age'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END huntDetail.age -->
				
				<!-- START huntDetail.weight -->
				<s:if test="fieldErrors.get('huntDetail.weight')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.weight"/></label>
						<div class="col-md-10">
							<input id="huntDetail.weight" data="numberLong" name="huntDetail.weight" class="form-control" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('huntDetail.weight')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.weight"/></label>
						<div class="col-md-10">
							<input id="huntDetail.weight" data="numberLong" name="huntDetail.weight" value="<s:property value='huntDetail.weight'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END huntDetail.weight -->
				
				
				
				<!-- START huntDetail.notes -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dhpet.location.label.comments"/></label>
						<div class="col-md-10">
							<textarea id="huntDetail.notes" name="huntDetail.notes" class="form-control" placeholder="<s:text name="dhpet.location.label.comments"/>"><s:property value='huntDetail.notes'/></textarea> 
						</div>									
					</div>
				<!-- END huntDetail.notes -->
			
		</fieldset>
		<div class="form-actions">
				<div class="row">
					<div class="col-sm-12">
						<button id="cancelHAD" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveHAD" class="btn btn-primary" type="submit">
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
		$("#huntDetail\\.dhpetHuntedAnimals\\.animalsNumber").val($("#animalNumber").val());
		$("#huntDetail\\.dhpetHuntedAnimals\\.id").val($("#huntAnimalId").val());
		$('#huntDetail\\.gender').val('<s:property value="huntDetail.gender.DOMVALUE"/>');
		$('#huntDetail\\.deathCause').val('<s:property value="huntDetail.deathCause.DOMVALUE"/>');
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"99999999.99",mDec: '2'});
  		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0',vMax:"999999999"});

		$("#cancelHAD").on('click', function () {
			$.ajax({
				type : "GET",
				url : "DhpetHuntedAnimalDetail.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#huntdetail_form_content").html(jqXHR.responseText);
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
				
		$("#saveHAD").on('click', function () {
			$('#huntDetail_form').submit();
			return false;        
		});
		$("#huntDetail_form").submit(function() {
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
					$("#huntdetail_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						jQuery("#huntdetail_grid").trigger("reloadGrid");
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