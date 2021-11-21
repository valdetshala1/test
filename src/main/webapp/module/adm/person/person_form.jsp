<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
	<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
		<form id="person_form" class="form-horizontal" action="PersonSave.do"
			accept-charset="utf8" method="post">
			
			<input type="hidden" id="person.id" name="person.id"
				value="<s:property value="person.id"/>" />
			<input type="hidden" id="personId" name="personId"
				value="<s:property value="person.id"/>" />				
			<input type="hidden" id="address.id" name="address.id"
				value="<s:property value="address.id"/>" />
<%-- 			<s:if test="personId!=null"> --%>
			<input type="hidden" id="partyRole.id" name="partyRole.id"
				value="<s:property value="partyRole.id"/>" />
				
			<input type="hidden" id="codeRole" name="codeRole"
			value="<s:property value="codeRole"/>" />
				
				<div class="col-sm-3" id="picture">
				<br>
					<img id="myPhoto" src="" border="0" width="150" height="150"/>
				</div>
			<fieldset>
				<legend><s:text name="adm.person.label.person.data"/></legend>

				<!-- START person.firstName -->
				<s:if test="fieldErrors.get('person.firstName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="person.firstName" maxlength="30" name="person.firstName"
								class="form-control" placeholder="<s:text name="label.person.firstname"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:text name="person.firstName.empty" /> </span>
						</div>
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('person.firstName.invalid.char')!=null">
				<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="person.firstName" maxlength="30" name="person.firstName" class="form-control" placeholder="<s:text name="label.person.firstname"/>" >					
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.field.invalid.char'/> </span>
						</div>					
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="person.firstName" maxlength="30" name="person.firstName"
								value="<s:property value='person.firstName'/>"
								class="form-control" placeholder="<s:text name="label.person.firstname"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END person.firstName -->

				<!-- START person.lastName -->
				<s:if test="fieldErrors.get('person.lastName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
						<div class="col-md-10">
							<input id="person.lastName" maxlength="30" name="person.lastName"
								class="form-control" placeholder="<s:text name="label.person.lastname"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:text name="person.lastName.empty"/> </span>
						</div>
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('person.lastName.invalid.char')!=null">
				<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="person.lastName" maxlength="30" name="person.lastName" class="form-control" placeholder="<s:text name="label.person.lastname"/>" type="text">					
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.field.invalid.char'/> </span>
						</div>					
				</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
						<div class="col-md-10">
							<input id="person.lastName" maxlength="30" name="person.lastName"
								value="<s:property value='person.lastName'/>"
								class="form-control" placeholder="<s:text name="label.person.lastname"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END person.lastName -->

				<!-- START person.birthdate -->
				<s:if test="fieldErrors.get('person.birthdate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="person.birthdate" name="person.birthdate"
								class="form-control" placeholder="<s:text name="label.person.birthdate"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:text name="person.birthdate.empty" /> </span>
						</div>
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('person.birthdate.to.large')!=null">
				<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="person.birthdate" name="person.birthdate"
								class="form-control" placeholder="<s:text name="label.person.birthdate"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property value="fieldErrors.get('person.birthdate.to.large')"/> </span>
						</div>
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="person.birthdate" name="person.birthdate"
								value="<s:property value='person.birthdate'/>"
								class="form-control" placeholder="<s:text name="label.person.birthdate"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END person.birthdate -->
				
				<!-- START person.personalId -->
				<s:if test="fieldErrors.get('person.personalId')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.personal.id"/></label>
						<div class="col-md-10">
							<input id="person.personalId" maxlength="20" name="person.personalId"
								class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:text name="person.personalId.empty" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.personal.id"/></label>
						<div class="col-md-10">
							<input id="person.personalId" maxlength="20" name="person.personalId"
								value="<s:property value='person.personalId'/>"
								class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END person.personalId -->

				<!-- START person.degree -->
<%-- 				<s:if test="fieldErrors.get('person.degree')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="hum.employee.label.degree"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<!-- 							<input id="person.degree" maxlength="20" name="person.degree" -->
<%-- 								class="form-control" placeholder="<s:text name="hum.employee.label.degree"/>" --%>
<%-- 								type="text"> <span class="help-block"><i --%>
<%-- 								class="fa fa-warning"></i> <s:property --%>
<%-- 									value="fieldErrors.get('person.degree')" /> </span> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="hum.employee.label.degree"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<!-- 							<input id="person.degree" maxlength="20" name="person.degree" -->
<%-- 								value="<s:property value='person.degree'/>" class="form-control" --%>
<%-- 								placeholder="<s:text name="hum.employee.label.degree"/>" type="text"> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END person.degree -->
				<!-- START person.gender -->
				<s:if test="fieldErrors.get('person.gender')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/></label>
						<div class="col-md-10">
							<label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="person.gender" id="person.gender" value="F">
								<span><s:text name="label.person.female"/></span>
							</label> <label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="person.gender" id="person.gender" value="M">
								<span><s:text name="label.person.male"/></span>
							</label> <span class="help-block"><i class="fa fa-warning"></i> <s:text
							name="person.gender.empty" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/></label>
						<div class="col-md-10">

							<s:if test='person.gender.toString().equalsIgnoreCase("F")'>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="person.gender" checked="checked"
									id="person.gender" value="F"> <span><s:text name="label.person.female"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="person.gender" id="person.gender"
									value="M"> <span><s:text name="label.person.male"/></span>
								</label>
							</s:if>
							<s:elseif test='person.gender.toString().equalsIgnoreCase("M")'>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="person.gender" id="person.gender"
									value="F"> <span><s:text name="label.person.female"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="person.gender" checked="checked"
									id="person.gender" value="M"> <span><s:text name="label.person.male"/></span>
								</label>
							</s:elseif>
							<s:else>
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" id="person.gender" name="person.gender" value="FEMALE" />
								<span><s:text name="label.person.female"/></span>
							</label>
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" id="person.gender" name="person.gender" value="MALE" />
								<span><s:text name="label.person.male"/></span>
							</label>
						</s:else>
						</div>
					</div>
				</s:else>
				<!-- END person.gender -->
				<!-- STRAT person.ethnicity -->	
				<s:if test="fieldErrors.get('person.ethnicity')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.ethnicity"/></label>
							<div class="col-md-10">
								<select class="form-control" id="person.ethnicity" name="person.ethnicity">
									<s:iterator value="ethnicitieList" var="el">
										<option value="<s:property value="#el.getDOMVALUE()" />">
											<s:if test="%{#lang=='al'}">
												<s:property value="#el.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{#lang=='sr'}">
												<s:property value="#el.getDOMTEXT_SR()" />
											</s:elseif>
											<s:else>
												<s:property value="#el.getDOMTEXT_EN()" />
											</s:else>
										</option>
									</s:iterator>						
								</select>
								<span class="help-block"><i class="fa fa-warning"></i>
									<s:text name="person.ethnicity.empty"/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hum.employee.label.ethnicity"/></label>
						<div class="col-md-10">
							<select class="form-control" id="person.ethnicity" name="person.ethnicity">
								<s:iterator value="ethnicitieList" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
												<s:property value="#el.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{#lang=='sr'}">
												<s:property value="#el.getDOMTEXT_SR()" />
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
				<!-- END employee.conctractType -->
				<!-- START person.persWithLmtAbilities -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.persWithLmtAbilities"/></label>
						<div class="col-md-10">
							<input id="person.persWithLmtAbilities" name="person.persWithLmtAbilities"  value="<s:property value='person.persWithLmtAbilities'/>" type="checkbox">
						</div>
				</div>
				<!-- END person.persWithLmtAbilities -->
				
				<!-- START person.role -->
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="hum.employee.label.role.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="partyRole.roleCode" name="partyRole.roleCode">
							<option></option>
								<s:iterator value="personrole" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
											<s:if test="%{#lang=='al'}">
												<s:property value="#el.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{#lang=='sr'}">
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
				<!-- END person.role -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dp.doc.category.isactive"/></label>
						<div class="col-md-10">
							<input type="checkbox" id="person.active" name="person.active" value="<s:property value='person.active'/>">
						</div>
				</div>	
				<!-- START person.notes -->
				<s:if test="fieldErrors.get('person.notes')!=null"> 
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<input id="person.notes" name="person.notes" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('person.notes')"/></span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="person.notes" name="person.notes" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='person.notes'/></textarea>
						</div>									
					</div>
				</s:else>
				<!-- END person.notes -->
				<!-- START person.photo -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="adm.person.label.photo"/></label>
					<div class="col-md-10">
						<input class="btn btn-default btn-file" id="file" name="file" title="Please select photo file" type="file" accept="image/*">
						<p class="help-block">
						</p>
					</div>
				</div>
				<!-- END person.photo -->
				
				<!-- START parent.person -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="adm.person.label.parent.person"/></label>
					<div class="col-md-10">
					
						<input id="parentPerson.firstName" name="parentPerson.firstName"
							value="<s:property value='parentPerson.firstName'/>"
							class="form-control" placeholder="Please search for parent person. It's not mandatory." type="text">
							<input id="parentPerson.id" name="parentPerson.id" value='<s:property value="parentPerson.id"/>' type="hidden">
					</div>
				</div>
				<!-- END parent.person-->
								
				
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.person.label.add.address"/></label>
						<div class="col-md-10">
							<input id="check" name="check" type="checkbox" >
							<input type="hidden" id="checkAddress" name="checkAddress" value="<s:property value='checkAddress'/>">
						</div>
					</div>
				<!-- START address -->
				<div id="address">
					<!-- START address.street -->
						<s:if test="fieldErrors.get('address.street')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.person.label.street"/></label>
							<div class="col-md-10">
								<input id="address.street"  maxlength="80" name="address.street"
									class="form-control" placeholder="<s:text name="adm.person.label.street"/>"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:text name="address.street.empty"/> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label">*<s:text name="adm.person.label.street"/></label>
								<div class="col-md-10">
									<input id="address.street" maxlength="80" name="address.street"
										value="<s:property value='address.street'/>" class="form-control"
										placeholder="<s:text name="adm.person.label.street"/>" type="text">
								</div>
							</div>
						</s:else>
					<!-- END address.street -->
					<!-- START address.homeNr -->
						<s:if test="fieldErrors.get('address.homeNr')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.person.label.home.number"/></label>
							<div class="col-md-10">
								<input id="address.homeNr" maxlength="5" name="address.homeNr"
									class="form-control" placeholder="<s:text name="adm.person.label.home.number"/>"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:text name="address.homeNr.empty"/> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label">*<s:text name="adm.person.label.home.number"/></label>
								<div class="col-md-10">
									<input id="address.homeNr" maxlength="5" name="address.homeNr"
										value="<s:property value='address.homeNr'/>" class="form-control"
										placeholder="<s:text name="adm.person.label.home.number"/>" type="text">
								</div>
							</div>
						</s:else>
					<!-- END address.homeNr -->
					<!-- START address.zipCode -->
						<s:if test="fieldErrors.get('address.zipCode')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.person.label.zip.code"/></label>
							<div class="col-md-10">
								<input id="address.zipCode" maxlength="5" name="address.zipCode"
									class="form-control" placeholder="<s:text name="adm.person.label.zip.code"/>"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:text name="address.zipCode.empty"/> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label">*<s:text name="adm.person.label.zip.code"/></label>
								<div class="col-md-10">
									<input id="address.zipCode" maxlength="5" name="address.zipCode"
										value="<s:property value='address.zipCode'/>" class="form-control"
										placeholder="<s:text name="adm.person.label.zip.code"/>" type="text">
								</div>
							</div>
						</s:else>
					<!-- END address.zipCode -->
					<!-- START address.place -->
						<s:if test="fieldErrors.get('address.place')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.person.label.place"/></label>
							<div class="col-md-10">
								<input id="address.place" maxlength="50" name="address.place"
									class="form-control" placeholder="<s:text name="adm.person.label.place"/>"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:text name="address.place.empty"/> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label">*<s:text name="adm.person.label.place"/></label>
								<div class="col-md-10">
									<input id="address.place" maxlength="50" name="address.place"
										value="<s:property value='address.place'/>" class="form-control"
										placeholder="<s:text name="adm.person.label.place"/>" type="text">
								</div>
							</div>
						</s:else>
					<!-- END address.place -->
					<!-- START address.country -->
						<s:if test="fieldErrors.get('address.country')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="adm.person.label.country"/></label>
							<div class="col-md-10">
								<input id="address.country" maxlength="50" name="address.country"
									class="form-control" placeholder="<s:text name="adm.person.label.country"/>"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('address.country')" /> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label"><s:text name="adm.person.label.country"/></label>
								<div class="col-md-10">
									<input id="address.country" maxlength="50" name="address.country"
										value="<s:property value='address.country'/>" class="form-control"
										placeholder="<s:text name="adm.person.label.country"/>" type="text">
								</div>
							</div>
						</s:else>
					<!-- END address.country -->
					<!-- START address.phone -->
						<s:if test="fieldErrors.get('address.phone')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="bidder.contact.phone"/></label>
							<div class="col-md-10">
								<input id="address.phone" name="address.phone"
									class="form-control" placeholder="<s:text name="bidder.contact.phone"/>"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('address.phone')" /> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label"><s:text name="bidder.contact.phone"/></label>
								<div class="col-md-10">
									<input id="address.phone" name="address.phone"
										value="<s:property value='address.phone'/>" class="form-control"
										placeholder="<s:text name="bidder.contact.phone"/>" type="text">
								</div>
							</div>
						</s:else>
					<!-- END address.phone -->
					<!-- START address.mobile -->
						<s:if test="fieldErrors.get('address.mobile')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="hum.employee.label.mobile.phone"/></label>
							<div class="col-md-10">
								<input id="address.mobile" name="address.mobile"
									class="form-control" placeholder="<s:text name="hum.employee.label.mobile.phone"/>"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('address.mobile')" /> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label"><s:text name="hum.employee.label.mobile.phone"/></label>
								<div class="col-md-10">
									<input id="address.mobile" name="address.mobile"
										value="<s:property value='address.mobile'/>" class="form-control"
										placeholder="<s:text name="hum.employee.label.mobile.phone"/>" type="text">
								</div>
							</div>
						</s:else>
					<!-- END address.mobile -->
					<!-- START address.email -->
						<s:if test="fieldErrors.get('address.email')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="hum.employee.label.email"/></label>
							<div class="col-md-10">
								<input id="address.email" maxlength="50" name="address.email"
									class="form-control" placeholder="<s:text name="hum.employee.label.email"/>"
									type="email"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('address.email')" /> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label"><s:text name="hum.employee.label.email"/></label>
								<div class="col-md-10">
									<input id="address.email" maxlength="50" name="address.email"
										value="<s:property value='address.email'/>" class="form-control"
										placeholder="<s:text name="hum.employee.label.email"/>" type="email">
								</div>
							</div>
						</s:else>
					<!-- END address.email -->
					<!-- START address.notes -->
				<s:if test="fieldErrors.get('address.notes')!=null"> 
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="adm.person.label.address.notes"/></label>
						<div class="col-md-10">
							<input id="address.notes" maxlength="255" name="address.notes" class="form-control" placeholder="<s:text name="adm.person.label.address.notes"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('address.notes')"/></span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.person.label.address.notes"/></label>
						<div class="col-md-10">
							<textarea id="address.notes" maxlength="255" name="address.notes" class="form-control" placeholder="<s:text name="adm.person.label.address.notes"/>"><s:property value='address.notes'/></textarea>
						</div>									
					</div>
				</s:else>
					<!-- END address.notes -->
				</div>
				<!-- END address -->
				
			</fieldset>

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
<!-- end widget -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#person\\.active").on('change',function(event){
			if($('#person\\.active').is(":checked")){
				$('#person\\.active').val("true");
			}else{
				$('#person\\.active').val("false");
			}
		});
		
		if($("#person\\.active").val()=="true"){
			$("#person\\.active").prop('checked',true);
		}
		$("#address\\.zipCode").autoNumeric('init',{aSep:'', mDec: '0',vMax:'99999'});


		$('#person\\.persWithLmtAbilities').on('change',function(event){
			$('#person\\.persWithLmtAbilities').val($('#person\\.persWithLmtAbilities')[0].checked ? "true" : "false" );
		});

		if($("#person\\.persWithLmtAbilities").val()=="true"){
			$("#person\\.persWithLmtAbilities").prop('checked',true);
		}		


		
// 		var validator = $( "#person_form" ).validate();
// 		validator.element( "#address\\.email" );
		$("#address\\.phone").mask("+" + "999-99-999-999");
		$("#address\\.mobile").mask("+" + "999-99-999-999");
		$("#person\\.personalId").mask("9999999999");
		$('#person\\.birthdate').datetimepicker({
			lang: '<s:property value="#lang"/>',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});
		$("#picture").hide();
		if($("#person\\.id").val()){
			$("#myPhoto").attr("src","data:image/jpeg;base64,<s:property value='photo'/>");
			$("#myPhoto" ).load(function() {
				$("#picture").show();
			});
		}
// 		alert($('#roleCode').val());
		if($('#codeRole').val()){
			$('#partyRole\\.roleCode').val('<s:property value="partyRole.roleCode.DOMVALUE"/>');
		}
		$('#person\\.ethnicity').val('<s:property value="person.ethnicity.DOMVALUE"/>');



		
		$("#parentPerson\\.firstName").select2({
		    placeholder: "", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.employee.do",
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
		    	$("#parentPerson\\.id").val(item.id);
		    	$("#parentPerson\\.firstName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 

		$("#parentPerson\\.firstName").select2("data", {id: "<s:property value='parentPerson.id'/>", name: "<s:property value="parentPerson.firstName"/> <s:property value="parentPerson.lastName"/>"});
		
		$("#cancel").on('click', function() {
			
			$.ajax({
				type : "GET",
				url : "Person.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#person_form_content").html(jqXHR.responseText);
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
			if($("#location").val()!='person_grid'){
				$("#person_form_content").dialog('close');
			}
			return false;
		});
		Ladda.bind('#save');
		$("#save").on('click', function() {
// 			alert($("#person_form").valid());
			if($("#person_form").valid()){
				$("#person_form :button").prop('disabled','disabled');
				$('#person_form').submit();}
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
					$("#person_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#person_form_content").html(jqXHR.responseText);
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
						jQuery("#person_grid").trigger("reloadGrid");
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
			$("#person_form :button").prop('disabled',false);			
		})();
		$("#address").hide();
		$(check).on('change',function(event){
			$('#checkAddress').val($(check)[0].checked ? "true" : "false");
			if($('#checkAddress').val()=="true"){
				 $("#address").show();
				 }
			else{
					$("#address").hide();
				}
		});
		if($("#address\\.id").val().length>0){
			$('#checkAddress').val(true);
			$('#check').prop('checked',true);
			c=true;
		}
		if($('#checkAddress').val()=="true" || $('#check').is(":checked")){
			 $("#address").show();
			 $('#check').prop('checked',true);
			 }
		else{	
				$("#address").hide();
			}
		if($("#person\\.id").val()){
			$("#parentPerson\\.firstName").val('<s:property value="parentPerson.firstName"/> <s:property value="parentPerson.lastName"/>');
		}
		});

	
</script>