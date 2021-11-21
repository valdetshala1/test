<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
		<input id="lang" name="lang" value="<s:property value="#lang"/>" type="hidden">
		<form id="employee_form" class="form-horizontal" action="EmployeeSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="userId" name="userId" value="<s:property value="user.employee.id"/>">
			<fieldset>
				<legend><s:text name="hum.employee.legend.person.data"/></legend>
				
				<!-- START employee.firstName -->
				<s:if test="fieldErrors.get('employee.firstName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="employee.firstName" maxlength="30" name="employee.firstName" class="form-control" placeholder="<s:text name="label.person.firstname"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.firstName.empty'/> </span>
						</div>					
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('employee.firstName.invalid.char')!=null">
				<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="employee.firstName" maxlength="30" name="employee.firstName" class="form-control" placeholder="<s:text name="label.person.firstname"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.field.invalid.char'/> </span>
						</div>					
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="employee.firstName" maxlength="30" name="employee.firstName" value="<s:property value='employee.firstName'/>" class="form-control" placeholder="<s:text name="label.person.firstname"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END employee.firstName -->
				
				<!-- START employee.lastName -->
				<s:if test="fieldErrors.get('employee.lastName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
						<div class="col-md-10">
							<input id="employee.lastName" maxlength="30" name="employee.lastName" class="form-control" placeholder="<s:text name="label.person.lastname"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.lastName.empty'/> </span>
						</div>					
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('employee.lastName.invalid.char')!=null">
				<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input id="employee.lastName" maxlength="30" name="employee.lastName" class="form-control" placeholder="<s:text name="label.person.lastname"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.field.invalid.char'/> </span>
						</div>					
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
						<div class="col-md-10">
							<input id="employee.lastName" maxlength="30" name="employee.lastName" value="<s:property value='employee.lastName'/>" class="form-control" placeholder="<s:text name="label.person.lastname"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END employee.lastName -->
				
				<!-- START employee.birthdate -->
				<s:if test="fieldErrors.get('employee.birthdate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="employee.birthdate" name="employee.birthdate" class="form-control" placeholder="dd.mm.YYYY" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.birthdate.empty'/> </span>
						</div>					
					</div>
				</s:if>
				<s:elseif test="fieldErrors.get('employee.birthdate.tolarge')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="employee.birthdate" name="employee.birthdate" class="form-control" placeholder="dd.mm.YYYY" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('employee.birthdate.tolarge')" /> </span>
						</div>					
					</div>
				</s:elseif>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="employee.birthdate" name="employee.birthdate" value="<s:property value='employee.birthdate'/>" class="form-control" placeholder="dd.mm.YYYY" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END employee.birthdate -->
										
				<!-- START employee.gender -->
				<s:if test="fieldErrors.get('employee.gender')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.gender"/></label>
						<div class="col-md-10">
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" name="employee.gender" id="employee.gender" value="F">
								<span><s:text name="label.person.female"/></span> 
							</label>
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" name="employee.gender" id="employee.gender" value="M">
								<span><s:text name="label.person.male"/></span>  
							</label>
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name='person.gender.empty'/> </span>											
						</div>
				</div>									
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="label.person.gender"/></label>
						<div class="col-md-10">
								<label class="radio radio-inline">
									<s:if test="employee.gender == 'F'">
									<input type="radio" class="radiobox" checked="checked" name="employee.gender" id="employee.gender" value="F">
									</s:if>
									<s:else>
									<input type="radio" class="radiobox" name="employee.gender" id="employee.gender" value="F">
									</s:else>
									<span><s:text name="label.person.female"/></span> 
								</label>
								<label class="radio radio-inline">
									<s:if test="employee.gender == 'M'">
									<input type="radio" class="radiobox" checked="checked" name="employee.gender" id="employee.gender" value="M">
									</s:if>
									<s:else>
									<input type="radio" class="radiobox" name="employee.gender" id="employee.gender" value="M">
									</s:else>
									<span><s:text name="label.person.male"/></span> 
								</label>							
						</div>
					</div>
				</s:else>
				<!-- END employee.gender -->
				<!-- STRAT employee.ethnicity -->	
				<s:if test="fieldErrors.get('employee.ethnicity')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.ethnicity"/></label>
							<div class="col-md-10">
								<select class="form-control" id="employee.ethnicity" name="employee.ethnicity">
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
									<s:text name="employee.ethnicity.empty"/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hum.employee.label.ethnicity"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employee.ethnicity" name="employee.ethnicity">
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
				<!-- START employee.persWithLmtAbilities -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.persWithLmtAbilities"/></label>
						<div class="col-md-10">
							<input id="employee.persWithLmtAbilities" name="employee.persWithLmtAbilities"  value="<s:property value='employee.persWithLmtAbilities'/>" type="checkbox">
						</div>
				</div>
				<!-- END employee.persWithLmtAbilities -->
																				
				
				<s:if test="fieldErrors.get('employee.notes')!=null"> 
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<input id="employee.notes" name="employee.notes" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('employee.notes')"/></span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="employee.notes" name="employee.notes" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='employee.notes'/></textarea>
						</div>									
					</div>
				</s:else>
			
			
			</fieldset>
			
			<fieldset>
				<legend><s:text name="hum.employee.legend.employee.data"/></legend>
				<input id="employee.id" name="employee.id" value="<s:property value='employee.id'/>" type="hidden">									
				<!-- START employee.organisation -->
				<s:if test="fieldErrors.get('employee.organisation.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.organisation"/></label>
						<div class="col-md-10">
							<input id="employee.organisation.orgaName" name="employee.organisation.orgaName" class="form-control" placeholder="<s:text name="hum.employee.label.organisation"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="vehicle.organisation.empty"/> </span>
							<input id="employee.organisation.id" name="employee.organisation.id" value="<s:property value='employee.organisation.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.organisation"/></label>
						<div class="col-md-10">
						<input id="employee.organisation.orgaName" name="employee.organisation.orgaName" value="<s:property value='employee.organisation.orgaName'/>" class="form-control" placeholder="<s:text name="hum.employee.label.organisation"/>" type="text">
						<input id="employee.organisation.id" name="employee.organisation.id" value="<s:property value='employee.organisation.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END employee.gender -->		
			
				<!-- START employee.person -->
				<s:if test="fieldErrors.get('employee.person')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="employee.supervisor"/></label>
						<div class="col-md-10">
							<input id="employee.person.firstName" name="employee.person.firstName" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('employee.person')"/> </span>
							<input id="employee.person.id" name="employee.person.id" value="<s:property value='employee.person.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="employee.supervisor"/></label>
						<div class="col-md-10">
						<input id="employee.person.firstName" name="employee.person.firstName" value="<s:property value='employee.person.firstName'/>" class="form-control" type="text">
						<input id="employee.person.id" name="employee.person.id" value="<s:property value='employee.person.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END employee.person -->
				
	 			<!-- START employee.empSsnNum -->	
				<s:if test="fieldErrors.get('employee.empSsnNum')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="label.employee.number"/></label>
						<div class="col-md-10">
							<input id="employee.empSsnNum" maxlength="100" name="employee.empSsnNum" class="form-control" placeholder="<s:text name="label.employee.number"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('employee.empSsnNum')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="label.employee.number"/></label>
						<div class="col-md-10">
							<input id="employee.empSsnNum" maxlength="100" name="employee.empSsnNum" value="<s:property value='employee.empSsnNum'/>" class="form-control" placeholder="<s:text name="label.employee.number"/>" type="text">
						</div>
					</div>				
				</s:else>
				<!-- END employee.empSsnNum -->	
				
				<!-- START employee.personalId -->	
				<s:if test="fieldErrors.get('employee.personalId')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.personal.id"/></label>
						<div class="col-md-10">
							<input id="employee.personalId" maxlength="20" name="employee.personalId" class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="person.personalId.empty"/> </span>
						</div>
					</div>
				</s:if>
				<s:if test="fieldErrors.get('employee.personalId.exists')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.personal.id"/></label>
						<div class="col-md-10">
							<input id="employee.personalId" maxlength="20" name="employee.personalId" class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="personal.id.exists"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.personal.id"/></label>
						<div class="col-md-10">
							<input id="employee.personalId" maxlength="20" name="employee.personalId" value="<s:property value='employee.personalId'/>" class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>" type="text">
						</div>
					</div>				
				</s:else>
				<!-- END employee.personalId -->									
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dp.doc.category.isactive"/></label>
						<div class="col-md-10">
							<input type="checkbox" id="employee.active" name="employee.active" value="<s:property value='employee.active'/>">
						</div>
				</div>	
				
				<!-- IT Manager, HR Admin, HR Manager, IT Director, Programm Manager, Sales Manager, Contorler
					Chief Executive Officier, Chief Operating Officier, Finance Controller, Finance Manager
				 -->								
				
				<!-- START employee.jobTitle -->
				
					<s:if test="fieldErrors.get('employee.jobTitle')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.job.title"/></label>
							<div class="col-md-10">
								<select class="form-control" id="employee.jobTitle" name="employee.jobTitle">
									<s:iterator value="jobtitleList" var="el">
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
								<span class="help-block"><i class="fa fa-warning"></i>
									<s:text name='employee.jobTitle.empty'/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hum.employee.label.job.title"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employee.jobTitle" name="employee.jobTitle">
								<s:iterator value="jobtitleList" var="el">
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
				</s:else>
				<!-- END employee.jobTitle -->
								
				
				<!-- START employee.functionalTitle -->
				<s:if test="fieldErrors.get('employee.functionalTitle')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.functional.title"/></label>
						<div class="col-md-10">
							<input id="employee.functionalTitle" maxlength="100" name="employee.functionalTitle" value="<s:property value='employee.functionalTitle'/>" class="form-control" placeholder="<s:text name="hum.employee.label.functional.title"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('employee.functionalTitle')"/>
							</span> 
						</div>
					</div>				
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.functional.title"/></label>
						<div class="col-md-10">
							<input id="employee.functionalTitle" maxlength="100" name="employee.functionalTitle" value="<s:property value='employee.functionalTitle'/>" class="form-control" placeholder="<s:text name="hum.employee.label.functional.title"/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END employee.functionalTitle -->

										
				<!-- START employee.roleCode -->	
					<s:if test="fieldErrors.get('employee.roleCode')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.role.type"/></label>
							<div class="col-md-10">
								<select class="form-control" id="employee.roleCode" name="employee.roleCode">
									<s:iterator value="employeeRoleList" var="el">
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
								<span class="help-block"><i class="fa fa-warning"></i>
									<s:text name='employee.role.empty'/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hum.employee.label.role.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employee.roleCode" name="employee.roleCode">
								<s:iterator value="employeeRoleList" var="el">
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
				</s:else>
				<!-- END employee.roleCode -->
				<!-- STRAT employee.conctractType -->	
				<s:if test="fieldErrors.get('employee.conctractType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.contract.type"/></label>
							<div class="col-md-10">
								<select class="form-control" id="employee.conctractType" name="employee.conctractType">
									<s:iterator value="contractTypeList" var="el">
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
									<s:text name="employee.conctractType.empty"/>
								</span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hum.employee.label.contract.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employee.conctractType" name="employee.conctractType">
								<s:iterator value="contractTypeList" var="el">
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
				
				<!-- START employee.dateFrom -->
					
				<s:if test="fieldErrors.get('employee.dateFrom')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.dateFrom"/></label>
						<div class="col-md-10">
							<input id="employee.dateFrom" name="employee.dateFrom"  class="form-control" placeholder="dd.mm.YYYY" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('employee.dateFrom')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.dateFrom"/></label>
						<div class="col-md-10">
							<input id="employee.dateFrom" name="employee.dateFrom" value="<s:property value='employee.dateFrom'/>" class="form-control" placeholder="dd.mm.YYYY" type="text">
						</div>
					</div>
				</s:else>			
				<!-- END employee.dateFrom -->	
				<!-- START employee.dateTo -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.dateTo"/></label>
						<div class="col-md-10">
							<input id="employee.dateTo" name="employee.dateTo" value="<s:property value='employee.dateTo'/>" class="form-control" placeholder="dd.mm.YYYY" type="text">
						</div>									
					</div>
				<!-- END employee.dateFrom -->	
				<!-- END employee.persWithLmtAbilities-->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.file.input"/></label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default" id="file" name="file" accept="image/*">
<!-- 						<p class="help-block"> -->
<!-- 							some help text here. -->
<!-- 						</p> -->
					</div>
				</div>
				
			</fieldset>
			<fieldset>
			
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.person.label.add.address"/></label>
						<div class="col-md-10">
							<input id="check" name="check" type="checkbox" >
							<input type="hidden" id="checkAddress" name="checkAddress" value="<s:property value='checkAddress'/>">
						</div>
				</div>
			
			<!-- START address -->
				<div id="address">
				<legend><s:text name="finance.contractor.label.address"/></legend>
				<input type="hidden" id="address.id" name="address.id" value="<s:property value="address.id"/>" />
				
					<!-- START address.street -->
						<s:if test="fieldErrors.get('address.street')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name="adm.person.label.street"/></label>
							<div class="col-md-10">
								<input id="address.street" maxlength="80" name="address.street"
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
								<input id="address.zipCode" maxlength="9" name="address.zipCode"
									class="form-control" placeholder="<s:text name="adm.person.label.zip.code"/>"
									type="text" > <span class="help-block"><i
									class="fa fa-warning"></i> <s:text name="address.zipCode.empty"/> </span>
							</div>
						</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label">*<s:text name="adm.person.label.zip.code"/></label>
								<div class="col-md-10">
									<input id="address.zipCode" maxlength="9" name="address.zipCode"
										value="<s:property value='address.zipCode'/>" class="form-control"
										placeholder="<s:text name="adm.person.label.zip.code"/>" type="text" >
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
<!-- end widget div -->
	
		
<script type="text/javascript">
	$(document).ready(function () {
		$("#employee\\.active").on('change',function(event){
			if($('#employee\\.active').is(":checked")){
				$('#employee\\.active').val("true");
			}else{
				$('#employee\\.active').val("false");
			}
		});
		
		if($("#employee\\.active").val()=="true"){
			$("#employee\\.active").prop('checked',true);
		}
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		//$("#employee\\.personalId]").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$("#address\\.zipCode").autoNumeric('init',{aSep:'', mDec: '0',vMax:'99999'});
// 		$("#employee\\.empSsnNum").mask("9999-99-9999");
		$("#employee\\.personalId").mask("9999999999");
		
		$("#address\\.phone").mask("+" + "999-99-999-999");
		$("#address\\.mobile").mask("+" + "999-99-999-999");
		
		$('#employee\\.conctractType').val('<s:property value="employee.conctractType.DOMVALUE"/>');
		$('#employee\\.roleCode').val('<s:property value="employee.roleCode.DOMVALUE"/>');

		$('#employee\\.ethnicity').val('<s:property value="employee.ethnicity.DOMVALUE"/>');
		$('#employee\\.jobTitle').val('<s:property value="employee.jobTitle.DOMVALUE"/>');

		$('#employee\\.persWithLmtAbilities').on('change',function(event){
			$('#employee\\.persWithLmtAbilities').val($('#employee\\.persWithLmtAbilities')[0].checked ? "true" : "false" );
		});

		if($("#employee\\.persWithLmtAbilities").val()=="true"){
			$("#employee\\.persWithLmtAbilities").prop('checked',true);
		}		

		
		var validator = $( "#employee_form" ).validate();
		validator.element( "#address\\.email" );
		
		$('#employee\\.birthdate').datetimepicker({
			lang: $("#lang").val(),
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});

		$('#employee\\.dateFrom').datetimepicker({
			lang: $("#lang").val(),
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});

		$('#employee\\.dateTo').datetimepicker({
			lang: $("#lang").val(),
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});

		$("#employee\\.organisation\\.orgaName").select2({
		    placeholder: "",         
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
		    	$("#employee\\.organisation\\.id").val(item.id);
		    	$("#employee\\.organisation\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#employee\\.organisation\\.orgaName").select2("data", {id: "<s:property value='employee.organisation.id'/>", name: "<s:property value="employee.organisation.orgaName"/>"});

		$("#employee\\.person\\.firstName").select2({
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
		    	$("#employee\\.person\\.id").val(item.id);
		    	$("#employee\\.person\\.firstName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		if($("#employee\\.person\\.id").val()){
			$("#employee\\.person\\.firstName").select2("data", {id: "<s:property value='employee.person.id'/>", name: '<s:property value="employee.person.firstName"/>'+" "+'<s:property value="employee.person.lastName"/>'});
		}
		
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "Employee.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#employee_form_content").html(jqXHR.responseText);
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
			$("#employee_profile_content").hide();
			return false;
		});

		
		$("#address").hide();
		$(check).on('change',function(event){
			$('#checkAddress').val($(check)[0].checked ? "true" : "false");
// 			$('#checkAddress').val($('#checkAddress').val());
			if($('#checkAddress').val()=="true"){
				 $("#address").show();
			} else{	
					$("#address").hide();
			}
		});
		
		if($("#address\\.id").val().length>0){
			$('#checkAddress').val(true);
			$('#check').prop('checked',true);
		}
		
		if($('#checkAddress').val()=="true" || $('#check').is(":checked")){
			 $("#address").show();
			 $('#check').prop('checked',true);
		} else{	
				$("#address").hide();
		}

		Ladda.bind('#save');	
		$("#save").on('click', function () {
			if($('#employee_form').valid()){
				$("#employee_form :button").prop('disabled','disabled');
				$('#employee_form').submit();
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
					$("#employee_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#employee_form_content").html(jqXHR.responseText);
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
						jQuery("#employee_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
						$("#employee_profile_content").show();
						var linkProfile = "Employee.profile.do?employeeId=" + $("#employee\\.id").val();
						loadURL(linkProfile, $("#employee_profile_content"));
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