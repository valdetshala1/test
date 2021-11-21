<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<jsp:include page="../../base/validation.jsp"></jsp:include>	
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="fire_form" class="form-horizontal" action="FireReportSave.do" accept-charset="utf8" method="post">
			<input id="fire.id" name="fire.id" value="<s:property value='fire.id'/>" type="hidden">
			<input id="fire.person.id" name="fire.person.id" value="<s:property value='fire.person.id'/>" type="hidden">
			<input id="fire.createdDate" name="fire.createdDate" value="<s:property value='fire.createdDate'/>" type="hidden">	
			<input id="munReadOnly" name="munReadOnly" value="<s:property value='munReadOnly'/>" type="hidden">	
			<input id="regReadOnly" name="regReadOnly" value="<s:property value='regReadOnly'/>" type="hidden">	
			<input id="fire.docName" name="fire.docName" value="<s:property value='fire.docName'/>" type="hidden">	
			<input id="fire.docType" name="fire.docType" value="<s:property value='fire.docType'/>" type="hidden">	
			<input id="isPoint" name="isPoint"  value="" type="hidden">
			
			<input id="firePoint.id" name="firePoint.id" value="<s:property value='firePoint.id'/>" type="hidden">
			<input id="firePolygon.id" name="firePolygon.id" value="<s:property value='firePolygon.id'/>" type="hidden">
			
			<input id="pointFire" name="pointFire"  value="<s:property value='pointFire'/>" type="hidden">
			<input id="polygonFire" name="polygonFire"  value="<s:property value='polygonFire'/>" type="hidden">			
			
			<fieldset>
				<legend><s:text name="fire.report.type.view"/></legend>	
				<div class="form-group">
					<!-- START fire.region -->
					<s:if test="fieldErrors.get('fire.region')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="frm.compartment.region.name"/></label>
							<div class="col-md-4">
								<input  id="fire.region.name" name="fire.region.name" class="form-control" type="text">
								<input  id="fire.region.id" name="fire.region.id" type="hidden">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.region')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="frm.compartment.region.name"/></label>
							<div class="col-md-4">
								<input id="fire.region.name" name="fire.region.name" value="<s:property value='fire.region.name'/>" class="form-control" type="text">
								<input  id="fire.region.id" name="fire.region.id" value="<s:property value='fire.region.id'/>" type="hidden">
							</div>					 				
						</div>
					</s:else>
					<!-- END fire.region -->
					
					<!-- START fire.cadastralMunicipality -->
					<s:if test="fieldErrors.get('fire.cadastralMunicipality')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="frm.inspection.cadastralMunicipality.name"/></label>
							<div class="col-md-4">
								<input  id="fire.cadastralMunicipality.name" name="fire.cadastralMunicipality.name" class="form-control" type="text">
								<input  id="fire.cadastralMunicipality.id" name="fire.cadastralMunicipality.id" type="hidden">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.cadastralMunicipality')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="frm.inspection.cadastralMunicipality.name"/></label>
							<div class="col-md-4">
								<input id="fire.cadastralMunicipality.name" name="fire.cadastralMunicipality.name" value="<s:property value='fire.cadastralMunicipality.name'/>" class="form-control" type="text">
								<input  id="fire.cadastralMunicipality.id" name="fire.cadastralMunicipality.id" value="<s:property value='fire.cadastralMunicipality.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
					<!-- END fire.cadastralMunicipality -->
				</div>
				
				<div class="form-group">
					<!-- START fire.managementUnit -->
					<s:if test="fieldErrors.get('fire.managementUnit')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="frm.compartment.mgmt.unit"/></label>
							<div class="col-md-4">
								<input  id="fire.managementUnit.muName" name="fire.managementUnit.muName" class="form-control" type="text">
								<input  id="fire.managementUnit.id" name="fire.managementUnit.id" type="hidden">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.managementUnit')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="frm.compartment.mgmt.unit"/></label>
							<div class="col-md-4">
								<input id="fire.managementUnit.muName" name="fire.managementUnit.muName" value="<s:property value='fire.managementUnit.muName'/>" class="form-control" type="text">
								<input  id="fire.managementUnit.id" name="fire.managementUnit.id" value="<s:property value='fire.managementUnit.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
					<!-- END fire.managementUnit -->
					
					<!-- START fire.fireType -->
					<s:if test="fieldErrors.get('fire.fireType')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label"><s:text name="fire.fire.type"/></label>
							<div class="col-md-4">
								<input maxlength="255" id="fire.fireType" name="fire.fireType" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.fireType')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label"><s:text name="fire.fire.type"/></label>
							<div class="col-md-4">
								<input maxlength="255" id="fire.fireType" name="fire.fireType" value="<s:property value='fire.fireType'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END fire.fireType -->
				</div>
				<div class="row">
						<button id="reportPointBtn" type="button" class="btn btn-primary btn-lg btn-block" style=" height: 32px; margin-top: 15px;padding-top: 5px;padding-bottom: 5px;">
									<s:text name='frm.fire.report.point.btn'/>
						</button>
				</div>
				</br>
				<div class="row">
				<div class="form-group">
					<!-- START fire.fireCause -->
					<s:if test="fieldErrors.get('fire.fireCause')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label"><s:text name="fire.fire.cause"/></label>
							<div class="col-md-4">
								<input  id="fire.fireCause" name="fire.fireCause" class="form-control">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.fireCause')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label"><s:text name="fire.fire.cause"/></label>
							<div class="col-md-4">
								<input id="fire.fireCause" name="fire.fireCause" value="<s:property value='fire.fireCause'/>" class="form-control">
							</div>									
						</div>
					</s:else>
					<!-- END fire.fireCause -->
					
					<!-- START fire.occurrenceDate -->
					<s:if test="fieldErrors.get('fire.occurrenceDate')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="fire.occurrence.date"/></label>
							<div class="col-md-4">
								<input  id="fire.occurrenceDate" name="fire.occurrenceDate" class="form-control">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.occurrenceDate')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="fire.occurrence.date"/></label>
							<div class="col-md-4">
								<input id="fire.occurrenceDate" name="fire.occurrenceDate" value="<s:property value='fire.occurrenceDate'/>" class="form-control">
							</div>									
						</div>
					</s:else>
					<!-- END fire.occurrenceDate -->
				
			
				</div>
			</div>
			<legend><s:text name="fire.declare.controle.type.view"/>
				<button id="reportPolygonBtn" type="button" class="btn btn-primary btn-lg btn-block" style=" height: 32px; margin-top: 15px;padding-top: 5px;padding-bottom: 5px;">
						<s:text name='frm.fire.report.polygon.btn'/>
				</button>
			</legend>
				<div class="form-group">
				<!-- START fire.extinguishDate -->
					<s:if test="fieldErrors.get('fire.extinguishDate')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="fire.extinguish.date"/></label>
							<div class="col-md-4">
								<input  id="fire.extinguishDate" name="fire.extinguishDate" class="form-control">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.extinguishDate')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="fire.extinguish.date"/></label>
							<div class="col-md-4">
								<input id="fire.extinguishDate" name="fire.extinguishDate" value="<s:property value='fire.extinguishDate'/>" class="form-control">
							</div>									
						</div>
					</s:else>
					<!-- END fire.extinguishDate -->
					
					<!-- START fire.extinguishedBy -->
					<s:if test="fieldErrors.get('fire.extinguishedBy')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label"><s:text name="fire.extinguish.by"/></label>
							<div class="col-md-4">
								<input maxlength="100" id="fire.extinguishedBy" name="fire.extinguishedBy" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.extinguishedBy')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label"><s:text name="fire.extinguish.by"/></label>
							<div class="col-md-4">
								<input maxlength="100" id="fire.extinguishedBy" name="fire.extinguishedBy" value="<s:property value='fire.extinguishedBy'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END fire.extinguishedBy -->
				</div>
				
			</fieldset>
			
			
			<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="fire.public.forest.legend"/></label>
						<div class="col-md-10">
							<input id="inPubForest" name="inPubForest"  value="<s:property value='inPubForest'/>" type="checkbox">
						</div>
				</div>
			<fieldset id="pubForest">
			
				<div id="fire_details_grid_content">
					<jsp:include page="fire_details_grid.jsp"></jsp:include>
				</div>
				
				<s:if test="fieldErrors.get('fireDetails')!=null"> 
					<div class="has-error">
						<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fireDetails')"/> </span>
						<input id="empty_grid" value="true" type="hidden">
					</div>
				</s:if>
				<s:else>
					<input id="empty_grid" value="false" type="hidden">
				</s:else>
			</fieldset>	
			<div class="form-group">
				<label class="col-md-2 control-label"><s:text name="fire.private.forest.legend"/></label>
				<div class="col-md-10">
					<input id="inPvtForest" name="inPvtForest"  value="<s:property value='inPvtForest'/>" type="checkbox">
				</div>
			</div>
				
			<fieldset id="pvtForest">
				
				<div class="form-group">
					<!-- START fire.pvtDamageM3 -->
					<s:if test="fieldErrors.get('fire.pvtDamageM3')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label"><s:text name="fire.damage.m3"/></label>
							<div class="col-md-4">
								<input  data='number' id="fire.pvtDamageM3" name="fire.pvtDamageM3" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.pvtDamageM3')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label"><s:text name="fire.damage.m3"/></label>
							<div class="col-md-4">
								<input data='number' id="fire.pvtDamageM3" name="fire.pvtDamageM3" value="<s:property value='fire.pvtDamageM3'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END fire.pvtDamageM3 -->
					
					<!-- START fire.pvtDamageM2 -->
					<s:if test="fieldErrors.get('fire.pvtDamageM2')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label"><s:text name="fire.damage.m2"/></label>
							<div class="col-md-4">
								<input  data='number' id="fire.pvtDamageM2" name="fire.pvtDamageM2" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.pvtDamageM2')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label"><s:text name="fire.damage.m2"/></label>
							<div class="col-md-4">
								<input data='number' id="fire.pvtDamageM2" name="fire.pvtDamageM2" value="<s:property value='fire.pvtDamageM2'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END fire.pvtDamageM2 -->
				</div>
				
				<div class="form-group">
					<!-- START fire.pvtDamageEuro -->
					<s:if test="fieldErrors.get('fire.pvtDamageEuro')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label"><s:text name="fire.damage.euro"/></label>
							<div class="col-md-4">
								<input  data='number' id="fire.pvtDamageEuro" name="fire.pvtDamageEuro" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fire.pvtDamageEuro')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label"><s:text name="fire.damage.euro"/></label>
							<div class="col-md-4">
								<input data='number' id="fire.pvtDamageEuro" name="fire.pvtDamageEuro" value="<s:property value='fire.pvtDamageEuro'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END fire.pvtDamageEuro -->
				</div>
			</fieldset>
			
			<div class="form-group">
				<!-- START fire.proposedAction -->
				<label class="col-md-2 control-label"><s:text name="fire.proposed.action"/>:</label>
		 	  	<div class="col-md-4">
		      		<input id="fire.proposedAction" name="fire.proposedAction" class="form-control" value="<s:property value='fire.proposedAction'/>">
		      	</div> 
				<!-- END fire.proposedAction -->
				
				<!-- START fire.comment -->
				<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/>:</label>
		 	  	<div class="col-md-4">
		      		<textarea id="fire.comment" name="fire.comment" class="form-control" ><s:property value='fire.comment'/></textarea>
		      	</div> 
				<!-- END fire.comment -->
			</div>
			<div class="form-group">
				<!-- START fire.doc -->
				<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
				<div class="col-md-4">
					<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
				</div>
				<!-- END fire.doc -->
			</div>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFR" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFR" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>

			

		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
		
<script type="text/javascript">
	function getFileData(myFile){
	    var file = myFile.files[0];  
	    var filename = file.name;
	    var fileExt = filename.split('.').pop();
	    $("#fire\\.docName").val(filename);
	    $("#fire\\.docType").val('.'+fileExt);
	}
 	var windowWidth;
	var windowHeight;
	$(document).ready(function () {
		windowWidth = $(window).width();
		windowHeight = $(window).height();
		$(window).bind('resize', function() {
			windowWidth = $(window).width();
			windowHeight = $(window).height();
        });
		$("#reportPointBtn").hide();
		$("#reportPolygonBtn").hide();
		if($("#fire\\.cadastralMunicipality\\.id").val()){
			$("#reportPointBtn").show();
			$("#reportPolygonBtn").show();
			}
		
		 $("#reportPointBtn").on('click',function(){
			 	$("#isPoint").val(true);
				var link="FireReport.fireMapAction.do";
				openDialogForm('fire_point_popup_content', link,"Cakto piken e fillimit te zjarrit" ,windowWidth,windowHeight);
			 });
		
		 $("#reportPolygonBtn").on('click',function(){
			    $("#isPoint").val(false);
				var link="FireReport.fireMapAction.do";
				openDialogForm('fire_polygon_popup_content', link, "Cakto poligonin qe ka perfshier zjarri",windowWidth,windowHeight);
		 });
		 
		var empty_grid=$("#empty_grid").val();
		var inpub=$('#inPubForest').val();
		$('#inPubForest').on('change',function(event){
			$('#inPubForest').val($('#inPubForest')[0].checked ? "true" : "false" );
			inpub=$('#inPubForest').val();
			if(inpub=="true"){
				$("#pubForest").show();
			}else{
				$("#pubForest").hide();
			}
		});

		if(inpub=="true"){
			$("#inPubForest").prop('checked',true);
			$("#pubForest").show();
		}else{
			$("#inPubForest").prop('checked', false);
			$("#pubForest").hide();
		}

		var inpvt=$('#inPvtForest').val();
		$('#inPvtForest').on('change',function(event){
			$('#inPvtForest').val($('#inPvtForest')[0].checked ? "true" : "false" );
			inpvt=$('#inPvtForest').val();
			if(inpvt=="true"){
				$("#pvtForest").show();
			}else{
				$("#pvtForest").hide();
			}
		});

		if(inpvt=="true"){
			$("#inPvtForest").prop('checked',true);
			$("#pvtForest").show();
		}else{
			$("#inPvtForest").prop('checked', false);
			$("#pvtForest").hide();
		}
		
		$("input[data='number']").autoNumeric('init', {
			aDec: '.', 
			aSep: ',', 
			mDec: '2'
		});
		$('#fire\\.occurrenceDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y H:m:s',
 			mask: false,
 			formatDate:'d.m.Y H:m:s',
			timepicker: true,
		});
		$('#fire\\.extinguishDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y H:m:s',
 			mask: false,
 			formatDate:'d.m.Y H:m:s',
			timepicker: true,
		});
		if(!$("#fire\\.region\\.id").val()){
			$("#fire\\.managementUnit\\.muName").prop('readonly',true);
			$("#fire\\.cadastralMunicipality\\.name").prop('readonly',true);
		}else{
			$("#fire\\.managementUnit\\.name").prop('readonly',false);
			$("#fire\\.cadastralMunicipality\\.name").prop('readonly',false);
		}
		if(!$("#fire\\.managementUnit\\.id").val()){
			$("#add_button").addClass("ui-state-disabled");
			$("#save_button").addClass("ui-state-disabled");
			$("#delete_button").addClass("ui-state-disabled");
		}
		$("#fire\\.region\\.name").select2({
	        placeholder: "",
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
            formatResult : formatResult,
            formatSelection: function(item){
                if(item.id){
	            	$("#fire\\.region\\.id").val(item.id);
	            	$("#fire\\.region\\.name").val(item.name);
	            	
	            	$("#fire\\.managementUnit\\.muName").select2("data", {id: "", name:""});
	            	$("#fire\\.cadastralMunicipality\\.name").select2("data", {id: "", name:""});
	            	$("#fire\\.managementUnit\\.id").val(null);
	            	$("#fire\\.cadastralMunicipality\\.id").val(null);

	            	$("#fire\\.managementUnit\\.muName").prop('readonly',false);
	    			$("#fire\\.cadastralMunicipality\\.name").prop('readonly',false);
                }
	            return item.name;
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 
	    if($("#fire\\.region\\.id").val()){
			var reg_name=$("#fire\\.region\\.name").val();
			$("#fire\\.region\\.name").select2("data", {id: "<s:property value='fire.region.id'/>", name:reg_name});
	    }

	    $("#fire\\.cadastralMunicipality\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 0,
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
		        	region_id: $("#fire\\.region\\.id").val(), 
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
            formatResult : formatResult,
            formatSelection: function(item){
                if(item.id){
	            	$("#fire\\.cadastralMunicipality\\.id").val(item.id);
	            	$("#fire\\.cadastralMunicipality\\.name").val(item.name);
	            	$("#reportPointBtn").show();
	    			$("#reportPolygonBtn").show();
	               }
	            return item.name;
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 
	    if("<s:property value='fire.cadastralMunicipality.id'/>"){
			var mun_name=$("#fire\\.cadastralMunicipality\\.name").val();
			$("#fire\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='fire.cadastralMunicipality.id'/>", name:mun_name});
	    }
	    
	    $("#fire\\.managementUnit\\.muName").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.managementUnit.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	name_startsWith: term,
		        	reg_id: $("#fire\\.region\\.id").val(), 
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
            formatResult : formatResult,
            formatSelection: function(item){
                if(item.id){
                	$("#add_button").removeClass("ui-state-disabled");
        			$("#save_button").removeClass("ui-state-disabled");
        			$("#delete_button").removeClass("ui-state-disabled");
        			var old_id="<s:property value='fire.managementUnit.id'/>";
        			if(old_id!=item.id){
	            		$("#empty_grid").val(true);
	            		$('#fire_details').jqGrid('clearGridData');
	            	}else if(old_id!='' && empty_grid=='false'){
	            		$("#empty_grid").val(false);
	            		jQuery("#fire_details").jqGrid('setGridParam',{url:"FrmGrid.fireDetails.do?fire_id="+$("#fire\\.id").val(), datatype:"json"}).trigger('reloadGrid');
		            }
	            	$("#fire\\.managementUnit\\.id").val(item.id);
	            	$("#fire\\.managementUnit\\.muName").val(item.name);
                }
	            return item.name;
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 
	    if("<s:property value='fire.managementUnit.id'/>"){
			var mu_name=$("#fire\\.managementUnit\\.muName").val();
			$("#fire\\.managementUnit\\.muName").select2("data", {id: "<s:property value='fire.managementUnit.id'/>", name:mu_name});
	    }

	    if($("#regReadOnly").val()=='true'){
// 			$("#fire\\.region\\.name").prop('readonly',true);
			$("#fire\\.region\\.name").prop('readonly',true);
		}
		if($("#munReadOnly").val()=='true'){
			$("#fire\\.cadastralMunicipality\\.name").prop('readonly',true);
		}

		$("#cancelFR").on('click', function () {
			$.ajax({
				type : "GET",
				url : "FireReport.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#fire_form_content").html(jqXHR.responseText);
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
		$("#saveFR").on('click', function () {
			var this_form =$("#fire_form");
			
			var ids = $("#fire_details").jqGrid('getDataIDs');
			for (var i = 0; i < ids.length+1; i++) {
				$("#fire_details").jqGrid('saveRow', ids[i]);
			}
			var fireArray = $("#fire_details").jqGrid('getRowData');

			var jsonText = JSON.stringify(fireArray);
			$('<input>').attr({
				type : 'hidden',
				name : "jsonDetails",
				value : jsonText
			}).appendTo(this_form);
			
			$("#fire_form :button").prop('disabled','disabled');
			$('#fire_form').submit();
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
					$("#fire_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#fire_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#fire_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}	    	
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});				
			$("#fire_form :button").prop('disabled',false);	
		})();
	});            
</script>