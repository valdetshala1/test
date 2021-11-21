<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div id="persforestowner_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
	<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
	<input type="hidden" id="lang" name="lang" value="<s:property value="locale.language"/>" />
		<form id="persforestowner_form" class="form-horizontal" action="ForestOwnerSave.do"
			accept-charset="utf8" method="post">
			
			<input type="hidden" id="persforestowner.id" name="persforestowner.id"
				value="<s:property value="persforestowner.id"/>" />
			<input type="hidden" id="persforestownerId" name="persforestownerId"
				value="<s:property value="persforestowner.id"/>" />				
			<input type="hidden" id="address.id" name="address.id"
				value="<s:property value="address.id"/>" />
			<input type="hidden" id="thisUser.id" name="thisUser.id"
				value="<s:property value="thisUser.id"/>" />
				
<%-- 			<s:if test="persforestownerId!=null"> --%>
				
				<div class="col-sm-3" id="picture">
				<br>
<!-- 				<fieldset> -->
<%-- 					<img src="myAction.do?employeeId=<s:property value="persforestowner.id"/>" border="0" width="100" height="100"/> --%>
					<img id="myPhoto" src="" border="0" width="150" height="150"/>
<!-- 				</fieldset> -->
				</div>
<%-- 			</s:if> --%>
			<fieldset>
				<legend><s:text name="adm.person.label.person.data"/></legend>

				<!-- START persforestowner.firstName -->
				<s:if test="fieldErrors.get('person.firstName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="persforestowner.firstName" maxlength="30" name="persforestowner.firstName"
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
							<input id="persforestowner.firstName" maxlength="30" name="persforestowner.firstName" class="form-control" placeholder="<s:text name="label.person.firstname"/>" >					
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.field.invalid.char'/> </span>
						</div>					
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="persforestowner.firstName" maxlength="30" name="persforestowner.firstName"
								value="<s:property value='persforestowner.firstName'/>"
								class="form-control" placeholder="<s:text name="label.person.firstname"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END persforestowner.firstName -->

				<!-- START persforestowner.lastName -->
				<s:if test="fieldErrors.get('person.lastName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
						<div class="col-md-10">
							<input id="persforestowner.lastName" maxlength="30" name="persforestowner.lastName"
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
							<input id="persforestowner.lastName" maxlength="30" name="persforestowner.lastName" class="form-control" placeholder="<s:text name="label.person.lastname"/>" type="text">					
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.field.invalid.char'/> </span>
						</div>					
				</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
						<div class="col-md-10">
							<input id="persforestowner.lastName" maxlength="30" name="persforestowner.lastName"
								value="<s:property value='persforestowner.lastName'/>"
								class="form-control" placeholder="<s:text name="label.person.lastname"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END persforestowner.lastName -->

				<!-- START persforestowner.birthdate -->
				<s:if test="fieldErrors.get('person.birthdate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="persforestowner.birthdate" name="persforestowner.birthdate"
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
							<input id="persforestowner.birthdate" name="persforestowner.birthdate"
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
							<input id="persforestowner.birthdate" name="persforestowner.birthdate"
								value="<s:property value='persforestowner.birthdate'/>"
								class="form-control" placeholder="<s:text name="label.person.birthdate"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END persforestowner.birthdate -->
				<!-- START person.personalId -->
				<s:if test="fieldErrors.get('person.personalId')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.personal.id"/></label>
						<div class="col-md-10">
							<input id="persforestowner.personalId" maxlength="20" name="persforestowner.personalId"
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
							<input id="persforestowner.personalId" maxlength="20" name="persforestowner.personalId"
								value="<s:property value='persforestowner.personalId'/>"
								class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END person.personalId -->
				
				
				
				<!-- START person.degree -->
				<s:if test="fieldErrors.get('person.degree')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.degree"/></label>
						<div class="col-md-10">
							<input id="persforestowner.degree" maxlength="20" name="persforestowner.degree"
								class="form-control" placeholder="<s:text name="hum.employee.label.degree"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('person.degree')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.degree"/></label>
						<div class="col-md-10">
							<input id="persforestowner.degree" maxlength="20" name="persforestowner.degree"
								value="<s:property value='persforestowner.degree'/>" class="form-control"
								placeholder="<s:text name="hum.employee.label.degree"/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END persforestowner.degree -->
				<!-- START persforestowner.gender -->
				<s:if test="fieldErrors.get('person.gender')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/></label>
						<div class="col-md-10">
							<label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="persforestowner.gender" id="persforestowner.gender" value="F">
								<span><s:text name="label.person.female"/></span>
							</label> <label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="persforestowner.gender" id="persforestowner.gender" value="M">
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

							<s:if test='persforestowner.gender.toString().equalsIgnoreCase("F")'>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="persforestowner.gender" checked="checked"
									id="persforestowner.gender" value="F"> <span><s:text name="label.person.female"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="persforestowner.gender" id="persforestowner.gender"
									value="M"> <span><s:text name="label.person.male"/></span>
								</label>
							</s:if>
							<s:elseif test='persforestowner.gender.toString().equalsIgnoreCase("M")'>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="persforestowner.gender" id="persforestowner.gender"
									value="F"> <span><s:text name="label.person.female"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="persforestowner.gender" checked="checked"
									id="persforestowner.gender" value="M"> <span><s:text name="label.person.male"/></span>
								</label>
							</s:elseif>
							<s:else>
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" id="persforestowner.gender" name="persforestowner.gender" value="FEMALE" />
								<span><s:text name="label.person.female"/></span>
							</label>
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" id="persforestowner.gender" name="persforestowner.gender" value="MALE" />
								<span><s:text name="label.person.male"/></span>
							</label>
						</s:else>
						</div>
					</div>
				</s:else>
				<!-- END persforestowner.gender -->
				<!-- STRAT persforestowner.ethnicity -->	
				<s:if test="fieldErrors.get('person.ethnicity')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.ethnicity"/></label>
							<div class="col-md-10">
								<select class="form-control" id="persforestowner.ethnicity" name="persforestowner.ethnicity">
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
							<select class="form-control" id="persforestowner.ethnicity" name="persforestowner.ethnicity">
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
				<!-- END persforestowner.ethnicity -->
				<!-- START persforestowner.notes -->
				<s:if test="fieldErrors.get('person.notes')!=null"> 
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<input id="persforestowner.notes" name="persforestowner.notes" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('person.notes')"/></span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="persforestowner.notes" name="persforestowner.notes" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='persforestowner.notes'/></textarea>
						</div>									
					</div>
				</s:else>
				<!-- END persforestowner.notes -->
				<!-- START persforestowner.photo -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="adm.person.label.photo"/></label>
					<div class="col-md-10">
						<input class="btn btn-default btn-file" id="file" name="file" title="Please select photo file" type="file">
						<p class="help-block">
						</p>
					</div>
				</div>
				<!-- END persforestowner.photo -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.person.label.add.address"/></label>
						<div class="col-md-10">
							<input id="check" name="check" type="checkbox" >
							<input type="hidden" id="checkAddress" name="checkAddress" value="<s:property value='checkAddress'/>">
						</div>
					</div>
				<!-- START address -->
				<div id="address">
				<fieldset>
				<legend><s:text name="finance.contractor.label.address"/></legend>
					<!-- START address.street -->
						<s:if test="fieldErrors.get('address.street')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.person.label.street"/></label>
							<div class="col-md-10">
								<input id="address.street"  maxlength="80" name="address.street"
									class="form-control" placeholder="<s:text name="adm.persforestowner.label.street"/>"
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
										placeholder="<s:text name="adm.persforestowner.label.street"/>" type="text">
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
										placeholder="<s:text name="adm.persforestowner.label.home.number"/>" type="text">
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
									class="form-control" placeholder="<s:text name="adm.persforestowner.label.zip.code"/>"
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
										placeholder="<s:text name="adm.persforestowner.label.zip.code"/>" type="text">
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
									class="form-control" placeholder="<s:text name="adm.persforestowner.label.place"/>"
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
										placeholder="<s:text name="adm.persforestowner.label.place"/>" type="text">
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
									class="form-control" placeholder="<s:text name="adm.persforestowner.label.country"/>"
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
										placeholder="<s:text name="adm.persforestowner.label.country"/>" type="text">
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
							<input id="address.notes" maxlength="255" name="address.notes" class="form-control" placeholder="<s:text name="adm.persforestowner.label.address.notes"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('address.notes')"/></span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.person.label.address.notes"/></label>
						<div class="col-md-10">
							<textarea id="address.notes" maxlength="255" name="address.notes" class="form-control" placeholder="<s:text name="adm.persforestowner.label.address.notes"/>"><s:property value='address.notes'/></textarea>
						</div>									
					</div>
				</s:else>
					<!-- END address.notes -->
				</fieldset>
				</div>
				<!-- END address -->
				
			</fieldset>
			<fieldset>
			<legend><s:text name="adm.person.account"/></legend>
				<!-- START thisUser.email -->
					<s:if test="fieldErrors.get('thisUser.email')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name="finance.contractor.label.email"/></label>
							<div class="col-md-10">
								<input id="thisUser.email" maxlength="50" name="thisUser.email" class="form-control" placeholder="<s:text name="finance.contractor.label.email"/>" type="email">
								 <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('thisUser.email')" /> </span>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name="finance.contractor.label.email"/></label>
							<div class="col-md-10">
								<input id="thisUser.email" maxlength="50" name="thisUser.email" value="<s:property value='thisUser.email'/>" class="form-control" placeholder="<s:text name="finance.contractor.label.email"/>" type="email">
							</div>
						</div>
					</s:else>
				<!-- END thisUser.email -->
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
		$('#persforestowner\\.ethnicity').val('<s:property value="persforestowner.ethnicity.DOMVALUE"/>');
		$("#address\\.zipCode").autoNumeric('init',{aSep:'', mDec: '0',vMax:'99999'});
// 		var validator = $( "#persforestowner_form" ).validate();
// 		validator.element( "#address\\.email" );
		$("#address\\.phone").mask("+" + "999-99-999-999");
		$("#address\\.mobile").mask("+" + "999-99-999-999");
		$("#persforestowner\\.personalId").mask("9999999999");
		$('#persforestowner\\.birthdate').datetimepicker({
			lang: $("#lang").val(),
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});
		$("#picture").hide();
		if($("#persforestowner\\.id").val()){
			$("#myPhoto").attr("src","myAction.do?employeeId=<s:property value="persforestowner.id"/>");
			$("#myPhoto" ).load(function() {
				$("#picture").show();
			});
		}
		$("#parentPerson\\.firstName").autocomplete({
	        source: function(request, response) {
	            $.ajax({
	            	type:"post",
	                url: "Input.person.do",
	                dataType: "json",
	                data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						name_startsWith: request.term,
						orgtype: "D"
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
	            $( "#parentPerson\\.id" ).val( ui.item.id);
	        }  
	    });	
	    
		$("#cancel").on('click', function() {
			$("#persforestowner_form_content").dialog('close');
			return false;
		});
		Ladda.bind('#save');
		$("#save").on('click', function() {
			if($("#persforestowner_form").valid()){
				$("#persforestowner_form :button").prop('disabled','disabled');
				$('#persforestowner_form').submit();}
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
					$("#persforestowner_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#persforestowner_form_content").html(jqXHR.responseText);
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
						jQuery("#_grid").trigger("reloadGrid");
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
		});

	
</script>