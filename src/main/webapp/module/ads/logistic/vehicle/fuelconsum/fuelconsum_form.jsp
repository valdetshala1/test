<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">

<!-- widget div-->
<div id="fuelconsum_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="fuelconsum_form" class="form-horizontal"
			action="FuelConsumSave.do" accept-charset="utf8"
			method="post">

			<input type="hidden" id="fuelConsum.id"
				name="fuelConsum.id"
				value="<s:property value="fuelConsum.id"/>" />

			<fieldset>
				<legend><s:text name="vehicles.label.fuel.consum.data"/></legend>
				<!-- START fuelConsum.vehicle.id-->
				<input id="fuelConsum.vehicle.id" name="fuelConsum.vehicle.id" value="<s:property value='fuelConsum.vehicle.id'/>" type="hidden">
				<!-- END fuelConsum.vehicle.id -->
				<!-- START fuelConsum.employeeByDriverId -->
					<s:if test="fieldErrors.get('fuelConsum.employeeByDriverId.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="vehicles.label.driver"/></label>
							<div class="col-md-10">
								<input id="fuelConsum.employeeByDriverId.firstName" name="fuelConsum.employeeByDriverId.firstName" class="form-control" placeholder="<s:text name="vehicles.label.driver"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fuelConsum.employeeByDriverId.id')"/> </span>
								<input id="fuelConsum.employeeByDriverId.id" name="fuelConsum.employeeByDriverId.id" value="<s:property value='fuelConsum.employeeByDriverId.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="vehicles.label.driver"/></label>
							<div class="col-md-10">
								<input id="fuelConsum.employeeByDriverId.firstName" name="fuelConsum.employeeByDriverId.firstName" value="<s:property value='fuelConsum.employeeByDriverId.firstName'/>" class="form-control" placeholder="<s:text name="vehicles.label.driver"/>" type="text">
								<input id="fuelConsum.employeeByDriverId.id" name="fuelConsum.employeeByDriverId.id" value="<s:property value='fuelConsum.employeeByDriverId.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				<!-- END fuelConsum.employeeByDriverId -->
				<!-- START fuelConsum.vendor -->
					<s:if test="fieldErrors.get('fuelConsum.vendor')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.vendor"/></label>
							<div class="col-md-10">
								<input id="fuelConsum.vendor" maxlength="50" name="fuelConsum.vendor" class="form-control" placeholder="<s:text name="vehicles.label.vendor"/>" type="text"> 
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fuelConsum.vendor')" /></span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.vendor"/></label>
							<div class="col-md-10"> 
								<input id="fuelConsum.vendor" maxlength="50" name="fuelConsum.vendor" value="<s:property value='fuelConsum.vendor'/>" class="form-control" placeholder="<s:text name="vehicles.label.vendor"/>" type="text">
							</div>
						</div>
					</s:else>
				<!-- END fuelConsum.vendor -->
				
				<!-- START fuelConsum.invoiceNo -->
					<s:if test="fieldErrors.get('fuelConsum.invoiceNo')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.invoice.no"/></label>
							<div class="col-md-10">
								<input id="fuelConsum.invoiceNo" maxlength="25" name="fuelConsum.invoiceNo" class="form-control" placeholder="<s:text name="vehicles.label.invoice.no"/>" type="text"> 
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fuelConsum.invoiceNo')" /></span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.invoice.no"/></label>
							<div class="col-md-10"> 
								<input id="fuelConsum.invoiceNo" maxlength="25" name="fuelConsum.invoiceNo" value="<s:property value='fuelConsum.invoiceNo'/>" class="form-control" placeholder="<s:text name="vehicles.label.invoice.no"/>" type="text">
							</div>
						</div>
					</s:else>
				<!-- END fuelConsum.invoiceNo -->
				
				<!-- START fuelConsum.date -->
					<s:if test="fieldErrors.get('fuelConsum.date')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.date"/></label>
							<div class="col-md-10">
								<input id="fuelConsum.date" name="fuelConsum.date" class="form-control" placeholder="<s:text name="vehicles.label.date"/>" type="text"> 
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fuelConsum.date')" /></span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.date"/></label>
							<div class="col-md-10"> 
								<input id="fuelConsum.date" name="fuelConsum.date" value="<s:property value='fuelConsum.date'/>" class="form-control" placeholder="<s:text name="vehicles.label.date"/>" type="text">
							</div>
						</div>
					</s:else>
				<!-- END fuelConsum.date -->
				
				<!-- START fuelConsum.typeFeul -->
					<s:if test="fieldErrors.get('fuelConsum.typeFeul')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1"><s:text name="vehicles.label.fuel.type"/></label>
							<div class="col-md-10">
								<select class="form-control" id="fuelConsum.typeFeul" name="fuelConsum.typeFeul">
									<s:iterator value="fuelTypeList" var="ft">
										<option value="<s:property value="#ft.getDOMVALUE()" />"><s:property value="#ft.getDOMTEXT_EN()" /></option>
									</s:iterator>						
								</select>
								<span class="help-block"><i class="fa fa-warning"></i>
									<s:property value="fieldErrors.get('fuelConsum.typeFeul')"/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="vehicles.label.fuel.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="fuelConsum.typeFeul" name="fuelConsum.typeFeul">
								<s:iterator value="fuelTypeList" var="ft">
									<option value="<s:property value="#ft.getDOMVALUE()" />"><s:property value="#ft.getDOMTEXT_EN()" /></option>
								</s:iterator>						
							</select>
						</div>
					</div>
				</s:else>
				<!-- END fuelConsum.typeFeul -->
				
				<!-- START fuelConsum.liter -->
					<s:if test="fieldErrors.get('fuelConsum.liter')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="vehicles.label.liters"/></label>
							<div class="col-md-10">
								<input id="fuelConsum.liter" name="fuelConsum.liter" class="form-control" placeholder="<s:text name="vehicles.label.liters"/>" type="text"> 
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fuelConsum.liter')" /></span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="vehicles.label.liters"/></label>
							<div class="col-md-10"> 
								<input id="fuelConsum.liter" name="fuelConsum.liter" value="<s:property value='fuelConsum.liter'/>" class="form-control" placeholder="<s:text name="vehicles.label.liters"/>" type="text">
							</div>
						</div>
					</s:else>
				<!-- END fuelConsum.liter -->
				
				<!-- START fuelConsum.mileageWhenFilled -->
					<s:if test="fieldErrors.get('fuelConsum.mileageWhenFilled')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.mileage.when.filled"/></label>
							<div class="col-md-10">
								<input id="fuelConsum.mileageWhenFilled" maxlength="20" data='number' name="fuelConsum.mileageWhenFilled" class="form-control" placeholder="<s:text name="vehicles.label.mileage.when.filled"/>" type="text"> 
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fuelConsum.mileageWhenFilled')" /></span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.mileage.when.filled"/></label>
							<div class="col-md-10"> 
								<input id="fuelConsum.mileageWhenFilled" maxlength="20" data='number' name="fuelConsum.mileageWhenFilled" value="<s:property value='fuelConsum.mileageWhenFilled'/>" class="form-control" placeholder="<s:text name="vehicles.label.mileage.when.filled"/>" type="text">
							</div>
						</div>
					</s:else>
				<!-- END fuelConsum.mileageWhenFilled -->
				
				<!-- START fuelConsum.totalMileage -->
					<s:if test="fieldErrors.get('fuelConsum.totalMileage')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.total.mileage"/></label>
							<div class="col-md-10">
								<input id="fuelConsum.totalMileage" maxlength="20" data='number' name="fuelConsum.totalMileage" class="form-control" placeholder="<s:text name="vehicles.label.total.mileage"/>" type="text"> 
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fuelConsum.totalMileage')" /></span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="vehicles.label.total.mileage"/></label>
							<div class="col-md-10"> 
								<input id="fuelConsum.totalMileage" maxlength="20" data='number' name="fuelConsum.totalMileage" value="<s:property value='fuelConsum.totalMileage'/>" class="form-control" placeholder="<s:text name="vehicles.label.total.mileage"/>" type="text">
							</div>
						</div>
					</s:else>
				<!-- END fuelConsum.totalMileage -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFC" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFC" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
<!-- end widget -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#fuelConsum\\.vehicle\\.id').val($("#vehicleId").val());
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$('#fuelConsum\\.typeFeul').val('<s:property value="fuelConsum.typeFeul"/>');
		$('#fuelConsum\\.liter').autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2',vMax:'99999999'});
		$('#fuelConsum\\.date').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$("#fuelConsum\\.employeeByDriverId\\.firstName").select2({
		    placeholder: "",
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.assignEmployee.do?org_id="+$("#vehicleOrganisation").val(),
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
		    	$("#fuelConsum\\.employeeByDriverId\\.id").val(item.id);
		    	$("#fuelConsum\\.employeeByDriverId\\.firstName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		if($("#fuelConsum\\.employeeByDriverId\\.id").val()){
			$("#fuelConsum\\.employeeByDriverId\\.firstName").select2("data", {id: "<s:property value='fuelConsum.employeeByDriverId.id'/>", name: "<s:property value="fuelConsum.employeeByDriverId.firstName"/>"+" "+"<s:property value="fuelConsum.employeeByDriverId.lastName"/>"});
		}
		$("#cancelFC").on('click',function() {
			$.ajax({type : "GET",
					url : "FuelConsum.form.do",
					async : false,
					beforeSend : function(jqXHR, settings) {
								},
					error : function(errorThrown,status, jqXHR) { // on error..
								alert("error:"+ errorThrown+ ", status:"+ status);
							},
					success : function(data, status,jqXHR) { // on success..
								$("#fuelconsum_form_content").html(jqXHR.responseText);
								//alert after cancel action
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
					complete : function(jqXHR,textStatus) {
								}
					});
				return false;
			});
						Ladda.bind('#saveFC');
						$("#saveFC").on('click', function() {
							$("#fuelconsum_form :button").prop('disabled','disabled');
							$('#fuelconsum_form').submit();
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
									$("#fuelconsum_form").html(response);
									alert("error:" + errorThrown + ", status:" + status);
								},	    
							    success : function(data, status, jqXHR) {
							    	$("#fuelconsum_form_content").html(jqXHR.responseText);
									jQuery("#fuelconsum_grid").trigger("reloadGrid");
									var errors_exits = jqXHR.getResponseHeader("errors_exits");
									if(!errors_exits){
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
					complete : function(jqXHR,textStatus) {
												//$('#ajaxBusyFarmer').hide();
								}
							});		
							$("#fuelconsum_form :button").prop('disabled',false);
						})();	
							    	
					});            
</script>