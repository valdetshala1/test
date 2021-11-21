<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">

<!-- widget div-->
<div id="servicemaintenance_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="servicemaintenance_form" class="form-horizontal"
			action="VehiclesServiceMaintenanceSave.do" accept-charset="utf8" method="post">

			<input type="hidden" id="vehicleServiceMaintenance.id"
				name="vehicleServiceMaintenance.id"
				value="<s:property value="vehicleServiceMaintenance.id"/>" />

			<fieldset>
				<legend><s:text name="vehicles.legend.vehicle.service.maint"/></legend>
				<!-- START vehicleServiceMaintenance.vehicle -->
			<s:if test="vehicleServiceMaintenance.id!=null">
					<input id="vehicleServiceMaintenance.vehicle.id"
					name="vehicleServiceMaintenance.vehicle.id"
					value="<s:property value='vehicleServiceMaintenance.vehicle.id'/>" type="hidden">
				</s:if>
				<s:else>
					<input id="vehicleServiceMaintenance.vehicle.id"
					name="vehicleServiceMaintenance.vehicle.id"
					value="<s:property value='vehicle.id'/>" type="hidden">
					</s:else>
				<!-- END vehicleServiceMaintenance.vehicle -->
				<!-- START vehicleServiceMaintenance.expenditureType -->
				<s:if test="fieldErrors.get('vehicleServiceMaintenance.expenditureType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.costs.label.expenditure.type"/></label>
						<div class="col-md-10">
							<input id="vehicleServiceMaintenance.expenditureType" maxlength="50"
								name="vehicleServiceMaintenance.expenditureType" class="form-control"
								placeholder="<s:text name="finance.costs.label.expenditure.type"/>" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicleServiceMaintenance.expenditureType')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="finance.costs.label.expenditure.type"/></label>
						<div class="col-md-10">
							<input id="vehicleServiceMaintenance.expenditureType" maxlength="50"
								name="vehicleServiceMaintenance.expenditureType"
								value="<s:property value='vehicleServiceMaintenance.expenditureType'/>"
								class="form-control" placeholder="<s:text name="finance.costs.label.expenditure.type"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicleServiceMaintenance.expenditureType -->
					<!-- START vehicleServiceMaintenance.value -->
				<s:if test="fieldErrors.get('vehicleServiceMaintenance.value')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.input.label.value"/></label>
						<div class="col-md-10">
							<input id="vehicleServiceMaintenance.value" data="number"
								name="vehicleServiceMaintenance.value" class="form-control"
								placeholder="<s:text name="finance.input.label.value"/>" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicleServiceMaintenance.value')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="finance.input.label.value"/></label>
						<div class="col-md-10">
							<input id="vehicleServiceMaintenance.value" data="number"
								name="vehicleServiceMaintenance.value"
								value="<s:property value='vehicleServiceMaintenance.value'/>"
								class="form-control" placeholder="<s:text name="finance.input.label.value"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicleServiceMaintenance.value -->
					<!-- START vehicleServiceMaintenance.dateService -->
				<s:if test="fieldErrors.get('vehicleServiceMaintenance.dateService')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.date.service"/></label>
						<div class="col-md-10">
							<input id="vehicleServiceMaintenance.dateService"
								name="vehicleServiceMaintenance.dateService" class="form-control"
								placeholder="<s:text name="vehicles.label.date.service"/>" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicleServiceMaintenance.dateService')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.date.service"/></label>
						<div class="col-md-10">
							<input id="vehicleServiceMaintenance.dateService"
								name="vehicleServiceMaintenance.dateService"
								value="<s:property value='vehicleServiceMaintenance.dateService'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.date.service"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicleServiceMaintenance.dateService -->
 				<!--START vehicleServiceMaintenance.dateValid -->
				<s:if test="fieldErrors.get('vehicleServiceMaintenance.dateValid')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.date.valid"/></label>
						<div class="col-md-10">
							<input id="vehicleServiceMaintenance.dateValid"
								name="vehicleServiceMaintenance.dateValid" class="form-control"
								placeholder="<s:text name="vehicles.label.date.valid"/>" type="text"> <span
 								class="help-block"><i class="fa fa-warning"></i> <s:property 
 									value="fieldErrors.get('vehicleServiceMaintenance.dateValid')" /> </span> 
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.date.valid"/></label>
						<div class="col-md-10">
							<input id="vehicleServiceMaintenance.dateValid"
								name="vehicleServiceMaintenance.dateValid"
								value="<s:property value='vehicleServiceMaintenance.dateValid'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.date.valid"/>"
								type="text">
						</div>
					</div>
				</s:else>
 				<!--END vehicleServiceMaintenance.dateValid -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelLVSM" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveLVSM" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$('#vehicleServiceMaintenance\\.dateValid').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
// 			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#vehicleServiceMaintenance\\.dateService').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
// 			formatDate:'d.m.Y',
			timepicker: false,
		});
	    $("#cancelLVSM").on('click', function() {
			$.ajax({
				type : "GET",
				url : "VehiclesServiceMaintenance.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#servicemaintenance_form_content").html(jqXHR.responseText);
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
	    Ladda.bind('#saveLVSM');
	    $("#saveLVSM").on('click', function() {
			$('#servicemaintenance_form').submit();
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
					$("#servicemaintenance_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#servicemaintenance_form_content").html(jqXHR.responseText);
					jQuery("#servicemaintenance_grid").trigger("reloadGrid");
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
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});		
			$("#register_form :button").prop('disabled',false);
		})();
		$("#vehicleServiceMaintenance\\.vehicle\\.id").val($("#vehicleId").val());
	});

	
</script>