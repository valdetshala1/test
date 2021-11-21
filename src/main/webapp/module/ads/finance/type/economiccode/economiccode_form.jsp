<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- widget div-->
<div>

	<!-- widget content -->
	<div class="widget-body">
		<form id="financialtype_form" class="form-horizontal" action="FinTypeSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend><s:text name="fin.economiccode.data"/></legend>
				<input id="financialType.id" name="financialType.id" value="<s:property value='financialType.id'/>" type="hidden">
								
				<!-- START financialType.parent -->
					<s:if test="fieldErrors.get('financialType.parent')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.parent"/></label>
							<div class="col-md-10">
								<input id="financialType.parent.nameAl" name="financialType.parent.nameAl" value="<s:property value='financialType.parent.nameAl'/>" class="form-control" placeholder="<s:text name="fin.economiccode.parent.search"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialType.parent')"/> </span>
								<input id="financialTypeParentId" name="financialTypeParentId" value="<s:property value='financialType.parent.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.parent"/></label>
							<div class="col-md-10">
								<input id="financialType.parent.nameAl" name="financialType.parent.nameAl" value="<s:property value='financialType.parent.nameAl'/>" class="form-control" placeholder="<s:text name="fin.economiccode.parent.search"/>" type="text">
								<input id="financialTypeParentId" name="financialTypeParentId" value="<s:property value='financialType.parent.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				<!-- END financialType.parent -->

				<!-- START financialType.nameAl-->
					<s:if test="fieldErrors.get('financialType.nameAl')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.name"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="financialType.nameAl" maxlength="100" name="financialType.nameAl" class="form-control" placeholder="<s:text name="fin.economiccode.name"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialType.nameAl')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.name"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="financialType.nameAl" maxlength="100" name="financialType.nameAl" value="<s:property value='financialType.nameAl'/>" class="form-control" placeholder="<s:text name="fin.economiccode.name"/>" type="text">
							</div>									
						</div>
					</s:else>
				<!-- END financialType.nameAl -->
			
				<!-- START financialType.nameEn-->
					<s:if test="fieldErrors.get('financialType.nameEn')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.name.en"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="financialType.nameEn" maxlength="100" name="financialType.nameEn" class="form-control" placeholder="<s:text name="fin.economiccode.name.en"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialType.nameEn')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.name.en"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="financialType.nameEn" maxlength="100" name="financialType.nameEn" value="<s:property value='financialType.nameEn'/>" class="form-control" placeholder="<s:text name="fin.economiccode.name.en"/>" type="text">
							</div>									
						</div>
					</s:else>
				<!-- END financialType.nameEn -->
				
				
				<!-- START financialType.nameSr -->
					<s:if test="fieldErrors.get('financialType.nameSr')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.name.sr"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="financialType.nameSr" maxlength="100" name="financialType.nameSr" class="form-control" placeholder="<s:text name="fin.economiccode.name.sr"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialType.nameSr')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.name.sr"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="financialType.nameSr" maxlength="100" name="financialType.nameSr" value="<s:property value='financialType.nameSr'/>" class="form-control" placeholder="<s:text name="fin.economiccode.name.sr"/>" type="text">
							</div>									
						</div>
					</s:else>
				<!-- END financialType.nameSr -->	
				
				<!-- START financialType.code -->
					<s:if test="fieldErrors.get('financialType.code')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.code"/></label>
							<div class="col-md-10">
								<input  maxlength="20" id="financialType.code" maxlength="20" name="financialType.code" value="<s:property value='financialType.code'/>" class="form-control" placeholder="<s:text name="fin.economiccode.code"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialType.code')"/> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="adm.organisation.label.code"/></label>
							<div class="col-md-10">
								<input  maxlength="20" id="financialType.code" maxlength="20" name="financialType.code" value="<s:property value='financialType.code'/>" class="form-control" placeholder="<s:text name="fin.economiccode.code"/>" type="text">
							</div>									
						</div>
					</s:else>
				<!-- END financialType.code -->
				
				<!-- START financialType.codeValidation -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="fin.economiccode.code.validation"/></label>
					<div class="col-md-10">
						<input  id="codeValidation" name="codeValidation" value="true" type="checkbox" checked="checked">
					</div>									
				</div>
				<!-- END financialType.codeValidation -->
								
				
				
				<!-- START finType.type -->
				<s:if test="fieldErrors.get('financialType.type')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.type.label.type"/></label>
							<div class="col-md-10">
								<select class="form-control" id="financialType.type" name="financialType.type">
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
							<select class="form-control" id="financialType.type" name="financialType.type">
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

															
				<!-- START financialType.allocation -->
					<s:if test="fieldErrors.get('financialType.allocation')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.allocation"/></label>
							<div class="col-md-10">
								<input  maxlength="20" id="financialType.allocation" name="financialType.allocation" class="form-control" placeholder="<s:text name="fin.economiccode.allocation"/>" type="checkbox">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialType.allocation')"/> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="fin.economiccode.allocation"/></label>
							<div class="col-md-10">
								<input  id="financialType.allocation" name="financialType.allocation" value="<s:property value='financialType.allocation'/>" placeholder="<s:text name="fin.economiccode.allocation"/>" type="checkbox">
							</div>									
						</div>
					</s:else>
				<!-- END financialType.code -->
								
								
				<!-- START financialType.level -->
				<s:if test="fieldErrors.get('financialType.level')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="fin.economiccode.level"/></label>
							<div class="col-md-10">
								<input  readonly="readonly" maxlength="20" id="financialType.level" maxlength="20" name="financialType.level" class="form-control" placeholder="<s:text name="fin.economiccode.level"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('financialType.level')"/> </span>								
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="fin.economiccode.level"/></label>
						<div class="col-md-10">
							<input readonly="readonly"  maxlength="20" id="financialType.level" maxlength="20" name="financialType.level" value="<s:property value='financialType.level'/>" class="form-control" placeholder="<s:text name="fin.economiccode.level"/>" type="number">
						</div>
					</div>
				</s:else>
				<!-- END financialType.level -->
				
				<s:if test="financialType.createdDate!=null">
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="fin.economiccode.created.date"/></label>
							<div class="col-md-10">
								<input  readonly="readonly" maxlength="20" id="financialType.createdDate" maxlength="20" name="financialType.createdDate" value="<s:property value='financialType.createdDate'/>" class="form-control" type="text">
							</div>
					</div>
				</s:if>				

			</fieldset>
							
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFinancialType" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFinancialType" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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

		$("#financialType\\.type").val('<s:property value="financialType.type.DOMVALUE"/>');
		
		$("#financialType\\.allocation").on('change',function(event){
			if($('#financialType\\.allocation').is(":checked")){
				$('#financialType\\.allocation').val("true");
			}else{
				$('#financialType\\.allocation').val("false");
			}
		});
		
		if($("#financialType\\.allocation").val()=="true"){
			$("#financialType\\.allocation").prop('checked',true);
		}else{
			$('#financialType\\.allocation').val("false");
		}

		
		$('#codeValidation').change(function() {
		   if($(this).is(":checked")) {
			  $('#codeValidation').val("true");
		   }else{
			  $('#codeValidation').val("false");
		   }
		});

		$("#financialType\\.parent\\.nameAl").select2({
		    placeholder: "Search with name or code", 
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.financialType.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
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
		    dropdownAutoWidth: true,
		    formatResult: function(item) {
			    var label = item.name + " (<span style='color:orange;'>" + item.code + "</span>)";
			    return label;
		    },
		    formatSelection: function(item) {
		    	var label = "";
		    	$("#financialTypeParentId").val(item.id);
		    	$("#financialType\\.parent\\.id").val(item.id);
		    	$("#financialType\\.parent\\.nameAl").val(item.name);
		    	if(item.name){
		    		label = item.name + " (<span style='color:orange;'>" + item.code + "</span>)";
		    	}
		        return label;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 

		if (financialTypeParentId.value.length != 0){
			$("#financialType\\.parent\\.nameAl").select2("data", {id: "<s:property value='financialType.parent.id'/>", name: "<s:property value='financialType.parent.nameAl'/>", code: "<s:property value='financialType.parent.code'/>"});
		}
		
		$("#cancelFinancialType").on('click', function () {                    
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
					$("#financialtype_form_content").html(jqXHR.responseText);
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
				complete:function(jqXHR, textStatus){
				}
			});			
			return false;        
		});
		Ladda.bind('#saveFinancialType');	
		$("#saveFinancialType").on('click', function () {
			$("#financialtype_form :button").prop('disabled','disabled');
			$('#financialtype_form').submit();
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
					$("#financialtype_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#financialtype_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
					if (errors_exits == "true") {
						var duplicated_mun = jqXHR.getResponseHeader("duplicated_mun");
						var error_content='<s:text name="small.box.content"/>';
						if(duplicated_mun!="")
							error_content='<s:text name="organisation.duplicate"/>'+duplicated_mun;
						
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : error_content,
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					} else {
						jQuery("#ec_treegrid").trigger("reloadGrid");
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
			$(":button").prop('disabled',false);				
		})();
	});            
</script>