<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
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
		<form id="contractor_form" class="form-horizontal" action="ContractorSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="finance.contractor.legend.contractor.data"/></legend>
				<input id="contractor.id" name="contractor.id" value="<s:property value='contractor.id'/>" type="hidden">
				
				<!-- START contractor.comopanyName -->
				<s:if test="fieldErrors.get('contractor.comopanyName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.contractor.label.company.name"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="contractor.comopanyName" name="contractor.comopanyName" class="form-control" placeholder="<s:text name="finance.contractor.label.company.name"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contractor.comopanyName')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.contractor.label.company.name"/></label>
						<div class="col-md-10">
						<input maxlength="100" id="contractor.comopanyName" name="contractor.comopanyName" class="form-control" value="<s:property value='contractor.comopanyName'/>" placeholder="<s:text name="finance.contractor.label.company.name"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contractor.comopanyName -->
				
				<!-- START contractor.fiscalNumber -->
				<s:if test="fieldErrors.get('contractor.fiscalNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.contractor.label.fiscal.number"/></label>
							<div class="col-md-10">
								<input maxlength="50" id="contractor.fiscalNumber" name="contractor.fiscalNumber" class="form-control" placeholder="<s:text name="finance.contractor.label.fiscal.number"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contractor.fiscalNumber')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.contractor.label.fiscal.number"/></label>
						<div class="col-md-10">
						<input maxlength="50" id="contractor.fiscalNumber" name="contractor.fiscalNumber" class="form-control" value="<s:property value='contractor.fiscalNumber'/>" placeholder="<s:text name="finance.contractor.label.fiscal.number"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contractor.fiscalNumber -->
				
				<!-- START contractor.businessNumber -->
				<s:if test="fieldErrors.get('contractor.businessNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.contractor.label.business.number"/></label>
							<div class="col-md-10">
								<input maxlength="50" id="contractor.businessNumber" name="contractor.businessNumber" class="form-control" placeholder="<s:text name="finance.contractor.label.business.number"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contractor.businessNumber')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.contractor.label.business.number"/></label>
						<div class="col-md-10">
						<input maxlength="50" id="contractor.businessNumber" name="contractor.businessNumber" class="form-control" value="<s:property value='contractor.businessNumber'/>" placeholder="<s:text name="finance.contractor.label.business.number"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contractor.businessNumber -->
				
				<!-- START contractor.address -->
				<s:if test="fieldErrors.get('contractor.address')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.contractor.label.address"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="contractor.address" name="contractor.address" class="form-control" placeholder="<s:text name="finance.contractor.label.address"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contractor.address')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contractor.label.address"/></label>
						<div class="col-md-10">
						<input maxlength="100" id="contractor.address" name="contractor.address" class="form-control" value="<s:property value='contractor.address'/>" placeholder="<s:text name="finance.contractor.label.address"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contractor.address -->
				
				<!-- START contractor.contactPerson -->
				<s:if test="fieldErrors.get('contractor.contactPerson')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.contractor.label.contact.person"/></label>
							<div class="col-md-10">
								<input maxlength="50" id="contractor.contactPerson" name="contractor.contactPerson" class="form-control" placeholder="<s:text name="finance.contractor.label.contact.person"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contractor.contactPerson')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="finance.contractor.label.contact.person"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="contractor.contactPerson" name="contractor.contactPerson" class="form-control" value="<s:property value='contractor.contactPerson'/>" placeholder="<s:text name="finance.contractor.label.contact.person"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contractor.contactPerson -->
				
				<!-- START contractor.phone -->
				<s:if test="fieldErrors.get('contractor.phone')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.contractor.label.contact.phone"/></label>
							<div class="col-md-10">
								<input id="contractor.phone" name="contractor.phone" class="form-control" placeholder="<s:text name="finance.contractor.label.contact.phone"/>" />
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contractor.phone')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contractor.label.contact.phone"/></label>
						<div class="col-md-10">
						<input id="contractor.phone" name="contractor.phone" class="form-control" value="<s:property value='contractor.phone'/>" placeholder="<s:text name="finance.contractor.label.contact.phone"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contractor.phone -->
				
				<!-- START contractor.EMail -->
				<s:if test="fieldErrors.get('contractor.EMail')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.contractor.label.email"/></label>
							<div class="col-md-10">
								<input type="email" maxlength="50" id="contractor.EMail" name="contractor.EMail" class="form-control" placeholder="<s:text name="finance.contractor.label.email"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contractor.EMail')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contractor.label.email"/></label>
						<div class="col-md-10">
						<input type="email" maxlength="50" id="contractor.EMail" name="contractor.EMail" class="form-control" value="<s:property value='contractor.EMail'/>" placeholder="<s:text name="finance.contractor.label.email"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contractor.EMail -->
				
				<!-- START contractor.note -->
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="contractor.note" name="contractor.note" class="form-control"><s:property value='contractor.note'/></textarea>
						</div>
					</div>
				<!-- END contractor.EMail -->
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFC" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFC" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#contractor\\.phone").mask("+" + "999-99-999-999");
		
		$("#cancelFC").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "Contractor.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#contractor_form_content").html(jqXHR.responseText);
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
		var validator = $( "#contractor_form" ).validate();
		validator.element( "#contractor\\.EMail" );		
 		Ladda.bind('#saveFC');
		$("#saveFC").on('click', function() {
			if($("#contractor_form").valid()){
				$("#contractor_form :button").prop('disabled','disabled');
				$('#contractor_form').submit();
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
					$("#contractor_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#contractor_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
					if(!errors){
						$("#contractor_grid").trigger("reloadGrid");
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
			$("#contractor_form :button").prop('disabled',false);
		})();
			    	
	});            
</script>