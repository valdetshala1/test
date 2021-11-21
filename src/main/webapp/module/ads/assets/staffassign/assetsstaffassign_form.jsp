<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">

<!-- widget div-->
<div id="assetsstaffassign_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
	<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
		<form id="assetsstaffassign_form" class="form-horizontal"
			action="AssetsStaffAssignSave.do" accept-charset="utf8" method="post">

			<input type="hidden" id="assetStaffAssign.id"
				name="assetStaffAssign.id"
				value="<s:property value="assetStaffAssign.id"/>" />

			<fieldset>
				<legend><s:text name="asset.legend.asset.staff.assign"/></legend>
				<!-- START assetStaffAssign.assets -->
			<s:if test="assetStaffAssign.id!=null">
					<input id="assetStaffAssign.assets.id"
					name="assetStaffAssign.assets.id"
					value="<s:property value='assetStaffAssign.assets.id'/>" type="hidden">
				</s:if>
				<s:else>
					<input id="assetStaffAssign.assets.id"
					name="assetStaffAssign.assets.id"
					value="<s:property value='asset.id'/>" type="hidden">
					</s:else>
				<!-- END assetStaffAssign.assets-->
				<!-- START organisation -->
				<input id="organisation" name="organisation" type="hidden">
				<!-- END organisation-->
				<!-- START assetStaffAssign.employeeByEmployeeId -->
				<div id="employe">
				<s:if test="fieldErrors.get('assetStaffAssign.employeeByEmployeeId.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="report.damage.grid.label.employee"/></label>
						<div class="col-md-10">
							<input id="assetStaffAssign.employeeByEmployeeId.lastName" name="assetStaffAssign.employeeByEmployeeId.lastName" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('assetStaffAssign.employeeByEmployeeId')"/> </span>
							<input id="assetStaffAssign.employeeByEmployeeId.id" name="assetStaffAssign.employeeByEmployeeId.id" value="<s:property value='assetStaffAssign.employeeByEmployeeId.id'/>" type="hidden">
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.employee"/></label>
						<div class="col-md-10">
							<input id="assetStaffAssign.employeeByEmployeeId.lastName" name="assetStaffAssign.employeeByEmployeeId.lastName" value="<s:property value='assetStaffAssign.employeeByEmployeeId.lastName'/>" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
							<input id="assetStaffAssign.employeeByEmployeeId.id" name="assetStaffAssign.employeeByEmployeeId.id" value="<s:property value='assetStaffAssign.employeeByEmployeeId.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				</div>
				<!-- END assetStaffAssign.employeeByEmployeeId -->
				<!-- START organisation -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.all.employees"/></label>
						<div class="col-md-10">
							<input id="check" name="check" type="checkbox">
						</div>
					</div>
				<!-- END organisation -->
					<!-- START assetStaffAssign.dateOfAutorization -->
					<div id="autorizationDate">
				<s:if test="fieldErrors.get('assetStaffAssign.dateOfAutorization')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="asset.label.autorization.date"/></label>
						<div class="col-md-10">
							<input id="assetStaffAssign.dateOfAutorization" name="assetStaffAssign.dateOfAutorization" class="form-control" placeholder="<s:text name="asset.label.autorization.date"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('assetStaffAssign.dateOfAutorization')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="asset.label.autorization.date"/></label>
						<div class="col-md-10">
							<input id="assetStaffAssign.dateOfAutorization"
								name="assetStaffAssign.dateOfAutorization"
								value="<s:property value='assetStaffAssign.dateOfAutorization'/>"
								class="form-control" placeholder="<s:text name="asset.label.autorization.date"/>"
								type="text">
						</div>
					</div>
				</s:else>
				</div>
				<!-- END assetStaffAssign.dateOfAutorization -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAssetStaff" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveAssetStaff" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$('#assetStaffAssign\\.dateOfAutorization').datetimepicker({
			timepicker: false,
			format: 'd.m.Y',
			mask: false,
			lang: '<s:property value="#lang"/>'
		});
		$("#assetStaffAssign\\.employeeByEmployeeId\\.lastName").select2({
		    placeholder: "",
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.assignEmployee.do?org_id="+$("#assetOrganisation").val(),
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
		    	$("#assetStaffAssign\\.employeeByEmployeeId\\.id").val(item.id);
		    	$("#assetStaffAssign\\.employeeByEmployeeId\\.lastName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		if($("#assetStaffAssign\\.employeeByEmployeeId\\.id").val()){
			$("#assetStaffAssign\\.employeeByEmployeeId\\.lastName").select2("data", {id: "<s:property value='assetStaffAssign.employeeByEmployeeId.id'/>", name: "<s:property value="assetStaffAssign.employeeByEmployeeId.firstName"/>"+" "+"<s:property value="assetStaffAssign.employeeByEmployeeId.lastName"/>"});
		}
		
		  var c=false;
		  $(check).on('change',function(event){
		 	c=(!c);
			if(c==true){
				 $("#employe").hide();
				 $("#organisation").val($("#assetOrganisation").val());
// 				 alert( $("#logVehicles\\.organisation\\.id").val());
			}
			else{	
					$("#employe").show();
// 					$("#organisationList").hide();
					$("#organisation").val("");
				}
		  });
		
	    $("#cancelAssetStaff").on('click', function() {
			$.ajax({
				type : "GET",
				url : "AssetsStaffAssign.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#assetsstaffassign_form_content").html(jqXHR.responseText);
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

	    Ladda.bind('#saveAssetStaff');
		$("#saveAssetStaff").on('click', function() {
			$("#assetsstaffassign_form :button").prop('disabled','disabled');
			$('#assetsstaffassign_form').submit();
			return false;
		});
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {
// 					var this_form = $(this);
					$('<input>').attr({
						type : 'hidden',
						name : "organisation",
//							value : JSON.stringify(items)
						value : this.value
					}).appendTo($form);         
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					$("#assetsstaffassign_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#assetsstaffassign_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if (!errors) {
						$("#assetsstafassign_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					} else {
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
						//$("#farmer_expander").html(jqXHR.responseText);
					}
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});
			$("#assetsstaffassign_form :button").prop('disabled',false);				
		})();
// 		$("#assetsstaffassign_form").submit(function() {
// 			var this_form = $(this);
// 			$('<input>').attr({
// 				type : 'hidden',
// 				name : "organisation",
// //					value : JSON.stringify(items)
// 				value : this.value
// 			}).appendTo(this_form);
// 			$.ajax({
// 				data : this_form.serialize(), // get the form data
// 				type : this_form.attr('method'), // GET or POST
// 				url : this_form.attr('action'), // the file to call
// 				async : false,
// 				beforeSend : function(jqXHR, settings) {
// 				},
// 				error : function(errorThrown, status, jqXHR) { // on error..
// 					alert("error:" + errorThrown + ", status:" + status);
// 				},
// 				success : function(data, status, jqXHR) { // on success..
// 					$("#assetsstaffassign_form_content").html(jqXHR.responseText);
// 					jQuery("#assetsstafassign_grid").trigger("reloadGrid");
// 					var errors_exits = jqXHR.getResponseHeader("errors_exits");
// 					if(!errors_exits){
// 						$.smallBox({
// 							title : '<s:text name="small.box.on.save.title.success"/>',
// 							content : '<s:text name="small.box.content"/>',
// 							color : "#739E73",
// 							timeout: 5000,
// 							icon : "fa fa-check",
// 							number : "1"
// 						});									
// 					}else{
// 						$.smallBox({
// 							title : '<s:text name="small.box.on.save.title.failed"/>',
// 							content : '<s:text name="small.box.content"/>',
// 							color : "#C79121",
// 							timeout: 5000,
// 							icon : "fa fa-shield fadeInLeft animated",
// 							number : "2"
// 						});
// 					}
// 				},
// 				complete : function(jqXHR, textStatus) {
// 					//$('#ajaxBusyFarmer').hide();
// 				}
// 			});
// 			return false;
// 		});
		$("#assetStaffAssign\\.assets\\.id").val($("#assetId").val());
		$("#assetStaffAssign\\.organisation\\.id").val($("#assetOrganisation").val());
	});

	
</script>