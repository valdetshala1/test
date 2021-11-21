<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="private_request_control_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="private_request_control_form" class="form-horizontal" action="PrivateRequestControlSave.do" accept-charset="utf8" method="post">
				<input id="privateRequest.id" name="privateRequest.id" value="<s:property value='privateRequest.id'/>" type="hidden">
				<input id="approved" name="approved" value="<s:property value='approved.getDOMVALUE()'/>" type="hidden">
				<input id="rejected" name="rejected" value="<s:property value='rejected.getDOMVALUE()'/>" type="hidden">
				<input id="activityStatus.status" name="activityStatus.status" value="<s:property value='activityStatus.status'/>" type="hidden">
				
				<!-- START privateRequest.comment -->
				<s:if test="fieldErrors.get('activityStatus.remarks')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="annual.plan.remarks"/>:</label>
							<div class="col-md-10">
								<textarea id="activityStatus.remarks" name="activityStatus.remarks" class="form-control" placeholder="<s:text name="annual.plan.remarks"/>"> </textarea>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('activityStatus.remarks')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="annual.plan.remarks"/>:</label>
						<div class="col-md-10">
								<textarea id="activityStatus.remarks" name="activityStatus.remarks" class="form-control" placeholder="<s:text name="annual.plan.remarks"/>"><s:property value="activityStatus.remarks"/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END privateRequest.comment -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="rejectedRequest" class="btn btn-danger" type="submit">
							<s:text name="tender.request.button.rejected"/>
						</button>				
						<s:if test="!rejectReqPopup">
						<button id="approvedRequest" class="btn btn-default" type="button">
							<s:text name="tender.request.button.approved"/>
						</button>
						</s:if>
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
		$("#rejectedRequest").on('click', function () {
			$(':button').prop('disabled','disabled'); 
			var r=$("#rejected").val();
			$("#activityStatus\\.status").val(r);
			$('#private_request_control_form').submit();

			return false;        
		});

		$("#approvedRequest").on('click', function () { 
			$(':button').prop('disabled','disabled');
			var a=$("#approved").val();
			$("#activityStatus\\.status").val(a);
			$('#private_request_control_form').submit();
			   
			return false;        
		});

		$("#private_request_control_form").submit(function() {
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
					$("#private_request_control_form_content").html(jqXHR.responseText);
					jQuery("#private_request_grid").trigger("reloadGrid");
					var link ="PrivateRequest.form.do?annualplanId="+$("#apId").val()+"&privateRequestId="+$("#privateRequest\\.id").val();
 					loadURL(link, $("#private_request_form_content"));
 					loadURL("PrivateRequestImpl.marking.do?privateRequestId="+$("#privateRequest\\.id").val(), $("#private_request_impl_form_content"));
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
						$("#private_request_control_form_content").dialog("close");
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
 					$(':button').prop('disabled',false);
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});

	});            
</script>