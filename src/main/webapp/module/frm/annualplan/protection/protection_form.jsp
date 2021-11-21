<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<style type="text/css">
	/* General settings test */
	/* The map and the location bar */
#map_a {
			clear: both;
			position: relative;
			width: auto;
			height: 700px;
			border: 0px solid black;
		}
</style>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
<div class="widget-body" id="protection_form_content">

<jsp:include page="../../../base/validation.jsp"></jsp:include>

<form id="protection_form" class="smart-form" action="ProtectionSave.do" accept-charset="utf8" method="post">
<input id="activity.id" name="activity.id" value="<s:property value='activity.id'/>" type="hidden">
<input id="protection.id" name="protection.id"  value="<s:property value='protection.id'/>" type="hidden">
<input id="language" name="language" value="<s:property value='locale.language'/>" type="hidden">
<input id="protection.workStage" name="protection.workStage" value="<s:property value='protection.workStage'/>" type="hidden">
<input id="protection.plCreatedDate" name="protection.plCreatedDate" value="<s:property value='protection.plCreatedDate'/>" type="hidden">
<input id="protection.personByPlCreatedBy.id" name="protection.personByPlCreatedBy.id" value="<s:property value='protection.personByPlCreatedBy.id'/>" type="hidden">
<input id="muperiodId" name="muperiodId" value="<s:property value='muperiodId'/>" type="hidden">
<input id="protection.imCreatedDate" name="protection.imCreatedDate" value="<s:property value='protection.imCreatedDate'/>" type="hidden">
<input id="protection.personByImCreatedBy.id" name="protection.personByImCreatedBy.id" value="<s:property value='protection.personByImCreatedBy.id'/>" type="hidden">		

			<input id="proSubmitted" name="proSubmitted"
				value="<s:property value='proSubmitted.getDOMVALUE()'/>"
				type="hidden">
			<input id="protection.activityStatus.status" name="protection.activityStatus.status"
				value="<s:property value='protection.activityStatus.status.getDOMVALUE()'/>"
				type="hidden">
			<input id="munView" name="munView" value="<s:property value='munView'/>" type="hidden">
			<input id="regionalView" name="regionalView" value="<s:property value='regionalView'/>" type="hidden">
			<input id="kfaView" name="kfaView" value="<s:property value='kfaView'/>" type="hidden">
			<input id="hideToolbar" name="hideToolbar" value="<s:property value='hideToolbar'/>" type="hidden">
			
			<input id="activityStatus.id" name="activityStatus.id"
				value="<s:property value='activityStatus.id'/>"
				type="hidden">

		<div class="row"> 
		<fieldset>
		<legend><s:text name="annu.seedling.label.activity"/></legend>
			<div class="col-md-4">
			   <div class="col-sm-3 profile-pic">
				<img src="data:image/jpeg;base64,<s:property value='barCodeImg'/>" class="barcode-gl"  />
			   </div>
			</div>
			<div class="col-md-8 padding-left-0">
			<!-- START planting.annualPlan -->
			<div class="row">
			<section class="col col-6">
				<label class="input"> <s:text name='tender.request.annual.plan'/>:
					<s:if test="fieldErrors.get('annualplanId')!=null">
						<div class="form-group has-error">
							<input id="annualplanName" name="annualplanName" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name='tender.request.annual.plan'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.forestTyp')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<s:if test="annualplan != null">
							<input id="annualplanName" name="annualplanName" readonly="readonly" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name='tender.request.annual.plan'/>" type="text">
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
			
		   <!-- START activity.activityDomain.id -->
				<section class="col col-6">
					<label class="input">*<s:text name="annu.seedling.label.activity"/>:
						<s:if test="fieldErrors.get('activity.frmDomain.id')!=null">
						<div class="form-group has-error">
							<input id="activity.activityDomain.name" name="activity.activityDomain.name" class="form-control" placeholder="<s:text name="organization.placeholder.enter.activity"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activity.frmDomain.id')"/> </span>
							<input id="activity.activityDomain.id" name="activity.activityDomain.id" type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="activity.activityDomain.name" name="activity.activityDomain.name" value="<s:property value='activity.activityDomain.name'/>" class="form-control" placeholder="<s:text name="organization.placeholder.enter.activity"/>" type="text">
							<input id="activity.activityDomain.id" name="activity.activityDomain.id" value="<s:property value='activity.activityDomain.id'/>" type="hidden">
						</div>
					</s:else>
					</label>
				</section>
			</div>
			<!-- END activity.activityDomain.id -->
			<div class="row">
		   <!-- START protection.unitsMetric -->
				<section class="col col-6">
					<label class="input">*<s:text name="frm.protection.unit.metric"/>:
						<s:if test="fieldErrors.get('protection.unitsMetric')!=null">
						<div class="form-group has-error">
							<input type="text" id="protection.unitsMetric.name" name="protection.unitsMetric.name" class="form-control" placeholder="<s:text name="frm.protection.unit.metric"/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('protection.unitsMetric')"/> </span>
							<input type="hidden" id="protection.unitsMetric.id" name="protection.unitsMetric.id"  class="form-control" placeholder="<s:text name="frm.protection.unit.metric"/>">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input type="text" id="protection.unitsMetric.name" name="protection.unitsMetric.name"  class="form-control" value="<s:property value='protection.unitsMetric.name'/>"  placeholder="<s:text name="frm.protection.unit.metric"/>">
							<input type="hidden" id="protection.unitsMetric.id" name="protection.unitsMetric.id"  class="form-control" value="<s:property value='protection.unitsMetric.id'/>"  placeholder="<s:text name="frm.protection.unit.metric"/>">
						</div>
					</s:else>
					</label>
				</section>
			<!-- END protection.unitsMetric -->
			   <!-- START protection.managementUnit -->
					<section class="col col-6">
						<label class="input">*<s:text name="frm.protection.management.unit"/>:
							<s:if test="fieldErrors.get('protection.managementUnit')!=null">
							<div class="form-group has-error">
									<input type="text" id="protection.managementUnit.muName" name="protection.managementUnit.muName" class="form-control"   placeholder="<s:text name="frm.protection.management.unit"/>">
									<input type="hidden" id="protection.managementUnit.id" name="protection.managementUnit.id" class="form-control" value="<s:property value='protection.managementUnit.id'/>"  placeholder="<s:text name="frm.protection.management.unit"/>">
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('protection.managementUnit')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input type="text" id="protection.managementUnit.muName" name="protection.managementUnit.muName"  class="form-control" value="<s:property value='protection.managementUnit.muName'/>"  placeholder="<s:text name="frm.protection.management.unit"/>">
					  		    <input type="hidden" id="protection.managementUnit.id" name="protection.managementUnit.id" class="form-control" value="<s:property value='protection.managementUnit.id'/>"  placeholder="<s:text name="frm.protection.management.unit"/>">
							</div>
						</s:else>
						</label>
					</section>
				<!-- END protection.managementUnit-->
			</div>
		 </div>
		</fieldset>
		</div>
		<div class="row">
		<fieldset>
		<legend><s:text name="frm.protection.planning.fieldset"/></legend>
		<!-- START row -->
			   <!-- START protection.plValue -->
					<section class="col col-4">
						<label class="input">*<s:text name="frm.protection.plan.value"/> (<label id="unitLabelPl"></label>):
							<s:if test="fieldErrors.get('protection.plValue')!=null">
							<div class="form-group has-error">
								<input type="text" id="protection.plValue" name="protection.plValue" class="number"  value="<s:property value='protection.plValue'/>"  placeholder="<s:text name="frm.protection.plan.value"/>">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('protection.plValue')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input type="text" id="protection.plValue" name="protection.plValue"  class="number"  value="<s:property value='protection.plValue'/>"  placeholder="<s:text name="frm.protection.plan.value"/>">
							</div>
						</s:else>
						</label>
					</section>
				<!-- END protection.plValue-->
		</fieldset>
		</div>
		
		<div id="implementationdiv">
		<fieldset>
		<legend><s:text name="frm.protection.implementation.fieldset"/></legend>		
		<!-- START row -->
		<div class="row">
			  <!-- START protection.imValue -->
					<section class="col col-4">
						<label class="input"><s:text name="frm.protection.impl.value"/> (<label id="unitLabelImpl"></label>):
							<div class="form-group">
								<input type="text" id="protection.imValue" name="protection.imValue"  class="number"  value="<s:property value='protection.imValue'/>"  placeholder="<s:text name="frm.protection.impl.value"/>">
							</div>
						</label>
					</section>
				<!-- END protection.imValue-->
		</div>			
		<!-- END row -->
		</fieldset>
	
		<fieldset class="no-padding">
		<legend>  <s:text name='frm.harvest.impl.declare'/></legend>
		<!-- START row -->		
		<div class="row">
						<section class="col col-10">
							<div class="form-group">
								<div id="prot_declare_grid_content">
										<jsp:include page="protection_declare_grid.jsp"></jsp:include>
								</div>
							   
							</div>
						</section>
		</div>
		<!-- END row -->
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
				<input id="docNameAlf" name="docNameAlf" value="<s:property value='docNameAlf'/>" type="hidden">
				<input id="docTypeAlf" name="docTypeAlf" value="<s:property value='docTypeAlf'/>" type="hidden">
		
			</fieldset>
			<s:if test="kfaView"> 
				<fieldset id="status_fieldset" class="no-padding">
					  <legend><s:text name="law.suit.label.status"/></legend>
				<section>
					<s:if test="fieldErrors.get('protection.decisionStatus')!=null">
						<div class="form-group has-error">
						<div id="row">
					    <div class="inline-group has-error">
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='proRejected.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.reject"/></label>
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='proReplanned.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.replan"/></label>
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='proApproved.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.approve"/></label>
					    </div>
					    </div>
						    <div id="row" class="col-md-10">
					     <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
							value="fieldErrors.get('protection.decisionStatus')" /> </span>
							</div>
							</div>
				    </s:if>
				    <s:else>
				    <div class="inline-group">
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='proRejected.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.reject"/></label>
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='proReplanned.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.replan"/></label>
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='proApproved.getDOMVALUE()'/>">
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
	  	<div id="toolbarDiv">
			<footer class="form-actions">
				<s:if test="!hideToolbar"> 
					<button id="savePR" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				</s:if>
					<button id="cancelPR" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
						
			</footer>
		</div>
</form>
</div>
</div>
 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
				<div>
						<div class="no-padding">
							<ul class="nav nav-tabs tabs-pull-left"   id="slvboard">
								<li class="active">
									<a class="tab-color" href="#mapTab"  data-toggle="tab">Map </a>
								</li>
								<div class="widget-toolbar" id="coordbar-widget">
									<div class="label label-warning" style="width: 100%;">
										<span id="scale"></span>
									</div>
								</div>	
								<div class="widget-toolbar" id="coordbar-widget">
									<div class="label label-warning">
										<span id="coordbar"></span>
									</div>
								</div>
							</ul>
							<div class="tab-content no-padding">
								<!-- start map tab -->
									<div class="tab-pane fade in active" id="mapTab">
												<div class="widget-body">
														<div class="widget-toolbar pull-left no-border" id="mapcontrols-widget">
															<div id="mapcontrols" class="olControlEditingToolbar"></div>
														</div>
														<div class="widget-toolbar pull-left no-border">
															<span class="onoffswitch-title" rel="tooltip" data-placement="bottom" title="Krahasimi Ortofotove"><i class="fa fa-info "></i></span>
														</div>
														<div class="widget-toolbar pull-left no-border" id="panel1-widget" style="margin-left: -17px;">
															<div id="panel1"></div>
														</div>
														<a  id="printPopup"  class="widget-toolbar  pull-left no-border">
															<i class="fa fa-print"></i>
														</a>
												
														<div class="widget-toolbar">
															<!-- add: non-hidden - to disable auto hide -->
															 <select id="projection">
																  <option value="EPSG:900916">KosovaRef: 900916</option>
															      <option value="EPSG:4326">WGS: 4326</option>
															      <option value="EPSG:900913">GoogleMap: 900913</option>
														    </select>
													 	</div>	
														
													<div>
														<jsp:include page="protection_map.jsp"></jsp:include>
													</div>
												</div>
									</div>
								<!-- end map tab -->
							</div>
						
						</div>
	
					
				</div>
 
				<!-- end widget div -->
				
      </div>
      


<script type="text/javascript">
function setAreaGeom(area,rId,imGeom){
	$("#protection_declare").jqGrid('setCell',rId,'im_value', area);
	$("#protection_declare").jqGrid('setCell',rId,'im_geom', imGeom);
}
function addRow(){
	var im_value='';
	if(rowId!=0){
		$("#protection_declare").jqGrid('saveRow', rowId);
		im_value=jQuery('#protection_declare').jqGrid ('getCell', rowId, 'im_value');
	}
	if(rowId==0 || im_value!=''){
		$("#protection_declare").jqGrid('saveRow', rowId);
		   rowId++;
		   var parameters =
        {
            rowID: rowId,
            initdata: {
            },
            position: "last",
            useDefValues: true,
            useFormatter: false,
            addRowParams: { extraparam: {} }
        };
		    $("#protection_declare").jqGrid('addRow', parameters);
		    $("#protection_declare").jqGrid('setGridParam', {editable: true}); 
	}
}
$(document).ready(function() {
	init();
	$("#printPopup").on("click",function(){
		var link = "PrintMap.print_a.do";
		openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,150);
	});
	var stat='<s:property value="protection.activityStatus.status.getDOMVALUE()"/>';
	if(stat=='APPROVED'){
		$("#implementationdiv").show();
		}
		else{
			$("#implementationdiv").hide(); 
		}
	$('input.number').autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		var opl_val='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
		if($("#hideToolbar").val()=='true' || opl_val==='C'){
			$("#activity\\.activityDomain\\.name").attr('readonly',true);
			$("#protection\\.unitsMetric\\.name").attr('readonly',true);
			$("#protection\\.managementUnit\\.muName").attr('readonly',true);
			$("#protection\\.plValue").attr('readonly',true);
			$("#protection\\.imValue").attr('readonly',true);
			}else if($("#protection\\.workStage").val()=='P' || $("#protection\\.workStage").val()==''){
			$("#protection\\.imValue").attr('readonly',true);
		}else if($("#protection\\.workStage").val()=='I'){
			$("#activity\\.activityDomain\\.name").attr('readonly',true);
			$("#protection\\.unitsMetric\\.name").attr('readonly',true);
			$("#protection\\.managementUnit\\.muName").attr('readonly',true);
			$("#protection\\.plValue").attr('readonly',true);
			$("#protection\\.imValue").attr('readonly',false);
		}

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
	        	dom_code: "PROTE",
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
        formatResult: formatResult,
        formatSelection: function(item) {
        	$("#activity\\.activityDomain\\.id").val(item.id);
            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    }); 

    $("#protection\\.unitsMetric\\.name").select2({
        placeholder: "",
        minimumInputLength: 0,
        ajax: {
	        url: "Input.unitsMetric.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
	        if(term == "") term = " ";   
	        return {
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
        formatResult: formatResult,
        formatSelection: function(item) {
        	$("#protection\\.unitsMetric\\.id").val(item.id);
        	$("#protection\\.unitsMetric\\.name").val(item.name);
			$("#unitLabelPl").html(item.name);	
			$("#unitLabelImpl").html(item.name);	
	        return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    });    
    

    $("#protection\\.managementUnit\\.muName").select2({
        placeholder: "",
        minimumInputLength: 0,
        ajax: {
	        url: "Input.managementUnit.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
	        if(term == "") term = " ";   
	        return {
	        	orgtype: "D",
	        	name_startsWith: term,
	        	mun_id:$("#munId").val(),
	        };
	        },
	        results: function (data, page) { 
	        return { results: data };
	        },
	        cache: true
        },
        initSelection: function(element, callback) {
        },
        formatResult: formatResult,
        formatSelection: function(item) {
        	$("#protection\\.managementUnit\\.id").val(item.id);
        	if(item.mng_period_id)
        	$("#muperiodId").val(item.mng_period_id);
        	loadMUPeriodFeature($("#muperiodId").val());
        	$("#protection\\.managementUnit\\.name").val(item.name);
            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    });    
    $("#protection\\.managementUnit\\.muName").select2("data", {id: "<s:property value='protection.managementUnit.id'/>", name: "<s:property value="protection.managementUnit.muName"/>"});
    loadMUPeriodFeature($("#muperiodId").val());
	if($("#language").val()=='en'){
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameEn"/>"});
		$("#protection\\.unitsMetric\\.name").select2("data", {id: "<s:property value='protection.unitsMetric.id'/>", name: "<s:property value="protection.unitsMetric.nameEn"/>"});
		
		}else if($("#language").val()=='al'){
		 $("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameAl"/>"});
		 $("#protection\\.unitsMetric\\.name").select2("data", {id: "<s:property value='protection.unitsMetric.id'/>", name: "<s:property value="protection.unitsMetric.name"/>"});
	}else if($("#language").val()=='sr'){
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameSr"/>"});
		$("#protection\\.unitsMetric\\.name").select2("data", {id: "<s:property value='protection.unitsMetric.id'/>", name: "<s:property value="protection.unitsMetric.nameSr"/>"});
	}
	
	$("#protection_content").on("remove",function(){
		$("#pr_edit_button").removeClass("ui-state-disabled");
		$("#pr_activity_button").removeClass("ui-state-disabled");
	});
	$("#cancelPR").on('click', function(){
		$("#protection_content").dialog("close");
		return false;
		});
    $("#savePR").on('click', function() {
    	if(opl_val=='M'){
			$.SmartMessageBox({
				title : "<s:text name="annual.plan.impl.confirm.registration.title"/>",
				content : "<s:text name="annual.plan.impl.confirm.registration.content"/>",
				buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
				icon : "fa fa-bell"
			}, function(ButtonPressed) {
					if (ButtonPressed == "<s:text name="rbac.permission.button.yes"/>") {
						var this_form =$("#protection_form");
						var ids = $("#protection_declare").jqGrid('getDataIDs');
						for (var i = 0; i < ids.length+1; i++) {
							$("#protection_declare").jqGrid('saveRow', ids[i]);
						}
						var slvArray = $("#protection_declare").jqGrid('getRowData');

						var jsonText = JSON.stringify(slvArray);
						$('<input>').attr({
							type : 'hidden',
							name : "jsonDetails",
							value : jsonText
						}).appendTo(this_form);
						
						$(':button').prop('disabled','disabled');
						$('#protection_form').submit();
					}//EOF IF ButtonPressed
				});	
			}else{
				$(':button').prop('disabled','disabled'); 
				$('#protection_form').submit();
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
				$("#protection_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
				$("#protection_content").html(jqXHR.responseText);
				
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
					jQuery("#protection_grid").trigger("reloadGrid");
					if(opl_val!='M'){
						$("#protection_content").dialog("close");
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
	
	var imValue='<s:property value='protection.imValue'/>';
	
	if(imValue - $("#protection\\.plValue").val() >0){
		$('#protection\\.imValue').css('background-color', '#F47777');
		}

	
});

</script>								
