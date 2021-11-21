<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div id="status_container">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<div>

			<form id="leave_status_form" class="form-horizontal" action="LeaveStatusSave.do" accept-charset="utf8" method="post">
			 <input type="hidden" id="changeStatus" name="changeStatus" value="true"/>
			 <input type="hidden" id="leave.id" name="leave.id" value="<s:property value="leave.id"/>"/>
				<fieldset>
				
				<!-- START leave.status -->
				<div class="form-group">
				<div class="col-md-12">
					<label>*<s:text name="official.travel.status"/></label>
							<select class="form-control" id="leave.status" name="leave.status">
								<s:iterator value="statusList" var="tt">
									<option value="<s:property value="#tt.getDOMVALUE()" />"><s:property value="#tt.getDOMTEXT_EN()" /></option>
								</s:iterator>						
							</select>
				</div>
				</div>
				<!-- END leave.status -->
				
				<!-- START leave.daysApproved -->
				<s:if test="fieldErrors.get('leave.daysApproved')!=null">
					<div class="form-group has-error">
						<div class="col-md-12">
						<label>*<s:text name="hrm.leave.label.days.approved"/></label>
						
							<input data="number" id="leave.daysApproved" name="leave.daysApproved" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leave.daysApproved')"/> </span>
						</div>
					</div>														
				</s:if>
				<s:elseif test="fieldErrors.get('leave.daysApproved.less')!=null">
					<div class="form-group has-error">
						<div class="col-md-12">
						<label>*<s:text name="hrm.leave.label.days.approved"/></label>
						
							<input data="number" id="leave.daysApproved" name="leave.daysApproved" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leave.daysApproved.less')"/> </span>
						</div>
					</div>														
				</s:elseif>
				
				<s:else>
					<div class="form-group">
					<div class="col-md-12">
						<label>*<s:text name="hrm.leave.label.days.approved"/></label>
						
						<input data="number" id="leave.daysApproved" name="leave.daysApproved" class="form-control" value="<s:property value='leave.daysApproved'/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END leave.daysApproved -->

				<!-- START leave.returnDate -->
				<div class="form-group">
				<div class="col-md-12">
					<label><s:text name="hrm.leave.label.return.date"/></label>
						<input id="leave.returnDate" name="leave.returnDate" value="<s:property value='leave.returnDate'/>" class="form-control" placeholder="dd.mm.yy" type="text">
				</div>
				</div>
				<!-- END leave.returnDate -->
				
				<!-- START leave.daysSpent -->
				<s:if test="fieldErrors.get('leave.daysSpent')!=null">
					<div class="form-group has-error">
						<div class="col-md-12">
						<label><s:text name="hrm.leave.label.days.spent"/></label>
						
							<input data="number" id="leave.daysSpent" name="leave.daysSpent" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leave.daysSpent')"/> </span>
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<div class="col-md-12">
							<label><s:text name="hrm.leave.label.days.spent"/></label>
							<input data="number" id="leave.daysSpent" name="leave.daysSpent" class="form-control" value="<s:property value='leave.daysSpent'/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END leave.daysSpent -->
				
				<!-- START leave.approvedComments -->
				<div class="form-group">
				<div class="col-md-12">
					<label><s:text name="hum.employee.label.comment"/></label>
						<textarea id="leave.approvedComments" name="leave.approvedComments" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"><s:property value='leave.approvedComments'/></textarea>
				</div>
				</div>
				<!-- END leave.approvedComments -->
			</fieldset>
			<input type="hidden" id="statusSave" name="statusSave" value="<s:property value="statusSave"/>">
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelStatus" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
<%-- 						<s:if test="statusSave==false"> --%>
							<button id="saveStatus" class="btn btn-primary" type="submit">
								<i class="fa fa-save"></i>
								<s:text name="label.button.save"></s:text>
							</button>
<%-- 						</s:if> --%>
					</div>
				</div>
			</div>
			
			</form>
		</div>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {
		$("input[data='number']").autoNumeric('init',{aDec:'.',aSep:'',mDec:'2'});
		$('#leave\\.returnDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false
		});
		if($("#statusSave").val()==='true'){
			$("#leave\\.status").prop('disabled',true);
			$("#leave\\.daysApproved").prop('readonly','readonly');
		}
		$("#cancelStatus").on('click', function () {                    
			$("#status_container").dialog("close");			
			return false;        
		});
				
		$("#saveStatus").on('click', function () { 
			$("#leave\\.status").prop('disabled',false);
			$('#leave_status_form').submit();
			return false;        
		});
		$("#leave_status_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#status_container").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
					if(!errors){
						jQuery("#leave_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
						$("#status_container").dialog("close");								
					}else{
						$.smallBox({
							title : "<s:text name="small.box.on.save.title.failed"/>",
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}					
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});
		$('#leave\\.status').val('<s:property value="leave.status.DOMVALUE"/>');
		$("#leave\\.id").val($("#statusId").val());	
		   
	});            
</script>