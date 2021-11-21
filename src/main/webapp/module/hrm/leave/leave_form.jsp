<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<script type="text/javascript" src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<!-- <link rel="stylesheet" type="text/css" media="screen" href="js/plugin/ajaxwidget/ui.combobox-custom.css">		 -->
	
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="leave_form" class="form-horizontal" action="LeaveSave.do" accept-charset="utf8" method="post">
			
			<fieldset>
				<legend><s:text name="hrm.leave.legend.leave.data"/></legend>
				<input id="leave.id" name="leave.id" value="<s:property value='leave.id'/>" type="hidden">									
				<!-- START leave.employee.id -->
				<s:if test="fieldErrors.get('leave.employee.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="leave.ent.label.employee"/></label>
						<div class="col-md-10">
							<input id="leave.employee.firstName" name="leave.employee.firstName" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="leave.employee.id.empty"/> </span>
							<input id="leave.employee.id" name="leave.employee.id" value="<s:property value='leave.employee.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:elseif test="fieldErrors.get('leave.employee.no.entitlement')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="leave.ent.label.employee"/></label>
						<div class="col-md-10">
							<input id="leave.employee.firstName" name="leave.employee.firstName" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="leave.employee.no.entitlement"/> </span>
							<input id="leave.employee.id" name="leave.employee.id" value="<s:property value='leave.employee.id'/>" type="hidden">
						</div>
					</div>														
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="leave.ent.label.employee"/></label>
						<div class="col-md-10">
						<input id="leave.employee.firstName" name="leave.employee.firstName" class="form-control" value="<s:property value='leave.employee.firstName'/>" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
						<input id="leave.employee.id" name="leave.employee.id" value="<s:property value='leave.employee.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END leave.employee.id -->
	
				<!-- END leave.leaveType -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="leave.leaveType.id">*<s:text name="leave.ent.label.leave.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="leave.leaveType.id" name="leave.leaveType.id">
								<s:iterator value="leaveTypeList">
									<s:if test="%{id==leave.leaveType.id}">
									<option selected="selected" value="<s:property value="id"/>">
										<s:if test="%{locale.language=='en'}">
											<s:property value="nameEn"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="nameSr"/>
										</s:elseif>
										<s:elseif test="%{locale.language=='al'}">
											<s:property value="name"/>
										</s:elseif>
									</option>
									</s:if>
									<s:else>
									<option value="<s:property value="id"/>">
										<s:if test="%{locale.language=='en'}">
											<s:property value="nameEn"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="nameSr"/>
										</s:elseif>
										<s:elseif test="%{locale.language=='al'}">
											<s:property value="name"/>
										</s:elseif>
									</option>
									</s:else>
								</s:iterator>						
							</select>
						</div>
					</div>
				<!-- END leave.leaveType -->
			
				<!-- START leave.fromDate -->
				<s:if test="fieldErrors.get('leave.fromDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.grid.from.date"/></label>
						<div class="col-md-10">
							<input id="leave.fromDate" name="leave.fromDate" class="form-control" placeholder="dd.mm.yy" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="leave.from.date.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.grid.from.date"/></label>
						<div class="col-md-10">
							<input id="leave.fromDate" name="leave.fromDate" value="<s:property value='leave.fromDate'/>" class="form-control" placeholder="dd.mm.yy" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END leave.fromDate -->
				
				<!-- START leave.toDate -->
				<s:if test="fieldErrors.get('leave.toDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.to.date"/></label>
						<div class="col-md-10">
							<input id="leave.toDate" name="leave.toDate" class="form-control" placeholder="dd.mm.yy" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="leave.to.date.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('leave.toDate.invalid')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.to.date"/></label>
						<div class="col-md-10">
							<input id="leave.toDate" name="leave.toDate" class="form-control" placeholder="dd.mm.yy" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('leave.toDate.invalid')"/></span> 
						</div>
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.to.date"/></label>
						<div class="col-md-10">
							<input id="leave.toDate" name="leave.toDate" value="<s:property value='leave.toDate'/>" class="form-control" placeholder="dd.mm.yy" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END leave.toDate -->

				<!-- START leave.daysRequested-->
				<s:if test="fieldErrors.get('leave.daysRequested')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.leave.label.days"/></label>
						<div class="col-md-10">
							<input data="number" id="leave.daysRequested" name="leave.daysRequested" class="form-control" placeholder="<s:text name="leave.ent.label.number.of.days"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="leave.days.requested.empty"/> </span>
						</div>					
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('leave.daysRequested.less')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.leave.label.days"/></label>
						<div class="col-md-10">
							<input data="number" id="leave.daysRequested" name="leave.daysRequested" class="form-control" placeholder="<s:text name="leave.ent.label.number.of.days"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='leave.days.less'/> </span>
						</div>
					</div>
				</s:elseif>
				<s:elseif test="fieldErrors.get('leave.daysRequested.big')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hrm.leave.label.days"/></label>
						<div class="col-md-10">
							<input data="number" id="leave.daysRequested" name="leave.daysRequested" class="form-control" placeholder="<s:text name="leave.ent.label.number.of.days"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='leave.daysRequested.big'/> </span>
						</div>
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrm.leave.label.days"/></label>
						<div class="col-md-10">
							<input data="number" id="leave.daysRequested" name="leave.daysRequested" value="<s:property value='leave.daysRequested'/>" class="form-control" placeholder="<s:text name="leave.ent.label.number.of.days"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END leave.daysRequested -->							
												
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="label.employee.attachment"/></label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default" id="file" name="file" onchange="getFileData(this);">
					</div>
				</div>
				
			</fieldset>
			<input id="leave.daysApproved" name="leave.daysApproved" value="<s:property value='leave.daysApproved'/>" class="form-control" type="hidden">
			<input id="leave.returnDate" name="leave.returnDate" value="<s:property value='leave.returnDate'/>" class="form-control" placeholder="Default Text Field" type="hidden">
			<input id="leave.daysSpent" name="leave.daysSpent" value="<s:property value='leave.daysSpent'/>" class="form-control" placeholder="Default Text Field" type="hidden">
			<input id="leave.approvedComments" name="leave.approvedComments" class="form-control" value="<s:property value='leave.approvedComments'/>" type="hidden">
			<input id="leave.status" name="leave.status" class="form-control" value="<s:property value='leave.status'/>" type="hidden">
			<input id="leave.approvedDate" name="leave.approvedDate" class="form-control" value="<s:property value='leave.approvedDate'/>" type="hidden">
			<input id="leave.docName" name="leave.docName" class="form-control" value="<s:property value='leave.docName'/>" type="hidden">
			<input id="leave.docType" name="leave.docType" class="form-control" value="<s:property value='leave.docType'/>" type="hidden">
			
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
function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#leave\\.docName").val(filename);
    $("#leave\\.docType").val('.'+fileExt);
    
 }
	$(document).ready(function () {
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$('#leave\\.fromDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			timepicker: false
		});
		$('#leave\\.toDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			onShow:function( ct ){
				this.setOptions({
					minDate: $('#leave\\.fromDate').val()?$('#leave\\.fromDate').val():false
				});
			},
			timepicker: false,
		});

		$('#leave\\.fromDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			onShow:function( ct ){
				this.setOptions({
					minDate:0
				});
			},
			timepicker: false,
		});
		
		$("#leave\\.employee\\.firstName").select2({
		    placeholder: "Enter activity",
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.employee.do",
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
		    	$("#leave\\.employee\\.id").val(item.id);
		    	$("#leave\\.employee\\.firstName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		if($("#leave\\.employee\\.id").val()){
			$("#leave\\.employee\\.firstName").select2("data", {id: "<s:property value='leave.employee.id'/>", name: "<s:property value="leave.employee.firstName"/>"+" "+"<s:property value="leave.employee.lastName"/>"});
		}
		$("#cancel").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "Leave.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#leave_form_content").html(jqXHR.responseText);
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
		Ladda.bind('#save');
		$("#save").on('click', function () {                    
			$('#leave_form').submit();
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
					$("#leave_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#leave_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exists");
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
						jQuery("#leave_grid").trigger("reloadGrid");
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
		$('#leave\\.status').val('<s:property value="leave.status.DOMVALUE"/>');
	});            
</script>