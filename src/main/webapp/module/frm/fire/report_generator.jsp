<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="report_generator_content">
			<div id="report_generator" class="form-horizontal">
			<input id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>" type="hidden">
				<div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label class="radio radio-inline"> 
								</label>
								<label id="kfa" class="radio radio-inline"> 
								<input type="radio" class="radiobox" name="reportType" id="KFAReport" value="KFAReport" checked="checked"/>
									<span><s:text name="report.type.kfa.level"/></span>
								</label>
								<label id="reg" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="regionalReport" value="regionalReport"/>
									<span><s:text name='report.type.regional.legend'/></span>
								</label>
								<label id="mun" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="municipalityReport" value="municipalityReport"/>
									<span><s:text name='bidder.cadastral.municipality'/></span>
								</label>
							</div>
				</div>
				<hr>
				<!-- START report.periodStart -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.start.date'/>:</label>
						<div class="col-md-10">
							<input id="periodStart" name="periodStart" class="form-control" placeholder="<s:text name='hrm.skill.label.start.date'/>" type="text">
						</div>									
					</div>
				<!-- END report.periodStart -->
				<!-- START report.periodEnd-->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.end.date'/>:</label>
						<div class="col-md-10">
							<input id="periodEnd" name="periodEnd" class="form-control" placeholder="<s:text name='hrm.skill.label.end.date'/>" type="text">
						</div>									
					</div>
				<!-- END report.periodEnd -->
				<div id="regionR">
				<!-- START report.month -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name='frm.compartment.region.name'/>:</label>
						<div class="col-md-10">
							<input id="region" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
							<input id="planRegionId" name="planRegionId" type="hidden">
						</div>
					</div>
				<!-- END report.month -->
				</div>
				<div id="municipalityR">
				<!-- START report.month2 -->
					<div class="form-group">	
						<label class="col-md-2 control-label">*<s:text name='bidder.cadastral.municipality'/>:</label>
						<div class="col-md-10">
							<input id="municipality" class="form-control" placeholder="<s:text name='bidder.cadastral.municipality'/>" type="text">
							<input id="municipalityId" type="hidden">
						</div>
					</div>	
				<!-- END report.month2 -->
				</div>
					 <div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label id="exc" class="radio radio-inline"> 
								<input type="radio" class="radiobox" name="reportFormat" id="pdfReport" value="pdf" checked="checked"/>
									<span>PDF</span>
								</label>
								<label id="perf" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportFormat" id="wordReport" value="doc"/>
									<span>WORD</span>
								</label>
								<label id="strat" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportFormat" id="excelReport" value="xls"/>
									<span>EXCEL</span>
								</label>
							</div>
				</div>
				
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelR" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="generator" class="btn btn-primary" type="submit">
							<i class="fa fa-print"></i>
							<s:text name='label.button.generate.report'/>
						</button>
					</div>
				</div>
			</div>
			
			</div>
</div>
<script type="text/javascript">

$(document).ready(function() {
	var activityName='central';
	var doc_name='central';
	$('#periodStart').datetimepicker({
		lang: 'al',
		format: 'Y-m-d',
		mask: false,
		formatDate:'Y-m-d',
		timepicker: false,
    			
	});
	$('#periodEnd').datetimepicker({
		lang: 'al',
		format: 'Y-m-d',
		mask: false,
		formatDate:'Y-m-d',
		timepicker: false,
				
	});

	var opl_val='<s:property value="user.organisation.operLevelVal"/>';
	var user_region=null;
	  $("#municipalityR").hide();  
	  $("#regionR").hide();
	if(opl_val!='C'){
		$("#kfa").hide();
		$("#kfa").prop("disabled","disabled");
		if(opl_val=='M'){
// 			user_mun='<s:property value="user.getCadastralMunicipality().getId()"/>';
// 			$( "#municipalityId" ).val(user_mun);
			$("#reg").hide();
			$("#reg").prop("disabled","disabled");
			$("#municipalityReport").prop('checked',true);
			$("#municipalityR").show();
			activityName='municipality';
		}else if(opl_val=='R'){
			user_region='<s:property value="user.getRegion().getId()"/>';
			if(user_region!=null && user_region!=''){
				$("#planRegionId").val(user_region);
				$("#regionalReport").prop('checked',true);
				$("#regionR").hide();
				activityName='regional';
			}
		}
	}
 
	$("#report_generator input[name='reportType']").click(function(){
	    if($('input:radio[name=reportType]:checked').val() == "municipalityReport"){
			  $("#municipalityR").show();  
			  $("#regionR").hide(); 
			  $("#planRegionId").val(null);
			  $("#region").val("");
			  activityName='municipality';
			  doc_name="<s:text name='report.docname.municipality'/>";
			  
	    }

	    if($('input:radio[name=reportType]:checked').val() == "regionalReport"){
			  $("#municipalityR").hide();  
			  $("#municipalityId").val(null);
			  $("#municipality").val("");
			  if(user_region!=null && user_region!=''){
				  $("#regionR").hide();
				  $("#planRegionId").val(user_region);
			  }else{
			  		$("#regionR").show();
			  }
			  activityName='regional';
			  doc_name="<s:text name='report.docname.regional'/>";
	    }

	    if($('input:radio[name=reportType]:checked').val() == "KFAReport"){
			  $("#municipalityR").hide();  
			  $("#regionR").hide();
			  $("#municipalityId").val(null);
			  $("#region").val("");
			  $("#municipality").val("");
			  $("#planRegionId").val("");
			  activityName='central';
			  doc_name="<s:text name='report.docname.kfa'/>";
	    }
	    
	});
	$("#region").autocomplete({
		source: function( request, response ) {
			$.ajax({
				url: "Input.region.do",
				dataType: "json",
				data: {
					featureClass: "P",
					style: "full",
					maxRows: 12,
					minLength: 1,
					name_startsWith: request.term
				},
				success: function( data ) {
					response( $.map( data, function(item) {
						return {
							label: item.name, 
							value: item.name,
							id: item.id 
						};
					}));
				}
			});
		},
		maxRows: 12,
		minLength: 1,
		change: function(event, ui) {
		},
		select: function( event, ui ) {
			$( "#planRegionId" ).val( ui.item.id);
		},
		focus: function(event, ui) {
		}
	});	
	$("#municipality").autocomplete({
		source: function( request, response ) {
			$.ajax({
				url: "Input.municipality.do?",
				dataType: "json",
				data: {
					featureClass: "P",
					style: "full",
					maxRows: 12,
					minLength: 1,
					name_startsWith: request.term
				},
				success: function( data ) {
					response( $.map( data, function(item) {
						return {
							label: item.name, 
							value: item.name,
							id: item.id 
						};
					}));
				}
			});
		},
		maxRows: 12,
		minLength: 1,
		change: function(event, ui) {
		},
		select: function( event, ui ) {
			$( "#municipalityId" ).val( ui.item.id);
		},
		focus: function(event, ui) {
		}
	});
	
	$("#cancelR").on('click', function(){
		$("#fire_report_generator").dialog("close");
	});
	$("#fire_report_generator").on('remove', function(){
		$("#fire_print").removeClass("ui-state-disabled");
	});
	$("#generator").on('click', function () {
		if($("#periodStart").val() && $("#periodEnd").val()){
			var parameters = "p_mun_id="+$("#municipalityId").val()+"&p_period_start="+$("#periodStart").val()+"&p_period_end="+$("#periodEnd").val()+"&p_region_id="+$("#planRegionId").val()+"&p_user="+$("#user").val();	
			//var link="frm/fire/"+activityName+"_fire_report.rptdesign";
			var link="\\frm\\fire\\"+activityName+"_fire_report.rptdesign";
			//openBirtViewer(link, parameters);
			var doc_format=$('input[name=reportFormat]:checked').val();
			var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			//generateBIRTDoc(url);
			parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			downloadDoc("BirtReportGen.do", parameters);
		}else{
			alert("<s:text name="form.input.empty.alert"/>"); 
		}
	});
});


			
</script>