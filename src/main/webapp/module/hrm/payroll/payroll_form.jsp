<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- widget div-->
<div>

	<!-- widget content -->
	<div class="widget-body">
	
		<form id="payroll_form" role="form" class="form-horizontal" action="PayrollSave.do" accept-charset="utf8" method="post">
			
			<div class="row">

			<fieldset>
				<legend style="padding-left: 5px;"><s:text name="hrml.employee.salary"/></legend>
				
				<input id="payroll.id" name="payroll.id" value="<s:property value='payroll.id'/>" type="hidden">
				<input id="payrollId" name="payrollId" value="<s:property value='payroll.id'/>" type="hidden">
				
				
				<input id="salary.id" name="salary.id" value="<s:property value='salary.id'/>" type="hidden">
				<input id="salary.employee.id" name="salary.employee.id" value="<s:property value='salary.employee.id'/>" type="hidden">
							
				<!-- START salary.employee -->
				<s:if test="fieldErrors.get('salary.employee.firstName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="employee.label"/></label>
						<div class="col-md-10">
							<input id="salary.employee.firstName" name="salary.employee.firstName" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('salary.employee.firstName')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="employee.label"/></label>
						<div class="col-md-10">
							<input id="salary.employee.firstName" name="salary.employee.firstName" value="<s:property value='salary.employee.firstName'/>" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END salary.employee -->
											
				<!-- START "salary.basicsalary" -->
				<s:if test="fieldErrors.get('salary.basicsalary')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.basicsalary"/></label>
							<div class="col-md-10">
								<input id="salary.basicsalary" name="salary.basicsalary" class="form-control" type="text"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('salary.basicsalary')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.basicsalary"/></label>
						<div class="col-md-10">
						<input id="salary.basicsalary" name="salary.basicsalary" class="form-control" value="<s:property value='salary.basicsalary'/>" type="text"/>
						</div>
					</div>
				</s:else>
				<!-- END "salary.basicsalary" -->
				
			</fieldset>
			
			<fieldset>
				<legend style="padding-left: 5px;"><s:text name="hrm.employee.salary.payroll.form"/></legend>
				
				<!-- START payroll.fiscalYear -->
				<s:if test="fieldErrors.get('payroll.fiscalYear')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.payroll.fiscalYear"/></label>
							<div class="col-md-10">
								<input id="payroll.fiscalYear" name="payroll.fiscalYear" readonly="readonly" class="form-control" placeholder="" type="number"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payroll.fiscalYear')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.payroll.fiscalYear"/></label>
						<div class="col-md-10">
							<input id="payroll.fiscalYear" name="payroll.fiscalYear" readonly="readonly" class="form-control" value="<s:property value='payroll.fiscalYear'/>" placeholder="" type="number"/>
						</div>
					</div>
				</s:else>
				<!-- END payroll.fiscalYear -->
				
				<!-- START payroll.payMonth -->
				<s:if test="fieldErrors.get('payroll.payMonth')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.payroll.payMonth"/></label>
							<div class="col-md-10">
								<input id="payroll.payMonth" name="payroll.payMonth" readonly="readonly" class="form-control" placeholder="" type="number"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payroll.payMonth')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.payroll.payMonth"/></label>
						<div class="col-md-10">
							<input id="payroll.payMonth" name="payroll.payMonth" readonly="readonly" class="form-control" value="<s:property value='payroll.payMonth'/>" placeholder="" type="number"/>
						</div>
					</div>
				</s:else>
				<!-- END payroll.payMonth -->
					
				<!-- START payroll.payrollDate -->
				<s:if test="fieldErrors.get('payroll.payrollDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.payroll.payrollDate"/></label>
							<div class="col-md-10">
								<input id="payroll.payrollDate" name="payroll.payrollDate" readonly="readonly" class="form-control" placeholder=""/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payroll.payrollDate')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.payroll.payrollDate"/></label>
						<div class="col-md-10">
							<input id="payroll.payrollDate" name="payroll.payrollDate" readonly="readonly" class="form-control" value="<s:property value='payroll.payrollDate'/>" placeholder="" />
						</div>
					</div>
				</s:else>
				<!-- END payroll.payrollDate -->								
								
			</fieldset>				
			
			<fieldset>
					<legend style="padding-left: 5px;"><s:text name="hrml.employee.salary.contribution"/></legend>
<!-- 
adjustments!=null and !adjustments.empty
test="payroll.employeeSalaryPayrollAdjustments!=null and !payroll.employeeSalaryPayrollAdjustments.empty"
 -->
	 				<s:if test="adjustments!=null and !adjustments.empty">
	 				<div class="form-group">
	 				<label class="col-md-2 control-label" ></label>
	 				<div class="col-md-10">
	 				<div class="table-responsive-sm">
					<table class="table table-striped w-auto" style="" >
						  <thead class="thead-dark">
						    <tr>
						      <th></th>
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.financialType.code"/></th>
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.financialType.name"/></th>
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.adjustmentDate"/></th>
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.amount"/></th>
						      <th scope="col">%</th>
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.amountType"/></th>
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.calculationType"/></th>						      
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.createdDate"/></th>
						      <!-- 
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.createdBy"/></th>
						      -->
						      <th scope="col"><s:text name="hrml.employee.salary.adjustment.note"/></th>
						    </tr>
						  </thead>
						  <tbody>
							<s:iterator value="adjustments" var="rowstatus">
							 <s:property value="#rowstatus.count" />
							<s:if test="#rowstatus.odd == true"></s:if>
    					    
							<tr class="table-info">
								<td>
								<s:if test="payroll==null || (payroll!=null && (payroll.status=='NEW' || payroll.status=='CAL'))">
								<button id="deleteAdj_<s:property value="id"/>" onclick="deleteAdj('<s:property value="id"/>');return false;"  title="Delete <s:property value="id"/>" type="button">
								<i class="fa fa-trash-o"></i>
								</button>
								</s:if>
								</td>
	    						<td><s:property value="financialType.code"/></td>		
								<td><s:property value="financialType.nameAl"/></td>		
								<td><s:property value="adjustmentDate"/></td>					
								<td><s:property value="amount"/></td>
								<td><s:property value="amountPercentage"/></td>
								<td><s:property value="amountType"/></td>
								<td><s:property value="calculationType"/></td>
								<td><s:date name="createdDate" format="dd.MM.yyyy"/></td>
								<!-- 
								<td><s:property value="createdBy.firstName"/>, <s:property value="createdBy.lastName"/></td>
								-->
								<td><s:property value="note"/></td>
						    </tr>						    
						
							</s:iterator>
						  </tbody>
						</table>
						</div>
						</div>
						</div>
					</s:if>	
						
					<!-- START adjustment.financialType -->
						<s:if test="fieldErrors.get('adjustment.financialType.name')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label">*<s:text name="finance.input.label.input.type"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.financetype.info'/>"></span>
								</label>
									<div class="col-md-10">
										<input id="adjustment.financialType.name" name="adjustment.financialType.name" class="form-control" placeholder="<s:text name="finance.input.label.input.type"/>"/>
										<input id="adjustment.financialType.id" name="adjustment.financialType.id" class="form-control" type="hidden"/>
										<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.financialType.name')"/></span> 
									</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" >*<s:text name="finance.input.label.input.type"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.financetype.info'/>"></span>
								</label>
								<div class="col-md-10">
									<input id="adjustment.financialType.name" name="adjustment.financialType.name" class="form-control" value="<s:property value='finInput.financialType.nameAl'/>" placeholder="<s:text name="finance.input.label.input.type"/>" />
									<input id="adjustment.financialType.id" name="adjustment.financialType.id" class="form-control" value="<s:property value='finInput.financialType.id'/>" type="hidden"/>
								</div>
							</div>
						</s:else>
						<!-- END adjustment.financialType -->
						
						<!-- START adjustment.amount -->
						<s:if test="fieldErrors.get('adjustment.amount')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.adjustment.amount"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.amount.info'/>"></span>
								</label>
								<div class="col-md-10">
									<input id="adjustment.amount" name="adjustment.amount" class="form-control" value="<s:property value='adjustment.amount'/>" placeholder="" type="number"/>
									<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.amount')"/></span> 
								</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.adjustment.amount"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.amount.info'/>"></span>
								</label>
								<div class="col-md-10">
									<input id="adjustment.amount" name="adjustment.amount" class="form-control" value="<s:property value='adjustment.amount'/>" placeholder="" type="number"/>
								</div>
							</div>
						</s:else>
						<!-- END adjustment.amount -->
						
						<!-- START adjustment.amountPercent -->
						<s:if test="fieldErrors.get('adjustment.amountPercent')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label">**<s:text name="hrml.employee.salary.adjustment.amountPercent"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.amountPercent.info'/>"></span>
								</label>
								<div class="col-md-10">
									<input id="adjustment.amountPercentage" name="adjustment.amountPercentage" class="form-control" value="<s:property value='adjustment.amountPercentage'/>" placeholder="" type="number"/>
									<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.amountPercentage')"/></span> 
								</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" >**<s:text name="hrml.employee.salary.adjustment.amountPercent"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.amountPercent.info'/>"></span>
								</label>
								<div class="col-md-10">
									<input id="adjustment.amountPercentage" name="adjustment.amountPercentage" class="form-control" value="<s:property value='adjustment.amountPercentage'/>" placeholder="" type="number"/>
								</div>
							</div>
						</s:else>
						<!-- END adjustment.amountPercent -->	
												
						<!-- START adjustment.amountType -->
						<s:if test="fieldErrors.get('adjustment.amountType')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.adjustment.amountType"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.amountCalcType.info'/>"></span>
								</label>
								<div class="col-md-10">
									<select id="adjustment.amountType" name="adjustment.amountType" class="form-control">
									<s:iterator value="calculationSteps" var="cs">
										<option value="<s:property value='#cs'/>" items="<s:property value='#cs.items()'/>" title="Operation: <s:property value='#cs.items()'/>"><s:property value='#cs'/></option>
									</s:iterator>
									</select>
									<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.amountCalcType')"/></span> 
								</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.adjustment.amountType"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.amountCalcType.info'/>"></span>
								</label>
								<div class="col-md-10">
								
								<select id="adjustment.amountType" name="adjustment.amountType" class="form-control">
								<s:iterator value="calculationSteps" var="cs">
									<option value="<s:property value='#cs'/>" items="<s:property value='#cs.items()'/>" title="Operation: <s:property value='#cs.items()'/>">
									<s:text name="hrml.employee.salary.adjustment.calculationStep.%{#cs}"/> - <s:property value='#cs'/>
									</option>
								</s:iterator>
								</select>								
								
								</div>
							</div>
						</s:else>
						<!-- END adjustment.amountType -->		
						
						<!-- START adjustment.calculationType -->
						<s:if test="fieldErrors.get('adjustment.calculationType')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.adjustment.calculationType"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.calculationType.info'/>"></span>
								</label>
								<div class="col-md-10">
									<select id="adjustment.calculationType" name="adjustment.calculationType" class="form-control">
										<!-- 
										<s:iterator value="calculationTypes" var="at">
										<s:if test="#at.toString() == 'ADD'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.add"/>
											</option>
										</s:if>
										<s:elseif test="#at.toString() == 'SUB'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.sub"/>
											</option>
										</s:elseif>
										<s:elseif test="#at.toString() == 'NOP'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.nop"/>
											</option>
										</s:elseif>
										<s:elseif test="#at.toString() == 'NET'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.net"/>
											</option>
										</s:elseif>
										<s:elseif test="#at.toString() == 'TAX'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.tax"/>
											</option>
										</s:elseif>	
										<s:elseif test="#at.toString() == 'FIN'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.fin"/>
											</option>
										</s:elseif>											
										</s:iterator>
										-->	
									</select>
									<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.calculationType')"/></span> 
								</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.adjustment.calculationType"/>
								<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.calculationType.info'/>"></span>
								</label>
								<div class="col-md-10">
								<select id="adjustment.calculationType" name="adjustment.calculationType" class="form-control">
									<!-- 
									<s:iterator value="calculationTypes" var="at">
										<s:if test="#at.toString() == 'ADD'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.add"/>
											</option>
										</s:if>
										<s:elseif test="#at.toString() == 'SUB'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.sub"/>
											</option>
										</s:elseif>
										<s:elseif test="#at.toString() == 'NOP'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.nop"/>
											</option>
										</s:elseif>
										<s:elseif test="#at.toString() == 'NET'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.net"/>
											</option>
										</s:elseif>
										<s:elseif test="#at.toString() == 'TAX'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.tax"/>
											</option>
										</s:elseif>	
										<s:elseif test="#at.toString() == 'FIN'">
											<option value="<s:property value='#at'/>">
											<s:text name="hrml.employee.salary.adjustment.calculationType.fin"/>
											</option>
										</s:elseif>											
										</s:iterator>	
										-->
									</select>
								</div>
							</div>
						</s:else>
						<!-- END adjustment.adjustmentType -->										
						
						<!-- START adjustment.deduction -->
						<!-- 
						<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="hrml.employee.salary.adjustment.deduction"/>
						<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrml.employee.salary.adjustment.deduction.info'/>"></span>
						</label>
						<div class="col-md-10">
							<label>
							<input id="adjustment.deduction" name="adjustment.deduction" type="checkbox" class="checkbox style-0"  value="<s:property value='adjustment.deduction'/>"/>
							<span>?</span>
							</label>
						</div>
						</div>
						-->
						<!-- END adjustment.deduction -->
												
						<!-- START adjustment.hoursworked -->
						<!-- 
						<s:if test="fieldErrors.get('adjustment.hoursworked')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label"><s:text name="hrml.employee.salary.adjustment.hoursworked"/></label>
									<div class="col-md-10">
										<input id="adjustment.hoursworked" name="adjustment.hoursworked" class="form-control" placeholder=""/>
										<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.hoursworked')"/></span> 
									</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" ><s:text name="hrml.employee.salary.adjustment.hoursworked"/></label>
								<div class="col-md-10">
									<input id="adjustment.hoursworked" name="adjustment.hoursworked" class="form-control" value="<s:property value='adjustment.hoursworked'/>" placeholder="" />
								</div>
							</div>
						</s:else>
						-->
						<!-- END adjustment.hoursworked -->	
						
						<!-- START adjustment.hourlyrate -->
						<!-- 
						<s:if test="fieldErrors.get('adjustment.hourlyrate')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label"><s:text name="hrml.employee.salary.adjustment.hourlyrate"/></label>
									<div class="col-md-10">
										<input id="adjustment.hourlyrate" name="adjustment.hourlyrate" class="form-control" value="<s:property value='adjustment.hourlyrate'/>" placeholder="" type="number"/>
										<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.hourlyrate')"/></span> 
									</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" ><s:text name="hrml.employee.salary.adjustment.hourlyrate"/></label>
								<div class="col-md-10">
									<input id="adjustment.hourlyrate" name="adjustment.hourlyrate" class="form-control" value="<s:property value='adjustment.hourlyrate'/>" placeholder="" type="number" />
								</div>
							</div>
						</s:else>
						 -->
						<!-- END adjustment.hourlyrate -->							
							
						<!-- START adjustment.adjustmentDate -->
						<!-- 
						<s:if test="fieldErrors.get('adjustment.adjustmentDate')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label"><s:text name="hrml.employee.salary.adjustment.contributeDate"/></label>
									<div class="col-md-10">
										<input id="adjustment.adjustmentDate" name="adjustment.adjustmentDate" class="form-control" placeholder="" value="<s:property value='adjustment.adjustmentDate'/>"/>
										<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.adjustmentDate')"/></span> 
									</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" ><s:text name="hrml.employee.salary.adjustment.contributeDate"/></label>
								<div class="col-md-10">
									<input id="adjustment.adjustmentDate" name="adjustment.adjustmentDate" class="form-control" value="<s:property value='adjustment.adjustmentDate'/>" placeholder="" />
								</div>
							</div>
						</s:else>
						 -->
						<!-- END adjustment.adjustmentDate -->						

						<!-- START adjustment.note -->
						<s:if test="fieldErrors.get('adjustment.note')!=null">
							<div class="form-group has-error">
								<label class="col-md-2 control-label"><s:text name="hrml.employee.salary.adjustment.note"/></label>
									<div class="col-md-10">
										<input id="adjustment.note" name="adjustment.note" class="form-control" placeholder=""/>
										<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('adjustment.note')"/></span> 
									</div>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-2 control-label" ><s:text name="hrml.employee.salary.adjustment.note"/></label>
								<div class="col-md-10">
									<input id="adjustment.note" name="adjustment.note" class="form-control" value="<s:property value='adjustment.note'/>" placeholder="" />
								</div>
							</div>
						</s:else>
						<!-- END adjustment.note -->							
			</fieldset>
			
		</div>
		<!-- end row -->

			<div class="form-actions">
				
				<div class="row">
					<div class="col-md-12">
						<ul>
						<s:iterator value="fieldErrors">
						<li>
						    <s:property value="key"/>:
						    <s:iterator value="value"><s:property/></s:iterator>
						 </li>   
						</s:iterator>
						 </ul>
						
						</div>
				</div>
						
				
				<div class="row" id="buttonRow">
					<div class="col-md-12">
						<button id="cancelSalaryPayroll" class="btn btn-danger" type="button">
							<s:text name="label.button.cancel"></s:text><!-- btn btn-default -->
						</button>
						<s:if test="payroll!=null && (payroll.status=='NEW' || payroll.status=='CAL')">
						<button id="calSalaryPayroll" class="btn btn-warning ladda-button" type="button" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.salary.cal"></s:text>
						</button>	
						<s:if test="payroll!=null && payroll.status=='CAL'">
						<button id="finSalaryPayroll" class="btn btn-success ladda-button" type="button" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.salary.fin"></s:text>
						</button>
						</s:if>											
						</s:if>
						<button id="saveSalaryPayroll" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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

			
<div class="hideDiv" id="calculationTypesDiv">
	<select id="calculationTypes">
			<s:iterator value="calculationTypes" var="ct">
				<option value="<s:property value='#ct'/>">
				<s:text name="hrml.employee.salary.adjustment.calculationType.%{#ct}"/> - <s:property value='#ct'/>
				</option>
			</s:iterator>
	</select>							
<div>

<script type="text/javascript">

function deleteAdj(adjustmentId){

	if(adjustmentId){
		$.SmartMessageBox({
			title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> <s:text name='label.button.save'/> <span class='txt-color-orangeDark'><strong><s:text name='line.temp.status.deleted.title'/></strong></span> ?",
			content : $.logoutMSG || "Do you want to delete." ,
			buttons : '[No][Yes]'

		}, function(ButtonPressed) {
			if (ButtonPressed === "Yes") {

	        	$.ajax({
	    			type : "GET",
	    			url : "PayrollAdjustmentDelete.do", 
	    			data:"adjustmentId="+adjustmentId + "&payrollId="+ $("#payroll\\.id").val(),
	    			async : false,
	    			beforeSend:function(jqXHR, settings) {
	    			},
	    			error : function(errorThrown, status, jqXHR) { // on error..
	    				alert("error:" + errorThrown + ", status:" + status);
	    			},
	    			success : function(data, status, jqXHR) { // on success..
	    				$("#payroll_form_content").html(jqXHR.responseText);
						var errors = jqXHR.getResponseHeader("errors_exists");
	 					if(!errors){
	 						jQuery("#payroll_grid").trigger("reloadGrid");
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
	    			complete:function(jqXHR, textStatus){
	    			}
	    		});
				
			}
			 return false;
			
		});

	}else{
		alert("No Adjustment Object ID is selected");
	}
			
	return false;        
}
	
function formatResult(item){
	return item.name + " (" + item.code + ")";
}

function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#status\\.docName").val(filename);
    $("#status\\.docType").val(fileExt);
}

function setReadonly(flag){
	$("#salary\\.grosssalary").prop('readonly', flag);
	$("#salary\\.netsalary").prop('readonly', flag);
	$("#salary\\.taxsalary").prop('readonly', flag);
	
	if(flag){
		$("#fg\\.salary\\.grosssalary").hide();
		$("#fg\\.salary\\.netsalary").hide();
		$("#fg\\.salary\\.taxsalary").hide();
	}else{
		$("#fg\\.salary\\.grosssalary").show();
		$("#fg\\.salary\\.netsalary").show();
		$("#fg\\.salary\\.taxsalary").show();
	}
}


function initSelect(){
	var items = $("#adjustment\\.amountType").find(':selected').attr('items');
	var dataSource = items.split(",");
	$.each(dataSource, function(key, value) {
		//console.log(key + ", " + value);
		
		$("#calculationTypes option").each(function(){
			//$(this).remove(); 
			//console.log(value + "=" + $(this).val() + " - " + $(this).text());
			var text = $(this).text();
			// Add $(this).val() to your list
			if(value==$(this).val()){
				
			    $('#adjustment\\.calculationType')
		        .append($("<option></option>")
		        .attr("value",value)
		        .text(text));
			}
		
		});		
	});	
}

$(document).ready(function () {

    	
	$('#adjustment\\.adjustmentDate').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		timepicker: false,
	});

	$('#payroll\\.payrollDate').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		timepicker: false,
	});


	$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	//$("#payroll\\.fiscalYear").mask('9999');
	//$("#payroll\\.payMonth").mask('99');
	
	//$("#payroll\\.payMonth").value("<s:property value='payroll.payMonth'/>");
	


	/*
	$("#payroll\\.fiscalYear").datetimepicker( {
		lang: 'al',
		format: "m.Y",
		viewMode: "years",
		timepicker: false,
	});	
	
	
	
		format: "dd.mm.yyyy",
	    autoclose: true,
	    todayHighlight: true,		
	
	*/


	$("#adjustment\\.deduction").on('change',function(event){
		if($('#adjustment\\.deduction').is(":checked")){
			$('#adjustment\\.deduction').val("true");
		}else{
			$('#adjustment\\.deduction').val("false");
		}
	});
	
	if($("#adjustment\\.deduction").val()=="true"){
		$("#adjustment\\.deduction").prop('checked',true);
	}else{
		$("#adjustment\\.deduction").prop('checked',false);
	}


	initSelect();

	$("#adjustment\\.amountType").on('change',function(event){
		/*
		console.log($(this).val());
		var values = $.map($('#adjustment\\.calculationType option'), function(e) { return e.value; });
		console.log(values);
		console.log($("#adjustment\\.amountType").find(':selected').attr('items'));
		console.log(this.options[this.selectedIndex].getAttribute("items"));
		*/

		$("#adjustment\\.calculationType option").each(function(){
			$(this).remove(); 
			//console.log($(this).val());
			// Add $(this).val() to your list
		});

		initSelect();
		
		/*
		var items = this.options[this.selectedIndex].getAttribute("items");
		var dataSource = items.split(",");
		$.each(dataSource, function(key, value) {
			//console.log(key + ", " + value);
		    $('#adjustment\\.calculationType')
		         .append($("<option></option>")
		         .attr("value",value)
		         .text(value));
		});
		*/
	});
		
	$('#addRow').on('click', function (e) {
		
	    var deductionId = $("#adjustment\\.financialType\\.id").val();
	    var deductionValue = $("#adjustment\\.amount").val();
	    var deductionValue = $("#salary\\.employee\\.id").val();
	    alert("add new contribution: " + id + ", " + value);

		$.ajax({
			type : "GET",
			url : "Salary.form.do", 
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			success : function(data, status, jqXHR) { // on success..
				$("#payroll_form_content").html(jqXHR.responseText);
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
	});
	
	$("#salary\\.employee\\.firstName").select2({
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
	    formatResult: function(item) {
		    return item.name + " (" + item.birthdate+ ")";
	    },
	    formatSelection: function(item) {
		    var label;
		    if(item.id){
		    	$("#salary\\.employee\\.id").val(item.id);
		    	$("#salary\\.employee\\.firstName").val(item.name);
		    	label = item.name + " (" + item.birthdate+ ")";
		    }
		    return label;
	    	
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	}); 
	
	$("#salary\\.employee\\.firstName").select2("data", {
		id: "<s:property value='salary.employee.id'/>", 
		birthdate: "<s:property value='salary.employee.birthdate'/>", 
		name: "<s:property value="salary.employee.firstName"/> <s:property value="salary.employee.lastName"/>"
	});
	

	 $("#adjustment\\.financialType\\.name").select2({
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
			        	type:"OU",
			        };
		        },
		        results: function (data, page) { 
		        return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
		    formatResult: function(item) {
			    var label = item.name + " (<span style='color:orange;'>" + item.code + "</span>)";
			    return label;
		    },
	        formatSelection: function(item) {
	        	$("#adjustment\\.financialType\\.id").val(item.id);
	        	$("#adjustment\\.financialType\\.name").val(item.name);
	        	var label = item.name;
	        	if(item.name){
	        		label = item.name + " (" + item.code + ")";
	        	}
	            return label;	        	
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });  

	 /*
	 alert("<s:property value='adjustment.financialType.name'/>");
	 
	    $("#adjustment\\.financialType\\.name").select2("data",{
		    	id: "<s:property value='adjustment.financialType.id'/>", 
    	    	name: "<s:property value='adjustment.financialType.nameAl'/>", 
    	    	code: "<s:property value='adjustment.financialType.code'/>"
       	});*/

	
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$("#finInput\\.year").mask('9999');
		$("#finInput\\.month").val('<s:property value="finInput.month.DOMVALUE"/>');

		if($('#language').val()=='en'){
		    $("#adjustment\\.financialType\\.name").select2("data",{
		    	id: "<s:property value='adjustment.financialType.id'/>", 
    	    	name: "<s:property value='adjustment.financialType.nameEn'/>", 
    	    	code: "<s:property value='adjustment.financialType.code'/>"
       		});			
		}else if($('#language').val()=='sr'){
		    $("#adjustment\\.financialType\\.name").select2("data",{
		    	id: "<s:property value='adjustment.financialType.id'/>", 
    	    	name: "<s:property value='adjustment.financialType.nameSr'/>", 
    	    	code: "<s:property value='adjustment.financialType.code'/>"
       		});			
		}else{
		    $("#adjustment\\.financialType\\.name").select2("data",{
		    	id: "<s:property value='adjustment.financialType.id'/>", 
    	    	name: "<s:property value='adjustment.financialType.nameAl'/>", 
    	    	code: "<s:property value='adjustment.financialType.code'/>"
       		});			
		}
		 

	     $("#calSalaryPayroll").on('click', function () {                    
				$.ajax({
					type : "GET",
					url : "PayrollStatusSave.do", 
					data: "payrollId=" + $("#payrollId").val()+ "&cmd=CAL",
					async : false,
					beforeSend:function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
						alert("error:" + errorThrown + ", status:" + status);
					},
					success : function(data, status, jqXHR) { // on success..
				    	$("#payroll_form_content").html(jqXHR.responseText);
						var errors = jqXHR.getResponseHeader("errors_exists");
	 					if(!errors){
	 						jQuery("#payroll_grid").trigger("reloadGrid");
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
					complete:function(jqXHR, textStatus){
					}
				});
				return false;        
		});

	     $("#finSalaryPayroll").on('click', function () {                    
				$.ajax({
					type : "GET",
					url : "PayrollStatusSave.do", 
					data: "payrollId=" + $("#payrollId").val() + "&cmd=FIN",
					async : false,
					beforeSend:function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
						alert("error:" + errorThrown + ", status:" + status);
					},
					success : function(data, status, jqXHR) { // on success..
				    	$("#payroll_form_content").html(jqXHR.responseText);
						var errors = jqXHR.getResponseHeader("errors_exists");
	 					if(!errors){
	 						jQuery("#payroll_grid").trigger("reloadGrid");
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
					complete:function(jqXHR, textStatus){
					}
				});
				return false;        
		});	     
		     

	     $("#cancelSalaryPayroll").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "Payroll.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#payroll_form_content").html(jqXHR.responseText);
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
			
	    Ladda.bind('#saveSalaryPayroll');
	    
		$("#saveSalaryPayroll").on('click', function() {
			$("#payroll_form :button").prop('disabled','disabled');
			$('#payroll_form').submit();
			return false;
		});	
		
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					$("#payroll_form").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#payroll_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
 					if(!errors){
 						jQuery("#payroll_grid").trigger("reloadGrid");
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
					$('#ajaxBusyB').hide();
				}
			});		
			$("#payroll_form :button").prop('disabled',false);
		})();
	    	
	});            
</script>