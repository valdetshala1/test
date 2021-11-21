<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">

<!-- widget div-->
<!-- <div id="vehicles_form_content"> -->
<div id="vehicles_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="vehicles_form" class="form-horizontal"
			action="VehiclesSave.do" accept-charset="utf8" method="post">

			<input type="hidden" id="vehicle.id"
				name="vehicle.id"
				value="<s:property value="vehicle.id"/>" />
		    <input type="hidden" id="vehicle.createdDate"
				name="vehicle.createdDate"
				value="<s:property value="vehicle.createdDate"/>" />
		    <input type="hidden" id="vehicle.employee.id"
				name="vehicle.employee.id"
				value="<s:property value="vehicle.employee.id"/>" />

			<fieldset>
				<legend><s:text name="vehicles.legend.vehicle.data"/></legend>
				<!-- Start vehicle.organisation -->
				<s:if test="fieldErrors.get('vehicle.organisation.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="asset.legend.department"/></label>
						<div class="col-md-10">
							<input id="vehicle.organisation.orgaName" name="vehicle.organisation.orgaName" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('vehicle.organisation.id')"/> </span>
							<input id="vehicle.organisation.id" name="vehicle.organisation.id" value="<s:property value='vehicle.organisation.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="asset.legend.department"/></label>
						<div class="col-md-10">
						<input id="vehicle.organisation.orgaName" name="vehicle.organisation.orgaName" value="<s:property value='vehicle.organisation.orgaName'/>" class="form-control" placeholder="<s:text name="asset.legend.department"/>" type="text">
						<input id="vehicle.organisation.id" name="vehicle.organisation.id" value="<s:property value='vehicle.organisation.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.organisation -->
				<!-- START vehicle.destination -->
				<s:if test="fieldErrors.get('vehicle.destination')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.official.travel.grid.dest"/></label>
						<div class="col-md-10">
							<input id="vehicle.destination"
								name="vehicle.destination" maxlength="50" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.destination')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrm.official.travel.grid.dest"/></label>
						<div class="col-md-10">
							<input id="vehicle.destination"
								name="vehicle.destination"  maxlength="50"
								value="<s:property value='vehicle.destination'/>"
								class="form-control" placeholder="<s:text name="report.wood.production.label.destination"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.destination -->
					<!-- START vehicle.brand -->
				<s:if test="fieldErrors.get('vehicle.brand')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.brand"/></label>
						<div class="col-md-10">
							<input id="vehicle.brand"
								name="vehicle.brand"  maxlength="50" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.brand')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.brand"/></label>
						<div class="col-md-10">
							<input id="vehicle.brand"
								name="vehicle.brand"  maxlength="50"
								value="<s:property value='vehicle.brand'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.brand"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.brand -->
					<!-- START vehicle.type -->
				<s:if test="fieldErrors.get('vehicle.type')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.type"/></label>
						<div class="col-md-10">
							<input id="vehicle.type"
								name="vehicle.type"  maxlength="50" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.type')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.type"/></label>
						<div class="col-md-10">
							<input id="vehicle.type"
								name="vehicle.type"  maxlength="50"
								value="<s:property value='vehicle.type'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.type"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.type -->
				<!-- START vehicle.yearProduct -->
				<s:if test="fieldErrors.get('vehicle.yearProduct')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.year.product"/></label>
						<div class="col-md-10">
							<input id="vehicle.yearProduct"
								name="vehicle.yearProduct" class="form-control"
								placeholder="<s:text name="vehicles.label.year.product"/>" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.yearProduct')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.year.product"/></label>
						<div class="col-md-10">
							<input id="vehicle.yearProduct"
								name="vehicle.yearProduct"
								value="<s:property value='vehicle.yearProduct'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.year.product"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.yearProduct -->
				
				<!-- START vehicle.plateNumber -->
				<s:if test="fieldErrors.get('vehicle.plateNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.plate.number"/></label>
						<div class="col-md-10">
							<input id="vehicle.plateNumber"
								name="vehicle.plateNumber" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.plateNumber')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.plate.number"/></label>
						<div class="col-md-10">
							<input id="vehicle.plateNumber"
								name="vehicle.plateNumber"
								value="<s:property value='vehicle.plateNumber'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.plate.number"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.plateNumber -->
				<!-- START vehicle.firstRegistration -->
				<s:if test="fieldErrors.get('vehicle.firstRegistration')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.first.registration"/></label>
						<div class="col-md-10">
							<input id="vehicle.firstRegistration"
								name="vehicle.firstRegistration" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.firstRegistration')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.first.registration"/></label>
						<div class="col-md-10">
							<input id="vehicle.firstRegistration"
								name="vehicle.firstRegistration"
								value="<s:property value='vehicle.firstRegistration'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.first.registration"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.firstRegistration -->
				<!-- START vehicle.numberOfSeats -->
				<s:if test="fieldErrors.get('vehicle.numberOfSeats')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.number.of.seats"/></label>
						<div class="col-md-10">
							<input id="vehicle.numberOfSeats"
								name="vehicle.numberOfSeats" maxlength="2" size="2" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.numberOfSeats')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.number.of.seats"/></label>
						<div class="col-md-10">
							<input id="vehicle.numberOfSeats"
								 maxlength="2" name="vehicle.numberOfSeats"
								value="<s:property value='vehicle.numberOfSeats'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.number.of.seats"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.numberOfSeats -->
				<!-- START vehicle.color -->
				<s:if test="fieldErrors.get('vehicle.color')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.color"/></label>
						<div class="col-md-10">
							<input id="vehicle.color"
								name="vehicle.color"  maxlength="50" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.color')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.color"/></label>
						<div class="col-md-10">
							<input id="vehicle.color"
								name="vehicle.color"  maxlength="50"
								value="<s:property value='vehicle.color'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.color"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.color -->
				<!-- START vehicle.engineCode -->
				<s:if test="fieldErrors.get('vehicle.engineCode')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.engine.code"/></label>
						<div class="col-md-10">
							<input id="vehicle.engineCode"
								name="vehicle.engineCode"  maxlength="50" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.engineCode')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.engine.code"/></label>
						<div class="col-md-10">
							<input id="vehicle.engineCode"
								name="vehicle.engineCode"  maxlength="50"
								value="<s:property value='vehicle.engineCode'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.engine.code"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.engineCode -->
					<!-- START vehicle.weight -->
				<s:if test="fieldErrors.get('vehicle.weight')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.weight"/></label>
						<div class="col-md-10">
							<input data="number" id="vehicle.weight"
								name="vehicle.weight"   class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.weight')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.weight"/></label>
						<div class="col-md-10">
							<input data="number" id="vehicle.weight"
								name="vehicle.weight"  
								value="<s:property value='vehicle.weight'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.weight"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.weight -->
					<!-- START vehicle.typeEngine -->
				<s:if test="fieldErrors.get('vehicle.typeEngine')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.type.engine"/></label>
						<div class="col-md-10">
							<input id="vehicle.typeEngine"
								name="vehicle.typeEngine"  maxlength="50" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.typeEngine')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.type.engine"/></label>
						<div class="col-md-10">
							<input id="vehicle.typeEngine"
								name="vehicle.typeEngine"  maxlength="50"
								value="<s:property value='vehicle.typeEngine'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.type.engine"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.typeEngine -->
						<!-- START vehicle.volumeCapacity -->
				<s:if test="fieldErrors.get('vehicle.volumeCapacity')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.volume.capacity"/></label>
						<div class="col-md-10">
							<input data="number" id="vehicle.volumeCapacity"
								name="vehicle.volumeCapacity"  class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicle.volumeCapacity')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.volume.capacity"/></label>
						<div class="col-md-10">
							<input data="number" id="vehicle.volumeCapacity"
								name="vehicle.volumeCapacity" 
								value="<s:property value='vehicle.volumeCapacity'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.volume.capacity"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicle.volumeCapacity -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelLV" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveLV" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#vehicle\\.plateNumber").mask("3z"+"-999-99");
		
		$('input[data="number"]').autoNumeric('init',{aDec: '.', aSep: '', mDec: '2'});

		$('#vehicle\\.numberOfSeats').autoNumeric('init',{aDec: '.', aSep: ',', mDec: '0',vMax:99});
		$("#vehicle\\.yearProduct").mask("9999");
		$('#vehicle\\.firstRegistration').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			timepicker: false,
		});
		$("#vehicle\\.organisation\\.orgaName").select2({
		    placeholder: "",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.organisation.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        if(term == "") term = " ";   
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
		    	$("#vehicle\\.organisation\\.id").val(item.id);
		    	$("#vehicle\\.organisation\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		if($("#vehicle\\.organisation\\.id").val()){
			var orgaName=$("#vehicle\\.organisation\\.orgaName").val();
			$("#vehicle\\.organisation\\.orgaName").select2("data", {id: "<s:property value='vehicle.organisation.id'/>", name: orgaName});
		}
		
	    $("#cancelLV").on('click', function() {
			$.ajax({
				type : "GET",
				url : "Vehicles.profile.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#vehicles_profile_content").html(jqXHR.responseText);
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
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});

	    Ladda.bind('#saveLV');
		$("#saveLV").on('click', function() {
			$('#vehicles_form').submit();
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
					$("#vehicles_profile_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	var id=$("#vehicle\\.id").val();
					$("#vehicles_form_content").html(jqXHR.responseText);
					
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
					if(!errors_exits){
						jQuery("#vehicles_grid").trigger("reloadGrid");
						if(!id){
							loadURL("Vehicles.profile.do?vehicleId="+$("#vehicle\\.id").val(),$("#vehicles_profile_content"));
						}else {
							$("#vehicleOrganisation").val($("#vehicle\\.organisation\\.id").val());
						}
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
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});		
			$("#vehicles_form :button").prop('disabled',false);
		})();
	});

	
</script>