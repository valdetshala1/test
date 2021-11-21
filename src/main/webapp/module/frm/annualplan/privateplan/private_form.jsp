<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<div id="private_form_content">
<form id="private_form" class="smart-form" action="PrivateActivitySave.do" accept-charset="utf8" method="post">
<input id="activity.id" name="activity.id" value="<s:property value='activity.id'/>" type="hidden">
<input id="privateActivity.id" name="privateActivity.id"  value="<s:property value='privateActivity.id'/>" type="hidden">
<input id="language" name="language" value="<s:property value='locale.language'/>" type="hidden">
<input id="activityStatus.id" name="activityStatus.id" value="<s:property value='activityStatus.id'/>" type="hidden">
<input id="privateActivity.activityStatus.status" name="privateActivity.activityStatus.status" value="<s:property value='privateActivity.activityStatus.status.getDOMVALUE()'/>" type="hidden">
<input id="hideSave" name="hideSave" value="<s:property value='hideSave'/>" type="hidden">
<input id="privateActivity.workStage" name="privateActivity.workStage" value="<s:property value='privateActivity.workStage'/>" type="hidden">
<input id="privateActivity.personByImCreatedBy.id" name="privateActivity.personByImCreatedBy.id" value="<s:property value='privateActivity.personByImCreatedBy.id'/>" type="hidden">		
<input id="privateActivity.personByPlCreatedBy.id" name="privateActivity.personByPlCreatedBy.id" value="<s:property value='privateActivity.personByPlCreatedBy.id'/>" type="hidden">
	<div  id="statusColor" class="alert alert-new fade in">			
			<i id="statusIcon" class="fa-fw fa fa-pencil-square-o"></i>
			<s:if test="locale.language=='al'">
				<strong><s:property value='privateActivity.activityStatus.status.getDOMTEXT()'/></strong> 
			</s:if><s:elseif test="locale.language=='en'">
				<strong><s:property value='privateActivity.activityStatus.status.getDOMTEXT_EN()'/></strong>
			</s:elseif><s:else>
				<strong><s:property value='privateActivity.activityStatus.status.getDOMTEXT_SR()'/></strong>
			</s:else>
	</div>
<div class="row"> 
		<fieldset>
		<legend><s:text name="annu.seedling.label.activity"/></legend>
			<!-- START privateActivity.annualPlan -->
			<div class="col-md-4">
			   <div class="col-sm-3 profile-pic">
				<img src="data:image/jpeg;base64,<s:property value='barCodeImg'/>" class="barcode-gl"  />
			   </div>
			</div>
			<div class="col-md-8 padding-left-0">
			<div class="row">
			<section class="col col-6">
				<label class="input"> <s:text name='tender.request.annual.plan'/>:
					<s:if test="fieldErrors.get('annualplanId')!=null">
						<div class="form-group has-error">
							<input id="annualplanName" name="annualplanName" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name='tender.request.annual.plan'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('stand.forestTyp')"/> </span>
							<input id="annualplanId" name="annualplanId" value="<s:property value='annualplan.id'/>" type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<s:if test="annualplan!=null">
							<input id="annualplanName" name="annualplanName" readonly="readonly" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>" class="form-control" placeholder="<s:text name='tender.request.annual.plan'/>" type="text">
							</s:if>
							<s:else>
							<input id="annualplanName" name="annualplanName" class="form-control" placeholder="<s:text name="placeholder.enter.mun.name"/>" type="text">
							</s:else>
							<input id="annualplanId" name="annualplanId" value="<s:property value='annualplan.id'/>" type="hidden">
							<input id="annualplan.annualPlanningStatus.status" name="annualplan.annualPlanningStatus.status" value="<s:property value='annualplan.annualPlanningStatus.status.getDOMVALUE()'/>" type="hidden">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END privateActivity.annualPlan -->	
		   <!-- START activity.activityDomain.id -->
				<section class="col col-6">
					<label class="input">*<s:text name="frm.private.plan.label.activity"/>:
						<s:if test="fieldErrors.get('activity.frmDomain.id')!=null">
						<div class="form-group has-error">
							<input id="activity.activityDomain.name" name="activityDomain.name" class="form-control" placeholder="<s:text name="frm.private.plan.label.activity"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activity.frmDomain.id')"/> </span>
							<input id="activity.activityDomain.id" name="activity.activityDomain.id" type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="activity.activityDomain.name" name="activity.activityDomain.name" value="<s:property value='activity.activityDomain.name'/>" class="form-control" placeholder="<s:text name="frm.private.plan.label.activity"/>" type="text">
							<input id="activity.activityDomain.id" name="activity.activityDomain.id" value="<s:property value='activity.activityDomain.id'/>" type="hidden">
						</div>
					</s:else>
					</label>
				</section>
				</div>
			<div class="row">
			<!-- END activity.activityDomain.id -->
		   <!-- START privateActivity.activityUnit -->
				<section class="col col-6">
					<label class="input">*<s:text name="frm.private.plan.label.activity.unit"/>:
						<s:if test="fieldErrors.get('privateActivity.activityUnit')!=null">
						<div class="form-group has-error">
							<input readonly maxlength="10" type="text" id="privateActivity.activityUnit" name="privateActivity.activityUnit" class="form-control" placeholder="<s:text name="frm.private.plan.label.activity.unit"/>">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.activityUnit')"/></span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input readonly type="text" id="privateActivity.activityUnit" name="privateActivity.activityUnit"  class="form-control" value="<s:property value='privateActivity.activityUnit'/>"  placeholder="<s:text name="frm.private.plan.label.activity.unit"/>">
						</div>
					</s:else>
					</label>
				</section>
				</div>
			</div>
			<!-- END privateActivity.unitsMetric -->
		</fieldset>
		</div>
		<div class="row">
		<fieldset>
		<legend><s:text name="frm.private.plan.planning.fieldset"/></legend>
		<!-- START row -->
			   <!-- START privateActivity.plTechVolume -->
					<section class="col col-4">
						<label class="input">*<s:text name="frm.private.plan.pl.tech.volume"/> (m<sup>3</sup>):
							<s:if test="fieldErrors.get('privateActivity.plTechVolume')!=null">
							<div class="form-group has-error">
								<input type="text" id="privateActivity.plTechVolume" name="privateActivity.plTechVolume" class="number"  value="<s:property value='privateActivity.plTechVolume'/>"  placeholder="<s:text name="frm.private.plan.pl.tech.volume"/>">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.plTechVolume')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input type="text" id="privateActivity.plTechVolume" name="privateActivity.plTechVolume"  class="number"  value="<s:property value='privateActivity.plTechVolume'/>"  placeholder="<s:text name="frm.private.plan.pl.tech.volume"/>">
							</div>
						</s:else>
						</label>
					</section>
				<!-- END privateActivity.plValue-->
				<!-- START privateActivity.plFireVolume -->
					<section class="col col-4">
						<label class="input">*<s:text name="frm.private.plan.pl.fire.volume"/> (m<sup>3</sup>):
							<s:if test="fieldErrors.get('privateActivity.plFireVolume')!=null">
							<div class="form-group has-error">
								<input type="text" id="privateActivity.plFireVolume" name="privateActivity.plFireVolume" class="number"  value="<s:property value='privateActivity.plFireVolume'/>"  placeholder="<s:text name="frm.private.plan.pl.fire.volume"/>">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.plFireVolume')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input type="text" id="privateActivity.plFireVolume" name="privateActivity.plFireVolume"  class="number"  value="<s:property value='privateActivity.plFireVolume'/>"  placeholder="<s:text name="frm.private.plan.pl.fire.volume"/>">
							</div>
						</s:else>
						</label>
					</section>
				<!-- END privateActivity.plFireVolume-->
		</fieldset>
		</div>
		<div class="row">
		<fieldset>
		<legend><s:text name="frm.private.plan.received.requests"/></legend>		
			  <!-- START privateActivity.imTechVolume-->
					<section class="col col-4">
						<label class="input"><s:text name="frm.private.plan.im.tech.volume"/> (m<sup>3</sup>):
							<s:if test="fieldErrors.get('privateActivity.imTechVolume')!=null">
							<div class="form-group has-error">
								<input type="text" id="privateActivity.imTechVolume" name="privateActivity.imTechVolume" class="number"  value="<s:property value='privateActivity.imTechVolume'/>"  placeholder="<s:text name="frm.private.plan.im.tech.volume"/>">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.imTechVolume')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input type="text" id="privateActivity.imTechVolume" name="privateActivity.imTechVolume"  class="number"  value="<s:property value='privateActivity.imTechVolume'/>"  placeholder="<s:text name="frm.private.plan.im.tech.volume"/>">
							</div>
						</s:else>
						</label>
					</section>
				<!-- END privateActivity.imTechVolume-->
				<!-- START privateActivity.imFireVolume -->
					<section class="col col-4">
						<label class="input"><s:text name="frm.private.plan.im.fire.volume"/> (m<sup>3</sup>):
							<s:if test="fieldErrors.get('privateActivity.imFireVolume')!=null">
							<div class="form-group has-error">
								<input type="text" id="privateActivity.imFireVolume" name="privateActivity.imFireVolume" class="number"  value="<s:property value='privateActivity.imFireVolume'/>"  placeholder="<s:text name="frm.private.plan.im.fire.volume"/>">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.imFireVolume')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input type="text" id="privateActivity.imFireVolume" name="privateActivity.imFireVolume"  class="number"  value="<s:property value='privateActivity.imFireVolume'/>"  placeholder="<s:text name="frm.private.plan.im.fire.volume"/>">
							</div>
						</s:else>
						</label>
					</section>
				<!-- END protection.imValue-->
		</fieldset>
		</div>
		<div class="row">
		<fieldset>
		<legend><s:text name="frm.private.plan.campaign.period"/></legend>
		
		
		 <!-- START privateActivity.startCmpgnDate -->
					<section class="col col-4">
						<label class="input">*<s:text name="frm.private.plan.start.cmpgn.date"/>:
							<s:if test="fieldErrors.get('privateActivity.startCmpgnDate')!=null">
							<div class="form-group has-error">
								<input type="text" id="privateActivity.startCmpgnDate" name="privateActivity.startCmpgnDate"  placeholder="<s:text name="frm.private.plan.start.cmpgn.date"/>" value="<s:property value='privateActivity.startCmpgnDate'/>" >
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.startCmpgnDate')"/> </span>
							</div>
						</s:if>
						<s:elseif test="fieldErrors.get('privateActivity.dateStart.less')!=null">
							<div class="form-group has-error">
								<div class="col-md-10">
								<input id="privateActivity.startCmpgnDate" name="privateActivity.startCmpgnDate" value="<s:property value='privateActivity.startCmpgnDate'/>" class="form-control">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.dateStart.less')"/> </span>
								</div>					
							</div>
						</s:elseif>
						<s:else>
							<div class="form-group">
								<input type="text" id="privateActivity.startCmpgnDate" name="privateActivity.startCmpgnDate"  placeholder="<s:text name="frm.private.plan.start.cmpgn.date"/>"  value="<s:property value='privateActivity.startCmpgnDate'/>"  placeholder="">
							</div>
						</s:else>
						</label>
					</section>
		<!-- END privateActivity.startCmpgnDate-->
	    <!-- START privateActivity.endCmpgnDate -->
					<section class="col col-4">
						<label class="input">*<s:text name="frm.private.plan.end.cmpgn.date"/>:
							<s:if test="fieldErrors.get('privateActivity.endCmpgnDate')!=null">
							<div class="form-group has-error">
								<input type="text" id="privateActivity.endCmpgnDate" name="privateActivity.endCmpgnDate"  placeholder="<s:text name="frm.private.plan.end.cmpgn.date"/>"  value="<s:property value='privateActivity.endCmpgnDate'/>" >
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.endCmpgnDate')"/> </span>
							</div>
						</s:if>
						<s:elseif test="fieldErrors.get('privateActivity.dateEnd.less')!=null">
							<div class="form-group has-error">
								<div class="col-md-10">
								<input id="privateActivity.endCmpgnDate" name="privateActivity.endCmpgnDate" value="<s:property value='privateActivity.endCmpgnDate'/>" class="form-control">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateActivity.dateEnd.less')"/> </span>
								</div>					
							</div>
						</s:elseif>
						<s:else>
							<div class="form-group">
								<input type="text" id="privateActivity.endCmpgnDate" name="privateActivity.endCmpgnDate"    placeholder="<s:text name="frm.private.plan.end.cmpgn.date"/>" value="<s:property value='privateActivity.endCmpgnDate'/>" >
							</div>
						</s:else>
						</label>
					</section>
		<!-- END privateActivity.endCmpgnDate-->
		</fieldset>
		</div>
		<div class="row">
		<fieldset>
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
						<div class="input-group input-group-sm">
						<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
						<div class="icon-addon addon-sm">
							<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFilesDataAlf(this);">
						</div>
						<span class="input-group-btn">
							<button id="showAttachments" class="btn btn-primary" type="button"><s:text name="frm.private.plan.buton.show.attachments"/>
							</button>
						</span>
						</div>
				  </div>
				</s:else>
				<!-- END attachment -->
				
				<input id="docNameAlf" name="docNameAlf" value="<s:property value='docNameAlf'/>" type="hidden">
				<input id="docTypeAlf" name="docTypeAlf" value="<s:property value='docTypeAlf'/>" type="hidden">
					
				<br><br>
					  <section class="col col-10">
						<label class="input"><s:text name="hum.employee.label.comment"/>:
							<s:if test="fieldErrors.get('activityStatus.remarks')!=null">
							<div class="form-group has-error">
								<textarea id="activityStatus.remarks" name="activityStatus.remarks" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"></textarea>
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
			</fieldset>
			</div>
				<s:if test="kfaView"> 
				<fieldset id="status_fieldset">
					  <legend><s:text name="law.suit.label.status"/></legend>
				<section>
					<s:if test="fieldErrors.get('privateActivity.decisionStatus')!=null">
					    <div class="form-group has-error">
						<div id="row">
						<div class="inline-group">
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='pvtRejected.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.reject"/></label>
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='pvtReplanned.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.replan"/></label>
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='pvtApproved.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.approve"/></label>
					    </div>
					     </div>
						  <div id="row" class="col-md-10">
					     <span class="help-block"><i class="fa fa-warning"></i> <s:property
							value="fieldErrors.get('privateActivity.decisionStatus')" /> </span>
						</div>
						</div>
				    </s:if>
				    <s:else>
				    <div class="inline-group">
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='pvtRejected.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.reject"/></label>
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='pvtReplanned.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.replan"/></label>
					     <label class="radio">
					      <input type="radio" id="decisionStatus" name="decisionStatus" value="<s:property value='pvtApproved.getDOMVALUE()'/>">
					      <i></i><s:text name="frm.statuses.approve"/></label>
					    </div>
				    
				    </s:else>
			   </section>

				
	  		</fieldset>
	  		</s:if>
	  	<div id="toolbarDiv">
			<footer class="form-actions">
				<s:if test="!hideSave"> 
					<button id="save" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				</s:if>
				<s:if test="displaySubbmit"> 
					<button id="submit" class="btn btn-default" type="button">
						<s:text name="frm.private.plan.submit"/>
					</button>
					</s:if>
				<button id="auditBtn" class="btn btn-default" type="button">
						<s:text name="audit.title"/>
				</button>
			</footer>
		</div>
	
</form>
</div>
<s:if test="hasActionErrors() || hasFieldErrors()">
<fieldset>
	<legend><s:text name="frm.harvest.planning.validations"/></legend>
	<table class="errors"> 
	<s:iterator value="actionErrors">
	<tr>
	<td colspan="5">
		<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
		<strong><s:text name="label.action.alert"/>:</strong>  <s:property escape="false"/>
	</td>
	</tr>
	</s:iterator>
	<s:iterator value="fieldErrors">
	<tr>
	<td colspan="5">
		<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
		<strong><s:text name="label.action.alert"/>:</strong>  <s:property escape="false"/>
	</td>
	</tr>
	</s:iterator>				
	</table>	
</fieldset>
</s:if>			
<script type="text/javascript">
$(document).ready(function() {
	$('input.number').autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});

	if(!$("#privateActivity\\.activityUnit").val()){
		$("#privateActivity\\.activityUnit").val("ha");
	}
	if($("#privateActivity\\.id").val()==null || $("#privateActivity\\.id").val()=='' ){
		$("#showAttachments").hide();

		}else{
			$("#showAttachments").show();
			}
	
    $("#showAttachments").on('click', function() {
			var link = "PrivateActivity.docGrid.do?privateActivityId=" + $("#privateActivity\\.id").val();
			openDialogForm('private_doc_content',link,"Private Doc",800,650);
	});
	

	
	var opl_val='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
	$("#statusColor").hide();
 	if($("#privateActivity\\.activityStatus\\.status").val()!=''){
 		$("#statusColor").show();
 		if($("#privateActivity\\.activityStatus\\.status").val()=='<s:property value="pvtSubmitted.getDOMVALUE()"/>'){
 			$('.alert-new').css({"border-color":"#EA7835"});
 			$('.alert-new').css({"background-color":"#FFE3D6"});
 			$('.alert').css({"color":"#EA7835"});
 			$("#statusIcon").removeClass();
 			$( "#statusIcon" ).addClass( "fa-fw fa fa-exchange" );
 			
 	 		}
 		 if($("#privateActivity\\.activityStatus\\.status").val()=='<s:property value="pvtApproved.getDOMVALUE()"/>'){
 			$('.alert-new').css({"border-color":"#8ac38b"});
 			$('.alert-new').css({"background-color":"#cde0c4"});
 			$('.alert').css({"color":"#8ac38b"});
 			$("#statusIcon").removeClass();
 			$("#statusIcon" ).addClass( "fa-fw fa fa-check" );
 			
 	 		}
 		 if($("#privateActivity\\.activityStatus\\.status").val()=='<s:property value="pvtRejected.getDOMVALUE()"/>'){
  			$('.alert-new').css({"border-color":"#953b39"});
  			$('.alert-new').css({"color":"#fff"});
  			$('.alert-new').css({"background-color":"#F99D9D"});
  			$('.alert').css({"color":"#953b39"});
  			$("#statusIcon").removeClass();
  			$("#statusIcon" ).addClass( "fa-fw fa fa-times" );
  	 		}
 		 if($("#privateActivity\\.activityStatus\\.status").val()=='<s:property value="pvtReplanned.getDOMVALUE()"/>'){
   			$('.alert-new').css({"border-color":"#484C4F"});
   			$('.alert-new').css({"color":"#fff"});
   			$('.alert-new').css({"background-color":"#CFD1D3"});
   			$('.alert').css({"color":"#484C4F"});
   			$("#statusIcon").removeClass();
   			$("#statusIcon" ).addClass( "fa-fw fa fa-times" );
   	 		}

 	 }
	var new_stat='<s:property value="pvtNEW"/>';
	if( opl_val!='M'){
		$('#privateActivity\\.startCmpgnDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		
		$('#privateActivity\\.endCmpgnDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});

		}
	if($("#hideSave").val()=='true' || opl_val=='C'){
		$("#privateActivity\\.startCmpgnDate").attr('readonly',false);
		$("#privateActivity\\.endCmpgnDate").attr('readonly',false);
		$("#privateActivity\\.activityUnit").attr('readonly',true);
		$("#privateActivity\\.plTechVolume").attr('readonly',true);
		$("#privateActivity\\.plFireVolume").attr('readonly',true);
		}else if($("#privateActivity\\.workStage").val()=='P' || $("#privateActivity\\.workStage").val()==''){
		$("#privateActivity\\.imTechVolume").attr('readonly',true);
		$("#privateActivity\\.imFireVolume").attr('readonly',true);
	}else if($("#privateActivity\\.workStage").val()=='I'){
		$("#privateActivity\\.activityUnit").attr('readonly',true);
		$("#privateActivity\\.startCmpgnDate").attr('readonly',true);
		$("#privateActivity\\.endCmpgnDate").attr('readonly',true);
		$("#privateActivity\\.plTechVolume").attr('readonly',true);
		$("#privateActivity\\.plFireVolume").attr('readonly',true);

		
	}
	$("#privateActivity\\.imTechVolume").attr('readonly',true);
	$("#privateActivity\\.imFireVolume").attr('readonly',true);
	
	if(opl_val=='M'){
		$("#privateActivity\\.startCmpgnDate").attr('readonly',true);
		$("#privateActivity\\.endCmpgnDate").attr('readonly',true);
		}
	
	$("#auditBtn").on('click', function(){
		if($("#privateActivity\\.id").val()){
		 showHistory('PrivateActivity','#standactivity_grid', $("#privateActivity\\.id").val());
		}
	});
	
	$("#submit").on('click', function(){
		$.SmartMessageBox({
				title : "<s:text name="annual.plan.activity.status.change.title"/>", 
				content : "<s:text name="annual.plan.activity.status.change.content"/>", 
				buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
				icon : "fa fa-bell"
				
			}, function(ButtonPressed) {
				if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
	               var  formData = "activityIdList=" + $("#privateActivity\\.id").val();
				   $.ajax({
						data : formData, 
						type : 'POST', // GET or POST
						url : 'PrivateStatus.do?annualplanId='+$("#annualplanId").val(), 
						async : false,
						beforeSend : function(jqXHR, settings) {
						},
						error : function(errorThrown, status, jqXHR) { // on error..
							alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
						},
						success : function(data, status, jqXHR) { // on success..
							var errors = jqXHR.getResponseHeader("errors_exits");
							var link = "PrivateActivity.form.do?privateActivityId=" + $("#privateActivity\\.id").val()+"&annualplanId="+$("#annualplanId").val();
		 					loadURL(link, $("#private_form_content"));
							if(!errors){
								$.smallBox({
									title : "<s:text name="small.box.on.save.title.success"/>", 
									content : "<s:text name="small.box.content"/>", 
									color : "#739E73",
									timeout: 2000,
									icon : "fa fa-check",
									number : "1"
								});									
							}else{
								$.smallBox({
									title : "<s:text name="small.box.on.save.title.failed"/>", 
									content : "<s:text name="small.box.content"/>", 
									color : "#C79121",
									timeout: 2000,
									icon : "fa fa-shield fadeInLeft animated",
									number : "2"
								});
							}
						},
						complete : function(jqXHR, textStatus) {
						}
					});	
				}//EOF IF ButtonPressed
			});				   	   

		
		});
 	
    $("#save").on('click', function() {
    	$(':button').prop('disabled','disabled'); 
		$('#private_form').submit();
		return false;
	});
	
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
		        	dom_code:"PRVFR"
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

	if ($("#language").val() == 'en') {
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameEn"/>"});
	} else if ($("#language").val() == 'al') {
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameAl"/>"});
	} else if ($("#language").val() == 'sr') {
		$("#activity\\.activityDomain\\.name").select2("data", {id: "<s:property value='activity.activityDomain.id'/>", name: "<s:property value="activity.activityDomain.nameSr"/>"});
	}
	$("#activity\\.activityDomain\\.name").attr('readonly',true);
	
// 	$("#private_form").submit(function() {
// 		var this_form = $(this);
// 		$.ajax({
// 			data : this_form.serialize(), // get the form data
// 			type : this_form.attr('method'), // GET or POST
// 			url : this_form.attr('action'), // the file to call
// 			async : false,
// 			beforeSend : function(jqXHR, settings) {
// 			},
// 			error : function(errorThrown, status, jqXHR) { // on error..
// 				alert("error:" + errorThrown + ", status:" + status);
// 			},
// 			success : function(data, status, jqXHR) { // on success..
// 				$("#private_form_content").html(jqXHR.responseText);
// 				var errors = jqXHR.getResponseHeader("errors_exits");
// 				if(!errors){
// // 					$("#private_form_content").dialog("close");
// // 					jQuery("#private_grid").trigger("reloadGrid");
// 					$.smallBox({
// 						title : "Ruajtja eshte kryer me sukses.",
// 						content : "Ky mesazh do te largohet pas 2 sekondave!",
// 						color : "#739E73",
// 						timeout: 2000,
// 						icon : "fa fa-check",
// 						number : "1"
// 					});									
// 				}else{
// 					$.smallBox({
// 						title : "Ruajtja nuk mund te behet. Ju lutem korrigjoni gabimet! ",
// 						content : "Ky mesazh do te largohet pas 2 sekondave!",
// 						color : "#C79121",
// 						timeout: 2000,
// 						icon : "fa fa-shield fadeInLeft animated",
// 						number : "2"
// 					}); 
// 				}
// 			},
// 			complete : function(jqXHR, textStatus) {
// 			}
// 		});
// 		return false;
// 	});	

	
    (function() {
		$('form').ajaxForm({
			beforeSerialize: function($form, options) {         
			},
		    beforeSend: function() {
		    },
			error : function(response, status, err){
				$("#private_form_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
				$("#private_form_content").html(jqXHR.responseText);
				
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
