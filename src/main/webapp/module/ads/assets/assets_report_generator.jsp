<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<input id="user" type="hidden" name="user" value='<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>'>
		<div class="form-group">
		<fieldset>
			<legend></legend>
			<div class="col-md-9">
				<label class="radio radio-inline"> 
				</label>
				<label  class="radio radio-inline"> 
					<input type="radio" class="radiobox" name="reportName" id="dept" value="office" checked="checked"/>
					<span><s:text name="asset.legend.department"/></span>
				</label>
				<label class="radio radio-inline"> 
					<input type="radio" class="radiobox" name="reportName" id="staff" value="staff_assign"/>
					<span><s:text name="asset.legend.asset.staff.assign"/></span>
				</label>
			</div>
		</fieldset>
		</div>
<hr>
	<!-- widget content -->
	<div class="widget-body" id="report_generator_content">
			<form id="report_generator" class="form-horizontal">
			<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
				<hr>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.label.organisation"/>:</label>
						<div class="col-md-9">
							<input id="department" class="form-control" placeholder="Enter department name" type="text">
							<input id="departmentId" type="hidden">
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
						<button id="cancelR" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="generator" class="btn btn-primary" type="submit">
							<i class="fa fa-print"></i>
							<s:text name="label.button.generate.report"/>
						</button>
					</div>
				</div>
			</div>
			</form>
</div>
<script type="text/javascript">

$(document).ready(function() {
	$("#report_generator_content").on('remove',function(){
		$("#print_button").removeClass('ui-state-disabled');
	});
	
	var report_name='';
	if($('#dept').is(':checked')){
		report_name='office';
	}else if($('#service').is(':checked')){
		report_name='staff_assign';
	}
	$('#dept').on('change', function(){
		report_name='office';
	});
	$('#staff').on('change', function(){
		report_name='staff_assigned';
	});
	
	
  $("#departmentId").prop('required',true);
  $("#department").prop('required',true);

    $("#department").select2({
        placeholder: "<s:text name="asset.placeholder.enter.department.name"/>",
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
        	$("#departmentId" ).val( item.id);
        	$("#department").val(item.name);
            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    }); 
    
	$("#cancelR").on('click', function(){
		$("#report_generator_content").dialog("close");
	});
    
	$("#generator").on('click', function () {
		if($("#departmentId").val()){
// 				var link="ads/assets/"+report_name+"_assets_report.rptdesign";
				var parameters = "p_dep_id="+$("#departmentId").val()+"&p_user="+$("#user").val()+"&dep="+$("#department").val();
// 				openBirtViewer(link, parameters);
				
				var link="\\ads\\assets\\"+report_name+"_assets_report.rptdesign";
				var doc_format=$('input[name=reportFormat]:checked').val();
				var doc_name="<s:text name='report.docname.assets'/>";
				var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				//generateBIRTDoc(url);
				parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", parameters);				
				}else {
			alert('<s:text name="form.input.empty.alert"/>');
		}
		return false;
	});

});


			
</script>