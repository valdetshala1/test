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
		<form id="financial_type_form" class="form-horizontal" action="FinTypeSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="finance.type.legend.financial.type.data"/></legend>
				<input id="finType.id" name="finType.id" value="<s:property value='finType.id'/>" type="hidden">
				
				<!-- START finType.name -->
				<s:if test="fieldErrors.get('finType.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.type.label.name"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="finType.name" name="finType.name" class="form-control" placeholder="<s:text name="finance.type.label.name"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finType.name')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.type.label.name"/></label>
						<div class="col-md-10">
						<input maxlength="100" id="finType.name" name="finType.name" class="form-control" value="<s:property value='finType.name'/>" placeholder="<s:text name="finance.type.label.name"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END finType.name -->
				
				<!-- START finType.nameSr -->
				<s:if test="fieldErrors.get('finType.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.type.label.name.sr"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="finType.nameSr" name="finType.nameSr" class="form-control" placeholder="<s:text name="finance.type.label.name.sr"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finType.nameSr')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.type.label.name.sr"/></label>
						<div class="col-md-10">
						<input maxlength="100" id="finType.nameSr" name="finType.nameSr" class="form-control" value="<s:property value='finType.nameSr'/>" placeholder="<s:text name="finance.type.label.name.sr"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END finType.nameSr -->
				
				<!-- START finType.nameEn -->
				<s:if test="fieldErrors.get('finType.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.type.label.name.en"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="finType.nameEn" name="finType.nameEn" class="form-control" placeholder="<s:text name="finance.type.label.name.en"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finType.nameEn')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.type.label.name.en"/></label>
						<div class="col-md-10">
						<input maxlength="100" id="finType.nameEn" name="finType.nameEn" class="form-control" value="<s:property value='finType.nameEn'/>" placeholder="<s:text name="finance.type.label.name.en"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END finType.nameEn -->
				
				<!-- START finType.code -->
				<s:if test="fieldErrors.get('finType.code')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="rbac.permission.grid.code"/></label>
							<div class="col-md-10">
								<input maxlength="6" id="finType.code" name="finType.code" class="form-control" placeholder="<s:text name="rbac.permission.grid.code"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finType.code')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="rbac.permission.grid.code"/></label>
						<div class="col-md-10">
						<input maxlength="6" id="finType.code" name="finType.code" class="form-control" value="<s:property value='finType.code'/>" placeholder="<s:text name="rbac.permission.grid.code"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END finType.code -->
				
				<!-- START finType.type -->
				<s:if test="fieldErrors.get('finType.type')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.type.label.type"/></label>
							<div class="col-md-10">
								<select class="form-control" id="finType.type" name="finType.type">
									<option></option>
									<s:iterator value="typeList" var="tl">
										<option value="<s:property value='#tl.getDOMVALUE()'/>">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#tl.getDOMTEXT()"/>
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#tl.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#tl.getDOMTEXT_EN()"/>
											</s:else>
										</option>
									</s:iterator>
								</select>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finType.type')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.type.label.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="finType.type" name="finType.type">
								<option></option>
								<s:iterator value="typeList" var="tl">
									<option value="<s:property value='#tl.getDOMVALUE()'/>">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#tl.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#tl.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#tl.getDOMTEXT_EN()"/>
										</s:else>
									</option>
								</s:iterator>
							</select>
						</div>
					</div>
				</s:else>
				<!-- END finType.type -->
				
				<!-- START finType.category -->
				<s:if test="fieldErrors.get('finType.category')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.type.label.category"/></label>
							<div class="col-md-10">
								<select class="form-control" id="finType.category" name="finType.category">
									<option></option>
									<s:iterator value="typeList" var="tl">
										<option value="<s:property value='#tl.getDOMVALUE()'/>">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#tl.getDOMTEXT()"/>
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#tl.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#tl.getDOMTEXT_EN()"/>
											</s:else>
										</option>
									</s:iterator>
								</select>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finType.category')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.type.label.category"/></label>
						<div class="col-md-10">
							<select class="form-control" id="finType.category" name="finType.category">
								<option></option>
								<s:iterator value="finCategoryList" var="tl">
									<option value="<s:property value='#tl.getDOMVALUE()'/>">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#tl.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#tl.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#tl.getDOMTEXT_EN()"/>
										</s:else>
									</option>
								</s:iterator>
							</select>
						</div>
					</div>
				</s:else>
				<!-- END finType.category -->
								
				<!-- START finType.forMunAlloc -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="finance.type.for.mun.alloc"/></label>
						<div class="col-md-10">
							<input id="finType.forMunAlloc" name="finType.forMunAlloc"  value="<s:property value='finType.forMunAlloc'/>" type="checkbox">
						</div>
				</div>
				<!-- END finType.forMunAlloc -->
				
				<!-- START finType.description -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="finance.type.label.description"/></label>
					<div class="col-md-10">
						<textarea id="finType.description" name="finType.description" class="form-control"><s:property value="finType.description"/></textarea>
					</div>
				
				</div>	
				<!-- END finType.description -->
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFT" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFT" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#finType\\.type").val('<s:property value="finType.type.DOMVALUE"/>');	
		$("#finType\\.category").val('<s:property value="finType.category.DOMVALUE"/>');
		
		$('#finType\\.forMunAlloc').on('change',function(event){
			$('#finType\\.forMunAlloc').val($('#finType\\.forMunAlloc')[0].checked ? "true" : "false" );
		});
	
		if($("#finType\\.forMunAlloc").val()=="true"){
			$("#finType\\.forMunAlloc").prop('checked',true);
		}
		$("#cancelFT").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "FinType.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#financial_type_form_content").html(jqXHR.responseText);
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
		Ladda.bind('#saveFT');
		$("#saveFT").on('click', function() {
			$("#financial_type_form :button").prop('disabled','disabled');
			$('#financial_type_form').submit();
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
					$("#financial_type_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#financial_type_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
					if(!errors){
						$("#financial_type_grid").trigger("reloadGrid");
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
			$("#financial_type_form :button").prop('disabled',false);
		})();
			    	
	});            
</script>