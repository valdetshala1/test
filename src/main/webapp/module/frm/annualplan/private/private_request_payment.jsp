<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="private_request_payment_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="private_request_payment_form" class="form-horizontal" action="PrivateRequestPaymentSave.do" accept-charset="utf8" method="post">
				<input id="privateRequest.id" name="privateRequest.id" value="<s:property value='privateRequest.id'/>" type="hidden">
				
				<!-- START privateRequest.paymentValue -->
				<s:if test="fieldErrors.get('privateRequest.paymentValue')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="ann.plan.person.street.payment.value"/>:</label>
							<div class="col-md-10">
								<input  id="privateRequest.paymentValue" name="privateRequest.paymentValue"  class="form-control" data="number" placeholder="<s:text name="ann.plan.person.street.payment.value"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('privateRequest.paymentValue')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="ann.plan.person.street.payment.value"/>:</label>
						<div class="col-md-10">
								<input  id="privateRequest.paymentValue" name="privateRequest.paymentValue"  class="form-control" data="number" placeholder="<s:text name="ann.plan.person.street.payment.value"/>" value="<s:property value="privateRequest.paymentValue"/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END privateRequest.paymentValue-->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelPayment" class="btn btn-defoult" type="button">
							<s:text name="label.button.cancel"/>
						</button>
						<button id="savePayment" class="btn btn-primary" type="submit">
							<s:text name="label.button.save"/>
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
		$("input[data='number']").autoNumeric('init', {
			aDec : '.',
			aSep : ',',
			mDec : '2'
		});
		
		$("#savePayment").on('click', function() {
			$(':button').prop('disabled','disabled');
			$('#private_request_payment_form').submit();
			jQuery("#private_request_grid").trigger("reloadGrid");
			return false;
		});

		$("#cancelPayment").on('click', function() {
			$("#private_request_payment_form_content").dialog("close");  
			return false;
		});
		

		$("#private_request_payment_form").submit(function() {
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
					$("#private_request_payment_form_content").html(jqXHR.responseText);
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