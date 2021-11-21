<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<style>
.input .greetings{
/*   width: 33%; */
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  }
</style>
<div>

	<!-- widget content -->
	<div class="widget-body">
	<s:if test="standgrowth">
		<button id="standGrowth" class="btn btn-primary" type="button">
			<i class="fa fa-plus-square"></i>
			<s:text name="label.button.do.growth"></s:text>
		</button>
	</s:if>
		<form id="stand_form" class="smart-form"
			action="StandSave.do" accept-charset="utf8" method="post">
		
			<fieldset>
				<legend><s:text name="frm.stand.data"/>  <s:property value='stand.compartment.compNr'/>/ <s:property value='stand.standNr'/></legend>
				<button id="geomBtn" type="button" class="btn btn-primary btn-lg btn-block" style="height: 32px; margin-top: 15px; padding-top: 5px; padding-bottom: 5px; display: block;">
						<s:text name="stand.geom.detail.title"/>
				</button></br>
				
				<input id="stand.id" name="stand.id" value="<s:property value='stand.id'/>" type="hidden">
				
				<!-- START stand.compartment -->
					<input type="hidden" id="stand.compartment.id" name="stand.compartment.id"  value="<s:property value='stand.compartment.id'/>">
					<input type="hidden" id="stand.compartment.managementUnitPeriod.id" name="stand.compartment.managementUnitPeriod.id"  value="<s:property value='stand.compartment.managementUnitPeriod.id'/>">
					<input type="hidden" id="stand.standId" name="stand.standId"  value="<s:property value='stand.standId'/>">
					<input type="hidden" id="stand.standNr" name="stand.standNr"  value="<s:property value='stand.standNr'/>" >
					<input type="hidden" id="mupId" name="mupId"  value="<s:property value='mupId'/>" >
					<input type="hidden" id="standData" name="standData"  value="<s:property value='standData'/>" >
				<!-- END stand.compartment -->
				<div class="row">
					<!-- START stand.basalArea -->
						<section class="col col-4">
							<label class="input">*<s:text name="frm.stand.basal.area"/> (ha):
								<s:if test="fieldErrors.get('stand.basalArea')!=null">
								<div class="form-group has-error">
									<input data="number" readonly="readonly" class="form-control input-xs-g" type="text" id="stand.basalArea" name="stand.basalArea" >
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.basalArea')"/> </span>
								</div>
							</s:if>
							<s:else>
								<div class="form-group">
									<input readonly="readonly" class="form-control input-xs-g" type="text" id="stand.basalArea" name="stand.basalArea" value="<s:property value='stand.basalArea'/>">
								</div>
							</s:else>
							</label>
						</section>
					<!-- END stand.basalArea -->
					
					<!-- START stand.theGeom -->
							<input type="hidden" id="geometry" readonly="readonly" name="geometry" placeholder="TheGeom" value="<s:property value='stand.theGeom'/>">
					<!-- END stand.theGeom -->
					
					<!-- START stand.littercov -->
						<section class="col col-4">
							<label class="input"> <s:text name="frm.stand.litter.cov"/>:
								<input data="number" class="form-control input-xs-g" type="text" id="stand.littercov" name="stand.littercov" value="<s:property value='stand.littercov'/>"  >
							</label>
						</section>
					<!-- END stand.littercov -->
					
					<!-- START stand.slope -->
						<section class="col col-4">
						<label class="input"> <s:text name="frm.stand.slope"/>:
								<input data="number" class="form-control input-xs-g" type="text" id="stand.slope" name="stand.slope" value="<s:property value='stand.slope'/>"  >
							</label>
						</section>
					<!-- END stand.slope -->
					
				</div>
				
				<div class="row">
						<!-- START stand.standType -->
						<section class="col col-6">
							<label class="input">* <s:text name="frm.stand.stand.type"/>:
								<s:if test="fieldErrors.get('stand.standType')!=null">
									<div class="has-error">
									<select class="form-control" id="stand.standType" name="stand.standType">
										<s:iterator value="standtypes" var="el">
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
									<span class="help-block has-error"><i class="fa fa-warning  has-error"></i> <s:property value="fieldErrors.get('stand.standType')"/> </span>
									</div>
								</s:if>
								<s:else>
									<select class="form-control" id="stand.standType" name="stand.standType">
										<s:iterator value="standtypes" var="el">
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
								</s:else>
							</label>
						</section>
						<!-- END stand.standType -->
						<!-- START stand.noPlots -->
						<section class="col col-6" id="noPlots">
							<label class="input"> <div class="greetings" title="<s:text name="dem.fiskos.plots.nr"/>"><s:text name="dem.fiskos.plots.nr"/>:</div>
								<s:if test="fieldErrors.get('stand.noPlots')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.noPlots" name="stand.noPlots" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.noPlots')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.noPlots" name="stand.noPlots" value="<s:property value='stand.noPlots'/>" >
									</div>
								</s:else>
							</label>
						</section>
					<!-- END stand.noPlots -->
					<!-- START stand.accessType -->
						<section class="col col-10">
							<label class="input"> *<s:text name="frm.stand.access.type"/>:
								<s:if test="fieldErrors.get('stand.accessType')!=null">
									<div class="has-error">
										<select  class="form-control" id="stand.accessType" name="stand.accessType">
											<s:iterator value="accesstype" var="el">
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
										<span class="help-block has-error"><i class="fa fa-warning  has-error"></i> <s:property value="fieldErrors.get('stand.accessType')"/> </span>
									</div>
								</s:if>
								<s:else>
									<select  class="form-control" id="stand.accessType" name="stand.accessType">
										<s:iterator value="accesstype" var="el">
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
								</s:else>
							</label>
						</section>
						<!-- END stand.accessType -->	
					
						<!-- START stand.mngmClass -->
							<section class="col col-12">
								<label class="input"> *<s:text name="dem.fiskos.managment.class.id"/>:
									<s:if test="fieldErrors.get('stand.mngmClass')!=null">
										<div class="has-error">
											<select class="form-control has-error" id="stand.mngmClass" name="stand.mngmClass">
												<s:iterator value="mngmclassList" var="el">
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
											<span class="help-block has-error"><i class="fa fa-warning  has-error"></i> <s:property value="fieldErrors.get('stand.mngmClass')"/> </span>
										</div>
									</s:if>
									<s:else>
										<select class="form-control" id="stand.mngmClass" name="stand.mngmClass">
											<s:iterator value="mngmclassList" var="el">
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
									</s:else>
								</label>
							</section>
						<!-- END stand.mngmClass -->
					
					</div>
					
					<div class="row" id="decidose">
						<!-- START stand.treeSpeciesByDecidouse -->
						<section class="col col-6">
							<label  class="input" >*<s:text name='frm.stand.decidouse'/>:
								<s:if test="fieldErrors.get('treeSpeciesByDecidouseId')!=null">
									<div class="form-group has-error">
										<input class="form-control input-xs-g" id="treeSpeciesByDecidouseName" name="treeSpeciesByDecidouseName"  placeholder="<s:text name="tree.species.please.type"/>" type="text" />
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treeSpeciesByDecidouseId')"/> </span>
										<input id="treeSpeciesByDecidouseId" name="treeSpeciesByDecidouseId" type="hidden">
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<s:if test="locale.language == 'en'">
										<s:set name="tsdName" value="stand.treeSpeciesByDecidouse.nameEn"/>
										<s:set name="tsdGroup" value="stand.treeSpeciesByDecidouse.speciesGroup.DOMTEXT_EN"/>
										</s:if>
										<s:elseif test="locale.language == 'sr'">
										<s:set name="tsdName" value="stand.treeSpeciesByDecidouse.nameSr"/>
										<s:set name="tsdGroup" value="stand.treeSpeciesByDecidouse.speciesGroup.DOMTEXT_SR"/>
										</s:elseif>
										<s:else>
										<s:set name="tsdName" value="stand.treeSpeciesByDecidouse.nameAl"/>
										<s:set name="tsdGroup" value="stand.treeSpeciesByDecidouse.speciesGroup.DOMTEXT"/>
										</s:else>						
										<input class="form-control input-xs-g" id="treeSpeciesByDecidouseName" name="treeSpeciesByDecidouseName" value="<s:property value='#tsdName'/>"  placeholder="<s:text name="tree.species.please.type"/>" type="text" >
										<input id="reeSpeciesByDecidouseId" name="treeSpeciesByDecidouseId" value="<s:property value='stand.treeSpeciesByDecidouse.id'/>" type="hidden" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.treeSpeciesByDecidouse -->
						
						<!-- START stand.decidouseBon -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.decidouse.bon"/>"><s:text name="frm.stand.decidouse.bon"/>:</div>
								<s:if test="fieldErrors.get('stand.decidouseBon')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.decidouseBon" name="stand.decidouseBon" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.decidouseBon')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.decidouseBon" name="stand.decidouseBon" value="<s:property value='stand.decidouseBon'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.decidouseBon -->
						
						<!-- START stand.decidousePerc -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.decidouse.perc"/>"><s:text name="frm.stand.decidouse.perc"/>:</div>
								<s:if test="fieldErrors.get('stand.decidousePerc')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.decidousePerc" name="stand.decidousePerc" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.decidousePerc')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.decidousePerc" name="stand.decidousePerc" value="<s:property value='stand.decidousePerc'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.decidousePerc -->
						
					</div>
					
					<div class="row" id="conifer">
						<!-- START stand.treeSpeciesByConifer -->
						<section class="col col-6">
						<label class="input">*<s:text name='annu.mgmt.unit.label.coniferous'/>:
							<s:if test="fieldErrors.get('treeSpeciesByConiferId')!=null">
								<div class="form-group has-error">
									<input class="form-control input-xs-g" id="treeSpeciesByConiferName" name="treeSpeciesByConiferName"  placeholder="<s:text name="tree.species.please.type"/>" type="text" />
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treeSpeciesByConiferId')"/> </span>
									<input id="treeSpeciesByConiferId" name="treeSpeciesByConiferId" type="hidden">
								</div>
							</s:if>
							<s:else>
								<div class="form-group">
									<s:if test="locale.language == 'en'">
										<s:set name="tscName" value="stand.treeSpeciesByConifer.nameEn"/>
										<s:set name="tscGroup" value="stand.treeSpeciesByConifer.speciesGroup.DOMTEXT_EN"/>
									</s:if>
									<s:elseif test="locale.language == 'sr'">
										<s:set name="tscName" value="stand.treeSpeciesByConifer.nameSr"/>
										<s:set name="tscGroup" value="stand.treeSpeciesByConifer.speciesGroup.DOMTEXT_SR"/>
									</s:elseif>
									<s:else>
										<s:set name="tscName" value="stand.treeSpeciesByConifer.nameAl"/>
										<s:set name="tscGroup" value="stand.treeSpeciesByConifer.speciesGroup.DOMTEXT"/>
									</s:else>						
									<input class="form-control input-xs-g" id="treeSpeciesByConiferName" name="treeSpeciesByConiferName" value="<s:property value='#tsdName'/>"  placeholder="<s:text name="tree.species.please.type"/>" type="text" >
									<input id="treeSpeciesByConiferId" name="treeSpeciesByConiferId" value="<s:property value='stand.treeSpeciesByConifer.id'/>" type="hidden" >
								</div>
							</s:else>
						</label>
						</section>
						<!-- END stand.treeSpeciesByConifer -->
						
						<!-- START stand.coniferBon -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.conifer.bon"/>"><s:text name="frm.stand.conifer.bon"/>:</div>
								<s:if test="fieldErrors.get('stand.coniferBon')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.coniferBon" name="stand.coniferBon" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.coniferBon')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.coniferBon" name="stand.coniferBon" value="<s:property value='stand.coniferBon'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.coniferBon -->
						
						<!-- START stand.coniferPerc -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.confer.perc"/>"><s:text name="frm.stand.confer.perc"/>:</div>
								<s:if test="fieldErrors.get('stand.coniferPerc')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.coniferPerc" name="stand.coniferPerc" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.coniferPerc')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.coniferPerc" name="stand.coniferPerc" value="<s:property value='stand.coniferPerc'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.coniferPerc -->
					</div>
					
					<div class="row" id="specie">
					
					<!-- START stand.treeSpeciesByTree1 -->
						<section class="col col-6">
						<label  class="input" >*<s:text name='frm.stand.tree1'/>:
								<s:if test="fieldErrors.get('treeSpeciesByTree1Id')!=null">
									<div class="form-group has-error">
										<input  class="form-control input-xs-g" id="treeSpeciesByTree1Name" name="treeSpeciesByTree1Name"  placeholder="<s:text name="tree.species.please.type"/>" type="text" />
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treeSpeciesByTree1Id')"/> </span>
										<input  id="treeSpeciesByTree1Id" name="treeSpeciesByTree1Id" type="hidden">
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<s:if test="locale.language == 'en'">
										<s:set name="ts1Name" value="stand.treeSpeciesByTree1.nameEn"/>
										<s:set name="ts1Group" value="stand.treeSpeciesByTree1.speciesGroup.DOMTEXT_EN"/>
										</s:if>
										<s:elseif test="locale.language == 'sr'">
										<s:set name="ts1Name" value="stand.treeSpeciesByTree1.nameSr"/>
										<s:set name="ts1Group" value="stand.treeSpeciesByTree1.speciesGroup.DOMTEXT_SR"/>
										</s:elseif>
										<s:else>
										<s:set name="ts1Name" value="stand.treeSpeciesByTree1.nameAl"/>
										<s:set name="ts1Group" value="stand.treeSpeciesByTree1.speciesGroup.DOMTEXT"/>
										</s:else>						
										<input class="form-control input-xs-g" id="treeSpeciesByTree1Name" name="treeSpeciesByTree1Name" value="<s:property value='#tsdName'/>"  placeholder="<s:text name="tree.species.please.type"/>" type="text" >
										<input id="treeSpeciesByTree1Id" name="treeSpeciesByTree1Id" value="<s:property value='stand.treeSpeciesByTree1.id'/>" type="hidden" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.treeSpeciesByTree1 -->
						
						<!-- START stand.treeSpeciesByTree2 -->
						<section class="col col-6">
						<label class="input">*<s:text name='frm.stand.tree2'/>:
							<s:if test="fieldErrors.get('treeSpeciesByTree2Id')!=null">
								<div class="form-group has-error">
									<input class="form-control input-xs-g" id="treeSpeciesByTree2Name" name="treeSpeciesByTree2Name"  placeholder="<s:text name="tree.species.please.type"/>" type="text" />
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treeSpeciesByTree2Id')"/> </span>
									<input id="treeSpeciesByTree2Id" name="treeSpeciesByTree2Id" type="hidden">
								</div>
							</s:if>
							<s:else>
								<div class="form-group">
									<s:if test="locale.language == 'en'">
									<s:set name="ts2Name" value="stand.treeSpeciesByTree2.nameEn"/>
									<s:set name="ts2Group" value="stand.treeSpeciesByTree2.speciesGroup.DOMTEXT_EN"/>
									</s:if>
									<s:elseif test="locale.language == 'sr'">
									<s:set name="ts2Name" value="stand.treeSpeciesByTree2.nameSr"/>
									<s:set name="ts2Group" value="stand.treeSpeciesByTree2.speciesGroup.DOMTEXT_SR"/>
									</s:elseif>
									<s:else>
									<s:set name="ts2Name" value="stand.treeSpeciesByTree2.nameAl"/>
									<s:set name="ts2Group" value="stand.treeSpeciesByTree2.speciesGroup.DOMTEXT"/>
									</s:else>						
									<input class="form-control input-xs-g" id="treeSpeciesByTree2Name" name="treeSpeciesByTree2Name" value="<s:property value='#tsdName'/>"  placeholder="<s:text name="tree.species.please.type"/>" type="text" >
									<input id="treeSpeciesByTree2Id" name="treeSpeciesByTree2Id" value="<s:property value='stand.treeSpeciesByTree2.id'/>" type="hidden" >
								</div>
							</s:else>
						</label>
						</section>
						<!-- END stand.treeSpeciesByTree2 -->
						
					</div>
					
					
				    <div class="row">
				    	<!-- START stand.treeSpeciesByTree3 -->
						<section class="col col-6" id="specie3">
							<label class="input">*<s:text name='frm.stand.tree3'/>:
								<s:if test="fieldErrors.get('treeSpeciesByTree3Id')!=null">
									<div class="form-group has-error">
										<input class="form-control input-xs-g" id="treeSpeciesByTree3Name" name="treeSpeciesByTree3Name"  placeholder="<s:text name="tree.species.please.type"/>" type="text" />
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treeSpeciesByTree3Id')"/> </span>
										<input id="treeSpeciesByTree3Id" name="treeSpeciesByTree3Id" type="hidden">
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<s:if test="locale.language == 'en'">
										<s:set name="ts3Name" value="stand.treeSpeciesByTree3.nameEn"/>
										<s:set name="tsdGroup" value="stand.treeSpeciesByTree3.speciesGroup.DOMTEXT_EN"/>
										</s:if>
										<s:elseif test="locale.language == 'sr'">
										<s:set name="ts3Name" value="stand.treeSpeciesByTree3.nameSr"/>
										<s:set name="ts3Group" value="stand.treeSpeciesByTree3.speciesGroup.DOMTEXT_SR"/>
										</s:elseif>
										<s:else>
										<s:set name="ts3Name" value="stand.treeSpeciesByTree3.nameAl"/>
										<s:set name="ts3Group" value="stand.treeSpeciesByTree3.speciesGroup.DOMTEXT"/>
										</s:else>						
										<input class="form-control input-xs-g" id="treeSpeciesByTree3Name" name="treeSpeciesByTree3Name" value="<s:property value='#tsdName'/>"  placeholder="<s:text name="tree.species.please.type"/>" type="text" >
										<input id="treeSpeciesByTree3Id" name="treeSpeciesByTree3Id" value="<s:property value='stand.treeSpeciesByTree3.id'/>" type="hidden" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.treeSpeciesByTree3 -->
						
						<!-- START stand.origin -->
						<section class="col col-6">
							<label class="input"> <s:text name="frm.stand.origin"/>:
								<select class="form-control" id="stand.origin" name="stand.origin">
									<s:iterator value="origins" var="el">
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
							</label>
						</section>
					<!-- END stand.origin -->
					
					</div>
					
					<div class="row" id="perc">
					
						<!-- START stand.perc030 -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.perc03"/>"><s:text name="frm.stand.perc03"/>:</div>
								<s:if test="fieldErrors.get('stand.perc030')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.perc030" name="stand.perc030" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.perc030')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.perc030" name="stand.perc030" value="<s:property value='stand.perc030'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.perc030 -->
						
						<!-- START stand.perc3050 -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.perc35"/>"><s:text name="frm.stand.perc35"/>:</div>
								<s:if test="fieldErrors.get('stand.perc3050')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.perc3050" name="stand.perc3050" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.perc3050')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.perc3050" name="stand.perc3050" value="<s:property value='stand.perc3050'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.perc3050 -->
						<!-- START stand.perc5070 -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.perc57"/>"><s:text name="frm.stand.perc57"/>:</div>
								<s:if test="fieldErrors.get('stand.perc5070')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.perc5070" name="stand.perc5070" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.perc5070')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.perc5070" name="stand.perc5070" value="<s:property value='stand.perc5070'/>" >
									</div>
								</s:else>
							</label>
						</section>
					<!-- END stand.perc5070 -->
					
						<!-- START stand.perc70100 -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.perc710"/>"><s:text name="frm.stand.perc710"/>:</div>
								<s:if test="fieldErrors.get('stand.perc70100')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.perc70100" name="stand.perc70100" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.perc70100')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.perc70100" name="stand.perc70100" value="<s:property value='stand.perc70100'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.perc70100 -->
					</div>
					
					<div class="row" id="clCon">
					
						<!-- START stand.cl1PercCon -->
						<section class="col col-3">
							<label class="input"> <div class="greetings"><s:text name="frm.stand.cl1.perc.con"/>:</div>
								<s:if test="fieldErrors.get('stand.cl1PercCon')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.cl1PercCon" name="stand.cl1PercCon" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.cl1PercCon')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.cl1PercCon" name="stand.cl1PercCon" value="<s:property value='stand.cl1PercCon'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.cl1PercCon -->
						
						<!-- START stand.cl2PercCon -->
						<section class="col col-3">
							<label class="input"> <div class="greetings"><s:text name="frm.stand.cl2.perc.con"/>:</div>
								<s:if test="fieldErrors.get('stand.cl2PercCon')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.cl2PercCon" name="stand.cl2PercCon" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.cl2PercCon')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.cl2PercCon" name="stand.cl2PercCon" value="<s:property value='stand.cl2PercCon'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.cl2PercCon -->
						
						<!-- START stand.cl3PercCon -->
							<section class="col col-3">
								<label class="input"> <div class="greetings"><s:text name="frm.stand.cl3.perc.con"/>:</div>
									<s:if test="fieldErrors.get('stand.cl3PercCon')!=null">
										<div class="form-group has-error">
											<input type="number" class="form-control input-xs-g" id="stand.cl3PercCon" name="stand.cl3PercCon" >
											<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.cl3PercCon')"/> </span>
										</div>
									</s:if>
									<s:else>
										<div class="form-group">
											<input type="number" class="form-control input-xs-g" id="stand.cl3PercCon" name="stand.cl3PercCon" value="<s:property value='stand.cl3PercCon'/>" >
										</div>
									</s:else>
								</label>
							</section>
						<!-- END stand.cl3PercCon -->
						<!-- START stand.cl4PercCon -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.cl4.perc.con"/>"><s:text name="frm.stand.cl4.perc.con"/>:</div>
								<s:if test="fieldErrors.get('stand.cl4PercCon')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.cl4PercCon" name="stand.cl4PercCon" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.cl4PercCon')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.cl4PercCon" name="stand.cl4PercCon" value="<s:property value='stand.cl4PercCon'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.cl4PercCon -->
						
					</div>
					
					<div class="row" id="clDec">
					
						<!-- START stand.cl1PercDec -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.cl1.perc.dec"/>"><s:text name="frm.stand.cl1.perc.dec"/>:</div>
								<s:if test="fieldErrors.get('stand.cl1PercDec')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.cl1PercDec" name="stand.cl1PercDec" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.cl1PercDec')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.cl1PercDec" name="stand.cl1PercDec" value="<s:property value='stand.cl1PercDec'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.cl1PercDec -->
						
						<!-- START stand.cl2PercDec -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.cl2.perc.dec"/>"><s:text name="frm.stand.cl2.perc.dec"/>:</div>
								<s:if test="fieldErrors.get('stand.cl2PercDec')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.cl2PercDec" name="stand.cl2PercDec" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.cl2PercDec')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.cl2PercDec" name="stand.cl2PercDec" value="<s:property value='stand.cl2PercDec'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.cl2PercDec -->
						<!-- START stand.cl3PercDec -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.cl3.perc.dec"/>"><s:text name="frm.stand.cl3.perc.dec"/>:</div>
								<s:if test="fieldErrors.get('stand.cl3PercDec')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.cl3PercDec" name="stand.cl3PercDec" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.cl3PercDec')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.cl3PercDec" name="stand.cl3PercDec" value="<s:property value='stand.cl3PercDec'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.cl3PercDec -->
						
						<!-- START stand.cl4PercDec -->
						<section class="col col-3">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.cl4.perc.dec"/>"><s:text name="frm.stand.cl4.perc.dec"/>:</div>
								<s:if test="fieldErrors.get('stand.cl4PercDec')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.cl4PercDec" name="stand.cl4PercDec" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.cl4PercDec')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.cl4PercDec" name="stand.cl4PercDec" value="<s:property value='stand.cl4PercDec'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.cl4PercDec -->
						
					</div>
					
				    <div class="row">
						<!-- START stand.trees -->
							<section class="col col-3" id="trees">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.trees"/>"><s:text name="frm.stand.trees"/>/ha:</div>
									<input data="numberLong" class="form-control input-xs-g" type="text" id="stand.trees" name="stand.trees" value="<s:property value='stand.trees'/>"  >
								</label>
							</section>
						<!-- END stand.trees -->
						<!-- START stand.volumeM3ha -->
							<section class="col col-3" id="volumeM3ha">
								<label class="input"> <div class="greetings" title="<s:text name="frm.stand.volume.m3.ha"/>"><s:text name="frm.stand.volume.m3.ha"/>:</div>
									<s:if test="fieldErrors.get('stand.volumeM3ha')!=null">
										<div class="form-group has-error">
											<input type="number" class="form-control input-xs-g" id="stand.volumeM3ha" name="stand.volumeM3ha" >
											<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.volumeM3ha')"/> </span>
										</div>
									</s:if>
									<s:else>
										<div class="form-group">
											<input type="number" class="form-control input-xs-g" id="stand.volumeM3ha" name="stand.volumeM3ha" value="<s:property value='stand.volumeM3ha'/>" >
										</div>
									</s:else>
								</label>
							</section>
						<!-- END stand.volumeM3ha -->
						
						<!-- START stand.age -->
						<section class="col col-3" id="age">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.age"/>"><s:text name="frm.stand.age"/>:</div>
								<s:if test="fieldErrors.get('stand.age')!=null">
									<div class="form-group has-error">
										<input type="text" class="form-control input-xs-g" id="stand.age" name="stand.age" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.age')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="text" class="form-control input-xs-g" id="stand.age" name="stand.age" value="<s:property value='stand.age'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.age -->
						
						<!-- START stand.layers -->
						<section class="col col-3" id="layers">
							<label class="input"> <div class="greetings" title="<s:text name="dem.fiskos.layers"/>"><s:text name="dem.fiskos.layers"/>:</div>
								<s:if test="fieldErrors.get('stand.layers')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.layers" name="stand.layers" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.layers')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.layers" name="stand.layers" value="<s:property value='stand.layers'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.layers -->
						
					
						<!-- START stand.incrPerc -->
						<section class="col col-3" id="incrPerc">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.incr.perc"/>"><s:text name="frm.stand.incr.perc"/>:</div>
								<s:if test="fieldErrors.get('stand.incrPerc')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.incrPerc" name="stand.incrPerc" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.incrPerc')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.incrPerc" name="stand.incrPerc" value="<s:property value='stand.incrPerc'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.incrPerc -->
						
						<!-- START stand.m2Ha -->
						<section class="col col-3" id="m2Ha">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.m2.ha"/>"><s:text name="frm.stand.m2.ha"/>:</div>
								<s:if test="fieldErrors.get('stand.m2Ha')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.m2Ha" name="stand.m2Ha" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.m2Ha')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.m2Ha" name="stand.m2Ha" value="<s:property value='stand.m2Ha'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.m2Ha -->
						<!-- START stand.dsCon -->
						<section class="col col-3" id="dsCon">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.ds.con"/>"><s:text name="frm.stand.ds.con"/>:</div>
								<s:if test="fieldErrors.get('stand.dsCon')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.dsCon" name="stand.dsCon" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.dsCon')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.dsCon" name="stand.dsCon" value="<s:property value='stand.dsCon'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.dsCon -->
						<!-- START stand.dsBro -->
						<section class="col col-3" id="dsBro">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.ds.bro"/>"><s:text name="frm.stand.ds.bro"/>:</div>
								<s:if test="fieldErrors.get('stand.dsBro')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.dsBro" name="stand.dsBro" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.dsBro')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.dsBro" name="stand.dsBro" value="<s:property value='stand.dsBro'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.dsBro -->
					
						<!-- START stand.damagePerc -->
						<section class="col col-3" id="damagePerc">
							<label class="input"><div class="greetings" title="<s:text name="frm.stand.damage.perc"/>"> <s:text name="frm.stand.damage.perc"/>:</div>
								<s:if test="fieldErrors.get('stand.damagePerc')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.damagePerc" name="stand.damagePerc" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.damagePerc')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.damagePerc" name="stand.damagePerc" value="<s:property value='stand.damagePerc'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.damagePerc -->
					
						<!-- START stand.crowncover -->
						<section class="col col-3" id="crowncover">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.crowncover"/>"><s:text name="frm.stand.crowncover"/>:</div>
								<s:if test="fieldErrors.get('stand.crowncover')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.crowncover" name="stand.crowncover" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.crowncover')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.crowncover" name="stand.crowncover" value="<s:property value='stand.crowncover'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.crowncover -->
					
					</div>
						
					<div class="row" id="estimate">
						<!-- START stand.estimateVolume -->
						<section class="col col-6">
						<label class="input"> <div class="greetings" title="<s:text name="frm.stand.estemate.volume"/>"><s:text name="frm.stand.estemate.volume"/>:</div>
								<select class="form-control" class="form-control input-xs-g" id="stand.estimateVolume.code" name="stand.estimateVolume.code">
									<s:iterator value="estVolumeList" var="ev">
										<s:if test="%{code==stand.estimateVolume.code}">
											<option selected="selected" value="<s:property value="#ev.code"/>">
												<s:property value="#ev.description" />
											</option>
										</s:if>
										<s:else>
										<option value="<s:property value="#ev.code" />">
												<s:property value="#ev.description" />
										</option>
										</s:else>
									</s:iterator>						
								</select>
							</label>
						</section>
						<!-- END stand.estimateVolume -->
						<!-- START stand.estimateTreesPerHa -->
						<section class="col col-6">
							<label class="input"> <s:text name="frm.stand.estemate.trees.per.ha"/>:
								<select class="form-control" class="form-control input-xs-g" id="stand.estimateTreesPerHa" name="stand.estimateTreesPerHa">
									<s:iterator value="estTreesList" var="el">
										<option value="<s:property value="#el.getDOMVALUE()" />">
											<s:property value="#el.getDOMTEXT()"/>
										</option>
									</s:iterator>						
								</select>
							</label>
						</section>
						<!-- END stand.estimateTreesPerHa -->
					</div>
				
				   <div class="row">
				   	<!-- START stand.minehazard -->
						<section class="col col-4">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.minehazard"/>"><s:text name="frm.stand.minehazard"/>:</div>
								<select class="form-control" id="stand.minehazard" name="stand.minehazard">
									<s:iterator value="minehazards" var="el">
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
							</label>
						</section>
					<!-- END stand.minehazard -->
				  	 <!-- START stand.surveyDate -->
						<section class="col col-4">
							<label class="input"><div class="greetings" title="<s:text name="frm.stand.survey.date"/>"> <s:text name="frm.stand.survey.date"/>:</div>
								<s:if test="fieldErrors.get('stand.surveyDate')!=null">
									<div class="form-group has-error">
										<input type="text" class="form-control input-xs-g" id="stand.surveyDate" name="stand.surveyDate" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.surveyDate')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="text" class="form-control input-xs-g" id="stand.surveyDate" name="stand.surveyDate" value="<s:property value='stand.surveyDate'/>" >
									</div>
								</s:else>
							</label>
						</section>
					<!-- END stand.surveyDate -->
					

					
					<!-- START stand.heightMean -->
						<section class="col col-4" id="heightMean">
							<label class="input"> <div class="greetings" title="<s:text name="frm.stand.height.mean"/>"><s:text name="frm.stand.height.mean"/>:</div>
								<s:if test="fieldErrors.get('stand.heightMean')!=null">
									<div class="form-group has-error">
										<input type="number" class="form-control input-xs-g" id="stand.heightMean" name="stand.heightMean" >
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.heightMean')"/> </span>
									</div>
								</s:if>
								<s:else>
									<div class="form-group">
										<input type="number" class="form-control input-xs-g" id="stand.heightMean" name="stand.heightMean" value="<s:property value='stand.heightMean'/>" >
									</div>
								</s:else>
							</label>
						</section>
						<!-- END stand.heightMean -->
				</div>
				
				<div class="row">
					<!-- START stand.remarks -->
					<section >
							<label class="input"> <s:text name="frm.stand.remarks"/>:</label>
<%-- 								<input type="text" class="form-control input-xs-g" id="stand.remarks" name="stand.remarks" value="<s:property value='stand.remarks'/>"> --%>
							<div class="col-md-12">
								<textarea id="stand.remarks" name="stand.remarks" class="form-control"><s:property value='stand.remarks'/></textarea>
							</div>
							</section>
					<!-- END stand.remarks -->
				</div>
			</fieldset>
			<footer class="form-actions" id="stand-button">
					<s:if test="user.getOrganisation().getOperLevelVal()=='C' || user.getOrganisation().getOperLevelVal()=='R'">
						<button id="saveStand" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</s:if>
						<button id="cancelStand" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
			</footer>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">


	$(document).ready(function() {
		$('form').on('focus', 'input[type=number]', function (e) {
			  $(this).on('mousewheel.disableScroll', function (e) {
			    e.preventDefault()
			  })
			});
			$('form').on('blur', 'input[type=number]', function (e) {
			  $(this).off('mousewheel.disableScroll')
			});
	
		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$("#stand\\.estabilishedYear").mask("9999");
		$('#stand\\.estimateTreesPerHa').val('<s:property value="stand.estimateTreesPerHa.DOMVALUE"/>');
		$('#stand\\.mngmClass').val('<s:property value="stand.mngmClass.DOMVALUE"/>');
		$('#stand\\.accessType').val('<s:property value="stand.accessType.DOMVALUE"/>');
		$('#stand\\.standType').val('<s:property value="stand.standType.DOMVALUE"/>');
		$('#stand\\.origin').val('<s:property value="stand.origin.DOMVALUE"/>');
		$('#stand\\.minehazard').val('<s:property value="stand.minehazard.DOMVALUE"/>');
		$('#stand\\.surveyDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
			sideBySide: false,
		});
		
		if($("#standData").val())
		{
			$('#stand-button').hide();
			$('stand_form:input').attr('readonly','readonly');
		}
		
		$("#cancelStand").on('click', function() {
			loadURL("Stand.form.do?compId="+$("#comp_id").val(),$("#stand_form_content"));
			return false;
		});
		
		$("#geomBtn").on('click', function() {
			if($("#geometry").val()){
			var link="Stand.geomDetail.do?geometry="+$("#geometry").val();
			openDialogForm('geom_detail_popup_content', link, '<s:text name="stand.geom.detail.title"/>',500,400);
			}else{
				alert('<s:text name="stand.geom.detail.title.alert"/>');
			}
		});

		$('#mupId').val($('#mupId').val());
		$("#saveStand").on('click', function() {
			var ctrl_split = map.getControlsBy("id", "split")[0];
			if (ctrl_split.active) {
				alert("Butoni per ndarje eshte aktiv!");
			}else{
				$('#stand_form').submit();
			}
			return false;
		});
		$("#stand_form").submit(function() {
			var this_form = $(this);

			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#stand_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					var nrErrors = jqXHR.getResponseHeader("nrError");
					if(errors){
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});						
					}else if(nrErrors){
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>",
							content : nrErrors,
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}else{
						jQuery("#stand_grid").trigger("reloadGrid");
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
					}
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
		if($("#comp_id").val()){
			$("#stand\\.compartment\\.id").val($("#comp_id").val());
		}

		  $("#treeSpeciesByDecidouseName").select2({
		        placeholder: "<s:text name="dp.doc.search.rep"/>",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.treeSpecies.do",
			        dataType: 'json',
			        quietMillis: 250,
			        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	orgtype: "D",
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
		        formatResult: function(item){
				    if(item){
		            	var desc =
		            		'<div class="row-fluid">' + '<div class="span10">'
		    				+ '<div class="row-fluid">'
		    				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
		    				+ item.name+" ("+item.species_group+")" + '</div>' + '</div>'
		    				+ '</div></div>';
		            	return desc;
		            }
		            return "";
			    },
		        formatSelection: function(item) {
		        	$("#treeSpeciesByDecidouseId").val(item.id);
		            return item.name+" ("+item.species_group+")";
		        },
		        allowClear: true,
		        dropdownCssClass: "bigdrop",
		        escapeMarkup: function (m) { return m; }
		    }); 
			if($("#treeSpeciesByDecidouseId").val()){
		    	$("#treeSpeciesByDecidouseName").select2("data", {id: "<s:property value='standharvest.treeSpecies.id'/>", name: "<s:property value='#tsdName'/>",species_group:"<s:property value='#tsdGroup'/>"});
			}

			$("#treeSpeciesByTree1Name").select2({
		        placeholder: "<s:text name="dp.doc.search.rep"/>",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.treeSpecies.do",
			        dataType: 'json',
			        quietMillis: 250,
			        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	orgtype: "D",
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
		        formatResult: function(item){
				    if(item){
		            	var desc =
		            		'<div class="row-fluid">' + '<div class="span10">'
		    				+ '<div class="row-fluid">'
		    				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
		    				+ item.name+" ("+item.species_group+")" + '</div>' + '</div>'
		    				+ '</div></div>';
		            	return desc;
		            }
		            return "";
			    },
		        formatSelection: function(item) {
		        	$("#treeSpeciesByTree1Id").val(item.id);
		            return item.name+" ("+item.species_group+")";
		        },
		        allowClear: true,
		        dropdownCssClass: "bigdrop",
		        escapeMarkup: function (m) { return m; }
		    }); 
			if($("#treeSpeciesByTree1Id").val()){
		    	$("#treeSpeciesByTree1Name").select2("data", {id: "<s:property value='stand.treeSpeciesByTree1.id'/>", name: "<s:property value='#ts1Name'/>",species_group:"<s:property value='#ts1Group'/>"});
			}


			$("#treeSpeciesByTree2Name").select2({
		        placeholder: "<s:text name="dp.doc.search.rep"/>",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.treeSpecies.do",
			        dataType: 'json',
			        quietMillis: 250,
			        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	orgtype: "D",
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
		        formatResult: function(item){
				    if(item){
		            	var desc =
		            		'<div class="row-fluid">' + '<div class="span10">'
		    				+ '<div class="row-fluid">'
		    				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
		    				+ item.name+" ("+item.species_group+")" + '</div>' + '</div>'
		    				+ '</div></div>';
		            	return desc;
		            }
		            return "";
			    },
		        formatSelection: function(item) {
		        	$("#treeSpeciesByTree2Id").val(item.id);
		            return item.name+" ("+item.species_group+")";
		        },
		        allowClear: true,
		        dropdownCssClass: "bigdrop",
		        escapeMarkup: function (m) { return m; }
		    }); 
			if($("#treeSpeciesByTree2Id").val()){
		    	$("#treeSpeciesByTree2Name").select2("data", {id: "<s:property value='stand.treeSpeciesByTree2.id'/>", name: "<s:property value='#ts2Name'/>",species_group:"<s:property value='#ts2Group'/>"});
			}


			$("#treeSpeciesByTree3Name").select2({
		        placeholder: "<s:text name="dp.doc.search.rep"/>",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.treeSpecies.do",
			        dataType: 'json',
			        quietMillis: 250,
			        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	orgtype: "D",
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
		        formatResult: function(item){
				    if(item){
		            	var desc =
		            		'<div class="row-fluid">' + '<div class="span10">'
		    				+ '<div class="row-fluid">'
		    				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
		    				+ item.name+" ("+item.species_group+")" + '</div>' + '</div>'
		    				+ '</div></div>';
		            	return desc;
		            }
		            return "";
			    },
		        formatSelection: function(item) {
		        	$("#treeSpeciesByTree3Id").val(item.id);
		        //	$("#treeSpeciesByDecidouseId").val(item.id);
		            return item.name+" ("+item.species_group+")";
		        },
		        allowClear: true,
		        dropdownCssClass: "bigdrop",
		        escapeMarkup: function (m) { return m; }
		    }); 
			if($("#treeSpeciesByTree3Id").val()){
		    	$("#treeSpeciesByTree3Name").select2("data", {id: "<s:property value='stand.treeSpeciesByTree3.id'/>", name: "<s:property value='#ts3Name'/>",species_group:"<s:property value='#ts3Group'/>"});
			}


			$("#treeSpeciesByConiferName").select2({
		        placeholder: "<s:text name="dp.doc.search.rep"/>",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.treeSpecies.do",
			        dataType: 'json',
			        quietMillis: 250,
			        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	orgtype: "D",
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
		        formatResult: function(item){
				    if(item){
		            	var desc =
		            		'<div class="row-fluid">' + '<div class="span10">'
		    				+ '<div class="row-fluid">'
		    				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
		    				+ item.name+" ("+item.species_group+")" + '</div>' + '</div>'
		    				+ '</div></div>';
		            	return desc;
		            }
		            return "";
			    },
		        formatSelection: function(item) {
		        	$("#treeSpeciesByConiferId").val(item.id);
		            return item.name+" ("+item.species_group+")";
		        },
		        allowClear: true,
		        dropdownCssClass: "bigdrop",
		        escapeMarkup: function (m) { return m; }
		    }); 
			if($("#treeSpeciesByConiferId").val()){
		    	$("#treeSpeciesByConiferName").select2("data", {id: "<s:property value='stand.treeSpeciesByConifer.id'/>", name: "<s:property value='#tscName'/>",species_group:"<s:property value='#tscGroup'/>"});
			}

			$("#decidose").hide();
			$("#conifer").hide();
			$("#perc").hide();
			$("#clCon").hide();
			$("#clDec").hide();
			$("#specie").hide();
			$("#specie3").hide();
			$("#trees").hide();
			$("#volumeM3ha").hide();
			$("#heightMean").hide();
			$("#incrPerc").hide();
			$("#dsCon").hide();
			$("#dsBro").hide();
			$("#damagePerc").hide();
			$("#crowncover").hide();
			$("#estimate").hide();
			$("#age").hide();
			$("#layers").hide();
			$("#m2Ha").hide();
			$("#noPlots").hide();
			if($("#stand\\.standType").val()=='OPENAAREA'){
				$("#decidose").hide();
				$("#conifer").hide();
				$("#perc").hide();
				$("#clCon").hide();
				$("#clDec").hide();
				$("#specie").hide();
				$("#specie3").hide();
				$("#trees").hide();
				$("#volumeM3ha").hide();
				$("#heightMean").hide();
				$("#incrPerc").hide();
				$("#dsCon").hide();
				$("#dsBro").hide();
				$("#damagePerc").hide();
				$("#crowncover").hide();
				$("#estimate").hide();
				$("#age").hide();
				$("#layers").hide();
				$("#m2Ha").hide();
				$("#noPlots").hide();
			}else if($("#stand\\.standType").val()=='NOAREAPROVE'){
				$("#decidose").hide();
				$("#conifer").hide();
				$("#perc").hide();
				$("#clCon").hide();
				$("#clDec").hide();
				$("#specie").show();
				$("#specie3").show();
				$("#trees").hide();
				$("#volumeM3ha").hide();
				$("#heightMean").show();
				$("#incrPerc").hide();
				$("#dsCon").hide();
				$("#dsBro").hide();
				$("#damagePerc").hide();
				$("#crowncover").hide();
				$("#estimate").show();
				$("#age").hide();
				$("#layers").hide();
				$("#m2Ha").hide();
				$("#noPlots").hide();
			}else{
				$("#decidose").show();
				$("#conifer").show();
				$("#perc").show();
				$("#clCon").show();
				$("#clDec").show();
				$("#specie").show();
				$("#specie3").show();
				$("#trees").show();
				$("#volumeM3ha").show();
				$("#heightMean").hide();
				$("#incrPerc").show();
				$("#dsCon").show();
				$("#dsBro").show();
				$("#damagePerc").show();
				$("#crowncover").show();
				$("#estimate").hide();
				$("#age").show();
				$("#layers").show();
				$("#m2Ha").show();
				$("#noPlots").show();
				}
			
			$("#stand\\.standType").on('change',function(){
				if($("#stand\\.standType").val()=='OPENAAREA'){
					$("#decidose").hide();
					$("#conifer").hide();
					$("#perc").hide();
					$("#clCon").hide();
					$("#clDec").hide();
					$("#specie").hide();
					$("#specie3").hide();
					$("#trees").hide();
					$("#volumeM3ha").hide();
					$("#heightMean").hide();
					$("#incrPerc").hide();
					$("#dsCon").hide();
					$("#dsBro").hide();
					$("#damagePerc").hide();
					$("#crowncover").hide();
					$("#estimate").hide();
					$("#age").hide();
					$("#layers").hide();
					$("#m2Ha").hide();
					$("#noPlots").hide();
				}else if($("#stand\\.standType").val()=='NOAREAPROVE'){
					$("#decidose").hide();
					$("#conifer").hide();
					$("#perc").hide();
					$("#clCon").hide();
					$("#clDec").hide();
					$("#specie").show();
					$("#specie3").show();
					$("#trees").hide();
					$("#volumeM3ha").hide();
					$("#heightMean").show();
					$("#incrPerc").hide();
					$("#dsCon").hide();
					$("#dsBro").hide();
					$("#damagePerc").hide();
					$("#crowncover").hide();
					$("#estimate").show();
					$("#age").hide();
					$("#layers").hide();
					$("#m2Ha").hide();
					$("#noPlots").hide();
				}else{
					$("#decidose").show();
					$("#conifer").show();
					$("#perc").show();
					$("#clCon").show();
					$("#clDec").show();
					$("#specie").show();
					$("#specie3").show();
					$("#trees").show();
					$("#volumeM3ha").show();
					$("#heightMean").hide();
					$("#incrPerc").show();
					$("#dsCon").show();
					$("#dsBro").show();
					$("#damagePerc").show();
					$("#crowncover").show();
					$("#estimate").hide();
					$("#age").show();
					$("#layers").show();
					$("#m2Ha").show();
					$("#noPlots").show();
					}
			});

			

			
		});

	
	if(!$("#stand\\.id").val()){
		$("#standGrowth").prop('disabled','disabled');
	}
	
	$("#standGrowth").on('click',function(){
		$.SmartMessageBox({
			title : "<s:text name='stand.growth.dialog.popup.title'/>",
		content : "<s:text name='stand.growth.dialog.popup.content'/>",
		buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
			icon : "fa fa-bell"
			
		}, function(ButtonPressed) {
			if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
				
			   $.ajax({
					type : 'POST', // GET or POST
					url : 'StandGrowth.do?standIdsList='+$("#stand\\.id").val(), 
					async : false,
					beforeSend : function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
						alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
					},
					success : function(data, status, jqXHR) { 
    				var errors_exist = jqXHR.getResponseHeader("errors_exist");
    				var message = jqXHR.getResponseHeader("meesage");
    				if (!errors_exist) {
    					var text="";//'<s:text name="small.box.on.save.title.failed"/>';
						var color='#C79121';
						var title="<s:text name='small.box.on.save.title.success'/>";
						if(message){
							color="#739E73";
							text="<s:text name="stand.growth.dialog.was.done"/>: "+message;
							jQuery("#compartment_grid").trigger('reloadGrid');
		       			}else{
			       			text="<s:text name="stand.growth.dialog.content"/>";
							title="<s:text name="stand.growth.dialog.not.was.done"/>!";
							
		       			}
    					$.smallBox({
							title : title,
							content : text,
							color : color,
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
    					
					}else{
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>",
							content : '<s:text name="small.box.on.save.title.failed"/>',
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
			}//EOF IF ButtonPressed
		});
	
	});

	
</script>