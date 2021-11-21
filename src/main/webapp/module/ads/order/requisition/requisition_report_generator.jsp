<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>


		<div class="form-horizontal" id="report_generator_content">
		<input type="hidden" id="req_id" name="req_id" value="<s:property value="req_id"/>">
			<div class="row" class="form-horizontal">
			<label class="col-md-2 control-label"></label>
			<div class="col-md-12">
<!-- 			<div style="background-color:red; width:200px; float: left; display: inline-block;">.</div> -->
				<table border="0">
				<tr><td style="width:200px"></td>
				<td>
				<label id="exc" class="radio radio-inline"> <input
					type="radio" class="radiobox" name="reportFormat" id="pdfReport"
					value="pdf" checked="checked" /> <span>PDF </span>
				</label> <label id="perf" class="radio radio-inline"> <input
					type="radio" class="radiobox" name="reportFormat" id="wordReport"
					value="doc" /> <span>WORD</span>
				</label> <label id="strat" class="radio radio-inline"> <input
					type="radio" class="radiobox" name="reportFormat" id="excelReport"
					value="xls" /> <span>EXCEL</span>
				</label>
				</td>
				</tr></table>
			</div>
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
						<s:text name="fin.allocation.label.generate.report" />
					</button>
				</div>
			</div>
		</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#report_generator_content").on('remove', function(){
		$("#report_button").removeClass("ui-state-disabled");
	});
	
	$("#cancelR").on('click', function(){
		$("#report_generator_content").dialog("close");
	});
	
 	$("#generator").on('click', function () { 
 		var doc_name = '<s:text name='ads.report.order.requisition'/>'; 
 		var doc_format = $('input[name=reportFormat]:checked').val(); 
		var parameters = "p_req_id="+$("#req_id").val();
		var link="\\ads\\order\\requisition\\requisition_report.rptdesign";
		var url = "BirtReportGen.do?jsonObj="
			+ createJsonForParams(parameters)
			+ "&report_path="
			+ link
			+ "&doc_name="
			+ doc_name
			+ "&doc_format="
			+ doc_format;
		
		//generateBIRTDoc(url);
		parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
		downloadDoc("BirtReportGen.do", parameters);
 	}); 

});	
		
</script>				
    