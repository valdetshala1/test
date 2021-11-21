<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>

<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="paymentperiod_form" class="form-horizontal" action="PaymentSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="finance.payment.period.legend"/></legend>
				<input id="payment.id" name="payment.id" value="<s:property value='payment.id'/>" type="hidden">
				<input id="payment.contract.id" name="payment.contract.id" value="<s:property value='payment.contract.id'/>" type="hidden">
				<input id="doc.docType" name="doc.docType" value="<s:property value='doc.docType'/>" type="hidden">
				<input id="doc.docName" name="doc.docName" value="<s:property value='doc.docName'/>" type="hidden">
				<input id="payment.paymentBalance" name="payment.paymentBalance" value="<s:property value='payment.paymentBalance'/>" type="hidden">
				
				<!-- START payment.startDate -->
				<s:if test="fieldErrors.get('payment.startDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.payment.start.date"/>:</label>
							<div class="col-md-10">
								<input id="payment.startDate" name="payment.startDate" class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payment.startDate')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.payment.start.date"/>:</label>
						<div class="col-md-10">
						<input id="payment.startDate" name="payment.startDate" class="form-control" value="<s:property value='payment.startDate'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END payment.startDate -->
				
				<!-- START payment.completionDate -->
				<s:if test="fieldErrors.get('payment.completionDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.payment.completion.date"/>:</label>
							<div class="col-md-10">
								<input id="payment.completionDate" name="payment.completionDate" class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payment.completionDate')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.payment.completion.date"/>:</label>
						<div class="col-md-10">
						<input id="payment.completionDate" name="payment.completionDate" class="form-control" value="<s:property value='payment.completionDate'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END payment.completionDate -->
				
				<!-- START payment.paymentPeriod -->
				<s:if test="fieldErrors.get('payment.paymentPeriod')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.payment.period"/>:</label>
							<div class="col-md-10">
								<input id="payment.paymentPeriod" name="payment.paymentPeriod" type="text" class="form-control" placeholder="<s:text name="finance.payment.period"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payment.paymentPeriod')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.payment.period"/>:</label>
						<div class="col-md-10">
							<input id="payment.paymentPeriod" name="payment.paymentPeriod" type="text" class="form-control" value="<s:property value='payment.paymentPeriod'/>" placeholder="<s:text name="finance.payment.period"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END payment.paymentPeriod -->
				
				<!-- START payment.paymentRealized -->
				<s:if test="fieldErrors.get('payment.paymentRealized')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.payment.realized"/>:</label>
							<div class="col-md-10">
								<input id="payment.paymentRealized" name="payment.paymentRealized" type="checkbox"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payment.paymentRealized')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.payment.realized"/>:</label>
						<div class="col-md-10">
							<input id="payment.paymentRealized" name="payment.paymentRealized" value="<s:property value='payment.paymentRealized'/>" type="checkbox"/>
						</div>
					</div>
				</s:else>
				<!-- END payment.paymentRealized -->
				
				<!-- START contract.attachment -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="finance.contract.attachment"/>:</label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default btn-file" id="file" name="file" onchange="getFileData(this);">
					</div>
				</div>
				<!-- END contract.attachment -->
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelPP" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="savePP" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
    $("#doc\\.docName").val(filename);
    $("#doc\\.docType").val('.'+fileExt);
}
	$(document).ready(function () {
		$("#payment\\.paymentPeriod").autoNumeric('init',{aDec: '.', aSep: ',', mDec: '2'});
		$('#payment\\.startDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#payment\\.completionDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
			sideBySide: false,
		});
		
		$("#cancelPP").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "Payment.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#paymentperiod_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;        
		});
		Ladda.bind('#savePP');
		$("#savePP").on('click', function() {
			$("#paymentperiod_form :button").prop('disabled','disabled');
			$('#paymentperiod_form').submit();
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
					$("#paymentperiod_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#paymentperiod_form_content").html(jqXHR.responseText);
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
						$("#paymentperiod_grid").trigger("reloadGrid");
						$("#contract_grid").trigger("reloadGrid");
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
			$("#contract_form :button").prop('disabled',false);				
		})();
		
		$('#payment\\.paymentRealized').on('change',function(event){
			$('#payment\\.paymentRealized').val( $('#payment\\.paymentRealized')[0].checked ? "true" : "false" );
		});
		
		$('#payment\\.paymentRealized').val('<s:property value="payment.paymentRealized"/>');
		if($('#payment\\.paymentRealized').val()=='true'){
			$('#payment\\.paymentRealized').prop('checked', true);
		};

		
		$("#payment\\.contract\\.id").val($("#contractId").val());	    	
	});            
</script>