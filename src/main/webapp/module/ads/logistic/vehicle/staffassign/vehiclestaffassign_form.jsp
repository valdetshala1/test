<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">

<!-- widget div-->
<div id="vehiclestaffassign_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="vehiclestaffassign_form" class="form-horizontal"
			action="VehicleStaffAssignSave.do" accept-charset="utf8" method="post">

			<input type="hidden" id="vehicleStaffAssign.id"
				name="vehicleStaffAssign.id"
				value="<s:property value="vehicleStaffAssign.id"/>" />

			<fieldset>
				<legend><s:text name="vehicles.label.vehicle.staff.assign"/></legend>
				<!-- START vehicleStaffAssign.vehicle -->
			<s:if test="vehicleStaffAssign.id!=null">
					<input id="vehicleStaffAssign.vehicle.id"
					name="vehicleStaffAssign.vehicle.id"
					value="<s:property value='vehicleStaffAssign.vehicle.id'/>" type="hidden">
				</s:if>
				<s:else>
					<input id="vehicleStaffAssign.vehicle.id"
					name="vehicleStaffAssign.vehicle.id"
					value="<s:property value='vehicle.id'/>" type="hidden">
					</s:else>
				<!-- END vehicleStaffAssign.vehicle-->
				<!-- START organisation -->
				<input id="organisation" name="organisation" type="hidden">
				<!-- END organisation-->
				<!-- START vehicleStaffAssign.employeeByEmployeeId -->
				<div id="employe">
				<s:if test="fieldErrors.get('vehicleStaffAssign.employeeByEmployeeId.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="report.damage.grid.label.employee"/></label>
						<div class="col-md-10">
							<input id="vehicleStaffAssign.employeeByEmployeeId.lastName" name="vehicleStaffAssign.employeeByEmployeeId.lastName" class="form-control" placeholder="<s:text name="report.damage.grid.label.employee"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('vehicleStaffAssign.employeeByEmployeeId.id')"/> </span>
							<input id="vehicleStaffAssign.employeeByEmployeeId.id" name="vehicleStaffAssign.employeeByEmployeeId.id" value="<s:property value='vehicleStaffAssign.employeeByEmployeeId.id'/>" type="hidden">
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="report.damage.grid.label.employee"/></label>
						<div class="col-md-10">
							<input id="vehicleStaffAssign.employeeByEmployeeId.lastName" name="vehicleStaffAssign.employeeByEmployeeId.lastName" value="<s:property value='vehicleStaffAssign.employeeByEmployeeId.lastName'/>" class="form-control" placeholder="<s:text name="report.damage.grid.label.employee"/>" type="text">
							<input id="vehicleStaffAssign.employeeByEmployeeId.id" name="vehicleStaffAssign.employeeByEmployeeId.id" value="<s:property value='vehicleStaffAssign.employeeByEmployeeId.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				</div>
				<!-- END vehicleStaffAssign.employeeByEmployeeId.id -->

				<!-- START organisation -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.all.employees"/></label>
						<div class="col-md-10">
							<input id="check" name="check" type="checkbox">
						</div>
					</div>
				<!-- END organisation -->
				<!-- START vehicleStaffAssign.autorization -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.autorization"/></label>
						<div class="col-md-10">
							<input id="vehicleStaffAssign.autorization" name="vehicleStaffAssign.autorization"  value="<s:property value='vehicleStaffAssign.autorization'/>" type="checkbox">
						</div>
				</div>
				<!-- END vehicleStaffAssign.autorization -->
				<!-- START vehicleStaffAssign.dateOfAutorization -->
				<div id="autorizationDate">
				<s:if test="fieldErrors.get('vehicleStaffAssign.dateOfAutorization')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.autorization.date"/></label>
						<div class="col-md-10">
							<input id="vehicleStaffAssign.dateOfAutorization"
								name="vehicleStaffAssign.dateOfAutorization" class="form-control"
								placeholder="<s:text name="vehicles.label.autorization.date"/>" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('vehicleStaffAssign.dateOfAutorization')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="vehicles.label.autorization.date"/></label>
						<div class="col-md-10">
							<input id="vehicleStaffAssign.dateOfAutorization"
								name="vehicleStaffAssign.dateOfAutorization"
								value="<s:property value='vehicleStaffAssign.dateOfAutorization'/>"
								class="form-control" placeholder="<s:text name="vehicles.label.autorization.date"/>"
								type="text">
						</div>
					</div>
				</s:else>
				</div>
				<!-- END vehicleStaffAssign.dateOfAutorization -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelVSA" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveVSA" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$('#vehicleStaffAssign\\.dateOfAutorization').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
// 			formatDate:'d.m.Y',
			timepicker: false,
		});
		$("#organisation\\.name").combobox_ajax({
	        source: function(request, response) {
	            $.ajax({
	            	type:"post",
	                url: "Input.organisation.do",
	                dataType: "json",
	                data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						name_startsWith: request.term
					},
					success: function( data ) {
						response( $.map( data, function(item ) {
							return {
								label: item.name,
	                            value: item.name,
	                            id: item.id
							};
						}));
					},
	                maxRows: 100,
	        		minLength: 0   
	            });
	        },
	        select: function(event, ui) {
	            $( "#organisation" ).val(ui.item.id);
	        }  
	    });

		$("#vehicleStaffAssign\\.employeeByEmployeeId\\.lastName").select2({
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
		    	$("#vehicleStaffAssign\\.employeeByEmployeeId\\.id").val(item.id);
		    	$("#vehicleStaffAssign\\.employeeByEmployeeId\\.lastName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		if($("#vehicleStaffAssign\\.employeeByEmployeeId\\.id").val()){
			$("#vehicleStaffAssign\\.employeeByEmployeeId\\.lastName").select2("data", {id: "<s:property value='vehicleStaffAssign.employeeByEmployeeId.id'/>", name: "<s:property value="vehicleStaffAssign.employeeByEmployeeId.firstName"/>"+" "+"<s:property value="vehicleStaffAssign.employeeByEmployeeId.lastName"/>"});
		}
		
// 		$("#organisationList").hide();
		  var c=false;
		  $(check).on('change',function(event){
		 	c=(!c);
			if(c==true){
				 $("#employe").hide();
				 $("#organisation").val($("#vehicleOrganisation").val());
// 				 alert( $("#logVehicles\\.organisation\\.id").val());
			}
			else{	
					$("#employe").show();
// 					$("#organisationList").hide();
					$("#organisation").val("");
				}
		  });
		  $('#vehicleStaffAssign\\.autorization').on('change',function(event){
				$('#vehicleStaffAssign\\.autorization').val( $('#vehicleStaffAssign\\.autorization')[0].checked ? "true" : "false" );
// 	 			alert($('#vehicleStaffAssign\\.autorization').val());
				});
			$('#vehicleStaffAssign\\.autorization').val('<s:property value="vehicleStaffAssign.autorization"/>');
			if($('#vehicleStaffAssign\\.autorization').val()=='true'){
				$('#vehicleStaffAssign\\.autorization').prop('checked', true);
				
				};
		
	    $("#cancelVSA").on('click', function() {
			$.ajax({
				type : "GET",
				url : "VehicleStaffAssign.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#vehiclestaffassign_form_content").html(jqXHR.responseText);
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

	    Ladda.bind('#saveVSA');
		$("#saveVSA").on('click', function() {
			$("#vehiclestaffassign_form :button").prop('disabled','disabled');
			$('#vehiclestaffassign_form').submit();
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
					$("#vehiclestaffassign_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#vehiclestaffassign_form_content").html(jqXHR.responseText);
					jQuery("#vehiclestaffassign_grid").trigger("reloadGrid");
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
			$("#vehiclestaffassign_form :button").prop('disabled',false);
		})();
		$("#vehicleStaffAssign\\.vehicle\\.id").val($("#vehicleId").val());
		$("#vehicle\\.organisation\\.id").val($("#vehicleOrganisation").val());
	});

	
</script>