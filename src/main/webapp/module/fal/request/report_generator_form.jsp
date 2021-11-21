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
	<div class="widget-body" id="request_report_generator_content">
			<div id="request_report_generator" class="form-horizontal">
			<input id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>" type="hidden">
				<hr>
				<!-- START requestStatuses-->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='law.suit.label.status'/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="requestStatus" name="requestStatus">
								<s:iterator value="requestStatuses" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#el.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#el.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#el.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>						
							</select>
						</div>									
					</div>
				<!-- END requestStatuses-->
				
				<!-- START report.requestStart -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.start.date'/>:</label>
						<div class="col-md-10">
							<input id="requestStart" onchange="controlRequestDates(this.value)" name="requestStart" class="form-control" placeholder="<s:text name='hrm.skill.label.start.date'/>" type="text">
						
						</div>									
					</div>
				<!-- END report.requestStart -->
				
				<!-- START report.requestEnd-->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.end.date'/>:</label>
						<div class="col-md-10">
							<input id="requestEnd" onchange="controlRequestDates(this.value)" name="requestEnd" class="form-control" placeholder="<s:text name='hrm.skill.label.end.date'/>" type="text">
						</div>									
					</div>
				<!-- END report.requestEnd -->
				
				<!-- START report.format-->
					<div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label id="exc" class="radio radio-inline"> 
								<input type="radio" class="radiobox" name="reqReportFormat" id="pdfReport" value="pdf" checked="checked"/>
									<span>PDF</span>
								</label>
								<label id="perf" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reqReportFormat" id="wordReport" value="doc"/>
									<span>WORD</span>
								</label>
								<label id="strat" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reqReportFormat" id="excelReport" value="xls"/>
									<span>EXCEL</span>
								</label>
							</div>
					</div>
				<!-- END report.format -->
				
				</div>
				
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="canceReqRep" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="generatorReqRep" class="btn btn-primary" type="submit">
							<i class="fa fa-print"></i>
							<s:text name='label.button.generate.report'/>
						</button>
					</div>
				</div>
			</div>
			
	</div>
<script type="text/javascript">

$(document).ready(function() {
	$('#requestStart').datetimepicker({
		lang: 'al',
		format: 'Y.m.d',
		mask: false,
		formatDate:'Y.m.d',
		timepicker: false,
    			
	});
	$('#requestEnd').datetimepicker({
		lang: 'al',
		format: 'Y.m.d',
		mask: false,
		formatDate:'Y.m.d',
		timepicker: false,
				
	});
	function controlRequestDates(val) {
		if($("#requestEnd").val()){
			alert();
			if(val>$("#requestEnd").val()){
				$('#requestStart').val("");
				alert("<s:text name='execute.end.year.must.be.bigger.than.start'/>");	
				val=null;
				}
			}
	}
	$("#canceReqRep").on('click', function(){
		$("#request_report_generator_content").dialog("close");
	});

    
	$("#generatorReqRep").on('click', function () {
		var link="\\fal\\request\\request_status_report.rptdesign";
		var parameters="p_status="+$("#requestStatus").val()+"&p_start_date="+$("#requestStart").val()+"&p_user="+$("#user").val()+"&p_end_date="+$("#requestEnd").val();	
		var doc_name="<s:text name='report.docname.request_report'/>";
		var doc_format=$('input[name=reqReportFormat]:checked').val();
		var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
		if($("#requestStatus").val()&& $("#requestStart").val() && $("#requestEnd").val()){
			//generateBIRTDoc(url);
			parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			downloadDoc("BirtReportGen.do", parameters);
		}else{
			alert("<s:text name="form.input.alert.empty"/>"); 
		}
		
	});

});


			
</script>