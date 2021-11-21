<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->
<jsp:include page="../../../base/validation.jsp"></jsp:include>
	<!-- widget content -->
	<div class="widget-body">
		<form id="seedactivity_form" class="form-horizontal" action="SeedActivitySave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="annu.seedling.legend.seedling.planning"/></legend>
				<input id="seedActivity.id" name="seedActivity.id" value="<s:property value='seedActivity.id'/>" type="hidden">
				<input id="activity.id" name="activity.id" value="<s:property value='activity.id'/>" type="hidden">
				<input id="language" value="<s:property value="locale.language"/>" type="hidden">
				<input id="seedActivity.workStage" name="seedActivity.workStage" value="<s:property value='seedActivity.workStage'/>" type="hidden">
				<input id="seedActivity.activityStatus.status" name="seedActivity.activityStatus.status" value="<s:property value='seedActivity.activityStatus.status.getDOMVALUE()'/>" type="hidden" >
				<input id="seedActivity.activityStatus.id" name="seedActivity.activityStatus.id" value="<s:property value='seedActivity.activityStatus.id'/>" type="hidden" >
				<input id="decisionStatus" name="decisionStatus" value="<s:property value='decisionStatus'/>" type="hidden">
				<input id="edit" name="edit" value="<s:property value='edit'/>" type="hidden">
				<input id="activityStatus.id" name="activityStatus.id" type="hidden">
				<input id="activityStatus.status" name="activityStatus.status" value="<s:property value='activityStatus.status.getDOMVALUE()'/>" type="hidden">
				<input id="seedActivity.plCreatedDate" name="seedActivity.plCreatedDate" value="<s:property value='seedActivity.plCreatedDate'/>" type="hidden">
				<input id="seedActivity.personByPlCreatedBy.id" name="seedActivity.personByPlCreatedBy.id" value="<s:property value='seedActivity.personByPlCreatedBy.id'/>" type="hidden">
				
				<input id="seedActivity.imCreatedDate" name="seedActivity.imCreatedDate" value="<s:property value='seedActivity.imCreatedDate'/>" type="hidden">
				<input id="seedActivity.personByImCreatedBy.id" name="seedActivity.personByImCreatedBy.id" value="<s:property value='seedActivity.personByImCreatedBy.id'/>" type="hidden">		
					
				<input id="forestInstituteUser" name="forestInstituteUser" value="<s:property value='forestInstituteUser'/>" type="hidden">
				<input id="foPr" name="foPr" value="<s:property value='foPr'/>" type="hidden">
				<input id="foIm" name="foIm" value="<s:property value='foIm'/>" type="hidden">
				<input id="centralPlan" name="centralPlan" value="<s:property value='centralPlan'/>" type="hidden">
							
				<input id="planedGeom" name="planedGeom" value="<s:property value='planedGeom'/>" type="hidden">
				<input id="implementPlanedGeom" name="implementPlanedGeom" value="<s:property value='implementPlanedGeom'/>" type="hidden">
			<!-- START seedActivity.annualPlan -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="annual.plan.view"/></label>
						<div class="col-md-10">
							<input id="annualplanId" name="annualplanId" value="<s:property value='annualplan.id'/>" type="hidden">
							<input id="municipalityId" name="municipalityId" disabled="disabled" value="<s:property value='annualplan.cadastralMunicipality.id'/>" type="hidden">
							<s:if test="%{municipalityId==null}">
								<input id="annualplanName" name="annualplanName" disabled="disabled" value="<s:text name='annual.plan.un.submited.activities.Seedling'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name="annual.plan.view"/>" type="text">
							</s:if>
							<s:else>
								<input id="annualplanName" name="annualplanName" disabled="disabled" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name="annual.plan.view"/>" type="text">
							</s:else>
							
					</div>									
				</div>
			<!-- END seedActivity.annualPlan -->
			
			<!-- START seedActivity.treeSpecies -->
				<s:if test="fieldErrors.get('seedActivity.treeSpecies')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="tree.species.form"/></label>
						<div class="col-md-10">
							<input id="seedActivity.treeSpecies.name" name="seedActivity.treeSpecies.name" class="form-control" placeholder="<s:text name="annu.seedling.label.tree.species"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedActivity.treeSpecies')"/> </span>
							<input id="seedActivity.treeSpecies.id" name="seedActivity.treeSpecies.id" value="<s:property value='seedActivity.treeSpecies.id'/>" type="hidden">
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="tree.species.form"/></label>
						<div class="col-md-10">
							<input id="seedActivity.treeSpecies.name" name="seedActivity.treeSpecies.name" value="<s:property value='seedActivity.treeSpecies.name'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.tree.species"/>" type="text">
							<input id="seedActivity.treeSpecies.id" name="seedActivity.treeSpecies.id" value="<s:property value='seedActivity.treeSpecies.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
			<!-- END seedActivity.treeSpecies -->

			<!-- START activity.activityDomain -->
				<s:if test="fieldErrors.get('activity.frmDomain')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.activity"/></label>
						<div class="col-md-10">
							<input id="activity.activityDomain.name" name="activity.activityDomain.name" class="form-control" placeholder="<s:text name="annu.seedling.label.activity"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activity.frmDomain')"/> </span>
							<input id="activity.activityDomain.id" name="activity.activityDomain.id" value="<s:property value='activity.activityDomain.id'/>" type="hidden">
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.activity"/></label>
						<div class="col-md-10">
							<input id="activity.activityDomain.name" name="activity.activityDomain.name" value="<s:property value='activity.activityDomain.name'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.activity"/>" type="text">
							<input id="activity.activityDomain.id" name="activity.activityDomain.id" value="<s:property value='activity.activityDomain.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
			<!-- END activity.activityDomain -->
			
			<!-- START seedActivity.institute -->
				<s:if test="fieldErrors.get('seedActivity.institute')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="annu.seedling.label.institute"/></label>
						<div class="col-md-10">
							<input id="seedActivity.institute" name="seedActivity.institute" class="form-control" placeholder="<s:text name="annu.seedling.label.institute"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedActivity.institute')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="annu.seedling.label.institute"/></label>
						<div class="col-md-10">
							<input id="seedActivity.institute" name="seedActivity.institute" value="<s:property value='seedActivity.institute'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.institute"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END seedActivity.institute -->
								
				<!-- START seedActivity.prodType -->
				<s:if test="fieldErrors.get('seedActivity.prodType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.prod.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="seedActivity.prodType"
								name="seedActivity.prodType">
								<s:iterator value="prodtypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedActivity.prodType')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.prod.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="seedActivity.prodType"
								name="seedActivity.prodType">
								<s:iterator value="prodtypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
						</div>									
					</div>
				</s:else>
				<!-- END seedActivity.prodType -->
				
				<!-- START seedActivity.prValue -->
				<s:if test="fieldErrors.get('seedActivity.prValue')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.pr.value"/></label>
						<div class="col-md-10">
							<input id="seedActivity.prValue" name="seedActivity.prValue" class="form-control" placeholder="<s:text name="annu.seedling.label.pr.value"/>" type="text" data="number"  step="0">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedActivity.prValue')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.pr.value"/></label>
						<div class="col-md-10">
							<input id="seedActivity.prValue" name="seedActivity.prValue" value="<s:property value='seedActivity.prValue'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.pl.value"/>" type="text" data="number"  step="0">
						</div>									
					</div>
				</s:else>
				<!-- END seedActivity.prValue -->
				
				<!-- START seedActivity.plValue -->
				<s:if test="fieldErrors.get('seedActivity.plValue')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="annu.seedling.label.pl.value"/></label>
						<div class="col-md-10">
							<input id="seedActivity.plValue" name="seedActivity.plValue" class="form-control" placeholder="<s:text name="annu.seedling.label.pl.value"/>" type="text" data="number"  step="0">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedActivity.plValue')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="annu.seedling.label.pl.value"/></label>
						<div class="col-md-10">
							<input id="seedActivity.plValue" name="seedActivity.plValue" value="<s:property value='seedActivity.plValue'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.pl.value"/>" type="text" data="number"  step="0">
						</div>									
					</div>
				</s:else>
				<!-- END seedActivity.plValue -->
				
				<!-- START seedActivity.exValue -->
				<s:if test="fieldErrors.get('seedActivity.exValue')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="annu.seedling.label.ex.value"/></label>
						<div class="col-md-10">
							<input id="seedActivity.exValue" name="seedActivity.exValue" class="form-control" placeholder="<s:text name="annu.seedling.label.ex.value"/>" type="text" data="number" step="0">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedActivity.exValue')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="annu.seedling.label.ex.value"/></label>
						<div class="col-md-10">
							<input id="seedActivity.exValue" name="seedActivity.exValue" value="<s:property value='seedActivity.exValue'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.ex.value"/>" type="text" data="number" step="0">
						</div>									
					</div>
				</s:else>
				<!-- END seedActivity.exValue -->
				
				<!-- START seedActivity.imValue -->
				<s:if test="fieldErrors.get('seedActivity.imValue')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="annu.seedling.label.im.value"/></label>
						<div class="col-md-10">
							<input id="seedActivity.imValue" name="seedActivity.imValue" class="form-control" placeholder="<s:text name="annu.seedling.label.im.value"/>" type="text" data="number" step="0">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedActivity.imValue')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="annu.seedling.label.im.value"/></label>
						<div class="col-md-10">
							<input id="seedActivity.imValue" name="seedActivity.imValue" value="<s:property value='seedActivity.imValue'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.im.value"/>" type="text" data="number" step="0">
						</div>									
					</div>
				</s:else>
				<!-- END seedActivity.imValue -->

		</fieldset>
		<fieldset>
			<legend><s:text name="tender.request.attachment"/></legend>
				<!-- START attachment -->
				<s:if test="fieldErrors.get('attachment')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>: </label>
					 	  <div class="col-md-10">
					      	<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('attachment')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>: </label>
						<div class="col-md-10">
							<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
						</div>
					</div>
				</s:else>
				<!-- END attachment -->
				<input id="doc.docName" name="doc.docName" value="<s:property value='doc.docName'/>" type="hidden">
				<input id="doc.docType" name="doc.docType" value="<s:property value='doc.docType'/>" type="hidden">
		
			</fieldset>
		<s:if test="decisionStatus">
		<fieldset id="status_fieldset">
		<legend><s:text name="law.suit.label.status"/></legend>
		<s:if test="fieldErrors.get('activityStatus.status')!=null">
			<div class="form-group has-error">
			      <div class="col-md-10">
					<label class="radio radio-inline">
						<input type="radio" id="rej" name="activityStatus.status" value="<s:property value='rejected.getDOMVALUE()'/>">
						<i></i><s:text name="frm.statuses.reject"/>
					</label>
					<label class="radio radio-inline">
						<input type="radio" id="apr" name="activityStatus.status" value="<s:property value='approved.getDOMVALUE()'/>">
						<i></i><s:text name="frm.statuses.approve"/>
					</label>
				</div>
			    <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityStatus.status')"/> </span>
		     </div>
		</s:if>
		<s:else>
			<div class="form-group">
				<div class="col-md-10">
					<label class="col-md-4 control-label">
						<input type="radio" class="radiobox" id="rej" name="activityStatus.status" value="<s:property value='rejected.getDOMVALUE()'/>">
						<span><s:text name="frm.statuses.reject"/></span>
					</label>
					<label class="col-md-4 control-label">
						<input type="radio" class="radiobox" id="apr" name="activityStatus.status" value="<s:property value='approved.getDOMVALUE()'/>">
						<span><s:text name="frm.statuses.approve"/></span>
					</label>
				</div>
			</div>
		</s:else>
		</fieldset>
		</s:if>
		<br>
		<section class="col col-4">
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
		<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelSA" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
<%-- 					<s:if test="user.checkAccess('frm', '_write')"> --%>
						<s:if test="!edit">
							<button id="saveSA" class="btn btn-primary" type="submit">
								<i class="fa fa-save"></i>
								<s:text name="label.button.save"></s:text>
							</button>
						</s:if>
<%-- 					</s:if> --%>
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
		$("#rej").on('click',function(){
			$("#activityStatus\\.status").val($("#rej").val());
		});
// 		$("#rep").on('click',function(){
// 			$("#activityStatus\\.status").val($("#rep").val());
// 		});
		$("#apr").on('click',function(){
			$("#activityStatus\\.status").val($("#apr").val());
		});
		if($("#activityStatus\\.status").val()==$("#apr").val()){
			$("#apr").prop('checked',true);
		}
		if($("#activityStatus\\.status").val()==$("#rej").val()){
			$("#rej").prop('checked',true);
		}
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
		if($("#decisionStatus").val()=='true' || $("#edit").val()=='true'){
			$("#seedActivity\\.imValue").attr('readonly',true);
			$("#seedActivity\\.prValue").attr('readonly',true);
			$("#activity\\.activityDomain\\.name").attr('readonly',true);
			$("#seedActivity\\.treeSpecies\\.name").attr('readonly',true);
			$("#seedActivity\\.institute").attr('readonly',true);
			$("#seedActivity\\.prodType").attr('disabled','disabled');
			if($("#edit").val()=='true'){
				$("#seedActivity\\.plValue").attr('readonly',true);
				$("#seedActivity\\.exValue").attr('readonly',true);
			}
		}else if($("#foPr").val()=='true'){
			$("#seedActivity\\.plValue").attr('readonly',true);
			$("#seedActivity\\.exValue").attr('readonly',true);
			$("#seedActivity\\.imValue").attr('readonly',true);
		}else if($("#foIm").val()=='true'){
			$("#seedActivity\\.prValue").attr('readonly',true);
			$("#activity\\.activityDomain\\.name").attr('readonly',true);
			$("#seedActivity\\.treeSpecies\\.name").attr('readonly',true);
			$("#seedActivity\\.institute").attr('readonly',true);
			$("#seedActivity\\.prodType").attr('readonly',true);
			$("#seedActivity\\.plValue").attr('readonly',true);
			$("#seedActivity\\.exValue").attr('readonly',true);
		}else if($("#centralPlan").val()=='true'){
			$("#seedActivity\\.imValue").attr('readonly',true);
			$("#seedActivity\\.prValue").attr('readonly',true);
		}else if($("#forestInstituteUser").val()=='true'){
			$("#seedActivity\\.plValue").attr('readonly',true);
			$("#seedActivity\\.exValue").attr('readonly',true);
			$("#seedActivity\\.imValue").attr('readonly',true);
		}else{
			$("#seedActivity\\.imValue").attr('readonly',true);
			$("#seedActivity\\.prValue").attr('readonly',true);
		}

		$('#seedActivity\\.prodType').val('<s:property value="seedActivity.prodType.DOMVALUE"/>');

		$("#seedActivity\\.treeSpecies\\.name").select2({
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
		    	$("#seedActivity\\.treeSpecies\\.id").val(item.id);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 

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
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	name_startsWith: term,
			        	dom_code:"SEEDG"
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
		if($("#language").val()=='en'){
			$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameEn"/>"});
			$("#seedActivity\\.treeSpecies\\.name").select2("data", {id: "<s:property value='seedActivity.treeSpecies.id'/>", name: "<s:property value="seedActivity.treeSpecies.nameEn"/>"});		
		}else if($("#language").val()=='al'){
			$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameAl"/>"});
			$("#seedActivity\\.treeSpecies\\.name").select2("data", {id: "<s:property value='seedActivity.treeSpecies.id'/>", name: "<s:property value="seedActivity.treeSpecies.nameAl"/>"});		
		}else if($("#language").val()=='sr'){
			$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameSr"/>"});
			$("#seedActivity\\.treeSpecies\\.name").select2("data", {id: "<s:property value='seedActivity.treeSpecies.id'/>", name: "<s:property value="seedActivity.treeSpecies.nameSr"/>"});		
		}
		$("#cancelSA").on('click', function () {                    
			$('#seedactivity_plan_page_content').dialog('close');
			return false;        
		});
				
		$("#saveSA").on('click', function () { 
			$(':button').prop('disabled','disabled');
			$("#seedActivity\\.prodType").attr('disabled',false);
			$('#seedactivity_form').submit();
			return false;        
		});


	    (function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#seedactivity_form_content").html(response);
				},	    
			    success : function(data, status, jqXHR) {
					$("#seedactivity_form_content").html(jqXHR.responseText);
					
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
						jQuery("#seedactivity_grid").trigger("reloadGrid");
						$("#seedactivity_plan_page_content").dialog("close");
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
			    	
	});            
</script>