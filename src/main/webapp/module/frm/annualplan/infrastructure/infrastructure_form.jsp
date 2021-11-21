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

<jsp:include page="../../../base/validation.jsp"></jsp:include>
<div id="infrastructure_form_content">
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
	<form id="roadactivity_form" class="smart-form" action="InfrastructureSave.do" accept-charset="utf8" method="post">
	
	<input id="roadActivity.id" name="roadActivity.id" value="<s:property value='roadActivity.id'/>" type="hidden">
	<input id="activity.id" name="activity.id" value="<s:property value='activity.id'/>" type="hidden">
	<input id="road.id" name="road.id" value="<s:property value='road.id'/>" type="hidden">
	<input id="plLine" name="plLine"  value="<s:property value='activity.planedGeom'/>" type="hidden">
	<input id="activitypointstart" name="activitypointstart" value="<s:property value='activitypointstart'/>" type="hidden">
	<input id="activitypointend" name="activitypointend" value="<s:property value='activitypointend'/>" type="hidden">
	<input id="toDeleteComparePoint" name="toDeleteComparePoint" value="<s:property value='toDeleteComparePoint'/>" type="hidden">
	
	<input id="road.roadLength" name="road.roadLength" value="<s:property value='road.roadLength'/>" type="hidden">
	
	<input id="language" name="language" value="<s:property value='locale.language'/>" type="hidden">
	<input id="roadActivity.road.id" name="roadActivity.road.id" value="<s:property value='roadActivity.road.id'/>" type="hidden">
	<input id="roadActivity.workStage" name="roadActivity.workStage" value="<s:property value='roadActivity.workStage'/>" type="hidden">
	
	<input id="roadActivity.activityStatus.status" name="roadActivity.activityStatus.status" value="<s:property value='roadActivity.activityStatus.status.getDOMVALUE()'/>" type="hidden" >
	<input id="roadActivity.activityStatus.id" name="roadActivity.activityStatus.id" value="<s:property value='roadActivity.activityStatus.id'/>" type="hidden" >
	<input id="decisionStatus" name="decisionStatus" value="<s:property value='decisionStatus'/>" type="hidden">
	<input id="edit" value="<s:property value='edit'/>" type="hidden">
	<input id="activityStatus.id" name="activityStatus.id" type="hidden">
	<input id="activityStatus.status" name="activityStatus.status" value="<s:property value='activityStatus.status.getDOMVALUE()'/>" type="hidden">
	
	<input id="roadActivity.plCreatedDate" name="roadActivity.plCreatedDate" value="<s:property value='roadActivity.plCreatedDate'/>" type="hidden">
	<input id="roadActivity.personByPlCreatedBy.id" name="roadActivity.personByPlCreatedBy.id" value="<s:property value='roadActivity.personByPlCreatedBy.id'/>" type="hidden">
	
	<input id="roadActivity.imCreatedDate" name="roadActivity.imCreatedDate" value="<s:property value='roadActivity.imCreatedDate'/>" type="hidden">
	<input id="roadActivity.personByImCreatedBy.id" name="roadActivity.personByImCreatedBy.id" value="<s:property value='roadActivity.personByImCreatedBy.id'/>" type="hidden">		
	
			<fieldset class="no-padding">
			<legend><s:text name="annu.seedling.label.activity"/></legend>
			<!-- START row -->
			<div class="row">
				
				<!-- START roadActivity.annualPlan -->
					<section class="col col-6">
					<label class="input"><s:text name='tender.request.annual.plan'/>:
						<s:if test="fieldErrors.get('annualPlanId')!=null">
							<div class="form-group has-error">
								<input id="annualPlanName" name="annualPlanName" value="<s:property value='annualPlan.cadastralMunicipality.name'/> - <s:property value='annualPlan.year'/>" class="form-control" placeholder="<s:text name='tender.request.annual.plan'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.forestTyp')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<s:if test="annualPlan != null">
								<input id="annualPlanName" name="annualPlanName" readonly="readonly" value="<s:property value='annualPlan.cadastralMunicipality.name'/> - <s:property value='annualPlan.year'/>" class="form-control" placeholder="<s:text name='tender.request.annual.plan'/>" type="text">
								</s:if>
								<s:else>
								<input id="annualPlanName" name="annualPlanName" class="form-control" placeholder="Please type muncicipality name" type="text">
								</s:else>
								<input id="annualPlanId" name="annualPlanId" value="<s:property value='annualPlan.id'/>" type="hidden">
							</div>
						</s:else>
					</label>
					</section>
				<!-- END roadActivity.annualPlan -->
				
				<!-- START roadActivity.activity.activityDomain.id -->
					<section class="col col-6">
					<label class="input">*<s:text name='organization.placeholder.enter.activity'/>:
						<s:if test="fieldErrors.get('activity.activityDomain.id')!=null">
							<div class="form-group has-error">
								<input id="activity.activityDomain.name" name="activity.activityDomain.name" class="form-control" placeholder="<s:text name='organization.placeholder.enter.activity'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activity.activityDomain.id')"/> </span>
								<input id="activity.activityDomain.id" name="activity.activityDomain.id" value="<s:property value='activity.activityDomain.id'/>" class="form-control"type="hidden">
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input id="activity.activityDomain.name" name="activity.activityDomain.name" value="<s:property value='activity.activityDomain.name'/>" class="form-control" placeholder="<s:text name='organization.placeholder.enter.activity'/>" type="text">
								<input id="activity.activityDomain.id" name="activity.activityDomain.id" value="<s:property value='activity.activityDomain.id'/>" class="form-control"type="hidden">
							</div>
						</s:else>
					</label>
					</section>
				<!-- END roadActivity.activity.activityDomain.id -->
			</div>
			</fieldset>
			<fieldset class="no-padding">
			<legend><s:text name="frm.infrastructure.planning.planned"/></legend>
			<div id="row">
				<!-- START roadActivity.plStartM -->
					<section class="col col-6">
					<label class="input">*<s:text name='frm.infrastructure.planning.start.from'/>:
						<s:if test="fieldErrors.get('roadActivity.plStartM')!=null">
							<div class="form-group has-error">
								<input id="roadActivity.plStartM" onchange="calcPlLength()" name="roadActivity.plStartM" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.start.from'/>" type="text" data="number">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('roadActivity.plStartM')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input id="roadActivity.plStartM" onchange="calcPlLength()" name="roadActivity.plStartM" value="<s:property value='roadActivity.plStartM'/>" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.start.from'/>" type="text" data="number">
							</div>
						</s:else>
					</label>
					</section>
				<!-- END roadActivity.plStartM -->
				
				<!-- START roadActivity.plEndM -->
					<section class="col col-6">
					<label class="input">*<s:text name='frm.infrastructure.planning.end.in'/>:
						<s:if test="fieldErrors.get('roadActivity.plEndM')!=null">
							<div class="form-group has-error">
								<input id="roadActivity.plEndM" onchange="calcPlLength()" name="roadActivity.plEndM" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.end.in'/>" type="text" data="number">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('roadActivity.plEndM')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input id="roadActivity.plEndM" onchange="calcPlLength()" name="roadActivity.plEndM" value="<s:property value='roadActivity.plEndM'/>" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.end.in'/>" type="text" data="number">
							</div>
						</s:else>
					</label>
					</section>
				<!-- END roadActivity.plEndM -->
				</div>
				<div id="row">
				<!-- START roadActivity.plWidth -->
					<section class="col col-6">
					<label class="input">*<s:text name='frm.infrastructure.planning.width'/>:
						<s:if test="fieldErrors.get('roadActivity.plWidth')!=null">
							<div class="form-group has-error">
								<input id="roadActivity.plWidth" name="roadActivity.plWidth" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.length'/>" type="text" data="number">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('roadActivity.plWidth')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input id="roadActivity.plWidth" name="roadActivity.plWidth" value="<s:property value='roadActivity.plWidth'/>" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.length'/>" type="text" data="number">
							</div>
						</s:else>
					</label>
					</section>
				<!-- END roadActivity.plWidth -->
				
				<!-- START roadActivity.plLenght -->
					<section class="col col-6">
					<label class="input">*<s:text name='frm.infrastructure.planning.length'/>:
						<s:if test="fieldErrors.get('roadActivity.plLenght')!=null">
							<div class="form-group has-error">
								<input readonly id="roadActivity.plLenght" name="roadActivity.plLenght" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.length'/>" type="text" data="number">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('roadActivity.plLenght')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input readonly id="roadActivity.plLenght" name="roadActivity.plLenght" value="<s:property value='roadActivity.plLenght'/>" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.length'/>" type="text" data="number">
							</div>
						</s:else>
					</label>
					</section>
				<!-- END roadActivity.plLenght -->
				
			</div>
			</fieldset>
			
			<fieldset class="no-padding">
			<legend><s:text name="frm.infrastructure.planning.implementation"/></legend>
			<div class="row">
				<!-- START roadActivity.imStartM -->
					<section class="col col-6">
					<label class="input"><s:text name='frm.infrastructure.planning.start.from'/>:
							<div class="form-group">
								<input id="roadActivity.imStartM" onchange="calcImLength()" name="roadActivity.imStartM" value="<s:property value='roadActivity.imStartM'/>" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.start.from'/>" type="text" data="number">
							</div>
					</label>
					</section>
				<!-- END roadActivity.imStartM -->
				
				<!-- START roadActivity.imEndM -->
					<section class="col col-6">
					<label class="input"><s:text name='frm.infrastructure.planning.end.in'/>:
							<div class="form-group">
								<input id="roadActivity.imEndM" onchange="calcImLength()" name="roadActivity.imEndM" value="<s:property value='roadActivity.imEndM'/>" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.end.in'/>" type="text" data="number">
							</div>
					</label>
					</section>
				<!-- END roadActivity.imEndM -->
					</div>
				<div id="row">
				<!-- START roadActivity.imWidth -->
					<section class="col col-6">
					<label class="input"><s:text name='frm.infrastructure.planning.width'/>:
							<div class="form-group">
								<input id="roadActivity.imWidth" name="roadActivity.imWidth" value="<s:property value='roadActivity.imWidth'/>" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.length'/>" type="text" data="number">
							</div>
					</label>
					</section>
				<!-- END roadActivity.imWidth -->
				
				<!-- START roadActivity.imLenght -->
					<section class="col col-6">
					<label class="input"><s:text name='frm.infrastructure.planning.length'/>:
							<div class="form-group">
								<input readonly id="roadActivity.imLenght" name="roadActivity.imLenght" value="<s:property value='roadActivity.imLenght'/>" class="form-control" placeholder="<s:text name='frm.infrastructure.planning.length'/>" type="text" >
							</div>
					</label>
					</section>
				<!-- END roadActivity.imLenght -->
			</div>
			</fieldset>
			<fieldset class="no-padding">
			<legend>  <s:text name='frm.harvest.impl.declare'/></legend>		
					<div class="row">
						<section class="col col-10">
							<div class="form-group">
								<div id="infra_declare_grid_content">
									<jsp:include page="infrastructure_declare_grid.jsp"></jsp:include>
								</div>
							</div>
						</section>
					</div>
			</fieldset>
			<fieldset class="no-padding">
			<legend><s:text name="tender.request.attachment"/></legend>
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
					<button id="saveInf" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				</s:if>
<%-- 			</s:if> --%>
					<button id="cancelInf" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
						</button>
			</footer>
			
	</form>
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
														<jsp:include page="infrastructure_map.jsp"></jsp:include>
													</div>
												</div>
									</div>
								<!-- end map tab -->
							</div>
						
						</div>
				</div>
		</div>
</div>	
<script type="text/javascript">
function calcPlLength(){
	if($("#roadActivity\\.plStartM").val() && $("#roadActivity\\.plEndM").val()){
		var end=parseFloat(($("#roadActivity\\.plEndM").val()).replace(/,/g, ''));//parseFloat('100,000.00'.replace(/,/g, ''))
		var start=parseFloat(($("#roadActivity\\.plStartM").val()).replace(/,/g, ''));
		$("#roadActivity\\.plLenght").val(end-start);
	}
}
function calcImLength(){
	if($("#roadActivity\\.imStartM").val() && $("#roadActivity\\.imEndM").val()){
		var end=parseFloat(($("#roadActivity\\.imEndM").val()).replace(/,/g, ''));
		var start=parseFloat(($("#roadActivity\\.imStartM").val()).replace(/,/g, ''));
		$("#roadActivity\\.imLenght").val(end-start);
	}
}
$(document).ready(function() {
	init();
	$("#printPopup").on("click",function(){
		var link = "PrintMap.print_a.do";
		openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,150);
	});
	loadRoadFeature($("#road\\.id").val());
	loadInfrastructureFeature($("#roadActivity\\.id").val());
	$("#roadActivity\\.plLenght").attr('readonly',true);
	$("#roadActivity\\.plStartM").attr('readonly',true);
	$("#roadActivity\\.plEndM").attr('readonly',true);
	$("#rej").on('click',function(){
		$("#activityStatus\\.status").val($("#rej").val());
	});
	$("#rep").on('click',function(){
		$("#activityStatus\\.status").val($("#rep").val());
	});
	$("#apr").on('click',function(){
		$("#activityStatus\\.status").val($("#apr").val());
	});
	$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	
	if($("#decisionStatus").val()=='true' || $("#edit").val()=='true'){
		$("#activity\\.activityDomain\\.name").attr('readonly',true);
		$("#roadActivity\\.plLenght").attr('readonly',true);
		$("#roadActivity\\.plStartM").attr('readonly',true);
		$("#roadActivity\\.plWidth").attr('readonly',true);
		$("#roadActivity\\.plEndM").attr('readonly',true);
		$("#file").attr('disabled','disabled');
	}else if($("#roadActivity\\.workStage").val()=='I'){
		$("#activity\\.activityDomain\\.name").attr('readonly',true);
		$("#roadActivity\\.plLenght").attr('readonly',true);
		$("#roadActivity\\.plStartM").attr('readonly',true);
		$("#roadActivity\\.plWidth").attr('readonly',true);
		$("#roadActivity\\.plEndM").attr('readonly',true);
	}
	$("#roadActivity\\.imLenght").attr('readonly',true);
	$("#roadActivity\\.imStartM").attr('readonly',true);
	$("#roadActivity\\.imWidth").attr('readonly',true);
	$("#roadActivity\\.imEndM").attr('readonly',true);
/*
	$("#activity\\.activityDomain\\.name").autocomplete({
        source: function(request, response) {
            $.ajax({
            	type:"get",
                url: "Input.activityDomain.do?dom_code=INFRS",
                dataType: "json",
                data: {
					featureClass: "P",
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
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
            $("#activity\\.activityDomain\\.id").val( ui.item.id);
        }  
    });
*/

	$("#activity\\.activityDomain\\.name").select2({
	    placeholder: "Enter activity",
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
		        	dom_code:"INFRS"
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
	}else if($("#language").val()=='al'){
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameAl"/>"});
	}else if($("#language").val()=='sr'){
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameSr"/>"});
	}

	/* when cancel button is pressed, when X(close) button is pressed or when ESC button is pressed then enable disabled buttons*/
	$("#infrastructure_content").on("remove",function(){
		$("#in_edit_button").removeClass('ui-state-disabled');
		$("#in_activity_button").removeClass('ui-state-disabled');
	});
	
	$("#cancelInf").on('click', function(){
		$("#infrastructure_content").dialog("close");
		return false;
	});
	var opl_val='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
	    $("#saveInf").on('click', function() {
		 if(opl_val=='M'){
			$.SmartMessageBox({
				title : "<s:text name="annual.plan.impl.confirm.registration.title"/>",
				content : "<s:text name="annual.plan.impl.confirm.registration.content"/>",
				buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
				icon : "fa fa-bell"
			}, function(ButtonPressed) {
					if (ButtonPressed == "<s:text name="rbac.permission.button.yes"/>") {
						var this_form =$("#roadactivity_form");
						
						var ids = $("#infrastructure_declare").jqGrid('getDataIDs');
						for (var i = 0; i < ids.length+1; i++) {
							$("#infrastructure_declare").jqGrid('saveRow', ids[i]);
						}
						var roadArray = $("#infrastructure_declare").jqGrid('getRowData');
	
						var jsonText = JSON.stringify(roadArray);
						$('<input>').attr({
							type : 'hidden',
							name : "jsonDetails",
							value : jsonText
						}).appendTo(this_form);
						
						$(':button').prop('disabled','disabled');
						$('#roadactivity_form').submit();
					}//EOF IF ButtonPressed
				});	
			}else{
			    	$(':button').prop('disabled','disabled');
					$('#roadactivity_form').submit();
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
				$("#infrastructure_form_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
				$("#infrastructure_form_content").html(jqXHR.responseText);
				
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
					jQuery("#infrastructure_grid").trigger("reloadGrid");
					if(opl_val!='M'){
						$("#infrastructure_content").dialog("close");
					}
					$("#edit_button").removeClass('ui-state-disabled');
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
