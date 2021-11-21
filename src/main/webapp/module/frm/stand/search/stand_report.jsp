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
			<div id="report_generator" class="form-horizontal">
			<input id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>" type="hidden">
				<div class="form-group">
						<label class="col-md-4 control-label"><s:text name='report.type.research'/></label>
							<div id="report_type_buttons" class="col-md-8">
								<label class="radio radio-inline"> 
								</label>
								<label id="managmentUnitReport" class="radio radio-inline">
									<input type="radio" class="radiobox" name="rType" id="munit" value="munit" checked="checked"/>
									<span><s:text name='annu.management.unit.menu'/></span>
								</label>
								<label id="compartmentReport" class="radio radio-inline">
									<input type="radio" class="radiobox" name="rType" id="comp" value="comp"/>
									<span><s:text name='frm.stand.compartment'/></span>
								</label>
								<label id="standReport" class="radio radio-inline">
									<input type="radio" class="radiobox" name="rType" id="stand" value="stand"/>
									<span><s:text name='frm.stand.stand'/></span>
								</label>
							</div>
				</div>
				<div class="form-group">
						<label class="col-md-4 control-label"><s:text name='report.type'/></label>
						<div id="report_type_buttons" class="col-md-8">
							<select class="form-control" id="reportType" name="reportType">
									<s:iterator value="reportTypeList" var="el">
										<option value="<s:property value="#el.getDOMKEY()" />">
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
				<hr>
				<div id="mngUnit" class="form-group">
					<label class="col-md-4 control-label">*<s:text name='annu.management.unit.menu'/>:</label>
					<div class="col-md-8">
						<input id="muName" name="muName" class="form-control" value="<s:property value='muName'/>" placeholder="" type="text">
						<input id="muId" name="muId" value="<s:property value='muId'/>" type="hidden">
						<input id="regionId" name="regionId" value="<s:property value='regionId'/>" type="hidden">
					</div>									
				</div>
				
				<div id="compDiv" class="form-group">
					<label class="col-md-4 control-label">*<s:text name='frm.stand.compartment'/>:</label>
					<div class="col-md-8">
						<input id="compName" name="compName" class="form-control" value="<s:property value='compName'/>" placeholder="" type="text">
						<input id="compId" name="compId" value="<s:property value='compId'/>" type="hidden">
					</div>									
				</div>
					
				<div id="standDiv" class="form-group">
					<label class="col-md-4 control-label">*<s:text name='frm.stand.stand'/>:</label>
					<div class="col-md-8">
						<input id="standName" name="standName" class="form-control" value="<s:property value='standName'/>" placeholder="" type="text">
						<input id="standId" name="standId" value="<s:property value='standId'/>" type="hidden">
					</div>									
				</div>
						
<!-- 				<div id="sel_grid" class="form-group"> -->
<!-- 					<div class=" col-md-12"> -->
<%-- 						<jsp:include page="selected_grid.jsp"></jsp:include> --%>
<!-- 					</div> -->
<!-- 				</div>	 -->
				
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="generator" class="btn btn-primary" type="button">
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
// 	$("#sel_grid").hide();
	
	$("#compDiv").hide();
	$("#standDiv").hide();
	$("#compName").prop('readonly',true);
	$("#standName").prop('readonly',true);
	
	$("#report_generator input[name='rType']").click(function(){
	    if($('input:radio[name=rType]:checked').val() == "munit"){
	    	$("#mngUnit").show();

	    	$("#compDiv").hide();
	    	$("#compName").select2("data", {id: "", name:""});
	    	if(!$("#muId").val()){
        		$("#compName").prop('readonly',true);
	    	}
	    	
			$("#standDiv").hide();
			$("#standName").select2("data", {id: "", name:""});
        	$("#standName").prop('readonly',true);

// 	    	$("#sel_grid").hide();
// 	    	$('#selected_grid').jqGrid('clearGridData');
// 	    	$("#stand_search_grid").jqGrid('resetSelection');
// 			selRows=[];
	    }

	    if($('input:radio[name=rType]:checked').val() == "comp"){

	    	$("#compDiv").show();
	    	
			$("#standDiv").hide();
			$("#standName").select2("data", {id: "", name:""});
			if(!$("#compId").val()){
        		$("#standName").prop('readonly',true);
			}
	    }

	    if($('input:radio[name=rType]:checked').val() == "stand"){
	    	$("#compDiv").show();
			$("#standDiv").show();
	    }
// 	    if($('input:radio[name=rType]:checked').val() == "sel"){
// 	    	$("#mngUnit").hide();
// 			$("#muName").val(null);
// 			$("#muId").val(null);
// 			$("#regionId").val(null);
// 			$("#sel_grid").show();
// 			$("#stand_search_grid").jqGrid('resetSelection');
// 	    }
	});

	$("#muName").select2({
		placeholder: "",
        minimumInputLength: 1,
        ajax: {
	        url: "Input.managementUnit.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
	        if(term == "") term = " ";   
	        return {
	        	name_startsWith: term
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
        	$("#muId").val(item.id);
        	$("#muName").val(item.name);
        	$("#regionId").val(item.region_id);

        	$("#compName").select2("data", {id: "", name:""});
        	$("#compName").prop('readonly',false);

        	$("#standName").select2("data", {id: "", name:""});
        	$("#standName").prop('readonly',true);

            return item.name;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    });

	$("#compName").select2({
		placeholder: "",
        minimumInputLength: 1,
        ajax: {
	        url: "Input.compartment.do?",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
	        if(term == "") term = " ";   
	        return {
	        	name_startsWith: term,
	        	mu_id: $("#muId").val()
	        };
	        },
	        results: function (data, page) { 
	        return { results: data };
	        },
	        cache: true
        },
        initSelection: function(element, callback) {
        },
        formatResult: function(item){
            return '<div class="row-fluid">' + '<div class="span10">'
    		+ '<div class="row-fluid">'
    		+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
    		+ item.comp_id + '</div></div></div></div>';
		},
        formatSelection: function(item) {
        	$("#compId").val(item.id);
        	$("#compName").val(item.comp_id);

        	$("#standName").select2("data", {id: "", name:""});
        	$("#standName").prop('readonly',false);

            return item.comp_id;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    });

	$("#standName").select2({
		placeholder: "",
        minimumInputLength: 1,
        ajax: {
	        url: "Input.stand.do?",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
	        if(term == "") term = " ";   
	        return {
	        	name_startsWith: term,
	        	mu_id: $("#muId").val(),
	        	comp_id: $("#compId").val(),
	        };
	        },
	        results: function (data, page) { 
	        return { results: data };
	        },
	        cache: true
        },
        initSelection: function(element, callback) {
        },
        formatResult: function(item){
            return '<div class="row-fluid">' + '<div class="span10">'
    		+ '<div class="row-fluid">'
    		+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
    		+ item.stand_id + '</div></div></div></div>';
		},
        formatSelection: function(item) {
        	$("#standId").val(item.id);
        	$("#standName").val(item.stand_id);
            return item.stand_id;
        },
        allowClear: true,
        escapeMarkup: function (m) { return m; }
    });
    
	$("#generator").on('click', function () {
		var reportType = $("#reportType").val();
		var researchType = $('input:radio[name=rType]:checked').val();
		if(reportType){
			var link="/frm/stand/"+reportType.toLowerCase();
			var parameters="p_user="+$("#user").val();
			var ttype=null;
			var doc_name="";
			if(researchType=="munit" && $("#muId").val()){
				ttype="mu";
				doc_name='<s:text name='annu.management.unit.menu'/>';
				parameters+="&p_region_id="+$("#regionId").val()+"&p_mu_id="+$("#muId").val();
			}else if(researchType=="comp" && $("#compId").val()){
				ttype="comp";
				parameters+="&p_comp_id="+$("#compId").val();
				doc_name='<s:text name='frm.stand.compartment'/>';

			}else if(researchType=="stand" && $("#standId").val()){
				ttype="stand";
				parameters+="&p_stand_id="+$("#standId").val();
				doc_name='<s:text name='frm.stand.stand'/>';
			}
			
			if(ttype){
				link+="/"+ttype+"_report.rptdesign";
// 				openBirtViewer(link, parameters);
				//var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
				//generateBIRTDoc(url);
				//http://192.168.0.33/geoserver/wms?LAYERS=vgis_coord_pl&amp;STYLES=&amp;FORMAT=image%2Fpng&amp;SERVICE=WMS&amp;VERSION=1.1.1&amp;REQUEST=GetMap&amp;SRS=EPSG%3A900916&amp;CQL_FILTER=stand_id=%27"+params["p_stand_id"].value+"%27%20or%20id="+params["p_act_id"].value+"&amp;BBOX="+params["p_box"].value+"&amp;WIDTH=300&amp;HEIGHT=300
					
				parameters=parameters+"&genQrCode=true&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
				downloadDoc("BirtReportGen.do", parameters);
			} else {
				alert("Please fill out mandatory fields!!");
			}
		} else {
			alert("Please fill out mandatory fields!!");
		}
		
	});

});


			
</script>