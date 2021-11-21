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
		<div id="changeLeaveStatus" title="Change status">

			<form id="officialtravel_status_form" class="form-horizontal" action="OfficialTravelStatusSave.do" accept-charset="utf8" method="post">
				 <input type="hidden" id="changeStatus" name="changeStatus" value="true"/>
				 <input type="hidden" id="officialTravel.id" name="officialTravel.id" value="<s:property value="userTravelId"/>"/>
					<fieldset>
					<input name="authenticity_token" type="hidden">
<!-- 				START officialTravel.status -->
					<div class="form-group">
						<label>*<s:text name="official.travel.status"/></label>
							<select class="form-control" id="officialTravel.status" name="officialTravel.status">
								<s:iterator value="travelStatusList" var="ts">
									<option value="<s:property value="#ts.getDOMVALUE()" />"><s:property value="#ts.getDOMTEXT_EN()" /></option>
								</s:iterator>						
							</select>
					</div>
<!-- 				END officialTravel.status -->
					<s:if test="fieldErrors.get('officialTravel.daysApproved.to.large')!=null">
						<div class="form-group has-error">
							<div class="col-md-10">
								<label>*<s:text name="official.travel.status.days.approved"/></label>
								<input id="officialTravel.daysApproved" name="officialTravel.daysApproved" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('officialTravel.daysApproved.to.large')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:elseif test="fieldErrors.get('officialTravel.daysApproved')!=null">
						<div class="form-group has-error">
							<div class="col-md-10">
								<label>*<s:text name="official.travel.status.days.approved"/></label>
								<input data='number' id="officialTravel.daysApproved" name="officialTravel.daysApproved" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('officialTravel.daysApproved')"/> </span>
							</div>					
						</div>
					</s:elseif>
					<s:else>
						<div class="form-group">
							<label>*<s:text name="official.travel.status.days.approved"/></label>
							<input data='number' id="officialTravel.daysApproved" name="officialTravel.daysApproved" value="<s:property value='officialTravel.daysApproved'/>" class="form-control" placeholder="<s:text name="official.travel.status.days.approved"/>" type="text">
						</div>
					</s:else>
<!-- 				END officialTravel.daysApproved -->
<!-- 				START officialTravel.returnDate -->
					<div class="form-group">
						<label><s:text name="official.travel.status.return.date"/></label>
							<input id="officialTravel.returnDate" name="officialTravel.returnDate" value="<s:property value='officialTravel.returnDate'/>" class="form-control" placeholder="<s:text name="official.travel.status.return.date"/>" type="text">
					</div>
<!-- 				END officialTravel.returnDate -->
<!-- 				START officialTravel.returnDate -->
					<s:if test="fieldErrors.get('officialTravel.daysSpent')!=null">
						<div class="form-group has-error">
							<div class="col-md-10">
								<label><s:text name="official.travel.status.days.spent"/></label>
								<input id="officialTravel.daysSpent" name="officialTravel.daysSpent" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('officialTravel.daysSpent')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
								<label><s:text name="official.travel.status.days.spent"/></label>
								<input id="officialTravel.daysSpent" name="officialTravel.daysSpent" value="<s:property value='officialTravel.daysSpent'/>" class="form-control" placeholder="<s:text name="official.travel.status.days.spent"/>" type="text">
						</div>
					</s:else>
<!-- 				END officialTravel.returnDate -->
<!-- 				START officialTravel.approvedComments -->
					<div class="form-group">
					      <label><s:text name="official.travel.status.comments"/></label>
					      <textarea id="officialTravel.approvedComments" name="officialTravel.approvedComments" class="form-control" placeholder="<s:text name="official.travel.status.comments"/>"><s:property value='officialTravel.approvedComments' /></textarea>
				     </div>
<!-- 				END officialTravel.approvedComments -->
				</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelStatus" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveStatus" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
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
		$('#officialTravel\\.returnDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$("#cancelStatus").on('click', function () {                    
			$("#status_container").dialog("close");			
			return false;        
		});
				
		$("#saveStatus").on('click', function () { 
			$('#officialtravel_status_form').submit();
			return false;        
		});
		$("#officialtravel_status_form").submit(function() {
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
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						jQuery("#officialtravel_grid").trigger("reloadGrid");
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
							title : '<s:text name="small.box.on.save.title.failed"/>',
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
		$('#officialTravel\\.status').val('<s:property value="officialTravel.status.DOMVALUE"/>');
		$("#officialTravel\\.id").val($("#userTravelId").val());	
	});            
</script>