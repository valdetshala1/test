<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget content -->
<div class="widget-body">
	<input type="hidden" id="user" name="user"
		value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
	<form id="allocation_report_form" class="form-horizontal"
		accept-charset="utf8" method="post">
		<fieldset>
			<div class="form-group">
				<label class="col-md-2 control-label"></label>
				<div class="col-md-10">
					<label class="radio radio-inline"> <input type="radio"
						class="radiobox" name="reportType" id="monthReport"
						value="monthReport" /> <span><s:text
								name="report.wood.production.label.month" /></span>
					</label> <label class="radio radio-inline"> <input type="radio"
						class="radiobox" name="reportType" id="yearReport"
						value="yearReport" /> <span><s:text
								name="report.wood.production.label.year" /></span>
					</label> <label class="radio radio-inline"> <input type="radio"
						class="radiobox" name="reportType" id="periodReport"
						value="periodReport" /> <span><s:text
								name="fin.allocation.label.period" /></span>
					</label>
				</div>
			</div>
			<!-- START report.year -->
			<div class="form-group" id="yeardiv">
				<label class="col-md-2 control-label">*<s:text
						name="report.wood.production.label.year" /></label>
				<div class="col-md-10">
					<input id="year" name="year" class="form-control"
						placeholder="<s:text name="vehicles.placeholder.enter.year"/>"
						type="text" />
				</div>
			</div>
			<!-- END report.year -->
			<div id="month1">
				<!-- START report.month -->
				<s:if test="fieldErrors.get('annuBudgetAllocation.month')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">\<s:text
								name="report.wood.production.label.month" /></label>
						<div class="col-md-10">
							<select class="form-control" id="month" name="month">
								<option value=""></option>
								<s:iterator value="monthList" var="st">
									<option value="<s:property value="##st.getSORT()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#st.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#st.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#st.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select> <span class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('annuBudgetAllocation.month')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"> <s:text
								name="report.wood.production.label.month" />
						</label>
						<div class="col-md-10">
							<select class="form-control" id="month" name="month">
								<option value=""></option>
								<s:iterator value="monthList" var="st">
									<option value="<s:property value="#st.getSORT()" />">
										<s:property value="#st.getDOMTEXT()" />
									</option>
								</s:iterator>
							</select>
						</div>
					</div>
				</s:else>
				<!-- END report.month -->
			</div>
			<div id="monthdiv2">
				<!-- START report.month2 -->
				<s:if test="fieldErrors.get('annuBudgetAllocation.month2')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1"><s:text
								name="fin.allocation.label.end.month" />: </label>
						<div class="col-md-10">
							<select class="form-control" id="month2" name="month2">
								<option value=""></option>
								<s:iterator value="month2List" var="st">
									<option value="<s:property value="#st.getSORT()" />">
										<s:property value="#st.getDOMTEXT()" />
									</option>
								</s:iterator>
							</select> <span class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('annuBudgetAllocation.month2')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"> <s:text
								name="fin.allocation.label.end.month" />
						</label>
						<div class="col-md-10">
							<select class="form-control" id="month2" name="month2">
								<option value=""></option>
								<s:iterator value="monthList" var="st">
									<option value="<s:property value="#st.getSORT()" />">
										<s:property value="#st.getDOMTEXT()" />
									</option>
								</s:iterator>
							</select>
						</div>
					</div>
				</s:else>

				<!-- END report.month2 -->
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label"></label>
				<div class="col-md-10">
					<label id="exc" class="radio radio-inline"> <input
						type="radio" class="radiobox" name="reportFormat" id="pdfReport"
						value="pdf" checked="checked" /> <span>PDF</span>
					</label> <label id="perf" class="radio radio-inline"> <input
						type="radio" class="radiobox" name="reportFormat" id="wordReport"
						value="doc" /> <span>WORD</span>
					</label> <label id="strat" class="radio radio-inline"> <input
						type="radio" class="radiobox" name="reportFormat" id="excelReport"
						value="xls" /> <span>EXCEL</span>
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
							<s:text name="fin.allocation.label.generate.report" />
						</button>
					</div>
				</div>
			</div>

		</fieldset>
	</form>
</div>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#allocation_report_content").on(
								'remove',
								function() {
									$("#print_button").removeClass(
											"ui-state-disabled");
								});

						// 	 $("#year").hide();  
						$("#month1").hide();
						$("#monthdiv2").hide();
						$("#yeardiv").hide();

						$("#allocation_report_form input[name='reportType']")
								.click(
										function() {

											if ($(
													'input:radio[name=reportType]:checked')
													.val() == "monthReport") {
												$("#month1").show();
												$("#monthdiv2").hide();
												$("#yeardiv").show();
											}

											if ($(
													'input:radio[name=reportType]:checked')
													.val() == "yearReport") {
												$("#month1").hide();
												$("#monthdiv2").hide();
												$("#yeardiv").show();
											}
											if ($(
													'input:radio[name=reportType]:checked')
													.val() == "periodReport") {
												$("#month1").show();
												$("#monthdiv2").show();
												$("#yeardiv").show();
											}

										});

						$("#year").mask("9999");
						$("#cancelReport").on('click', function() {
							$("#allocation_report_content").dialog("close");
						});

						// 	    alert(selected.val() + ' ' + selected.text());

						var parameters;
						var selMonth1;
						var selMonth2;
						//AllocationPrint.decision.do
						$("#generateReport")
								.on(
										'click',
										function() {
											var doc_name = "";
											var doc_format = $(
													'input[name=reportFormat]:checked')
													.val();
											if ($("#month").val()
													&& $("#month2").val()) {
												selMonth1 = $("#month").find(
														'option:selected');
												selMonth2 = $("#month2").find(
														'option:selected');
												parameters = "p_month1="
														+ $("#month").val()
														+ "&p_year="
														+ $("#year").val()
														+ "&p_month2="
														+ $("#month2").val()
														+ "&p_month1_name="
														+ selMonth1.text()
														+ "&p_month2_name="
														+ selMonth2.text()
														+ "&p_user="
														+ $("#user").val();
												// 				openBirtViewer("ads/finance/allocation/allocation_period_report.rptdesign", parameters);
												var link = "\\ads\\finance\\allocation\\allocation_period_report.rptdesign";
												doc_name = '<s:text name='ads.report.finance.allocation.period'/>';
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
											} else if ($("#month").val()) {
												selMonth1 = $("#month").find(
														'option:selected');
												parameters = "p_month="
														+ $("#month").val()
														+ "&p_year="
														+ $("#year").val()
														+ "&p_month_name="
														+ selMonth1.text()
														+ "&p_user="
														+ $("#user").val();
												// 					openBirtViewer("ads/finance/allocation/allocation_month_report.rptdesign", parameters);
												var link = "\\ads\\finance\\allocation\\allocation_month_report.rptdesign";
												doc_name = '<s:text name='ads.report.finance.allocation.month'/>';
												var url = "BirtReportGen.do?jsonObj="
														+ createJsonForParams(parameters)
														+ "&report_path="
														+ link
														+ "&doc_name="
														+ doc_name
														+ "&doc_format="
														+ doc_format;
												parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
												downloadDoc("BirtReportGen.do", parameters);
												//generateBIRTDoc(url);
											} else if ($("#year").val()) {
												parameters = "p_year="
														+ $("#year").val()
														+ "&p_user="
														+ $("#user").val();
												// 						openBirtViewer("ads/finance/allocation/allocation_year_report.rptdesign", parameters);
												var link = "\\ads\\finance\\allocation\\allocation_year_report.rptdesign";
												doc_name = '<s:text name='ads.report.finance.allocation.year'/>';
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
											} else {
												alert("<s:text name="fin.allocation.alert.type.of.report"/>");
											}
											$("#allocation_report_content")
													.dialog("close");
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