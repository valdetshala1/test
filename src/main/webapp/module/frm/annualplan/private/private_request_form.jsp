 <%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<div class="widget-body" id="private_request_form_content">

	<form id="private_request_form" class="smart-form" action="PrivateRequestSave.do" accept-charset="utf8" method="post">
		<input id="privateRequest.id" name="privateRequest.id" value="<s:property value='privateRequest.id'/>" type="hidden">
		<input id="activity.id" name="activity.id" value="<s:property value='activity.id'/>" type="hidden">
		<input id="activity.qrCode" name="activity.qrCode" value="<s:property value='activity.qrCode'/>" type="hidden">
		<input id="activity.activityNo" name="activity.activityNo" value="<s:property value='activity.activityNo'/>" type="hidden">
<%-- 	<input id="activity.qrCode" name="activity.qrCode" value="<s:property value='activity.qrCode'/>" type="hidden"> --%>
		<input id="sNew" name="sNew" value="<s:property value='statusNew.getDOMKEY()'/>" type="hidden">
		<input id="pvtReqStat" name="pvtReqStat" value="<s:property value='privateRequest.activityStatus.status.getDOMKEY()'/>" type="hidden">
		<input id="editable" name="editable" value="<s:property value='editable'/>" type="hidden">
		<input id="annualplan.cadastralMunicipality.id" name="annualplan.cadastralMunicipality.id" value="<s:property value='annualplan.cadastralMunicipality.id'/>" type="hidden">
		<input id="language" value="<s:property value='locale.language'/>" type="hidden">
		<input id="privateRequest.cadastralZone.cadId"	name="privateRequest.cadastralZone.cadId" value="<s:property value='privateRequest.cadastralZone.cadId'/>" type="hidden">
		<input id="cadParcId" name="cadParcId" value="<s:property value='privateRequest.parcelDetail.cadparcelid'/>" type="hidden"></input>
		<input id="parcelDetailId" name="parcelDetailId" value="<s:property value='privateRequest.parcelDetail.id'/>" type="hidden"></input>
		<input id="privateRequest.parcelDetail.id" name="privateRequest.parcelDetail.id" value="<s:property value='privateRequest.parcelDetail.id'/>" type="hidden"></input>
	
	<fieldset class="no-padding">
			<legend><s:text name="frm.private.request"/></legend>
			<!-- START row -->
			<div class="row">
				<!-- START planting.annualPlan -->
				<section class="col col-3">
					<label class="input"> <s:text
							name="planting.stand.annu.plan" />: <s:if
							test="fieldErrors.get('annualplanId')!=null">
							<div class="form-group has-error">
								<input id="annualplanName" name="annualplanName"
									value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>"
									class="form-control" placeholder="<s:text name="planting.stand.annu.plan" />"
									type="text"> <span class="help-block"><i
									class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('stand.forestTyp')" /> </span>
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<s:if test="annualplan != null">
									<input id="annualplanName" name="annualplanName"
										readonly="readonly"
										value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>"
										class="form-control" placeholder="<s:text name="planting.stand.annu.plan" />"
										type="text">
								</s:if>
								<s:else>
									<input id="annualplanName" name="annualplanName"
										class="form-control"
										placeholder="<s:text name="privateRequest.type.mun"/>" type="text"/>
								</s:else>
								<input id="annualplanId" name="annualplanId"
									value="<s:property value='annualplan.id'/>" type="hidden">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END planting.annualPlan -->

				<!-- START activity.activityDomain.id -->
				<section class="col col-3">
					<label class="input"><s:text name='frm.private.request.activity'/>: <s:if
							test="fieldErrors.get('activity.frmDomain.id')!=null">
							<div class="form-group has-error">
								<input id="activity.activityDomain.name"
									name="activity.activityDomain.name" class="form-control"
									placeholder="<s:text name='frm.private.request.activity'/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('activity.frmDomain.id')" /> </span> <input
									id="activity.activityDomain.id"
									name="activity.activityDomain.id" type="hidden">
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="activity.activityDomain.name"
									name="activity.activityDomain.name"
									value="<s:property value='activity.activityDomain.name'/>"
									class="form-control" placeholder="<s:text name='frm.private.request.activity'/>"
									type="text"> <input id="activity.activityDomain.id"
									name="activity.activityDomain.id"
									value="<s:property value='activity.activityDomain.id'/>"
									type="hidden">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END activity.activityDomain.id -->
				<!-- START privateRequest.requestNo -->
				<section class="col col-3">
					<label class="input"><s:text name='frm.private.request.request.no'/>: <s:if
							test="fieldErrors.get('privateRequest.requestNo')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.requestNo"
									name="privateRequest.requestNo" class="form-control"
									placeholder="<s:text name='frm.private.request.request.no'/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('privateRequest.requestNo')" /> </span>
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.requestNo"
									name="privateRequest.requestNo" class="form-control"
									value="<s:property value='privateRequest.requestNo'/>"
									placeholder="<s:text name='frm.private.request.request.no'/>" type="text">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.requestNo -->
				<!-- START privateRequest.requestDate -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.date'/>: <s:if
							test="fieldErrors.get('privateRequest.requestDate')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.requestDate"
									name="privateRequest.requestDate" class="form-control"
									placeholder="<s:text name='frm.private.request.date'/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('privateRequest.requestDate')" /> </span>
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.requestDate"
									name="privateRequest.requestDate" class="form-control"
									value="<s:property value='privateRequest.requestDate'/>"
									placeholder="<s:text name='frm.private.request.date'/>" type="text">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.requestDate-->
				</div>
				<div class="row">

				<!-- START privateRequest.cadastralZone.id -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.cadastral.zone'/>: <s:if
							test="fieldErrors.get('privateRequest.cadastralZone')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.cadastralZone.name"
									name="privateRequest.cadastralZone.name" class="form-control"
									placeholder="<s:text name='frm.private.request.cadastral.zone'/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('privateRequest.cadastralZone')" />
								</span> <input id="privateRequest.cadastralZone.id"
									name="privateRequest.cadastralZone.id" type="hidden">
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.cadastralZone.name"
									name="privateRequest.cadastralZone.name"
									value="<s:property value='privateRequest.cadastralZone.name'/>"
									class="form-control" placeholder="<s:text name='frm.private.request.cadastral.zone'/>"
									type="text"> <input
									id="privateRequest.cadastralZone.id"
									name="privateRequest.cadastralZone.id"
									value="<s:property value='privateRequest.cadastralZone.id'/>"
									type="hidden">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.cadastralZone.id -->

				<!-- START privateRequest.parcelNo -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.parcel.no'/>: <s:if
							test="fieldErrors.get('privateRequest.parcelDetail.parcelnr')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.parcelDetail.parcelnr"
									name="privateRequest.parcelDetail.parcelnr" class="form-control"
									placeholder="<s:text name='frm.private.request.parcel.no'/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('privateRequest.parcelDetail.parcelnr')" /> </span>
										
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.parcelDetail.parcelnr"
									name="privateRequest.parcelDetail.parcelnr" class="form-control"
									value="<s:property value='privateRequest.parcelDetail.parcelnr'/>"
									placeholder="<s:text name='frm.private.request.parcel.no'/>" type="text">
							
							</div>
						</s:else>
					</label>
				</section>
			  <!-- END privateRequest.parcelnr -->
			  <!-- START privateRequest.subparcelnr -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.subparcel.no'/>: <s:if
							test="fieldErrors.get('privateRequest.parcelDetail.subparcelnr')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.parcelDetail.subparcelnr"
									name="privateRequest.parcelDetail.subparcelnr" class="form-control"
									placeholder="<s:text name='frm.private.request.parcel.no'/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('privateRequest.parcelDetail.parcelnr')" /> </span>
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.parcelDetail.subparcelnr"
									name="privateRequest.parcelDetail.subparcelnr" class="form-control"
									value="<s:property value='privateRequest.parcelDetail.subparcelnr'/>"
									placeholder="<s:text name='frm.private.request.parcel.no'/>" type="text">
							
							</div>
						</s:else>
					</label>
				</section>
			<!-- END privateRequest.subparcelnr -->

				
				<!-- START privateRequest.parcelArea -->
<%-- 				<section class="col col-3"> --%>
<%-- 					<label class="input">*<s:text name='frm.private.request.parcel.area'/>: <s:if --%>
<%-- 							test="fieldErrors.get('privateRequest.parcelArea')!=null"> --%>
<!-- 							<div class="form-group has-error"> -->
<!-- 								<input id="privateRequest.parcelArea" -->
<!-- 									name="privateRequest.parcelArea" class="form-control" -->
<%-- 									placeholder="<s:text name='frm.private.request.parcel.area'/>" type="text" data="number"> <span --%>
<%-- 									class="help-block"><i class="fa fa-warning"></i> <s:property --%>
<%-- 										value="fieldErrors.get('privateRequest.parcelArea')" /></span> --%>
<!-- 							</div> -->
<%-- 						</s:if> <s:else> --%>
<!-- 							<div class="form-group"> -->
<!-- 								<input id="privateRequest.parcelArea" -->
<!-- 									name="privateRequest.parcelArea" class="form-control" -->
<%-- 									value="<s:property value='privateRequest.parcelArea'/>" --%>
<%-- 									placeholder="<s:text name='frm.private.request.parcel.area'/>" type="text" data="number"> --%>
<!-- 							</div> -->
<%-- 						</s:else> --%>
<!-- 					</label> -->
<%-- 				</section> --%>
<!-- END privateRequest.parcelArea-->

				<section class="col col-3">
					<label class="input">
					 	<button id="detailBtn" type="button" class="btn btn-primary btn-lg btn-block" style=" height: 32px; margin-top: 15px;padding-top: 5px;padding-bottom: 5px;">
								<s:text name='frm.private.request.detail.btn'/>
						</button>
					</label>
				</section>
				</div>
				<div class="row">
				<!-- START privateRequest.person -->
				 <section class="col col-3">
					<label class="input">*<s:text name="frm.private.request.requester"/>:
						<s:if test="fieldErrors.get('privateRequest.requester')!=null">
						<div class="form-group  has-error">
							<div class="input-group input-group-bg">
							<span class="btn input-group-addon" id="cpBtn" name="cpBtn" title="Create new person"><i class="glyphicon glyphicon-user"></i></span> 
							 <div class="icon-addon addon-bg" title="<s:text name="frm.private.search.for.person"/>">
								<input type="text" id="privateRequest.requester.firstName" name="privateRequest.requester.firstName" class="form-control" placeholder="<s:text name="frm.private.request.requester"/>">
								<input type="hidden" id="privateRequest.requester.id" name="privateRequest.requester.id"  class="form-control" placeholder="<s:text name="frm.private.request.person"/>">
								</div>
							</div>
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateRequest.requester')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group input-group input-group-bg">
							<span class="btn input-group-addon" id="cpBtn" name="cpBtn" title="Create new person"><i class="glyphicon glyphicon-user"></i></span> 
			                <div class="icon-addon addon-bg" title="<s:text name="frm.private.search.for.person"/>">
								<input type="text" id="privateRequest.requester.firstName" name="privateRequest.requester.firstName"  class="form-control" value="<s:property value='privateRequest.requester.firstName'/>"  placeholder="<s:text name="frm.private.request.requester"/>">
								<input type="hidden" id="privateRequest.requester.id" name="privateRequest.requester.id"  class="form-control" value="<s:property value='privateRequest.requester.id'/>"  placeholder="Requester">
							</div>
						</div>
					</s:else>
					</label>
				</section>
				<!-- END privateRequest.person-->
				<!-- START privateRequest.cadCertNo -->
				<section class="col col-3">
					<label class="input"><s:text name='frm.private.request.cad.cert.no'/>: <s:if
							test="fieldErrors.get('privateRequest.cadCertNo')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.cadCertNo"
									name="privateRequest.cadCertNo" class="form-control"
									placeholder="<s:text name='frm.private.request.cad.cert.no'/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('privateRequest.cadCertNo')" /> </span>
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.cadCertNo"
									name="privateRequest.cadCertNo" class="form-control"
									value="<s:property value='privateRequest.cadCertNo'/>"
									placeholder="<s:text name='frm.private.request.cad.cert.no'/>" type="text">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.cadCertNo-->
				<!-- START privateRequest.copyPlanNo -->
				<section class="col col-3">
					<label class="input"><s:text name='frm.private.request.copy.plan.no'/>: <s:if
							test="fieldErrors.get('privateRequest.copyPlanNo')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.copyPlanNo"
									name="privateRequest.copyPlanNo" class="form-control"
									placeholder="<s:text name='frm.private.request.copy.plan.no'/>" type="text"> <span
									class="help-block"><i class="fa fa-warning"></i> <s:property
										value="fieldErrors.get('privateRequest.copyPlanNo')" /> </span>
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.copyPlanNo"
									name="privateRequest.copyPlanNo" class="form-control"
									value="<s:property value='privateRequest.copyPlanNo'/>"
									placeholder="<s:text name='frm.private.request.copy.plan.no'/>" type="text">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.copyPlanNo-->
			</div>
			<div class="row">
				<!-- START attachment -->
				<section class="col col-3">
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name='tender.request.attachment'/>: 
					<div class="col-md-10"><input id="file" name="file" type="file" class="btn btn-default btn-file" multiple onchange="getFileData(this);">
					</div></label>
				</div>
				</section>
				<!-- END attachment -->
				<!-- START privateRequest.remarks -->
				<section class="col col-6">
					<label class="input"><s:text name='frm.private.request.remarks'/>: <s:if
							test="fieldErrors.get('privateRequest.remarks')!=null">
							<div class="form-group has-error">
								<textarea id="privateRequest.remarks" name="privateRequest.remarks" class="form-control" placeholder="<s:text name='frm.private.request.remarks'/>"><s:property value='privateRequest.remarks'/></textarea>
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateRequest.copyPlanNo')" /> </span>
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<textarea id="privateRequest.remarks" name="privateRequest.remarks" class="form-control" placeholder="<s:text name='frm.private.request.remarks'/>"><s:property value='privateRequest.remarks' /></textarea>
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.remarks-->
			</div>
		</fieldset>

		<fieldset class="no-padding">
			<legend><s:text name="frm.private.request.planning"/></legend>

			<!-- START privateRequest.plTechVolume -->
			<section class="col col-3">
				<label class="input">*<s:text name='frm.private.request.pl.tech.volume'/> (m<sup>3</sup>): <s:if
						test="fieldErrors.get('privateRequest.plTechVolume')!=null">
						<div class="form-group has-error">
							<input id="privateRequest.plTechVolume"
								name="privateRequest.plTechVolume" class="form-control"
								placeholder="<s:text name='frm.private.request.pl.tech.volume'/>" type="text" data="number"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('privateRequest.plTechVolume')" /> </span>
						</div>
					</s:if> <s:else>
						<div class="form-group">
							<input id="privateRequest.plTechVolume"
								name="privateRequest.plTechVolume" class="form-control"
								value="<s:property value='privateRequest.plTechVolume'/>"
								placeholder="<s:text name='frm.private.request.pl.tech.volume'/>" type="text" data="number">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END privateRequest.plTechVolume-->
			<!-- START privateRequest.plFireVolume -->
			<section class="col col-3">
				<label class="input">*<s:text name='frm.private.request.pl.fire.volume'/> (m<sup>3</sup>): <s:if
						test="fieldErrors.get('privateRequest.plTechVolume')!=null">
						<div class="form-group has-error">
							<input id="privateRequest.plFireVolume"
								name="privateRequest.plFireVolume" class="form-control"
								placeholder="<s:text name='frm.private.request.pl.fire.volume'/>" type="text" data="number"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('privateRequest.plFireVolume')" /> </span>
						</div>
					</s:if> <s:else>
						<div class="form-group">
							<input id="privateRequest.plFireVolume"
								name="privateRequest.plFireVolume" class="form-control"
								value="<s:property value='privateRequest.plFireVolume'/>"
								placeholder="<s:text name='frm.private.request.pl.fire.volume'/>" type="text" data="number">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END privateRequest.plFireVolume-->
		</fieldset>
	<div id="alwFieldset">
		<s:if test="privateRequest.activityStatus.status.getDOMKEY()==submitted.getDOMKEY() || privateRequest.activityStatus.status.getDOMKEY()==approved.getDOMKEY() || privateRequest.activityStatus.status.getDOMKEY()==terrainDone.getDOMKEY() || privateRequest.activityStatus.status.getDOMKEY()==transport.getDOMKEY()">
		<fieldset class="no-padding">
			<legend><s:text name="privateRequest.alw.value"/></legend>
			<!-- START privateRequest.alwTechVolume -->
			<section class="col col-3">
				<label class="input"><s:text name="privateRequest.alwTechVolume.label"/> (m<sup>3</sup>): 
						<div class="form-group">
							<input id="alwTechVolume"
								name="alwTechVolume" class="form-control"
								value="<s:property value='privateRequest.alwTechVolume'/>"
								 type="text">
						</div>
				</label>
			</section>
			<!-- END privateRequest.alwTechVolume-->
			<!-- START privateRequest.alwFireVolume -->
			<section class="col col-3">
				<label class="input"><s:text name="privateRequest.alwFireVolume.label"/> (m<sup>3</sup>):
						<div class="form-group">
							<input id="alwFireVolume" name="alwFireVolume"  class="form-control"
								value="<s:property value='privateRequest.alwFireVolume'/>"  type="text">
						</div>
				</label>
			</section>
			<!-- END privateRequest.alwFireVolume-->

		</fieldset>
		</s:if>
	</div>
	<div id="appFieldset">
	<s:if test="privateRequest.activityStatus.status.getDOMKEY()==approved.getDOMKEY() || privateRequest.activityStatus.status.getDOMKEY()==terrainDone.getDOMKEY() || privateRequest.activityStatus.status.getDOMKEY()==transport.getDOMKEY()">
		<fieldset class="no-padding">
			<legend><s:text name="frm.private.request.approved.data"/></legend>

			<!-- START privateRequest.apTechVolume -->
			<section class="col col-3">
				<label class="input"><s:text name='frm.private.request.app.tech.volume'/> (m<sup>3</sup>): 
						<div class="form-group">
							<input id="privateRequest.apTechVolume"
								name="privateRequest.apTechVolume" class="form-control"
								value="<s:property value='privateRequest.apTechVolume'/>"
								placeholder="<s:text name='frm.private.request.app.tech.volume'/>" type="text">
						</div>
					
				</label>
			</section>
			<!-- END privateRequest.apTechVolume-->
			<!-- START privateRequest.apFireVolume -->
			<section class="col col-3">
				<label class="input"><s:text name='frm.private.request.app.fire.volume'/> (m<sup>3</sup>):
						<div class="form-group">
							<input id="privateRequest.apFireVolume"  class="form-control"
								value="<s:property value='privateRequest.apFireVolume'/>"
								placeholder="<s:text name='frm.private.request.app.tech.volume'/>" type="text">
						</div>
				</label>
			</section>
			<!-- END privateRequest.apFireVolume-->
			<!-- START privateRequest.apCreatedDate -->
				<section class="col col-3">
					<label class="input"><s:text name='frm.private.request.app.created.data'/>:
							<div class="form-group">
								<input id="privateRequest.apCreatedDate"  class="form-control"
									value="<s:property value='privateRequest.apCreatedDate'/>"
									placeholder="<s:text name='frm.private.request.app.created.data'/>" type="text">
							</div>
					</label>
				</section>
				<!-- END privateRequest.apCreatedDate-->
				<!-- START privateRequest.employeeByApCreatedBy -->
				<section class="col col-3">
					<label class="input"><s:text name='frm.private.request.app.employee'/>: 
							<div class="form-group">
								<input id="privateRequest.apCreatedBy" class="form-control"
									value="<s:property value='privateRequest.apCreatedBy.firstName'/> <s:property value='privateRequest.apCreatedBy.lastName'/>"
									placeholder="<s:text name='frm.private.request.app.employee'/>" type="text">
							</div>
					</label>
				</section>
			<!-- END privateRequest.employeeByApCreatedBy-->
		</fieldset>
		</s:if>
		<input type="hidden" id="docNames" name="docNames" value="<s:property value="docNames"/>">
		<input type="hidden" id="docExts" name="docExts" value="<s:property value="docExts"/>">
<%-- 		<input type="hidden" id="" name="" value="<s:property value=''/>"> --%>
	</div>
		<!-- END row -->
		<div id="pvtreqToolbar">
		<s:if test="user.getOrganisation().getOperLevelVal()!='M' || privateRequest.activityStatus.status.getDOMKEY()==submitted.getDOMKEY()">
				
		</s:if><s:else>
			<footer class="form-actions">
			<button id="savePRQ" class="btn btn-primary" type="submit">
				<i class="fa fa-save"></i>
				<s:text name="label.button.save"></s:text>
			</button>
			<button id="cancelPRQ" class="btn btn-default" type="button">
				<s:text name="label.button.cancel"></s:text>
			</button>
			</footer>
		</s:else>
		</div>
	</form>
	
<jsp:include page="../../../base/validation.jsp"></jsp:include>
</div>
<script type="text/javascript">

function createNewPerson(){
	var link = "ForestOwner.form.do?";
	openDialogForm('persforestowner_form_content', link, "<s:text name="frm.private.request.create.new.person"/>",800, 650);
	return false;
}
var windowWidth = $(window).width();
var windowHeight = $(window).height();

function getFileData(myFile){
// 	alert(myFile.files.length);
	var names="";
	var exts="";
	for(var i=0;i<myFile.files.length;i++){
	    var file = myFile.files[i];  
	    var filename = file.name;
	    names+=";"+filename;
	    var fileExt = filename.split('.').pop();
	    exts+=";."+fileExt;
	}
	$("#docNames").val(names);
	$("#docExts").val(exts);
}

$(document).ready(function() {
		 $("#detailBtn").on('click',function(){
			var link="PrivateRequest.parcelDetailPopup.do?parcelDetailId="+$("#parcelDetailId").val();
			openDialogForm('parcel_detail_popup_content', link, "Detajet e Parceles",windowWidth,windowHeight);
		 });
		 $("#privateRequest\\.apTechVolume").attr('readonly','readonly');
		 $("#privateRequest\\.apFireVolume").attr('readonly','readonly');
		 $("#privateRequest\\.apCreatedDate").attr('readonly','readonly');
		 $("#privateRequest\\.employeeByApCreatedBy").attr('readonly','readonly');
		 $("#privateRequest\\.requestNo").attr('readonly','readonly');

		 if($("#privateRequest\\.id").val()==''){
			 $("#appFieldset").hide();
		 }
		 
		 var actualUser='<s:property value="user.getOrganisation().getOperLevelVal()"/>';

		 if( $("#campaignIsOpen").val()=='true' && ($("#privateRequest\\.id").val()=='' ||  $("#pvtReqStat").val()==$("#sNew").val()) &&  (actualUser=='M' || $("#userIsForestOwner").val()=='true')){

					if($("#editable").val()=='false' && $("#privateRequest\\.id").val() ){
						 $("#savePRQ").hide();
						 $("#savePRQ").attr('disabled',true);
						}else{
							$("#savePRQ").show();
							$("#savePRQ").attr('disabled',false);
							}
			 }else{
				 $("#savePRQ").hide();
				 $("#savePRQ").attr('disabled',true);
				 }
		
		 
		 if($("#hideReqForm").val()=='true'){
			 $("#private_request_form_content :input").attr('readonly','readonly');
      				$("#savePRQ").hide();
      				$("#savePRQ").attr('disabled',true);
      				$("#cancelPRQ").hide();
      				$("#cancelPRQ").attr('disabled',true);
      				
			 }

		if($("#campaignIsOpen").val()=='false'){
				$("#cancelPRQ").hide();
				$("#cancelPRQ").attr('disabled',true);
			}
		 
		$('#privateRequest\\.requestDate').datetimepicker({
			timepicker:false,
			format:'d.m.Y', 
			mask:false,
			formatDate:'d.m.Y'});
		
		$("input[data='numberLong']").autoNumeric('init', {
			aDec : '.',
			aSep : ',',
			mDec : '0'
		});
		$("input[data='number']").autoNumeric('init', {
			aDec : '.',
			aSep : ',',
			mDec : '2'
		});

		$("#planting\\.stand\\.id").val($("#standId").val());

		
		$("#single-append-text").select2({
		});

		$("#cpBtn").on('click', function() {
			if($("#userIsForestOwner").val()=='false'){
				createNewPerson();	
				}
				
			return false;
		});
			
	    $("#privateRequest\\.requester\\.firstName").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.personDetails.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        if(term == "") term = "";   
		        return {
		        	name_startsWith: term,
		        	partyRole:'FRO',
		        };
		      
		        },
		        results: function (data, page) { 
		        return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
	        formatResult: formatPerson,
	        formatSelection: function(item) {
	        	$("#privateRequest\\.requester\\.id").val(item.id);
	        	$("#privateRequest\\.requester\\.firstName").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });
// 	    $("#privateRequest\\.requester\\.firstName").select2("container").find("div.select2-drop").append("<hr style='margin:5px'><a href='#' onclick='return createNewPerson();'><span style='margin: 1px 5px; padding: 5px 5px;'>Create new person</span></a>");
	    $("#privateRequest\\.requester\\.firstName").select2("data", {id: "<s:property value='privateRequest.requester.id'/>", name: "<s:property value='privateRequest.requester.firstName'/>  <s:property value='privateRequest.requester.lastName'/>"});

	    if($("#userIsForestOwner").val()=='true'){
	    	$("#privateRequest\\.requester\\.firstName").attr('readonly',true);
		    }

		$("#activity\\.activityDomain\\.name").select2({
		    placeholder: "<s:text name='organization.placeholder.enter.activity'/>", 
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

		$("#privateRequest\\.cadastralZone\\.name").select2({
		    placeholder: "<s:text name='organization.placeholder.enter.activity'/>",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.cadZone.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        if(term == "") term = " ";   
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	name_startsWith: term,
			        	mun_id:$('#annualplan\\.cadastralMunicipality\\.id').val(),
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
		    	$("#privateRequest\\.cadastralZone\\.id").val(item.id);
		    	$("#privateRequest\\.cadastralZone\\.name").val(item.name);
		    	$("#privateRequest\\.cadastralZone\\.cadastralZone").val(item.cadId);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});
		$("#privateRequest\\.parcelDetail\\.parcelnr").attr('disabled',true); 
		$("#privateRequest\\.parcelDetail\\.subparcelnr").attr('disabled',true); 
		$("#privateRequest\\.cadastralZone\\.name").select2("data", {id: "<s:property value='privateRequest.cadastralZone.id'/>", name: "<s:property value="privateRequest.cadastralZone.name"/>",cadId:"<s:property value="privateRequest.cadastralZone.cadId"/>"});

		$("#privateRequest\\.cadastralZone\\.name").select2({
		    placeholder: "<s:text name='organization.placeholder.enter.activity'/>",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.cadZone.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        if(term == "") term = " ";   
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	name_startsWith: term,
			        	mun_id:$('#annualplan\\.cadastralMunicipality\\.id').val(),
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
		    	$("#privateRequest\\.cadastralZone\\.id").val(item.id);
		    	$("#privateRequest\\.cadastralZone\\.name").val(item.name);
		    	$("#privateRequest\\.cadastralZone\\.cadId").val(item.cadId);
		    	$("#privateRequest\\.parcelDetail\\.parcelnr").attr('disabled',false);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		$("#privateRequest\\.cadastralZone\\.name").select2("data", {id: "<s:property value='privateRequest.cadastralZone.id'/>", name: "<s:property value="privateRequest.cadastralZone.name"/>",cadId:"<s:property value="privateRequest.cadastralZone.cadId"/>"});
		
		if($("#privateRequest\\.cadastralZone\\.name").val()){
			$("#privateRequest\\.parcelDetail\\.parcelnr").attr('disabled',false);
			}else{
		    $("#privateRequest\\.parcelDetail\\.parcelnr").attr('disabled',true);
				}
		
		$("#privateRequest\\.parcelDetail\\.parcelnr").select2({
		    placeholder: "<s:text name='frm.private.request.parcel.no'/>",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.parcelId.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",   
						maxRows: 12,            
			        	name_startsWith: term,
			        	cadZone_id:$("#privateRequest\\.cadastralZone\\.cadId").val(),
			        };
		        },
		        results: function (data, page) { 
		        	return { results: data 
			        	};
		        },
		        cache: true
		    },
		    initSelection: function(element, callback) {
		    },
		    dropdownAutoWidth: false,
		    formatResult: function(item) {
		    	var markup = '<div class="row-fluid">' + '<div class="span10">'
				+ '<div class="row-fluid">'
				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
				+ item.parcelnr + '</div>' + '</div>';
				markup += '</div></div>';
				return markup;
		    },
		    formatSelection: function(item) {
// 		    	$("#privateRequest\\.parcelDetail\\.id").val(item.id);
		    	$("#privateRequest\\.parcelDetail\\.parcelnr").val(item.parcelnr);
		    	$("#privateRequest\\.parcelDetail\\.subparcelnr").attr('disabled',false);
			    return item.parcelnr;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 

		var parcNo='<s:property value="privateRequest.parcelDetail.parcelnr"/>';
		if(parcNo.length=='4'){
			parcNo='0'+parcNo;
			$("#privateRequest\\.parcelDetail\\.parcelnr").val(parcNo);
			}else if(parcNo.length=='3'){
				parcNo='00'+parcNo;
				$("#privateRequest\\.parcelDetail\\.parcelnr").val(parcNo);
				}else if(parcNo.length=='2'){
					parcNo='000'+parcNo;
					$("#privateRequest\\.parcelDetail\\.parcelnr").val(parcNo);
					}

		$("#privateRequest\\.parcelDetail\\.parcelnr").select2("data", {id: "<s:property value='privateRequest.parcelDetail.id'/>", parcelnr: parcNo});


		$('#detailBtn').prop('disabled','disabled');
		$("#privateRequest\\.parcelDetail\\.subparcelnr").select2({
		    placeholder: "<s:text name='frm.private.request.parcel.no'/>",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.parcelId.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	name_startsWith: term,
			        	cadZone_id:$("#privateRequest\\.cadastralZone\\.cadId").val(),
			        	parcel_id:$("#privateRequest\\.parcelDetail\\.parcelnr").val()
					    };
		        },
		        results: function (data, page) { 
		        	return { results: data 
			        	};
		        },
		        cache: true
		    },
		    initSelection: function(element, callback) {
		    },
		    dropdownAutoWidth: false,
		    formatResult: function(item) {
		    	var markup = '<div class="row-fluid">' + '<div class="span10">'
				+ '<div class="row-fluid">'
				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
				+ item.subparcelnr + '</div>' + '</div>';
				markup += '</div></div>';
				return markup;
		    },
		    formatSelection: function(item) {
		    	$("#parcelDetailId").val(item.id);
		    	$("#privateRequest\\.parcelDetail\\.id").val(item.id);
		    	$("#cadParcId").val(item.cadparcelid);
		    	$("#privateRequest\\.parcelDetail\\.subparcelnr").val(item.subparcelnr);
				if($("#privateRequest\\.cadastralZone\\.cadId").val() && $("#privateRequest\\.parcelDetail\\.parcelnr").val() && $("#privateRequest\\.parcelDetail\\.subparcelnr").val()){
					$('#detailBtn').prop('disabled',false);
					}
				 return item.subparcelnr;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
// 		$("#privateRequest\\.parcelDetail\\.parcelnr").select2("data", {id: "<s:property value='privateRequest.parcelDetail.id'/>", parcelnr: "<s:property value="privateRequest.parcelDetail.parcelnr"/>"});
		$("#privateRequest\\.parcelDetail\\.subparcelnr").select2("data", {id: "<s:property value='privateRequest.parcelDetail.id'/>", parcelnr: "<s:property value="privateRequest.parcelDetail.parcelnr"/>",subparcelnr:"<s:property value="privateRequest.parcelDetail.subparcelnr"/>"});

		if($("#privateRequest\\.parcelDetail\\.parcelnr").val()){
			$("#privateRequest\\.parcelDetail\\.subparcelnr").attr('disabled',false);
			}else{
			$("#privateRequest\\.parcelDetail\\.subparcelnr").attr('disabled',true);
				}	
		
		
		$("#cancelPRQ").on('click', function() {
			$.ajax({
				type : "GET",
				url : "PrivateRequest.form.do?annualplanId="+$("#apId").val(), 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
					
				},
				success : function(data, status, jqXHR) { // on success..
					$("#private_request_form_content").html(jqXHR.responseText);
					//alert after cancel action
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						//timeout: 6000,
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});

		$("#savePRQ").on('click', function() {
			$(':button').prop('disabled','disabled');
			$('#private_request_form').submit();
			return false;
		});
/*
		$("#private_request_form").submit(function() {
							var this_form = $(this);
							$.ajax({
										data : this_form.serialize(), // get the form data
										type : this_form.attr('method'), // GET or POST
										url : this_form.attr('action'), // the file to call
										async : false,
										beforeSend : function(jqXHR, settings) {
										},
										error : function(errorThrown,status, jqXHR) { // on error..
											alert("error:"+ errorThrown+ ", status:"+ status);
										},
										success : function(data, status,jqXHR) { // on success..
											$("#private_request_form_content").html(jqXHR.responseText);
											var errors = jqXHR.getResponseHeader("errors_exits");
											if (!errors) {
												jQuery("#private_request_grid").trigger("reloadGrid");
												$.smallBox({
															title : "Ruajtja eshte kryer me sukses.",
															content : "Ky mesazh do te largohet pas 2 sekondave!",
															color : "#739E73",
															timeout : 2000,
															icon : "fa fa-check",
															number : "1"
														});
											} else {$.smallBox({
															title : "Ruajtja nuk mund te behet. Ju lutem korrigjoni gabimet! ",
															content : "Ky mesazh do te largohet pas 2 sekondave!",
															color : "#C79121",
															timeout : 2000,
															icon : "fa fa-shield fadeInLeft animated",
															number : "2"
														});
											}
										},
										complete : function(jqXHR,textStatus) {
										}
									});
							return false;
						});
		*/
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#private_request_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
					$(':button').prop('disabled',false);
				},	    
			    success : function(data, status, jqXHR) {
			    	jQuery("#private_request_grid").trigger("reloadGrid");
			    	$(':button').prop('disabled',false);
					$("#private_request_form_content").html(jqXHR.responseText);
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
			    },	    
				complete: function(xhr) {
				}
			});				
		})();
});
</script>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
