<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
	<!-- widget content -->
	<div class="widget-body"  >
		<form id="financial_report_form" class="form-horizontal" accept-charset="utf8" method="post">
		<input type="hidden" id="apkId" name="apkId"  value="<s:property value="apkId"/>">
		<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<fieldset>
				<div class="form-group" >
					<label class="col-m d-2 control-label">  </label>
						<div style="width: 400px">
							<div class="col-md-10" style="left:300px;overflow:hidden;">
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="monthReport" value="monthReport"/>
									<span><s:text name="report.wood.production.label.month"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="commitmentReport" value="commitmentReport"/>
									<span><s:text name="fin.output.commitment.date.report"/></span>
								</label>
							</div>
						</div>
				</div>
	
				<div id="divCommitmentPeriod">
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.start.date'/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="startCommitmentDate" name="startCommitmentDate"  class="form-control" placeholder="<s:text name='hrm.skill.label.start.date'/>" />
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.end.date'/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="endCommitmentDate" name="endCommitmentDate"  class="form-control" placeholder="<s:text name='hrm.skill.label.end.date'/>" />
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
					</div>
				</div>
				<div id="divMonth">	
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="report.wood.production.label.month"/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="month" name="month">
									<option value=""></option>
									<s:iterator value="monthList" var="st">
										<s:if test="%{locale.language=='en'}">
										<option value="<s:property value="#st.getSORT()" />"><s:property value="#st.getDOMTEXT_EN()" /></option>
										</s:if><s:elseif test="%{locale.language=='sr'}">
										<option value="<s:property value="#st.getSORT()" />"><s:property value="#st.getDOMTEXT_SR()" /></option>
										</s:elseif><s:elseif test="%{locale.language=='al'}">
										<option value="<s:property value="#st.getSORT()" />"><s:property value="#st.getDOMTEXT()" /></option>
										</s:elseif>
									</s:iterator>
							</select>
						</div>
					</div>
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
  		$("#divCommitmentPeriod").hide();
  		$("#divMonth").hide();
		$('#startCommitmentDate').datetimepicker({
			lang: 'al',
			format: 'Y-m-d',
			mask: false,
			formatDate:'Y-m-d',
			timepicker: false,
		});
		
		$('#endCommitmentDate').datetimepicker({
			lang: 'al',
			format: 'Y-m-d',
			mask: false,
			formatDate:'Y-m-d',
			timepicker: false,
		});

		
	$("#financial_report_form input[name='reportType']").click(function(){
	    if($('input:radio[name=reportType]:checked').val() == "monthReport"){
	    	$("#divCommitmentPeriod").hide();
	  		$("#divMonth").show();  
	  		$("#startCommitmentDate").val('');
	  		$("#endCommitmentDate").val('');
	    }
	    if($('input:radio[name=reportType]:checked').val() == "commitmentReport"){
	    	$("#divCommitmentPeriod").show();
	  		$("#divMonth").hide();
	  		$("#month").val('');
	    }
	});

	
	$("#cancelReport").on('click', function(){
		$("#financialCostsReportGen").dialog("close");
	});

	
	var parameters;
	$("#generateReport").on('click', function () {
		 var doc_name="";
		 var link="\\ads\\finance\\output\\costs";
		 var doc_format=$('input[name=reportFormat]:checked').val();

		var periodType=$('input[name=reportType]:checked', '#financial_report_form').val();
		 parameters="p_start_date="+$("#startCommitmentDate").val() +"&p_end_date="+$("#endCommitmentDate").val()+"&p_month="+$("#month").val()+"&p_month_name="+$('#month option:selected').text()+"&p_user="+$("#user").val();
		if($("#month").val()){
			doc_name="<s:text name='report.docname.month'/>";
			link=link+"\\month_report.rptdesign";
			//var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			//generateBIRTDoc(url);

			var	url=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			downloadDoc("BirtReportGen.do", url);
				 			
		//		openBirtViewer("ads/finance/output/costs/month_report.rptdesign", parameters);
			}else if ($("#startCommitmentDate").val() && $("#endCommitmentDate").val() ){
				doc_name="<s:text name='report.docname.startCommitmentDate'/>";
				link=link+"\\commitment_date_report.rptdesign";
				//var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				//generateBIRTDoc(url);
				var	url=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", url);
				 				
			//	openBirtViewer("ads/finance/output/costs/commitment_date_report.rptdesign", parameters);
				}else{
					alert("<s:text name="form.input.alert.empty"/>");
				}

	});

});



			
</script>