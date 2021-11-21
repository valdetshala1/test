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
			<input id="munReadOnly" name="munReadOnly" value="<s:property value='munReadOnly'/>" type="hidden">	
			<input id="munName" name="munName" value="<s:property value='munName'/>" type="hidden">	
			<input id="munId" name="munId" value="<s:property value='munId'/>" type="hidden">	
				<div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div id="report_type_buttons" class="col-md-10">
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
				<!-- START report.type -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='annu.seedling.label.activity'/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="activityName"
								name="activityName">
								<s:iterator value="tables" var="st">
									<option value="<s:property value="#st.getNameEn()"/>">
											<s:property value="#st.getNameAl()"/>
									</option>
								</s:iterator>
							</select>
					
						</div>									
					</div>
				<!-- END report.year -->
				
				<!-- START report.year -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='report.wood.production.label.year'/>:</label>
						<div class="col-md-10">
							<input id="planYear" name="planYear" class="form-control" placeholder="<s:text name='report.wood.production.label.year'/>" type="text">
						</div>									
					</div>
				<!-- END report.year -->
				<!-- START report.detail -->
					<div class="form-group" id="details">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.details'/>:</label>
						<div class="col-md-10">
							<input id="detail" name="detail" type="checkbox">
						</div>									
					</div>
				<!-- END report.detail -->
				<!-- START report.status -->
				<div class="form-group">
				<label class="col-md-2 control-label">*<s:text name="law.suit.label.status"/>:</label>
					<div class="col-md-10">
						<label class="col-md-4 control-label">
							<input type="radio" class="radiobox" id="sub" name="planStatus" value="SUB">
							<span><s:text name="report.status.draft"/></span>
						</label>
						<label class="col-md-4 control-label">
							<input type="radio" class="radiobox" id="apr" name="planStatus" value="APR">
							<span><s:text name="report.status.plan"/></span>
						</label>
						<label class="col-md-4 control-label" id="impLabel">
							<input type="radio" class="radiobox" id="imp" name="planStatus" value="IMP">
							<span><s:text name="planting.stand.legend.implementation"/></span>
						</label>
					</div>
				</div>
				<!-- END report.status -->
				<div id="periodR">
					<div class="form-group">
					<label class="col-md-2 control-label" for="select-1"><s:text name='fin.allocation.label.period'/>:</label>
					<div class="col-md-10">
							<input id="period" name="period" type="checkbox">
					</div>
					</div>
				</div>
				<div id="peridical">
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
				</div>
				<div id="regionR">
				<!-- START report.month -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1"><s:text name='frm.compartment.region.name'/>:</label>
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
						<label class="col-md-2 control-label"><s:text name='bidder.cadastral.municipality'/>:</label>
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
	var status='';
	var report_type='';
	var type='';
	var temp='';
	$('#periodStart').datetimepicker({
		lang: 'al',
		format: 'Y.m.d',
		mask: false,
		formatDate:'Y.m.d',
		timepicker: false,
    			
	});
	$('#periodEnd').datetimepicker({
		lang: 'al',
		format: 'Y.m.d',
		mask: false,
		formatDate:'Y.m.d',
		timepicker: false,
				
	});
	$("#apr").on('click',function(){
		status='APR';
		report_type='Plani i aprovuar ';
		type='';
		if($("#detail").is(":checked")){
			temp="_stand";
			report_type+='i detajuar ';
		}
	});
	$("#sub").on('click',function(){
		status='SUB';
		report_type='Draftplani ';
		type='';
		if($("#detail").is(":checked")){
			temp="_stand";
			report_type+='i detajuar ';
		}
	});
	$("#imp").on('click',function(){
		status='APR';
		report_type='Realizimi ';
		type='_implement';
		if($("#period").is(":checked")){
			type='_period';
			}
		if($("#detail").is(":checked")){
			temp="_stand";
			report_type+='i detajuar ';
		}
	});
	
	if($("#activityName").val().toUpperCase()=='HARVEST' && !$("#municipalityReport").is(":checked")){
		$("#details").show();
	}else{
		$("#details").hide();
		$("#detail").prop("checked",false);
	}

	$("#peridical").hide();
	$("#periodR").hide();
	
	$("#report_generator input[name='planStatus']").click(function(){
		if($('input:radio[name=planStatus]:checked').val() =='IMP'){
				$("#periodR").show();
			}else{
				$("#periodR").hide();
				$("#peridical").hide();
				$('#period').attr('checked', false);
				}
		});

	$('#period').change(function() {
			var isChecked=$("#period").is(":checked");
			if(isChecked==true){
				$("#peridical").show();
				}else{
				$("#peridical").hide();
					}
		});
	
	$("#activityName").on('change', function(event){
		if($("#activityName").val().toUpperCase()=='PRIVATE'){
			$("#impLabel").hide();
		}else{$("#impLabel").show();}
		
		if($("#activityName").val().toUpperCase()=='SEEDLING'){// || $("#activityName").val()=='MBJELLJA'){
			$("#reg").hide();
			$("#mun").hide();
			$("#municipalityR").hide();  
		    $("#regionR").hide();
		    $("#municipalityId").val(null);
		    $("#region").val("");
		    $("#municipality").val("");
		    $("#planRegionId").val("");
			$("#KFAReport").prop('checked', true);
			$("#details").hide();
			$("#detail").prop("checked",false);
		}else if(opl_val!='C'){
				$("#kfa").hide();
				$("#kfa").prop("disabled","disabled");
				if(opl_val=='M'){
					$("#reg").hide();
					$("#reg").prop("disabled","disabled");
					$("#municipalityReport").prop('checked',true);
					$("#municipalityR").show();  
					 $("#details").hide();
					  $("#detail").prop("checked",false);
				}else if(opl_val=='R'){
// 					user_region='<s:property value="user.getRegion().getId()"/>';
					if(user_region!=null && user_region!=''){
						$("#planRegionId").val(user_region);
						$("#regionR").hide();
					}
				}
			}else{
				$("#reg").show();  
				$("#mun").show();
			}
		if(is_forest_institute=='true'){
			  $("#report_type_buttons").hide();
			  $("#municipalityR").hide();  
			  $("#regionR").hide(); 
			  $("#planRegionId").val(null);
			  $("#region").val("");
			  $("#details").hide();
			  $("#detail").prop("checked",false);
			  $("#KFAReport").prop('checked', true);
		}
		if($("#activityName").val().toUpperCase()=='HARVEST' && !$("#municipalityReport").is(":checked")){
			$("#details").show();
		}else{
			$("#details").hide();
			$("#detail").prop("checked",false);
		}
	});

	var opl_val='<s:property value="user.organisation.operLevelVal"/>';
	var is_forest_institute="<s:property value="isForestInstituteUser()"/>";
	var user_region=null;
	var user_region_name=null;
	  $("#municipalityR").hide();  
	  $("#regionR").hide();
	if(opl_val!='C'){
		$("#kfa").hide();
		$("#kfa").prop("disabled","disabled");
		if(opl_val=='M'){
			$("#reg").hide();
			$("#reg").prop("disabled","disabled");
			$("#municipalityReport").prop('checked',true);
			$("#municipalityR").show();  
			$("#details").hide();
			$("#detail").prop("checked",false);
		}else if(opl_val=='R'){
			user_region='<s:property value="user.getRegion().getId()"/>';
			user_region_name='<s:property value="user.getRegion().getName()"/>';
			if(user_region!=null && user_region!='' && user_region_name!=null && user_region_name!=''){
				$("#planRegionId").val(user_region);
				$("#region").val(user_region_name);
				$("#regionalReport").prop('checked',true);
				$("#regionR").hide();
			}
		}
	}else if($("#activityName").val().toUpperCase()=='HARVEST'){
		$("#details").show();
	}
	if(is_forest_institute=='true'){
		$('#activityName').prop("disabled", "disabled"); 
		$("#activityName").val('SEEDLING');
		$("#report_type_buttons").hide();
		 $("#municipalityR").hide();  
		  $("#regionR").hide(); 
		  $("#planRegionId").val(null);
		  $("#region").val("");
		  $("#details").hide();
		  $("#detail").prop("checked",false);
		  $("#KFAReport").prop('checked', true);
	}
	$("#planYear").mask("9999");
	$("#report_generator input[name='reportType']").click(function(){
	    if($('input:radio[name=reportType]:checked').val() == "municipalityReport"){
			  $("#municipalityR").show();  
			  $("#regionR").hide(); 
			  $("#planRegionId").val(null);
			  $("#region").val("");
			  $("#details").hide();
			  $("#detail").prop("checked",false);
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
			  if($("#activityName").val().toUpperCase()=='HARVEST'){
			  	$("#details").show();
			  }
	    }
	    if($('input:radio[name=reportType]:checked').val() == "KFAReport"){
			  $("#municipalityR").hide();  
			  $("#regionR").hide();
			  $("#municipalityId").val(null);
			  $("#region").val("");
			  $("#municipality").val("");
			  $("#planRegionId").val("");
			  if($("#activityName").val().toUpperCase()=='HARVEST'){
			  	$("#details").show();
			  }
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

	$("#report_generator_content").on('remove', function(){
		$("#annu_report_button").removeClass("ui-state-disabled");
	});
	
	$("#cancelR").on('click', function(){
		$("#report_generator_content").dialog("close");
	});
	
	if($("#munReadOnly").val()=='true'){
		$("#municipality").val($("#munName").val()).prop('readonly',true);
		$("#municipalityId").val($("#munId").val());
	}
	
	$("#generator").on('click', function () {
		var isPeriodical=$("#period").is(":checked");
		var activityName='';
		var doc_name="";
		var doc_format=$('input[name=reportFormat]:checked').val();
		
		if($("#activityName").val() && $("#planYear").val() && status!=''){
			activityName=$("#activityName").val().toLowerCase();
			if(activityName=='private'){
				activityName='privateplan';
			}
			var parameters = "p_mun_id="+$("#municipalityId").val()+"&p_year="+$("#planYear").val()+"&p_status="+status+"&p_region_id="+$("#planRegionId").val()+"&p_rep_type="+report_type+"&p_user="+$("#user").val()+"&p_start_date="+$("#periodStart").val()+"&p_end_date="+$("#periodEnd").val()+"&p_reg_name="+$("#region").val()+"&p_mun_name="+$("#municipality").val();	
			console.log(parameters);
			var link="\\frm\\annualplan\\"+activityName;
			var rep_type='';
			if($("#detail").is(":checked")){
				rep_type=temp+type;
			}else{
				rep_type=type;
			}
			if($("#municipalityId").val()){
				if(isPeriodical==true){
					if($("#periodStart").val() && $("#periodEnd").val()){
						doc_name="<s:text name='report.docname.municipality'/>";
						link=link+"\\municipality_period_report.rptdesign";
						var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						//generateBIRTDoc(url);
						parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						downloadDoc("BirtReportGen.do", parameters);
						//	openBirtViewer(link+"/municipality_period_report.rptdesign", parameters);
						}else{
							alert("<s:text name="form.input.alert.empty"/>"); 
							}
					}else {
						doc_name="<s:text name='report.docname.municipality'/>";
						link=link+"\\municipality"+rep_type+"_report.rptdesign";
						var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						//generateBIRTDoc(url);
						parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						downloadDoc("BirtReportGen.do", parameters);
					//	openBirtViewer(link+"/municipality"+rep_type+"_report.rptdesign", parameters);
					}
			}else if($("#planRegionId").val()){
					if(isPeriodical==true){
						if($("#periodStart").val() && $("#periodEnd").val()){
							doc_name="<s:text name='report.docname.regional'/>";
							link=link+"\\regional_period_report.rptdesign";
							var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							//generateBIRTDoc(url);
							parameters=parameters+"&genQrCode=true&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							downloadDoc("BirtReportGen.do", parameters);
						// openBirtViewer(link+"/regional_period_report.rptdesign", parameters);
							}else{
							 alert("<s:text name="form.input.alert.empty"/>"); 
							}
					}else{
						doc_name="<s:text name='report.docname.regional'/>";
						link=link+"\\regional"+rep_type+"_report.rptdesign";
						var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						//generateBIRTDoc(url);
						parameters=parameters+"&genQrCode=true&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						downloadDoc("BirtReportGen.do", parameters);
						//	openBirtViewer(link+"/regional"+rep_type+"_report.rptdesign", parameters);
					}
			}else if(opl_val==='C'){
				if(isPeriodical==true){
					if($("#periodStart").val() && $("#periodEnd").val()){
						doc_name="<s:text name='report.docname.central'/>";
						link=link+"\\central_period_report.rptdesign";
						var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						//generateBIRTDoc(url);
						parameters=parameters+"&genQrCode=true&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						downloadDoc("BirtReportGen.do", parameters);
					//	openBirtViewer(link+"/central_period_report.rptdesign", parameters);
						}else{
						 alert("<s:text name="form.input.alert.empty"/>"); 
						}
					}else{
						doc_name="<s:text name='report.docname.central'/>";
						link=link+"\\central"+rep_type+"_report.rptdesign";
						var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						//generateBIRTDoc(url);
						parameters=parameters+"&genQrCode=true&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						console.log(parameters);
						downloadDoc("BirtReportGen.do", parameters);
					//	openBirtViewer(link+"/central"+rep_type+"_report.rptdesign", parameters);
						}
			}else{
				alert("<s:text name="form.input.alert.empty"/>"); 
			}
		}else{
			alert("<s:text name="form.input.alert.select"/>"); 
		}
			
	});

});


			
</script>