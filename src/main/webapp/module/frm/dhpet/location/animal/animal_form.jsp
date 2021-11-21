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
		<form id="animal_form" class="form-horizontal" action="AnimalLocationSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="animal.location.data"/></legend>
				
				<input id="animal.id" name="animal.id" value="<s:property value='animal.id'/>" type="hidden">
				<input id="animal.dhpetAnnualPlan.id" name="animal.dhpetAnnualPlan.id" value="<s:property value='animal.dhpetAnnualPlan.id'/>" type="hidden">
				
				<input id="animal.employee.id" name="animal.employee.id" value="<s:property value='animal.employee.id'/>" type="hidden">
				<input id="animal.createdDate" name="animal.createdDate" value="<s:property value="animal.createdDate"/>" type="hidden">
				<input id="lang" name="lang" value="<s:property value="locale.language"/>" type="hidden">
				
				<!-- START animal.dhpetWildAnimals -->
				<s:if test="fieldErrors.get('animal.dhpetWildAnimals')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="animal.animal"/></label>
						<div class="col-md-10">
							<input id="animal.dhpetWildAnimals.nameAl" name="animal.dhpetWildAnimals.nameAl" class="form-control" type="text" >
							<input id="animal.dhpetWildAnimals.id" name="animal.dhpetWildAnimals.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('animal.dhpetWildAnimals')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="animal.animal"/></label>
						<div class="col-md-10">
							<input id="animal.dhpetWildAnimals.nameAl" name="animal.dhpetWildAnimals.nameAl" value="<s:property value='animal.dhpetWildAnimals.nameAl'/>" class="form-control" type="text">
							<input id="animal.dhpetWildAnimals.nameEn" name="animal.dhpetWildAnimals.nameEn" value="<s:property value='animal.dhpetWildAnimals.nameEn'/>" class="form-control" type="hidden">
							<input id="animal.dhpetWildAnimals.nameSr" name="animal.dhpetWildAnimals.nameSr" value="<s:property value='animal.dhpetWildAnimals.nameSr'/>" class="form-control" type="hidden">
							<input id="animal.dhpetWildAnimals.id" name="animal.dhpetWildAnimals.id" value="<s:property value='animal.dhpetWildAnimals.id'/>" class="form-control" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END animal.dhpetWildAnimals -->
				
				<!-- START animal.quantity -->
				<s:if test="fieldErrors.get('animal.quantity')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="animal.quantity"/></label>
						<div class="col-md-10">
							<input id="animal.quantity" data="numberLong" name="animal.quantity" class="form-control" type="text" disabled />
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('animal.quantity')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="animal.quantity"/></label>
						<div class="col-md-10">
							<input id="animal.quantity" data="numberLong" name="animal.quantity" value="<s:property value='animal.quantity'/>" class="form-control" type="text" disabled>
						</div>									
					</div>
				</s:else>
				<!-- END animal.quantity -->
				
				<!-- START dhpetLocation.note -->
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="dhpet.location.label.comments"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<textarea id="animal.note" name="animal.note"class="form-control" placeholder="<s:text name="dhpet.location.label.comments"/>"><s:property value='animal.note'/></textarea>  --%>
<!-- 						</div>									 -->
<!-- 					</div> -->
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
		$("#animal\\.dhpetAnnualPlan\\.id").val($("#annualplanId").val());
		$("#animal\\.year").mask("9999");
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"99999999.99",mDec: '2'});
  		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0',vMax:"999999999"});
		$("#animal\\.dhpetWildAnimals\\.nameAl").select2({
		    placeholder: "",
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.dbpetAnimal.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
						name_startsWith: term,
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
		    	$("#animal\\.dhpetWildAnimals\\.id").val(item.id);
		    	$("#animal\\.dhpetWildAnimals\\.nameAl").val(item.name);
		    	$("#animal\\.dhpetWildAnimals\\.nameSr").val(item.name);
		    	$("#animal\\.dhpetWildAnimals\\.nameEn").val(item.name);
		    	
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		
		
		if($("#animal\\.dhpetWildAnimals\\.id").val()){
			var animal_name="",lang=$("#lang").val();
			if(lang=="en"){
				animal_name="<s:property value="animal.dhpetWildAnimals.nameEn"/>";
			}else if(lang=="sr"){
				animal_name="<s:property value="animal.dhpetWildAnimals.nameSr"/>";
			}else {
				animal_name="<s:property value="animal.dhpetWildAnimals.nameAl"/>";
			}
			$("#animal\\.dhpetWildAnimals\\.nameAl").select2("data", {id: "<s:property value='animal.dhpetWildAnimals.id'/>", name: animal_name});
		}
		
		$("#cancelAL").on('click', function () {
			$.ajax({
				type : "GET",
				url : "AnimalLocation.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#animal_form_content").html(jqXHR.responseText);
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
			$('#animal_form').submit();
			return false;        
		});
		$("#animal_form").submit(function() {
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
					$("#animal_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						jQuery("#animallocation_grid").trigger("reloadGrid");
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