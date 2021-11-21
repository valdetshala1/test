<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<jsp:include page="../../../base/validation.jsp"></jsp:include>
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="huntgroundeval_form" class="form-horizontal" action="HuntGroundEvalSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="dhpet.hunting.ground.evaluation"/></legend>
				<input id="dhpetHuntGroundEval.id" name="dhpetHuntGroundEval.id" value="<s:property value='dhpetHuntGroundEval.id'/>" type="hidden">
				<input id="language" name="language" value="<s:property value='locale.language'/>" type="hidden">
				<input id="dhpetHuntGroundEval.employee.id" name="dhpetHuntGroundEval.employee.id" value="<s:property value='dhpetHuntGroundEval.employee.id'/>" type="hidden">
				<input id="dhpetHuntGroundEval.createdDate" name="dhpetHuntGroundEval.createdDate" value="<s:property value="dhpetHuntGroundEval.createdDate"/>" type="hidden">
				<input id="dhpetHuntGroundEval.dhpetAnimalLocation.id" name="dhpetHuntGroundEval.dhpetAnimalLocation.id" value="<s:property value='dhpetHuntGroundEval.dhpetAnimalLocation.id'/>" type="hidden">
			
				<!-- START dhpetHuntGroundEval.requestFor -->
				<s:if test="fieldErrors.get('dhpetHuntGroundEval.requestFor')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.maint.of.mong.label.request.for"/></label>
						<div class="col-md-10">
							<input id="dhpetHuntGroundEval.dhpetWildAnimalsRequest.name" name="dhpetHuntGroundEval.dhpetWildAnimalsRequest.name" class="form-control" placeholder="<s:text name="dhpet.maint.of.mong.label.request.for"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetHuntGroundEval.requestFor')"/> </span>
							<input id="dhpetHuntGroundEval.dhpetWildAnimalsRequest.id" name="dhpetHuntGroundEval.dhpetWildAnimalsRequest.id" type="hidden">
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.maint.of.mong.label.request.for"/></label>
						<div class="col-md-10">
						<s:if test="%{locale.language=='al'}">
							<input id="dhpetHuntGroundEval.dhpetWildAnimalsRequest.name" name="dhpetHuntGroundEval.dhpetWildAnimalsRequest.name" value="<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.requestFor.getDOMTEXT'/> (Poenat Maksimal=<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.maxPoint'/>)" class="form-control" placeholder="<s:text name="dhpet.maint.of.mong.label.request.for"/>" type="text">
						</s:if>	
						<s:elseif test="%{locale.language=='sr'}">
							<input id="dhpetHuntGroundEval.dhpetWildAnimalsRequest.name" name="dhpetHuntGroundEval.dhpetWildAnimalsRequest.name" value="<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.requestFor.getDOMTEXT_SR'/> (Max Point=<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.maxPoint'/>)" class="form-control" placeholder="<s:text name="dhpet.maint.of.mong.label.request.for"/>" type="text">
						</s:elseif><s:else>
						   <input id="dhpetHuntGroundEval.dhpetWildAnimalsRequest.name" name="dhpetHuntGroundEval.dhpetWildAnimalsRequest.name" value="<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.requestFor.getDOMTEXT_EN'/> (Max Point=<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.maxPoint'/>)" class="form-control" placeholder="<s:text name="dhpet.maint.of.mong.label.request.for"/>" type="text">
						</s:else>
						   <input id="dhpetHuntGroundEval.dhpetWildAnimalsRequest.id" name="dhpetHuntGroundEval.dhpetWildAnimalsRequest.id" value="<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END dhpetHuntGroundEval.requestFor -->
				<!-- START dhpetHuntGroundEval.definedPoint -->
				<s:if test="fieldErrors.get('dhpetHuntGroundEval.definedPoint')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.maint.of.mong.label.defined.point"/></label>
						<div class="col-md-10">
							<input data="numberLong" id="dhpetHuntGroundEval.definedPoint" name="dhpetHuntGroundEval.definedPoint" class="form-control" placeholder="<s:text name="dhpet.maint.of.mong.label.defined.point"/>" type="text" step="0">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetHuntGroundEval.definedPoint')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.maint.of.mong.label.defined.point"/></label>
						<div class="col-md-10">
							<input data="numberLong" id="dhpetHuntGroundEval.definedPoint" name="dhpetHuntGroundEval.definedPoint" value="<s:property value='dhpetHuntGroundEval.definedPoint'/>" class="form-control" placeholder="<s:text name="dhpet.maint.of.mong.label.defined.point"/>" type="text" step="0">
						</div>									
					</div>
				</s:else>
				<!-- END dhpetHuntGroundEval.definedPoint -->
		</fieldset>
		<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelMF" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveMF" class="btn btn-primary" type="submit">
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
		$("input[data='numberLong']").autoNumeric('init',{aDec:".",aSep:",",mDec:"0"});
		$("#dhpetHuntGroundEval\\.dhpetAnimalLocation\\.id").val($("#w_animal_location_id").val());
	    $("#dhpetHuntGroundEval\\.dhpetWildAnimalsRequest\\.name").select2({
	        placeholder: "Search for a repository",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.animalRequest.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12, 
		        	name_startsWith: term,
		        	animalId:$("#w_animal_id").val(),
		        };
		        },
		        results: function (data, page) {
		        return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
	        dropdownAutoWidth: false,
	        formatResult: formatResult,
	        formatSelection: function(item) {
	        	$("#dhpetHuntGroundEval\\.dhpetWildAnimalsRequest\\.id").val(item.id);
	        	$("#dhpetHuntGroundEval\\.dhpetWildAnimalsRequest\\.name").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

		
		if($("#dhpetHuntGroundEval\\.dhpetWildAnimalsRequest\\.id").val() || $("#dhpetHuntGroundEval\\.dhpetWildAnimals\\.id").val()){
			var lang=$("#language").val();
			    if(lang=="en"){
					$("#dhpetHuntGroundEval\\.dhpetWildAnimalsRequest\\.name").select2("data", {id: "<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.id'/>", name: "<s:property value="dhpetHuntGroundEval.dhpetWildAnimalsRequest.requestFor.DOMTEXT_EN"/> (Max Point=<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.maxPoint'/>)"});
					$("#dhpetHuntGroundEval\\.dhpetAnimalLocation\\.dhpetWildAnimals\\.nameAl").select2("data", {id: "<s:property value='dhpetHuntGroundEval.dhpetAnimalLocation.id'/>", name: "<s:property value="dhpetHuntGroundEval.dhpetAnimalLocation.dhpetWildAnimals.nameEn"/>"});
				}else if(lang=="sr"){
					$("#dhpetHuntGroundEval\\.dhpetWildAnimalsRequest\\.name").select2("data", {id: "<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.id'/>", name: "<s:property value="dhpetHuntGroundEval.dhpetWildAnimalsRequest.requestFor.DOMTEXT_SR"/> (Max Point=<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.maxPoint'/>)"});
					$("#dhpetHuntGroundEval\\.dhpetAnimalLocation\\.dhpetWildAnimals\\.nameAl").select2("data", {id: "<s:property value='dhpetHuntGroundEval.dhpetAnimalLocation.id'/>", name: "<s:property value="dhpetHuntGroundEval.dhpetAnimalLocation.dhpetAnimalLocation.dhpetWildAnimals.nameSr"/>"});
				}else{
					$("#dhpetHuntGroundEval\\.dhpetWildAnimalsRequest\\.name").select2("data", {id: "<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.id'/>", name: "<s:property value="dhpetHuntGroundEval.dhpetWildAnimalsRequest.requestFor.DOMTEXT"/> (Poenat Maksimal=<s:property value='dhpetHuntGroundEval.dhpetWildAnimalsRequest.maxPoint'/>)"});
					$("#dhpetHuntGroundEval\\.dhpetAnimalLocation\\.dhpetWildAnimals\\.nameAl").select2("data", {id: "<s:property value='dhpetHuntGroundEval.dhpetAnimalLocation.id'/>", name: "<s:property value="dhpetHuntGroundEval.dhpetAnimalLocation.dhpetWildAnimals.nameAl"/>"});
					}
		}


		$("#cancelMF").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "HuntGroundEval.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#huntgroundeval_form_content").html(jqXHR.responseText);
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
				
		$("#saveMF").on('click', function () {                    
			$('#huntgroundeval_form').submit();
			return false;        
		});
		$("#huntgroundeval_form").submit(function() {
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
					alert(this_form.attr('action'));
				},
				success : function(data, status, jqXHR) { // on success..
					$("#huntgroundeval_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
					if(!errors){
						jQuery("#huntgroundeval_grid").trigger("reloadGrid");
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