<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>

<!-- widget div-->
	<!-- widget content -->
	<div class="widget-body" id="report_generator_content">
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
									class="radiobox" name="reportType" id="regionalReport" value="regionalReport"/>
									<span><s:text name='report.type.regional.legend'/></span>
								</label>
								<label id="mun" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="municipalityReport" value="municipalityReport"/>
									<span><s:text name='bidder.cadastral.municipality'/></span>
								</label>
								<label id="prType" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="prodType" value="prodType"/>
									<span><s:text name="annu.seedling.label.prod.type"/></span>
								</label>
							</div>
					</div>
					<div id="productType">
						<div class="form-group">
							<label class="col-md-2 control-label" for="select-1">*<s:text name="annu.seedling.label.prod.type"/>:</label>
							<div class="col-md-10">
								<select class="form-control" id="seedInvProdType"
									name="seedInvProdType">
									<s:iterator value="prodTypeList" var="la">
										<option value="<s:property value="#la.getDOMKEY()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#la.getDOMTEXT()" />
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#la.getDOMTEXT_SR()" />
											</s:elseif>
											<s:else>
												<s:property value="#la.getDOMTEXT_EN()" />
											</s:else>
										</option>
									</s:iterator>
								</select>
								<input id="planRegionId" name="planRegionId" type="hidden">
							</div>
						</div>
					</div>
				<div id="regionR">
				<!-- START report.regionR -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name='frm.compartment.region.name'/>:</label>
						<div class="col-md-10">
							<input id="region" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
							<input id="planRegionId" name="planRegionId" type="hidden">
						</div>
					</div>
				<!-- END report.regionR -->
				</div>
				<div id="municipalityR">
				<!-- START report.municipalityR -->
					<div class="form-group">	
						<label class="col-md-2 control-label">*<s:text name='bidder.cadastral.municipality'/>:</label>
						<div class="col-md-10">
							<input id="municipality" class="form-control" placeholder="<s:text name='bidder.cadastral.municipality'/>" type="text">
							<input id="municipalityId" type="hidden">
						</div>
					</div>	
				<!-- END report.municipalityR -->
				</div>
				
				<!-- START low_seed_year -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='fin.contactor.from'/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="lowSeedYear" name="lowSeedYear"  data-date-format="YYYY" class="form-control" placeholder="<s:text name='annual.plan.year'/>" type="number"/>
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
					</div>
				<!-- END low_seed_year -->
				<!-- START upper_seed_year -->
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='fin.contactor.to'/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="upperSeedYear" name="upperSeedYear"  data-date-format="YYYY" class="form-control" placeholder="<s:text name='annual.plan.year'/>" type="number"/>
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
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
				<!-- END upper_seed_year -->
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
<!-- end widget div -->
</div>


<script src="js/libs/jquery.bb.custom.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		  $("#seedInvProdType").val("");
		  $("#municipalityR").hide();  
		  $("#regionR").hide();
		  $("#productType").hide();
		  
		  
    	$('#lowSeedYear').datetimepicker({
			timepicker:false,
			format:'Y', 
			mask:false,
			formatDate:'YYYY'});
		$('#lowSeedYear').mask('9999');
		
    	$('#upperSeedYear').datetimepicker({
			timepicker:false,
			format:'Y', 
			mask:false,
			formatDate:'YYYY'});
		$('#upperSeedYear').mask('9999');

		$("#region").autocomplete({
			source: function( request, response ) {
				$.ajax({
					url: "Input.region.do",
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
				$( "#planRegionId" ).val( ui.item.id);
			},
			focus: function(event, ui) {
			}
		});	
		$("#municipality").autocomplete({
			source: function( request, response ) {
				$.ajax({
					url: "Input.municipality.do",
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
				$( "#municipalityId" ).val( ui.item.id);
			},
			focus: function(event, ui) {
			}
		});
		$("#report_generator input[name='reportType']").click(function(){
		    if($('input:radio[name=reportType]:checked').val() == "municipalityReport"){
				  $("#municipalityR").show();  
				  $("#regionR").hide(); 
				  $("#planRegionId").val(null);
				  $("#region").val("");
				  $("#seedInvProdType").val("");
				  $("#productType").hide();
		    }

		    if($('input:radio[name=reportType]:checked').val() == "regionalReport"){
				  $("#municipalityR").hide();  
				  $("#municipalityId").val(null);
				  $("#municipality").val("");
				  $("#regionR").show();
				  $("#seedInvProdType").val("");
				  $("#productType").hide();
		    }

		    if($('input:radio[name=reportType]:checked').val() == "KFAReport"){
				  $("#municipalityR").hide();  
				  $("#regionR").hide();
				  $("#municipalityId").val(null);
				  $("#region").val("");
				  $("#municipality").val("");
				  $("#planRegionId").val("");
				  $("#seedInvProdType").val("");
				  $("#productType").hide();
		    }
		     if($('input:radio[name=reportType]:checked').val() == "prodType"){
				  $("#municipalityR").hide();  
				  $("#regionR").hide();
				  $("#municipalityId").val(null);
				  $("#region").val("");
				  $("#municipality").val("");
				  $("#planRegionId").val("");
				  $("#planRegionId").val("");
				  $("#regionR").hide();
				  $("#productType").show();
				  
		    }
		    
		    
		});
		$("#cancelR").on('click', function(){
			$("#report_generator_content").dialog("close");
		});
		$("#generator").on('click', function (){
			
			var checkedVal=$("#report_generator input[name='reportType']:checked").val();
			
			if($("#lowSeedYear").val() && $("#upperSeedYear").val()){
					
					var parameters = "p_mun_id="+$("#municipalityId").val()+"&p_low_seed_year="+$("#lowSeedYear").val()+"&p_upper_seed_year="+$("#upperSeedYear").val()+"&p_region_id="+$("#planRegionId").val()+"&p_prod_type="+$("#seedInvProdType").val();
// 					var link="frm/annualplan/seedling/inventory";
					var link="\\frm\\annualplan\\seedling\\inventory";
					var doc_format=$('input[name=reportFormat]:checked').val();
					var doc_name="";
					if($("#municipalityId").val() && checkedVal=='municipalityReport'){
						//	openBirtViewer(link+"/distribution_mun_report.rptdesign", parameters);
							doc_name="<s:text name='report.docname.municipality'/>";
							link=link+"\\distribution_mun_report.rptdesign";
							var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							//generateBIRTDoc(url);
							parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							downloadDoc("BirtReportGen.do", parameters);
						}else if($("#planRegionId").val() && checkedVal=='regionalReport'){
					//		openBirtViewer(link+"/distribution_region_report.rptdesign", parameters);
							doc_name="<s:text name='report.docname.regional'/>";
							link=link+"\\distribution_region_report.rptdesign";
							var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							//generateBIRTDoc(url);
							parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							downloadDoc("BirtReportGen.do", parameters);
					}else if($("#seedInvProdType").val() && checkedVal=='prodType'){
					//		openBirtViewer(link+"/prod_type_report.rptdesign", parameters);
							doc_name="<s:text name='report.docname.productName'/>";
							link=link+"\\prod_type_report.rptdesign";
							var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							generateBIRTDoc(url);
					}
					else if((!$("#planRegionId").val() && !$("#municipalityId").val()) && checkedVal=='KFAReport'){
					//		openBirtViewer(link+"/distribution_central_report.rptdesign", parameters);
							doc_name="<s:text name='report.docname.kfa'/>";
							link=link+"\\distribution_central_report.rptdesign";
							var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							generateBIRTDoc(url);
					}else{
						alert("<s:text name="form.input.alert.empty"/>"); 
					}
				}else{
					alert("<s:text name="form.input.alert.empty"/>"); 
					}
		});

	});

	
</script>