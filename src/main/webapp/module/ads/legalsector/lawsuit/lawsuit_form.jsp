<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">
<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">

		<form id="lawsuit_form" class="form-horizontal" action="LawSuitSave.do"
			accept-charset="utf8" method="post">
			
			<input type="hidden" id="lawsuit.id" name="lawsuit.id"
				value="<s:property value="lawsuit.id"/>" />
			<input type="hidden" id="lawsuit.lawSuitStatus.id" name="lawsuit.lawSuitStatus.id"
				value="<s:property value="lawsuit.lawSuitStatus.id"/>" />
			<input type="hidden" id="lawSuitStatus.id" name="lawSuitStatus.id"
				value="<s:property value="lawSuitStatus.id"/>" />
				
				
			<fieldset>
				<legend><s:text name="law.suit.legend.law.suit.data"/></legend>
				<!-- START lawsuit.employee.id -->
				<s:if test="fieldErrors.get('lawsuit.employee.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.claimant"/></label>
						<div class="col-md-10">
							<input id="lawsuit.employee.firstName" name="lawsuit.employee.firstName" class="form-control" placeholder="<s:text name="law.suit.label.claimant"/>"  type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('lawsuit.employee.id')"/> </span>
							<input id="lawsuit.employee.id" name="lawsuit.employee.id" value="<s:property value='lawsuit.employee.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.claimant"/></label>
						<div class="col-md-10">
						<input id="lawsuit.employee.firstName" name="lawsuit.employee.firstName" class="form-control" placeholder="<s:text name="law.suit.label.claimant"/>" value="<s:property value='lawsuit.employee.firstName'/>" type="text">
						<input id="lawsuit.employee.id" name="lawsuit.employee.id" value="<s:property value='lawsuit.employee.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END lawsuit.employee.id -->
				<!-- Start lawsuit.organisatioList -->
					<s:if test="fieldErrors.get('lawsuit.organisation.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.office"/></label>
						<div class="col-md-10">
							<input id="lawsuit.organisation.orgaName" name="lawsuit.organisation.orgaName" class="form-control" placeholder="<s:text name="law.suit.label.office"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('lawsuit.organisation.id')"/> </span>
							<input id="lawsuit.organisation.id" name="lawsuit.organisation.id" value="<s:property value='lawsuit.organisation.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.office"/></label>
						<div class="col-md-10">
						<input id="lawsuit.organisation.orgaName" name="lawsuit.organisation.orgaName" class="form-control" placeholder="<s:text name="law.suit.label.office"/>" value="<s:property value='lawsuit.organisation.orgaName'/>" type="text">
						<input id="lawsuit.organisation.id" name="lawsuit.organisation.id" value="<s:property value='lawsuit.organisation.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END lawsuit.organisation -->
				<!-- START lawsuit.lawsuitNo -->
				<s:if test="fieldErrors.get('lawsuit.lawsuitNo')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="law.suit.label.law.suit.no"/></label>
						<div class="col-md-10">
							<input readonly id="lawsuit.lawsuitNo" name="lawsuit.lawsuitNo"
								class="form-control" placeholder="<s:text name="law.suit.label.law.suit.no"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('lawsuit.lawsuitNo')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="law.suit.label.law.suit.no"/></label>
						<div class="col-md-10">
							<input readonly id="lawsuit.lawsuitNo" name="lawsuit.lawsuitNo"
								value="<s:property value='lawsuit.lawsuitNo'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.law.suit.no"/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END lawsuit.lawsuitNo -->
				<!-- START lawsuit.suitType -->
				<s:if test="fieldErrors.get('lawsuit.suitType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.suit.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="lawsuit.suitType" name="lawsuit.suitType">
								<s:iterator value="suittypeList" var="st">
									<option value="<s:property value="#st.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#st.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#st.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#st.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('lawsuit.suitType')"/>
							</span> 
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="law.suit.label.suit.type"/></label>
					<div class="col-md-10">
						<select class="form-control" id="lawsuit.suitType" name="lawsuit.suitType">
							<s:iterator value="suittypeList" var="st">
									<option value="<s:property value="#st.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#st.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#st.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#st.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
						</select>
					</div>
				</div>
				</s:else>
				<!-- END lawsuit.suitType -->
				<!-- START lawsuit.damageType -->
				<s:if test="fieldErrors.get('lawsuit.damageType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.damage.type"/></label>
						<div class="col-md-10">
							<input id="lawsuit.damageType" name="lawsuit.damageType"
								class="form-control" placeholder="<s:text name="law.suit.label.damage.type"/>"
								type="text">
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('lawsuit.damageType')"/>
							</span> 
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="law.suit.label.damage.type"/></label>
					<div class="col-md-10">
							<input id="lawsuit.damageType" name="lawsuit.damageType" value="<s:property value='lawsuit.damageType'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.damage.type"/>"
								type="text">
					</div>
				</div>
				</s:else>
				<!-- END lawsuit.damageType -->
				</fieldset>
				<fieldset>
				<legend><s:text name="law.suit.legend.convicted.person.data"/></legend>
				<!-- START lawsuit.name -->
				<s:if test="fieldErrors.get('lawsuit.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name"/></label>
						<div class="col-md-10">
							<input id="lawsuit.name" name="lawsuit.name"
								class="form-control" placeholder="<s:text name="leave.type.label.name"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('lawsuit.name')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.name"/></label>
						<div class="col-md-10">
							<input id="lawsuit.name" name="lawsuit.name"
								value="<s:property value='lawsuit.name'/>"
								class="form-control" placeholder="<s:text name="leave.type.label.name"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END lawsuit.name -->
				<!-- START lawsuit.parentName -->
				<s:if test="fieldErrors.get('lawsuit.parentName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.parent.name"/></label>
						<div class="col-md-10">
							<input id="lawsuit.parentName" name="lawsuit.parentName"
								class="form-control" placeholder="<s:text name="law.suit.label.parent.name"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('lawsuit.parentName')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.parent.name"/></label>
						<div class="col-md-10">
							<input id="lawsuit.name" name="lawsuit.parentName"
								value="<s:property value='lawsuit.parentName'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.parent.name"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END lawsuit.parentName -->
				<!-- START lawsuit.lastName -->
				<s:if test="fieldErrors.get('lawsuit.lastName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
						<div class="col-md-10">
							<input id="lawsuit.lastName" name="lawsuit.lastName"
								class="form-control" placeholder="<s:text name="label.person.lastname"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('lawsuit.lastName')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.lastname"/></label>
						<div class="col-md-10">
							<input id="lawsuit.lastName" name="lawsuit.lastName"
								value="<s:property value='lawsuit.lastName'/>"
								class="form-control" placeholder="<s:text name="label.person.lastname"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END lawsuit.lastName -->
				<!-- START lawsuit.personalId -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.personal.id"/></label>
						<div class="col-md-10">
							<input id="lawsuit.personalId" name="lawsuit.personalId"
								value="<s:property value='lawsuit.personalId'/>"
								class="form-control" placeholder="<s:text name="hum.employee.label.personal.id"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.personalId -->
				<!-- START lawsuit.birthdate -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="label.person.birthdate"/></label>
						<div class="col-md-10">
							<input id="lawsuit.birthdate" name="lawsuit.birthdate"
								value="<s:property value='lawsuit.birthdate'/>"
								class="form-control" placeholder="<s:text name="label.person.birthdate"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.birthdate -->
				<!-- START lawsuit.address -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="finance.contractor.label.address"/></label>
						<div class="col-md-10">
							<input id="lawsuit.address" name="lawsuit.address"
								value="<s:property value='lawsuit.address'/>"
								class="form-control" placeholder="<s:text name="finance.contractor.label.address"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.address -->
				<!-- START lawsuit.profession -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.profession"/></label>
						<div class="col-md-10">
							<input id="lawsuit.address" name="lawsuit.profession"
								value="<s:property value='lawsuit.profession'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.profession"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.profession -->
				<!-- START lawsuit.placeOfEmployment -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.place.of.employment"/></label>
						<div class="col-md-10">
							<input id="lawsuit.address" name="lawsuit.placeOfEmployment"
								value="<s:property value='lawsuit.placeOfEmployment'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.place.of.employment"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.placeOfEmployment -->
				<!-- START lawsuit.accomplice -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.accomplice"/></label>
						<div class="col-md-10">
							<input id="lawsuit.accomplice" name="lawsuit.accomplice"
								value="<s:property value='lawsuit.accomplice'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.accomplice"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.accomplice -->
				</fieldset>
<!-- 				<fieldset> -->
<!-- 				<legend>Damage Data</legend> -->
				<!-- START lawsuit.managmentUnit -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.managment.unit"/></label>
						<div class="col-md-10">
							<input id="lawsuit.managmentUnit" name="lawsuit.managmentUnit"
								value="<s:property value='lawsuit.managmentUnit'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.managment.unit"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.managmentUnit -->
				<!-- START lawsuit.stand -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.stand"/></label>
						<div class="col-md-10">
							<input id="lawsuit.stand" name="lawsuit.stand"
								value="<s:property value='lawsuit.stand'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.stand"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.stand -->
				<!-- START lawsuit.origin -->
				<s:if test="fieldErrors.get('lawsuit.origin')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.forest.origin"/></label>
						<div class="col-md-10">
							<select class="form-control" id="lawsuit.origin" name="lawsuit.origin">
								<s:iterator value="originList" var="st">
									<option value="<s:property value="#st.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#st.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#st.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#st.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('lawsuit.origin')"/>
							</span> 
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="law.suit.label.forest.origin"/></label>
					<div class="col-md-10">
						<select class="form-control" id="lawsuit.origin" name="lawsuit.origin">
								<s:iterator value="originList" var="st">
									<option value="<s:property value="#st.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#st.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#st.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#st.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
						</select>
					</div>
				</div>
				</s:else>
				<!-- END lawsuit.origin -->
				<!-- START lawsuit.evidence -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.evidence"/></label>
						<div class="col-md-10">
							<input id="lawsuit.evidence" name="lawsuit.evidence"
								value="<s:property value='lawsuit.evidence'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.evidence"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.evidence -->
				<!-- START lawsuit.placename -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.place.name"/></label>
						<div class="col-md-10">
							<input id="lawsuit.evidence" name="lawsuit.placename"
								value="<s:property value='lawsuit.placename'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.place.name"/>"
								type="text">
						</div>
					</div>
				<!-- END lawsuit.placename -->
				<!-- START lawsuit.date -->
					<s:if test="fieldErrors.get('lawsuit.date')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="law.suit.label.date.of.damage"/></label>
						<div class="col-md-10">
							<input id="lawsuit.date" name="lawsuit.date"
								class="form-control" placeholder="<s:text name="law.suit.label.date.of.damage"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('lawsuit.date')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="law.suit.label.date.of.damage"/></label>
						<div class="col-md-10">
							<input id="lawsuit.date" name="lawsuit.date"
								value="<s:property value='lawsuit.date'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.date.of.damage"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END lawsuit.date -->
				<!-- START grid to set damage detail -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="law.suit.label.detail.damage"/></label>
				    <div id="jqGrid_lawsuitdamage_container" class="col-md-10">
				    	<table id="lawsuit_damage" class="scroll" cellpadding="0" cellspacing="0"></table> 
						<div id="damage_detail_pager" class="scroll" style="text-align:center;"></div>
				    </div>
				 </div>
				<!-- END grid to set damage detail -->
				<!-- START lawsuit.notes -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
					<div class="col-md-10">
						<textarea id="lawsuit.note" name="lawsuit.note" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='lawsuit.note'/></textarea>
					</div>									
				</div>
				<!-- END lawsuit.notes -->
<!-- 			</fieldset> -->

			<input id="lawSuitStatus.docName" name="lawSuitStatus.docName" class="form-control" value="<s:property value='lawSuitStatus.docName'/>" type="hidden">
			<input id="lawSuitStatus.docType" name="lawSuitStatus.docType" class="form-control" value="<s:property value='lawSuitStatus.docType'/>" type="hidden">

				<!-- START lawSuitStatus.attachement -->
				<s:if test="fieldErrors.get('file')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.attachement"/></label>
						<div class="col-md-10">
							<input type="file" class="btn btn-default" id="file" name="file" onchange="getFileData(this);">
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('file')"/>
							</span> 
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="law.suit.label.attachement"/></label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default" id="file" name="file" onchange="getFileData(this);">
					</div>
				</div>
				</s:else>
				<!-- END lawSuitStatus.attachement -->
				
		
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancel" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="save" type="submit" class="btn btn-primary ladda-button" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../../../base/validation.jsp"></jsp:include>
</div>
<!-- end widget -->
<script type="text/javascript">

function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#lawSuitStatus\\.docName").val(filename);
    $("#lawSuitStatus\\.docType").val('.'+fileExt);
    
 }
 
function isNumber(element){
	$(element).keyup(function(){
        var val1 = element.value;
        var num = new Number(val1);
        if(isNaN(num))
        {this.value="";alert("Please enter a valid number");}
    });	
}

	$(document).ready(function() {
		var damageArray=new Array();
// 		var numAdd=0;
		$('#lawsuit\\.birthdate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});
		$('#lawsuit\\.date').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});
		$('#lawsuit\\.personalId').mask("9999999999");
		$('#lawsuit\\.suitType').val('<s:property value="lawsuit.suitType.DOMVALUE"/>');
		$('#lawsuit\\.origin').val('<s:property value="lawsuit.origin.DOMVALUE"/>');
		var lastSel = 0;
		var rowId = 0;
		      		
		var lawsuit_damage = $("#lawsuit_damage");
        lawsuit_damage.jqGrid({
        	   url:'LegalSectorGrid.lawsuitDamage.do?lawsuitId='+$("#lawsuit\\.id").val(),	
               datatype: "json",
          	 	jsonReader : {
 			      root:"rows",
 			      page: "page",
 			      total: "total",
 			      records: "records",
 			      repeatitems: false,
 			      id: "0"
      			},
               colNames:['<s:text name="law.suit.label.law.suit.id"/>',
                         '<s:text name="law.suit.label.law.suit.damage.id"/>',
                         '<s:text name="report.damage.label.wood.type"/>',
                         'tree_species_id', 
                         '<s:text name="law.suit.grid.timber.number"/>', 
                         '<s:text name="law.suit.grid.timber.diameter.stump"/>',
                         '<s:text name="law.suit.grid.timber.diameter.in.1.3"/>',
                         '<s:text name="law.suit.grid.timber.height"/>',
                         '<s:text name="law.suit.label.volume.damage"/>',
                         '<s:text name="law.suit.grid.volume.unit.price"/>',
                         
                         '<s:text name="law.suit.label.damage.euro"/>',
                         '<s:text name="law.suit.label.is.new"/>'],
	       	   colModel:[
// 					{name:'id',index:'id', width:'100%', hidden:false, editable:false},	
					{name:'lawsuit_id',index:'lawsuit_id', width:'100%', hidden:true, editable:false},
					{name:'lawsuit_damage_id',index:'lawsuit_damage_id', width:'100%', hidden:true, editable:false},
					{ name: 'tree_species', index: 'tree_species', width: '200%', align: 'left', editable: true,
						editoptions:{
					        dataInit:function(el){ 
					    	    $(el).select2({
					    			placeholder: '-- Select --',                	        
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
					                formatResult : function(item){
					                	return item.name; 
					                },
					                formatSelection: function(item){
					                    var ids = lawsuit_damage.jqGrid('getDataIDs');
					                    for (var i = 0; i < ids.length + 1; i++) {
					                    	$('#' + ids[i] + '_tree_species_id').val(item.id);
					                    }                                             	
					                    return item.name;
					                },	        
					    	        allowClear: true,
					    	        dropdownCssClass: "bigdrop",
					    	        escapeMarkup: function (m) { return m; }
					    	    });                			                        
					        }
						}
					},	     	
	       	   		{name:'tree_species_id',index:'tree_species_id', width:'100%', editable:true,hidden:true},
	       	   		{name:'timberNumber',index:'timberNumber', width:'100%', editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	       	   		{name:'timberDiameterStump',index :'timberDiameterStump', width:'115%', align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	       	   		{name:'timberDiameter13',index:'timberDiameter13', width:'110%', align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},		
	       	   		{name:'timberHeight',index:'timberHeight', width:'100%',align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
		       	   	{name:'volumeDamage',index:'volumeDamage', width:'100%', align:"right", editable:true, editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	       	   		{name:'volumeUnitPrice',index:'volumeUnitPrice', width:'100%', align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	       	   		{name:'damageEuro',index:'damageEuro', width:'100%', align:"right", editable:true, editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	       	  	 	{name:'isnew',index:'isnew', width:'100%', hidden:true, editable:false},
	       	   	
	       	   	],
               sortname: "id",
               rowNum:10,
       	   	   rowList:[10,20,30],
               viewrecords: true,
               sortorder: "asc",
               width: '100%',
               height: '100%',
               autowidth: true,
       		   shrinkToFit: true,
       		   gridview: true,
               headertitles: true,
               loadonce: true,
               rowEdit: true,   
               rowsubmit: 'clientArray',
               cellsubmit : 'clientArray',
               cmTemplate: {sortable:false},
               editurl: 'clientArray',                           
               pager: "#damage_detail_pager",
               loadtext:'Loading, please wait',
               add:true,
               keys : true, 
               ajaxGridOptions: { contentType: "application/json"},
               serializeGridData: function (data) {
                   //alert($.toJSON(data));
                   return JSON.stringify(damageArray);
                   //return $.toJSON(data);
               },
               loadBeforeSend: function (xhr, settings) {
                   if(!$("#lawsuit\\.id").val()){
	            	   this.p.loadBeforeSend = null; //remove event handler
	            	   return false; // dont send load data request
                   }
            	},
               gridComplete: function () {
               },
               afterSaveCell: function (rowid, name, val, iRow, iCol) {
               },
               oneditfunc: function() {
                   alert ("edited"); 
               },
               onSelectRow: function(id){
                  
            	   if (id && id !== lastSel) {
                       $("#lawsuit_damage").jqGrid('restoreRow', lastSel); 
                       $("#lawsuit_damage").jqGrid('saveRow', id);
                       $("#lawsuit_damage").editRow(id, true);
                   } else {
                	   $("#lawsuit_damage").jqGrid('restoreRow', lastSel); 
                	   $("#lawsuit_damage").editRow(id, true);
                   }
            	   lastSel = id;
      
               }
               
           }).navGrid('#damage_detail_pager',{edit:false,add:false,del:false,search:false})
          	.navButtonAdd('#damage_detail_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.add"/>", 
            	   buttonicon:"ui-icon-plus", 
            	   onClickButton: function(){ 
            		   $("#lawsuit_damage").jqGrid('saveRow', rowId);
            		   rowId++;
            		   var parameters =
                       {
                           rowID: rowId,
                           initdata: {
                               id: rowId,
                        	   woodType: "",
                        	   timberNumber: "",
                        	   lawsuit_id:"",
                        	   isnew:"true"
                               //IdField: $('#IdField').val(),
                               //Description: $('#IdField option:selected').text()
                           },
                           position: "last",
                           useDefValues: true,
                           useFormatter: false,
                           addRowParams: { extraparam: {} }
                       };

                   $("#lawsuit_damage").jqGrid('addRow', parameters);
                                   	   
            		   
            	   }, 
            	   position:"last"
            })           
          	.navButtonAdd('#damage_detail_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.save"/>", 
            	   buttonicon:"ui-icon-disk", 
            	   onClickButton: function(){ 
            		   var selr = jQuery('#lawsuit_damage').jqGrid('getGridParam','selrow'); 
            		   $("#lawsuit_damage").jqGrid('saveRow', selr);
            	   }, 
            	   position:"last"
            	})
          	.navButtonAdd('#damage_detail_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.delete"/>", 
            	   buttonicon:"ui-icon-trash", 
            	   onClickButton: function(){ 
                	   
            		   var selr = jQuery('#lawsuit_damage').jqGrid('getGridParam','selrow'); 
            		   if(selr){
            		   		$('#lawsuit_damage').jqGrid('delRowData', selr);
            		   }
            	   }, 
            	   position:"last"
            	});            	

           $("#lawsuit_damage").jqGrid('navGrid','#damage_detail_pager',{},{width:1000});
          // $("#lawsuit_damage").jqGrid('editGridRow',"new",{height:280,reloadAfterSubmit:false});
	        $(window).bind('resize', function() {
	            var width = $('#jqGrid_lawsuitdamage_container').width();
	            $('#lawsuit_damage').setGridWidth(width);
	        });
	        $("#lawsuit\\.organisation\\.orgaName").select2({
	            minimumInputLength: 1,
	            ajax: {
	    	        url: "Input.organisation.do",
	    	        dataType: 'json',
	    	        quietMillis: 250,
	    	        data: function (term, page) {
	    	        if(term == "") term = " ";   
	    	        return {
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
	            	$("#lawsuit\\.organisation\\.id").val(item.id);
	            	$("#lawsuit\\.organisation\\.orgaName").val(item.name);
	                return item.name;
	            },
	            allowClear: true,
	            escapeMarkup: function (m) { return m; }
	        });    

	        $("#lawsuit\\.organisation\\.orgaName").select2("data", {id: "<s:property value='lawsuit.organisation.id'/>", name: "<s:property value="lawsuit.organisation.orgaName"/>"});

		    $("#lawsuit\\.employee\\.firstName").select2({
	            minimumInputLength: 1,
	            ajax: {
	    	        url: "Input.employee.do",
	    	        dataType: 'json',
	    	        quietMillis: 250,
	    	        data: function (term, page) {
	    	        if(term == "") term = " ";   
	    	        return {
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
	            	$("#lawsuit\\.employee\\.id").val(item.id);
	            	$("#lawsuit\\.employee\\.firstName").val(item.name);
	                return item.name;
	            },
	            allowClear: true,
	            escapeMarkup: function (m) { return m; }
	        });    
	        if($("#lawsuit\\.id").val().length>0){
	        	$("#lawsuit\\.employee\\.firstName").select2("data", {id: "<s:property value='lawsuit.employee.id'/>", name: "<s:property value="lawsuit.employee.firstName"/> <s:property value="lawsuit.employee.lastName"/>"});
	        }  

	    Ladda.bind('#save');
	    $("#save").on('click', function() {
			var this_form =$("#lawsuit_form");
			
			var ids = $('#lawsuit_damage').jqGrid('getDataIDs');
			for (var i = 0; i < ids.length+1; i++) {
			  $("#lawsuit_damage").jqGrid('saveRow', ids[i]);
			}
			var damageArray = $("#lawsuit_damage").jqGrid('getRowData');
		
			var jsonText = JSON.stringify(damageArray);
			$('<input>').attr({
				type : 'hidden',
				name : "jsonDamageDetail",
				value : jsonText
			}).appendTo(this_form);	
			$("#lawsuit_form :button").prop('disabled','disabled');
			$('#lawsuit_form').submit();
			
			return false;
		});
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "LawSuit.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#lawsuit_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C79121",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});

		(function() {
	
		
			$('form').ajaxForm({
				
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					$("#lawsuit_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#lawsuit_form_content").html(jqXHR.responseText);
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
						jQuery("#lawsuit_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
						//$("#farmer_expander").html(jqXHR.responseText);
					}	    	
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});				
			$("#lawsuit_form :button").prop('disabled',false);	
		})();
		
	});

	
</script>