<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<jsp:include page="../../../base/validation.jsp"></jsp:include>

<form id="planting_form" class="smart-form" action="PlantingSave.do" accept-charset="utf8" method="post">

<input id="standId" name="standId" value="<s:property value='stand.id'/>" type="hidden">
<input id="stand.id" name="stand.id" value="<s:property value='stand.id'/>" type="hidden">
<input id="planting.id" name="planting.id" value="<s:property value='planting.id'/>" type="hidden">
<input id="domainId" name="domainId" value="<s:property value='standharvest.activity.frmDoman.id'/>" type="hidden">

<input id="activity.id" name="activity.id" value="<s:property value='activity.id'/>" type="hidden">
<input id="activity.activityNo" name="activity.activityNo" value="<s:property value='activity.activityNo'/>" type="hidden">
<%-- <input id="activity.planedGeom" name="activity.planedGeom" value="<s:property value='activity.planedGeom'/>"  type="hidden"> --%>
<%-- <input id="activity.implementedGeom" name="activity.implementedGeom" value="<s:property value='activity.implementedGeom'/>" type="hidden"> --%>
<input id="standGeom" name="standGeom" value="<s:property value='standGeom'/>" type="hidden">

<input id="plantPlanedGeom" name="plantPlanedGeom" value="<s:property value='plantPlanedGeom'/>" type="hidden">
<input id="implementPlanedGeom" name="implementPlanedGeom" value="<s:property value='implementPlanedGeom'/>" type="hidden">

<input id="language" name="language" value="<s:property value='locale.language'/>" type="hidden">
<input id="planting.workStage" name="planting.workStage" value="<s:property value='planting.workStage'/>" type="hidden">
<input id="planting.activityStatus.status" name="planting.activityStatus.status" value="<s:property value='planting.activityStatus.status.getDOMVALUE()'/>" type="hidden" >
<input id="planting.activityStatus.id" name="planting.activityStatus.id" value="<s:property value='planting.activityStatus.id'/>" type="hidden" >
<input id="decisionStatus" name="decisionStatus" value="<s:property value='decisionStatus'/>" type="hidden">
<input id="edit" value="<s:property value='edit'/>" type="hidden">
<input id="activityStatus.id" name="activityStatus.id"  value="<s:property value='activityStatus.id'/>" type="hidden">
<input id="activityStatus.status" name="activityStatus.status" value="<s:property value='activityStatus.status.getDOMVALUE()'/>" type="hidden">

<input id="planting.plCreatedDate" name="planting.plCreatedDate" value="<s:property value='planting.plCreatedDate'/>" type="hidden">
<input id="planting.personByPlCreatedBy.id" name="planting.personByPlCreatedBy.id" value="<s:property value='planting.personByPlCreatedBy.id'/>" type="hidden">

<input id="planting.imCreatedDate" name="planting.imCreatedDate" c type="hidden">
<input id="planting.personByImCreatedBy.id" name="planting.personByImCreatedBy.id" value="<s:property value='planting.personByImCreatedBy.id'/>" type="hidden">		

<!-- START InventoryPOS -->
<input id="planting.seedlingInventoryPOS.id" name="planting.seedlingInventoryPOS.id" value="<s:property value='planting.seedlingInventoryPOS.id'/>" type="hidden" >
<input id="inventoryPos.id" name="inventoryPos.id" value="<s:property value='inventoryPos.id'/>" type="hidden">		
<input id="inventoryPos.personByCreatedBy.id" name="inventoryPos.personByCreatedBy.id" value="<s:property value='inventoryPos.personByCreatedBy.id'/>" type="hidden">		
<input id="inventoryPos.createdDate.id" name="inventoryPos.createdDate.id" value="<s:property value='inventoryPos.createdDate.id'/>" type="hidden">		
<input id="inventoryPos.seedlingInventory.id" name="inventoryPos.seedlingInventory.id" value="<s:property value='inventoryPos.seedlingInventory.id'/>" type="hidden">
<input id="inventoryPos.treeSpecies.id" name="inventoryPos.treeSpecies.id" value="<s:property value='inventoryPos.treeSpecies.id'/>" type="hidden">
<input id="inventoryPos.age" name="inventoryPos.age" value="<s:property value='inventoryPos.age'/>" type="hidden">	
<input id="inventoryPos.quantity" name="inventoryPos.quantity" value="<s:property value='inventoryPos.quantity'/>" type="hidden">		


<input id="docNameAlf" name="docNameAlf" value="<s:property value='docNameAlf'/>" type="hidden">
<input id="docTypeAlf" name="docTypeAlf" value="<s:property value='docTypeAlf'/>" type="hidden">
			

<!-- END InventoryPOS -->

<input id="fromInventory" name="fromInventory" value="<s:property value='fromInventory'/>" type="hidden">		
	
		<fieldset class="no-padding">
		<legend><s:text name="annu.seedling.label.activity"/></legend>
		<!-- START row -->
		<div class="row">
			<div class="col-md-4">
			   <div class="col-sm-3 profile-pic">
				<img src="data:image/jpeg;base64,<s:property value='barCodeImg'/>" class="barcode-gl"  />
			   </div>
			</div>
			<div class="col-md-8 padding-left-0">
			<div class="row">
			<!-- START planting.annualPlan -->
				<section class="col col-10">
				<label class="input"> <s:text name="planting.stand.annu.plan"/>:
					<s:if test="fieldErrors.get('annualplanId')!=null">
						<div class="form-group has-error">
							<input id="annualplanName" name="annualplanName" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name="planting.stand.annu.plan"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.forestTyp')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<s:if test="annualplan != null">
							<input id="annualplanName" name="annualplanName" readonly="readonly" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="Default Text Field" type="text">
							</s:if>
							<s:else>
							<input id="annualplanName" name="annualplanName" class="form-control" placeholder="Please type muncicipality name" type="text">
							</s:else>
							<input id="annualplanId" name="annualplanId" value="<s:property value='annualplan.id'/>" type="hidden">
						</div>
					</s:else>
				</label>
				</section>
			<!-- END planting.annualPlan -->
		</div>
		<div class="row">						
			<!-- START activity.activityDomain.id -->
				<section class="col col-10">
					<label class="input">*<s:text name="annu.seedling.label.activity"/>:
						<s:if test="fieldErrors.get('activity.activityDomain.id')!=null">
						<div class="form-group has-error">
							<input id="activity.activityDomain.name" name="activity.activityDomain.name" class="form-control" placeholder="<s:text name="annu.seedling.label.activity"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activity.activityDomain.id')"/> </span>
							<input id="activity.activityDomain.id" name="activity.activityDomain.id" type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="activity.activityDomain.name" name="activity.activityDomain.name" value="<s:property value='activity.activityDomain.name'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.activity"/>" type="text">
							<input id="activity.activityDomain.id" name="activity.activityDomain.id" value="<s:property value='activity.activityDomain.id'/>" type="hidden">
						</div>
					</s:else>
					</label>
				</section>
			<!-- END activity.activityDomain.id -->
			</div>
		</div>
	</div>
	<div class="row">	
			<!-- START planting.treeSpecies.id -->
				<section class="col col-6">
					<label class="input">*<s:text name="planting.stand.tree.species"/>:
						<s:if test="fieldErrors.get('planting.treeSpecies.id')!=null">
						<div class="form-group has-error">
							<input id="planting.treeSpecies.name" name="planting.treeSpecies.name" class="form-control" placeholder="<s:text name="planting.stand.tree.species"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('planting.treeSpecies.id')"/> </span>
							<input id="planting.treeSpecies.id" name="planting.treeSpecies.id" value="<s:property value='planting.treeSpecies.id'/>" type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="planting.treeSpecies.name" name="planting.treeSpecies.name" class="form-control" value="<s:property value='planting.treeSpecies.name'/>" placeholder="<s:text name="planting.stand.tree.species"/>" type="text">
							<input id="planting.treeSpecies.id" name="planting.treeSpecies.id" value="<s:property value='planting.treeSpecies.id'/>" type="hidden">
						</div>
					</s:else>
					</label>
				</section>
			<!-- END planting.treeSpecies.id -->
			
			<!-- START planting.seedlingAge -->
				<section class="col col-6">
					<label class="input"> <s:text name="planting.stand.seedling.age"/>:
						<s:if test="fieldErrors.get('planting.seedlingAge')!=null">
						<div class="form-group has-error">
							<input data='numberLong' id="planting.seedlingAge" name="planting.seedlingAge" class="form-control" placeholder="<s:text name="planting.stand.seedling.age"/>" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('planting.seedlingAge')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input data='numberLong' id="planting.seedlingAge" name="planting.seedlingAge" class="form-control" value="<s:property value='planting.seedlingAge'/>" placeholder="<s:text name="planting.stand.seedling.age"/>"  type="text" >
						</div>
					</s:else>
					</label>
				</section>
			<!-- END planting.seedlingAge -->
		</div>			
		<!-- END row -->
		
		<div class="row">
		<!-- START planting.prodType -->
				<section class="col col-5">
					<label class="input" for="planting.prodType">* <s:text name="annu.seedling.label.prod.type"/>:
					<s:if test="fieldErrors.get('planting.prodType')!=null">
						<div class="has-error">
						<select class="form-control" id="planting.prodType" name="planting.prodType">
								<option></option>
								<s:iterator value="prodTypeList" var="tt">
									<option value="<s:property value="#tt.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#tt.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#tt.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:elseif test="%{locale.language=='en'}">
												<s:property value="#tt.getDOMTEXT_EN()"/>
											</s:elseif>
										</option>
								</s:iterator>						
							</select>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('planting.prodType')"/> </span>
							</div>
							
						</s:if>
						<s:else>
							<select class="form-control" id="planting.prodType" name="planting.prodType">
								<option></option>
								<s:iterator value="prodTypeList" var="tt">
									<option value="<s:property value="#tt.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#tt.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#tt.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:elseif test="%{locale.language=='en'}">
												<s:property value="#tt.getDOMTEXT_EN()"/>
											</s:elseif>
										</option>
								</s:iterator>						
							</select>
						</s:else>
					</label>
				</section>
			<!-- END planting.prodType -->
			<!-- START fromInventory -->
				<section class="col col-5">
					<label> <s:text name="planting.stand.from.inventory"></s:text>:</label><input id="fromInventoryCheck" class="form-control" name="fromInventoryCheck" type="checkbox" >
				</section>
			<!-- END fromInventory -->
		</div>
		</fieldset>
		<fieldset class="no-padding" id="inventory_content">
		
			<section class="col col-10">
			<label> <s:text name="planting.stand.forest.institute"/></label>
				<div class="inline-group">
					<label class="radio">
						<s:if test='fromForestInstitute == "Y"'>
							<input type="radio" id="yes" class="radiobox" checked="checked" name="fromForestInstitute" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:if>
						<s:else>
							<input type="radio" id="yes" class="radiobox" name="fromForestInstitute" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
						</s:else>
					</label>
					<label class="radio">
						<s:if test='fromForestInstitute== "N"'>
							<input type="radio" id="no" class="radiobox" checked="checked" name="fromForestInstitute" value="N"><span><s:text name="rbac.permission.button.no"/></span>  
						</s:if> 
						<s:else>						
							<input type="radio" id="no" class="radiobox" name="fromForestInstitute" value="N"><span><s:text name="rbac.permission.button.no"/></span>
						</s:else>
					</label>
				</div>
			</section>
		</fieldset>
		<fieldset class="no-padding">
		<legend><s:text name="planting.stand.legend.planning"/></legend>
		<!-- START row -->
		<div class="row">
			
			<!-- START planting.plArea-->
				<section class="col col-5">
					<label class="input">*<s:text name="planting.stand.planned.area"/>:
						<s:if test="fieldErrors.get('planting.plArea')!=null">
						<div class="form-group has-error">
							<input  type="text" readonly data="number" id="planting.plArea" name="planting.plArea" placeholder="<s:text name="planting.stand.planned.area"/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('planting.plArea')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input  type="text" data="number" readonly id="planting.plArea" name="planting.plArea" placeholder="<s:text name="planting.stand.planned.area"/>" value="<s:property value='planting.plArea'/>">
						</div>
					</s:else>
					</label>
				</section>
			<!-- END planting.plArea -->
			
			<!-- START planting.plTrees -->
				<section class="col col-5">
					<label class="input">*<s:text name="planting.stand.planned.trees"/>:
						<s:if test="fieldErrors.get('planting.plTrees')!=null">
						<div class="form-group has-error">
							<input  type="text" data="numberLong" id="planting.plTrees" name="planting.plTrees" placeholder="<s:text name="planting.stand.planned.trees"/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('planting.plTrees')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input  type="text" data="numberLong" id="planting.plTrees" name="planting.plTrees" placeholder="<s:text name="planting.stand.planned.trees"/>" value="<s:property value='planting.plTrees'/>">
						</div>
					</s:else>
					</label>
				</section>
			<!-- END planting.plTrees -->

		</div>			
		<!-- END row -->
		</fieldset>
		
		<div id="implementationdiv">
		<fieldset class="no-padding">
		<legend><s:text name="planting.stand.legend.implementation"/></legend>		
		<!-- START row -->
		<div class="row">
			<!-- START planting.imArea-->
				<section class="col col-5">
					<label class="input"> <s:text name="planting.stand.impl.area"/>:
						<div class="form-group">
							<input  type="text" data="number" id="planting.imArea" name="planting.imArea" placeholder="<s:text name="planting.stand.impl.area"/>" value="<s:property value='planting.imArea'/>">
						</div>
					</label>
				</section>
			<!-- END planting.imArea -->
			<!-- START planting.imTrees -->
				<section class="col col-5">
					<label class="input"> <s:text name="planting.stand.impl.trees"/>:
						<div class="form-group">
							<input  type="text" data="numberLong" id="planting.imTrees" name="planting.imTrees" value="<s:property value='planting.imTrees'/>" placeholder="<s:text name="planting.stand.impl.trees"/>">
						</div>
					</label>
				</section>
			<!-- END planting.imTrees -->
		</div>			
		<!-- END row -->					
		</fieldset>
		<fieldset class="no-padding">
			<legend><s:text name='frm.harvest.impl.declare'/></legend>		
					<div class="row">
						<section class="col col-10">
							<div class="form-group">
								<div id="plant_declare_grid_content">
									<jsp:include page="plant_declare_grid.jsp"></jsp:include>
								</div>
							</div>
						</section>
					</div>
		</fieldset>
		</div>
		
		<fieldset class="no-padding">
			<legend><s:text name="tender.request.attachment"/></legend>
			<br>
				<!-- START attachment -->
				<s:if test="fieldErrors.get('attachment')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
					 	  <div class="col-md-10">
					      	<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFilesDataAlf(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('attachment')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
						<div class="col-md-10">
							<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFilesDataAlf(this);">
						</div>
					</div>
				</s:else>
				<!-- END attachment -->
		</fieldset>
		<s:if test="decisionStatus">
		<fieldset id="status_fieldset" class="no-padding">
		<legend>* <s:text name="law.suit.label.status"/></legend>
			<section class="col col-10">
					<s:if test="fieldErrors.get('activityStatus.status')!=null">
						<div class="form-group has-error">
							<div class="inline-group">
								<div id="row">
									<label class="radio">
										<input type="radio" class="form-control" id="rej" name="activityStatus.status" value="<s:property value='rejected.getDOMVALUE()'/>">
										<i></i><s:text name="frm.statuses.reject"/></label>
									<label class="radio">
										<input type="radio" class="form-control" id="rep" name="activityStatus.status" value="<s:property value='replan.getDOMVALUE()'/>">
										<i></i><s:text name="frm.statuses.replan"/></label>
									<label class="radio">
										<input type="radio" class="form-control" id="apr" name="activityStatus.status" value="<s:property value='approved.getDOMVALUE()'/>">
										<i></i><s:text name="frm.statuses.approve"/></label>
								</div>
							</div>
							<div id="row" class="col-md-10">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityStatus.status')"/> </span>
							</div>
						</div>
					</s:if>
					<s:else>
					<div class="inline-group">
						<label class="radio">
							<input type="radio" id="rej" name="activityStatus.status" value="<s:property value='rejected.getDOMVALUE()'/>">
							<i></i><s:text name="frm.statuses.reject"/></label>
						<label class="radio">
							<input type="radio" id="rep" name="activityStatus.status" value="<s:property value='replan.getDOMVALUE()'/>">
							<i></i><s:text name="frm.statuses.replan"/></label>
						<label class="radio">
							<input type="radio" id="apr" name="activityStatus.status" value="<s:property value='approved.getDOMVALUE()'/>">
							<i></i><s:text name="frm.statuses.approve"/></label>
							</div>
					</s:else>
			</section>
		</fieldset>
		</s:if>
		<br>
		<section class="col col-10">
			<s:if test="fieldErrors.get('activityStatus.remarks')!=null">
				<div class="form-group has-error">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.comment"/>: </label>
					<div class="col-md-10">
						<textarea id="activityStatus.remarks" name="activityStatus.remarks" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"></textarea>
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityStatus.remarks')"/> </span>
					</div>
				</div>
			</s:if>
			<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.comment"/>: </label>
					<div class="col-md-10">
						<textarea id="activityStatus.remarks" name="activityStatus.remarks" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"><s:property value='activityStatus.remarks'/></textarea>
					</div>
				</div>
			</s:else>
		</section>
			<br><br><br>
		<footer class="form-actions">
<%-- 			<s:if test="user.checkAccess('frm', '_write')"> --%>
			<s:if test="!edit">
				<button id="savePLA" class="btn btn-primary" type="submit">
					<i class="fa fa-save"></i>
					<s:text name="label.button.save"></s:text>
				</button>
			</s:if>	
<%-- 			</s:if> --%>
			<button id="cancelPLA" class="btn btn-default" type="button">
				<s:text name="label.button.cancel"></s:text>
			</button>
		</footer>
		
</form>

<script type="text/javascript">

$(document).ready(function() {

	var stat='<s:property value="planting.activityStatus.status.getDOMVALUE()"/>';
	if(stat=='APPROVED'){
		$("#implementationdiv").show();
		}
		else{
			$("#implementationdiv").hide(); 
		}

	$('#planting\\.prodType').val('<s:property value="planting.prodType.DOMVALUE"/>');
	var opl_val='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
	
	if($("#fromInventory").val()=='true'){
		$("#fromInventoryCheck").prop('checked',true);
		$("#inventory_content").show();
	}else{$("#inventory_content").hide();}
	if($("#planting\\.id").val()){// && $("#planting\\.activityStatus\\.status").val()!="<s:property value='replan.getDOMVALUE()'/>" && $("#planting\\.activityStatus\\.status").val()!="<s:property value='newStatus.getDOMVALUE()'/>"){
		$("#fromInventoryCheck").prop('disabled','disabled');
		$("#yes").prop('disabled','disabled');
		$("#no").prop('disabled','disabled');
	}
	$("#fromInventoryCheck").on('change',function(){
		if($("#fromInventoryCheck").is(':checked')){
			$("#fromInventory").val('true');
			$("#inventory_content").show();
		}else{
			$("#fromInventory").val('false');
			$("#inventory_content").hide();
		}
	});

	if(!$("#yes").is(':checked') && !$("#no").is(':checked')){
		$("#no").prop('checked',true);
		$("#fromForestInstitute").val("N");
	}
	
	$("#rej").on('click',function(){
		$("#activityStatus\\.status").val($("#rej").val());
	});
	$("#rep").on('click',function(){
		$("#activityStatus\\.status").val($("#rep").val());
	});
	$("#apr").on('click',function(){
		$("#activityStatus\\.status").val($("#apr").val());
	});
	$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
	$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '4'});
	
	$("#planting\\.imArea").attr('readonly',true);
	$("#planting\\.imTrees").attr('readonly',true);

	if($("#decisionStatus").val()=='true' || $("#edit").val()=='true'){
		$("#planting\\.prodType").prop('disabled','disabled');
		$("#activity\\.activityDomain\\.name").attr('readonly',true);
		$("#planting\\.treeSpecies\\.name").attr('readonly',true);
		$("#planting\\.seedlingAge").attr('readonly',true);
		$("#planting\\.plArea").attr('readonly',true);
		$("#planting\\.plTrees").attr('readonly',true);
		$("#file").attr('disabled','disabled');
	}else if($("#planting\\.workStage").val()=='I'){
		$("#activity\\.activityDomain\\.name").attr('readonly',true);
		$("#planting\\.treeSpecies\\.name").attr('readonly',true);
		$("#planting\\.seedlingAge").attr('readonly',true);
		$("#planting\\.plArea").attr('readonly',true);
		$("#planting\\.plTrees").attr('readonly',true);
		$("#planting\\.prodType").prop('disabled','disabled');
	}
	$("#planting\\.stand\\.id").val($("#standId").val());

    $("#activity\\.activityDomain\\.name").select2({
        placeholder: "",
        minimumInputLength: 0,
        ajax: {
	        url: "Input.activityDomain.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
		        if(term == "") term = " ";   
		        return {
		        	name_startsWith: term,
		        	dom_code:"PLNTG"
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
        	$("#activity\\.activityDomain\\.id").val(item.id);
            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    }); 

    $("#planting\\.treeSpecies\\.name").select2({
        placeholder: "",
        minimumInputLength: 0,
        ajax: {
	        url: "Input.treeSpecies.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
	        if(term == "") term = " ";   
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
        formatResult: formatResult,
        formatSelection: function(item) {
        	$("#planting\\.treeSpecies\\.id").val(item.id);
            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    }); 

    

	if($("#language").val()=='en'){
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameEn"/>"});
		$("#planting\\.treeSpecies\\.name").select2("data", {id: "<s:property value='planting.treeSpecies.id'/>", name: "<s:property value="planting.treeSpecies.nameEn"/>"});		
	}else if($("#language").val()=='al'){
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameAl"/>"});
		$("#planting\\.treeSpecies\\.name").select2("data", {id: "<s:property value='planting.treeSpecies.id'/>", name: "<s:property value="planting.treeSpecies.nameAl"/>"});		
	}else if($("#language").val()=='sr'){
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameSr"/>"});
		$("#planting\\.treeSpecies\\.name").select2("data", {id: "<s:property value='planting.treeSpecies.id'/>", name: "<s:property value="planting.treeSpecies.nameSr"/>"});		
	}
	
	/* when cancel button is pressed, when X(close) button is pressed or when ESC button is pressed then enable disabled buttons*/
	$("#planting_plan_page_content").on("remove",function(){
		$("#planting_plan_page_content").remove();
		$("#pl_edit_button").removeClass('ui-state-disabled');
		$("#pl_activity_button").removeClass('ui-state-disabled');
	});
	
	$("#cancelPLA").on('click', function(){
		$("#planting_plan_page_content").dialog("close");
		return false;
		});
	var stat="<s:property value='planting.activityStatus.status.getDOMKEY()'/>";
    $("#savePLA").on('click', function() {
    	if(opl_val=='R' && stat=='APR'){
			$.SmartMessageBox({
				title : "<s:text name="annual.plan.impl.confirm.registration.title"/>",
				content : "<s:text name="annual.plan.impl.confirm.registration.content"/>",
				buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
				icon : "fa fa-bell"
			}, function(ButtonPressed) {
					if (ButtonPressed == "<s:text name="rbac.permission.button.yes"/>") {
						var this_form =$("#planting_form");
						
						var ids = $("#planting_declare").jqGrid('getDataIDs');
						for (var i = 0; i < ids.length+1; i++) {
							$("#planting_declare").jqGrid('saveRow', ids[i]);
						}
						var plnArray = $("#planting_declare").jqGrid('getRowData');

						var jsonText = JSON.stringify(plnArray);
						$('<input>').attr({
							type : 'hidden',
							name : "jsonDetails",
							value : jsonText
						}).appendTo(this_form);
						
				    	$(':button').prop('disabled','disabled');
				    	$("#planting\\.prodType").prop('disabled',false);
						$('#planting_form').submit();
					}//EOF IF ButtonPressed
				});	
			}else{
		    	$(':button').prop('disabled','disabled');
		    	$("#planting\\.prodType").prop('disabled',false);
				$('#planting_form').submit();
		}

		return false;
	});


    (function() {
		$('form').ajaxForm({
			beforeSerialize: function($form, options) {         
			},
		    beforeSend: function() {
		    },
			error : function(response, status, err){
				$("#plan_content_planting").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
				$("#plan_content_planting").html(jqXHR.responseText);
				
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
					jQuery("#planting_grid").trigger("reloadGrid");
					if(opl_val!='R' && stat!='APR' ){
						$("#planting_plan_page_content").dialog("close");
						}
					$.smallBox({
						title : '<s:text name="small.box.on.save.title.success"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#739E73",
						timeout: 5000,
						icon : "fa fa-check",
						number : "1"
					});
				}	
				$(':button').prop('disabled',false);    	
		    },	    
			complete: function(xhr) {
			}
		});				
	})();
	var imArea='<s:property value='planting.imArea'/>';
	var imTrees='<s:property value='planting.imTrees'/>';
	
	if(imTrees-$("#planting\\.plTrees").val()>0){
		alert(imTrees +">"+$("#planting\\.plTrees").val());
		$('#planting\\.imTrees').css('background-color', '#F47777');
		}
	if(imArea-$("#planting\\.plArea").val()> 0){
		$('#planting\\.imArea').css('background-color', '#F47777');
		}


	
});

</script>								
