<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!-- widget div-->
<div class="widget-body" id="report_generator_content">
	<div id="report_generator" class="form-horizontal">
	
			<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
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
   $("#report_generator_content").on('remove',function(){
		$("#print_button").removeClass('ui-state-disabled');
	});
	
	$("#cancelR").on('click', function(){
		$("#order_rep_generator").dialog("close");
	});

	$("#generator").on('click', function () {
	var doc_name="<s:text name='report.docname.order'/>";
	var link="\\ads\\order\\order_report.rptdesign";
	var doc_format=$('input[name=reportFormat]:checked').val();
	var parameters ="p_order_id="+ $("#orderId").val();
	var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
	//generateBIRTDoc(url);
	parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
	downloadDoc("BirtReportGen.do", parameters);
	// openBirtViewer(link, parameters);
   	   			
	});
	
});
</script>
