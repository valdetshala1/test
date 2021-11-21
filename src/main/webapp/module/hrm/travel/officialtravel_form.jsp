<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">

<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="officialtravel_form" class="form-horizontal" action="OfficialTravelSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="hrm.travel.legend.official.travel.data"/></legend>
				<input id="officialTravel.id" name="officialTravel.id" value="<s:property value='officialTravel.id'/>" type="hidden">
<%-- 				<input value="<s:property value='locale.language'/>" type="text"/> --%>

			<!-- START officialTravel.employee -->
			<div id="employe">
				<s:if test="fieldErrors.get('officialTravel.employee.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="employee.label"/></label>
						<div class="col-md-10">
							<input id="officialTravel.employee.firstName" name="officialTravel.employee.firstName" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="officialTravel.employee.empty"/> </span>
							<input id="officialTravel.employee.id" name="officialTravel.employee.id" value="<s:property value='officialTravel.employee.id'/>" type="hidden">
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="employee.label"/></label>
						<div class="col-md-10">
							<input id="officialTravel.employee.firstName" name="officialTravel.employee.firstName" value="<s:property value='officialTravel.employee.firstName'/>" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
							<input id="officialTravel.employee.id" name="officialTravel.employee.id" value="<s:property value='officialTravel.employee.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				</div>
				<!-- END officialTravel.employee -->
				
				<!-- START officialTravel.travelType -->
					<s:if test="fieldErrors.get('officialTravel.travelType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hrm.official.travel.label.travel.type"/></label>
							<div class="col-md-10">
								<select class="form-control" id="officialTravel.travelType" name="officialTravel.travelType">
									<s:iterator value="travelTypeList" var="tt">
										<option value="<s:property value="#tt.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#tt.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#tt.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:elseif test="%{locale.language=='en'}">
												<s:property value="#tt.getDOMTEXT_EN()"/>
											</s:elseif>
										</option>
									</s:iterator>						
								</select>
								<span class="help-block"><i class="fa fa-warning"></i>
									<s:text name="officialTravel.travelType.empty"/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hrm.official.travel.label.travel.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="officialTravel.travelType" name="officialTravel.travelType">
								<s:iterator value="travelTypeList" var="tt">
									<option value="<s:property value="#tt.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#tt.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#tt.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:elseif test="%{locale.language=='en'}">
												<s:property value="#tt.getDOMTEXT_EN()"/>
											</s:elseif>
										</option>
								</s:iterator>						
							</select>
						</div>
					</div>
				</s:else>
				<!-- END officialTravel.travelType -->
				<!-- START officialTravel.fromDate -->
				<s:if test="fieldErrors.get('officialTravel.fromDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.grid.from.date"/></label>
						<div class="col-md-10">
							<input id="officialTravel.fromDate" name="officialTravel.fromDate" class="form-control" placeholder="<s:text name="hum.employee.grid.from.date"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="officialTravel.fromDate.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.grid.from.date"/></label>
						<div class="col-md-10">
							<input id="officialTravel.fromDate" name="officialTravel.fromDate" value="<s:property value='officialTravel.fromDate'/>" class="form-control" placeholder="<s:text name="hum.employee.grid.from.date"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END officialTravel.fromDate -->
				
				<!-- START officialTravel.toDate -->
				<s:if test="fieldErrors.get('officialTravel.toDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.to.date"/></label>
						<div class="col-md-10">
							<input id="officialTravel.toDate" name="officialTravel.toDate" class="form-control" placeholder="<s:text name="leave.ent.label.to.date"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="officialTravel.toDate.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('officialTravel.toDate.invalid')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.to.date"/></label>
						<div class="col-md-10">
							<input id="officialTravel.toDate" name="officialTravel.toDate" class="form-control" placeholder="<s:text name="leave.ent.label.to.date"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('officialTravel.toDate.invalid')"/></span>
						</div>	
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.to.date"/></label>
						<div class="col-md-10">
							<input id="officialTravel.toDate" name="officialTravel.toDate" value="<s:property value='officialTravel.toDate'/>" class="form-control" placeholder="<s:text name="leave.ent.label.to.date"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END officialTravel.toDate -->
				
				<!-- START officialTravel.daysRequested-->
				<s:if test="fieldErrors.get('officialTravel.daysRequested')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.leave.label.days"/></label>
						<div class="col-md-10">
							<input id="officialTravel.daysRequested" name="officialTravel.daysRequested" class="form-control" placeholder="<s:text name="hrm.leave.label.days"/>" type="text" data="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="officialTravel.daysRequested.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrm.leave.label.days"/></label>
						<div class="col-md-10">
							<input id="officialTravel.daysRequested" name="officialTravel.daysRequested" value="<s:property value='officialTravel.daysRequested'/>" class="form-control" placeholder="<s:text name="hrm.leave.label.days"/>" type="text" data="number">
						</div>									
					</div>
				</s:else>
				<!-- END officialTravel.daysRequested -->
						
				<!-- START officialTravel.fromDestination -->
				<s:if test="fieldErrors.get('officialTravel.fromDestination')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.official.travel.label.from.destination"/></label>
						<div class="col-md-10">
							<input maxlength="150" id="officialTravel.fromDestination" name="officialTravel.fromDestination" class="form-control" placeholder="<s:text name="hrm.official.travel.label.from.destination"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="officialTravel.fromDestination.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrm.official.travel.label.from.destination"/></label>
						<div class="col-md-10">
							<input maxlength="150" id="officialTravel.fromDestination" name="officialTravel.fromDestination" value="<s:property value='officialTravel.fromDestination'/>" class="form-control" placeholder="<s:text name="hrm.official.travel.label.from.destination"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END officialTravel.fromDestination -->
				
				<!-- START officialTravel.toDestination -->
				<s:if test="fieldErrors.get('officialTravel.toDestination')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.official.travel.label.to.destination"/></label>
						<div class="col-md-10">
							<input maxlength="150" id="officialTravel.toDestination" name="officialTravel.toDestination" class="form-control" placeholder="<s:text name="hrm.official.travel.label.to.destination"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="officialTravel.toDestination.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrm.official.travel.label.to.destination"/></label>
						<div class="col-md-10">
							<input maxlength="150" id="officialTravel.toDestination" name="officialTravel.toDestination" value="<s:property value='officialTravel.toDestination'/>" class="form-control" placeholder="<s:text name="hrm.official.travel.label.to.destination"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END officialTravel.toDestination -->
				<!-- START officialTravel.reimbursementExpenses -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hrm.official.travel.label.reimburse"/>?</label>
						<div class="col-md-10">
							<input id="officialTravel.reimbursementExpenses" name="officialTravel.reimbursementExpenses" type="checkbox">
						</div>
				</div>
				<!-- END officialTravel.reimbursementExpenses -->
				<!-- START officialTravel.reason -->
				<s:if test="fieldErrors.get('officialTravel.reason')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hrm.official.travel.label.reason"/></label>
						<div class="col-md-10">
							<input id="officialTravel.reason" name="officialTravel.reason" class="form-control" placeholder="<s:text name="hrm.official.travel.label.reason"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="officialTravel.employee.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hrm.official.travel.label.reason"/></label>
						<div class="col-md-10">
							<textarea id="officialTravel.reason" name="officialTravel.reason" class="form-control" placeholder="<s:text name="hrm.official.travel.label.reason"/>"><s:property value='officialTravel.reason' /></textarea>
						</div>									
					</div>
				</s:else>
				<!-- END officialTravel.reason -->
				<!-- START officialTravel.attachment -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hrm.skill.label.attachment"/></label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default" id="file" name="file" onchange="getFileData(this);">
					</div>
				</div>
				<!-- END officialTravel.attachment -->
			</fieldset>
			
			<input id="officialTravel.daysApproved" name="officialTravel.daysApproved" value="<s:property value='officialTravel.daysApproved'/>" class="form-control"type="hidden">
			<input id="officialTravel.returnDate" name="officialTravel.returnDate" value="<s:property value='officialTravel.returnDate'/>" class="form-control" placeholder="Default Text Field" type="hidden">
			<input id="officialTravel.daysSpent" name="officialTravel.daysSpent" value="<s:property value='officialTravel.daysSpent'/>" class="form-control" placeholder="Default Text Field" type="hidden">
			<input id="officialTravel.approvedComments" name="officialTravel.approvedComments" value="<s:property value='officialTravel.approvedComments' />" class="form-control" type="hidden">
			<input id="officialTravel.docName" name="officialTravel.docName" class="form-control" value="<s:property value='officialTravel.docName'/>" type="hidden">
			<input id="officialTravel.docType" name="officialTravel.docType" class="form-control" value="<s:property value='officialTravel.docType'/>" type="hidden">
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelOT" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveOT" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#officialTravel\\.docName").val(filename);
    $("#officialTravel\\.docType").val('.'+fileExt);
    
 }
	$(document).ready(function () {
		$('#officialTravel\\.travelType').val('<s:property value="officialTravel.travelType.DOMVALUE"/>');
		$('#officialTravel\\.fromDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$("input[data='number']").autoNumeric('init', {
			aDec : '.', 
			aSep : ',',
			mDec : '2'
		});
		$('#officialTravel\\.toDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
			sideBySide: false,
			onShow:function( ct ){
				this.setOptions({
					minDate: $('#officialTravel\\.fromDate').val()?$('#officialTravel\\.fromDate').val():false
				});
			},
		});
		$("#officialTravel\\.employee\\.firstName").select2({
		    placeholder: "<s:text name="organization.placeholder.enter.activity"/>", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.employee.do",
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
		    	$("#officialTravel\\.employee\\.id").val(item.id);
		    	$("#officialTravel\\.employee\\.firstName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#officialTravel\\.employee\\.firstName").select2("data", {id: "<s:property value='officialTravel.employee.id'/>", name: "<s:property value="officialTravel.employee.firstName"/> <s:property value="officialTravel.employee.lastName"/>"});
		
		
		$('#officialTravel\\.reimbursementExpenses').on('change',function(event){
			$('#officialTravel\\.reimbursementExpenses').val( $('#officialTravel\\.reimbursementExpenses')[0].checked ? "true" : "false" );
		});
		$('#officialTravel\\.reimbursementExpenses').val('<s:property value="officialTravel.reimbursementExpenses"/>');
		if($('#officialTravel\\.reimbursementExpenses').val()=='true'){
			$('#officialTravel\\.reimbursementExpenses').prop('checked', true);
			
			};

		$("#cancelOT").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "OfficialTravel.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#officialtravel_form_content").html(jqXHR.responseText);
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
				complete:function(jqXHR, textStatus){
				}
			});			
			return false;        
		});

		Ladda.bind('#saveOT');		
		$("#saveOT").on('click', function () {    
			$("#officialtravel_form :button").prop('disabled','disabled');                
			$('#officialtravel_form').submit();
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
					$("#officialtravel_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
				success : function(data, status, jqXHR) { // on success..
					$("#officialtravel_form_content").html(jqXHR.responseText);
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
						jQuery("#officialtravel_grid").trigger("reloadGrid");
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
			$("#officialtravel_form :button").prop('disabled',false);				
		})();
		if($('#officialTravel\\.id').val().length>0){
			$("#officialTravel\\.employee\\.firstName").val('<s:property value="officialTravel.employee.firstName"/> <s:property value="officialTravel.employee.lastName"/>');
		}
		    	
	});            
</script>