<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div>

	<!-- widget content -->
	<div class="widget-body">
        <input id="lang" name="lang" value="<s:property value="locale.language"/>" type="hidden">
		<form id="bpartner_form" class="form-horizontal" action="BPartnerSave.do" accept-charset="utf8" method="post">
        	<input id="bpartnerId" name="bpartnerId" value="<s:property value="bpartner.id"/>" type="hidden">
        	<input id="bpartner.party.id" name="bpartner.party.id" value="<s:property value="bpartner.party.id"/>" type="hidden">
        	<input id="partyId" name="partyId" value="<s:property value="partyId"/>" type="hidden">
	        <input id="bpartner.id" name="bpartner.id" value="<s:property value="bpartner.id"/>" type="hidden">
	        <input id="bpartner.created" name="bpartner.created" value="<s:property value="bpartner.created"/>" type="hidden">
	        <input id="bpartner.updated" name="bpartner.updated" value="<s:property value="bpartner.updated"/>" type="hidden">
	        <input id="bpartner.personByCreatedby.id" name="bpartner.personByCreatedby.id" value="<s:property value="bpartner.personByCreatedby.id"/>" type="hidden">
	        <input id="bpartner.personByUpdatedby.id" name="bpartner.personByUpdatedby.id" value="<s:property value="bpartner.personByUpdatedby.id"/>" type="hidden">
	        
	        
		<fieldset>
		<legend><s:text name="bpartner.bussines.partner"/></legend>
			<div class="form-group">
				<!-- START bpartner.name -->
				<label class="control-label col-sm-2">*<s:text name="hrm.skill.grid.name"/>:</label>
				<s:if test="fieldErrors.get('bpartner.name')!=null">
					<div class="has-error">
						<div class="col-md-4">
							<input maxlength="120" id="bpartner.name" name="bpartner.name" class="form-control" placeholder="<s:text name="hrm.skill.grid.name"/>"/>
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.name')"/></span> 
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="col-md-4">
						<input maxlength="120" id="bpartner.name" name="bpartner.name" class="form-control" value="<s:property value='bpartner.name'/>" placeholder="<s:text name="hrm.skill.grid.name"/>"/>
					</div>
				</s:else>
				<!-- END bpartner.name -->
				
				<!-- START bpartner.referenceno -->
				<label class="control-label col-sm-2"><s:text name="bpartner.reference.no"/>:</label>
				<s:if test="fieldErrors.get('bpartner.referenceno')!=null">
					<div class="has-error">
						<div class="col-md-4">
							<input maxlength="40" id="bpartner.referenceno" name="bpartner.referenceno" class="form-control" placeholder="<s:text name="bpartner.reference.no"/>"/>
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.referenceno')"/></span> 
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="col-md-4">
						<input maxlength="40" id="bpartner.referenceno" name="bpartner.referenceno" class="form-control" value="<s:property value='bpartner.referenceno'/>" placeholder="<s:text name="bpartner.reference.no"/>"/>
					</div>
				</s:else>
				<!-- END bpartner.referenceno -->
				<!-- START bpartner.name2 -->
<%-- 				<label class="control-label col-sm-2">*<s:text name="bpartner.name2"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.name2')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<%-- 							<input maxlength="60" id="bpartner.name2" name="bpartner.name2" class="form-control" placeholder="<s:text name="bpartner.name2"/>"/> --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.name2')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<%-- 						<input maxlength="60" id="bpartner.name2" name="bpartner.name2" class="form-control" value="<s:property value='bpartner.name2'/>" placeholder="<s:text name="bpartner.name2"/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.name2 -->
			</div>
			
			<div class="form-group">
				<!-- START bpartner.employerIdNumber -->
				<label class="control-label col-sm-2">*<s:text name="bpartner.bussines.number"/>:</label>
				<s:if test="fieldErrors.get('bpartner.employerIdNumber')!=null">
					<div class="has-error">
						<div class="col-md-4">
							<input maxlength="100" id="bpartner.employerIdNumber" name="bpartner.employerIdNumber" class="form-control" placeholder="<s:text name="bpartner.bussines.number"/>"/>
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.employerIdNumber')"/></span> 
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="col-md-4">
						<input maxlength="100" id="bpartner.employerIdNumber" name="bpartner.employerIdNumber" class="form-control" value="<s:property value='bpartner.employerIdNumber'/>" placeholder="<s:text name="bpartner.bussines.number"/>"/>
					</div>
				</s:else>
				<!-- END bpartner.employerIdNumber -->
				
				<!-- START bpartner.socialSecurityNumber -->
				<label class="control-label col-sm-2">*<s:text name="bpartner.soc.sec.num"/>:</label>
				<s:if test="fieldErrors.get('bpartner.socialSecurityNumber')!=null">
					<div class="has-error">
						<div class="col-md-4">
							<input maxlength="100" id="bpartner.socialSecurityNumber" name="bpartner.socialSecurityNumber" class="form-control" placeholder="<s:text name="bpartner.soc.sec.num"/>"/>
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.socialSecurityNumber')"/></span> 
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="col-md-4">
						<input maxlength="100" id="bpartner.socialSecurityNumber" name="bpartner.socialSecurityNumber" class="form-control" value="<s:property value='bpartner.socialSecurityNumber'/>" placeholder="<s:text name="bpartner.soc.sec.num"/>"/>
					</div>
				</s:else>
				<!-- END bpartner.socialSecurityNumber -->
			</div>
		       
		    <div class="form-group">
				<!-- START bpartner.contactEtbilishedDate -->
				<label class="control-label col-sm-2">*<s:text name="bpartner.con.est.date"/>:</label>
				<s:if test="fieldErrors.get('bpartner.contactEtbilishedDate')!=null">
					<div class="has-error">
						<div class="col-md-4">
							<input id="bpartner.contactEtbilishedDate" name="bpartner.contactEtbilishedDate" class="form-control" placeholder="<s:text name="dd.mm.yy"/>"/>
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.contactEtbilishedDate')"/></span> 
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="col-md-4">
						<input id="bpartner.contactEtbilishedDate" name="bpartner.contactEtbilishedDate" class="form-control" value="<s:property value='bpartner.contactEtbilishedDate'/>" placeholder="<s:text name="dd.mm.yy"/>"/>
					</div>
				</s:else>
				<!-- END bpartner.contactEtbilishedDate -->
				
				<!-- START bpartner.numberemployees -->
				<label class="control-label col-sm-2"><s:text name="bpartner.num.emp"/>:</label>
				<s:if test="fieldErrors.get('bpartner.numberemployees')!=null">
					<div class="has-error">
						<div class="col-md-4">
							<input data="number" id="bpartner.numberemployees" name="bpartner.numberemployees" class="form-control" placeholder="<s:text name="bpartner.num.emp"/>"/>
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.numberemployees')"/></span> 
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="col-md-4">
						<input data="number" id="bpartner.numberemployees" name="bpartner.numberemployees" class="form-control" value="<s:property value='bpartner.numberemployees'/>" placeholder="<s:text name="bpartner.num.emp"/>"/>
					</div>
				</s:else>
				<!-- END bpartner.numberemployees -->
			</div>
			
<!-- 			<div class="form-group"> -->
				<!-- START bpartner.salesvolume -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.sales.vol"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.salesvolume')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<%-- 							<input id="bpartner.salesvolume" name="bpartner.salesvolume" class="form-control" placeholder="<s:text name="bpartner.sales.vol"/>"/> --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.salesvolume')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<%-- 						<input id="bpartner.salesvolume" name="bpartner.salesvolume" class="form-control" value="<s:property value='bpartner.salesvolume'/>" placeholder="<s:text name="bpartner.sales.vol"/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.salesvolume -->
				
								<!-- START bpartner.vendorDiscountPercent -->
<%-- 				<label class="control-label col-sm-2">*<s:text name="bpartner.ven.dis.perc"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.vendorDiscountPercent')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<%-- 							<input data="number" id="bpartner.vendorDiscountPercent" name="bpartner.vendorDiscountPercent" class="form-control" placeholder="<s:text name="bpartner.ven.dis.perc"/>"/> --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.vendorDiscountPercent')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<%-- 						<input data="number" id="bpartner.vendorDiscountPercent" name="bpartner.vendorDiscountPercent" class="form-control" value="<s:property value='bpartner.vendorDiscountPercent'/>" placeholder="<s:text name="bpartner.ven.dis.perc"/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.vendorDiscountPercent -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group"> -->
				<!-- START bpartner.flatdiscount -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.flat.discount"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.flatdiscount')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<%-- 							<input data="numberBigDec" id="bpartner.flatdiscount" name="bpartner.flatdiscount" class="form-control" placeholder="<s:text name="bpartner.flat.discount"/>"/> --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.flatdiscount')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<%-- 						<input data="numberBigDec" id="bpartner.flatdiscount" name="bpartner.flatdiscount" class="form-control" value="<s:property value='bpartner.flatdiscount'/>" placeholder="<s:text name="bpartner.flat.discount"/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.flatdiscount -->
				
				<!-- START bpartner.totalopenbalance -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.total.open.balance"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.totalopenbalance')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<%-- 							<input data="numberBigDec" id="bpartner.totalopenbalance" name="bpartner.totalopenbalance" class="form-control" placeholder="<s:text name="bpartner.total.open.balance"/>"/> --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.totalopenbalance')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<%-- 						<input data="numberBigDec" id="bpartner.totalopenbalance" name="bpartner.totalopenbalance" class="form-control" value="<s:property value='bpartner.totalopenbalance'/>" placeholder="<s:text name="bpartner.total.open.balance"/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.totalopenbalance -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group"> -->
				<!-- START bpartner.issummary -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.is.sum"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.issummary')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input type="checkbox" id="issummary" name="issummary" class="form-control"/> -->
<!-- 							<input type="hidden" id="bpartner.issummary" name="bpartner.issummary" class="form-control"/> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.issummary')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<!-- 						<input type="checkbox" id="issummary" name="issummary" class="form-control"/> -->
<%-- 						<input type="hidden" id="bpartner.issummary" name="bpartner.issummary" class="form-control" value="<s:property value='bpartner.issummary'/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.issummary -->
				
				<!-- START bpartner.isonetime -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.is.one.time"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.isonetime')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input type="checkbox" id="isonetime" name="isonetime" class="form-control"/> -->
<!-- 							<input type="hidden" id="bpartner.isonetime" name="bpartner.isonetime" class="form-control"/> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.isonetime')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<!-- 						<input type="checkbox" id="isonetime" name="isonetime" class="form-control"> -->
<%-- 						<input type="hidden" id="bpartner.isonetime" name="bpartner.isonetime" class="form-control" value="<s:property value='bpartner.isonetime'/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.isonetime -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group"> -->
				<!-- START bpartner.isprospect -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.is.prospect"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.isprospect')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input type="checkbox" id="isprospect" name="isprospect" class="form-control"/> -->
<!-- 							<input type="hidden" id="bpartner.isprospect" name="bpartner.isprospect" class="form-control"/> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.isprospect')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<!-- 						<input type="checkbox" id="isprospect" name="isprospect" class="form-control"/> -->
<%-- 						<input type="hidden" id="bpartner.isprospect" name="bpartner.isprospect" class="form-control" value="<s:property value='bpartner.isprospect'/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.isprospect -->
				
				<!-- START bpartner.isvendor -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.is.vendor"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.isvendor')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input type="checkbox" id="isvendor" name="isvendor" class="form-control"/> -->
<!-- 							<input type="hidden" id="bpartner.isvendor" name="bpartner.isvendor" class="form-control"/> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.isvendor')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<!-- 						<input type="checkbox" id="isvendor" name="isvendor" class="form-control"/> -->
<%-- 						<input type="hidden" id="bpartner.isvendor" name="bpartner.isvendor" class="form-control" value="<s:property value='bpartner.isvendor'/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.isvendor -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group"> -->
				<!-- START bpartner.iscustomer -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.is.costumer"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.iscustomer')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input type="checkbox" id="iscustomer" name="iscustomer" class="form-control"/> -->
<!-- 							<input type="hidden" id="bpartner.iscustomer" name="bpartner.iscustomer" class="form-control"/> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.iscustomer')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<!-- 						<input type="checkbox" id="iscustomer" name="iscustomer" class="form-control"/> -->
<%-- 						<input type="hidden" id="bpartner.iscustomer" name="bpartner.iscustomer" class="form-control" value="<s:property value='bpartner.iscustomer'/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.iscustomer -->
				
				<!-- START bpartner.isemployee -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.is.employee"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.isemployee')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input type="checkbox" id="isemployee" name="isemployee" class="form-control"/> -->
<!-- 							<input type="hidden" id="bpartner.isemployee" name="bpartner.isemployee" class="form-control"/> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.isemployee')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<!-- 						<input type="checkbox" id="isemployee" name="isemployee" class="form-control"/> -->
<%-- 						<input type="hidden" id="bpartner.isemployee" name="bpartner.isemployee" class="form-control" value="<s:property value='bpartner.isemployee'/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.isemployee -->
<!-- 			</div> -->
			
<!-- 			<div class="form-group"> -->
				<!-- START bpartner.issalesrep -->
<%-- 				<label class="control-label col-sm-2"><s:text name="bpartner.is.sales.rep"/>:</label> --%>
<%-- 				<s:if test="fieldErrors.get('bpartner.issalesrep')!=null"> --%>
<!-- 					<div class="has-error"> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input type="checkbox" id="issalesrep" name="issalesrep" class="form-control"/> -->
<!-- 							<input type="hidden" id="bpartner.issalesrep" name="bpartner.issalesrep" class="form-control"/> -->
<%-- 							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.issalesrep')"/></span>  --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="col-md-4"> -->
<!-- 						<input type="checkbox" id="issalesrep" name="issalesrep" class="form-control"/> -->
<%-- 						<input type="hidden" id="bpartner.issalesrep" name="bpartner.issalesrep" class="form-control" value="<s:property value='bpartner.issalesrep'/>"/> --%>
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END bpartner.issalesrep -->
				
				
<!-- 			</div> -->
			<div class="form-group">
				<!-- START bpartner.description -->
				<s:if test="fieldErrors.get('bpartner.description')!=null"> 
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<input id="bpartner.description" name="bpartner.description" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('bpartner.description')"/></span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="bpartner.description" name="bpartner.description" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='bpartner.description'/></textarea>
						</div>									
					</div>
				</s:else>
				<!-- END person.notes -->
			</div>
		</fieldset>
		
		
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelBP" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveBP" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
	    $("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	    $("input[data='numberBigDec']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});

	    
		$('#bpartner\\.contactEtbilishedDate').datetimepicker({
			lang: $("#lang").val(),
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});

		if($("#bpartner\\.issummary").val()=='Y'){
			$("#issummary").prop('checked',true);
		}

		$("#issummary").on('change', function(){
			if($("#issummary").is(":checked")){
				$("#bpartner\\.issummary").val("Y");
			}else{
				$("#bpartner\\.issummary").val("N");
			}
		});
		
		if($("#bpartner\\.isonetime").val()=='Y'){
			$("#isonetime").prop('checked',true);
		}

		$("#isonetime").on('change', function(){
			if($("#isonetime").is(":checked")){
				$("#bpartner\\.isonetime").val("Y");
			}else{
				$("#bpartner\\.isonetime").val("N");
			}
		});

		if($("#bPartner\\.isprospect").val()=='Y'){
			$("#isprospect").prop('checked',true);
		}

		$("#isprospect").on('change', function(){
			if($("#isprospect").is(":checked")){
				$("#bpartner\\.isprospect").val("Y");
			}else{
				$("#bpartner\\.isprospect").val("N");
			}
		});

		if($("#bPartner\\.isvendor").val()=='Y'){
			$("#isvendor").prop('checked',true);
		}

		$("#isvendor").on('change', function(){
			if($("#isvendor").is(":checked")){
				$("#bpartner\\.isvendor").val("Y");
			}else{
				$("#bpartner\\.isvendor").val("N");
			}
		});

		if($("#bpartner\\.iscustomer").val()=='Y'){
			$("#iscustomer").prop('checked',true);
		}

		$("#iscustomer").on('change', function(){
			if($("#iscustomer").is(":checked")){
				$("#bpartner\\.iscustomer").val("Y");
			}else{
				$("#bpartner\\.iscustomer").val("N");
			}
		});
		
		if($("#bpartner\\.isemployee").val()=='Y'){
			$("#isemployee").prop('checked',true);
		}

		$("#isemployee").on('change', function(){
			if($("#isemployee").is(":checked")){
				$("#bpartner\\.isemployee").val("Y");
			}else{
				$("#bpartner\\.isemployee").val("N");
			}
		});

		if($("#bPartner\\.issalesrep").val()=='Y'){
			$("#issalesrep").prop('checked',true);
		}

		$("#issalesrep").on('change', function(){
			if($("#issalesrep").is(":checked")){
				$("#bpartner\\.issalesrep").val("Y");
			}else{
				$("#bpartner\\.issalesrep").val("N");
			}
			
		});
		
		$("#cancelBP").on('click', function() {
			$.ajax({
				type : "GET",
				url : "BPartner.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#bpartner_form_content").html(jqXHR.responseText);
					//alert after cancel action
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
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
	    
		Ladda.bind('#saveBP');
		$("#saveBP").on('click', function () {
			if($('#bpartner_form').valid()){
				$("#bpartner_form :button").prop('disabled','disabled');
				$('#bpartner_form').submit();
			}
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
					$("#bpartner_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#bpartner_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
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
						jQuery("#bpartner_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}	    	
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});
			$("#bpartner_form :button").prop('disabled',false);				
		})();
	});
	
</script>