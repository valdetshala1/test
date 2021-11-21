<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<jsp:include page="../../../base/validation.jsp"></jsp:include>

<form id="standharvest_form" class="smart-form" action="HarvestSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">

<input id="standId" name="standId" value="<s:property value='stand.id'/>" type="hidden">
<input id="plMultipolygon" name="plMultipolygon"  value="<s:property value='activity.planedGeom'/>" type="hidden">
<input id="imMultipolygon" name="imMultipolygon"  value="<s:property value='activity.implementedGeom'/>" type="hidden">
<input id="stand.theGeom"  value="<s:property value='stand.theGeom'/>" type="hidden">
<input id="standharvest.stand.id" name="standharvest.stand.id" value="<s:property value='stand.id'/>" type="hidden">
<input id="standharvest.id" name="standharvest.id" value="<s:property value='standharvest.id'/>" type="hidden">
<input id="standharvest.workStage" name="standharvest.workStage" value="<s:property value='standharvest.workStage'/>" type="hidden">
<input id="activityStatus.id" name="activityStatus.id" value="<s:property value='activityStatus.id'/>" type="hidden">
<input id="activityStatus.status" name="activityStatus.status" value="<s:property value='activityStatus.status.getDOMVALUE()'/>" type="hidden">
<input id="decisionStatus" name="decisionStatus" value="<s:property value='decisionStatus'/>" type="hidden">
<input id="edit" value="<s:property value='edit'/>" type="hidden">
<input id="activity.id" name="activity.id" value="<s:property value='activity.id'/>" type="hidden">
<input id="activity.activityNo" name="activity.activityNo" value="<s:property value='activity.activityNo'/>" type="hidden">
<input id="annualPlanning.cadastralMunicipality.id" name="annualPlanning.cadastralMunicipality.id" value="<s:property value='activity.annualPlanning.cadastralMunicipality.id'/>" type="hidden">
<input id="standharvest.plCreatedDate" name="standharvest.plCreatedDate" value="<s:property value='standharvest.plCreatedDate'/>" type="hidden">
<input id="standharvest.personByPlCreatedBy.id" name="standharvest.personByPlCreatedBy.id" value="<s:property value='standharvest.personByPlCreatedBy.id'/>" type="hidden">
<input id="standharvest.activityStatus.status" name="standharvest.activityStatus.status" value="<s:property value='standharvest.activityStatus.status.getDOMVALUE()'/>" type="hidden" >
<input id="standharvest.activityStatus.id" name="standharvest.activityStatus.id" value="<s:property value='standharvest.activityStatus.id'/>" type="hidden" >
<input id="standharvest.imCreatedDate" name="standharvest.imCreatedDate" value="<s:property value='standharvest.imCreatedDate'/>" type="hidden">
<input id="standharvest.personByImCreatedBy.id" name="standharvest.personByImCreatedBy.id" value="<s:property value='standharvest.personByImCreatedBy.id'/>" type="hidden">		
<input id="currentPlanStatus" name="currentPlanStatus" value="<s:property value='currentPlanStatus'/>" type="hidden">		
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
			<!-- START stand.forestTyp -->
			<div class="row">
				<section class="col col-10">
				<label class="input"><s:text name='planting.stand.annu.plan'/>:
					<s:if test="fieldErrors.get('annualplanId')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="annualplanName" name="annualplanName" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name='planting.stand.annu.plan'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.forestTyp')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<s:if test="annualplan != null">
							<input class="form-control input-xs-g" id="annualplanName" name="annualplanName" readonly="readonly" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name='planting.stand.annu.plan'/>" type="text">
							</s:if>
							<s:else>
							<input id="annualplanName" name="annualplanName" class="form-control" placeholder="<s:text name="placeholder.enter.mun.name"/>" type="text"/>
							</s:else>
							<input id="annualplanId" name="annualplanId" value="<s:property value='annualplan.id'/>" type="hidden" >
						</div>
					</s:else>
				</label>
				</section>
			<!-- END stand.forestTyp -->	
			</div>
			<div class="row">					
			<!-- START standharvest.activity.frmDoman.id -->
				<section class="col col-10">
					<label class="input">*<s:text name='annu.seedling.label.activity'/>:
						<s:if test="fieldErrors.get('domainId')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="domainActivity" name="domainActivity"  placeholder="<s:text name='annu.seedling.label.activity'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('domainId')"/> </span>
							<input id="domainId" name="domainId" type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<s:if test="locale.language == 'en'">
							<s:set name="dommainName" value="standharvest.activity.activityDomain.nameEn"/>
							</s:if>
							<s:elseif test="locale.language == 'sr'">
							<s:set name="dommainName" value="standharvest.activity.activityDomain.nameSr"/>
							</s:elseif>
							<s:else>
							<s:set name="dommainName" value="standharvest.activity.activityDomain.nameAl"/>
							</s:else>
							<input  class="form-control input-xs-g" id="domainActivity" name="domainActivity" value="<s:property value="#dommainName"/>"  placeholder="<s:text name='annu.seedling.label.activity'/>" type="text">
							<input id="domainId" name="domainId" value="<s:property value='standharvest.activity.activityDomain.id'/>" type="hidden">
						</div>
					</s:else>
					</label>
				</section>
			<!-- END standharvest.activity.frmDoman.id -->
			</div>
			</div>
			</div>
			<div class="row">
			<!-- START stand.stockLevel -->
				<section class="col col-6">
					<label class="input">*<s:text name='frm.harvest.planning.tree.species.id'/>:
						<s:if test="fieldErrors.get('treeTypeId')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="treeSpeciesName" name="treeSpeciesName"  placeholder="<s:text name="tree.species.please.type"/>" type="text" />
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treeTypeId')"/> </span>
							<input id="treeTypeId" name="treeTypeId" type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<s:if test="locale.language == 'en'">
							<s:set name="tsName" value="standharvest.treeSpecies.nameEn"/>
							<s:set name="tsGroup" value="standharvest.treeSpecies.speciesGroup.DOMTEXT_EN"/>
							</s:if>
							<s:elseif test="locale.language == 'sr'">
							<s:set name="tsName" value="standharvest.treeSpecies.nameSr"/>
							<s:set name="tsGroup" value="standharvest.treeSpecies.speciesGroup.DOMTEXT_SR"/>
							</s:elseif>
							<s:else>
							<s:set name="tsName" value="standharvest.treeSpecies.nameAl"/>
							<s:set name="tsGroup" value="standharvest.treeSpecies.speciesGroup.DOMTEXT"/>
							</s:else>						
							<input class="form-control input-xs-g" id="treeSpeciesName" name="treeSpeciesName" value="<s:property value='#tsName'/>"  placeholder="<s:text name="tree.species.please.type"/>" type="text" >
							<input id="treeTypeId" name="treeTypeId" value="<s:property value='standharvest.treeSpecies.id'/>" type="hidden" >
						</div>
					</s:else>
					</label>
				</section>
			<!-- END stand.stockLevel -->
			<!-- START stand.remarks -->
				<section class="col col-6">
				<label class="input"><s:text name='frm.harvest.planning.remarks'/>:
						<input class="form-control input-xs-g"  type="text" id="standharvest.remarks" name="standharvest.remarks" placeholder="<s:text name='frm.harvest.planning.remarks'/>" value="<s:property value='standharvest.remarks'/>">
					</label>
				</section>
			<!-- END stand.remarks -->
		</div>			
		<!-- END row -->
		</fieldset>

		<fieldset class="no-padding">
		<legend><s:text name="frm.private.request.planning"/></legend>
		<!-- START row -->
		<div class="row">
			
			<!-- START standharvest.plTechVolume-->
				<section class="col col-4">
					<label class="input">*<s:text name='frm.harvest.planning.pl.tech.volume'/> (m<sup>3</sup>):
						<s:if test="fieldErrors.get('standharvest.plTechVolume')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" type="text" data="number" id="standharvest.plTechVolume" name="standharvest.plTechVolume" placeholder="<s:text name='frm.harvest.planning.pl.tech.volume'/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('standharvest.plTechVolume')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g"  type="text" data="number" data-rule="quantity" id="standharvest.plTechVolume" name="standharvest.plTechVolume" value="<s:property value='standharvest.plTechVolume'/>" placeholder="<s:text name='frm.harvest.planning.pl.tech.volume'/>">
						</div>
					</s:else>
					</label>
				</section>
			<!-- END standharvest.plTechVolume -->
			
			<!-- START standharvest.plFireVolume -->
				<section class="col col-4">
					<label class="input">*<s:text name='frm.harvest.planning.pl.fire.volume'/> (m<sup>3</sup>):
					<s:if test="fieldErrors.get('standharvest.plFireVolume')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" type="text" data="number" id="standharvest.plFireVolume" name="standharvest.plFireVolume" placeholder="<s:text name="frm.harvest.planning.pl.fire.volume"/>" />
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('standharvest.plFireVolume')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" data="number" data-rule="percent" id="standharvest.plFireVolume" name="standharvest.plFireVolume" value="<s:property value='standharvest.plFireVolume'/>" placeholder="<s:text name="frm.harvest.planning.pl.fire.volume"/>" />
						</div>
					</s:else>
					</label>
				</section>
			<!-- END standharvest.plFireVolume -->
			
			<!-- START standharvest.plPulpVolume-->
				<section class="col col-4">
					<label class="input">*<s:text name='frm.harvest.planning.pl.pulp.volume'/> (m<sup>3</sup>):
					<s:if test="fieldErrors.get('standharvest.plPulpVolume')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" type="text" data="number" id="standharvest.plPulpVolume" name="standharvest.plPulpVolume" placeholder="<s:text name="frm.harvest.planning.pl.pulp.volume"/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('standharvest.plPulpVolume')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" data="number" id="standharvest.plPulpVolume" name="standharvest.plPulpVolume" value="<s:property value='standharvest.plPulpVolume'/>" placeholder="<s:text name="frm.harvest.planning.pl.pulp.volume"/>" >
						</div>
					</s:else>
					</label>
				</section>
			<!-- END standharvest.plPulpVolume -->

		</div>			
		<!-- END row -->
		</fieldset>
		<div id="harv_marked">
<!-- 		<fieldset class="no-padding"> -->
			<legend><s:text name="frm.harvest.planning.marked"/>
			<!-- START markedDone -->
			<input type="checkbox" id="terrainDone" name="terrainDone" value="<s:property value='terrainDone'/>">
			<!-- END smarkedDone -->
			</legend>	
			<div class="row">
				<section class="col col-10 full-grid">
					<div class="form-group">
						<div id="harv_marked_grid_content">
							<jsp:include page="harvest_marked_grid.jsp"></jsp:include>
						</div>
					</div>
				</section>
			</div>
			
<!-- 		</fieldset> -->
		</div>
		<!--START harv_impl -->
		<div id="harv_impl">
<!-- 		<fieldset class="no-padding"> -->
		<legend><s:text name="frm.harvest.planning.implementation"/></legend>		
		<!-- START row -->
		<div class="row">
			<!-- START standharvest.imTechVolume-->
				<section class="col col-4">
					<label class="input"><s:text name='frm.harvest.planning.im.tech.volume'/> (m<sup>3</sup>):
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" data="number" id="standharvest.imTechVolume" name="standharvest.imTechVolume" value="<s:property value='standharvest.imTechVolume'/>" placeholder="<s:text name="frm.harvest.planning.im.tech.volume"/>" >
						</div>
					</label>
				</section>
			<!-- END standharvest.imTechVolume -->
			
			<!-- START standharvest.imFireVolume -->
				<section class="col col-4">
					<label class="input"><s:text name='frm.harvest.planning.im.fire.volume'/> (m<sup>3</sup>):
						<div class="form-group">
							<input  class="form-control input-xs-g" type="text" data="number" id="standharvest.imFireVolume" name="standharvest.imFireVolume" value="<s:property value='standharvest.imFireVolume'/>" placeholder="<s:text name="frm.harvest.planning.im.fire.volume"/>" >
						</div>
					</label>
				</section>
			<!-- END standharvest.imFireVolume -->
			
			<!-- START stand.stockLevel -->
				<section class="col col-4">
					<label class="input"><s:text name='frm.harvest.planning.im.pulap.volume'/> (m<sup>3</sup>):
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" data="number" id="standharvest.imPulpVolume" name="standharvest.imPulpVolume" value="<s:property value='standharvest.imPulpVolume'/>" placeholder="<s:text name="frm.harvest.planning.pl.pulp.volume"/>" >
						</div>
					</label>
				</section>
			<!-- END stand.stockLevel -->
		</div>			
		<!-- END row -->					
				<div class="row">
					<section class="col col-10 full-grid">
						<div class="form-group">
							<div id="harv_declare_grid_content">
								<jsp:include page="harv_declare_grid.jsp"></jsp:include>
							</div>
						</div>
					</section>
				</div>
					
			<div class="row">
					<section class="col col-10 full-grid">
						<div class="form-group">
							<div id="harv_impl_selected_grid_content">
								<jsp:include page="harv_impl_selected_grid.jsp"></jsp:include>
							</div>
						</div>
					</section>
			</div>
		
<!-- 		</fieldset> -->
		<fieldset class="no-padding">
		<legend><s:text name="frm.harvest.planning.damage"/></legend>		
		
		<!-- START row -->
		<div class="row">
			<!-- START standharvest.damageVolume-->
				<section class="col col-4">
					<label class="input"><s:text name='frm.harvest.planning.damage.volume'/>:
						<s:if test="fieldErrors.get('standharvest.damageVolume')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" type="text" data="number" id="standharvest.damageVolume" name="standharvest.damageVolume" placeholder="<s:text name='frm.harvest.planning.damage.volume'/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('standharvest.damageVolume')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" data="number" id="standharvest.damageVolume" name="standharvest.damageVolume" value="<s:property value='standharvest.damageVolume'/>" placeholder="<s:text name='frm.harvest.planning.damage.volume'/>">
						</div>
					</s:else>
					</label>
	
				</section>
			<!-- END standharvest.damageVolume -->
			
		</div>			
		<!-- END row -->					
		</fieldset>
		</div>
		<!-- End harv_impl -->
		
		<fieldset class="no-padding">
			<legend><s:text name="tender.request.attachment"/></legend>
				<!-- START attachment -->
				<s:if test="fieldErrors.get('attachment')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="tender.request.attachment"/>:</label>
					 	  <div class="col-md-10">
					      	<input class="form-control input-xs-g" id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFilesDataAlf(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('attachment')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-3 control-label"><s:text name="tender.request.attachment"/>:</label>
						<div class="col-md-10">
						<!-- 
							
							<input id="file" type="file" class="file" multiple="true" data-show-upload="false" data-show-caption="true">
							<input id="file" class="file" type="file" multiple=true data-preview-file-type="any" data-upload-url="#" data-show-caption="false" data-show-upload="false">
						-->
							<input class="form-control input-xs-g" id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFilesDataAlf(this);">							
						</div>
					</div>
					
				</s:else>
				<!-- END attachment -->
				<input id="docNameAlf" name="docNameAlf" value="<s:property value='docNameAlf'/>" type="hidden">
				<input id="docTypeAlf" name="docTypeAlf" value="<s:property value='docTypeAlf'/>" type="hidden">
		
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
			<label class="input"><s:text name="hum.employee.label.comment"/>:
			<s:if test="fieldErrors.get('activityStatus.remarks')!=null">
				<div class="form-group has-error">
					<textarea id="status.remarks" name="activityStatus.remarks" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"></textarea>
					<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityStatus.remarks')"/> </span>
				</div>
			</s:if>
			<s:else>
				<div class="form-group">
					<textarea id="activityStatus.remarks" name="activityStatus.remarks" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"><s:property value='activityStatus.remarks'/></textarea>
				</div>
			</s:else>
			</label>

		</section>
		<br><br><br>
		<footer class="form-actions act-popup-footer" >
<%-- 			<s:if test="user.checkAccess('frm', '_write')"> --%>
				<s:if test="!edit">
					<button id="save" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				</s:if>
<%-- 			</s:if> --%>
				<button id="cancel" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
					</button>
		</footer>
		
</form>

		
<script type="text/javascript">
/*
jQuery(function($){
	<s:if test="%{user.hasOperation('add;edit') == false}">
	$(':input').attr('readonly','readonly'); 
	$(':checkbox').attr('disabled','disabled');
	$(':radio').attr('disabled','disabled'); 
	</s:if>

 });
 */
</script> 	

<script type="text/javascript">

$(document).ready(function() {
	var work_stage=$("#standharvest\\.workStage").val();
	$("#harv_marked").hide();
	$("#harv_impl").hide();
	$("#transport").hide();

	if(work_stage=="M"){
		$("#harv_marked").show();
		}else if(work_stage=="I"){
		$("#harv_impl").show();
		$("#harv_marked").show();
		$('#terrainDone').val("true");
		$("#transport").show();
		}
    	$('#terrainDone').bind('change', function () {
    		   if ($(this).is(':checked'))
    			   $('#terrainDone').val("true");
    		   else
    			   $('#terrainDone').val("false");
    	});
   	   if($('#terrainDone').val()=='true'){
           $('#terrainDone').attr('checked', true);
           }
	   	$('#transportDone').bind('change', function () {
			   if ($(this).is(':checked'))
				   $('#transportDone').val("true");
			   else
				   $('#transportDone').val("false");
		});
	   var statTransport='<s:property value="transport"/>';   
   	   if($('#transportDone').val()=='true' || $('#standharvest\\.activityStatus\\.status').val()==statTransport){
           $('#transportDone').attr('checked', true);
           }
     
	//https://github.com/BobKnothe/autoNumeric
	//http://lamar.colostate.edu/~hillger/common.html
	$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	var opl_val='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
	
	//$('input.number').autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2', aSign: 'm\u00b3 '});
	//$('input.number').autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	//data-a-sign="m³ " data-a-dec="," data-a-sep="."
	
	//m^3, km/h
	//$('input.number').number( true, 2 );
	
	$("#rej").on('click',function(){
		$("#activityStatus\\.status").val($("#rej").val());
	});
	$("#rep").on('click',function(){
		$("#activityStatus\\.status").val($("#rep").val());
	});
	$("#apr").on('click',function(){
		$("#activityStatus\\.status").val($("#apr").val());
	});
	
	if($("#decisionStatus").val()=='true' || $("#edit").val()=='true'){
		$("#standharvest\\.damageVolume").attr('readonly',true);
		$("#domainActivity").attr('readonly',true);
		$("#treeSpeciesName").attr('readonly',true);
		$("#standharvest\\.remarks").attr('readonly',true);
		$("#standharvest\\.plTechVolume").attr('readonly',true);
		$("#standharvest\\.plFireVolume").attr('readonly',true);
		$("#standharvest\\.plPulpVolume").attr('readonly',true);
	}else if($("#standharvest\\.workStage").val()=='P' || $("#standharvest\\.workStage").val()==''){
		$("#standharvest\\.damageVolume").attr('readonly',true);
	}else if($("#standharvest\\.workStage").val()=='I' || $("#standharvest\\.workStage").val()=='M'){
		$("#domainActivity").attr('readonly',true);
		$("#treeSpeciesName").attr('readonly',true);
		$("#standharvest\\.remarks").attr('readonly',true);
		$("#standharvest\\.plTechVolume").attr('readonly',true);
		$("#standharvest\\.plFireVolume").attr('readonly',true);
		$("#standharvest\\.plPulpVolume").attr('readonly',true);
	}
	
	$("#standharvest\\.imTechVolume").attr('readonly',true);
	$("#standharvest\\.imFireVolume").attr('readonly',true);
	$("#standharvest\\.imPulpVolume").attr('readonly',true);



	if($("#edit").val()=='true'){
		$("#file").attr('disabled','disabled');
	}

    $("#domainActivity").select2({
        minimumInputLength: 0,
        ajax: {
	        url: "Input.activityDomain.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
	        return {
	        	dom_code:"HARVT",
	        	name_startsWith: term,
	        };
	        },
	        results: function (data, page) { 
	        return { results: data };
	        },
	        cache: false
        },
        initSelection: function(element, callback) {
        },
        formatResult: formatResult,
        formatSelection: function(item) {
        	$("#domainId").val(item.id);
            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    });    

    $("#domainActivity").select2("data", {id: "<s:property value='standharvest.activity.activityDomain.id'/>", name: "<s:property value="#dommainName"/>"});

    $("#treeSpeciesName").select2({
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
        	$("#treeTypeId").val(item.id);
            return item.name+" ("+item.species_group+")";
        },
        allowClear: true,
        dropdownCssClass: "bigdrop",
        escapeMarkup: function (m) { return m; }
    }); 
	if($("#treeTypeId").val()){
    	$("#treeSpeciesName").select2("data", {id: "<s:property value='standharvest.treeSpecies.id'/>", name: "<s:property value='#tsName'/>",species_group:"<s:property value='#tsGroup'/>"});
	}

	/* when cancel button is pressed, when X(close) button is pressed or when ESC button is pressed then enable disabled buttons*/
	$("#stand_page_content").on("remove",function(){
		$("#edit_button").removeClass('ui-state-disabled');
		$("#activity_button").removeClass('ui-state-disabled');
	});
	$("#cancel").on('click', function(){
		$("#stand_page_content").dialog("close");
		return false;
	});
	
    $("#save").on('click', function() {
		var this_form =$("#standharvest_form");
		
		var ids = $("#harvest_declare").jqGrid('getDataIDs');
		for (var i = 0; i < ids.length+1; i++) {
			$("#harvest_declare").jqGrid('saveRow', ids[i]);
		}
		var harvArray = $("#harvest_declare").jqGrid('getRowData');

		var jsonText = JSON.stringify(harvArray);
		$('<input>').attr({
			type : 'hidden',
			name : "jsonDetails",
			value : jsonText
		}).appendTo(this_form);

// 		jsonHarvMarked
		var harvMarkedArray = $("#harvest_marked").jqGrid('getRowData');
		var jsonHarvMarked=JSON.stringify(harvMarkedArray);
		$('<input>').attr({
			type : 'hidden',
			name : "jsonHarvMarked",
			value : jsonHarvMarked
		}).appendTo(this_form);


    	$(':button').prop('disabled','disabled');
		$('#standharvest_form').submit();
		return false;
	});

    (function() {
		$('form').ajaxForm({
			beforeSerialize: function($form, options) {         
			},
		    beforeSend: function() {
		    },
			error : function(response, status, err){
				$("#harvest").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
				$("#harvest").html(jqXHR.responseText);
				
				var errors_exits = jqXHR.getResponseHeader("errors_exits");
				var message = jqXHR.getResponseHeader("message");
				
				if (errors_exits == "true") {
					var text='<s:text name="small.box.content"/>';
					if(message){
						text=message;
					}
					$.smallBox({
						title : '<s:text name="small.box.on.save.title.failed"/>',
						content : text,
						color : "#C79121",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				} else {
					jQuery("#standactivity_grid").trigger("reloadGrid");
					if(opl_val!='M'){
						$("#stand_page_content").dialog("close");
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



	var imTech='<s:property value='standharvest.imTechVolume'/>';
	var imFire='<s:property value='standharvest.imFireVolume'/>';
	var imPulp='<s:property value='standharvest.imPulpVolume'/>';
	
	if( imTech - $("#standharvest\\.plTechVolume").val()> 0){
		$('#standharvest\\.imTechVolume').css('background-color', '#F47777');
		}
	if( imFire - $("#standharvest\\.plFireVolume").val()> 0){
		$('#standharvest\\.imFireVolume').css('background-color', '#F47777');
		}
	if( imPulp - $("#standharvest\\.plPulpVolume").val()> 0){
		$('#standharvest\\.imPulpVolume').css('background-color', '#F47777');
		}

	
});

</script>								
