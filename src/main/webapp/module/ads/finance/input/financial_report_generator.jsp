<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
	<!-- widget content -->
	<div class="widget-body"  >
		<form id="financial_report_form" class="form-horizontal" accept-charset="utf8" method="post">
		<input type="hidden" id="apkId" name="apkId"  value="<s:property value="apkId"/>">
		<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<fieldset>
				<div class="form-group" >
					<label class="col-m d-2 control-label">  </label>
						<div style="width: 400px">
							<div class="col-md-10" style="left:300px;overflow:hidden;">
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="monthReport" value="monthReport"/>
									<span><s:text name="report.wood.production.label.month"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="yearReport" value="yearReport"/>
									<span><s:text name="report.wood.production.label.year"/></span>
								</label>
							</div>
						</div>
				</div>
				<div class="form-group" id="leveldiv">
					<label class="col-m d-2 control-label">   </label>
						<div style="width: 450px">
							<div class="col-md-10" style="left:250px;overflow:hidden;">
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType1" id="munReport" value="munReport"/>
									<span><s:text name="bidder.cadastral.municipality"/></span>
								</label>
								<s:if test="user.getOrganisation().getOperLevelVal()=='C' ||  user.getOrganisation().getOperLevelVal()=='R'">
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType1" id="regReport" value="regReport"/>
									<span><s:text name="report.type.regional.legend"/></span>
								</label>
								</s:if>
								<s:if test="user.getOrganisation().getOperLevelVal()=='C'">
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType1" id="genReport" value="genReport"/>
									<span><s:text name="report.type.general.legend"/></span>
								</label>
								</s:if>
							</div>
						</div>
				</div>
				<div id="divYear">
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="report.wood.production.label.year"/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="year" name="year"  class="form-control" placeholder="<s:text name="report.wood.production.label.year"/>" />
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
					</div>
				</div>
				<div id="divMonth">	
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="report.wood.production.label.month"/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="month" name="month">
									<option value=""></option>
									<s:iterator value="monthList" var="st">
										<option value="<s:property value="#st.getSORT()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#st.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#st.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#st.getDOMTEXT_EN()" />
											</s:else>
										</option>	
									</s:iterator>
							</select>
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
				<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="law.suit.label.status"/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="finStat" name="finStat">
									<option value=""></option>
									<s:iterator value="fininputstatus" var="st">
										<option value="<s:property value="#st.getDOMKEY()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#st.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#st.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#st.getDOMTEXT_EN()" />
											</s:else>
										</option>	
									</s:iterator>
							</select>
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
		 var link="\\ads\\finance\\input\\";
		 var doc_format=$('input[name=reportFormat]:checked').val();
		 var doc_name='';
		     if(periodType=='monthReport' && levelType=='munReport'){
			     if($("#month").val() && $("#year").val() && $("#orgaid").val() ){
				    	 doc_name="<s:text name='report.docname.mun_month'/>";
				    	 link=link+"input_mun_month_report.rptdesign";
				    	 parameters="p_month="+$("#month").val() +"&p_year="+$("#year").val()+"&p_mun_id="+$("#orgaid").val()+"&p_user="+$("#user").val()+"&p_municipality="+$("#orgaName").val()+"&p_month_name="+$('#month option:selected').text()+"&p_status="+$("#finStat").val();
				    	 parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				    	 downloadDoc("BirtReportGen.do", parameters);
				     }else{
				    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
					 }
				}else if(periodType=="monthReport" && levelType=="regReport" ){
					if($("#month").val() && $("#year").val() && $("#orgaNameRegid").val() ){
						 doc_name="<s:text name='report.docname.reg_month'/>";
						 link=link+"input_reg_month_report.rptdesign";
				    	 parameters="p_month="+$("#month").val() +"&p_year="+$("#year").val()+"&p_reg="+$("#orgaNameRegid").val()+"&p_user="+$("#user").val()+"&p_region="+$("#orgaNameReg").val()+"&p_month_name="+$('#month option:selected').text()+"&p_status="+$("#finStat").val();
				    	 parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				    	 downloadDoc("BirtReportGen.do", parameters);
						}else{
					    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
					     }
					}else if(periodType=="yearReport" && levelType=="munReport" ){
						if($("#year").val() && $("#orgaid").val()){
							doc_name="<s:text name='report.docname.mun_year'/>";
							link=link+"input_mun_year_report.rptdesign";
							parameters="p_year="+$("#year").val()+"&p_mun="+$("#orgaid").val()+"&p_user="+$("#user").val()+"&p_municipality="+$("#orgaName").val()+"&p_status="+$("#finStat").val();
							parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							downloadDoc("BirtReportGen.do", parameters);
							}else{
						    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
						     }
					}else if(periodType=="yearReport" && levelType=="regReport" ){
					  if($("#year").val() && $("#orgaNameRegid").val()){
						 doc_name="<s:text name='report.docname.reg_year'/>";
					     link=link+"input_reg_year_report.rptdesign";
						 parameters="p_qrcode_content_url=dfsdf&p_year="+$("#year").val()+"&p_reg="+$("#orgaNameRegid").val()+"&p_user="+$("#user").val()+"&p_region="+$("#orgaNameReg").val()+"&p_status="+$("#finStat").val();
						 parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						 downloadDoc("BirtReportGen.do", parameters);
						}else{
					    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
					     }
					}else if(periodType=="yearReport" && levelType=="genReport"){
						if($("#year").val()){
							 doc_name="<s:text name='report.docname.general_year'/>";
							 link=link+"input_apk_year_report.rptdesign";
						     parameters="p_year="+$("#year").val()+"&p_apk=200"+"&p_user="+$("#user").val()+"&p_status="+$("#finStat").val();
							 parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			
							 downloadDoc("BirtReportGen.do", parameters);
							}else{
						    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
						     }
					}else if(periodType=="monthReport" && levelType=="genReport"){
						if($("#month").val() && $("#year").val() ){
							 doc_name="<s:text name='report.docname.general_month'/>";
							 link=link+"input_apk_month_report.rptdesign";
							 parameters="p_month="+$("#month").val()+"&p_year="+$("#year").val()+"&p_apk=200"+"&p_user="+$("#user").val()+"&p_month_name="+$('#month option:selected').text()+"&p_status="+$("#finStat").val();
							 parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							 downloadDoc("BirtReportGen.do", parameters);
							}else{
						    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
						     }
					}else{
						alert("<s:text name="form.input.fill.necesary.field"/>");
					}
	});

});
			
</script>