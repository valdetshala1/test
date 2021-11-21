<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->

<div class="form-group">
	<fieldset>
		<legend></legend>
		<div class="col-md-9">
			<label class="radio radio-inline"> </label> <label
				class="radio radio-inline"> <input type="radio"
				class="radiobox" name="reportName" id="start" value="start" checked="checked" /> <span><s:text
						name="fin.contactor.started" /></span>
			</label> <label class="radio radio-inline"> <input type="radio"
				class="radiobox" name="reportName" id="close" value="close" /> <span><s:text
						name="fin.contactor.closed" /></span>
			</label> <label class="radio radio-inline"> <input type="radio"
				class="radiobox" name="reportName" id="delayed" value="delayed" /> <span><s:text
						name="contract.delayed" /></span>
			</label>
		</div>
	</fieldset>
</div>
<hr>
<!-- widget content -->
<div class="widget-body" id="report_generator_content">
	<input type="hidden" id="user" name="user"
		value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
	<form id="report_generator" class="form-horizontal">
		<hr>
		<div class="form-group">
			<label class="col-md-2 control-label">*<s:text
					name="hum.employee.label.organisation" />:</label>
			<div class="col-md-9">
				<input id="organisation" class="form-control"
					placeholder="<s:text name="organisation.name.placeholder"/>"
					type="text"> <input id="organisationId" type="hidden">
			</div>
		</div>
		<fieldset id="period">
			<legend>Period</legend>
			<!-- START report.period -->
			<div class="form-group">
				<label class="col-md-2 control-label">*<s:text
						name="fin.contactor.from" />:</label>
				<div class="col-md-10">
					<input id="period1" class="form-control"
						placeholder="<s:text name="fin.contactor.from"/>" type="text">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">*<s:text
						name="fin.contactor.to" />:</label>
				<div class="col-md-10">
					<input id="period2" class="form-control"
						placeholder="<s:text name="fin.contactor.to"/>" type="text">
				</div>
			</div>
			<!-- END report.period -->
		</fieldset>

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
	</form>
</div>
<script type="text/javascript">

$(document).ready(function() {
	$("#report_generator_content").on('remove', function(){
		$("#print_button").removeClass("ui-state-disabled");
	});
	
	var report_name='';
	if($('#start').is(':checked')){
		report_name='started';
		$("#period").show();
	}else if($('#close').is(':checked')){
		report_name='closed';
		$("#period").show();
	}else if($('#delay').is(':checked')){
		report_name='delayed';
		$("#period").hide();
	}
	$('#start').on('change', function(){
		report_name='started';
		$("#period").show();
	});
	$('#close').on('change', function(){
		report_name='closed';
		$("#period").show();
	});
	$("#delayed").on('change', function(){
		report_name='delayed';
		$("#period").hide();
	});	

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
	
	  $("#organisationId").prop('required',true);
	  $("#organisation").prop('required',true);

    $("#organisation").select2({
        placeholder: "<s:text name="organisation.name.placeholder"/>", 
        minimumInputLength: 1, 
        ajax: {
	        url: "Input.organisation.do?",
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
        	$("#organisation").val(item.name);
            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    }); 
    
	$("#cancelR").on('click', function(){
		$("#report_generator_content").dialog("close");
	});
	
	var gen_type = $(
	'input[name=reportName]:checked')
	.val();
	
	
		$("#generator").on('click', function () 
				{
			var doc_name = "";
			var doc_format = $(
					'input[name=reportFormat]:checked')
					.val();
//			var link="ads/finance/contract/contract_"+report_name+"_report.rptdesign";
			var parameters = "p_org_id="+$("#organisationId").val()+"&p_period1="+$("#period1").val()+"&p_period2="+$("#period2").val()+"&p_user="+$("#user").val()+"&p_orga="+$("#organisation").val();
			var link = "\\ads\\finance\\contract\\contract_"+report_name+"_report.rptdesign";
			doc_name = '<s:text name='ads.report.finance.contract'/>';
			var url = "BirtReportGen.do?jsonObj="
					+ createJsonForParams(parameters)
					+ "&report_path="
					+ link
					+ "&doc_name="
					+ doc_name
					+ "&doc_format="
					+ doc_format;
//				openBirtViewer(link, parameters);
			if($("#organisationId").val())
			{

// 				if(gen_type == "delayed")
				if($('#delayed').is(':checked'))
				{
					//generateBIRTDoc(url);
					parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					downloadDoc("BirtReportGen.do", parameters);
				}
				else
				{
					if($("#period1").val()&&$("#period1").val())
					{
						//generateBIRTDoc(url);
						parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						downloadDoc("BirtReportGen.do", parameters);
					}
					else
						{alert("<s:text name="form.input.empty.alert"/>");
						}
				}
			}
			else {
				alert("<s:text name="form.input.empty.alert"/>"); 
			}
			return false;
		}

		);
	
	
});


			
</script>