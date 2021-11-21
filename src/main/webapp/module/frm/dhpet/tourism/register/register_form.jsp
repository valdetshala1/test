<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>

<div>
	<!-- widget content -->
	<div class="widget-body">
		<form id="register_form" class="form-horizontal" action="TouristRegisterSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="register.id" name="register.id" value="<s:property value="register.id"/>" />
			<input type="hidden" id="register.employee.id" name="register.employee.id" value="<s:property value="register.employee.id"/>" />
			<input type="hidden" id="register.createdDate" name="register.createdDate" value="<s:property value="register.createdDate"/>" />
			<input id="lang" name="lang" value="<s:property value="locale.language"/>" type="hidden">
			<fieldset>
				<legend>Tourism register</legend>
				
				<!-- START register.dhpetLocation -->
				<s:if test="fieldErrors.get('register.dhpetLocation')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dhpet.location'/></label>
						<div class="col-md-10">
							<input id="register.dhpetLocation.habitatLocation" name="register.dhpetLocation.habitatLocation" class="form-control" type="text">
							<input id="register.dhpetLocation.id" name="register.dhpetLocation.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('register.dhpetLocation')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dhpet.location'/></label>
						<div class="col-md-10">
							<input id="register.dhpetLocation.habitatLocation" name="register.dhpetLocation.habitatLocation" value="<s:property value='register.dhpetLocation.habitatLocation'/>" class="form-control" type="text">
							<input id="register.dhpetLocation.id" name="register.dhpetLocation.id" value="<s:property value='register.dhpetLocation.id'/>" class="form-control" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END register.dhpetLocation -->
				
				<!-- START register.dhpetTouristPurpose -->
				<s:if test="fieldErrors.get('register.dhpetTouristPurpose')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dhpet.register.dhpetTouristPurpose'/></label>
						<div class="col-md-10">
							<input id="register.dhpetTouristPurpose.name" name="register.dhpetTouristPurpose.name" class="form-control" type="text">
							<input id="register.dhpetTouristPurpose.id" name="register.dhpetTouristPurpose.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('register.dhpetTouristPurpose')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dhpet.register.dhpetTouristPurpose'/></label>
						<div class="col-md-10">
							<input id="register.dhpetTouristPurpose.name" name="register.dhpetTouristPurpose.name" value="<s:property value='register.dhpetTouristPurpose.name'/>" class="form-control" type="text">
							<input id="register.dhpetTouristPurpose.nameEn" name="register.dhpetTouristPurpose.nameEn" value="<s:property value='register.dhpetTouristPurpose.nameEn'/>" class="form-control" type="hidden">
							<input id="register.dhpetTouristPurpose.nameSr" name="register.dhpetTouristPurpose.nameSr" value="<s:property value='register.dhpetTouristPurpose.nameSr'/>" class="form-control" type="hidden">
							<input id="register.dhpetTouristPurpose.id" name="register.dhpetTouristPurpose.id" value="<s:property value='register.dhpetTouristPurpose.id'/>" class="form-control" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END register.dhpetTouristPurpose -->
				
				<!-- START register.startDate -->
				<s:if test="fieldErrors.get('register.startDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.start.date'/></label>
						<div class="col-md-10">
							<input id="register.startDate" name="register.startDate" class="form-control"  type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('register.startDate')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.start.date'/></label>
						<div class="col-md-10">
							<input id="register.startDate" name="register.startDate" value="<s:property value='register.startDate'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END register.startDate -->
				
				<!-- START register.endDate -->
				<s:if test="fieldErrors.get('register.endDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.end.date'/></label>
						<div class="col-md-10">
							<input id="register.endDate" name="register.endDate" class="form-control"  type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('register.endDate')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.end.date'/></label>
						<div class="col-md-10">
							<input id="register.endDate" name="register.endDate" value="<s:property value='register.endDate'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END register.endDate -->
				
				<!-- START register.touristNumber -->
				<s:if test="fieldErrors.get('register.touristNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dhpet.register.dhpetTouristNumber'/></label>
						<div class="col-md-10">
							<input id="register.touristNumber" name="register.touristNumber" class="form-control"  type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('register.touristNumber')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dhpet.register.dhpetTouristNumber'/></label>
						<div class="col-md-10">
							<input id="register.touristNumber" name="register.touristNumber" value="<s:property value='register.touristNumber'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END register.touristNumber -->
				
				<!-- START register.payment -->
				<s:if test="fieldErrors.get('register.payment')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='purchase.order.payment'/></label>
						<div class="col-md-10">
							<input id="register.payment" name="register.payment" class="form-control"  type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('register.payment')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='purchase.order.payment'/></label>
						<div class="col-md-10">
							<input id="register.payment" name="register.payment" value="<s:property value='register.payment'/>" class="form-control" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END register.payment -->
				
				<!-- START register.note -->
				<s:if test="fieldErrors.get('register.note')!=null"> 
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<input id="register.note" name="register.note" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('register.note')"/></span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="register.note" name="register.note" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='register.note'/></textarea>
						</div>									
					</div>
				</s:else>
				<!-- END register.note -->
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
	$("#register\\.payment").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"9999999.99",mDec: '2'});
	$("#register\\.touristNumber").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"9999999",mDec: '0'});
	$('#register\\.startDate').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		timepicker: false,
	});

	$('#register\\.endDate').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		timepicker: false,
	});

	$("#register\\.dhpetLocation\\.habitatLocation").select2({
	    placeholder: "",
	    minimumInputLength: 0,
	    ajax: {
	        url: "Input.dhpetLocation.do",
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
	    	$("#register\\.dhpetLocation\\.id").val(item.id);
	    	$("#register\\.dhpetLocation\\.habitatLocation").val(item.name);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	});

	if($("#register\\.dhpetLocation\\.id").val()){
		$("#register\\.dhpetLocation\\.habitatLocation").select2("data", {id: "<s:property value='register.dhpetLocation.id'/>", name: "<s:property value="register.dhpetLocation.habitatLocation"/>"});
	}

	$("#register\\.dhpetTouristPurpose\\.name").select2({
	    placeholder: "",
	    minimumInputLength: 0,
	    ajax: {
	        url: "Input.dhpetTouristPurpose.do",
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
	    	$("#register\\.dhpetTouristPurpose\\.id").val(item.id);
	    	$("#register\\.dhpetTouristPurpose\\.name").val(item.name);
	    	$("#register\\.dhpetTouristPurpose\\.nameEn").val(item.name);
	    	$("#register\\.dhpetTouristPurpose\\.nameSr").val(item.name);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	});

	if($("#register\\.dhpetTouristPurpose\\.id").val()){
		var purpose_name="",lang=$("#lang").val();
		
		if(lang=="en"){
			purpose_name="<s:property value="register.dhpetTouristPurpose.nameEn"/>";
		}else if(lang=="sr"){
			purpose_name="<s:property value="register.dhpetTouristPurpose.nameSr"/>";
		}else {
			purpose_name="<s:property value="register.dhpetTouristPurpose.name"/>";
		}
		$("#register\\.dhpetTouristPurpose\\.name").select2("data", {id: "<s:property value='register.dhpetTouristPurpose.id'/>", name: purpose_name});
	}
	
	Ladda.bind('#save');
	$("#save").on('click', function () { 
		$("#register_form :button").prop('disabled','disabled');              
		$('#register_form').submit();
		return false;        
	});

		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "TouristRegister.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#register_form_content").html(jqXHR.responseText);
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
					$("#register_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#register_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exist");
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
						jQuery("#register_grid").trigger("reloadGrid");
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