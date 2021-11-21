<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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

		<form id="costs_form" class="form-horizontal" action="FinOutputCostsSave.do" accept-charset="utf8" method="post">
			
			<fieldset>
				<legend><s:text name="finance.costs.legend.costs"/></legend>
				<input id="financialOutput.id" name="financialOutput.id" value="<s:property value='financialOutput.id'/>" type="hidden">	
				<input id="financialOutput.outputType" name="financialOutput.outputType" value="<s:property value='costs.getDOMVALUE()'/>" type="hidden">	
				<!-- START financialOutput.uopNumber -->
				<s:if test="fieldErrors.get('financialOutput.uopNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.uop.number"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="financialOutput.uopNumber" name="financialOutput.uopNumber" class="form-control" placeholder="<s:text name="output.salary.label.uop.number"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.uopNumber')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.uop.number"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="financialOutput.uopNumber" name="financialOutput.uopNumber" value="<s:property value='financialOutput.uopNumber'/>" class="form-control" placeholder="<s:text name="output.salary.label.uop.number"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.uopNumber  -->
				
				<!-- START financialOutput.freeBalance -->
				<s:if test="fieldErrors.get('financialOutput.freeBalance')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.free.balance"/></label>
						<div class="col-md-10">
							<input data="number" id="financialOutput.freeBalance" name="financialOutput.freeBalance" class="form-control" placeholder="<s:text name="output.salary.label.free.balance"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.freeBalance')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.free.balance"/></label>
						<div class="col-md-10">
							<input data="number" id="financialOutput.freeBalance" name="financialOutput.freeBalance" value="<s:property value='financialOutput.freeBalance'/>" class="form-control" placeholder="<s:text name="output.salary.label.free.balance"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.freeBalance -->
				
				<!-- START financialOutput.dateOfCommitment -->
				<s:if test="fieldErrors.get('financialOutput.dateOfCommitment')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.date.of.commitment"/></label>
						<div class="col-md-10">
							<input id="financialOutput.dateOfCommitment" name="financialOutput.dateOfCommitment" class="form-control" placeholder="<s:text name="output.salary.label.date.of.commitment"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.dateOfCommitment')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.date.of.commitment"/></label>
						<div class="col-md-10">
							<input id="financialOutput.dateOfCommitment" name="financialOutput.dateOfCommitment" value="<s:property value='financialOutput.dateOfCommitment'/>" class="form-control" placeholder="<s:text name="output.salary.label.date.of.commitment"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.dateOfCommitment -->
				
				<!-- START financialOutput.month-->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="output.salary.label.month"/></label>
					<div class="col-md-10">
						<select class="form-control" id="financialOutput.month" name="financialOutput.month" disabled="disabled">
								<s:iterator value="monthList" var="mst">
									<option value="<s:property value="#mst.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#mst.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#mst.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#mst.getDOMTEXT_EN()"/>
										</s:else>
									</option>
								</s:iterator>
						</select>
					</div>
				</div>
				<!-- END financialOutput.month-->				
				
				<!-- START financialOutput.financialType -->
				<s:if test="fieldErrors.get('financialOutput.financialType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.costs.label.expenditure.type"/></label>
							<div class="col-md-10">
								<input id="financialOutput.financialType.name" name="financialOutput.financialType.name" class="form-control" placeholder="<s:text name="finance.costs.label.expenditure.type"/>"/>
								<input id="financialOutput.financialType.id" name="financialOutput.financialType.id" type="hidden"/>
								<input id="financialOutput.financialType.code" name="financialOutput.financialType.code" type="hidden"/>
								<input id="financialOutput.financialType.nameAl" name="financialOutput.financialType.nameAl" type="hidden" value="<s:property value='financialOutput.financialType.nameAl'/>">								
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('financialOutput.financialType')"/></span>
								<s:property value='financialOutput.financialType.id'/>:<s:property value='financialOutput.financialType.nameAl'/>
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.costs.label.expenditure.type"/></label>
						<div class="col-md-10">
							<input id="financialOutput.financialType.name" name="financialOutput.financialType.name" class="form-control" value="<s:property value='financialOutput.financialType.nameAl'/>" placeholder="<s:text name="finance.costs.label.expenditure.type"/>"/>
							<input id="financialOutput.financialType.id" name="financialOutput.financialType.id" value="<s:property value='financialOutput.financialType.id'/>" type="hidden"/>
							<input id="financialOutput.financialType.code" name="financialOutput.financialType.code" value="<s:property value='financialOutput.financialType.code'/>" type="hidden"/>
							<input id="financialOutput.financialType.nameAl" name="financialOutput.financialType.nameAl" type="hidden" value="<s:property value='financialOutput.financialType.nameAl'/>">
						</div>
					</div>
				</s:else>
				<!-- END financialOutput.financialType -->

				<!-- START financialOutput.economicCode -->
				<s:if test="fieldErrors.get('financialOutput.economicCode')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.economic.code"/></label>
						<div class="col-md-10">
							<input maxlength="100" id="financialOutput.economicCode" name="financialOutput.economicCode" class="form-control" placeholder="<s:text name="output.salary.label.economic.code"/>" type="text" readonly="readonly">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.economicCode')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.economic.code"/></label>
						<div class="col-md-10">
							<input maxlength="100" id="financialOutput.economicCode" name="financialOutput.economicCode" value="<s:property value='financialOutput.economicCode'/>" class="form-control" placeholder="<s:text name="output.salary.label.economic.code"/>" type="text" readonly="readonly">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.economicCode -->
				
				<!-- START financialOutput.descriptionOfEconomicCode -->
				<s:if test="fieldErrors.get('financialOutput.descriptionOfEconomicCode')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="output.salary.label.description.of.economic.code"/></label>
						<div class="col-md-10">
							<input id="financialOutput.descriptionOfEconomicCode" name="financialOutput.descriptionOfEconomicCode" class="form-control" placeholder="<s:text name="output.salary.label.description.of.economic.code"/>" type="text" readonly="readonly">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.descriptionOfEconomicCode')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="output.salary.label.description.of.economic.code"/></label>
						<div class="col-md-10">
							<input id="financialOutput.descriptionOfEconomicCode" name="financialOutput.descriptionOfEconomicCode" value="<s:property value='financialOutput.descriptionOfEconomicCode'/>" class="form-control" placeholder="<s:text name="output.salary.label.description.of.economic.code"/>" type="text" readonly="readonly">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.descriptionOfEconomicCode -->
				
				<!-- START financialOutput.organisation -->
				<s:if test="fieldErrors.get('financialOutput.organisation.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="asset.legend.department"/></label>
						<div class="col-md-10">
							<input id="financialOutput.organisation.orgaName" name="financialOutput.organisation.orgaName" class="form-control" placeholder="<s:text name="asset.legend.department"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.organisation.id')"/> </span>
							<input id="financialOutput.organisation.id" name="financialOutput.organisation.id" value="<s:property value='financialOutput.organisation.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="asset.legend.department"/></label>
						<div class="col-md-10">
						<input id="financialOutput.organisation.orgaName" name="financialOutput.organisation.orgaName" value="<s:property value='financialOutput.organisation.orgaName'/>" class="form-control" placeholder="<s:text name="asset.legend.department"/>" type="text">
						<input id="financialOutput.organisation.id" name="financialOutput.organisation.id" value="<s:property value='financialOutput.organisation.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END financialOutput.organisation -->
				
				<!-- START financialOutput.valueInEuro-->
				<s:if test="fieldErrors.get('financialOutput.valueInEuro')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.value.in.euro"/></label>
						<div class="col-md-10">
							<input data="numberDec" id="financialOutput.valueInEuro" name="financialOutput.valueInEuro" class="form-control" placeholder="<s:text name="output.salary.label.value.in.euro"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.valueInEuro')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.value.in.euro"/></label>
						<div class="col-md-10">
							<input data="numberDec" id="financialOutput.valueInEuro" name="financialOutput.valueInEuro" value="<s:property value='financialOutput.valueInEuro'/>" class="form-control" placeholder="<s:text name="output.salary.label.value.in.euro"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.valueInEuro-->
				
				<!-- START financialOutput.descriptionCpo-->
				<s:if test="fieldErrors.get('financialOutput.descriptionCpo')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="output.salary.label.description.cpo"/></label>
						<div class="col-md-10">
							<input id="financialOutput.descriptionCpo" name="financialOutput.descriptionCpo" class="form-control" placeholder="<s:text name="output.salary.label.description.cpo"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.descriptionCpo')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="output.salary.label.description.cpo"/></label>
						<div class="col-md-10">
							<input id="financialOutput.descriptionCpo" name="financialOutput.descriptionCpo" value="<s:property value='financialOutput.descriptionCpo'/>" class="form-control" placeholder="<s:text name="output.salary.label.description.cpo"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.descriptionCpo-->
				
				<!-- START financialOutput.invoiceNumber -->
				<s:if test="fieldErrors.get('financialOutput.souceFund')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.costs.label.source.found"/></label>
						<div class="col-md-10">
							<input data="number" id="financialOutput.souceFund" name="financialOutput.souceFund" class="form-control" placeholder="<s:text name="finance.costs.label.source.found"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.souceFund')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="finance.costs.label.source.found"/></label>
						<div class="col-md-10">
							<input data="number" id="financialOutput.souceFund" name="financialOutput.souceFund" value="<s:property value='financialOutput.souceFund'/>" class="form-control" placeholder="<s:text name="finance.costs.label.source.found"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.souceFund -->
				<!-- START financialOutput.beneficiary-->
				<s:if test="fieldErrors.get('financialOutput.beneficiary')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="output.salary.label.beneficiary"/></label>
						<div class="col-md-10">
							<input  maxlength="100" id="financialOutput.beneficiary" name="financialOutput.beneficiary" class="form-control" placeholder="<s:text name="output.salary.label.beneficiary"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.beneficiary')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="output.salary.label.beneficiary"/></label>
						<div class="col-md-10">
							<input  maxlength="100" id="financialOutput.beneficiary" name="financialOutput.beneficiary" value="<s:property value='financialOutput.beneficiary'/>" class="form-control" placeholder="<s:text name="output.salary.label.beneficiary"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.beneficiary-->
				<!-- START financialOutput.nrbCode -->
				<s:if test="fieldErrors.get('financialOutput.nrbCode')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.costs.label.nrb.code"/></label>
						<div class="col-md-10">
							<input  maxlength="100" id="financialOutput.nrbCode" name="financialOutput.nrbCode" class="form-control" placeholder="<s:text name="finance.costs.label.nrb.code"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.nrbCode')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="finance.costs.label.nrb.code"/></label>
						<div class="col-md-10">
							<input  maxlength="100" id="financialOutput.nrbCode" name="financialOutput.nrbCode" value="<s:property value='financialOutput.nrbCode'/>" class="form-control" placeholder="<s:text name="finance.costs.label.nrb.code"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.nrbCode -->
				<!-- START financialOutput.invoiceNumber -->
				<s:if test="fieldErrors.get('financialOutput.invoiceNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.costs.label.invoice.number"/></label>
						<div class="col-md-10">
							<input  maxlength="100" id="financialOutput.invoiceNumber" name="financialOutput.invoiceNumber" class="form-control" placeholder="<s:text name="finance.costs.label.invoice.number"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.invoiceNumber')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="finance.costs.label.invoice.number"/></label>
						<div class="col-md-10">
							<input  maxlength="100" id="financialOutput.invoiceNumber" name="financialOutput.invoiceNumber" value="<s:property value='financialOutput.invoiceNumber'/>" class="form-control" placeholder="<s:text name="finance.costs.label.invoice.number"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.invoiceNumber -->
			</fieldset>
			
			<s:if test="financialOutput.id != null">
			<fieldset id="payment">
				<legend><s:text name="output.salary.label.payment.date"/></legend>
			
				<!-- START financialOutput.paymentDate-->
				<s:if test="fieldErrors.get('financialOutput.paymentDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.payment.date"/></label>
						<div class="col-md-10">
							<input id="financialOutput.paymentDate" name="financialOutput.paymentDate" class="form-control" placeholder="<s:text name="output.salary.label.payment.date"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialOutput.paymentDate')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.payment.date"/></label>
						<div class="col-md-10">
							<input id="financialOutput.paymentDate" name="financialOutput.paymentDate" value="<s:property value='financialOutput.paymentDate'/>" class="form-control" placeholder="<s:text name="output.salary.label.payment.date"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END financialOutput.paymentDate-->
			</fieldset>
			</s:if>
			
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

	function formatResult(item){
		return item.name + " (" + item.code + ")";
	}

	$(document).ready(function () {
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
		$("input[data='numberDec']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$("#financialOutput\\.month").val('<s:property value="financialOutput.month.DOMVALUE"/>');
		
		$('#financialOutput\\.dateOfCommitment').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		
		$('#financialOutput\\.paymentDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});

		$("#financialOutput\\.financialType\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.financialType.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        if(term == "") term = "";   
			        return {
			        	name_startsWith: term,
			        	type:"OU"
			        };
		        },
		        results: function (data, page) { 
		        	return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
		    formatResult: function(item) {
			    var label = item.name + " (<span style='color:orange;'>" + item.code + "</span>)";
			    return label;
		    },
	        formatSelection: function(item) {
		        console.log(item);
	        	$("#financialOutput\\.financialType\\.id").val(item.id);
	        	$("#financialOutput\\.financialType\\.name").val(item.name);
	        	$("#financialOutput\\.financialType\\.code").val(item.code);
	        	$("#financialOutput\\.financialType\\.nameAl").val(item.name);
	        	$("#financialOutput\\.economicCode").val(item.code);
	        	$("#financialOutput\\.descriptionOfEconomicCode").val(item.name);
	        	var label = item.name;
	        	if(item.name){
	        		label = item.name + " (" + item.code + ")";
	        	}
	            return label;
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });  

     	$("#financialOutput\\.financialType\\.name").select2("data", {
         	id: "<s:property value='financialOutput.financialType.id'/>", 
         	name: "<s:property value='financialOutput.financialType.nameAl'/>", 
         	code: "<s:property value='financialOutput.financialType.code'/>"});

   	
    
		$("#cancel").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "FinOutput.costsform.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#costs_form_content").html(jqXHR.responseText);
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

		$("#financialOutput\\.organisation\\.orgaName").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.organisation.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        if(term == "") term = "";   
			        return {
			        	name_startsWith: term,
			        	type:"OU"
			        };
		        },
		        results: function (data, page) { 
		        	return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
		    formatResult: function(item) {
			    var label = item.name + " (<span style='color:orange;'>" + item.code + "</span>)";
			    return label;
		    },
	        formatSelection: function(item) {
	        	
	        	$("#financialOutput\\.organisation\\.id" ).val(item.id);
	        	$("#financialOutput\\.organisation\\.orgaName").val(item.name);
	        	
	        	var label = item.name;
	            return label;
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });  

     	$("#financialOutput\\.organisation\\.orgaName").select2("data", {id: "<s:property value='financialOutput.organisation.id'/>", name: "<s:property value='financialOutput.organisation.orgaName'/>"});

   		/*
		$("#financialOutput\\.organisation\\.orgaName").autocomplete({
	        source: function(request, response) {
	            $.ajax({
	            	type:"get",
	                url: "Input.organisation.do",
	                dataType: "json",
	                data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						name_startsWith: request.term
					},
					success: function( data ) {
						response( $.map( data, function(item ) {
							return {
								label: item.name,
	                            value: item.name,
	                            id: item.id
							};
						}));
					},
	                maxRows: 100,
	        		minLength: 0   
	            });
	        },
	        select: function(event, ui) {
	        	 $("#financialOutput\\.organisation\\.id" ).val( ui.item.id);
	        }  
	    });	
	    */

		Ladda.bind('#save');
		$("#save").on('click', function() {
			$("#costs_form :button").prop('disabled','disabled');
			$('#costs_form').submit();
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
					$("#costs_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#costs_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exist");
					if (!errors_exits) {
	 					jQuery("#costs_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
					} else {
						//$("#farmer_expander").html(jqXHR.responseText);
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
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});		
			$("#costs_form :button").prop('disabled',false);
		})();
	});            
</script>