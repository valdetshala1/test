<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">

<!-- widget div-->
<!-- <div id="logvehicles_form_content"> -->
<div id="register_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="register_form" class="form-horizontal"
			action="VehiclesRegisterSave.do" accept-charset="utf8"
			method="post">

			<input type="hidden" id="vehicleRegister.id"
				name="vehicleRegister.id"
				value="<s:property value="vehicleRegister.id"/>" />

			<fieldset>
				<legend><s:text name="vehicles.legend.vehicle.register.data"/></legend>
				<!-- START vehicleRegister.vehicle.id-->
				<s:if test="vehicleRegister.id!=null">
					<input id="vehicleRegister.vehicle.id"
					name="vehicleRegister.vehicle.id"
					value="<s:property value='vehicleRegister.vehicle.id'/>" type="hidden">
				</s:if>
				<s:else>
					<input id="vehicleRegister.vehicle.id"
					name="vehicleRegister.vehicle.id"
					value="<s:property value='vehicle.id'/>" type="hidden">
					</s:else>
				<!-- END vehicleRegister.logVehicles -->
				<!-- START vehicleRegister.registeredDate -->
				<s:if
					test="fieldErrors.get('vehicleRegister.registeredDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.registered.date"/></label>
						<div class="col-md-10">
							<input id="vehicleRegister.registeredDate"
								name="vehicleRegister.registeredDate" class="form-control"
								placeholder="<s:text name="vehicles.label.registered.date"/>" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicleRegister.registeredDate')" />
							</span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.registered.date"/></label>
						<div class="col-md-10">
							<input id="vehicleRegister.registeredDate"
								name="vehicleRegister.registeredDate"
								value="<s:property value='vehicleRegister.registeredDate'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.registered.date"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicleRegister.registeredDate -->
				<!-- START vehicleRegister.valideToDate -->
				<s:if
					test="fieldErrors.get('vehicleRegister.valideToDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.valide.to.date"/></label>
						<div class="col-md-10">
							<input id="vehicleRegister.valideToDate"
								name="vehicleRegister.valideToDate" class="form-control"
								placeholder="<s:text name="vehicles.label.valide.to.date"/>" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicleRegister.valideToDate')" />
							</span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.valide.to.date"/></label>
						<div class="col-md-10">
							<input id="vehicleRegister.valideToDate"
								name="vehicleRegister.valideToDate"
								value="<s:property value='vehicleRegister.valideToDate'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.valide.to.date"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END vehicleRegister.valideToDate -->
 				<!--START vehicleRegister.mileageAtRegister -->
				<s:if
					test="fieldErrors.get('vehicleRegister.mileageAtRegister')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.mileage.at.register"/></label>
						<div class="col-md-10">
							<input id="vehicleRegister.mileageAtRegister"
								name="vehicleRegister.mileageAtRegister"
								class="form-control" placeholder="<s:text name="vehicles.label.mileage.at.register"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicleRegister.mileageAtRegister')" />
							</span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.mileage.at.register"/></label>
						<div class="col-md-10">
							<input id="vehicleRegister.mileageAtRegister"
								name="vehicleRegister.mileageAtRegister"
								value="<s:property value='vehicleRegister.mileageAtRegister'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.mileage.at.register"/>"
								type="text">
						</div>
					</div>
				</s:else>
<!-- 				END vehicleRegister.mileageAtRegister -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelLVR" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveLVR" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$('#vehicleRegister\\.registeredDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#vehicleRegister\\.valideToDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$("#cancelLVR").on('click',function() {
			$.ajax({type : "GET",
					url : "VehiclesRegister.form.do",
					async : false,
					beforeSend : function(jqXHR, settings) {
								},
					error : function(errorThrown,status, jqXHR) { // on error..
								alert("error:"+ errorThrown+ ", status:"+ status);
							},
					success : function(data, status,jqXHR) { // on success..
								$("#register_form_content").html(jqXHR.responseText);
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
			Ladda.bind('#saveLVR');
			$("#saveLVR").on('click', function() {
				$("#register_form :button").prop('disabled','disabled');
				$('#register_form').submit();
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
						$("#register_form_content").html(response);
						alert("error:" + errorThrown + ", status:" + status);
					},	    
				    success : function(data, status, jqXHR) {
				    	$("#register_form_content").html(jqXHR.responseText);
						jQuery("#register_grid").trigger("reloadGrid");
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
			$("#vehicleRegister\\.vehicle\\.id").val($("#vehicleId").val());
// 			alert($("#vehicleRegister\\.logVehicles\\.id").val());
		});

</script>