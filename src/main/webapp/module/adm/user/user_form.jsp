<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div id="user_form_content">
	<!-- widget content -->
	<div class="widget-body">
	<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
		<form id="user_form" class="form-horizontal" action="UserSave.do" accept-charset="utf8" method="post">

			<input type="hidden" id="thisUser.id" name="thisUser.id" value="<s:property value="thisUser.id"/>" />
			<input type="hidden" id="partyUser.id" name="partyUser.id" value="<s:property value='partyUser.id'/>">
			<input type="hidden" id="userPassword.id" name="userPassword.id" value="<s:property value='userPassword.id'/>">
			<input type="hidden" id="userPassword.hashValue" name="userPassword.hashValue" value="<s:property value='userPassword.hashValue'/>">
			<input type="hidden" id="userPassword.passwordStatus" name="userPassword.passwordStatus" value="<s:property value='userPassword.passwordStatus'/>">
			<input type="hidden" id="forPerson" name="forPerson" value="<s:property value='forPerson'/>">
			
			<div class="form-group">
				<label class="col-md-2 control-label"></label>
						<div class="col-md-10">
							<label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="checkForm" checked="checked" id="isPerson" value="isPerson"/>
								<span><s:text name="adm.user.label.person"/></span>
							</label>
							<label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="checkForm" id="isJustUser" value="isJustUser"/>
								<span><s:text name="adm.user.label.just.user"/></span>
							</label>
						</div>
			</div>
			
			<fieldset>
				<legend>*<s:text name="adm.user.legend.user.data"/></legend>
				<div id="person">
					<!-- START thisUser.person -->
					<s:if test="fieldErrors.get('person.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label" for="select-1">*<s:text name="adm.user.label.person"/></label>
							<div class="col-md-10">
								<input id="person.firstName" name="person.firstName" class="form-control" placeholder="<s:text name="adm.user.label.person"/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('person.id')"/> </span>
								<input id="person.id" name="person.id" value="<s:property value='person.id'/>" type="hidden">
							</div>
						</div>														
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label" for="select-1">*<s:text name="adm.user.label.person"/></label>
							<div class="col-md-10">
							<input id="person.firstName" name="person.firstName" value="<s:property value='person.firstName'/>" class="form-control" placeholder="<s:text name="adm.user.label.person"/>" type="text">
							<input id="person.id" name="person.id" value="<s:property value='person.id'/>" type="hidden">
							</div>
						</div>
					</s:else>
					<!-- END thisUser.person -->
				</div>
				<div id="justUser">
					<!-- START thisUser.firstName -->
					<s:if test="fieldErrors.get('thisUser.firstName')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
							<div class="col-md-10">
								<input id="thisUser.firstName" maxlength="30" name="thisUser.firstName" class="form-control" placeholder="<s:text name="label.person.firstname"/>" type="text">
								 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.firstName')" /> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
							<div class="col-md-10">
								<input id="thisUser.firstName" maxlength="30" name="thisUser.firstName" value="<s:property value='thisUser.firstName'/>" class="form-control" placeholder="<s:text name="label.person.firstname"/>" type="text">
							</div>
						</div>
					</s:else>
					<!-- END thisUser.firstName -->
					
					<!-- START thisUser.lastName -->
					<s:if test="fieldErrors.get('thisUser.lastName')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
							<div class="col-md-10">
								<input id="thisUser.lastName" maxlength="30" name="thisUser.lastName" class="form-control" placeholder="<s:text name="label.person.lastname"/>" type="text">
								 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.lastName')" /> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
							<div class="col-md-10">
								<input id="thisUser.lastName" maxlength="30" name="thisUser.lastName" value="<s:property value='thisUser.lastName'/>" class="form-control" placeholder="<s:text name="label.person.lastname"/>" type="text">
							</div>
						</div>
					</s:else>
					<!-- END thisUser.lastName -->
					
				<!-- START thisUser.birthdate -->
				<s:if test="fieldErrors.get('thisUser.birthdate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="thisUser.birthdate" name="thisUser.birthdate"
								class="form-control" placeholder="<s:text name="label.person.birthdate"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('thisUser.birthdate')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="thisUser.birthdate" name="thisUser.birthdate"
								value="<s:property value='thisUser.birthdate'/>"
								class="form-control" placeholder="<s:text name="label.person.birthdate"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END thisUser.birthdate -->
				
				<!-- START thisUser.personalId -->
				<s:if test="fieldErrors.get('employee.personalId')!=null">
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.personal.id"/></label>
					<div class="col-md-10">
						<input id="thisUser.personalId" name="thisUser.personalId"
							value="<s:property value='thisUser.personalId'/>"
							class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>" type="text" data="number">
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.personalId')"/> </span>
					</div>
				</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.personal.id"/></label>
						<div class="col-md-10">
							<input id="thisUser.personalId" name="thisUser.personalId" data="number" value="<s:property value='thisUser.personalId'/>" class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>" type="text">
						</div>
					</div>				
				</s:else>
				<!-- END thisUser.personalId -->
				
				<!-- START thisUser.gender -->
				<s:if test="fieldErrors.get('thisUser.gender')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/></label>
						<div class="col-md-10">
							<label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="thisUser.gender" id="thisUser.gender" value="F">
								<span><s:text name="label.person.female"/></span>
							</label> <label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="thisUser.gender" id="thisUser.gender" value="M">
								<span><s:text name="label.person.male"/></span>
							</label> <span class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('thisUser.gender')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/></label>
						<div class="col-md-10">

							<s:if test='thisUser.gender.toString().equalsIgnoreCase("F")'>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="thisUser.gender" checked="checked"
									id="thisUser.gender" value="F"> <span><s:text name="label.person.female"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="thisUser.gender" id="thisUser.gender"
									value="M"> <span><s:text name="label.person.male"/></span>
								</label>
							</s:if>
							<s:elseif test='thisUser.gender.toString().equalsIgnoreCase("M")'>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="thisUser.gender" id="thisUser.gender"
									value="F"> <span><s:text name="label.person.female"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="thisUser.gender" checked="checked"
									id="thisUser.gender" value="M"> <span><s:text name="label.person.male"/></span>
								</label>
							</s:elseif>
							<s:else>
								<label class="radio radio-inline"> <input type="radio" class="radiobox" name="thisUser.gender"  id="thisUser.gender" value="F"> <span><s:text name="label.person.female"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio" class="radiobox" name="thisUser.gender"  id="thisUser.gender" value="M"> <span><s:text name="label.person.male"/></span>
								</label>
						</s:else>
						</div>
					</div>
				</s:else>
				<!-- END thisUser.gender -->
				</div>
				
				
				
				<!-- START thisUser.email -->
					<s:if test="fieldErrors.get('thisUser.email')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="finance.contractor.label.email"/></label>
							<div class="col-md-10">
								<input id="thisUser.email" maxlength="50" name="thisUser.email" class="form-control" placeholder="<s:text name="finance.contractor.label.email"/>" type="email">
								 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.email')" /> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="finance.contractor.label.email"/></label>
							<div class="col-md-10">
								<input id="thisUser.email" maxlength="50" name="thisUser.email" value="<s:property value='thisUser.email'/>" class="form-control" placeholder="<s:text name="finance.contractor.label.email"/>" type="email">
							</div>
						</div>
					</s:else>
				<!-- END thisUser.email -->

				<!-- START thisUser.phone -->
					<s:if test="fieldErrors.get('thisUser.phone')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="adm.user.grid.phone"/></label>
							<div class="col-md-10">
								<input id="thisUser.phone" maxlength="50" name="thisUser.phone" class="form-control" placeholder="<s:text name="adm.user.grid.phone"/>" type="text">
								 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.phone')" /> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="adm.user.grid.phone"/></label>
							<div class="col-md-10">
								<input id="thisUser.phone" maxlength="50" name="thisUser.phone" value="<s:property value='thisUser.phone'/>" class="form-control" placeholder="<s:text name="adm.user.grid.phone"/>" type="text">
							</div>
						</div>
					</s:else>
				<!-- END thisUser.phone -->		
				
				<!-- START thisUser.mobile -->
					<s:if test="fieldErrors.get('thisUser.mobile')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="adm.user.grid.mobile"/></label>
							<div class="col-md-10">
								<input id="thisUser.mobile" maxlength="50" name="thisUser.mobile" class="form-control" placeholder="<s:text name="adm.user.grid.mobile"/>" type="text">
								 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.mobile')" /> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="adm.user.grid.mobile"/></label>
							<div class="col-md-10">
								<input id="thisUser.mobile" maxlength="50" name="thisUser.mobile" value="<s:property value='thisUser.mobile'/>" class="form-control" placeholder="<s:text name="adm.user.grid.mobile"/>" type="text">
							</div>
						</div>
					</s:else>
				<!-- END thisUser.mobile -->
								
				<!-- START thisUser.username -->
				<s:if test="fieldErrors.get('thisUser.username')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="adm.user.label.username" /></label>
						<div class="col-md-10">
							<input id="thisUser.username" maxlength="50" name="thisUser.username" class="form-control" placeholder="<s:text name="adm.user.label.username" />" type="text">
							 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.username')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="adm.user.label.username" /></label>
						<div class="col-md-10">
							<input id="thisUser.username" maxlength="50" name="thisUser.username" value="<s:property value='thisUser.username'/>" class="form-control" placeholder="<s:text name="adm.user.label.username" />" type="text">
						</div>
					</div>
				</s:else>
				<!-- END thisUser.username -->
				<s:if test="thisUser.id">
					<div id="reset">
						<!-- START thisUser.active -->
						<div class="form-group">
								<label class="col-md-2 control-label"><s:text name="adm.user.reset.password"/></label>
								<div class="col-md-10">
									<input id="resetCheckbox" name="resetCheckbox"  type="checkbox">
									<input type="hidden" id="resetPassword" name="resetPassword" value="<s:property value='resetPassword'/>">
								</div>
						</div>
						<!-- END thisUser.active -->
					</div>
				</s:if>
				<div id="password">
					<!-- START thisUser.password -->
					<s:if test="fieldErrors.get('thisUser.password')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="login.form.password"/></label>
							<div class="col-md-10">
								<input id="userPassword.password" maxlength="100" name="userPassword.password" class="form-control" placeholder="<s:text name="login.form.password"/>" type="password">
								 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.password')" /> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="login.form.password"/></label>
							<div class="col-md-10">
								<input id="userPassword.password" maxlength="100" name="userPassword.password" value="<s:property value='userPassword.password'/>" class="form-control" placeholder="<s:text name="login.form.password"/>" type="password">
							</div>
						</div>
					</s:else>
					<!-- END thisUser.password -->
					
					<!-- START passwordRepeat -->
					<s:if test="fieldErrors.get('passwordRepeat')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="login.form.password.repeat"/></label>
							<div class="col-md-10">
								<input id="passwordRepeat" maxlength="100" name="passwordRepeat" class="form-control" placeholder="<s:text name="login.form.password"/>" type="password">
								 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('passwordRepeat')" /> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="login.form.password.repeat"/></label>
							<div class="col-md-10">
								<input id="passwordRepeat" maxlength="100" name="passwordRepeat" value="<s:property value='passwordRepeat'/>" class="form-control" placeholder="<s:text name="login.form.password"/>" type="password"/>
							</div>
						</div>
					</s:else>
					<!-- END passwordRepeat -->
				</div>
				
				<!-- START user.role -->
				<s:if test="fieldErrors.get('rbacRoles')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="adm.user.label.roles"/></label>
						<div class="col-md-10">
						<div class="input-group btn-group">
								<select class="form-col-md-10" id="rbacRoles" name="rbacRoles" multiple="multiple">
									<s:iterator value="rbacRoleList" var="rbl">
										<s:iterator value="rbacRoles" var="rb">
											<s:if test="%{#rbl.id==#rb}">
												<option value="<s:property value="id"/>" selected="selected" style="color:blue">
													<s:if test="%{#lang=='al'}">
														<s:property value="name"/>
													</s:if>
													<s:elseif test="%{#lang=='en'}">
														<s:property value="nameEn"/>
													</s:elseif>
													<s:elseif test="%{#lang=='sr'}">
														<s:property value="nameSr"/>
													</s:elseif>
												</option>										
											</s:if>
											<s:else>
												<option value="<s:property value="id"/>">
													<s:if test="%{#lang=='al'}">
														<s:property value="name"/>
													</s:if>
													<s:elseif test="%{#lang=='en'}">
														<s:property value="nameEn"/>
													</s:elseif>
													<s:elseif test="%{#lang=='sr'}">
														<s:property value="nameSr"/>
													</s:elseif>
												</option>
											</s:else>
										</s:iterator> 
									</s:iterator>						
								</select>
							</div>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('rbacRoles')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
						<label class="col-md-2 control-label" for="role">*<s:text name="adm.user.label.roles"/></label>
						<div class="col-md-10">
							<div class="input-group btn-group">
								<select class="form-col-md-10" id="rbacRoles" name="rbacRoles" multiple="multiple">
									<s:iterator value="rbacRoleList" var="rbl">
										<s:iterator value="rbacRoles" var="rb">
											<s:if test="%{#rbl.id==#rb}">
												<option value="<s:property value="id"/>" selected="selected" style="color:blue">
													<s:if test="%{#lang=='al'}">
														<s:property value="name"/>
													</s:if>
													<s:elseif test="%{#lang=='en'}">
														<s:property value="nameEn"/>
													</s:elseif>
													<s:elseif test="%{#lang=='sr'}">
														<s:property value="nameSr"/>
													</s:elseif>
												</option>										
											</s:if>
											<s:else>
												<option value="<s:property value="id"/>">
													<s:if test="%{#lang=='al'}">
														<s:property value="name"/>
													</s:if>
													<s:elseif test="%{#lang=='en'}">
														<s:property value="nameEn"/>
													</s:elseif>
													<s:elseif test="%{#lang=='sr'}">
														<s:property value="nameSr"/>
													</s:elseif>
												</option>
											</s:else>
										</s:iterator> 
									</s:iterator>						
								</select>
							</div>
						</div>
					</div>
				</s:else>
				<!-- END user.role -->
				
				<div>
				<s:iterator value="rbacRoleList" var="rbl">
								<div>
								<s:property value="name"/>
								</div>
				</s:iterator>
				</div>
				
				<!-- START thisUser.active -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dp.doc.category.isactive"/></label>
						<div class="col-md-10">
							<input id="thisUser.active" name="thisUser.active"  value="<s:property value='thisUser.active'/>" type="checkbox">
						</div>
				</div>
				<!-- END thisUser.active -->
			<input type="hidden" id="roles" value='<s:property value="roles"/>'>
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelUser" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveUser" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
	$("#thisUser\\.phone").mask("+" + "999-99-999-999");
	$("#thisUser\\.mobile").mask("+" + "999-99-999-999");
	var validator = $( "#user_form" ).validate();
	validator.element( "#thisUser\\.email" );
	
	$('#thisUser\\.birthdate').datetimepicker({
		lang: '<s:property value="#lang"/>',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		timepicker: false,
	});
	
	$("#thisUser\\.personalId").mask("9999999999");

	$("#person\\.firstName").select2({
	    placeholder: "", 
	    minimumInputLength: 1,
	    ajax: {
	        url: "Input.person.do",
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
	    	$("#person\\.id").val(item.id);
	    	$("#person\\.firstName").val(item.name);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	}); 

	$("#person\\.firstName").select2("data", {id: "<s:property value='person.id'/>", name: "<s:property value="person.firstName"/> <s:property value="person.lastName"/>"});

	$('#rbacRoles').multiselect({
		filterBehavior: 'both',
		buttonContainer: '<div class="btn-group" />',
		numberDisplayed: 1,
		enableFiltering: true,
		includeSelectAllDivider: true,
		selectAllValue: 'multiselect-all',
		maxHeight: 200,
	 });

	/*
	<s:iterator value="rbacRoles" var="rb">
		$("#rbacRoles").multiselect('select', "<s:property value='#rb'/>");
	</s:iterator>
	*/	 
	
	$('#thisUser\\.active').on('change',function(event){
		$('#thisUser\\.active').val($('#thisUser\\.active')[0].checked ? "true" : "false" );
	});

	var crest=false;
	<s:if test="thisUser.id">
		
		$('#password').hide();
		$("#reset").show();
		
		if($("#resetPassword").val()=='true'){
			$('#password').show();
			$("#resetCheckbox").prop('checked',true);
		}
		if($("#resetCheckbox").is(":checked")){
			crest=true;
			$('#resetPassword').val(crest);
			if(crest==true){
				$('#password').show();
			}else{
				$('#password').hide();
			}
		}
		$("#resetCheckbox").on('change',function(event){
			crest=(!crest);
			$('#resetPassword').val(crest);
			if(crest==true){
				$('#password').show();
			}else{
				$('#password').hide();
			}
		});
	</s:if>		
	$('#thisUser\\.active').val('<s:property value="thisUser.active"/>');
	if($('#thisUser\\.active').val()=='true'){
		$('#thisUser\\.active').prop('checked', true);
	};
	$("#person").hide();

	if($('#forPerson').val() === 'true'){
		$("#person").show();
		$("#justUser").hide();
		jQuery("#isPerson").attr('checked', 'checked');
		$("#parentPerson").show();
	}else{
		$("#person").hide();
		$("#justUser").show();
		jQuery("#isJustUser").attr('checked', 'checked');
	}

	$("#user_form input[name='checkForm']").click(function(){
		   
	    if($('input:radio[name=checkForm]:checked').val() == "isPerson"){
			$.ajax({
				type : "GET",
				url : "User.form.do?forPerson=true",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { 
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#user_form_content").html(jqXHR.responseText);
				},
				complete : function(jqXHR, textStatus) {
				}
			});
	     	$("#person").show();
	     	$("#justUser").hide();
	     	$("#isPerson").attr('checked', 'checked');
	     	$("#person\\.firstName").attr('placeholder', 'Please search for person');
	     	$("#parentPerson").show();
	    }

	    if($('input:radio[name=checkForm]:checked').val() == "isJustUser"){
		    $.ajax({
					type : "GET",
					url : "User.form.do?forPerson=false",
					async : false,
					beforeSend : function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
						alert("error:" + errorThrown + ", status:" + status);
					},
					success : function(data, status, jqXHR) { // on success..
						$("#user_form_content").html(jqXHR.responseText);
					},
					complete : function(jqXHR, textStatus) {
					}
				});
		    	$("#person").hide();
				$("#justUser").show();
				jQuery("#isJustUser").attr('checked', 'checked');
		    }
	});
	
	$("#cancelUser").on('click', function() {
		$.ajax({
			type : "GET",
			url : "User.form.do",
			async : false,
			beforeSend : function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			success : function(data, status, jqXHR) { // on success..
				$("#user_form_content").html(jqXHR.responseText);
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
	
	Ladda.bind('#saveUser');
	$("#saveUser").on('click', function() {
		if($('#user_form').valid()){
			$("#user_form :button").prop('disabled','disabled');
			$('#user_form').submit();
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
				$("#user_form_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
				$("#user_form_content").html(jqXHR.responseText);
				$("#rbacRoles").val("");
				var errors_exits = jqXHR.getResponseHeader("errors_exists");
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
					jQuery("#user_grid").trigger("reloadGrid");
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
		$("#user_form :button").prop('disabled',false);				
	})();		
	
});
	
</script>