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
	<div style="width: 460px">
	<div class="widget-body" id="employee_list_report_generator">
	<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<div id="employee_list_report" class="form-horizontal">
				<div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label class="radio radio-inline"> 
								</label>
								<label id="employee" class="radio radio-inline"> 
								<input type="radio" class="radiobox" name="reportType" id="employee" value="employee" checked="checked"/>
									<span><s:text name="report.type.employee"/></span>
								</label>
								<label id="reg" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="employeeDetail" value="employeeDetail"/>
									<span><s:text name='report.type.employee.detail'/></span>
								</label>
							</div>
				</div>
				<!-- START report.month2 -->
					<div class="form-group" id="employeeDiv">	
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.organisation"/>:</label>
						<div class="col-md-10">
							<input id="organisation" class="form-control" placeholder="<s:text name="organisation.name.placeholder"/>" type="text">
							<input id="organisationId" type="hidden">
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
				<!-- END report.month2 -->
			
				
					<div class="form-actions">
						<div class="row">
							<div class="col-md-12">
								<button id="cancelR" class="btn btn-default" type="button">
									<s:text name="label.button.cancel"></s:text>
								</button>
								<button id="generator" class="btn btn-primary" type="submit">
									<i class="fa fa-print"></i>
									<s:text name="fin.allocation.label.generate.report"/>
								</button>
							</div>
						</div>
					</div>
			
</div>
</div>
<script type="text/javascript">

$(document).ready(function() {
	var opl_val='<s:property value="user.organisation.operLevelVal"/>';

	$("#employee_list_report_generator input[name='reportType']").click(function(){
	    	if($('input:radio[name=reportType]:checked').val() == "employee"){
		    	$("#employeeDiv").show();
		    }else{
		    	$("#employeeDiv").hide();
			    }
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
    $("#employee_list_report_generator").on('remove', function(){
    	 $("#print_button").removeClass("ui-state-disabled");
    });
	$("#cancelR").on('click', function(){
		$("#employee_list_report_generator").dialog("close");
	});
    
	$("#generator").on('click', function () {
			var parameters = "p_orga_id="+$("#organisationId").val()+"&p_user="+$("#user").val();
			var doc_format=$('input[name=reportFormat]:checked').val();
			var doc_name='';
			var link="\\hrm\\employee\\";
		
	    	if($('input:radio[name=reportType]:checked').val() == "employee" && $("#organisationId" ).val() ){
	    		//openBirtViewer("hrm/employee/employee_list.rptdesign", parameters);
	    		doc_name="<s:text name='report.docname.employee_list'/>";
	    		link=link+"employee_list.rptdesign";
				var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				//generateBIRTDoc(url);
				parameters=parameters+"&genQrCode=true&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", parameters);
		    }else if($('input:radio[name=reportType]:checked').val() == "employeeDetail" ){
		    	//openBirtViewer("hrm/employee/employee_general_report.rptdesign", parameters);
		    	doc_name="<s:text name='report.docname.employee_general_report'/>";
	    		link=link+"employee_general_report.rptdesign";
				var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				parameters=parameters+"&genQrCode=true&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", parameters);
				//generateBIRTDoc(url);				
			    }else{
			    	alert("<s:text name="form.input.alert.empty"/>");
			}
	});

});


			
</script>