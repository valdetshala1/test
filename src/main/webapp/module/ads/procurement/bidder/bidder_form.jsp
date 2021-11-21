<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="bidder_form" class="form-horizontal" action="BidderSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="bidder.legend.bidder.data"/></legend>
				<input id="bidder.id" name="bidder.id" value="<s:property value='bidder.id'/>" type="hidden">
				
				<!-- START bidder.comopanyName  -->
				<s:if test="fieldErrors.get('bidder.comopanyName')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="bidder.company.name"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.companyName" name="bidder.companyName" class="form-control" placeholder="<s:text name="bidder.company.name"/>" value="<s:property value='bidder.comopanyName' />">
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.comopanyName')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label">*<s:text name="bidder.company.name"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.companyName" name="bidder.companyName" class="form-control" placeholder="<s:text name="bidder.company.name"/>" value="<s:property value='bidder.companyName' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END bidder.comopanyName   -->	
				
				<!-- START bidder.fiscalNumber  -->
				<s:if test="fieldErrors.get('bidder.fiscalNumber')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="bidder.fiscal.number"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.fiscalNumber" name="bidder.fiscalNumber" class="form-control" placeholder="<s:text name="bidder.fiscal.number"/>" value="<s:property value='bidder.fiscalNumber' />">
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.fiscalNumber')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label">*<s:text name="bidder.fiscal.number"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.fiscalNumber" name="bidder.fiscalNumber" class="form-control" placeholder="<s:text name="bidder.fiscal.number"/>" value="<s:property value='bidder.fiscalNumber' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END bidder.fiscalNumber   -->	
				
				<!-- START bidder.businessNumber  -->
				<s:if test="fieldErrors.get('bidder.businessNumber')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="finance.contractor.label.business.number"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.businessNumber" name="bidder.businessNumber" class="form-control" placeholder="<s:text name="finance.contractor.label.business.number"/>"/>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.businessNumber')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label">*<s:text name="finance.contractor.label.business.number"/>:</label>
					 	  <div class="col-md-10">
					      		<input maxlength="50" id="bidder.businessNumber" name="bidder.businessNumber" class="form-control" value="<s:property value='bidder.businessNumber'/>" placeholder="<s:text name="finance.contractor.label.business.number"/>"/>
					      </div>         
				     </div>
				</s:else>
				<!-- END bidder.businessNumber   -->	
				
				
				<!-- START bidder.cadastralMunicipality.id  -->
<%-- 				<s:if test="fieldErrors.get('bidder.cadastralMunicipality.id')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 					      <label class="col-md-2 control-label"><s:text name="bidder.cadastral.municipality"/>:</label> --%>
<!-- 					 	  <div class="col-md-10"> -->
<%-- 					      	 	<input id="bidder.cadastralMunicipality.name" name="bidder.cadastralMunicipality.name" class="form-control" placeholder="Default Text Field" value="<s:property value='bidder.cadastralMunicipality.name' />"> --%>
<%-- 					      		<input type="hidden" id="bidder.cadastralMunicipality.id" name="bidder.cadastralMunicipality.id" value="<s:property value='bidder.fiscalNumber' />"> --%>
<%-- 					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.cadastralMunicipality.id')"/> </span> --%>
<!-- 					      </div>          -->
<!-- 				     </div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					 <div class="form-group"> -->
<%-- 					      <label class="col-md-2 control-label"><s:text name="bidder.cadastral.municipality"/>:</label> --%>
<!-- 					 	  <div class="col-md-10"> -->
<%-- 					 	  		<input id="bidder.cadastralMunicipality.name" name="bidder.cadastralMunicipality.name" class="form-control" placeholder="Default Text Field" value="<s:property value='bidder.cadastralMunicipality.name' />"> --%>
<%-- 					      		<input type="hidden" id="bidder.cadastralMunicipality.id" name="bidder.cadastralMunicipality.id" class="form-control" placeholder="Default Text Field" value="<s:property value='bidder.cadastralMunicipality.id' />"> --%>
<!-- 					      </div>          -->
<!-- 				     </div> -->
<%-- 				</s:else> --%>
				<!-- END bidder.cadastralMunicipality.id   -->
				
				<!-- START bidder.address  -->
				<s:if test="fieldErrors.get('bidder.address')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name="bidder.address"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.address" name="bidder.address" class="form-control" placeholder="<s:text name="bidder.address"/>" value="<s:property value='bidder.address' />">
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.address')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name="bidder.address"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.address" name="bidder.address" class="form-control" placeholder="<s:text name="bidder.address"/>" value="<s:property value='bidder.address' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END bidder.address   -->
				
				<!-- START bidder.contactPerson  -->
				<s:if test="fieldErrors.get('bidder.contactPerson')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name="bidder.contact.person"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.contactPerson" name="bidder.contactPerson" class="form-control" placeholder="<s:text name="bidder.contact.person"/>" value="<s:property value='bidder.contactPerson' />">
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.contactPerson')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name="bidder.contact.person"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.contactPerson" name="bidder.contactPerson" class="form-control" placeholder="<s:text name="bidder.contact.person"/>" value="<s:property value='bidder.contactPerson' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END bidder.contactPerson   -->
				
				<!-- START bidder.EMail  -->
				<s:if test="fieldErrors.get('bidder.EMail')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name="bidder.email"/>:</label>
					 	  <div class="col-md-10">
					      		<input type="email" id="bidder.EMail" name="bidder.EMail" class="form-control" placeholder="<s:text name="bidder.email"/>" value="<s:property value='bidder.EMail' />">
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.EMail')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name="bidder.email"/>:</label>
					 	  <div class="col-md-10">
					      		<input type="email" id="bidder.EMail" name="bidder.EMail" class="form-control" placeholder="<s:text name="bidder.email"/>" value="<s:property value='bidder.EMail' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END bidder.EMail   -->
				
				<!-- START bidder.contactPhone  -->
				<s:if test="fieldErrors.get('bidder.contactPhone')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name="bidder.contact.phone"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.contactPhone" name="bidder.contactPhone" class="form-control" placeholder="<s:text name="bidder.contact.phone"/>" value="<s:property value='bidder.contactPhone' />">
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.contactPhone')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name="bidder.contact.phone"/>:</label>
					 	  <div class="col-md-10">
					      		<input id="bidder.contactPhone" name="bidder.contactPhone" class="form-control" placeholder="<s:text name="bidder.contact.phone"/>" value="<s:property value='bidder.contactPhone' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END bidder.contactPhone   -->
				
				<!-- START bidder.comments  -->
				<s:if test="fieldErrors.get('bidder.comments')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name="bidder.comments"/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="bidder.comments" name="bidder.comments" class="form-control" placeholder="<s:text name="bidder.comments"/>" ><s:property value='bidder.comments' /></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bidder.comments')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name="bidder.comments"/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="bidder.comments" name="bidder.comments" class="form-control" placeholder="<s:text name="bidder.comments"/>" ><s:property value='bidder.comments' /></textarea>
					      </div>         
				     </div>
				</s:else>
				<!-- END bidder.comments   -->
				
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelBidder" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveBidder" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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

	$(document).ready(function () {
		$("#bidder\\.contactPhone").mask("+" + "999-99-999-999");
		var validator = $( "#bidder_form" ).validate();
		validator.element("#bidder\\.EMail");
		    
		$("#cancelBidder").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "Bidder.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#bidder_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : "<s:text name="small.box.on.cancel.title"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C46A69",
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;        
		});

		Ladda.bind('#saveBidder');		
		$("#saveBidder").on('click', function () { 
			if($('#bidder_form').valid()){
				$("#bidder_form :button").prop('disabled','disabled');
				$('#bidder_form').submit();
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
					$("#bidder_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#bidder_form_content").html(jqXHR.responseText);					
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						$("#bidder_grid").trigger("reloadGrid");
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
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});
			$("#bidder_form :button").prop('disabled',false);				
		})();
			    	
	});            
</script>