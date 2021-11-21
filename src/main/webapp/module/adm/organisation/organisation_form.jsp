<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div>

	<!-- widget content -->
	<div class="widget-body">
		<form id="organisation_form" class="form-horizontal" action="OrganisationSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<img id="org_logo" src="" border="0" width="150" style="margin: 0 auto; display: table;"/>
			<fieldset>
				<legend><s:text name="adm.organisation.legend.organisation.data"/></legend>
				<input id="organisation.id" name="organisation.id" value="<s:property value='organisation.id'/>" type="hidden">
				<!-- START organisation.party -->
					<s:if test="fieldErrors.get('organisation.parent')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.organisation.label.parent"/></label>
							<div class="col-md-10">
								<input id="parent.orgaName" name="parent.orgaName" value="<s:property value='parent.orgaName'/>" class="form-control" placeholder="<s:text name="adm.organisation.label.parent"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('organisation.parent')"/> </span>
								<input id="parent.id" name="parent.id" value="<s:property value='parent.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="adm.organisation.label.parent"/></label>
							<div class="col-md-10">
								<input id="parent.orgaName" name="parent.orgaName" value="<s:property value='parent.orgaName'/>" class="form-control" placeholder="<s:text name="adm.organisation.label.parent"/>" type="text">
								<input id="parent.id" name="parent.id" value="<s:property value='parent.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				<!-- END organisation.party -->

				<!-- START organisation.orgaName -->
					<s:if test="fieldErrors.get('organisation.orgaName')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.organisation.label.name"/></label>
							<div class="col-md-10">
								<input maxlength="100" id="organisation.orgaName" maxlength="100" name="organisation.orgaName" class="form-control" placeholder="<s:text name="adm.organisation.label.name"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('organisation.orgaName')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="adm.organisation.label.name"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="organisation.orgaName" maxlength="100" name="organisation.orgaName" value="<s:property value='organisation.orgaName'/>" class="form-control" placeholder="<s:text name="adm.organisation.label.name"/>" type="text">
							</div>									
						</div>
					</s:else>
				<!-- END organisation.orgaName -->
			
				<!-- START organisation.orgaNameEn -->
					<s:if test="fieldErrors.get('organisation.orgaNameEn')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.en"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="organisation.orgaNameEn" maxlength="100" name="organisation.orgaNameEn" class="form-control" placeholder="<s:text name="leave.type.label.name.en"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('organisation.orgaNameEn')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.en"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="organisation.orgaNameEn" maxlength="100" name="organisation.orgaNameEn" value="<s:property value='organisation.orgaNameEn'/>" class="form-control" placeholder="<s:text name="leave.type.label.name.en"/>" type="text">
							</div>									
						</div>
					</s:else>
				<!-- END organisation.orgaNameEn -->
				<!-- START organisation.orgaNameSr -->
					<s:if test="fieldErrors.get('organisation.orgaNameSr')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.sr"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="organisation.orgaNameSr" maxlength="100" name="organisation.orgaNameSr" class="form-control" placeholder="<s:text name="leave.type.label.name.sr"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('organisation.orgaNameSr')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="leave.type.label.name.sr"/></label>
							<div class="col-md-10">
								<input  maxlength="100" id="organisation.orgaNameSr" maxlength="100" name="organisation.orgaNameSr" value="<s:property value='organisation.orgaNameSr'/>" class="form-control" placeholder="<s:text name="leave.type.label.name.sr"/>" type="text">
							</div>									
						</div>
					</s:else>
				<!-- END organisation.orgaNameSr -->	
				<!-- START organisation.code -->
					<s:if test="fieldErrors.get('organisation.code')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.organisation.label.code"/></label>
							<div class="col-md-10">
								<input  maxlength="20" id="organisation.code" maxlength="20" name="organisation.code" class="form-control" placeholder="<s:text name="adm.organisation.label.code"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('organisation.code')"/> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="adm.organisation.label.code"/></label>
							<div class="col-md-10">
								<input  maxlength="20" id="organisation.code" maxlength="20" name="organisation.code" value="<s:property value='organisation.code'/>" class="form-control" placeholder="<s:text name="adm.organisation.label.code"/>" type="text">
							</div>									
						</div>
					</s:else>
				<!-- END organisation.code -->
				
				<!-- START organisation.orgaType -->
					<s:if test="fieldErrors.get('organisation.orgaType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1"><s:text name="adm.organisation.label.type"/></label>
							<div class="col-md-10">
								<select class="form-control" id="organisation.orgaType" name="organisation.orgaType">
								<option/>
									<s:iterator value="organisationTypeList" var="el">
										<option value="<s:property value="#el.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#el.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#el.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#el.getDOMTEXT_EN()" />
											</s:else>
										</option>
									</s:iterator>						
								</select>
								<span class="help-block"><i class="fa fa-warning"></i>
									<s:property value="fieldErrors.get('organisation.orgaType')"/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="adm.organisation.label.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="organisation.orgaType" name="organisation.orgaType">
							<option/>
								<s:iterator value="organisationTypeList" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#el.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#el.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#el.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
						</div>
					</div>
				</s:else>
				<!-- END organisation.orgaType -->
				
				<!-- START organisation.operationLevel -->
				<s:if test="fieldErrors.get('organisation.operLevelVal')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="adm.organisation.label.operation.level"/></label>
							<div class="col-md-10">
								<select class="form-control" id="organisation.operLevelVal" name="organisation.operLevelVal">
								<option/>
									<s:iterator value="operationLevelList" var="el">
										<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#el.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#el.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#el.getDOMTEXT_EN()" />
										</s:else>
									</option>
									</s:iterator>						
								</select>
								<span class="help-block"><i class="fa fa-warning"></i>
									<s:property value="fieldErrors.get('organisation.operLevelVal')"/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="adm.organisation.label.operation.level"/></label>
						<div class="col-md-10">
							
							<select class="form-control" id="organisation.operLevelVal" name="organisation.operLevelVal">
								<option/>
								<s:iterator value="operationLevelList" var="ol">
									<s:if test="%{organisation.operLevelVal.toString() == #ol.getDOMKEY()}">
										<option selected value="<s:property value="#ol.getDOMVALUE()" />" >
											<s:if test="%{locale.language=='al'}">
												<s:property value="#ol.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#ol.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#ol.getDOMTEXT_EN()" />
											</s:else>
										</option>
									</s:if>
									<s:else>
										<option value="<s:property value="#ol.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#ol.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#ol.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#ol.getDOMTEXT_EN()" />
											</s:else>
										</option>
									</s:else>
								</s:iterator>						
							</select>
							
						</div>
					</div>
				</s:else>
				<!-- END organisation.operationLevel -->
				
				<!-- START organisation.orgaCategory -->
					<s:if test="fieldErrors.get('organisation.orgaCategory')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label" for="select-1"><s:text name="adm.organisation.label.category"/></label>
								<div class="col-md-10">
									<select class="form-control" id="organisation.orgaCategory" name="organisation.orgaCategory">
									<option/>
										<s:iterator value="orgaCategoryList" var="el">
											<option value="<s:property value="#el.getDOMVALUE()" />">
												<s:if test="%{locale.language=='al'}">
													<s:property value="#el.getDOMTEXT()" />
												</s:if>
												<s:elseif test="%{locale.language=='sr'}">
													<s:property value="#el.getDOMTEXT_SR()"/>
												</s:elseif>
												<s:else>
													<s:property value="#el.getDOMTEXT_EN()" />
												</s:else>
											</option>
										</s:iterator>						
									</select>
									<span class="help-block"><i class="fa fa-warning"></i>
										<s:property value="fieldErrors.get('organisation.orgaCategory')"/>
									</span> 
								</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label" ><s:text name="adm.organisation.label.category"/></label>
							<div class="col-md-10">
								<select class="form-control" id="organisation.orgaCategory" name="organisation.orgaCategory">
								<option/>
									<s:iterator value="orgaCategoryList" var="el">
										<option value="<s:property value="#el.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#el.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#el.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#el.getDOMTEXT_EN()" />
											</s:else>
										</option>
									</s:iterator>						
								</select>
							</div>
						</div>
					</s:else>
				<!-- END organisation.orgaCategory -->
				
				<!-- START organisation.municipality -->
				<s:if test="fieldErrors.get('organisation.municipality')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="annu.felling.label.municipality"/></label>
						<div class="col-md-10">
							<select class="tokenize-sample" id="munList" name="munList" multiple="multiple">
								<s:iterator value="organisation.organisationMuns" var="oms">
									<option value="<s:property value="cadastralMunicipality.id"/>" selected="selected"><s:property value="cadastralMunicipality.name"/></option>
								</s:iterator>
							</select>			
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('organisation.municipality')" /> </span>			
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
						<label class="col-md-2 control-label" for="munList"><s:text name="annu.felling.label.municipality"/></label>
						<div class="col-md-10">
							<select class="tokenize-sample" id="munList" name="munList" multiple="multiple">
								<s:iterator value="organisation.organisationMuns" var="oms">
									<option value="<s:property value="cadastralMunicipality.id"/>" selected="selected"><s:property value="cadastralMunicipality.name"/></option>
								</s:iterator>
							</select>
						</div>
				</div>
				</s:else>
				<!-- END organisation.municipality -->			
				
				<!-- START organisation.startDate -->
<%-- 					<s:if test="fieldErrors.get('organisation.startDate')!=null"> --%>
<!-- 						<div class="form-group has-error"> -->
<%-- 							<label class="col-md-2 control-label"><s:text name="hrm.skill.label.start.date"/></label> --%>
<!-- 							<div class="col-md-10"> -->
<!-- 								<input id="organisation.startDate" name="organisation.startDate" class="form-control" placeholder="dd.mm.yy" type="text"> -->
<%-- 								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('organisation.startDate')"/> </span> --%>
<!-- 							</div>					 -->
<!-- 						</div> -->
<%-- 					</s:if> --%>
<%-- 					<s:else> --%>
<!-- 						<div class="form-group"> -->
<%-- 							<label class="col-md-2 control-label"><s:text name="hrm.skill.label.start.date"/></label> --%>
<!-- 							<div class="col-md-10"> -->
<%-- 								<input id="organisation.startDate" name="organisation.startDate" value="<s:property value='organisation.startDate'/>" class="form-control" placeholder="dd.mm.yy" type="text"> --%>
<!-- 							</div>									 -->
<!-- 						</div> -->
<%-- 					</s:else> --%>
				<!-- END organisation.startDate -->
				
				<!-- START organisation.endDate -->
<%-- 					<s:if test="fieldErrors.get('organisation.endDate')!=null"> --%>
<!-- 						<div class="form-group has-error"> -->
<%-- 							<label class="col-md-2 control-label"><s:text name="hrm.skill.label.end.date"/></label> --%>
<!-- 							<div class="col-md-10"> -->
<!-- 								<input id="organisation.endDate" name="organisation.endDate" class="form-control" placeholder="dd.mm.yy" type="text"> -->
<%-- 								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('organisation.endDate')"/> </span> --%>
<!-- 							</div>					 -->
<!-- 						</div> -->
<%-- 					</s:if> --%>
<%-- 					<s:else> --%>
<!-- 						<div class="form-group"> -->
<%-- 							<label class="col-md-2 control-label"><s:text name="hrm.skill.label.end.date"/></label> --%>
<!-- 							<div class="col-md-10"> -->
<%-- 								<input id="organisation.endDate" name="organisation.endDate" value="<s:property value='organisation.endDate'/>" class="form-control" placeholder="dd.mm.yy" type="text"> --%>
<!-- 							</div>									 -->
<!-- 						</div> -->
<%-- 					</s:else> --%>
				<!-- END organisation.endDate -->
				
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.active"/></label>
						<div class="col-md-10">
							<input type="checkbox" id="organisation.active" name="organisation.active" value="<s:property value='organisation.active'/>">
						</div>
				</div>
				<!-- START organisation.logo -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="adm.person.label.photo"/></label>
					<div class="col-md-10">
						<input class="btn btn-default btn-file" id="file" name="file" title="Please select logo image" type="file" accept="image/*">
						<p class="help-block">
						</p>
					</div>
				</div>
				<!-- END organisation.logo -->
			</fieldset>
							
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelOrg" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveOrg" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#org_logo").hide();
		if($("#organisation\\.id").val()){
			$("#org_logo").attr("src","data:image/jpeg;base64,<s:property value='org_logo'/>");
			$("#org_logo" ).load(function() {
				$("#org_logo").show();
			});
		}
		$("#organisation\\.active").on('change',function(event){
			if($('#organisation\\.active').is(":checked")){
				$('#organisation\\.active').val("true");
			}else{
				$('#organisation\\.active').val("false");
			}
		});
		
		if($("#organisation\\.active").val()=="true"){
			$("#organisation\\.active").prop('checked',true);
		}
		//http://www.jqueryrain.com/?Bxwy2bPt
		//http://www.jqueryrain.com/demo/jquery-multiselect-plugin/
		$('#munList').tokenize({
		    datas: "InputAdmin.municipality.do",
		    searchParam: 'name_startsWith',
		    newElements: true,
		    valueField: 'id',
		    textField: 'name',
		    dataType: 'json',
		    onAddToken: function(value, text){
// 		    	console.log(value + ", " + text);
			}
		});

		
// 		$('#organisation\\.operLevelVal').val('<s:property value="organisation.operLevelVal.DOMVALUE"/>');
		$('#organisation\\.orgaType').val('<s:property value="organisation.orgaType.DOMVALUE"/>');
// 		$('#organisation\\.operationLevel').val('<s:property value="organisation.operationLevel.DOMVALUE>"/>');
		$('#organisation\\.orgaCategory').val('<s:property value="organisation.orgaCategory.DOMVALUE"/>');
		
// 		$('#organisation\\.startDate').datetimepicker({
// 			lang: 'al',
// 			weeks: true,
// 			format: 'd.m.Y',
// 			mask: false,
// 			formatDate:'d.m.Y',
// 			timepicker: false,
// 		});
// 		$('#organisation\\.endDate').datetimepicker({
// 			lang: 'al',
// 			format: 'd.m.Y',
// 			weeks: true,
// 			mask: false,
// 			formatDate:'d.m.Y',
// 			timepicker: false,
// 			validateOnBlur: false
// 		});
		$("#parent\\.orgaName").select2({
		    placeholder: "<s:text name="organization.placeholder.enter.activity"/>", 
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.organisation.do",
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
		    dropdownAutoWidth: false,
		    formatResult: formatResult,
		    formatSelection: function(item) {
		    	$("#parent\\.id").val(item.id);
		    	$("#parent\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 

		$("#parent\\.orgaName").select2("data", {id: "<s:property value='parent.id'/>", name: "<s:property value="parent.orgaName"/>"});

		$("#cancelOrg").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "Organisation.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#organisation_form_content").html(jqXHR.responseText);
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
		Ladda.bind('#saveOrg');	
		$("#saveOrg").on('click', function () {
			$("#organisation_form :button").prop('disabled','disabled');
			$('#organisation_form').submit();
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
					$("#organisation_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#organisation_form_content").html(jqXHR.responseText);
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
						jQuery("#org_treegrid").trigger("reloadGrid");
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