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
	<div class="widget-body" id="report_generator_content">
	<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
	<br><br>
	<fieldset>
	<input type="hidden" id="org_id" name="org_id" value="<s:property value="org_id"/>">
			<div id="report_generator" class="form-horizontal">
			<div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
<!-- 								<label class="radio radio-inline">  -->
<!-- 								</label> -->
								<label id="exc" class="radio radio-inline"> 
								<input type="radio" class="radiobox" name="reportType" id="KFAReport" value="KFAReport" checked="checked"/>
									<span><s:text name="mer.execution.tab"/></span>
								</label>
								<label id="perf" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="regionalReport" value="regionalReport"/>
									<span><s:text name='mer.performance.indicator.tab'/></span>
								</label>
								<label id="strat" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="municipalityReport" value="municipalityReport"/>
									<span><s:text name='mer.strategy.indicator.tab'/></span>
								</label>
							</div>
				</div>
				<!-- START strategy.planPeriod -->
				<s:if test="fieldErrors.get('strategy.planPeriod')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.merPlanPeriod'/></label>
						<div class="col-md-10">
							<input id="planPeriod" name="planPeriod" class="form-control" type="text">
							<input id="planPeriodId" name="planPeriodId" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.planPeriod')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.merPlanPeriod'/></label>
						<div class="col-md-10">
							<input id="planPeriod" name="planPeriod" class="form-control" type="text">
							<input id="planPeriodId" name="planPeriodId" class="form-control" value="<s:property value='planPeriodId'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END strategy.planPeriod -->
				<s:if test="org_id==null">
				<div id="municipality">
<!-- 				START report.municipality -->
					<div class="form-group">	
						<label class="col-md-2 control-label"><s:text name='hum.employee.label.organisation'/>:</label>
						<div class="col-md-10">
							<input id="org" class="form-control" placeholder="<s:text name='hum.employee.label.organisation'/>" type="text">
						</div>
					</div>	
<!-- 				END report.municipality -->
				</div>
				</s:if>
				<div id="stratperiod">
				<legend><s:text name='fin.allocation.label.period'/></legend>
				<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='execute.report.start.year'/></label>
						<div class="col-md-10">
							<input  id="startYear" onchange="controlStartYear(this.value)" name="startYear" value="<s:property value='indicatorTarget.year'/>" class="form-control" placeholder="<s:text name='annu.felling.label.year'/>" type="text">
						</div>									
				</div>
				<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='execute.report.end.year'/></label>
						<div class="col-md-10">
							<input id="endYear" onchange="controlEndYear(this.value)"  name="endYear" value="<s:property value='indicatorTarget.year'/>" class="form-control" placeholder="<s:text name='annu.felling.label.year'/>" type="text">
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
				</div>
			</fieldset>	
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
<script type="text/javascript">
function controlEndYear(val) {
	if(val<$("#startYear").val()){
	$('#endYear').val("");
	alert("<s:text name='execute.end.year.must.be.bigger.than.start'/>");	
	val=null;
	}
}
function controlStartYear(val) {
	if($("#endYear").val()){
		if(val>$("#endYear").val()){
			$('#startYear').val("");
			alert("<s:text name='execute.end.year.must.be.bigger.than.start'/>");	
			val=null;
			}
		}
}
$(document).ready(function() {
	$("#pdfReport").attr('checked', 'checked');
	var radioSel=$('input[name=reportType]:checked').val(); 
	$('#startYear').mask('9999');
	$('#endYear').mask('9999');
	$("#stratperiod").hide();
// if(radioSel)
	$("input[name=reportType]:radio").change(function () {
		radioSel=$('input[name=reportType]:checked').val();
		if(radioSel=="regionalReport"){
			$("#stratperiod").show();
			}else{
				$("#stratperiod").hide();
				$('#startYear').val("");
				$('#endYear').val("");
				}
		});

var report_name='execution';
$("#exc").on('click', function(){
	report_name='execution';
});
$("#perf").on('click', function(){
// 	if()
	report_name='perf_indicator';
});
$("#strat").on('click', function(){
	report_name='strat_indicator';
});
	$("#planPeriod").select2({
	    placeholder: "", 
	    minimumInputLength: 1,
	    ajax: {
	        url: "MERInput.planPeriod.do",
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
	    formatResult: function(item){
		    if(item){
            	var desc =
                '<div style="bordstrategypx solid #333333;  padding: 5px;">' +
                    "<div><i class='fa fa-chevron-circle-right'> Period : " + item.start_year +"-"+ item.end_year+ "</div>" +
                '</div>';
            	return desc;
            }
            return "";
	    },
	    formatSelection: function(item) {
	    	$("#planPeriodId").val(item.id);
	    	var val=item.start_year+"-"+item.end_year;
	    	$("#planPeriod").val(val);
	        return val;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	}); 
	$("#org").autocomplete({
		source: function( request, response ) {
			$.ajax({
				url: "Input.organisation.do?",
				dataType: "json",
				data: {
					featureClass: "P",
					style: "full",
					maxRows: 12,
					minLength: 1,
					name_startsWith: request.term
				},
				success: function( data ) {
					response( $.map( data, function(item) {
						return {
							label: item.name, 
							value: item.name,
							id: item.id 
						};
					}));
				}
			});
		},
		maxRows: 12,
		minLength: 2,
		change: function(event, ui) {
		},
		select: function( event, ui ) {
			$("#org_id").val(ui.item.id);
		},
		focus: function(event, ui) {
		}
	});
	$("#cancelR").on('click', function(){
		$("#report_generator_content").dialog("close");
	});
    var doc_name="";
	$("#generator").on('click', function () {
		radioSel=$('input[name=reportType]:checked').val();
		if(radioSel=="KFAReport"){
			doc_name="<s:text name='mer.execution.tab'/>";
			}else if(radioSel=="regionalReport"){
				doc_name="<s:text name='mer.performance.indicator.tab'/>";
				}else if(radioSel=="municipalityReport"){
					doc_name="<s:text name='mer.strategy.indicator.tab'/>";
					}
		if($("#planPeriodId").val() && report_name!=''){
			var parameters = "p_plan_period_id="+$("#planPeriodId").val()+"&p_user="+$("#user").val()+"&s_year="+$("#startYear").val()+"&e_year="+$("#endYear").val();
			if($("#org_id").val()!='' && $("#org_id").val()!=null){
				parameters+="&p_org_id="+$("#org_id").val();
			}
			var hasPeriod='true';
			if($("#startYear").val() && $("#endYear").val()){
				if($("#org_id").val()=='' || $("#org_id").val()==null){
					report_name='perf_indicator_strategy_no_org';
				}else{
					report_name='perf_indicator_strategy';
					}
				
			}else{
				if(radioSel=="regionalReport"){
					hasPeriod='false';
					}
				}
			var loc="<s:text name='locale.language'/>";
			var link="\\mer\\execution\\"+report_name;
			if(loc=="al"){
				link+="_report.rptdesign";
				}else{
					link+="_en_report.rptdesign";
					}
			if(hasPeriod=='false'){
				alert("<s:text name="form.input.alert.empty"/>"); 
				}else{
					var doc_format=$('input[name=reportFormat]:checked').val();
					var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					downloadDoc("BirtReportGen.do", parameters);
					//generateBIRTDoc(url);
					}
		}else{
			alert("<s:text name="form.input.alert.empty"/>"); 
		}
	});

});


			
</script>