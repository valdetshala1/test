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

var AjaxDownloadFile = function (configurationSettings) {
    // Standard settings.
    this.settings = {
        // JQuery AJAX default attributes.
        url: "",
        type: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8"
        },
        data: {},
        // Custom events.
        onSuccessStart: function (response, status, xhr, self) {
        },
        onSuccessFinish: function (response, status, xhr, self, filename) {
        },
        onErrorOccured: function (response, status, xhr, self) {
        }
    };
    this.download = function () {
        var self = this;
        $.ajax({
            type: this.settings.type,
            url: this.settings.url,
            headers: this.settings.headers,
            data: this.settings.data,
            success: function (response, status, xhr) {
                // Start custom event.
                self.settings.onSuccessStart(response, status, xhr, self);

                // Check if a filename is existing on the response headers.
                var filename = "";
                var disposition = xhr.getResponseHeader("Content-Disposition");
                if (disposition && disposition.indexOf("attachment") !== -1) {
                    var filenameRegex = /filename[^;=\n]*=(([""]).*?\2|[^;\n]*)/;
                    var matches = filenameRegex.exec(disposition);
                    if (matches != null && matches[1])
                        filename = matches[1].replace(/[""]/g, "");
                }

                var type = xhr.getResponseHeader("Content-Type");
                var blob = new Blob([response], {type: type});

                if (typeof window.navigator.msSaveBlob !== "undefined") {
                    // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed.
                    window.navigator.msSaveBlob(blob, filename);
                } else {
                    var URL = window.URL || window.webkitURL;
                    var downloadUrl = URL.createObjectURL(blob);

                    if (filename) {
                        // Use HTML5 a[download] attribute to specify filename.
                        var a = document.createElement("a");
                        // Safari doesn"t support this yet.
                        if (typeof a.download === "undefined") {
                            window.location = downloadUrl;
                        } else {
                            a.href = downloadUrl;
                            a.download = filename;
                            document.body.appendChild(a);
                            a.click();
                        }
                    } else {
                        window.location = downloadUrl;
                    }

                    setTimeout(function () {
                        URL.revokeObjectURL(downloadUrl);
                    }, 100); // Cleanup
                }

                // Final custom event.
                self.settings.onSuccessFinish(response, status, xhr, self, filename);
            },
            error: function (response, status, xhr) {
                // Custom event to handle the error.
                self.settings.onErrorOccured(response, status, xhr, self);
            }
        });
    };
    // Constructor.
    {
        // Merge settings.
        $.extend(this.settings, configurationSettings);
        // Make the request.
        this.download();
    }
};

function showFile(response){
	  // It is necessary to create a new blob object with mime-type explicitly set
	  // otherwise only Chrome works like it should
	  //var newBlob = new Blob([blob], {type: "application/pdf"})
	  var newBlob = new Blob([new Uint8Array(response.responseText)], {type: "octet/stream"});

	  // IE doesn't allow using a blob object directly as link href
	  // instead it is necessary to use msSaveOrOpenBlob
	  if (window.navigator && window.navigator.msSaveOrOpenBlob) {
	    window.navigator.msSaveOrOpenBlob(newBlob);
	    return;
	  } 

	  // For other browsers: 
	  // Create a link pointing to the ObjectURL containing the blob.
	  const data = window.URL.createObjectURL(newBlob);
	  var link = document.createElement('a');
	  link.href = data;
	  link.download="file.pdf";
	  link.click();
	  setTimeout(function(){
	    // For Firefox it is necessary to delay revoking the ObjectURL
	    window.URL.revokeObjectURL(data);
	  }, 100);
}

	

function downloadFile(filename, data) {

    var a = document.createElement('a');
    a.style = "display: none";  
    //var blob = new Blob(data, {type: "application/pdf"});
    //var blob = new Blob([data]);
	var blob = new Blob([new Uint8Array(data)], {type: "octet/stream"});
    
    var url = window.URL.createObjectURL(blob);
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    setTimeout(function(){
        document.body.removeChild(a);
        window.URL.revokeObjectURL(url);  
    }, 100);     
}

function getDocument3(action, json){
  new AjaxDownloadFile({
      url: action,
      data: json
  });
}

function getDocument(action, json){

	console.log(action);
	console.log(json);
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", action, true);
	//xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	//xhr.setRequestHeader("Content-type", "application/json");
	xhr.responseType = "blob";
	xhr.onload = function () {
	    if (this.status === 200) {
	    	var file = window.URL.createObjectURL(this.response);
            var a = document.createElement("a");
            a.href = file;
            a.download = this.response.name || "Property Brochure";
            console.log(file);
            document.body.appendChild(a);
            a.click();
            
            window.onfocus = function () {                     
              document.body.removeChild(a)
            }
            		    
		    /*
	        var blob = new Blob([xhr.response]);
	        const url = window.URL.createObjectURL(blob);
	        var a = document.createElement('a');
	        a.href = url;
	        a.download = 'myFile.pdf';
	        a.click();
	        setTimeout(function () {
	            // For Firefox it is necessary to delay revoking the ObjectURL
	            window.URL.revokeObjectURL(data)
	                , 100
	        });
	        */
	        
	    }
	};
	
	//xhr.send(JSON.stringify(data));
	xhr.send(json);
}


function getDocumentX(action, json){
	$.ajax({
		  url: action,
		  type: "GET",
		  data: json,
		  dataType: 'binary',
		  responseType:'arraybuffer',
		  processData: false,
		  success: function(result){				  
			  // create unsigned Int array and convert this array into blob
			  var arrayBufferView = new Uint8Array(result);
			  var blob = new Blob( [ arrayBufferView ], { type:"application/pdf" } );
			  const url = window.URL.createObjectURL(blob);
			  window.open(url);
		  },
		  error: function (xhr, ajaxOptions, thrownError) {
			  console.log(xhr.status);
		      console.log(thrownError);
		  }
	});		
}


function getDocument6(action, json){
    var self = this;
    $.ajax({
        type: "GET",
        url: action,
        data: json,
        dataType: 'binary',
        responseType: 'arraybuffer',
        success: function (response, status, xhr) {
            // Start custom event.
            //self.settings.onSuccessStart(response, status, xhr, self);

            // Check if a filename is existing on the response headers.
            var filename = "";
            var disposition = xhr.getResponseHeader("Content-Disposition");
            if (disposition && disposition.indexOf("attachment") !== -1) {
                var filenameRegex = /filename[^;=\n]*=(([""]).*?\2|[^;\n]*)/;
                var matches = filenameRegex.exec(disposition);
                if (matches != null && matches[1])
                    filename = matches[1].replace(/[""]/g, "");
            }

            var type = xhr.getResponseHeader("Content-Type");
            var blob = new Blob([response], {type: 'arraybuffer'});
            //var blob = new Blob([response], {type: type});
            //let blob = new Blob([data], {type: 'arraybuffer'});

            if (typeof window.navigator.msSaveBlob !== "undefined") {
                // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed.
                window.navigator.msSaveBlob(blob, filename);
            } else {
                var URL = window.URL || window.webkitURL;
                var downloadUrl = URL.createObjectURL(blob);

                if (filename) {
                    // Use HTML5 a[download] attribute to specify filename.
                    var a = document.createElement("a");
                    // Safari doesn"t support this yet.
                    if (typeof a.download === "undefined") {
                        window.location = downloadUrl;
                    } else {
                        a.href = downloadUrl;
                        a.download = filename;
                        document.body.appendChild(a);
                        a.click();
                    }
                } else {
                    window.location = downloadUrl;
                }

                setTimeout(function () {
                    URL.revokeObjectURL(downloadUrl);
                }, 100); // Cleanup
            }

            // Final custom event.
            //self.settings.onSuccessFinish(response, status, xhr, self, filename);
        },
        error: function (response, status, xhr) {
            // Custom event to handle the error.
            //self.settings.onErrorOccured(response, status, xhr, self);
            console.log(status);
        }
    });
}

function getDocument2(action, json){

    $.ajax({
        type: 'GET',
        url : action, 
        data: json,
        async : false,
        //dataType: 'binary',
        responseType: 'blob',
        contentType: "application/json; charset=UTF-8",
        success : function(data, status, jqXHR){
            //var blob = data;
            //console.log(blob);
            console.log(data);
            console.log("----------1----------");


            var blob=new Blob([data]);
            var link=document.createElement('a');
            link.href=window.URL.createObjectURL(blob);
            link.download="test.pdf";
            link.click();
                        

            //const blob = new Blob([data], { type: 'application/pdf' });
            //const url= window.URL.createObjectURL(blob);
            //window.open(url);
                        
            //console.log(((new Date().getTime())-startTime)/1000);
                        
	        //console.log(data); //ArrayBuffer
	        //console.log(new Blob([data])) // Blob
	        
	        //var blobY = new Blob([data], {type:"application/pdf"});
	        //var file = new File([blobY], "C:\Daten\Development\Projects\kfis\BIRT\filename.pdf");

	        //window.open("data:application/pdf," + data);
	        
	          /*          
	        window.open("data:application/pdf," + escape(data));
	        
	        window.open("data:application/pdf;base64," + data);
	        window.open("data:application/pdf;base64," + data);
	        */

	        

/*
	        var a = document.createElement('a');
	        var pdfAsDataUri = "data:application/pdf;base64," + response;
	        a.download = 'export.pdf';
	        a.type = 'application/pdf';
	        a.href = pdfAsDataUri;
	        a.click();
	        

	        var a1 = document.createElement('a');
	        a1.href= "data:application/octet-stream;base64,"+response;
	        a1.target = '_blank';
	        a1.download = 'filename.pdf';
	        a1.click();	        	        
	        */
        },
        error: function (textStatus, errorThrown) {
        	console.log(textStatus);
            console.log(errorThrown);
        }
    });	

}

function QueryStringToJSON() {            
    var pairs = location.search.slice(1).split('&');
    
    var result = {};
    pairs.forEach(function(pair) {
        pair = pair.split('=');
        result[pair[0]] = decodeURIComponent(pair[1] || '');
    });

    return JSON.parse(JSON.stringify(result));
}

function getJsonFromUrl(url) {
	var query = url.split('?')[1];
	  
	var result = {};
	query.split("&").forEach(function(part) {
	    var item = part.split("=");
	    result[item[0]] = decodeURIComponent(item[1]);
	});

	return JSON.parse(JSON.stringify(result));
}

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

	
// 	    alert(selected.val() + ' ' + selected.text());

	
	var parameters;
// 	var selMonth1;
// 	var selMonth2;
	var userLevel='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
	//AllocationPrint.decision.do
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
			    	 var url="BirtReportGen.do?"+parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			    	 //var url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
					 //generateBIRTDoc(url);
					 var json = getJsonFromUrl(url);
					 console.log(json);
					 
			    	 //openBirtViewer("ads/finance/input/input_mun_month_report.rptdesign", parameters);
				     }else{
				    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
					     }
				}else if(periodType=="monthReport" && levelType=="regReport" ){
					if($("#month").val() && $("#year").val() && $("#orgaNameRegid").val() ){
						 doc_name="<s:text name='report.docname.reg_month'/>";
						 link=link+"input_reg_month_report.rptdesign";
				    	 parameters="p_month="+$("#month").val() +"&p_year="+$("#year").val()+"&p_reg="+$("#orgaNameRegid").val()+"&p_user="+$("#user").val()+"&p_region="+$("#orgaNameReg").val()+"&p_month_name="+$('#month option:selected').text()+"&p_status="+$("#finStat").val();
				    	 var url="BirtReportGen.do?"+parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
				    	 //var url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						 //generateBIRTDoc(url);
						 var json = getJsonFromUrl(url);
						 console.log(json);
				    	// openBirtViewer("ads/finance/input/input_reg_month_report.rptdesign", parameters);
						}else{
					    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
					     }
					}else if(periodType=="yearReport" && levelType=="munReport" ){
						if($("#year").val() && $("#orgaid").val()){
							doc_name="<s:text name='report.docname.mun_year'/>";
							link=link+"input_mun_year_report.rptdesign";
							parameters="p_year="+$("#year").val()+"&p_mun="+$("#orgaid").val()+"&p_user="+$("#user").val()+"&p_municipality="+$("#orgaName").val()+"&p_status="+$("#finStat").val();
							//var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							var url="BirtReportGen.do?"+parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							 //generateBIRTDoc(url);
					 var json = getJsonFromUrl(url);
					 console.log(json);
					    	// openBirtViewer("ads/finance/input/input_mun_year_report.rptdesign", parameters);
							}else{
						    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
						     }
					}else if(periodType=="yearReport" && levelType=="regReport" ){
					  if($("#year").val() && $("#orgaNameRegid").val()){
						 doc_name="<s:text name='report.docname.reg_year'/>";
					     //link=link+"input_reg_year_report.rptdesign";
					     link=link+"test.rptdesign";
					     
						 parameters="p_qrcode_content_url=dfsdf&p_year="+$("#year").val()+"&p_reg="+$("#orgaNameRegid").val()+"&p_user="+$("#user").val()+"&p_region="+$("#orgaNameReg").val()+"&p_status="+$("#finStat").val();
						 parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						 //var url="BirtReportGen.do?"+parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						 //var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
						 //generateBIRTDoc(url);
					// var json = getJsonFromUrl(url);
					 //console.log(json);
					 console.log(parameters);
					 alert(parameters);
					 getDocument("BirtReportGen.do", parameters);
// 				    	 openBirtViewer("ads/finance/input/input_reg_year_report.rptdesign", parameters);
						}else{
					    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
					     }
					}else if(periodType=="yearReport" && levelType=="genReport"){
						if($("#year").val()){
							 doc_name="<s:text name='report.docname.general_year'/>";
							 //link=link+"input_apk_year_report.rptdesign";
						     link=link+"test.rptdesign";
						     			 
							 parameters="p_year="+$("#year").val()+"&p_apk=200"+"&p_user="+$("#user").val()+"&p_status="+$("#finStat").val();
							 //var url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
//  							 var url="JasperReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&report_name="+doc_name+"&doc_format="+doc_format;
							 //generateBIRTDoc(url);
							 parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							//var url="BirtReportGen.do?"+parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							 //var json = getJsonFromUrl(url);
							 console.log(parameters);
							 alert(parameters);
							 getDocument("BirtReportGen.do", parameters);
						 	
// 					    	openBirtViewer("ads/finainput_apk_year_report.rptdesignnce/input/input_apk_year_report.rptdesign", parameters);
							}else{
						    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
						     }
					}else if(periodType=="monthReport" && levelType=="genReport"){
						if($("#month").val() && $("#year").val() ){
							 doc_name="<s:text name='report.docname.general_month'/>";
							 link=link+"input_apk_month_report.rptdesign";
							 parameters="p_month="+$("#month").val()+"&p_year="+$("#year").val()+"&p_apk=200"+"&p_user="+$("#user").val()+"&p_month_name="+$('#month option:selected').text()+"&p_status="+$("#finStat").val();
							 //var url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							 var url="BirtReportGen.do?"+parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
							 //generateBIRTDoc(url);
					 var json = getJsonFromUrl(url);
					 console.log(json);
							 
					    	 //openBirtViewer("ads/finance/input/input_apk_month_report.rptdesign", parameters);
							}else{
						    	 alert("<s:text name="form.input.fill.necesary.field"/>"); 
						     }
					}
					else{
						 alert("<s:text name="form.input.fill.necesary.field"/>");
						}


	});

});
			
</script>