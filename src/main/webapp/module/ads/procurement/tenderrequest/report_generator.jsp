<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="report_generator_content">
		<input id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>" type="hidden">
			<div id="report_generator" class="form-horizontal">
				<div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label class="radio radio-inline"> 
								</label>
								<label id="kfa" class="radio radio-inline"> 
								<input type="radio" class="radiobox" name="reportType" id="KFAReport" value="KFAReport" checked="checked"/>
									<span><s:text name="report.type.kfa.level"/></span>
								</label>
								<label id="reg" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="organisationReport" value="organisationReport"/>
									<span><s:text name='asset.legend.department'/></span>
								</label>
							</div>
				</div>
				<hr>
				
				<!-- START start_date -->
					<div class="form-group">
						<label class="col-md-4 control-label">*<s:text name='hrm.skill.label.start.date'/>:</label>
						<div class="col-md-8">
							<input id="start_date" name="start_date" class="form-control" type="text">
						</div>									
					</div>
				<!-- END start_date -->
				
				<!-- START end_date -->
					<div class="form-group">
						<label class="col-md-4 control-label">*<s:text name='hrm.skill.label.end.date'/>:</label>
						<div class="col-md-8">
							<input id="end_date" name="end_date" class="form-control" type="text">
						</div>									
					</div>
				<!-- END end_date -->
				
				<!-- START status-->
				<div class="form-group">
						<label class="col-md-4 control-label" >*<s:text name="annual.plan.status"/></label>
						<div class="col-md-8">
							<select class="form-control" id="status1" name="status">
							<option></option>
								<s:iterator value="statusList" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#el.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#el.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#el.getDOMTEXT_EN()" />
											</s:else>
									</option>
								</s:iterator>						
							</select>
						</div>
					</div>
				<!-- END status-->
				
				
				<div id="dept">
				<!-- START department -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="select-1">*<s:text name='asset.legend.department'/>:</label>
						<div class="col-md-8">
							<input id="department" class="form-control" name="department" type="text">
							<input id="deptId" name="deptId" type="hidden">
						</div>
					</div>
				<!-- END department -->
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
							<s:text name='label.button.generate.report'/>
						</button>
					</div>
				</div>
			</div>
			
			</div>
</div>
<script type="text/javascript">

$(document).ready(function() {

	$('#start_date').datetimepicker({
		lang: 'al',
		format: 'Y-m-d',
		mask: false,
		formatDate:'Y-m-d',
		timepicker: false,
	});
	$('#end_date').datetimepicker({
		lang: 'al',
		format: 'Y-m-d',
		mask: false,
		formatDate:'Y-m-d',
		timepicker: false,
	});
	var status="";
	$("#status1").on('change',function(event){
		status=this.value;
	});
	$("#dept").hide(); 
	  $("#department").val(null);
	  $("#deptId").val(null);
	  var doc_name="<s:text name='report.docname.kfa'/>";
	$("#report_generator input[name='reportType']").click(function(){
	    if($('input:radio[name=reportType]:checked').val() == "organisationReport"){
			   doc_name="<s:text name='report.docname.departamenti'/>";
			  $("#dept").show();
	    }

	    if($('input:radio[name=reportType]:checked').val() == "KFAReport"){
			 doc_name="<s:text name='report.docname.kfa'/>";
	    	  $("#dept").hide(); 
			  $("#department").val(null);
			  $("#deptId").val(null);
	    }
	    
	});
	$("#department").select2({
	    placeholder: "", 
	    minimumInputLength: 0,
	    ajax: {
	        url: "Input.organisation.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
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
	    	$("#deptId").val(item.id);
	    	$("#department").val(item.name);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	}); 

	$("#tender_report_generator").on('remove', function(event){
		$("#tr_print").removeClass("ui-state-disabled");
	});
	$("#cancelR").on('click', function(){
		$("#tender_report_generator").dialog("close");
	});
    
	$("#generator").on('click', function () {
		var doc_format=$('input[name=reportFormat]:checked').val();
		if($("#start_date").val() && $("#end_date").val()){
			if($("#organisationReport").is(":checked") && !$("#deptId").val()){
				alert("<s:text name="form.input.empty.alert"/>");
			}else{
 			//	var parameters = "p_org_id="+$("#deptId").val()+"&p_status="+$("#status").val()+"&p_start_date="+$("#start_date").val()+"&p_end_date="+$("#end_date").val();
				var parameters="p_start_date="+$("#start_date").val()+"&p_end_date="+$("#end_date").val()+"&p_user="+$("#user").val();
				if($("#deptId").val()){
					parameters+="&p_org_id="+$("#deptId").val();
				}
				if(status!=""){
					parameters+="&p_status="+status;
				}else{
					alert("<s:text name="form.input.empty.alert"/>"); 
							}
				var link="\\ads\\procurement\\procurement_report.rptdesign";
				//openBirtViewer(link, parameters);
				
				var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				//generateBIRTDoc(url);
				parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				downloadDoc("BirtReportGen.do", parameters);
				
			}
		}else{
			alert("<s:text name="form.input.empty.alert"/>"); 
		}
			
	});

});


			
</script>