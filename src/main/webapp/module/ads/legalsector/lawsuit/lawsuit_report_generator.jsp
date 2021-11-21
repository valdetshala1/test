<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
	<!-- widget content -->
	<div class="widget-body"  >
		<form id="lawsuit_report_form" class="form-horizontal" accept-charset="utf8" method="post">
		<input type="hidden" id="apkId" name="apkId"  value="<s:property value="apkId"/>">
			<fieldset>
				<div class="form-group" id="leveldiv">
					<label class="col-m d-2 control-label">   </label>
						<div style="width: 450px">
							<div class="col-md-10" style="left:250px;overflow:hidden;">
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="munReport" value="munReport"/>
									<span><s:text name="bidder.cadastral.municipality"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="regReport" value="regReport"/>
									<span><s:text name="report.type.regional.legend"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="genReport" value="genReport"/>
									<span><s:text name="report.type.general.legend"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="Report" value="stReport"/>
									<span><s:text name="law.suit.label.suit.type"/></span>
								</label>
							</div>
						</div>
				</div>
				<div id="divPeriod">
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.start.date'/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="startDate" name="startDate"  class="form-control" placeholder="<s:text name='hrm.skill.label.start.date'/>" />
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.end.date'/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="endDate" name="endDate"  class="form-control" placeholder="<s:text name='hrm.skill.label.end.date'/>" />
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
					</div>
				</div>
				<div id="divMun">
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="bidder.cadastral.municipality"/>:</label>
						<div class="col-md-10">
							<input id="orgaName" name="orgaName" class="form-control" value="<s:property value='orgaName'/>" placeholder="<s:text name="fin.input.financial.organisation"/>"/>
							<input id="orgaid" name="orgaid" class="form-control" value="<s:property value='orgaid'/>" type="hidden"/>
						</div>
					</div>
				</div>
				<div id="divReg">
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="frm.compartment.region.name"/>:</label>
						<div class="col-md-10">
							<input id="orgaNameReg" name="orgaNameReg" class="form-control" value="<s:property value='orgaNameReg'/>" placeholder="<s:text name="fin.input.financial.organisation"/>"/>
							<input id="orgaNameRegid" name="orgaNameRegid" class="form-control" value="<s:property value='orgaNameRegid'/>" type="hidden"/>
						</div>
					</div>
				</div>
				<div id="suitT">
				<!-- START lawsuit.suitType -->
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="law.suit.label.suit.type"/></label>
					<div class="col-md-10">
						<select class="form-control" id="lawsuitType" name="lawsuitType">
							<option></option>
							<s:iterator value="suittypeList" var="st">
									<option value="<s:property value="#st.getDOMKEY()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#st.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#st.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#st.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
						</select>
					</div>
				</div>
				<!-- END lawsuit.suitType -->
				
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
// 	 $("#year").hide();  

		$("#lawsuitReportGen").on('remove',function(){
			$("#law_print").removeClass("ui-state-disabled");
		});
		$("#divMun").hide();
		$("#divReg").hide();
		$("#suitT").hide();
		$('#startDate').datetimepicker({
			lang: 'al',
			format: 'Y-m-d',
			mask: false,
			formatDate:'Y-m-d',
			timepicker: false,
			autoclose: true,
		});
		$('#endDate').datetimepicker({
			lang: 'al',
			format: 'Y-m-d',
			mask: false,
			formatDate:'Y-m-d',
			timepicker: false,
			autoclose: true,
		});
  	

		$("#orgaName").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.organisation.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        if(term == "") term = " ";   
		        return {	
		        	name_startsWith: term,
		        	orglevel:'M',
		        };
		        },
		        results: function (data, page) { 
		        return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
	        formatResult: formatResult,
	        formatSelection: function(item) {
	        	$("#orgaid").val(item.id);
	        	$("#orgaName").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });
		$("#orgaNameReg").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.organisation.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        if(term == "") term = " ";   
		        return {	
		        	name_startsWith: term,
		        	orglevel:'R',
		        };
		        },
		        results: function (data, page) { 
		        return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
	        formatResult: formatResult,
	        formatSelection: function(item) {
	        	$("#orgaNameRegid").val(item.id);
	        	$("#orgaNameReg").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });
	    
	
	$("#lawsuit_report_form input[name='reportType']").click(function(){
		$("#leveldiv").show();
		$("#divYear").show();
	    if($('input:radio[name=reportType]:checked').val() == "munReport"){

				$("#divMun").show();
				$("#orgaNameReg").val('');
				$("#orgaNameRegid").val('');
				$("#divReg").hide();
				$("#lawsuitType").val('');
				$("#suitT").hide();
	    }
	    if($('input:radio[name=reportType]:checked').val() == "regReport"){
				$("#divMun").hide();
				$("#orgaid").val('');
				$("#orgaName").val('');
				$("#divReg").show();
				$("#lawsuitType").val('');
				$("#suitT").hide();
	    }
	    if($('input:radio[name=reportType]:checked').val() == "genReport"){
			$("#orgaid").val('');
			$("#orgaName").val('');
			$("#orgaNameRegid").val('');
			$("#orgaNameReg").val('');
			$("#divMun").hide();
			$("#divReg").hide();
			$("#lawsuitType").val('');
			$("#suitT").hide();
	    }
	    if($('input:radio[name=reportType]:checked').val() == "stReport"){
			$("#orgaid").val('');
			$("#orgaName").val('');
			$("#orgaNameRegid").val('');
			$("#orgaNameReg").val('');
			$("#divMun").hide();
			$("#divReg").hide();
			$("#suitT").show();

	    }

	});

	$("#cancelReport").on('click', function(){
		$("#lawsuitReportGen").dialog("close");
	});

	$("#generateReport").on('click', function () {
		 var doc_name="";
		 var link="\\ads\\legalsectory";
		 var doc_format=$('input[name=reportFormat]:checked').val();
		 parameters="p_start_date="+$("#startDate").val()+"&p_end_date="+$("#endDate").val()+"&p_reg_id="+$("#orgaNameRegid").val()
		 				+"&p_mun_id="+$("#orgaid").val()+"&p_mun_name="+$("#orgaName").val()+"&p_reg_name="+$("#orgaNameReg").val()
		 				+"&p_suit_type="+$("#lawsuitType").val();
		 	if($("#startDate").val() && $("#endDate").val()){
		 		if($("#orgaid").val()){
		 			doc_name="<s:text name='report.docname.municipality'/>";
					link=link+"\\municipality_report.rptdesign";
					var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					//generateBIRTDoc(url);
					parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					downloadDoc("BirtReportGen.do", parameters);
		 		//	openBirtViewer("ads/legalsectory/municipality_report.rptdesign", parameters);
			 		}else if ($("#orgaNameRegid").val()) {
			 			doc_name="<s:text name='report.docname.regional'/>";
						link=link+"\\regional_report.rptdesign";
						var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						//generateBIRTDoc(url);
						parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						downloadDoc("BirtReportGen.do", parameters);
			 	//		openBirtViewer("ads/legalsectory/regional_report.rptdesign", parameters);
					}else if ($("#lawsuitType").val()) {
						doc_name="<s:text name='report.docname.suittype'/>";
						link=link+"\\suittype_report.rptdesign";
						var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						//generateBIRTDoc(url);
						parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						downloadDoc("BirtReportGen.do", parameters);
			 		//	openBirtViewer("ads/legalsectory/suittype_report.rptdesign", parameters);
					}
					else if(!($("#orgaid").val() && $("#orgaNameRegid").val() && $("#lawsuitType").val())) {
						doc_name="<s:text name='report.docname.central'/>";
						link=link+"\\central_report.rptdesign";
						var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						//generateBIRTDoc(url);
						parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						downloadDoc("BirtReportGen.do", parameters);
					//	openBirtViewer("ads/legalsectory/central_report.rptdesign", parameters);
					}else{
						alert("<s:text name="form.input.alert.empty"/>");
						}
			 	}else{
			 		alert("<s:text name="form.input.alert.empty"/>");
				}

	});

});
			
</script>