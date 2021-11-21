<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="form_content">
<jsp:include page="../../../base/validation.jsp"></jsp:include>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="animalcapacity_form" class="form-horizontal" action="AnimalCapacitySave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="dhpet.animal.capacity.legend.animal.capacity.data"/></legend>
				<input id="dhpetAnimalCapacity.id" name="dhpetAnimalCapacity.id" value="<s:property value='dhpetAnimalCapacity.id'/>" type="hidden">
				<input id="dhpetAnimalCapacity.employee.id" name="dhpetAnimalCapacity.employee.id" value="<s:property value='dhpetAnimalCapacity.employee.id'/>" type="hidden">
				<input id="dhpetAnimalCapacity.createdDate" name="dhpetAnimalCapacity.createdDate" value="<s:property value='dhpetAnimalCapacity.createdDate'/>" type="hidden">
				<input id="language" name="language" value="<s:property value='locale.language'/>" type="hidden">
				<input id="dhpetAnimalCapacity.dhpetAnimalLocation.id" name="dhpetAnimalCapacity.dhpetAnimalLocation.id" value="<s:property value='dhpetAnimalCapacity.dhpetAnimalLocation.id'/>" type="hidden">
			
			<!-- START dhpetAnimalCapacity.habitatLocation -->
				
				<!-- START dhpetAnimalCapacity.useOfLand -->
				<s:if test="fieldErrors.get('dhpetAnimalCapacity.useOfLand')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.animal.capacity.label.use.of.land"/></label>
						<div class="col-md-10">
						<select class="form-control" id="dhpetAnimalCapacity.useOfLand" name="dhpetAnimalCapacity.useOfLand">
									<option></option>
									<s:iterator value="landUseList" var="el">
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
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetAnimalCapacity.useOfLand')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.animal.capacity.label.use.of.land"/></label>
						<div class="col-md-10">
							<select class="form-control" id="dhpetAnimalCapacity.useOfLand" name="dhpetAnimalCapacity.useOfLand">
								<s:iterator value="landUseList" var="el">
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
				<!-- END dhpetAnimalCapacity.useOfLand -->
				
				<!-- START dhpetAnimalCapacity.area -->
				<s:if test="fieldErrors.get('dhpetAnimalCapacity.area')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.animal.capacity.label.area"/></label>
						<div class="col-md-10">
							<input data="number" id="dhpetAnimalCapacity.area" name="dhpetAnimalCapacity.area" class="form-control" placeholder="<s:text name="dhpet.animal.capacity.label.area"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetAnimalCapacity.area')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.animal.capacity.label.area"/></label>
						<div class="col-md-10">
							<input data="number" id="dhpetAnimalCapacity.area" name="dhpetAnimalCapacity.area" value="<s:property value='dhpetAnimalCapacity.area'/>" class="form-control" placeholder="<s:text name="dhpet.animal.capacity.label.area"/>" type="text" >
						</div>									
					</div>
				</s:else>
				<!-- END dhpetAnimalCapacity.area -->
				
				<!-- START dhpetAnimalCapacity.percentage -->
				<s:if test="fieldErrors.get('dhpetAnimalCapacity.percentage')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.animal.capacity.label.percentage"/></label>
						<div class="col-md-10">
							<input data="numberPerc" id="dhpetAnimalCapacity.percentage" maxlength='3' name="dhpetAnimalCapacity.percentage" class="form-control" placeholder="<s:text name="dhpet.animal.capacity.label.percentage"/>" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetAnimalCapacity.percentage')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.animal.capacity.label.percentage"/></label>
						<div class="col-md-10">
							<input data="numberPerc" id="dhpetAnimalCapacity.percentage" maxlength='3'  name="dhpetAnimalCapacity.percentage" value="<s:property value='dhpetAnimalCapacity.percentage'/>" class="form-control" placeholder="<s:text name="dhpet.animal.capacity.label.percentage"/>" type="text" >
						</div>									
					</div>
				</s:else>
				<!-- END dhpetAnimalCapacity.percentage -->
		</fieldset>
		<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAC" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveAC" class="btn btn-primary" type="submit">
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
		$("#dhpetAnimalCapacity\\.year").mask("9999");
		$('#dhpetAnimalCapacity\\.useOfLand').val('<s:property value="dhpetAnimalCapacity.useOfLand.DOMVALUE"/>');
		$("#dhpetAnimalCapacity\\.dhpetAnimalLocation\\.id").val($("#w_animal_location_id").val());
//$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"9999999.99",mDec: '2'});
		$("input[data='numberPerc']").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"100",mDec: '2'});
  		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0',vMax:"999999999"});
//   		$("#dhpetAnimalCapacity\\.percentage").mask("999");
		

		$("#cancelAC").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "AnimalCapacity.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#form_content").html(jqXHR.responseText);
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
				
		$("#saveAC").on('click', function () {                    
			$('#animalcapacity_form').submit();
			return false;        
		});
		$("#animalcapacity_form").submit(function() {
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
					$("#form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exists");
					if(!errors){
						jQuery("#animalcapacity_grid").trigger("reloadGrid");
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