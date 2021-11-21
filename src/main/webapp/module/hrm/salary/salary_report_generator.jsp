<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/module/base/nocache.jsp"%>

	<!-- widget content -->
	<div class="widget-body"  >
		<form id="financial_report_form" class="form-horizontal" accept-charset="utf8" method="post">
		<input type="hidden" id="apkId" name="apkId"  value="<s:property value="apkId"/>">
		<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<fieldset>
					<div class="form-group">
						<label class="col-md-2 control-label">*Year:</label>
						<div class="col-md-10"><input name="year" id="year"></div>
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

		$("#financialReportGen").on('remove', function(){
			$("#print_button").removeClass("ui-state-disabled");
		});

		$("#leveldiv").hide();
		$("#divMun").hide();
		$("#divReg").hide();
		$("#divYear").hide();
		$("#divMonth").hide();
  		
		$('#date').datetimepicker({
			lang: 'al',
			format: 'Y-m-d',
			mask: false,
			formatDate:'Y-m-d',
			timepicker: false,
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
	    
		
	$("#financial_report_form input[name='reportType']").click(function(){
		$("#leveldiv").show();
		$("#divMun").hide();
		$("#divReg").hide();
		$("#divYear").hide();
		$("#divMonth").hide();
		
	    if($('input:radio[name=reportType]:checked').val() == "monthReport"){
	    }

	    if($('input:radio[name=reportType]:checked').val() == "yearReport"){
	    }

	});

	
	$("#financial_report_form input[name='reportType1']").click(function(){
		$("#leveldiv").show();
		$("#divYear").show();
		var reportTypeChecked= $('input[name=reportType]:checked', '#financial_report_form').val();
	    if($('input:radio[name=reportType1]:checked').val() == "munReport"){
				if(reportTypeChecked=='monthReport'){
							$("#divMonth").show();
						}else{
							$("#divMonth").hide();
							}
				$("#divMun").show();
				$("#divReg").hide();
	    }
	    if($('input:radio[name=reportType1]:checked').val() == "regReport"){
				if(reportTypeChecked=='monthReport'){
					$("#divMonth").show();
				}else{
					$("#divMonth").hide();
					}
				$("#divMun").hide();
				$("#divReg").show();
					    
	 
	    }
	    if($('input:radio[name=reportType1]:checked').val() == "genReport"){
			
	    	if(reportTypeChecked=='monthReport'){
				$("#divMonth").show();
			}else{
				$("#divMonth").hide();
				}
			$("#divMun").hide();
			$("#divReg").hide();
			$("#month").val('');
	   	 
	    }

	});

	$("#year").mask("9999");
	$("#cancelReport").on('click', function(){
		$("#financialReportGen").dialog("close");
	});
	
	var parameters;
	var userLevel='<s:property value="user.getOrganisation().getOperLevelVal()"/>';

	$("#generateReport").on('click', function () {
		 var levelType= $('input[name=reportType1]:checked', '#financial_report_form').val();
		 var periodType=$('input[name=reportType]:checked', '#financial_report_form').val();
		 var link="\\ads\\finance\\output\\salary\\";
		 var doc_format=$('input[name=reportFormat]:checked').val();
		 var doc_name='';
		 
	     if($("#year").val()){
	    	 doc_name="Salary_"+$("#year").val();
	    	 //link=link+"salary_report_year.jrxml";
	    	 link=link+"salary_report.rptdesign";
	    	 //parameters="p_month="+$("#month").val() +"&p_year_id="+$("#year").val()+"&p_mun_id="+$("#orgaid").val()+"&p_user="+$("#user").val()+"&p_municipality="+$("#orgaName").val()+"&p_month_name="+$('#month option:selected').text()+"&p_status="+$("#finStat").val();
	    	 parameters="&p_year="+$("#year").val()+"&p_user="+$("#user").val()+"&p_municipality="+$("#orgaName").val()+"&p_month_name="+$('#month option:selected').text()+"&p_status="+$("#finStat").val();
	    	 parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
	    	 //downloadDoc("JasperReportGen.do", parameters);
			 downloadDoc("BirtReportGen.do", parameters);
	    	//var	url="JasperReportGen.do?genQrCode=true&jsonObj=&report_path="+link+"&doc_name=Vengjuetite&doc_format=pdf";
			 //$("#print_button").removeClass('ui-state-disabled');
	     }else{
	    	 alert("<s:text name="form.input.fill.necesary.field"/>");
	    	 //$("#print_button").removeClass('ui-state-disabled'); 
		 }
	});

});
			
</script>