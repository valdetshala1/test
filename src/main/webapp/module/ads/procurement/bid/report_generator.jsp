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
			<input id="bid.id" name="bid.id" value="<s:property value="bid.id"/>" type="hidden"/>
			<input id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>" type="hidden">
			<div id="report_generator" class="form-horizontal">
				<div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label class="radio radio-inline"> 
								</label>
								<label id="kfa" class="radio radio-inline"> 
								<input type="radio" class="radiobox" name="reportType" id="bidReport" value="bidReport" checked="checked"/>
									<span><s:text name="tender.bids"/></span>
								</label>
								<label id="reg" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="complaintReport" value="complaintReport"/>
									<span><s:text name='bid.complaint'/></span>
								</label>
							</div>
				</div>
				<hr>
				
				
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelRB" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="generatorRB" class="btn btn-primary" type="submit">
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
	var report="bid";
	$("#report_generator input[name='reportType']").click(function(){
	    if($('input:radio[name=reportType]:checked').val() == "bidReport"){
	    	report="bid";
	    }

	    if($('input:radio[name=reportType]:checked').val() == "complaintReport"){
	    	report="complaint";
	    }
	});

	$("#bid_report_generator").on('remove', function(event){
		$("#bid_report_id").removeClass("ui-state-disabled");
	});
	$("#cancelRB").on('click', function(){
		$("#bid_report_generator").dialog("close");
	});
    
	$("#generatorRB").on('click', function () {
		if(report!='' && $("#bid\\.prcmtTenderRequest\\.id").val()){
			var parameters="p_tender_request_id="+$("#bid\\.prcmtTenderRequest\\.id").val()+"&p_user="+$("#user").val();
			var link="ads/procurement/bid/"+report+"_report.rptdesign";
			openBirtViewer(link, parameters);
		}
	});

});


			
</script>