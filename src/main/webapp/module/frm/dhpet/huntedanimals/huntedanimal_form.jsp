<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<form id="huntedanimal_form" class="form-horizontal" action="HuntedAnimalSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="hunt.animals.legend.menu"/></legend>
				
				<input id="hunt.id" name="hunt.id" value="<s:property value='hunt.id'/>" type="hidden">
				<input id="hunt.dhpetAnnualPlan.id" name="hunt.dhpetAnnualPlan.id" value="<s:property value='hunt.dhpetAnnualPlan.id'/>" type="hidden">
				
				<input id="hunt.employee.id" name="hunt.employee.id" value="<s:property value='hunt.employee.id'/>" type="hidden">
				<input id="hunt.createdDate" name="hunt.createdDate" value="<s:property value="hunt.createdDate"/>" type="hidden">
				<input id="lang" name="lang" value="<s:property value="locale.language"/>" type="hidden">
				
				<!-- START hunt.dhpetWildAnimals -->
				<s:if test="fieldErrors.get('hunt.dhpetWildAnimals')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="animal.animal"/></label>
						<div class="col-md-10">
							<input id="hunt.dhpetWildAnimals.nameAl" name="hunt.dhpetWildAnimals.nameAl" class="form-control" type="text" >
							<input id="hunt.dhpetWildAnimals.id" name="hunt.dhpetWildAnimals.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('hunt.dhpetWildAnimals')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="animal.animal"/></label>
						<div class="col-md-10">
							<input id="hunt.dhpetWildAnimals.nameAl" name="hunt.dhpetWildAnimals.nameAl" value="<s:property value='hunt.dhpetWildAnimals.nameAl'/>" class="form-control" type="text">
							<input id="hunt.dhpetWildAnimals.nameEn" name="hunt.dhpetWildAnimals.nameEn" value="<s:property value='hunt.dhpetWildAnimals.nameEn'/>" class="form-control" type="hidden">
							<input id="hunt.dhpetWildAnimals.nameSr" name="hunt.dhpetWildAnimals.nameSr" value="<s:property value='hunt.dhpetWildAnimals.nameSr'/>" class="form-control" type="hidden">
							<input id="hunt.dhpetWildAnimals.id" name="hunt.dhpetWildAnimals.id" value="<s:property value='hunt.dhpetWildAnimals.id'/>" class="form-control" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END hunt.dhpetWildAnimals -->
				
				<!-- START hunt.date -->
				<s:if test="fieldErrors.get('hunt.date')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hunt.date"/></label>
						<div class="col-md-10">
							<input id="hunt.date" name="hunt.date" class="form-control" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('hunt.date')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hunt.date"/></label>
						<div class="col-md-10">
							<input id="hunt.date" name="hunt.date" value="<s:property value='hunt.date'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END hunt.date -->
				
				<!-- START hunt.animalsNumber -->
				<s:if test="fieldErrors.get('hunt.animalsNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hunt.animalsNumber"/></label>
						<div class="col-md-10">
							<input id="hunt.animalsNumber" data="numberLong" name="hunt.animalsNumber" class="form-control" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('hunt.animalsNumber')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hunt.animalsNumber"/></label>
						<div class="col-md-10">
							<input id="hunt.animalsNumber" data="numberLong" name="hunt.animalsNumber" value="<s:property value='hunt.animalsNumber'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END hunt.animalsNumber -->
				
		</fieldset>
		<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelHA" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveHA" class="btn btn-primary" type="submit">
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
		$("#hunt\\.dhpetAnnualPlan\\.id").val($("#annualplanId").val());
		$('#hunt\\.deathCause').val('<s:property value="hunt.deathCause.DOMVALUE"/>');
		$("#hunt\\.dhpetLocation\\.id").val($("#dhpetLocationId").val());
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"9999999.99",mDec: '2'});
  		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0',vMax:"999999999"});
		$("#hunt\\.year").mask("9999");

		$('#hunt\\.date').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		
		$("#hunt\\.dhpetWildAnimals\\.nameAl").select2({
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
		    	$("#hunt\\.dhpetWildAnimals\\.id").val(item.id);
		    	$("#hunt\\.dhpetWildAnimals\\.nameAl").val(item.name);
		    	$("#hunt\\.dhpetWildAnimals\\.nameSr").val(item.name);
		    	$("#hunt\\.dhpetWildAnimals\\.nameEn").val(item.name);
		    	
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		
		
		if($("#hunt\\.dhpetWildAnimals\\.id").val()){
			var hunt_name="",lang=$("#lang").val();
			if(lang=="en"){
				hunt_name="<s:property value="hunt.dhpetWildAnimals.nameEn"/>";
			}else if(lang=="sr"){
				hunt_name="<s:property value="hunt.dhpetWildAnimals.nameSr"/>";
			}else {
				hunt_name="<s:property value="hunt.dhpetWildAnimals.nameAl"/>";
			}
			$("#hunt\\.dhpetWildAnimals\\.nameAl").select2("data", {id: "<s:property value='hunt.dhpetWildAnimals.id'/>", name: hunt_name});
		}
		
		$("#cancelHA").on('click', function () {
			$.ajax({
				type : "GET",
				url : "HuntedAnimal.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#huntedanimal_form_content").html(jqXHR.responseText);
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
				
		$("#saveHA").on('click', function () {
			$('#huntedanimal_form').submit();
			return false;        
		});
		$("#huntedanimal_form").submit(function() {
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
					$("#huntedanimal_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						jQuery("#huntedanimal_grid").trigger("reloadGrid");
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