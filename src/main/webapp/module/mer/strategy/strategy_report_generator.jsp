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
			<div id="report_generator" class="form-horizontal">
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
					<div class="form-group">
						<label class="col-md-2 contro
						l-label"></label>
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

$(document).ready(function() {

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
	
	$("#cancelR").on('click', function(){
		$("#report_generator_content").dialog("close");
	});
    
	$("#generator").on('click', function () {
		if($("#planPeriodId").val()){
			var parameters = "p_plan_period_id="+$("#planPeriodId").val()+"&p_user="+$("#user").val();
			var link="\\mer\\strategy\\strategy_report";
// 			openBirtViewer(link, parameters);
			var loc="<s:text name='locale.language'/>";
			if(loc=="al"){
				link+="_generator.rptdesign";
				}else{
					link+="_en_generator.rptdesign";
					}
			var doc_name="<s:text name='mer.strategy.menu'/>";
			var doc_format=$('input[name=reportFormat]:checked').val();
			var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			downloadDoc("BirtReportGen.do", parameters);
			//generateBIRTDoc(url);
// 			var link_test="mer/strategy/strategy_report_generator.rptdesign";
// 			openBirtViewer(link_test,parameters);
		}else{
			alert("<s:text name="form.input.alert.select"/>"); 
		}
			
	});

});


			
</script>