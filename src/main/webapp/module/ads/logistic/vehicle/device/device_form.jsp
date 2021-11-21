<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">
	
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> --%>

<!-- widget div-->
<!-- <div id="logvehicles_form_content"> -->
<div id="device_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="device_form" class="smart-form" action="DeviceSave.do" accept-charset="utf8" method="post">
       			<input id="devices.vehicle.id" name="devices.vehicle.id" value="<s:property value='devices.vehicle.id'/>" type="hidden">

			<input type="hidden" id="devices.id" name="devices.id" value="<s:property value="devices.id"/>" />
			<input type="hidden" id="devices.createdDate" name="devices.createdDate" value="<s:property value="devices.createdDate"/>" />
			<input type="hidden" id="devices.employee.id" name="devices.employee.id" value="<s:property value="devices.employee.id"/>" />
			<input type="hidden" id="devices.deviceApiId" name="devices.deviceApiId" value="<s:property value="devices.deviceApiId"/>" />
			<fieldset>
				<legend>
					<s:text name="vehicles.label.device.data" />
				</legend>
			<div class="row">
					<!--START deviceForm.name -->
					<section class="col col-4">
					<label class="input">*<s:text name="vehicles.label.device.name" />:
						<s:if test="fieldErrors.get('devices.name')!=null">
							<div class="form-group has-error">
								<input id="devices.name" name="devices.name" class="form-control"
									placeholder="<s:text name="vehicles.label.device.name"/>"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('devices.name')" /> </span>
							</div>
						</s:if>
						<s:else>
							<input id="devices.name" name="devices.name"
									value="<s:property value='devices.name'/>" class="form-control"
									placeholder="<s:text name="vehicles.label.device.name"/>"
									type="text">
						</s:else>
					</label>
					</section>
				
					<!-- END deviceForm.name -->
	
					<!--START deviceForm.uniqueid -->
					<section class="col col-4">
						<label class="input">*<s:text name="vehicles.label.device.uniqueid" />:
							<s:if test="fieldErrors.get('devices.uniqueId')!=null">
								<div class="form-group has-error">
									<input id="devices.uniqueid" name="devices.uniqueid"
										class="form-control"
										placeholder="<s:text name="vehicles.label.device.uniqueid"/>"
										type="text"> <span class="help-block"><i
										class="fa fa-warning"></i> <s:property
											value="fieldErrors.get('devices.uniqueId')" /> </span>
								</div>
							</s:if>
							<s:else>
								<input id="devices.uniqueid" name="devices.uniqueid"
									value="<s:property value='devices.uniqueid'/>"
									class="form-control"
									placeholder="<s:text name="vehicles.label.device.uniqueid"/>"
									type="text">
							</s:else>
						</label>
					</section>
					<!-- END deviceForm.uniqueid -->
					
					<section class="col col-4">
						<label class="input"><s:text name="vehicles.label.device.phone" />:
							<s:if test="fieldErrors.get('devices.phone')!=null">
								<div class="form-group has-error">
									<input id="devices.uniqueid" name="devices.phone"
										class="form-control"
										placeholder="<s:text name="vehicles.label.device.phone"/>"
										type="text"> <span class="help-block"><i
										class="fa fa-warning"></i> <s:property
											value="fieldErrors.get('devices.uniqueId')" /> </span>
								</div>
							</s:if>
							<s:else>
								<input id="devices.phone" name="devices.phone"
									value="<s:property value='devices.phone'/>"
									class="form-control"
									placeholder="<s:text name="vehicles.label.device.phone"/>"
									type="text">
							</s:else>
						</label>
					</section>
		</div>
		<legend>Periudha aktive e paisjes:</legend>
		<br/>
		<div class="row">
					<!--START deviceForm.name -->
					<section class="col col-6">
						<label class="input">*<s:text name="hrm.skill.label.start.date" />:
							<s:if test="fieldErrors.get('devices.activeStartDate')!=null">
								<div class="form-group has-error">
									<input id="devices.activeStartDate" name="devices.activeStartDate" class="form-control"
										placeholder=""
										type="text"> <span class="help-block"><i
										class="fa fa-warning"></i> <s:property
											value="fieldErrors.get('devices.activeStartDate')" /> </span>
								</div>
							</s:if>
							<s:else>
								<input id="devices.activeStartDate" name="devices.activeStartDate"
										value="<s:property value='devices.activeStartDate'/>" class="form-control"
										placeholder=""
										type="text">
							</s:else>
						</label>
					</section>
				
					<!-- END deviceForm.name -->
	
					<!--START deviceForm.uniqueid -->
					<section class="col col-6">
						<label class="input">*<s:text name="hrm.skill.label.end.date" />:
							<s:if test="fieldErrors.get('devices.activeEndDate')!=null">
								<div class="form-group has-error">
									<input id="devices.activeEndDate" name="devices.activeEndDate"
										class="form-control"
										placeholder=""
										type="text"> <span class="help-block"><i
										class="fa fa-warning"></i> <s:property
											value="fieldErrors.get('devices.activeEndDate')" /> </span>
								</div>
							</s:if>
							<s:else>
								<input id="devices.activeEndDate" name="devices.activeEndDate"
									value="<s:property value='devices.activeEndDate'/>"
									class="form-control"
									placeholder=""
									type="text">
							</s:else>
						</label>
					</section>
					<!-- END deviceForm.uniqueid -->
		</div>
		<div class="row">
			<!-- START activeDevice -->
			
			
			<s:if test="fieldErrors.get('devices.active')!=null">
				<div class="form-group">
					<label class="col-md-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text
							name="vehicles.label.active.device" /></label>
					<div class="col-md-10">
						<input id="devices.activeDevice" name="devices.activeDevice"  value="<s:property value='devices.activeDevice'/>" type="checkbox">
					</div>
					<span class="help-block"><i
					class="fa fa-warning"></i> <s:property
						value="fieldErrors.get('devices.active')" /> </span>
				</div>
			</s:if>
			<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text
							name="vehicles.label.active.device" /></label>
					<div class="col-md-10">
						<input id="devices.activeDevice" name="devices.activeDevice"  value="<s:property value='devices.activeDevice'/>" type="checkbox">
					</div>
				</div>
			</s:else>
				
				
			</div>
			<!-- END activeDevice -->
		</div>
</fieldset>
	<footer class="form-actions act-popup-footer" >
		<button id="cancelD" class="btn btn-default" type="button">
			<s:text name="label.button.cancel"></s:text>
		</button>
		<button id="saveD" class="btn btn-primary ladda-button"
			type="submit" data-style="expand-right" data-color="green"
			data-size="medium" data-spinner-size="25"
			data-spinner-color="#ff0000">
			<i class="fa fa-save"></i>
			<s:text name="label.button.save"></s:text>
		</button>
	
	</footer>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget -->
<script type="text/javascript">
	$(document).ready(function() {
					function addDevice(){
						var dataDevice = {
								attributes:{},
								category:null,
								contact	:"",
								geofenceIds:[],
								groupId:0,
								id:-1,
								lastUpdate:null,
								model:"",
								name:"Testt1212",
								phone:"",
								positionId:0,
								status:"offline",
								uniqueId:"111112"
							};
						$.ajax({
						    type: 'post',
						    url: 'http://localhost:8083/api/devices/',
						    headers: {
						        "Authorization": "Basic " + btoa("admin:admin" )
						    },
						    data: JSON.stringify(dataDevice),
						    contentType: 'application/json',
							beforeSend : function(jqXHR, settings) {
							},
							error : function(errorThrown,status, jqXHR) { // on error..
										alert("error:"+ errorThrown+ ", status:"+ status);
									},
							success : function(data, status,jqXHR) { // on success..
										//$("#device_form_content").html(jqXHR.responseText);
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

						}
		
						$("#devices\\.vehicle\\.id").val($("#vehicleId").val());
						$('#devices\\.activeDevice').on('change',function(event){
							$('#devices\\.activeDevice').val($('#devices\\.activeDevice')[0].checked ? "true" : "false" );
						});

						if($("#devices\\.activeDevice").val()=="true"){
							$("#devices\\.activeDevice").prop('checked',true);
						}		
										
						$('#devices\\.activeStartDate').datetimepicker({
							lang: 'al',
							format: 'd.m.Y',
							mask: false,
							formatDate:'d.m.Y',
							timepicker: false,
						});

						$('#devices\\.activeEndDate').datetimepicker({
							lang: 'al',
							format: 'd.m.Y',
							mask: false,
							formatDate:'d.m.Y',
							timepicker: false,
						});
						

						
						Ladda.bind('#saveD');
						$("#saveD").on('click', function() {
							$("#device_form :button").prop('disabled','disabled');
							$('#device_form').submit();
// 							addDevice();
							return false;
						});
						$("#devices\\.employee\\.firstName").select2({
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
						    	$("#devices\\.employee\\.id").val(item.id);
						    	$("#devices\\.employee\\.firstName").val(item.name);
						        return item.name;
						    },
						    allowClear: true,
						    escapeMarkup: function (m) { return m; }
						});
						
						if($("#devices\\.employee\\.id").val()){
							$("#devices\\.employee\\.firstName").select2("data", {id: "<s:property value='devices.employee.id'/>", name: "<s:property value="devices.employee.firstName"/>"+" "+"<s:property value="devices.employee.lastName"/>"});
						}
						$("#cancelD").on('click',function() {
// 							addDevice();
							$.ajax({type : "GET",
									url : "Device.form.do",
									async : false,
									beforeSend : function(jqXHR, settings) {
												},
									error : function(errorThrown,status, jqXHR) { // on error..
												alert("error:"+ errorThrown+ ", status:"+ status);
											},
									success : function(data, status,jqXHR) { // on success..
												$("#device_form_content").html(jqXHR.responseText);
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
						(function() {
							$('form').ajaxForm({
								beforeSerialize: function($form, options) {         
								},
							    beforeSend: function() {
							    	//$('#ajaxBusyB').show();
							    },
								error : function(response, status, err){
									$("#device_form_content").html(response);
									alert("error:" + errorThrown + ", status:" + status);
								},	    
							    success : function(data, status, jqXHR) {
							    	$("#device_form_content").html(jqXHR.responseText);
									jQuery("#device_grid").trigger("reloadGrid");
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
							$("#device_form :button").prop('disabled',false);
						})();
						$("#vehicleStaffAssign\\.vehicle\\.id").val($("#vehicleId").val());
						$("#vehicle\\.organisation\\.id").val($("#vehicleOrganisation").val());


					});

	
</script>




