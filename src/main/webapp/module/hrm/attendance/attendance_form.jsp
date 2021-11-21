<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">
<!-- widget div-->
<!-- <div id="attendance_form_content"> -->
<div id="attendance_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="attendance_form" class="form-horizontal"
			action="AttendanceRecordSave.do" accept-charset="utf8" method="post">

			<input type="hidden" id="attendanceRecord.id"
				name="attendanceRecord.id"
				value="<s:property value="attendanceRecord.id"/>" />
			<input type="hidden" id="attendanceRecord.createdDate"
						name="attendanceRecord.createdDate"
						value="<s:property value="attendanceRecord.createdDate"/>" />
			<input type="hidden" id="attendanceRecord.employeeByCreatedBy.id"
						name="attendanceRecord.employeeByCreatedBy.id"
						value="<s:property value="attendanceRecord.employeeByCreatedBy.id"/>" />
			
			
			<fieldset>
				<legend><s:text name="hrm.attendance.legend.attendance.record.data"/></legend>
				<!-- START attendanceRecord.punchOutUserTime -->
				<s:if test="attendanceRecord!=null && attendanceRecord.punchOutUserTime==null && attendanceRecord.id!=null">
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrm.attendance.label.punch.in.user.time"/></label>
						<div class="col-md-10">
							<s:property value="attendanceRecord.punchInUserTime" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hrm.attendace.label.punch.in.note"/></label>
						<div class="col-md-10">
							<s:property value='attendanceRecord.punchInNote' />
						</div>
					</div>
					<s:if test="fieldErrors.get('attendanceRecord.punchOutUserTime')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="hrm.attendance.label.punch.out.user.time"/></label>
							<div class="col-md-10">
								<input id="attendanceRecord.punchOutUserTime" name="attendanceRecord.punchOutUserTime" class="form-control" placeholder="<s:text name="hrm.attendance.label.punch.out.user.time"/>" type="text"> 
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('attendanceRecord.punchOutUserTime')" />
								</span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="hrm.attendance.label.punch.out.user.time"/></label>
							<div class="col-md-10">
								<input id="attendanceRecord.punchOutUserTime" name="attendanceRecord.punchOutUserTime" value="<s:property value='attendanceRecord.punchOutUserTime'/>" class="form-control" placeholder="<s:text name="hrm.attendance.label.punch.out.user.time"/>" type="text">
							</div>
						</div>
					</s:else>
					<!-- END attendanceRecord.punchOutUserTime -->
					<!-- START attendanceRecord.punchOutNote -->
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name="hrm.attendance.label.punch.out.notes"/></label>
					 	  <div class="col-md-10">
					      		<textarea id="attendanceRecord.punchOutNote" name="attendanceRecord.punchOutNote" class="form-control" placeholder="<s:text name="hrm.attendance.label.punch.out.notes"/>"><s:property value='attendanceRecord.punchOutNote' /></textarea>
					      </div>         
				     </div>
					<!-- END attendanceRecord.punchOutNote -->
					<!-- START hidden fileds -->
					<input type="hidden" id="attendanceRecord.punchInUserTime"
						name="attendanceRecord.punchInUserTime"
						value="<s:property value="attendanceRecord.punchInUserTime"/>" />
					<input type="hidden" id="attendanceRecord.punchInUtcTime"
						name="attendanceRecord.punchInUtcTime"
						value="<s:property value="attendanceRecord.punchInUtcTime"/>" />
					<input type="hidden" id="attendanceRecord.punchOutUtcTime"
						name="attendanceRecord.punchOutUtcTime"
						value="<s:property value="attendanceRecord.punchOutUtcTime"/>" />
					<input type="hidden" id="attendanceRecord.status"
						name="attendanceRecord.status"
						value="<s:property value="attendanceRecord.status.DOMVALUE"/>" />
					<input type="hidden" id="attendanceRecord.punchInNote"
						name="attendanceRecord.punchInNote"
						value="<s:property value="attendanceRecord.punchInNote"/>" />
					<input type="hidden" id="attendanceRecord.employee.id"
						name="attendanceRecord.employee.id"
						value="<s:property value="attendanceRecord.employee.id"/>" />
						
						
						
						
						
					<!-- END hidden fileds -->

				</s:if>
				<s:elseif test="attendanceRecord==null">
					<!-- 				START attendanceRecord.punchInUserTime -->

<!-- 					<input type="hidden" id="attendanceRecord.status" -->
<!-- 						name="attendanceRecord.status" value="P" /> -->
					<s:if
						test="fieldErrors.get('attendanceRecord.punchInUserTime')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="hrm.attendance.label.punch.in.user.time"/></label>
							<div class="col-md-10">
								<input id="attendanceRecord.punchInUserTime"
									name="attendanceRecord.punchInUserTime" class="form-control"
									placeholder="<s:text name="hrm.attendance.label.punch.in.user.time"/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('attendanceRecord.punchInUserTime')" />
								</span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="hrm.attendance.label.punch.in.user.time"/></label>
							<div class="col-md-10">
								<input id="attendanceRecord.punchInUserTime"
									name="attendanceRecord.punchInUserTime"
									value="<s:property value='attendanceRecord.punchInUserTime'/>"
									class="form-control" placeholder="<s:text name="hrm.attendance.label.punch.in.user.time"/>"
									type="text">

							</div>
						</div>
					</s:else>
					<!-- END attendanceRecord.punchInUserTime -->
					<!-- START attendanceRecord.punchInNote -->
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name="hrm.attendace.label.punch.in.note"/></label>
					 	  <div class="col-md-10">
					      		<textarea id="attendanceRecord.punchInNote" name="attendanceRecord.punchInNote" class="form-control" placeholder="<s:text name="hrm.attendace.label.punch.in.note"/>"><s:property value='attendanceRecord.punchInNote' /></textarea>
					      </div>         
				     </div>
					<!-- END attendanceRecord.punchInNote -->
				</s:elseif>
				<!-- Start test attendanceRecord.employee -->
				<s:if test="fieldErrors.get('attendanceRecord.employee')!=null">
					<i class="fa fa-warning"></i>
					<s:property value="fieldErrors.get('attendanceRecord.employee')" />
				</s:if>
				<!-- End test attendanceRecord.employee -->
			</fieldset>

			<div class="form-actions">

				<div class="row">
					<div class="col-md-12">
						<button id="newEvidence" class="btn btn-default" type="submit">
							<s:text name="label.button.attendance.new"></s:text>
						</button>
						<s:if test="attendanceRecord.id">
							<button id="save" class="btn btn-primary" type="submit">
								<i class="fa fa-save"></i>
								<s:text name="label.button.attendance.Out"></s:text>
							</button>
						</s:if>
						<s:else>
							<button id="save" class="btn btn-primary" type="submit">
								<i class="fa fa-save"></i>
								<s:text name="label.button.attendance.In"></s:text>
							</button>
						</s:else>
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
		$('#attendanceRecord\\.punchInUserTime').datetimepicker({
 			lang: 'al',
 			format: 'd.m.Y H:m:s',
 			mask: false,
 			formatDate:'d.m.Y H:m:s',
 			timepicker: true,
 		});
 		$('#attendanceRecord\\.punchOutUserTime').datetimepicker({
 			lang: 'al',
 			format: 'd.m.Y H:m:s',
 			mask: false,
 			formatDate:'d.m.Y H:m:s',
 			timepicker: true,
 			onShow:function( ct ){
				this.setOptions({
					minDate: $('#attendanceRecord\\.punchInUserTime').val()?$('#attendanceRecord\\.punchInUserTime').val():false
				});
			},
 		});
		$("#save").on('click', function() {
			$('#attendance_form').submit();
			if($("#attendanceRecord\\.punchOutUtcTime").val()!=""){
				$("#save").hide();							
			} 
			return false;
		});
		
	$("#attendanceRecord\\.punchOutUtcTime").val();
		$("#newEvidence").on('click', function() {
			$.ajax({
				type : "GET",
				url : "AttendanceRecord.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#attendance_form_content").html(jqXHR.responseText);
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
			
		$("#attendance_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#attendance_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#attendance_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
					}
					else{
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
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
	});

	
</script>