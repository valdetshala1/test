<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<jsp:include page="../../../base/validation.jsp"></jsp:include>

<div class="widget-body" id="stand_page_content">
	<form id="silviculture_form" class="smart-form"	action="SilvicultureSave.do" accept-charset="utf8" method="post">
			<input id="standId" name="standId"
				value="<s:property value='stand.id'/>" type="hidden"> <input
				id="silviculture.stand.id" name="silviculture.stand.id"
				value="<s:property value='stand.id'/>" type="hidden"> <input
				id="silviculture.id" name="silviculture.id"
				value="<s:property value='silviculture.id'/>" type="hidden">
			<input id="domainId" name="domainId"
				value="<s:property value='silviculture.activity.frmDoman.id'/>"
				type="hidden">
			<input id="stand.id" name="stand.id"
				value="<s:property value='stand.id'/>"
				type="hidden">
			<input id="activity.id" name="activity.id"
				value="<s:property value='activity.id'/>"
				type="hidden">
			<input id="activityStatus.id" name="activityStatus.id"
				value="<s:property value='activityStatus.id'/>"
				type="hidden">
			<input id="activity.activityNo" name="activity.activityNo" value="<s:property value='activity.activityNo'/>" type="hidden">
			<input id="slvSubmitted" name="slvSubmitted"
				value="<s:property value='slvSubmitted.getDOMVALUE()'/>"
				type="hidden">
				
			<input id="silviculture.activityStatus.status" name="silviculture.activityStatus.status"
				value="<s:property value='silviculture.activityStatus.status.getDOMVALUE()'/>"
				type="hidden">
				
			<input id="munView" name="munView"
				value="<s:property value='munView'/>"
				type="hidden">
			<input id="regionalView" name="regionalView"
				value="<s:property value='regionalView'/>"
				type="hidden">
			<input id="kfaView" name="kfaView"
				value="<s:property value='kfaView'/>"
				type="hidden">
			<input id="hideToolbar" name="hideToolbar"
				value="<s:property value='hideToolbar'/>"
				type="hidden">
			<input id="hideToolbar" name="hideToolbar"
				value="<s:property value='hideToolbar'/>"
				type="hidden">
			<input id="plSlvGeom" name="plSlvGeom"
				value="<s:property value='activity.planedGeom'/>"
				type="hidden">
				
			<input id="silviculture.plCreatedDate" name="silviculture.plCreatedDate" value="<s:property value='silviculture.plCreatedDate'/>" type="hidden">
			<input id="silviculture.personByPlCreatedBy.id" name="silviculture.personByPlCreatedBy.id" value="<s:property value='silviculture.personByPlCreatedBy.id'/>" type="hidden">
			
			<input id="silviculture.imCreatedDate" name="silviculture.imCreatedDate" value="<s:property value='silviculture.imCreatedDate'/>" type="hidden">
			<input id="silviculture.personByImCreatedBy.id" name="silviculture.personByImCreatedBy.id" value="<s:property value='silviculture.personByImCreatedBy.id'/>" type="hidden">		
			
			<input id="docNameAlf" name="docNameAlf" value="<s:property value='docNameAlf'/>" type="hidden">
			<input id="docTypeAlf" name="docTypeAlf" value="<s:property value='docTypeAlf'/>" type="hidden">
					
			<input id="silviculture.workStage" name="silviculture.workStage" value="<s:property value='silviculture.workStage'/>" type="hidden">
			<fieldset class="no-padding">
				<legend>
					<s:text name="frm.private.request.activity" />
				</legend>
				<!-- START row -->
			<div class="row">
			<!-- START planting.annualPlan -->
			<div class="col-md-4">
			   <div class="col-sm-3 profile-pic">
				<img src="data:image/jpeg;base64,<s:property value='barCodeImg'/>" class="barcode-gl"  />
			   </div>
			</div>
			<div class="col-md-8 padding-left-0">
			<div class="row">
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
							<input id="annualplanName" name="annualplanName" readonly="readonly" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name="planting.stand.annu.plan"/>" type="text">
							</s:if>
							<s:else>
							<input id="annualplanName" name="annualplanName" class="form-control input-xs-g" placeholder="Please type muncicipality name" type="text">
							</s:else>
							<input id="annualplanId" name="annualplanId" value="<s:property value='annualplan.id'/>" type="hidden">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END planting.annualPlan -->
			<div class="row">
			</div>	
			<!-- START silviculture.treeSpeciesGroup -->
				<section class="col col-10" id="treespecies">
					<label class="input"><s:text name="frm.silviculture.tree.species.group"/>:
						<s:if test="fieldErrors.get('silviculture.treeSpeciesGroup')!=null">
							<div  class="has-error">
							<select  class="form-control input-xs-g" id="silviculture.treeSpeciesGroup"
								name="silviculture.treeSpeciesGroup">
								<s:iterator value="treespeciesgroupList" var="la">
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
							</select><span
								class="help-block"><i class="fa fa-warning"></i> <s:property
								value="fieldErrors.get('silviculture.treeSpeciesGroup')" /> </span>
						</div>
						</s:if>
						<s:else>
							<select class="form-control input-xs-g" id="silviculture.treeSpeciesGroup"
								name="silviculture.treeSpeciesGroup">
								<s:iterator value="treespeciesgroupList" var="la">
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
						</s:else>
						
						
					</label>
				</section>
			<!-- END silviculture.treeSpeciesGroup -->
				</div>
			</div>
		</div>
		<div class="row">
			 <!-- START silviculture.activity.frmDoman.id -->
				<section class="col col-12">
					<label class="input">*<s:text name='frm.silviculture.activity' />:
						<s:if test="fieldErrors.get('activity.frmDomain.id')!=null">
						<div class="form-group has-error">
							<div class="input-group input-group-sm">
							<div class="icon-addon addon-sm">
								<input id="activity.activityDomain.name"
									name="activity.activityDomain.name" class="form-control input-xs-g"
									value="<s:property value='silviculture.activity.activityDomain.nameAl'/>"
									placeholder="<s:text name='frm.silviculture.activity' />" type="text" readonly>  <input
									id="activity.activityDomain.id"
									name="activity.activityDomain.id"
									value="<s:property value='silviculture.activity.activityDomain.id'/>"
									type="hidden">
							</div>
							<span class="input-group-btn">
								<button id="chooseActivity" class="btn btn-primary"
									type="button"><s:text name="frm.silviculture.choose"/>
								</button>
							</span>
							</div>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('activity.frmDomain.id')" /> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
						<div class="input-group input-group-sm">
							<div class="icon-addon addon-sm">
								<input id="activity.activityDomain.name"
									name="activity.activityDomain.name" class="form-control input-xs-g"
									value="<s:property value='silviculture.activity.activityDomain.nameAl'/>"
									placeholder="<s:text name='frm.silviculture.activity' />" type="text" readonly> <input
									id="activity.activityDomain.id"
									name="activity.activityDomain.id"
									value="<s:property value='silviculture.activity.activityDomain.id'/>"
									type="hidden">
							</div>
							<span class="input-group-btn">
								<button id="chooseActivity" class="btn btn-primary" type="button"><s:text name="frm.silviculture.choose"/>
								</button>
							</span>
						</div>
						</div>
					</s:else>
					</label>
				</section>
			<!-- END silviculture.activity.frmDoman.id-->
			</div>
				</fieldset>

			<fieldset class="no-padding">
				<legend>
					<s:text name="frm.silviculture.planning" />
				</legend>
			<div class="row">
			<!-- START stand.stockLevel -->
				<section class="col col-6">
					<label class="input">*<s:text name='frm.silviculture.plan.area' />:
						<s:if test="fieldErrors.get('silviculture.plArea')!=null">
						<div class="form-group has-error">
							<input readonly type="text" data="number" id="silviculture.plArea"
								name="silviculture.plArea" class="form-control input-xs-g"
								value="<s:property value='silviculture.plArea'/>"
								placeholder="<s:text name='frm.silviculture.plan.area' />"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
								value="fieldErrors.get('silviculture.plArea')" /> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input readonly type="text" data="number" id="silviculture.plArea"
								name="silviculture.plArea" class="form-control input-xs-g"
								value="<s:property value='silviculture.plArea'/>"
								placeholder="<s:text name='frm.silviculture.plan.area' />">
						</div>
					</s:else>
					</label>
				</section>
			<!-- END stand.stockLevel -->
			</div>
			
			</fieldset>
			
			<div id="implementationdiv">
			<fieldset class="no-padding">
				<legend><s:text name="frm.silviculture.legend.implemention"/></legend>
			<div class="row">
				<!-- START row -->
			 <!-- START silviculture.imArea -->
				<section class="col col-6">
					<label class="input"><s:text name='frm.silviculture.impl.area' />:
						<div class="form-group">
							<input type="text" data="number" id="silviculture.imArea"
									name="silviculture.imArea" class="form-control input-xs-g"
									value="<s:property value='silviculture.imArea'/>"
									placeholder="<s:text name='frm.silviculture.impl.area' />">
						</div>
					</label>
				</section>
			<!-- END silviculture.imArea -->
			</div>
				<!-- END row -->
				</fieldset>
			<fieldset class="no-padding">
			<legend>  <s:text name='frm.harvest.impl.declare'/></legend>		
					<div class="row">
						<section class="col col-10">
							<div class="form-group">
								<div id="slv_declare_grid_content">
									<jsp:include page="slv_declare_grid.jsp"></jsp:include>
								</div>
							</div>
						</section>
					</div>
			</fieldset>
			</div>
			
			<fieldset>
			<legend><s:text name="tender.request.attachment"/></legend>
			<div class="row"> 
				<!-- START attachment -->
 				<section class="col col-10">
					<label class="input"><s:text name="tender.request.attachment"/>:
						<s:if test="fieldErrors.get('attachment')!=null">
						<div class="form-group has-error">
							<input id="file" name="file" type="file" class="file-loading" class="btn btn-default btn-file" onchange="getFilesDataAlf(this);">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('attachment')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFilesDataAlf(this);">
						</div>
					</s:else>
					</label>
				</section>	
				
				<!-- END attachment -->
			 </div> 
			<div class="row">
				<section class="col col-10">
					<label class="input"><s:text name="hum.employee.label.comment"/>:
						<s:if test="fieldErrors.get('activityStatus.remarks')!=null">
						<div class="form-group has-error">
							<textarea id="activityStatus.remarks" name="activityStatus.remarks" class="form-control input-xs-g" placeholder="<s:text name="hum.employee.label.comment"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityStatus.remarks')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<textarea id="activityStatus.remarks" name="activityStatus.remarks" class="form-control input-xs-g" placeholder="<s:text name="hum.employee.label.comment"/>"><s:property value='activityStatus.remarks'/></textarea>
						</div>
					</s:else>
					</label>
	
				</section>	
			</div>
			</fieldset>
			<s:if test="kfaView"> 
					<fieldset id="status_fieldset">
						  <legend><s:text name='annual.plan.status' /></legend>
					<section>
						<s:if test="fieldErrors.get('silviculture.decisionStatus')!=null">
						<div class="form-group has-error">
							<div id="row">
						    <div class="inline-group">
						     <label class="radio">
						      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='slvRejected.getDOMVALUE()'/>">
						      <i></i><s:text name='frm.statuses.reject' /></label>
						     <label class="radio">
						      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='slvReplanned.getDOMVALUE()'/>">
						      <i></i><s:text name='frm.statuses.replan' /></label>
						     <label class="radio">
						      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='slvApproved.getDOMVALUE()'/>">
						      <i></i><s:text name='frm.statuses.approve' /></label>
						    </div> 
						    </div>
						    <div id="row" class="col-md-10">
						    	<span class="help-block"><i class="fa fa-warning"></i> <s:property
								value="fieldErrors.get('silviculture.decisionStatus')" /> </span>
						    </div>
						   </div>
					    </s:if>
					    <s:else>
					    <div class="inline-group">
						     <label class="radio">
						      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='slvRejected.getDOMVALUE()'/>">
						      <i></i><s:text name='frm.statuses.reject' /></label>
						     <label class="radio">
						      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='slvReplanned.getDOMVALUE()'/>">
						      <i></i><s:text name='frm.statuses.replan' /></label>
						     <label class="radio">
						      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='slvApproved.getDOMVALUE()'/>">
						      <i></i><s:text name='frm.statuses.approve' /></label>
						    </div>
					    
					    </s:else>
				   </section>

		  		</fieldset>
	  		</s:if>

	  		
		
			<footer class="form-actions">
			 <s:if test="!hideToolbar"> 	
				<button id="save" class="btn btn-primary" type="submit">
					<i class="fa fa-save"></i>
					<s:text name="label.button.save"></s:text>
				</button>
			 </s:if>	
				<button id="cancel" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
			</footer>
	
			
		</form>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
					var stat='<s:property value="silviculture.activityStatus.status.getDOMVALUE()"/>';
					if(stat=='APPROVED'){
						$("#implementationdiv").show();
						}
						else{
							$("#implementationdiv").hide(); 
						}
						$("input[data='number']").autoNumeric('init', {
							aDec : '.', 
							aSep : ',',
							mDec : '2'
						});
						
						var treespecies='';//$("#silviculture\\.treeSpeciesGroup").val();
						var isDisabled = $("#silviculture\\.treeSpeciesGroup").is(':disabled');
					    if (isDisabled) {
					    	treespecies=$("#silviculture\\.treeSpeciesGroup").val();
					    } else {
					        // Handle input is not disabled
					    }
						var opl_val='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
						if($("#hideToolbar").val()=='true' || opl_val==='C'){
							$("#activity\\.activityDomain\\.name").attr('readonly',true);
							$('#silviculture\\.treeSpeciesGroup').attr('disabled', 'disabled');
							$("#chooseActivity").attr('disabled',true);
							$("#silviculture\\.plArea").attr('readonly',true);
						}else if($("#silviculture\\.workStage").val()=='I'){
							$("#activity\\.activityDomain\\.name").attr('readonly',true);
							$('#silviculture\\.treeSpeciesGroup').attr('disabled', 'disabled');
							$("#chooseActivity").attr('disabled',true);
							$("#silviculture\\.plArea").attr('readonly',true);
						}

						$("#silviculture\\.imArea").attr('readonly',true);
						$('#silviculture\\.treeSpeciesGroup').val('<s:property value="silviculture.treeSpeciesGroup.DOMVALUE"/>');
						
						$("#chooseActivity").on('click',function() {
							var link = "Silviculture.slv_activity_popup.do";
							openDialogForm('silvi_activity_popup_content',link, "<s:text name="frm.silviculture.choose.activity"/>",800, 650);
							return false;
						});

						$("#cancel").on('click', function() {
							$("#stand_page_content").dialog("close");
							return false;
						});
						
			        	var actSlvStat="<s:property value='silviculture.activityStatus.status.getDOMKEY()'/>";
			        	
						$("#save").on('click', function() {
							$('#silviculture\\.treeSpeciesGroup').attr('disabled',null);

							if(treespecies!=null && treespecies!=''){
								$("#silviculture\\.treeSpeciesGroup").val(treespecies);
							}
							if($("#kfaView").val()=='true'){
								$.SmartMessageBox({
									title : "<s:text name="annual.plan.activity.status.change.title"/>",
									content : "<s:text name="annual.plan.activity.status.change.content"/>",
									buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
									icon : "fa fa-bell"
								}, function(ButtonPressed) {
									if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
										$(':button').prop('disabled','disabled');
										$('#silviculture_form').submit();
									}//EOF IF ButtonPressed
								});	
							}else if(opl_val=='R' && actSlvStat=='APR'){
								$.SmartMessageBox({
									title : "<s:text name="annual.plan.impl.confirm.registration.title"/>",
									content : "<s:text name="annual.plan.impl.confirm.registration.content"/>",
									buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
									icon : "fa fa-bell"
								}, function(ButtonPressed) {
										if (ButtonPressed == "<s:text name="rbac.permission.button.yes"/>") {
											var this_form =$("#silviculture_form");
											
											var ids = $("#silviculture_declare").jqGrid('getDataIDs');
											for (var i = 0; i < ids.length+1; i++) {
												$("#silviculture_declare").jqGrid('saveRow', ids[i]);
											}
											var slvArray = $("#silviculture_declare").jqGrid('getRowData');
	
											var jsonText = JSON.stringify(slvArray);
											$('<input>').attr({
												type : 'hidden',
												name : "jsonDetails",
												value : jsonText
											}).appendTo(this_form);
											
											$(':button').prop('disabled','disabled');
											$('#silviculture_form').submit();
										}//EOF IF ButtonPressed
									});	
								}else{
								$(':button').prop('disabled','disabled');
								$('#silviculture_form').submit();
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
									$("#stand_page_content").html(response);
									alert("error:" + errorThrown + ", status:" + status);
								},	    
							    success : function(data, status, jqXHR) {
									$("#stand_page_content").html(jqXHR.responseText);
									
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
										jQuery("#silviculture_grid").trigger("reloadGrid");
										if(opl_val!='R' && actSlvStat!='APR'){
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
						var imArea='<s:property value='silviculture.imArea'/>';
						
						if(imArea - $("#silviculture\\.plArea").val() > 0){
							$('#silviculture\\.imArea').css('background-color', '#F47777');
							}
					});
</script>
