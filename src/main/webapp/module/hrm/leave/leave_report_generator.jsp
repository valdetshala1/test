<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<hr>
	<!-- widget content -->
	<div class="widget-body" id="report_generator_content">
	<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<form id="report_generator" class="form-horizontal">
				<div class="form-group">
							<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label class="radio radio-inline"> 
								</label>
								<label  class="radio radio-inline"> 
									<input type="radio" class="radiobox" name="reportType" id="yearly" value="yearly" checked="checked"/>
									<span><s:text name="vehicles.label.yearly"/></span>
								</label>
								<label class="radio radio-inline"> 
									<input type="radio" class="radiobox" name="reportType" id="monthly" value="monthly"/>
									<span><s:text name="vehicles.label.monthly"/></span>
								</label>
								<label class="radio radio-inline">
									<input type="radio" class="radiobox" name="reportType" id="periodical" value="periodical"/>
									<span><s:text name="vehicles.label.periodical"/></span>
								</label>
							</div>
				</div>
				<hr>
				<!-- START report.year -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.organisation"/>:</label>
						<div class="col-md-10">
							<input id="organisation" class="form-control" placeholder="<s:text name="organisation.name.placeholder"/>" type="text">
							<input id="organisationId" type="hidden">
						</div>
					</div>									
					
				<!-- END report.year -->
				<div id="year_period">
				<!-- START report.year -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="annual.plan.year"/>:</label>
						<div class="col-md-10">
							<input id="year" name="year" class="form-control" placeholder="<s:text name="vehicles.placeholder.enter.year"/>" type="text">
						</div>									
					</div>
				<!-- END report.year -->
				</div>
				<div id="month_period">
				<!-- START report.month -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="report.wood.production.label.month"/>:</label>
						<div class="col-md-10">
						<select class="form-control" id="month" name="month">
							<option value=""></option>
							<s:iterator value="monthList" var="st">
								<option value="<s:property value="#st.getSORT()" />"><s:property value="#st.getDOMVALUE()" /></option>
							</s:iterator>
						</select>
						</div>
					</div>
				<!-- END report.month -->
				</div>
				<fieldset id="period">
				<legend><s:text name="fin.allocation.label.period"/></legend>
				<!-- START report.period -->
					<div class="form-group">	
						<label class="col-md-2 control-label">*<s:text name="fin.contactor.from"/>:</label>
						<div class="col-md-10">
							<input id="period1" class="form-control" placeholder="<s:text name="fin.contactor.from"/>" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="fin.contactor.to"/>:</label>
						<div class="col-md-10">
							<input id="period2" class="form-control" placeholder="<s:text name="fin.contactor.to"/>" type="text">
						</div>
					</div>	
						
				<!-- END report.period -->
				</fieldset>
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
							<i class="fa fa-print"></i><s:text name="fin.allocation.label.generate.report"/>
						</button>
					</div>
				</div>
			</div>
			</form>
</div>
<script type="text/javascript">

$(document).ready(function() {
  $("#month_period").hide();  
  $("#period").hide();
  $("#organisationId").prop('required',true);
  $("#organisation").prop('required',true);
	$("#yearly").on('change',function(){
	  $("#year_period").show();
	  $("#year").prop('required',true);
	 
	  $("#month_period").hide(); 
	  $("#month").val(null);
	  $("#period").hide();
	  $("#period1").val(null);
	  $("#period2").val(null);
 	});
 	
	$("#monthly").on('change',function(){
	  $("#month_period").show();
	  $("#year_period").show(); 
	  $("#period").hide();
	  $("#period1").val(null);
	  $("#period2").val(null);
	});

	$("#periodical").on('change',function(){
	  $("#period").show();
	  $("#month_period").hide(); 
	  $("#month").val(null);
	  $("#year_period").hide();
	  $("#year").val(null);
	});
	$("#year").mask("9999");

	$('#period1').datetimepicker({
		lang: 'al',
		format: 'm/d/Y',
		mask: false,
		formatDate:'m/d/Y',
		timepicker: false,
	});
	$('#period2').datetimepicker({
		lang: 'al',
		format: 'm/d/Y',
		mask: false,
		formatDate:'m/d/Y',
		timepicker: false,
	});

    $("#organisation").select2({
        placeholder: "<s:text name="organisation.name.placeholder"/>",
        minimumInputLength: 1,
        ajax: {
	        url: "Input.organisation.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
		        if(term == "") term = " ";   
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	name_startsWith: term,
		        };
	        },
	        results: function (data, page) { 
	        	return { results: data };
	        },
	        cache: true
        },
        initSelection: function(element, callback) {
        },
        dropdownAutoWidth: false,
        formatResult: formatResult,
        formatSelection: function(item) {
        	$("#organisationId" ).val( item.id);
            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    }); 
    
	$("#cancelR").on('click', function(){
		$("#leave_report_generator").dialog("close");
	});
    
	$("#generator").on('click', function () {
		if($("#organisationId").val()){
			var doc_format=$('input[name=reportFormat]:checked').val();
			link="\\hrm\\leave\\";
			var doc_name='';
			if($("#month").val() && $("#year").val()){
				doc_name="<s:text name='report.docname.monthly_leave_report'/>";
				link=link+"monthly_leave_report.rptdesign";
				var parameters = "p_org_id="+$("#organisationId").val()+"&p_month="+$("#month").val()+"&p_year="+$("#year").val()+"&p_user="+$("#user").val();
				var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", parameters);
				//generateBIRTDoc(url);
				//openBirtViewer(link, parameters);
			}else if($("#period1").val() && $("#period2").val()){
				doc_name="<s:text name='report.docname.periodical_leave_report'/>";
				link=link+"periodical_leave_report.rptdesign";
				var parameters = "p_org_id="+$("#organisationId").val()+"&p_from_date="+$("#period1").val()+"&p_to_date="+$("#period2").val()+"&p_user="+$("#user").val();
				var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", parameters);
				//generateBIRTDoc(url);
				//openBirtViewer(link, parameters);
			}else if($("#year").val()){
				doc_name="<s:text name='report.docname.yearly_leave_report'/>";
				link=link+"yearly_leave_report.rptdesign";
				var parameters = "p_org_id="+$("#organisationId").val()+"&p_year="+$("#year").val()+"&p_user="+$("#user").val();
				var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", parameters);
				//generateBIRTDoc(url);
				//openBirtViewer(link, parameters);
			}else {
				alert("<s:text name="form.input.empty.alert"/>");
			}
		}else {
			alert("<s:text name="form.input.empty.alert"/>");
		}
		return false;
	});

});


			
</script>