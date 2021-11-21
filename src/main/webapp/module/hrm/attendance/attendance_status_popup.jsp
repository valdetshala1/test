<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div id="attendance_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="attendance_status_form" action="AttendanceRecordSave.do" accept-charset="utf8" method="post">
				 <input type="hidden" id="toChangeStatus" name="toChangeStatus" value="<s:property value="toChangeStatus"/>"/>
					<fieldset>
						<input name="authenticity_token" type="hidden">
						<!-- Start statusEdit select-->
						<div class="form-group">
							<label><s:text name="annu.appprivate.label.status"/></label>
							<select class="form-control" id="statusEdit" name="statusEdit">
								<s:iterator value="attendancestatusList" var="at">
									<option value="<s:property value="#at.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#at.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#at.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#at.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>					
							</select>		
						</div>
						<!-- END statusEdit select -->
						<div class="form-group">
						<label><s:text name="hum.employee.label.notes"/></label>
							<textarea id="statusNote" name="statusNote" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='statusNote'/></textarea>
						</div>
					</fieldset>
					<div class="form-actions">
						<div class="row">
							<div class="col-md-12">
								<button id="cancelStatus" class="btn btn-default" type="button">
									<s:text name="label.button.cancel"></s:text>
								</button>
								<button id="saveStatus" class="btn btn-primary" type="submit">
									<s:text name='label.button.save'/>
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
	
	$(document).ready(function () {
		
		$("#cancelStatus").on('click', function () { 
			$("#attendanceStatusPopup").dialog("close");               
			return false;        
		});

		$("#saveStatus").on('click', function () { 
			$('#attendance_status_form').submit();
			return false;        
		});

	$("#attendance_status_form").submit(function() {
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
					jQuery("#attendance_grid").trigger("reloadGrid");
					var errors = jqXHR.getResponseHeader("errors_exist");
 					if(!errors){
						$.smallBox({
							title : "<s:text name="small.box.on.save.title.success"/>", 
							content : "<s:text name="small.box.content"/>", 
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
						$("#attendanceStatusPopup").dialog("close");
						
 	 				}else{
						$.smallBox({
							title : "<s:text name="small.box.on.save.title.failed"/>", 
							content : "<s:text name="small.box.content"/>", 
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

	});            
</script>