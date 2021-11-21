<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
<style type="text/css">
input[readonly] {
    background-color: #fff;
    /* any other styles */
}
</style>
</head>
<body>
<!-- widget div-->
<div id="order_form_content">

	<jsp:include page="../../base/validation.jsp"></jsp:include>

	<!-- widget content -->
	<div class="widget-body">

		<form id="order_form" class="form-horizontal" action="POrderSave.do" accept-charset="utf8" method="post">
		
        <input type="hidden" name="order.id" id="order.id" value="<s:property value='order.id'/>">
        <input type="hidden" name="order.purchaseOrderStatus.id" id="order.purchaseOrderStatus.id" value="<s:property value='order.purchaseOrderStatus.id'/>">
        <input type="hidden" name="order.purchaseOrderStatus.statusCode" id="order.purchaseOrderStatus.statusCode" value="<s:property value='order.purchaseOrderStatus.statusCode'/>">
        <input type="hidden" name="order.created" id="order.created" value="<s:date name="order.created" format="dd.MM.YYY"/>">
        <input type="hidden" name="order.personByCreatedby.id" id="order.personByCreatedby" value="<s:property value='order.personByCreatedby.id'/>">
        
        <input type="hidden" id="dpMngmt_id" name="dpMngmt_id"  value="<s:property value='order.dpMngmt.id'/>"/>
        <input type="hidden" id="documentno" name="documentno"  value="<s:property value='order.dpMngmt.documentno'/>"/>
        <input type="hidden" id="order.requisition.dpMngmt.docSubject" name="order.requisition.dpMngmt.docSubject"  value="<s:property value='order.requisition.dpMngmt.docSubject'/>"/>
        <input id="order.statusCode" name="order.statusCode" value="<s:property value="order.statusCode"/>" type="hidden">
        <input type="hidden" id="isBPartner" name="isBPartner"  value="<s:property value='order.isBpartner'/>"/>
        
        <fieldset><!-- disabled="disabled" -->
		<legend><s:text name="purchase.order.menu"/> </legend>
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.requisition.id')!=null">
					<div class="has-error">
						<label class="col-md-2 control-label"><s:text name="requisition.menu"/></label>
						<div class="col-md-4">
							<input id="reqdoc" name="reqdoc" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.requisition.id')"/> </span>
							<input id="order.requisition.id" name="order.requisition.id" type="hidden">
							<input class="form-control" type="hidden" name="order.requisition.requisitionNr" id="order.requisition.requisitionNr" value="<s:property value='order.requisition.requisitionNr'/>">
						</div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="requisition.menu"/></label>
		          <div class="col-md-4">
		           <input class="form-control" type="text" name="reqdoc" id="reqdoc">
		           <input class="form-control" type="hidden" name="order.requisition.id" id="order.requisition.id" value="<s:property value='order.requisition.id'/>">
		           <input class="form-control" type="hidden" name="order.requisition.requisitionNr" id="order.requisition.requisitionNr" value="<s:property value='order.requisition.requisitionNr'/>">
		          </div>
			  	</s:else>
			  	 <label class="control-label col-sm-2"><s:text name="order.po.no"/></label>
		          <div class="col-md-4">
		           <input class="form-control uneditable-input" readonly="readonly" type="text" name="order.poNumber" id="order.poNumber" value="<s:property value='order.poNumber'/>">
		          </div>	          
	      	</div>
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.dateordered')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2">*<s:text name="order.date.ordered"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" name="order.dateordered" id="order.dateordered">
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.dateordered')"/> </span>
			        </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2">*<s:text name="order.date.ordered"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="order.dateordered" id="order.dateordered" value="<s:property value='order.dateordered'/>">
		          </div>
			    </s:else>
	          <label class="control-label col-sm-2"><s:text name="order.date.promised"/></label>
	          <div class="col-md-4">
				<input class="form-control" type="text" name="order.datepromised" id="order.datepromised" value="<s:property value='order.datepromised'/>">
	          </div>
	      	</div>
	      	<div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="order.completion"/></label>
	          <div class="col-md-4">
				<input class="form-control" type="text" name="order.orderCompletation" id="order.orderCompletation" value="<s:property value='order.orderCompletation'/>">
	          </div>
	          <s:if test="fieldErrors.get('order.currency.id')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2">*<s:text name="requisition.currency"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" name="order.currency.isoCode" id="order.currency.isoCode">
			            <input class="form-control" type="hidden" name="order.currency.id" id="order.currency.id">
			            <input class="form-control" type="hidden" name=order.currency.description id="order.currency.description" value="<s:property value='order.currency.description'/>">
			            <input class="form-control" type="hidden" name=order.currency.cursymbol id="order.currency.cursymbol" value="<s:property value='order.currency.cursymbol'/>">
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.currency.id')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>	      	
		          <label class="control-label col-sm-2">*<s:text name="requisition.currency"/></label>
		          <div class="col-md-4">
			          <input class="form-control" type="text" name="order.currency.isoCode" id="order.currency.isoCode" value="<s:property value='order.currency.isoCode'/>">
			          <input class="form-control" type="hidden" name="order.currency.id" id="order.currency.id" value="<s:property value='order.currency.id'/>">
			          <input class="form-control" type="hidden" name=order.currency.description id="order.currency.description" value="<s:property value='order.currency.description'/>">
			          <input class="form-control" type="hidden" name=order.currency.cursymbol id="order.currency.cursymbol" value="<s:property value='order.currency.cursymbol'/>">	          
		          </div>
		          </s:else>
	      	</div> 
	      	
<!-- 	      	<div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="order.amount.tendered"/></label>
	          <div class="col-md-4">
				<input class="form-control" type="text" data="number" name="order.amounttendered" id="order.amounttendered" value="<s:property value='order.amounttendered'/>">
	          </div>
	          <label class="control-label col-sm-2"><s:text name="order.amount.refunded"/></label>
	          <div class="col-md-4">
				<input class="form-control" type="text" data="number" name="order.amountrefunded" id="order.amountrefunded" value="<s:property value='order.amountrefunded'/>">
	          </div>
	      	</div> 
-->	      	
	      	
	      	
<!-- 	      	<div class="form-group">
	      		<label class="control-label col-sm-2"><s:text name="order.total.lines"/></label>
	          <div class="col-md-4">
	          <input class="form-control uneditable-input" readonly="readonly" type="text" name="order.totallines" id="order.totallines" value="<s:property value='order.totallines'/>">
	          </div>
		          
		         <label class="control-label col-sm-2"><s:text name="order.promotion.code"/></label>
		         <div class="col-md-4">
			         <input class="form-control" maxlength="30" type="text" name="order.promotioncode" id="order.promotioncode" value="<s:property value='order.promotioncode'/>">
		         </div> 
	      	</div>
 -->	      
 	
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.orderOriginalAmount')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2">*<s:text name="order.original.amount"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" data="number" name="order.orderOriginalAmount" id="order.orderOriginalAmount" >
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.orderOriginalAmount')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2">*<s:text name="order.original.amount"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" data="number" name="order.orderOriginalAmount" id="order.orderOriginalAmount" value="<s:property value='order.orderOriginalAmount'/>">
		          </div>
		          </s:else>
		          <s:if test="fieldErrors.get('order.orderInitialAmount')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2">*<s:text name="order.initial.amount"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" data="number" name="order.orderInitialAmount" id="order.orderInitialAmount" >
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.orderInitialAmount')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2">*<s:text name="order.initial.amount"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" data="number" name="order.orderInitialAmount" id="order.orderInitialAmount" value="<s:property value='order.orderInitialAmount'/>">
		          </div>
		          </s:else>
	      	</div>
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.taxamount')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2"><s:text name="order.tax.amount"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" data="number" name="order.taxamount" id="order.taxamount" >
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.taxamount')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="order.tax.amount"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" data="number" name="order.taxamount" id="order.taxamount" value="<s:property value='order.taxamount'/>">
		          </div>
		          </s:else>
		          <s:if test="fieldErrors.get('order.freight')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2"><s:text name="order.freight"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" data="number" name="order.freight" id="order.freight" >
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.freight')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="order.freight"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" data="number" name="order.freight" id="order.freight" value="<s:property value='order.freight'/>">
		          </div>
		          </s:else>
	      	</div>
			<div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="order.grand.total"/></label>
	          <div class="col-md-4">
	          <input class="form-control uneditable-input" readonly="readonly" type="text" name="order.grandtotal" id="order.grandtotal" value="<s:property value='order.grandtotal'/>">
	          </div>
	          
	          
	      	</div>
<!-- 	      	<div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="order.is.delivered"/></label>
	          <div class="col-md-4">
					<label class="radio radio-inline">
						<s:if test='order.isdelivered == "Y"'>
						<input type="radio" class="radiobox" checked="checked" name="order.isdelivered" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if> 
						<s:else>
						<input type="radio" class="radiobox" name="order.isdelivered" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
					</label>
					<label class="radio radio-inline">
						<s:if test='order.isdelivered == "N"'>
						<input type="radio" class="radiobox" checked="checked" name="order.isdelivered" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
						</s:if> 
						<s:else>						
						<input type="radio" class="radiobox" name="order.isdelivered" value="N"><span><s:text name="rbac.permission.button.no"/></span>
						</s:else>
					</label>
	          </div>
	          <label class="control-label col-sm-2"><s:text name="order.is.invoiced"/></label>
	          <div class="col-md-4">
					<label class="radio radio-inline">
						<s:if test='order.isinvoiced == "Y"'>
						<input type="radio" class="radiobox" checked="checked" name="order.isinvoiced" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if> 
						<s:else>
						<input type="radio" class="radiobox" name="order.isinvoiced" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
					</label>
					<label class="radio radio-inline">
						<s:if test='order.isinvoiced == "N"'>
						<input type="radio" class="radiobox" checked="checked" name="order.isinvoiced" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
						</s:if> 
						<s:else>						
						<input type="radio" class="radiobox" name="order.isinvoiced" value="N"><span><s:text name="rbac.permission.button.no"/></span>
						</s:else>
					</label>
	          </div>	          
	      	</div>   
	      	<div class="form-group">
	          <label class="control-label col-sm-2">Is printed?</label>
	          <div class="col-md-4">
					<label class="radio radio-inline">
						<s:if test='order.isprinted == "Y"'>
						<input type="radio" class="radiobox" checked="checked" name="order.isprinted" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if> 
						<s:else>
						<input type="radio" class="radiobox" name="order.isprinted" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
					</label>
					<label class="radio radio-inline">
						<s:if test='order.isprinted == "N"'>
						<input type="radio" class="radiobox" checked="checked" name="order.isprinted" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
						</s:if> 
						<s:else>						
						<input type="radio" class="radiobox" name="order.isprinted" value="N"><span><s:text name="rbac.permission.button.no"/></span>
						</s:else>
					</label>
	          </div>
	          <label class="control-label col-sm-2"><s:text name="order.is.selected"/></label>
	          <div class="col-md-4">
					<label class="radio radio-inline">
						<s:if test='order.isselected == "Y"'>
						<input type="radio" class="radiobox" checked="checked" name="order.isselected" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if> 
						<s:else>
						<input type="radio" class="radiobox" name="order.isselected" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
					</label>
					<label class="radio radio-inline">
						<s:if test='order.isselected == "N"'>
						<input type="radio" class="radiobox" checked="checked" name="order.isselected" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
						</s:if> 
						<s:else>						
						<input type="radio" class="radiobox" name="order.isselected" value="N"><span><s:text name="rbac.permission.button.no"/></span>
						</s:else>
					</label>
	          </div>	          
	      	</div>
	      	
 -->
	      </fieldset>
	      
	      <fieldset>
			<legend><s:text name="asset.legend.department"/></legend>
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.deptContactName')!=null">
					<div class="has-error">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.contact.name"/></label>
						<div class="col-md-4">
							<input maxlength="100" id="order.deptContactName" name="order.deptContactName" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.deptContactName')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2">*<s:text name="hum.employee.label.contact.name"/></label>
		          <div class="col-md-4">
		           <input class="form-control" maxlength="100" type="text" name="order.deptContactName" id="order.deptContactName" value="<s:property value='order.deptContactName'/>">
		          </div>
			  	</s:else>
			  	
			  	<s:if test="fieldErrors.get('order.deptContactPhone')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2">*<s:text name="finance.contractor.label.contact.phone"/></label>
					<div class="col-md-4">
						<input class="form-control" maxlength="100" type="text" name="order.deptContactPhone" id="order.deptContactPhone">
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.deptContactPhone')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2">*<s:text name="finance.contractor.label.contact.phone"/></label>
		          <div class="col-md-4">
					<input class="form-control" maxlength="100" type="text" name="order.deptContactPhone" id="order.deptContactPhone" value="<s:property value='order.deptContactPhone'/>">
		          </div>
			    </s:else>
	      	</div>
	      	
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.deptContactEmail')!=null">
					<div class="has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.contractor.label.email"/></label>
						<div class="col-md-4">
							<input maxlength="100" id="order.deptContactEmail" name="order.deptContactEmail" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.deptContactEmail')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2">*<s:text name="finance.contractor.label.email"/></label>
		          <div class="col-md-4">
		           <input class="form-control" maxlength="100" type="text" name="order.deptContactEmail" id="order.deptContactEmail" value="<s:property value='order.deptContactEmail'/>">
		          </div>
			  	</s:else>
	      	</div>
	      </fieldset>
<!-- 	     <fieldset>
		<legend><s:text name="purchase.order.payment"/> </legend>
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.paymentTermsCode')!=null">
					<div class="has-error">
						<label class="col-md-2 control-label"><s:text name="order.payment.terms.code"/></label>
						<div class="col-md-4">
							<input maxlength="20" id="order.paymentTermsCode" name="order.paymentTermsCode" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.paymentTermsCode')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="order.payment.terms.code"/></label>
		          <div class="col-md-4">
		           <input class="form-control" maxlength="20" type="text" name="order.paymentTermsCode" id="order.paymentTermsCode" value="<s:property value='order.paymentTermsCode'/>">
		          </div>
			  	</s:else>
			  	
			  	<s:if test="fieldErrors.get('order.paymentTermsName')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2"><s:text name="order.payment.terms.name"/></label>
					<div class="col-md-4">
						<input class="form-control" maxlength="20" type="text" name="order.paymentTermsName" id="order.paymentTermsName">
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.paymentTermsName')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="order.payment.terms.name"/></label>
		          <div class="col-md-4">
					<input class="form-control" maxlength="20" type="text" name="order.paymentTermsName" id="order.paymentTermsName" value="<s:property value='order.paymentTermsName'/>">
		          </div>
			    </s:else>
	      	</div>
	      	
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.acquisitionTypeCode')!=null">
					<div class="has-error">
						<label class="col-md-2 control-label"><s:text name="order.acquisition.type.code"/></label>
						<div class="col-md-4">
							<input maxlength="20" id="order.acquisitionTypeCode" name="order.acquisitionTypeCode" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.acquisitionTypeCode')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="order.acquisition.type.code"/></label>
		          <div class="col-md-4">
		           <input class="form-control" maxlength="20" type="text" name="order.acquisitionTypeCode" id="order.acquisitionTypeCode" value="<s:property value='order.acquisitionTypeCode'/>">
		          </div>
			  	</s:else>
			  	<label class="control-label col-sm-2"><s:text name="order.payment.rule"/></label>
		          <div class="col-md-4">
					<input class="form-control" maxlength="60" type="text" name="order.paymentrule" id="order.paymentrule" value="<s:property value='order.paymentrule'/>">
		          </div>
	      	</div>
	      </fieldset>
	      <div class="form-group">
	      	  <label class="control-label col-sm-2"><s:text name="order.invoice.rule"/></label>
	          <div class="col-md-4">
				<input class="form-control" maxlength="60" type="text" name="order.invoicerule" id="order.invoicerule" value="<s:property value='order.invoicerule'/>">
	          </div>
	          
	          <label class="control-label col-sm-2"><s:text name="order.delivery.rule"/></label>
	          <div class="col-md-4">
				<input class="form-control" maxlength="60" type="text" name="order.deliveryrule" id="order.deliveryrule" value="<s:property value='order.deliveryrule'/>">
	          </div>
	      </div>
	      <div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="order.delivery.via.rule"/></label>
	          <div class="col-md-4">
				<input class="form-control" maxlength="60" type="text" name="order.deliveryviarule" id="order.deliveryviarule" value="<s:property value='order.deliveryviarule'/>">
	          </div>
	      </div>
	      <fieldset>
		<legend><s:text name="purchase.order.equipment"/> </legend>
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.equipmentApproverName')!=null">
					<div class="has-error">
						<label class="col-md-2 control-label">*<s:text name="order.equipment.approver.name"/></label>
						<div class="col-md-4">
							<input maxlength="100" id="order.equipmentApproverName" name="order.equipmentApproverName" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.equipmentApproverName')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2">*<s:text name="order.equipment.approver.name"/></label>
		          <div class="col-md-4">
		           <input maxlength="100" class="form-control" type="text" name="order.equipmentApproverName" id="order.equipmentApproverName" value="<s:property value='order.equipmentApproverName'/>">
		          </div>
			  	</s:else>
			  	
			  	<s:if test="fieldErrors.get('order.equipmentPrinted')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2">*<s:text name="order.equipment.printed"/></label>
					<div class="col-md-4">
						<label class="radio radio-inline">
						<s:if test='order.equipmentPrinted == "Y"'>
						<input type="radio" id="printed" class="radiobox" checked="checked" name="order.equipmentPrinted" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if> 
						<s:else>
						<input type="radio" id="printed" class="radiobox" name="order.equipmentPrinted" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
						</label>
						<label class="radio radio-inline">
							<s:if test='order.equipmentPrinted == "N"'>
							<input type="radio" id="notprinted" class="radiobox" checked="checked" name="order.equipmentPrinted" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
							</s:if> 
							<s:else>						
							<input type="radio" id="notprinted" class="radiobox" name="order.equipmentPrinted" value="N"><span><s:text name="rbac.permission.button.no"/></span>
							</s:else>
						</label>
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.equipmentPrinted')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
	          <label class="control-label col-sm-2">*<s:text name="order.equipment.printed"/></label>
	          <div class="col-md-4">
					<label class="radio radio-inline">
						<s:if test='order.equipmentPrinted == "Y"'>
						<input type="radio" id="printed" class="radiobox" checked="checked" name="order.equipmentPrinted" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if> 
						<s:else>
						<input type="radio" id="printed" class="radiobox" name="order.equipmentPrinted" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
					</label>
					<label class="radio radio-inline">
						<s:if test='order.equipmentPrinted == "N"'>
						<input type="radio" id="notprinted" class="radiobox" checked="checked" name="order.equipmentPrinted" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
						</s:if> 
						<s:else>						
						<input type="radio" id="notprinted" class="radiobox" name="order.equipmentPrinted" value="N"><span><s:text name="rbac.permission.button.no"/></span>
						</s:else>
					</label>
	          </div>
	          </s:else>
			  	
	      	</div>
	      	
	      	<div class="form-group" id="equipment_print_content">
	      		<s:if test="fieldErrors.get('order.equipmentPrintDate')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2"><s:text name="order.equipment.print.date"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" name="order.equipmentPrintDate" id="order.equipmentPrintDate">
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.equipmentPrintDate')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="order.equipment.print.date"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="order.equipmentPrintDate" id="order.equipmentPrintDate" value="<s:property value='order.equipmentPrintDate'/>">
		          </div>
			    </s:else>
	      	</div>
	      </fieldset>
 -->
	      <fieldset>
			<legend><s:text name="requisition.supplier"/></legend>
			
	      	<div class="form-group">
	      	 <s:if test="fieldErrors.get('order.isBpartner')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2">*<s:text name="requisition.business.partner"/></label>
					<div class="col-md-4">
						<label class="radio radio-inline">
						<s:if test='order.isBpartner == "Y"'>
						<input type="radio" id="yesBpartner" class="radiobox" checked="checked" name="order.isBpartner" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if> 
						<s:else>
						<input type="radio" id="yesBpartner" class="radiobox" name="order.isBpartner" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
						</label>
						<label class="radio radio-inline">
							<s:if test='order.isBpartner == "N"'>
							<input type="radio" id="noBpartner" class="radiobox" checked="checked" name="order.isBpartner" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
							</s:if> 
							<s:else>						
							<input type="radio" id="noBpartner" class="radiobox" name="order.isBpartner" value="N"><span><s:text name="rbac.permission.button.no"/></span>
							</s:else>
						</label>
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.isBpartner')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
	          <label class="control-label col-sm-2">*<s:text name="requisition.business.partner"/></label>
	          <div class="col-md-4">
					<label class="radio radio-inline">
						<s:if test='order.isBpartner == "Y"'>
						<input type="radio" id="yesBpartner" class="radiobox" checked="checked" name="order.isBpartner" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if> 
						<s:else>
						<input type="radio" id="yesBpartner" class="radiobox" name="order.isBpartner" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
					</label>
					<label class="radio radio-inline">
						<s:if test='order.isBpartner == "N"'>
						<input type="radio" id="noBpartner" class="radiobox" checked="checked" name="order.isBpartner" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
						</s:if> 
						<s:else>						
						<input type="radio" id="noBpartner" class="radiobox" name="order.isBpartner" value="N"><span><s:text name="rbac.permission.button.no"/></span>
						</s:else>
					</label>
	          </div>
	          </s:else>
	          <div id="bpartner_content">
	          <s:if test="fieldErrors.get('order.bpartner.id')!=null">
				<div class="has-error">
		      	  <label class="control-label col-sm-2">*<s:text name="business.partner"/></label>
		          <div class="col-md-4">
		           <input class="form-control" type="text" name="order.bpartner.name" id="order.bpartner.name"/>
		           <input class="form-control" type="hidden" name="order.bpartner.id" id="order.bpartner.id">
		         	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.bpartner.id')"/> </span>
		          </div>
	      		</div>
	      		</s:if>
	      		<s:else>
	      		<label class="control-label col-sm-2">*<s:text name="business.partner"/></label>
		          <div class="col-md-4">
		           <input class="form-control" type="text" name="order.bpartner.name" id="order.bpartner.name" value="<s:property value="order.bpartner.name"/>"/>
		           <input class="form-control" type="hidden" name="order.bpartner.id" id="order.bpartner.id" value="<s:property value='order.bpartner.id'/>">
		          </div>
	      		</s:else>	          
	      	</div> 
<!-- 	      	<div class="form-group" id="bpartner_content">
		      	  <label class="control-label col-sm-2">*<s:text name="business.partner"/></label>
		          <div class="col-md-4">
		           <input class="form-control" type="text" name="order.bpartner.name" id="order.bpartner.name" value="<s:property value="order.bpartner.name"/>"/>
		           <input class="form-control" type="hidden" name="order.bpartner.id" id="order.bpartner.id" value="<s:property value='order.bpartner.id'/>">
		          </div>
		          <label class="control-label col-sm-2"><s:text name="order.business.partner.location"/></label>
		          <div class="col-md-4">
		           <input class="form-control" type="text" name="order.bpartnerLocation.name" id="order.bpartnerLocation.name" value="<s:property value="order.bpartnerLocation.name"/>"/>
		           <input class="form-control" type="hidden" name="order.bpartnerLocation.id" id="order.bpartnerLocation.id" value="<s:property value='order.bpartnerLocation.id'/>">
		          </div> 

	      	</div>
-->	      	</div>
	      	<div id="supplier_content">
	      	<div class="form-group">
		      	<s:if test="fieldErrors.get('order.supplierName')!=null">
					<div class="has-error">
			          <label class="control-label col-sm-2">*<s:text name="requisition.supplier"/></label>
			          <div class="col-md-4">
						<input class="form-control" maxlength="100" type="text" name="order.supplierName" id="order.supplierName" >
			        	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.supplierName')"/> </span>
			          </div>
			     	</div> 
			     </s:if>
			     <s:else>
			     	<label class="control-label col-sm-2">*<s:text name="requisition.supplier"/></label>
			          <div class="col-md-4">
						<input class="form-control" maxlength="100" type="text" name="order.supplierName" id="order.supplierName" value="<s:property value='order.supplierName'/>">
			          </div>
			     </s:else>
			     
			     <s:if test="fieldErrors.get('order.supplierContact')!=null">
					<div class="has-error">
			          <label class="control-label col-sm-2">*<s:text name="bidder.contact.person"/></label>
			          <div class="col-md-4">
						<input class="form-control" maxlength="100" type="text" name="order.supplierContact" id="order.supplierContact" >
			        	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.supplierContact')"/> </span>
			          </div>
			     	</div> 
			     </s:if>
			     <s:else>
		          <label class="control-label col-sm-2">*<s:text name="bidder.contact.person"/></label>
		          <div class="col-md-4">
					<input class="form-control" maxlength="100" type="text" name="order.supplierContact" id="order.supplierContact" value="<s:property value='order.supplierContact'/>">
		          </div>
		         </s:else>	          
	      	</div>	
	      	
	      	<div class="form-group">
	      	<s:if test="fieldErrors.get('order.supplierAddress')!=null">
					<div class="has-error">
			          <label class="control-label col-sm-2">*<s:text name="bidder.address"/></label>
			          <div class="col-md-4">
						<input class="form-control" maxlength="150" type="text" name="order.supplierAddress" id="order.supplierAddress">
			        	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.supplierAddress')"/> </span>
			          </div>
			     	</div> 
			     </s:if>
			     <s:else>
		          <label class="control-label col-sm-2">*<s:text name="bidder.address"/></label>
		          <div class="col-md-4">
					<input class="form-control" maxlength="150" type="text" name="order.supplierAddress" id="order.supplierAddress" value="<s:property value='order.supplierAddress'/>">
		          </div>
		          </s:else>
		          
		          <s:if test="fieldErrors.get('order.supplierSite')!=null">
					<div class="has-error">
			          <label class="control-label col-sm-2"><s:text name="requisition.web.site"/></label>
			          <div class="col-md-4">
						<input class="form-control" maxlength="100" type="text" name="order.supplierSite" id="order.supplierSite">
			        	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.supplierSite')"/> </span>
			          </div>
			     	</div> 
			     </s:if>
			     <s:else>
		          <label class="control-label col-sm-2"><s:text name="requisition.web.site"/></label>
		          <div class="col-md-4">
					<input class="form-control" maxlength="100" type="text" name="order.supplierSite" id="order.supplierSite" value="<s:property value='order.supplierSite'/>">
		          </div>
		          </s:else>	          
	      	</div>	      	

	      	<div class="form-group">
	      	<s:if test="fieldErrors.get('order.supplierPhone')!=null">
					<div class="has-error">
			          <label class="control-label col-sm-2">*<s:text name="bidder.contact.phone"/></label>
			          <div class="col-md-4">
						<input class="form-control" maxlength="100" type="text" name="order.supplierPhone" id="order.supplierPhone" >
			        	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.supplierPhone')"/> </span>
			          </div>
			     	</div> 
			     </s:if>
			     <s:else>
		          <label class="control-label col-sm-2">*<s:text name="bidder.contact.phone"/></label>
		          <div class="col-md-4">
					<input class="form-control" maxlength="100" type="text" name="order.supplierPhone" id="order.supplierPhone" value="<s:property value='order.supplierPhone'/>">
		          </div>
		          </s:else>
	          <label class="control-label col-sm-2"><s:text name="bidder.email"/></label>
	          <div class="col-md-4">
				<input class="form-control" maxlength="150" type="email" name="order.supplierEmail" id="order.supplierEmail" value="<s:property value='order.supplierEmail'/>">
	          </div>	          
	      	</div>
	      	</div>			
		</fieldset>	
<!-- 		
		<fieldset>
			<legend><s:text name="order.change.orders"/></legend>
			
	      	<div class="form-group">
	      		<s:if test="fieldErrors.get('order.changeOrdersCount')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2"><s:text name="order.change.orders.count"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" data="numberLong" name="order.changeOrdersCount" id="order.changeOrdersCount" >
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.changeOrdersCount')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="order.change.orders.count"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" data="numberLong" name="order.changeOrdersCount" id="order.changeOrdersCount" value="<s:property value='order.changeOrdersCount'/>">
		          </div>
		          </s:else>
		          <s:if test="fieldErrors.get('order.changeOrdersDate')!=null">
					<div class="has-error">
					<label class="control-label col-sm-2"><s:text name="order.change.orders.date"/></label>
					<div class="col-md-4">
						<input class="form-control" type="text" name="order.changeOrdersDate" id="order.changeOrdersDate" >
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('order.changeOrdersDate')"/> </span>
			          </div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2"><s:text name="order.change.orders.date"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="order.changeOrdersDate" id="order.changeOrdersDate" value="<s:property value='order.changeOrdersDate'/>">
		          </div>
		          </s:else>
	      	</div>
		</fieldset>
		<fieldset>
			
	      	
	      	<div class="form-group">
	      	<label class="control-label col-sm-2"><s:text name="order.date.printed"/></label>
	          <div class="col-md-4">
				<input class="form-control" type="text" name="order.dateprinted" id="order.dateprinted" value="<s:property value='order.dateprinted'/>">
	          </div>
	      	</div>
		</fieldset>
 -->		
		<div class="form-group">
			<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
			<div class="col-md-10">
				<textarea maxlength="2000" id="order.textmsg" name="order.textmsg" class="form-control" ><s:property value='order.textmsg'/></textarea>
			</div>									
		</div>
		
        <fieldset>
			<legend><s:text name="order.purchase.order.items"/></legend>
			<s:if test="order !=null && order.id != null">
			<div id="item_grid_errors"></div>
       		<div>
       		<jsp:include page="order_item_grid.jsp"></jsp:include>
       		</div>
       		</s:if>
       		<s:else>
       		<span class="label label-info"><s:text name="order.after.saving.add.items"/></span>
       		</s:else>
		</fieldset>		
		
		<div class="form-actions">
			<div class="row">
				<div class="col-md-12">
					<s:if test="order != null && order.id != null">
					<button id="prstatus" class="btn btn-default" type="button">
						<i class="fa fa-gears"></i>
						<s:text name="label.button.processing"></s:text>
					</button>
					</s:if>				
				
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

<!-- end widget -->
<script type="text/javascript">
$(document).ready(function() {
		$(function() {
		    $.ajaxSetup({
		        error: function(jqXHR, exception) {
		            if (jqXHR.status === 0) {
		                alert('Not connect.n Verify Network.');
		            } else if (jqXHR.status == 404) {
		                alert('Requested page not found. [404]');
		            } else if (jqXHR.status == 500) {
		                alert('Internal Server Error [500].');
		            } else if (exception === 'parsererror') {
		                alert('Requested JSON parse failed.');
		            } else if (exception === 'timeout') {
		                alert('Time out error.');
		            } else if (exception === 'abort') {
		                alert('Ajax request aborted.');
		            } else {
		                alert('Uncaught Error.n' + jqXHR.responseText);
		            }
		        }
		    });
		});
		if($("#order\\.purchaseOrderStatus\\.statusCode").val()=='CL'){
			$("#order_form :button").prop('disabled','disabled');
		}else if($("#order\\.purchaseOrderStatus\\.statusCode").val()!=="" && $("#order\\.purchaseOrderStatus\\.statusCode").val()!=='NEW'){
			$("#save").prop('disabled','disabled');
			$("#save").hide();
		}else{
			Ladda.bind('#save');
		}
		<s:if test="order != null && order.id != null ">
		$("#prstatus").on('click', function() {
			$(":button").prop('disabled','disabled');
			$.ajax({
				type : "GET",
				url : "POrderStatusSave.do",
				data: {orderId: $("#order\\.id").val()},
				async : false,
				beforeSend : function(jqXHR, settings){
				},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#order_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						$("#order_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
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
				complete : function(jqXHR, textStatus) {
// 					$("#order_form :button").prop('disabled',false);
				}
			});
			return false;
		});	    
		</s:if>
		if($("#isBPartner").val()=="Y"){
			$("#bpartner_content").show();
			$("#supplier_content").hide();
			$("#yesBpartner").prop('checked',true);
			$("#requisition\\.isBpartner").val("Y");
		}else {
			$("#bpartner_content").hide();
			$("#supplier_content").show();
			$("#noBpartner").prop('checked',true);
			$("#requisition\\.isBpartner").val("N");
		}
		$("#noBpartner").on('change', function(){
			$("#bpartner_content").hide();
			$("#supplier_content").show();
		});
		$("#yesBpartner").on('change', function(){
			$("#bpartner_content").show();
			$("#supplier_content").hide();
		});

		if($("#order\\.equipmentPrinted").val()=="Y"){
			$("#equipment_print_content").show();
		}else {
			$("#equipment_print_content").hide();
		}

		$("#notprinted").on('change', function(){
			$("#equipment_print_content").hide();
		});
		$("#printed").on('change', function(){
			$("#equipment_print_content").show();
		});
		
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});

		$('#order\\.orderDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#order\\.orderCompletation').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#order\\.equipmentPrintDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#order\\.changeOrdersDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#order\\.dateordered').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#order\\.datepromised').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#order\\.dateprinted').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
	    $("#reqdoc").select2({
	        placeholder: "Search for transactional document",
	        minimumInputLength: 1,
	        ajax: {
		        url: "OrderMgmtInput.requisition.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	orgtype: "D",
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
            formatResult : function(item){
                if(item){
                	var desc =
                    '<div style="border: 1px solid #333333;  padding: 5px;">' +
                        "<div>Requisition Doc : " + item.doc_subject + "</div>" +
                        "<div>Requisition Nr : " + item.requisitionNr + "</div>" +
                    '</div>';
                	return desc;
                }
                return "";
                
            },
            formatSelection: function(item){
                if(item.id){
	            	$("#order\\.requisition\\.id").val(item.id);
	            	$("#order\\.requisition\\.dpMngmt\\.docSubject").val(item.doc_subject);
	            	$("#order\\.requisition\\.requisitionNr").val(item.requisitionNr);
                }
	            return item.doc_subject + '-' + item.requisitionNr;
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 
		<s:if test="order!=null">
	    	$("#reqdoc").select2("data", {id: "<s:property value='order.requisition.id'/>", requisitionNr: $("#order\\.requisition\\.requisitionNr").val(),  doc_subject: $("#order\\.requisition\\.dpMngmt\\.docSubject").val()});
	    </s:if>
	    
		$("#order\\.currency\\.isoCode").select2({
	        placeholder: "Search for currency",
	        minimumInputLength: 0,
	        ajax: {
		        url: "OrderMgmtInput.currency.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	orgtype: "D",
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
            formatResult : function(item){
                return item.iso_code + ", " + item.cursymbol + ", " + item.description;
            },
            formatSelection: function(item){
            	$("#order\\.currency\\.id").val(item.id);
            	$("#order\\.currency\\.cursymbol").val(item.cursymbol);
            	$("#order\\.currency\\.description").val(item.description);
            	
                return item.description + " - " + item.cursymbol;
            },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 
		<s:if test="order!=null">
	    	$("#order\\.currency\\.isoCode").select2("data", {id: "<s:property value='order.currency.id'/>", description: $("#order\\.currency\\.description").val(), cursymbol: $("#order\\.currency\\.cursymbol").val()});	    
		</s:if>
	    
	    $("#order\\.bpartner\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 1,
	        ajax: {
		        url: "OrderMgmtInput.busPartner.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	orgtype: "D",
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
            formatResult : function(item){
                if(item){
                	var desc =
                    '<div style="border: 1px solid #333333;  padding: 5px;">' +
                        "<div>Name : " + item.name + "</div>" +
                    '</div>';
                	return desc;
                }
                return "";
                
            },
            formatSelection: function(item){
            	$("#order\\.bpartner\\.id").val(item.id);
            	$("#order\\.bpartner\\.name").val(item.name);
            	$("#order\\.bpartnerLocation\\.name").prop('readonly',false);
	            return item.name;
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

	    <s:if test="order!=null">
	    	$("#order\\.bpartner\\.name").select2("data", {id: "<s:property value='order.bpartner.id'/>", name: "<s:property value='order.bpartner.name'/>"});
	    </s:if>
	    $("#order\\.bpartnerLocation\\.name").prop('readonly',true);
		if($("#order\\.bpartner\\.id").val()){
			$("#order\\.bpartnerLocation\\.name").prop('readonly',false);
		}
	    $("#order\\.bpartnerLocation\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 1,
	        ajax: {
		        url: "OrderMgmtInput.busPartnerLocation.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	name_startsWith: term,
		        	bpartner_id: $("#order\\.bpartner\\.id").val(),
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
            formatResult : function(item){
                if(item){
                	var desc =
                    '<div style="border: 1px solid #333333;  padding: 5px;">' +
                        "<div>Name : " + item.name + "</div>" +
                    '</div>';
                	return desc;
                }
                return "";
                
            },
            formatSelection: function(item){
            	$("#order\\.bpartnerLocation\\.id").val(item.id);
            	$("#order\\.bpartnerLocation\\.name").val(item.name);
            	
	            return item.name;
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

	    
	    $("#order\\.bpartnerLocation\\.name").select2("data", {id: "<s:property value='order.bpartnerLocation.id'/>", name: "<s:property value='order.bpartnerLocation.name'/>"});
	    
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "POrder.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#order_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete : function(jqXHR, textStatus) {}
			});
			return false;
		});
	    
		$("#save").on('click', function() {
			$("#order_form :button").prop('disabled','disabled');
			$('#order_form').submit();
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
					 $("#order_form_content").html(XMLHttpRequest.responseText);
		        },
				success : function(data, status, jqXHR) {
					$("#order_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						$("#order_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
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
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});		
			$("#order_form :button").prop('disabled',false);
		})();

});
function ajaxResponse(data, status, jqXHR){
	$("#order_form_content").html(jqXHR.responseText);
	var errors = jqXHR.getResponseHeader("errors_exits");
	var check = $("#errors_exits").val();
	if(check == 'false' || check == undefined){
		$("#order_grid").trigger("reloadGrid");
		$.smallBox({
			title : '<s:text name="small.box.on.save.title.success"/>',
			content : '<s:text name="small.box.content"/>',
			color : "#739E73",
			timeout: 5000,
			icon : "fa fa-check",
			number : "1",
		});	
	}else{
		$.smallBox({
			title : '<s:text name="small.box.on.save.title.failed"/>',
			content : '<s:text name="small.box.content"/>',
			color : "#C79121",
			timeout: 5000,
			icon : "fa fa-shield fadeInLeft animated",
			number : "2",
		});
	}	
}
	
</script>
</body>
</html>