<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<style type="text/css">
.tokenize-sample{ width:100% !important; }
</style>
<div class="widget-body" id="inspection_form_content">
<jsp:include page="../../../base/validation.jsp"></jsp:include>
	<form id="inspection_form" class="smart-form"	action="InspectionSave.do" accept-charset="utf8" method="post">
			<div  id="referenceDiv" class="alert alert-new fade in">			
				<i id="statusIcon" class="fa-fw fa  fa-stack-overflow"></i>
				<s:text name="bpartner.reference.no"/> : <s:property value='refNo'/>
			</div>
			<input id="parentId" name="parentId" value="<s:property value='parentId'/>" type="hidden">	
			<input id="language" name="language" value="<s:property value='locale.language'/>" type="hidden">	
			<input id="inspection.inspection.id" name="inspection.inspection.id" value="<s:property value='inspection.inspection.id'/>" type="hidden">
			<input id="inspection.inspection.inspectionNo" name="inspection.inspection.inspectionNo" value="<s:property value='inspection.inspection.inspectionNo'/>" type="hidden">
			<input id="inspection.createdDate" name="inspection.createdDate" value="<s:property value='inspection.createdDate'/>" type="hidden">
			<input id="inspection.employee.id" name="inspection.employee.id" value="<s:property value='inspection.employee.id'/>" type="hidden">
			<input id="inspection.id" name="inspection.id" value="<s:property value='inspection.id'/>" type="hidden">
			<fieldset class="no-padding">
				<legend>
					<s:text name="frm.inspection.data"/>
				</legend>
				<!-- START row -->
			<div class="row">
			<!-- START inspection.inspectionNo -->
			<section class="col col-4">
				<label class="input">*<s:text name="frm.inspection.inspection.no.label"/>:
					<s:if test="fieldErrors.get('inspection.inspectionNo')!=null">
						<div class="form-group has-error">
							<input id="inspection.inspectionNo" name="inspection.inspectionNo"  class="form-control" placeholder="<s:text name="frm.inspection.inspection.no.label"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.region')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.inspectionNo" name="inspection.inspectionNo" value="<s:property value='inspection.inspectionNo'/>" class="form-control" placeholder="<s:text name="frm.inspection.inspection.no.label"/>" type="text">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END inspection.inspectionNo -->
			<!-- START inspection.inspectionType -->
				<section class="col col-4">
					<label class="input">*<s:text name="frm.inspection.type.label"/>
						<s:if test="fieldErrors.get('inspection.inspectionType')!=null">
							<div  class="has-error">
							<select  class="form-control" id="inspection.inspectionType"
								name="inspection.inspectionType">
								<option></option>
								<s:iterator value="inspTypeList" var="la">
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
							<span
								class="help-block"><i class="fa fa-warning"></i> <s:property
								value="fieldErrors.get('inspection.inspectionType')" /> </span>
						</div>
						</s:if>
						<s:else>
							<select class="form-control" id="inspection.inspectionType"
								name="inspection.inspectionType">
								<option></option>
								<s:iterator value="inspTypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
											<span
								class="help-block"><i class="fa fa-warning"></i> <s:property
								value="fieldErrors.get('inspection.inspectionType')" /> </span>
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
			<!-- END inspection.inspectionType -->
			<!-- START inspection.inspectionDate -->
			<section class="col col-4">
				<label class="input">*<s:text name="frm.inspection.date.label"/>:
					<s:if test="fieldErrors.get('inspection.date')!=null">
						<div class="form-group has-error">
							<input id="inspection.date" name="inspection.date"  class="form-control" placeholder="<s:text name="frm.inspection.date.label"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.date')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.date" name="inspection.date" value="<s:property value='inspection.date'/>" class="form-control" placeholder="<s:text name="frm.inspection.date.label"/>" type="text">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.inspectionDate-->	
			</div>
		</fieldset>
		<fieldset id="controlDiv">
			<!-- START  Control div-->
		
<!-- 				 <fieldset class="no-padding"> -->
			<div class="row">
		
			<!-- START inspection.region -->
			<section class="col col-4">
				<label class="input">*<s:text name="frm.inspection.region.name"/>:
					<s:if test="fieldErrors.get('inspection.region')!=null">
						<div class="form-group has-error">
							<input id="inspection.region.name" name="inspection.region.name"  class="form-control" placeholder="<s:text name="inspection.region.name"/>" type="text">
							<input id="inspection.region.nameEn" name="inspection.region.nameEn"  class="form-control" type="hidden">
							<input id="inspection.region.nameSr" name="inspection.region.nameSr"  class="form-control"  type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.region')"/> </span>
							<input id="inspection.region.id" name="inspection.region.id" value="<s:property value='inspection.region.id'/>" class="form-control"  type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.region.name" name="inspection.region.name" value="<s:property value='inspection.region.name'/>" class="form-control" placeholder="<s:text name="inspection.region.name"/>" type="text">
							<input id="inspection.region.nameEn" name="inspection.region.nameEn" value="<s:property value='inspection.region.nameEn'/>" class="form-control" type="hidden">
							<input id="inspection.region.nameSr" name="inspection.region.nameSr" value="<s:property value='inspection.region.nameSr'/>" class="form-control"  type="hidden">
							<input id="inspection.region.id" name="inspection.region.id" value="<s:property value='inspection.region.id'/>" class="form-control"  type="hidden">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END inspection.region -->	
			<!-- START inspection.cadastralMunicipality -->
			<section class="col col-4">
				<label class="input"><s:text name="frm.inspection.cadastralMunicipality.name"/>:
					<s:if test="fieldErrors.get('inspection.cadastralMunicipality')!=null">
						<div class="form-group has-error">
							<input id="inspection.cadastralMunicipality.name" name="inspection.cadastralMunicipality.name"  class="form-control" placeholder="<s:text name="inspection.cadastralMunicipality.name"/>" type="text">
							<input id="inspection.cadastralMunicipality.nameEn" name="inspection.cadastralMunicipality.nameEn"  class="form-control"  type="hidden">
							<input id="inspection.cadastralMunicipality.nameSr" name="inspection.cadastralMunicipality.nameSr"  class="form-control"  type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.region')"/> </span>
							<input id="inspection.cadastralMunicipality.id" name="inspection.cadastralMunicipality.id" value="<s:property value='inspection.cadastralMunicipality.id'/>" class="form-control"  type="hidden">
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.cadastralMunicipality.name" name="inspection.cadastralMunicipality.name" value="<s:property value='inspection.cadastralMunicipality.name'/>" class="form-control" placeholder="<s:text name="inspection.cadastralMunicipality.name"/>" type="text">
							<input id="inspection.cadastralMunicipality.nameEn" name="inspection.cadastralMunicipality.nameEn" value="<s:property value='inspection.cadastralMunicipality.nameEn'/>" class="form-control"  type="hidden">
							<input id="inspection.cadastralMunicipality.nameSr" name="inspection.cadastralMunicipality.nameSr" value="<s:property value='inspection.cadastralMunicipality.nameSr'/>" class="form-control"  type="hidden">
							<input id="inspection.cadastralMunicipality.id" name="inspection.cadastralMunicipality.id" value="<s:property value='inspection.cadastralMunicipality.id'/>" class="form-control"  type="hidden">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.cadastralMunicipality-->	
			</div>
			
			
			<div class="row">
			<!-- START inspection.inspector-->
			<section class="col col-4">
				<label class="input">*<s:text name="frm.inspector.label"/>:
					<s:if test="fieldErrors.get('inspection.inspectorIdList')!=null">
						<div class="form-group has-error">
								<select class="tokenize-sample" id="inspectorIdList" name="inspectorIdList" multiple="multiple">
									<s:iterator value="inspection.inspectors" var="rb">
										<option value="<s:property value="employee.id"/>" selected="selected"><s:property value="employee.firstName"/> <s:property value="employee.lastName"/></option>
									</s:iterator>						
								</select>
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.inspectorIdList')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
								<select class="tokenize-sample" id="inspectorIdList" name="inspectorIdList" multiple="multiple" >
									<s:iterator value="inspection.inspectors" var="rb">
										<option value="<s:property value="employee.id"/>" selected="selected"><s:property value="employee.firstName"/> <s:property value="employee.lastName"/></option>
									</s:iterator>						
								</select>
						</div>
					</s:else>
				</label>
			</section>
			<!-- END inspection.inspector -->
			
			<!-- START inspection.inspActionType -->
			<section class="col col-4">
				<label class="input">*<s:text name="frm.inspection.inspActionType.label"/>:
					<s:if test="fieldErrors.get('inspection.inspActionType')!=null">
						<div class="form-group has-error">
							<input id="inspection.inspActionType.nameEn" name="inspection.inspActionType.nameEn"  class="form-control" placeholder="<s:text name="frm.inspection.inspActionType.label"/>" type="text">
							<input id="inspection.inspActionType.nameAl" name="inspection.inspActionType.nameAL"  class="form-control"  type="hidden">
							<input id="inspection.inspActionType.nameSr" name="inspection.inspActionType.nameSr"  class="form-control"  type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.inspActionType')"/> </span>
							<input id="inspection.inspActionType.id" name="inspection.inspActionType.id" value="<s:property value='inspection.inspActionType.id'/>" class="form-control"  type="hidden">						
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.inspActionType.nameEn" name="inspection.inspActionType.nameEn" value="<s:property value='inspection.inspActionType.nameEn'/>" class="form-control" placeholder="<s:text name="frm.inspection.inspActionType.label"/>" type="text">
							<input id="inspection.inspActionType.nameAl" name="inspection.inspActionType.nameAl" value="<s:property value='inspection.inspActionType.nameAl'/>" class="form-control"  type="hidden">
							<input id="inspection.inspActionType.nameSr" name="inspection.inspActionType.nameSr" value="<s:property value='inspection.inspActionType.nameSr'/>" class="form-control"  type="hidden">
							<input id="inspection.inspActionType.id" name="inspection.inspActionType.id" value="<s:property value='inspection.inspActionType.id'/>" class="form-control"  type="hidden">							
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.inspActionType-->	
			</div>
<!-- 			</fieldset> -->
				<!-- START inspection.procesverbal -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="frm.inspection.set.data.procesverbal"/></label>
						<div class="col-md-10">
							<input id="inspection.procesverbal" name="inspection.procesverbal"  value="<s:property value='inspection.procesverbal'/>" type="checkbox">
						</div>
				</div>
				<!-- END inspection.procesverbal -->
<!-- 			</fieldset> -->
			<br>
			<fieldset id="procDiv">
			<div class="row" >
			<!-- START inspection.procesverbalNo -->
			<section class="col col-6">
				<label class="input"><s:text name="frm.inspection.procesverbalNo.label"/>:
					<s:if test="fieldErrors.get('inspection.procesverbalNo')!=null">
						<div class="form-group has-error">
							<input id="inspection.procesverbalNo" name="inspection.procesverbalNo"  class="form-control" placeholder="<s:text name="frm.inspection.procesverbalNo.label"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.procesverbalNo')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.procesverbalNo" name="inspection.procesverbalNo" value="<s:property value='inspection.procesverbalNo'/>" class="form-control" placeholder="<s:text name="frm.inspection.procesverbalNo.label"/>" type="text">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.procesverbalNo-->	
			<!-- START inspection.contactPerson -->
			<section class="col col-6">
				<label class="input"><s:text name="frm.inspection.contactPerson.label"/>:
					<s:if test="fieldErrors.get('inspection.contactPerson')!=null">
						<div class="form-group has-error">
							<input id="inspection.contactPerson" name="inspection.contactPerson"  class="form-control" placeholder="<s:text name="frm.inspection.contactPerson.label"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.contactPerson')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.contactPerson" name="inspection.contactPerson" value="<s:property value='inspection.contactPerson'/>" class="form-control" placeholder="<s:text name="frm.inspection.contactPerson.label"/>" type="text">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.contactPerson-->
			</div>
			<div class="row" >
			<!-- START inspection.procesverbalNote -->
			<section class="col col-6">
				<label class="input"><s:text name="frm.inspection.procesverbalNote.label"/>:
					<s:if test="fieldErrors.get('inspection.procesverbalNote')!=null">
						<div class="form-group has-error">
							<textarea id="inspection.procesverbalNote" name="inspection.procesverbalNote" class="form-control" placeholder="<s:text name="frm.inspection.procesverbalNote.label"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.quantityConcerned')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
						<textarea id="inspection.procesverbalNote" name="inspection.procesverbalNote" class="form-control" placeholder="<s:text name="frm.inspection.procesverbalNote.label"/>"><s:property value='inspection.procesverbalNote'/></textarea>
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.procesverbalNote-->	
			</div>
			</fieldset>
			<!-- START inspection.sequestration -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="frm.inspection.set.data.sequestration"/></label>
						<div class="col-md-10">
							<input id="inspection.sequestration" name="inspection.sequestration"  value="<s:property value='inspection.sequestration'/>" type="checkbox">
						</div>
				</div>
			<!-- END inspection.sequestration -->
			<br>
			<fieldset id="seqDiv">
			<div class="row" >
			<section class="col col-6">
				<label class="input"><s:text name="frm.inspection.seqTeachVolume.label"/>:
					<s:if test="fieldErrors.get('inspection.seqTeachVolume')!=null">
						<div class="form-group has-error">
							<input id="inspection.seqTeachVolume" name="inspection.seqTeachVolume"  class="form-control" placeholder="<s:text name="frm.inspection.seqTeachVolume.label"/>" type="text" data="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.seqTeachVolume')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.seqTeachVolume" name="inspection.seqTeachVolume" value="<s:property value='inspection.seqTeachVolume'/>" class="form-control" placeholder="<s:text name="frm.inspection.seqTeachVolume.label"/>" type="text" data="number">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.seqTeachVolume-->	
			<!-- START inspection.seqFireVolume -->
			<section class="col col-6">
				<label class="input"><s:text name="frm.inspection.seqFireVolume.label"/>:
					<s:if test="fieldErrors.get('inspection.seqFireVolume')!=null">
						<div class="form-group has-error">
							<input id="inspection.seqFireVolume" name="inspection.seqFireVolume"  class="form-control" placeholder="<s:text name="frm.inspection.seqFireVolume.label"/>" type="text" data="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.seqFireVolume')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.seqFireVolume" name="inspection.seqFireVolume" value="<s:property value='inspection.seqFireVolume'/>" class="form-control" placeholder="<s:text name="frm.inspection.seqFireVolume.label"/>" type="text" data="number">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.seqFireVolume-->
			</div>
			<div class="row" >
			<!-- START inspection.procesverbalNote -->
			<section class="col col-6">
				<label class="input"><s:text name="frm.inspection.seqNote.label"/>:
					<s:if test="fieldErrors.get('inspection.procesverbalNote')!=null">
						<div class="form-group has-error">
							<textarea id="inspection.seqNote" name="inspection.seqNote" class="form-control" placeholder="<s:text name="frm.inspection.seqNote.label"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.quantityConcerned')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
						<textarea id="inspection.seqNote" name="inspection.seqNote" class="form-control" placeholder="<s:text name="frm.inspection.seqNote.label"/>"><s:property value='inspection.seqNote'/></textarea>
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.procesverbalNote-->	
			</div>
			</fieldset>
			<!-- START inspection.charges -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="frm.inspection.set.data.charges"/></label>
						<div class="col-md-10">
							<input id="inspection.charges" name="inspection.charges"  value="<s:property value='inspection.charges'/>" type="checkbox">
						</div>
				</div>
			<!-- END inspection.charges -->
			<br>
			<fieldset id="chrgDiv">
			<div class="row" >
			<!-- START inspection.chargesType -->
				<section class="col col-6">
					<label class="input"><s:text name="frm.inspection.chargesType.label"/>
						<s:if test="fieldErrors.get('inspection.chargesType')!=null">
							<div  class="has-error">
							<select  class="form-control" id="inspection.chargesType"
								name="inspection.chargesType">
								<option></option>
								<s:iterator value="inspChargeList" var="la">
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
								value="fieldErrors.get('inspection.chargesType')" /> </span>
						</div>
						</s:if>
						<s:else>
							<select class="form-control" id="inspection.chargesType"
								name="inspection.chargesType">
								<option></option>
								<s:iterator value="inspChargeList" var="la">
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
			<!-- END inspection.chargesType -->
			<!-- START inspection.chargesRefNo -->
			<section class="col col-6">
				<label class="input"><s:text name="frm.inspection.chargesRefNo.label"/>:
					<s:if test="fieldErrors.get('inspection.chargesRefNo')!=null">
						<div class="form-group has-error">
							<input id="inspection.chargesRefNo" name="inspection.chargesRefNo"  class="form-control" placeholder="<s:text name="frm.inspection.chargesRefNo.label"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.chargesRefNo')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input id="inspection.chargesRefNo" name="inspection.chargesRefNo" value="<s:property value='inspection.chargesRefNo'/>" class="form-control" placeholder="<s:text name="frm.inspection.chargesRefNo.label"/>" type="text">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.chargesRefNo-->
			</div>
			<div class="row" >
			<!-- START inspection.seqNote -->
			<section class="col col-6">
				<label class="input"><s:text name="frm.inspection.chargesNote.label"/>:
					<s:if test="fieldErrors.get('inspection.chargesNote')!=null">
						<div class="form-group has-error">
							<textarea id="inspection.chargesNote" name="inspection.chargesNote" class="form-control" placeholder="<s:text name="frm.inspection.chargesNote.label"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('inspection.chargesNote')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
						<textarea id="inspection.chargesNote" name="inspection.chargesNote" class="form-control" placeholder="<s:text name="frm.inspection.chargesNote.label"/>"><s:property value='inspection.chargesNote'/></textarea>
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.seqNote-->	
			</div>
			</fieldset>		

			<br>
		</fieldset>
	 	<!-- END  Control div-->
			<fieldset class="no-padding">
<!-- 				<legend> -->
<!-- 				</legend> -->

			<div class="row">
			<!-- START inspection.notes -->
			<section class="col col-6">
				<label class="input"><s:text name="hum.employee.label.comment"/>:
					<s:if test="fieldErrors.get('inspection.notes')!=null">
						<div class="form-group has-error">
							<textarea id="inspection.notes" name="inspection.notes" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('hum.employee.label.comment')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
						<textarea id="inspection.notes" name="inspection.notes" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"><s:property value='inspection.notes'/></textarea>
						</div>
					</s:else>
				</label>
			</section>
			<!-- END  inspection.notes-->	
				<!-- START attachment -->
				<s:if test="fieldErrors.get('attachment')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
					 	  <div class="col-md-10">
					      	<input id="file" name="file" type="file" class="btn btn-default btn-file" multiple onchange="getFileData(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('attachment')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<div class="input-group input-group-sm">
						<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
						<div class="icon-addon addon-sm">
							<input id="file" name="file" type="file" class="btn btn-default btn-file" multiple  onchange="getFileData(this);">
						</div>
						</div>
				  </div>
				</s:else>
				<!-- END attachment -->
						<input type="hidden" id="docNames" name="docNames" value="<s:property value="docNames"/>">
						<input type="hidden" id="docExts" name="docExts" value="<s:property value="docExts"/>">
						
			</div>
			</fieldset>
			
			
			<footer class="form-actions">
				<button id="saveInsp" class="btn btn-primary" type="button">
					<i class="fa fa-save"></i>
					<s:text name="label.button.save"></s:text>
				</button>
				<button id="cancelInsp" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
			</footer>
	
			
		</form>
	</div>
<script type="text/javascript">

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
				$("#inspection\\.inspectionNo").attr('readonly',true);
				
				$('#inspection\\.inspectionType').val('<s:property value="inspection.inspectionType.DOMVALUE"/>');
				$('#inspection\\.chargesType').val('<s:property value="inspection.chargesType.DOMVALUE"/>');
				
				$("#inspection\\.inspectionType").on('change',function(event){
						if(this.value=='<s:text name="inspControl.getDOMVALUE()"/>'){
							$("#controlDiv").show();
							}else{
								$("#controlDiv").hide();
								}
					});
				
				if($("#inspection\\.inspectionType").val()=='<s:text name="inspControl.getDOMVALUE()"/>'){
					$("#controlDiv").show();
					}else{
						$("#controlDiv").hide();
						}
				
				var isProcesverbal=$('#inspection\\.procesverbal').val();
				
				$('#inspection\\.procesverbal').on('change',function(event){
					$('#inspection\\.procesverbal').val($('#inspection\\.procesverbal')[0].checked ? "true" : "false" );
					isProcesverbal=$('#inspection\\.procesverbal').val();
					if(isProcesverbal=="true"){
						$("#procDiv").show();
					}else{
						$("#procDiv").hide();
						$("#inspection\\.procesverbalNo").val(null);
						$("#inspection\\.contactPerson").val(null);
						$("#inspection\\.procesverbalNote").val(null);
					}
				});
				
				if(isProcesverbal=="true"){
					$("#inspection\\.procesverbal").prop('checked',true);
					$("#procDiv").show();
				}else{
					$("#inspection\\.procesverbal").prop('checked',false);
					$("#procDiv").hide();
					$("#inspection\\.procesverbalNo").val(null);
					$("#inspection\\.contactPerson").val(null);
					$("#inspection\\.procesverbalNote").val(null);
				}

				
				var isSequestration=$('#inspection\\.sequestration').val();
				$('#inspection\\.sequestration').on('change',function(event){
					$('#inspection\\.sequestration').val($('#inspection\\.sequestration')[0].checked ? "true" : "false" );
					isSequestration=$('#inspection\\.sequestration').val();
					if(isSequestration=="true"){
						$("#seqDiv").show();
					}else{
						$("#seqDiv").hide();
						$("#inspection\\.seqTeachVolume").val(null);
						$("#inspection\\.seqFireVolume").val(null);
						$("#inspection\\.seqNote").val(null);
					}
				});
				
				if(isSequestration=="true"){
					$("#inspection\\.sequestration").prop('checked',true);
					$("#seqDiv").show();
				}else{
					$("#inspection\\.sequestration").prop('checked',false);
					$("#seqDiv").hide();
					$("#inspection\\.seqTeachVolume").val(null);
					$("#inspection\\.seqFireVolume").val(null);
					$("#inspection\\.seqNote").val(null);
				}

				
				var isCharges=$('#inspection\\.charges').val();
				$('#inspection\\.charges').on('change',function(event){
					$('#inspection\\.charges').val($('#inspection\\.charges')[0].checked ? "true" : "false" );
					isCharges=$('#inspection\\.charges').val();
					if(isCharges=="true"){
						$("#chrgDiv").show();
					}else{
						$("#chrgDiv").hide();
						$("#inspection\\.chargesType").val(null);
						$("#inspection\\.chargesRefNo").val(null);
						$("#inspection\\.chargesRefNo").val(null);
					}
				});
				
				if(isCharges=="true"){
					$("#inspection\\.charges").prop('checked',true);
					$("#chrgDiv").show();
				}else{
					$("#inspection\\.charges").prop('checked',false);
					$("#chrgDiv").hide();
					$("#inspection\\.chargesType").val(null);
					$("#inspection\\.chargesRefNo").val(null);
					$("#inspection\\.chargesRefNo").val(null);
				}

				if($("#parentId").val()){
					$("#inspection\\.inspection\\.id").val($("#parentId").val());
					
		   			$('.alert-new').css({"border-color":"#484C4F"});
		   			$('.alert-new').css({"color":"#fff"});
		   			$('.alert-new').css({"background-color":"#CFD1D3"});
		   			$('.alert').css({"color":"#484C4F"});
					$("#referenceDiv").show();
		 		
					}else{
					$("#referenceDiv").hide();
					}
				
						$("input[data='number']").autoNumeric('init', {
							aDec : '.', 
							aSep : ',',
							mDec : '2'
						});
						$('#inspection\\.date').datetimepicker({
							lang: 'al',
							format: 'd.m.Y',
							mask: false,
							formatDate:'d.m.Y',
							timepicker: false,
					    			
						});

// 						 $('#inspector').multiselect({
// 								filterBehavior: 'both',
// 								buttonContainer: '<div class="btn-group" />',
// 								numberDisplayed: 1,
// 								enableFiltering: true,
// 								includeSelectAllDivider: true,
// 								selectAllValue: 'multiselect-all',
// 								maxHeight: 200,
// 							 });
						
						$('#inspectorIdList').tokenize({
								    datas: "Input.employee.do?role_code=IN&roleCodeInsp=ID",
								    searchParam: 'name_startsWith',
								    newElements: true,
								    valueField: 'id',
								    textField: 'name',
								    dataType: 'json',
								    onAddToken: function(value, text){
								    	console.log(value + ", " + text);
									}
						});

						$("#inspection\\.region\\.name").select2({
					        placeholder: "Search for a repository",
					        minimumInputLength: 0,
					        ajax: {
						        url: "Input.region.do",
						        dataType: 'json',
						        quietMillis: 250,
						        data: function (term, page) {
						        return {
						        	featureClass: "P",
									style: "full",
									maxRows: 12, 
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
					        	$("#inspection\\.region\\.id").val(item.id);
					        	$("#inspection\\.region\\.name").val(item.name);
					        	$("#inspection\\.region\\.nameEn").val(item.name);
					        	$("#inspection\\.region\\.nameSr").val(item.name);
					        	if(item.id){
						        	$("#inspection\\.cadastralMunicipality\\.name").attr('readonly',false);
						        	$("#inspection\\.cadastralMunicipality\\.name").select2("data", {id: "", name: ""});
					        	}
					            return item.name;
					        },
					        allowClear: true,
					        dropdownCssClass: "bigdrop",
					        escapeMarkup: function (m) { return m; }
					    });		

			    $("#inspection\\.cadastralMunicipality\\.name").select2({
					        placeholder: "Search for a repository",
					        minimumInputLength: 1,
					        ajax: {
						        url: "Input.municipality.do",
						        dataType: 'json',
						        quietMillis: 250,
						        data: function (term, page) {
						        return {
						        	featureClass: "P",
									style: "full",
									maxRows: 12, 
						        	name_startsWith: term,
						        	reg_id: $("#inspection\\.region\\.id").val(),
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
					        	$("#inspection\\.cadastralMunicipality\\.id").val(item.id);
					        	$("#inspection\\.cadastralMunicipality\\.name").val(item.name);
					        	$("#inspection\\.cadastralMunicipality\\.nameEn").val(item.name);
					        	$("#inspection\\.cadastralMunicipality\\.nameSr").val(item.name);
					            return item.name;
					        },
					        allowClear: true,
					        dropdownCssClass: "bigdrop",
					        escapeMarkup: function (m) { return m; }
					    }); 
			    $("#inspection\\.cadastralMunicipality\\.name").attr('readonly',true);

				 
	 
			    $("#inspection\\.unitsMetric\\.name").select2({
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
			        	$("#inspection\\.unitsMetric\\.id").val(item.id);
			        	$("#inspection\\.unitsMetric\\.name").val(item.name);
			        	$("#inspection\\.unitsMetric\\.nameEn").val(item.name);
			        	$("#inspection\\.unitsMetric\\.nameSr").val(item.name);
			            return item.name;
			        },
			        allowClear: true,
			        escapeMarkup: function (m) { return m; }
			    }); 

			    $("#inspection\\.inspActionType\\.nameEn").select2({
			        placeholder: "",
			        minimumInputLength: 1,
			        ajax: {
				        url: "Input.inspActionType.do",
				        dataType: 'json',
				        quietMillis: 250,
				        data: function (term, page) {
				        return {
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
			        	$("#inspection\\.inspActionType\\.id").val(item.id);
			        	$("#inspection\\.inspActionType\\.nameEn").val(item.name);
			        	$("#inspection\\.inspActionType\\.nameAl").val(item.name);
			        	$("#inspection\\.inspActionType\\.nameSr").val(item.name);
			            return item.name;
			        },
			        allowClear: true,
			        escapeMarkup: function (m) { return m; }
			    }); 

			    if($("#language").val()=='en'){
					$("#inspection\\.unitsMetric\\.name").select2("data", {id: "<s:property value='inspection.unitsMetric.id'/>", name: "<s:property value="inspection.unitsMetric.nameEn"/>"});
					$("#inspection\\.inspActionType\\.nameEn").select2("data", {id: "<s:property value='inspection.inspActionType.id'/>", name: "<s:property value="inspection.inspActionType.nameEn"/>"});
					var mun_name=characterReplace("<s:property value='inspection.cadastralMunicipality.nameEn'/>");
					var reg_name=characterReplace("<s:property value='inspection.region.nameEn'/>");
					$("#inspection\\.region\\.name").select2("data", {id: "<s:property value='inspection.region.id'/>", name: reg_name});
					$("#inspection\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='inspection.cadastralMunicipality.id'/>", name: mun_name});
					}else if($("#language").val()=='al'){
					 $("#inspection\\.unitsMetric\\.name").select2("data", {id: "<s:property value='inspection.unitsMetric.id'/>", name: "<s:property value="inspection.unitsMetric.name"/>"});
					 $("#inspection\\.inspActionType\\.nameEn").select2("data", {id: "<s:property value='inspection.inspActionType.id'/>", name: "<s:property value="inspection.inspActionType.nameAl"/>"});
					 var mun_name=characterReplace("<s:property value='inspection.cadastralMunicipality.name'/>");
					 var reg_name=characterReplace("<s:property value='inspection.region.name'/>");
					 $("#inspection\\.region\\.name").select2("data", {id: "<s:property value='inspection.region.id'/>", name: reg_name});
					 $("#inspection\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='inspection.cadastralMunicipality.id'/>", name: mun_name});
					}else if($("#language").val()=='sr'){
					 $("#inspection\\.unitsMetric\\.name").select2("data", {id: "<s:property value='inspection.unitsMetric.id'/>", name: "<s:property value="inspection.unitsMetric.nameSr"/>"});
					 $("#inspection\\.inspActionType\\.nameEn").select2("data", {id: "<s:property value='inspection.inspActionType.id'/>", name: "<s:property value="inspection.inspActionType.nameSr"/>"});
					 var mun_name=characterReplace("<s:property value='inspection.cadastralMunicipality.nameSr'/>");
					 var reg_name=characterReplace("<s:property value='inspection.region.nameSr'/>");
					 $("#inspection\\.region\\.name").select2("data", {id: "<s:property value='inspection.region.id'/>", name: reg_name});
					 $("#inspection\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='inspection.cadastralMunicipality.id'/>", name: mun_name});
					}
	
				$("#cancelInsp").on('click', function() {
							$.ajax({
								type : "GET",
								url : "Inspection.form.do",
								async : false,
								beforeSend : function(jqXHR, settings) {
								},
								error : function(errorThrown, status, jqXHR) { // on error..
									alert("error:" + errorThrown + ", status:" + status);
								},
								success : function(data, status, jqXHR) { // on success..
									$("#inspection_form_content").html(jqXHR.responseText);
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
								complete : function(jqXHR, textStatus) {
								}
							});
							return false;
						});
				
				$("#saveInsp").on('click', function() {
					$('#inspection_form').submit();
					return false;
					});

					    (function() {
							$('form').ajaxForm({
								beforeSerialize: function($form, options) {         
								},
							    beforeSend: function() {
							    },
								error : function(response, status, err){
									$("#inspection_form_content").html(response);
									alert("error:" + errorThrown + ", status:" + status);
								},	    
							    success : function(data, status, jqXHR) {
									$("#inspection_form_content").html(jqXHR.responseText);
									
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
										jQuery("#insp_treegrid").trigger("reloadGrid");
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
