<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<nav>

	<ul>

		<li class="">
			<a href="Dashboard.dashboard.do" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent"><s:text name="dashboard.menu"/></span></a>
		</li>
		<s:if test="user.checkAccess('attnd', '_read')">
			<li><a href="AttendanceRecord.page.do">&nbsp; <i class="fa fa-edit"></i> <span class="menu-item-parent"><s:text name="adm.humman.attendance.menu"/></span></a></li>
		</s:if>
		<!-- Start KFIS Menu -->
		<s:if test="user.checkAccess('frm', '_read')">
		<li>
			<a href="#"><i class="fa fa-lg fa-fw fa-tree"></i> <span class="menu-item-parent"><s:text name="forest.management.menu"/></span></a>
			<ul>
				
					<s:if test="user.checkAccess('annpl', '_read')">
						<li> 
							<a href="Annualplan.page.do"><i class="fa fa-calendar"></i> <s:text name='annual.plan.menu'/></a>
						</li>
					</s:if>
					<s:if test="user.checkAccess('actdom', '_read')">
						<li> 
							<a href="ActivityDomain.page.do"><i class="fa fa-list-ul"></i> <s:text name='activity.domain.menu'/></a>
						</li>
						</s:if>
					<s:if test="user.checkAccess('seedinv','_read')">
						<li> 
							<a href="SeedInventory.page.do"><i class="fa fa-leaf"></i> <s:text name="seed.inv.menu"/></a>
						</li>
					</s:if>
					<s:if test="user.checkAccess('prq', '_read')">
						<li> 
							<a href="Annualplan.pvtReqPage.do"><i class="fa fa-outdent"></i> <s:text name='annual.plan.private.menu'/></a>
						</li>
					</s:if>	
					<s:if test="user.checkAccess('cst', '_read')">
						<li>
							<a href="Compartment.page.do"><i class="fa fa-globe"></i> <s:text name='frm.compartment.main.menu'/></a>
						</li>
					</s:if>
					<s:if test="user.checkAccess('simap', '_read')">	
						<li>
						
							<a href="SearchMapAction.page.do"><i class="fa fa-map-marker"></i> <s:text name='frm.search.in.map.menu'/></a>
						</li>
					</s:if>
					<s:if test="user.checkAccess('insoff', '_read')">	
						<li>
							<a href="#"><i class="fa fa-qrcode"></i> <s:text name='ins.office.menu'/></a>
								<ul>
									<li><a href="Inspection.page.do"><s:text name="ins.inspection.menu"/></a></li>
									<li><a href="ActionType.page.do"><s:text name="ins.action.type.menu"/></a></li>
								</ul>
						</li>
					</s:if>
					
					<s:if test="user.checkAccess('dphpet','_read')">
						<li><a href="#"><i class="fa fa-crosshairs"> </i><s:text name="frm.dhpet.menu"/></a>
							<ul>
								<s:if test="user.checkAccess('plains','_read')">
									<li><a href="DhpetPlanPeriod.page.do"> <s:text name='dhpet.period.plan.menu'/></a></li>
								</s:if >
								<s:if test="user.checkAccess('anmlloc','_read')">
									<li><a href="Location.map_page.do"><s:text name="dhpet.location.menu"/></a></li>
								</s:if>
								<s:if test="user.checkAccess('wdanml','_read')">
									<li><a href="WildAnimal.page.do"><s:text name="dhpet.wild.animal.menu"/></a></li>
								</s:if>
								<s:if test="user.checkAccess('dhactv','_read')">
									<li><a href="DhpetAnnualPlan.activities.do"> <s:text name='annual.plan.grid.activities.caption'/></a></li>
								</s:if>
								<s:if test="user.checkAccess('topr','_read')">
								<li><a href="TouristPurpose.page.do"> <s:text name='dhpet.tourism.prupose.menu'/> </a></li>
								</s:if>
								<s:if test="user.checkAccess('tore','_read')">
								<li><a href="TouristRegister.page.do"> <s:text name='dhpet.tourism.register.menu'/></a></li>
								</s:if>
								<s:if test="user.checkAccess('tozo','_read')">
								<li><a href="TouristZoneGeoms.page.do"> <s:text name="dhpet.tourist.zone.geoms.title"/></a></li>
								</s:if>
							</ul>
						</li>
					</s:if>	
					<s:if test="user.checkAccess('treesp','_read')">
						<li><a href="TreeSpecies.page.do"><i class="fa fa-pagelines"></i><s:text name="tree.species.menu"/></a></li>
					</s:if>
					<s:if test="user.checkAccess('firepo','_read')">
						<li><a href="FireReport.page.do"><i class="fa fa-fire"></i><s:text name="fire.report.menu"/></a></li>
					</s:if>
					<s:if test="user.checkAccess('corepo','_read')">
						<li><a href="Confiscation.page.do"><i class="fa fa-th"></i><s:text name="confiscation.report.menu"/></a></li>
					</s:if>
					
					<s:if test="user.checkAccess('lease','_read')">
					<li><a href="#"><i class="fa fa-crosshairs"> </i><s:text name="frm.lease.menu"/></a>
					<ul>
						<s:if test="user.checkAccess('lesreq','_read')">
					 		<li><a href="Request.page.do"><i class="fa fa-file-text-o"></i><s:text name="fal.lease.menu.request"/></a></li>
					 	</s:if>
					 	<s:if test="user.checkAccess('lesdes','_read')">
					 		<li><a href="RequestType.page.do"><i class="fa fa-file-text-o"></i><s:text name="fal.requesttype.menu.name"/></a></li>
					 	</s:if>	
					 </ul>
					</li>	 
					</s:if>
					
			</ul>
		</li>	
		</s:if>				
		<s:if test="user.checkAccess('ads', '_read')">
		<li>
			<a href="#"><i class="fa fa-lg fa-fw fa-group"></i> <span class="menu-item-parent"><s:text name="admin.support.menu"/></span></a>
			<ul>
				<s:if test="user.checkAccess('hrm', '_read')">
				<li>
					<a href="#"><i class="fa fa-lg fa-fw fa-user"></i> <s:text name="adm.humman.resource.menu"/></a>
					<ul>
						<s:if test="user.checkAccess('emp', '_read')">
							<li><a href="Employee.page.do"> <s:text name="adm.humman.resource.employee.menu"/></a></li>
						</s:if>	
						<s:if test="user.checkAccess('lve', '_read')">							
							<li>
								<a href="#"> <s:text name="adm.humman.resource.leave.menu"/></a>
								<ul>
									<s:if test="user.checkAccess('ent', '_read')">
										<li><a href="LeaveEntitlement.page.do"><s:text name="adm.humman.resource.leave.entitlement.menu"/></a></li>
									</s:if>
									<s:if test="user.checkAccess('cnf', '_read')">
										<li>
											<a href="#"><s:text name="adm.humman.resource.leave.configuration.menu"/></a>
												<ul>
													<s:if test="user.checkAccess('lvty', '_read')">
														<li><a href="LeaveType.page.do"><s:text name="adm.humman.resource.leave.configuration.leave.types.menu"/></a></li>
													</s:if>
												</ul>											
										</li>
									</s:if>
									<s:if test="user.checkAccess('lve', '_read')">
										<li><a href="Leave.page.do"><s:text name="adm.humman.resource.assign.leave.menu"/></a></li>	
									</s:if>	
								</ul>											
							</li>
						</s:if>
						<s:if test="user.checkAccess('trv', '_read')">	
							<li><a href="OfficialTravel.page.do"> <s:text name="adm.humman.resource.travel.menu"/></a></li>
						</s:if>
						<s:if test="user.checkAccess('hrmdec', '_read')">		
							<li> <a href="#"> <s:text name="adm.humman.resource.decision.menu"/></a>
								<ul>
								<s:if test="user.checkAccess('decstyp', '_read')">
									<li><a href="DecisionType.page.do"> <s:text name="adm.humman.resource.decision.type.menu"/></a></li>
								</s:if>
								<s:if test="user.checkAccess('decs', '_read')">	
									<li><a href="Decision.page.do"> <s:text name="adm.humman.resource.decision.menu"/></a></li>
								</s:if>	
								</ul>
							</li>
						</s:if>
						<s:if test="user.checkAccess('hrmannpl', '_read')">
							<li><a href="HrmAnnPlan.page.do"> <s:text name="hrm.ann.plan.menu"/></a></li>
						</s:if>
				
				</ul>
				
				</s:if>
				
				<s:if test="user.checkAccess('fibu', '_read')">
				<li>
					<a href="#"><i class="fa fa-money"></i> <s:text name="ads.finance.budgeting.menu"/></a>
					<ul>
						<s:if test="user.checkAccess('fity', '_read') && user.getOrganisation().getOperLevelVal()=='C'">
							<li><a href="FinType.page.do"><s:text name="ads.financial.type.menu"/></a></li>
							<!-- 
							<li><a href="FinType.pageTree.do"><s:text name="fin.economiccode.menu"/></a></li>
							-->
						</s:if>
											
						<s:if test="user.checkAccess('fiin', '_read')">
							<li><a href="FinInput.page.do"><s:text name="finance.input.menu"/></a></li>
						</s:if>
						<s:if test="user.checkAccess('fiop', '_read') && (user.getOrganisation().getOperLevelVal()=='C' ||  user.getOrganisation().getOperLevelVal()=='R')">
							<li>
								<a href="#"><s:text name="ads.financial.output.menu"/></a>
								<ul>
									<s:if test="user.checkAccess('sal', '_read')">
									<!-- 
									<li><a href="FinOutput.salarypage.do"><s:text name="finance.salary.menu"/></a></li>
									-->
									<li>
										<a href="Salary.dashboard.do"><s:text name="hrm.employee.salary.menu"/></a>
										<ul>						
											<li><a href="Salary.dashboard.do"> <s:text name="hrm.employee.salary.dashboard"/></a></li>
											<li><a href="Salary.page.do"> <s:text name="hrm.employee.salary.definition.menu"/></a></li>
											<li><a href="Payslip.page.do"> <s:text name="hrm.employee.salary.payslip.menu"/></a></li>
											<li><a href="Payroll.page.do"> <s:text name="hrm.employee.salary.payroll.menu"/></a></li>
											<li><a href="TaxRate.page.do"> <s:text name="hrm.employee.salary.taxrate.menu"/></a></li>
										</ul>								
									</li>										
									</s:if>
									<s:if test="user.checkAccess('cost', '_read')">
										<li><a href="FinOutput.costspage.do"><s:text name="finance.costs.menu"/></a></li>
									</s:if>
								</ul>
							</li>
						</s:if>

	

						<s:if test="user.checkAccess('conto', '_read') && user.getOrganisation().getOperLevelVal()=='C'">
							<li><a href="Contractor.page.do"> <s:text name="ads.finance.budfeting.contractors.menu"/></a></li>
						</s:if>
						<s:if test="user.checkAccess('cont', '_read') && user.getOrganisation().getOperLevelVal()=='C'">
							<li><a href="Contract.page.do"> <s:text name='finance.comtract.menu'/></a></li>
						</s:if>
						<!--<s:if test="user.checkAccess('buma', '_read') && user.getOrganisation().getOperLevelVal()=='C'">
							<li><a href="BudgetMainntenance.page.do"> <s:text name='budget.maintenance.menu'/></a></li>
						</s:if>-->
						<s:if test="user.checkAccess('alloc', '_read') && user.getOrganisation().getOperLevelVal()=='C'">
							<li><a href="BudgetAllocation.page.do"> <s:text name='fin.allocation.menu'/></a></li>
						</s:if>			
															
				
					</ul>
				</li>
				</s:if>
				
				<s:if test="user.checkAccess('logi', '_read')">
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-truck"></i> <s:text name='logistic.menu'/></a>
						<ul>
						
						<s:if test="user.checkAccess('veh', '_read')">
							<li><a href="Vehicles.page.do"> <s:text name='vehicle.menu'/></a></li>
						</s:if>
						    <li><a href="Device.vehicles_trackin_map.do"> <s:text name='tracking.menu'/> </a></li>
						</ul>
					</li>
				</s:if>
				
				<s:if test="user.checkAccess('asse', '_read')">
					<li><a href="Asset.page.do"><i class="fa fa-tasks"></i>  <s:text name='asset.menu'/></a></li>
				</s:if>
				
				<s:if test="user.checkAccess('prgo', '_read')">
					
					<li>
						<a href="#"><i class="fa fa-folder"></i> <s:text name='procured.goods.menu'/></a>
						<ul>
							<s:if test="user.checkAccess('reqs', '_read')">
								<li><a href="PReq.page.do"> <s:text name="requisition.menu"/></a></li>
							</s:if>
							<s:if test="user.checkAccess('puord', '_read')">
								<li><a href="POrder.page.do"> <s:text name="purchase.order.menu"/></a></li>
							</s:if>
							<s:if test="user.checkAccess('bpart', '_read')">
								<li><a href="BPartner.page.do"><i class="fa fa-lg fa-fw fa-user-md"></i> <s:text name='adm.bpartner.menu'/></a></li>
							</s:if>									
						</ul>
					</li>	
				</s:if>	
				<s:if test="user.checkAccess('procu', '_read')">
					<li>
						<a href="#"><i class="fa fa-cogs"></i> <s:text name="procurement.menu"/></a>
						<ul>
							<s:if test="user.checkAccess('tnreq', '_read')">
								<li><a href="TenderRequest.page.do"> <s:text name='tender.request.menu'/></a></li>
							</s:if>
							<s:if test="user.checkAccess('bid', '_read')">
								<li><a href="Bidder.page.do">&nbsp;<s:text name='tender.bidder.menu'/></a></li>
							</s:if>
						</ul>
					</li>
				</s:if>
				<s:if test="user.checkAccess('exoff','_read')">
					<li>
						<a href="#"><i class="fa fa-suitcase"></i> <s:text name='ads.eo.menu'/></a>
						<ul>
							<s:if test="user.checkAccess('dpmngmt','_read')">
								<li><a href="DpMngmt.page.do">&nbsp;<s:text name='ads.eo.doc.protocol.menu'/></a></li>	
							</s:if>
							<s:if test="user.checkAccess('docmngmt', '_read')">			
								<li>
									<a href="#"><i class="fa fa-lg fa-fw fa-copy"></i>&nbsp;<s:text name='adm.doc.mngmt.menu'/></a>
									<ul>
									<s:if test="user.checkAccess('doccat', '_read')">	
										<li>
											<a href="DpCatMngmt.page.do"><s:text name='adm.doc.mngmt.category.menu'/></a>
										</li>
									</s:if>
									<s:if test="user.checkAccess('doctyp', '_read')">
										<li>
											<a href="DpTypeMngmt.page.do"><s:text name='adm.doc.mngmt.type.menu'/></a>
										</li>	
									</s:if>
									</ul>						
								</li>
							</s:if>	
						</ul>
												
					</li>					
				</s:if>
				
				<s:if test="user.checkAccess('lese', '_read')">
					<li><a href="LawSuit.page.do"><i class="fa fa-legal"></i> <s:text name='legal.sector.menu'/></a></li>	
				</s:if>
			</ul>
		</li>	
		</s:if>
		<s:if test="user.checkAccess('adm', '_read')">
		<li>
			<a href="#"><i class="fa fa-lg fa-fw fa-cogs"></i> <span class="menu-item-parent"> <s:text name='adm.system.administration.menu'/> </span></a>
			<ul>
				<s:if test="user.checkAccess('pers', '_read')">
					<li><a href="Person.page.do"><i class="fa fa-lg fa-fw fa-user"></i> <s:text name='adm.person.menu'/></a></li>
				</s:if>
				<s:if test="user.checkAccess('user', '_read')">
					<li><a href="User.page.do"><i class="fa fa-lg fa-fw fa-user"></i> <s:text name='adm.users.menu'/></a></li>
				</s:if>
				<s:if test="user.checkAccess('role', '_read')">
					<li><a href="Role.page.do"><i class="fa fa-lg fa-fw fa-shield"></i> <s:text name='adm.roles.menu'/></a></li>
				</s:if>
				<s:if test="user.checkAccess('obj', '_read')">
					<li><a href="RbacObject.page.do"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i> <s:text name='adm.objects.menu'/></a></li>
				</s:if>
				<s:if test="user.checkAccess('per', '_read')">
					<li><a href="Permission.page.do"><i class="fa fa-lg fa-fw fa-lock"></i> <s:text name='adm.permission.menu'/></a></li>	
				</s:if>	
				<s:if test="user.checkAccess('orga', '_read')">									
					<li><a href="Organisation.page.do"><i class="fa fa-lg fa-fw fa-building"></i> <s:text name='adm.organisations.menu'/></a></li>
				</s:if>
				
				<li><a href="AdminMonitor.page.do"><i class="fa fa-lg fa-fw fa-building"></i> Admin Monitor</a></li>
				
			</ul>
		</li>					
		</s:if>

		<s:if test="user.checkAccess('dem', '_read')">
		<li>
			<a href="#"><i class="fa fa-lg fa-fw  fa-database"></i><span class="menu-item-parent"> <s:text name='data.exchange.menu'/></span></a>
			<ul>
				<s:if test="user.checkAccess('fiskos', '_read')">
					<li><a href="Fiskos.page.do"><i class="fa fa-lg fa-fw fa-share"></i> <s:text name='fiskos.menu'/></a></li>
				</s:if>
				<li><a href="ImportShape.page.do"><i class="fa fa-lg fa-fw fa-share"></i> <s:text name='data.exchange.import.shape.menu'/></a></li>
				<li><a href="Export.page.do"><i class="fa fa-lg fa-fw fa-share-square"></i> <s:text name='data.exchange.export.shape.menu'/></a></li>
			</ul>
		</li>					
		</s:if>		
		<s:if test="user.checkAccess('mer', '_read')">
		<li>
			<a href="#"><i class="fa fa-lg fa-fw  fa-columns"></i><span class="menu-item-parent"> <s:text name='mer.administration.menu'/></span></a>
			<ul>
				<s:if test="user.checkAccess('strat', '_read')">
					<li><a href="#"><i class="fa fa-lg fa-fw fa-outdent"></i> <s:text name='mer.strategy.menu'/></a>
						<ul>
							<s:if test="user.checkAccess('proj', '_read')">
								<li><a href="Project.page.do"> <s:text name='mer.strategy.project.menu'/></a></li>
							</s:if>
							<s:if test="user.checkAccess('projmgmt', '_read')">
								<li><a href="MerStrategy.page.do"><s:text name='mer.strategy.project.management.menu'/></a></li>
							</s:if>
							<s:if test="user.checkAccess('plper', '_read')">
								<li><a href="PlanPeriod.page.do"><s:text name='mer.strategy.plan.period.menu'/></a></li>
							</s:if>
						</ul>
					</li>
				</s:if>
				<s:if test="user.checkAccess('stratexc', '_read')">
					<li><a href="Execution.strategyPage.do"><i class="fa fa-lg fa-fw fa-tasks"></i> <s:text name='mer.strategy.execution.menu'/></a></li>
				</s:if>
			</ul>
		</li>					
		</s:if>	
		<s:if test="user.checkAccess('affrf', '_read')">
			<li>
				<a href="AffRefProjects.page.do"><i class="fa fa-lg fa-fw  fa-pagelines"></i><span class="menu-item-parent"> <s:text name="afforestation.reforestation.projects.menu"/></span></a>
			</li>	
		</s:if>
		<s:if test="user.checkAccess('efp', '_read')">
			<li>
				<a href="Publish.page.do"><i class="fa fa-lg fa-fw  fa-rub"></i><span class="menu-item-parent"> <s:text name="publishing.menu"/></span></a>
			</li>	
		</s:if>
		<li>
			<a href="Help.page.do"><i class="fa fa-lg fa-fw  fa-question-circle"></i><span class="menu-item-parent"> <s:text name="help.menu"/></span></a>
		</li>				
		<li>
			<a href="http://kosovoforests.org"><i class="fa fa-lg fa-fw  fa-external-link-square"></i><span class="menu-item-parent"> <s:text name="Kosovo forest"/></span></a>
		</li>			
	</ul>
</nav>
		
<!-- END NAVIGATION -->