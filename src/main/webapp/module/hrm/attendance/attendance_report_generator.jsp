<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
	<!-- widget content -->
	<div class="widget-body"  >
	<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
		<form id="attendance_report_form" class="form-horizontal" accept-charset="utf8" method="post">
		<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<fieldset>
				<div class="form-group" >
						<label class="col-m d-2 control-label"></label>
						<div style="width: 400px">
							<div class="col-md-10" style="left:300px;overflow:hidden;">
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="dayReport" value="dayReport"/>
									<span><s:text name="hrm.leave.label.day"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="monthReport" value="monthReport"/>
									<span><s:text name="report.wood.production.label.month"/></span>
								</label>
						</div>
						</div>
				</div>
				<div id="datediv">
				<!-- START annualplan.year -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="vehicles.label.date"/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="date" name="date"  class="form-control" placeholder="<s:text name="vehicles.label.date"/>" />
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
				</div>
				<!-- END annualplan.year -->
				</div>
				<div id="monthdiv">
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="annu.felling.label.year"/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="year" name="year"  class="form-control" placeholder="<s:text name="annu.felling.label.year"/>" />
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
					</div>
					
				<div class="form-group">
					<label class="col-md-2 control-label"> <s:text name="report.wood.production.label.month"/> </label>
					<div class="col-md-10">
						<select class="form-control" id="month" name="month">
								<option value=""></option>
								
								<s:if test="%{#lang=='en'}">
									<s:iterator value="monthList" var="st">
										<option value="<s:property value="#st.getSORT()" />"><s:property value="#st.getDOMTEXT_EN()" /></option>
									</s:iterator>
								</s:if>
								<s:elseif test="%{#lang=='sr'}">
								
									<s:iterator value="monthList" var="st">
										<option value="<s:property value="#st.getSORT()" />"><s:property value="#st.getDOMTEXT_SR()" /></option>
									</s:iterator>
								</s:elseif>
								<s:else>
									<s:iterator value="monthList" var="st">
										<option value="<s:property value="#st.getSORT()" />"><s:property value="#st.getDOMTEXT()" /></option>
									</s:iterator>
								</s:else>
								
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
					<label class="col-md-2 control-label"></label>
						<div class="col-md-10" style="left:100px;overflow:hidden;">
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
						<button id="cancelReport" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="generateReport" class="btn btn-primary" type="button">
							<i class="fa fa-save"></i>
							<s:text name="fin.allocation.label.generate.report"/>
						</button>
					</div>
				</div>
			</div>
			
			</fieldset>
		</form>
</div>
<script type="text/javascript">

$(document).ready(function() {
// 	 $("#year").hide();  
	 	$("#datediv").hide();  
	  	$("#monthdiv").hide(); 
  		
		$('#date').datetimepicker({
			lang: '<s:property value="#lang"/>',
			format: 'Y-m-d',
			mask: false,
			formatDate:'Y-m-d',
			timepicker: false,
		});
  	
		$('#year').datetimepicker({
			lang: '<s:property value="#lang"/>',
			format: 'Y',
			mask: false,
			formatDate:'Y',
			timepicker: false,
		});


		
	$("#attendance_report_form input[name='reportType']").click(function(){
	    if($('input:radio[name=reportType]:checked').val() == "dayReport"){
			  $("#datediv").show();  
			  $("#monthdiv").hide(); 
	    }

	    if($('input:radio[name=reportType]:checked').val() == "monthReport"){
	    	  $("#monthdiv").show();  
			  $("#datediv").hide(); 
	    }

	});

	$("#year").mask("9999");
	$("#cancelReport").on('click', function(){
		$("#attendanceReportGen").dialog("close");
	});

	
// 	    alert(selected.val() + ' ' + selected.text());

	
	var parameters;
// 	var selMonth1;
// 	var selMonth2;
	var userLevel='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
	//AllocationPrint.decision.do
	$("#generateReport").on('click', function () {
		var doc_format=$('input[name=reportFormat]:checked').val();
		if($("#date").val()){
			parameters="p_punch_in_user_time="+$("#date").val()+"&p_oper_level_val="+userLevel+"&p_user="+$("#user").val()+"&doc_format="+doc_format;;
	//		alert(parameters);
			//openBirtViewer("hrm/attendance/attendance_day_report.rptdesign", parameters);
			var link='\\hrm\\attendance\\attendance_day_report.rptdesign';
			var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name=raport_ditor&doc_format="+doc_format;
			
			$("#attendanceReportGen").dialog("close");
		}else if($("#year").val() && $("#month").val() ){
			parameters="p_year="+$("#year").val()+"&p_month="+$("#month").val();
// 			openBirtViewer("hrm/attendance/attendance_month_report.rptdesign", parameters);
			var link='\\hrm\\attendance\\attendance_month_report.rptdesign';
			var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name=raport_mujor&doc_format="+doc_format;
			parameters=parameters+"&genQrCode=true&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			downloadDoc("BirtReportGen.do", parameters);
			//generateBIRTDoc(url);
			$("#attendanceReportGen").dialog("close");
		}
// 		 if($("#month").val() && $("#month2").val()){
// 				selMonth1 = $("#month").find('option:selected');
// 				parameters ="p_month1="+$("#month").val()+"&p_year="+$("#year").val()+"&p_month2="+$("#month2").val()+"&p_month1_name="+selMonth1.text()+"&p_month2_name="+selMonth2.text();
// 				openBirtViewer("fin/allocation/allocation_period_report.rptdesign", parameters);
// 				}else if($("#month").val()){
// 					selMonth1 = $("#month").find('option:selected');
// 					parameters = "p_month="+$("#month").val()+"&p_year="+$("#year").val()+"&p_month_name="+selMonth1.text();
// 					openBirtViewer("fin/allocation/allocation_month_report.rptdesign", parameters);
// 					}else if($("#year").val()){
// 						parameters ="p_year="+$("#year").val();
// 						openBirtViewer("fin/allocation/allocation_year_report.rptdesign", parameters);
// 						}else{
// 							alert("Please choose type of report");
// 							}
		 
		/*
		var link = "frameset?__report=ads/finance/allocation.rptdesign&__parameterpage=false&__title=KFIS Report Viewer&p_month="+$("#month").val()+"&p_year="+$("#year").val()+"&p_month2="+$("#month2").val();
		var win = window.open(link, '_blank');
		if(win){
		    win.focus();
		}*/
				

		/*		
		var link = "ViewReport.do?__document=ads/finance/allocation.rptdesign&p_month="+$("#month").val()+"&p_year="+$("#year").val()+"&p_month2="+$("#month2").val(); 
		var win = window.open(link, '_blank');
		if(win){
		    win.focus();
		}else{
		    alert('Please allow popups for this site');
		}
		*/
	});

});
			
</script>