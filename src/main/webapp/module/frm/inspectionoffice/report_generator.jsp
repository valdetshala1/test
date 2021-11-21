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
			<input id="user" name="user" type="hidden" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
				<div class="form-group" id="inspDr">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label class="radio radio-inline"> 
								</label>
								<div >
								<label id="cent" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="centralReport" value="centralReport"/>
									<span><s:text name='report.type.central.legend'/></span>
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
								<label id="emp" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="inspectorReport" value="inspectorReport"/>
									<span><s:text name='frm.inspector.label'/></span>
								</label>
							</div>
				</div>
				<hr>
				<div id="wildanimals">
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
				<!-- START report.planRegionId -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name='frm.compartment.region.name'/>:</label>
						<div class="col-md-10">
							<input id="region" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
							<input id="planRegionId" name="planRegionId" type="hidden">
						</div>
					</div>
				<!-- END report.planRegionId -->
				</div>
				<div id="municipalityR">
				<!-- START report.municipality -->
					<div class="form-group">	
						<label class="col-md-2 control-label">*<s:text name='bidder.cadastral.municipality'/>:</label>
						<div class="col-md-10">
							<input id="municipality" class="form-control" placeholder="<s:text name='bidder.cadastral.municipality'/>" type="text">
							<input id="municipalityId" type="hidden">
						</div>
					</div>	
				<!-- END report.municipality -->
				</div>
				<div id="inspectorR">
				<!-- START report.inspector -->
					<div class="form-group">	
						<label class="col-md-2 control-label">*<s:text name='frm.inspector.label'/>:</label>
						<div class="col-md-10">
							<input id="inspector" class="form-control" placeholder="<s:text name='frm.inspector.label'/>" type="text">
							<input id="inspectorId" type="hidden">
						</div>
					</div>	
				<!-- END report.inspector -->
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
</div>
<script type="text/javascript">

$(document).ready(function() {

	  $("#municipalityR").hide();  
	  $("#locationR").hide();  
	  $("#regionR").hide();
	  $("#inspectorR").hide();
	  
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
	  $("#report_generator input[name='reportType']").click(function(){
		 if($('input:radio[name=reportType]:checked').val() == "municipalityReport"){
				  $("#municipalityR").show();  
				  $("#regionR").hide(); 
				  $("#inspectorR").hide();
				  $("#inspector").val("");
				  $("#inspectorId").val(null);
				  $("#planRegionId").val(null);
				  $("#region").val("");
		    }
	    if($('input:radio[name=reportType]:checked').val() == "regionalReport"){
			  $("#municipalityR").hide();  
			  $("#inspectorR").hide();
			  $("#inspector").val("");
			  $("#inspectorId").val(null);
			  $("#municipalityId").val(null);
			  $("#municipality").val("");
			  $("#regionR").show();
	    }
	    if($('input:radio[name=reportType]:checked').val() == "centralReport"){
			  $("#municipalityR").hide();  
			  $("#regionR").hide();
			  $("#inspectorR").hide();
			  $("#municipalityId").val(null);
			  $("#region").val("");
			  $("#inspector").val("");
			  $("#inspectorId").val(null);
			  $("#municipality").val("");
			  $("#planRegionId").val("");
	    }
	    if($('input:radio[name=reportType]:checked').val() == "inspectorReport"){
			  $("#municipalityR").hide();  
			  $("#regionR").hide();
			  $("#municipalityId").val(null);
			  $("#region").val("");
			  $("#municipality").val("");
			  $("#planRegionId").val("");
			  $("#inspectorR").show();
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
		minLength: 2,
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
		minLength: 2,
		change: function(event, ui) {
		},
		select: function( event, ui ) {
			$( "#municipalityId" ).val( ui.item.id);
		},
		focus: function(event, ui) {
		}
	});

	 var user_role='<s:property value="user.getEmployee().getRoleCode()"/>';
	 		if(user_role=='IN'){
	 			$("#inspDr").hide();
	 			$("#inspector").val('<s:property value="user.getEmployee().getFirstName()"/>  <s:property value="user.getEmployee().getLastName()"/>');
	 			$("#inspectorId").val('<s:property value="user.getEmployee().getId()"/>');
	 			
	 		}else{
	 			$("#inspDr").show();
	 			$("#inspector").autocomplete({
	 				source: function( request, response ) {
	 					$.ajax({
	 						url: "Input.employee.do?role_code:IN&roleCodeInsp:ID",
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
	 				minLength: 2,
	 				change: function(event, ui) {
	 				},
	 				select: function( event, ui ) {
	 					$( "#inspectorId" ).val( ui.item.id);
	 				},
	 				focus: function(event, ui) {
	 				}
	 			});


	 			
	 			}
	 	
	
	$("#cancelR").on('click', function(){
		$("#report_generator_content").dialog("close");
	});
    
	$("#generator").on('click', function () {
		if( $("#periodStart").val() && $("#periodEnd").val() ){
			var parameters = "mun_id="+$("#municipalityId").val()+"&p_inspector="+$("#inspector").val()+"&start_period="+$("#periodStart").val()+"&end_period="+$("#periodEnd").val()+"&reg_id="+$("#planRegionId").val()+"&p_emp_id="+$( "#inspectorId" ).val()+"&p_user="+$("#user").val();
			//var link="frm/inspectionoffice/";
			var link="\\frm\\inspectionoffice";
			var doc_format=$('input[name=reportFormat]:checked').val();
			var doc_name="";
			if($("#municipalityId").val()){
				//openBirtViewer(link+"/municipality_report.rptdesign", parameters);
				doc_name="<s:text name='report.docname.municipality'/>";
				link=link+"/municipality_report.rptdesign";
				var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				//generateBIRTDoc(url);
				parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", parameters);
				}else if($("#planRegionId").val()){
				//openBirtViewer(link+"/regional_report.rptdesign", parameters);
					doc_name="<s:text name='report.docname.regional'/>";
					link=link+"/regional_report.rptdesign";
					var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					//generateBIRTDoc(url);
					parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					downloadDoc("BirtReportGen.do", parameters);
					}
			else if($("#inspectorId").val()){
				//openBirtViewer(link+"/inspector_report.rptdesign", parameters);
					doc_name="<s:text name='report.docname.inspector'/>";
					link=link+"/inspector_report.rptdesign";
					var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					//generateBIRTDoc(url);
					parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					downloadDoc("BirtReportGen.do", parameters);
				}
			else if($('input:radio[name=reportType]:checked').val() == "centralReport"){
				//openBirtViewer(link+"/central_report.rptdesign", parameters);
					doc_name="<s:text name='report.docname.central'/>";
					link=link+"/central_report.rptdesign";
					alert("Test");
					var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					//generateBIRTDoc(url);
					parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					downloadDoc("BirtReportGen.do", parameters);
				}
			else{
				alert("<s:text name="form.input.alert.empty"/>"); 
			}
		}else{
			alert("<s:text name="form.input.alert.select"/>"); 
		}
			
	});

});


			
</script>