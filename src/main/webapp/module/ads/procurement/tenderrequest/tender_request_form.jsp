<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="tender_request_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="tender_request_form" class="form-horizontal" action="TenderRequestSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="tender.reques.form.data"/></legend>
				<input id="tenderRequest.id" name="tenderRequest.id" value="<s:property value='tenderRequest.id'/>" type="hidden">
				<input id="attachment.id" name="attachment.id" value="<s:property value='attachment.id'/>" type="hidden">
				<input id="attachment.docName" name="attachment.docName" value="<s:property value='attachment.docName'/>" type="hidden">
				<input id="attachment.docType" name="attachment.docType" value="<s:property value='attachment.docType'/>" type="hidden">
				<input id="tenderStatus.id" name="tenderStatus.id" value="<s:property value='tenderStatus.id'/>" type="hidden">
				<input id="tenderRequestId" value="<s:property value='tenderRequestId'/>" type="hidden">
				<input id="tenderRequestStatus" name="tenderRequestStatus" value="<s:property value="tenderRequest.prcmtTenderStatus.status.getDOMKEY()"/>" type="hidden"/>
				
				<!-- START tenderRequest.designationOfRequest -->
				<s:if test="fieldErrors.get('tenderRequest.designationOfRequest')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="tender.request.designation"/>:</label>
						<div class="col-md-10">
							<input id="tenderRequest.designationOfRequest" name="tenderRequest.designationOfRequest" class="form-control" placeholder="<s:text name="tender.request.designation"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('tenderRequest.designationOfRequest')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="tender.request.designation"/>:</label>
						<div class="col-md-10">
							<input id="tenderRequest.designationOfRequest" name="tenderRequest.designationOfRequest" value="<s:property value='tenderRequest.designationOfRequest'/>" class="form-control" placeholder="<s:text name="tender.request.designation"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END tenderRequest.designationOfRequest -->
				<!-- START tenderRequest.declareOfNeeds  -->
				<s:if test="fieldErrors.get('tenderRequest.declareOfNeeds')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="tender.request.needs"/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="tenderRequest.declareOfNeeds" name="tenderRequest.declareOfNeeds" class="form-control" placeholder="<s:text name="tender.request.needs"/>"><s:property value='tenderRequest.declareOfNeeds' /></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('tenderRequest.declareOfNeeds')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label">*<s:text name="tender.request.needs"/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="tenderRequest.declareOfNeeds" name="tenderRequest.declareOfNeeds" class="form-control" placeholder="<s:text name="tender.request.needs"/>"><s:property value='tenderRequest.declareOfNeeds' /></textarea>
					      </div>         
				     </div>
				</s:else>
				<!-- END tenderRequest.declareOfNeeds   -->	
				
				<!-- START tenderRequest.organisation -->
				<s:if test="fieldErrors.get('tenderRequest.organisation')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.contract.organisation"/>:</label>
						<div class="col-md-10">
							<input id="tenderRequest.organisation.orgaName" name="tenderRequest.organisation.orgaName" class="form-control" type="text">
							<input id="tenderRequest.organisation.id" name="tenderRequest.organisation.id" value="<s:property value='tenderRequest.organisation.id'/>" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('tenderRequest.organisation')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="finance.contract.organisation"/>:</label>
						<div class="col-md-10">
							<input id="tenderRequest.organisation.orgaName" name="tenderRequest.organisation.orgaName" value="<s:property value='tenderRequest.organisation.orgaName'/>" class="form-control" placeholder="<s:text name="tender.request.designation"/>" type="text">
							<input id="tenderRequest.organisation.id" name="tenderRequest.organisation.id" value="<s:property value='tenderRequest.organisation.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END tenderRequest.organisation -->
				
				<s:if test="tenderRequestId==null">
				<div id="attach">
				<!-- START attachment -->
				<s:if test="fieldErrors.get('attachment')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="tender.request.attachment"/>:</label>
					 	  <div class="col-md-10">
					      	<input id="fileAtt" name="fileAtt" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('attachment')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="tender.request.attachment"/>:</label>
						<div class="col-md-10">
							<input id="fileAtt" name="fileAtt" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
						</div>
					</div>
				</s:else>
				<!-- END attachment -->
				</div>
				</s:if>
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
							<button id="cancel" class="btn btn-default" type="button">
								<s:text name="label.button.cancel"></s:text>
							</button>
						<s:if test="tenderRequestId==null">
							<button id="save" class="btn btn-primary ladda-button" type="button" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
								<i class="fa fa-save"></i>
								<s:text name="label.button.save"></s:text>
							</button>
						</s:if>
						<s:elseif test="tenderRequest.prcmtTenderStatus.status==rejected">
						</s:elseif>
						<s:elseif test="tenderRequest.prcmtTenderStatus.status==statusNew">
							<button id="analyse" class="btn btn-primary" type="button">
								<s:text name="tender.request.button.analyse"/>
							</button>
						</s:elseif>
						<s:elseif test="tenderRequest.prcmtTenderStatus.status==approved">
							<button id="createTender" class="btn btn-primary" type="button">
								<s:text name="tender.request.button.create.tender"/>
							</button>
						</s:elseif>
						<s:elseif test="tenderRequest.prcmtTenderStatus.status==tenderdone || tenderRequest.prcmtTenderStatus.status==republish">
							<button id="notifyPPRC" class="btn btn-primary" type="button">
								<s:text name="tender.request.button.cnotify.pprc"/>
							</button>
						</s:elseif>
						<s:elseif test="tenderRequest.prcmtTenderStatus.status!=contracted && tenderRequest.prcmtTenderStatus.status!=rejected && tenderRequest.prcmtTenderStatus.status!=canceled">
							<button id="proceed" class="btn btn-primary" type="button">
								<s:text name="tender.request.button.proceed"/>
							</button>
						</s:elseif>
						<s:elseif test="tenderRequest.prcmtTenderStatus.status==canceled">
							<button id="republish" class="btn btn-primary" type="button">
								<s:text name="tender.request.button.republish"/>
							</button>
						</s:elseif>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- end widget content -->
	
</div>
<!-- end widget div -->


<script type="text/javascript">
function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#attachment\\.docName").val(filename);
    $("#attachment\\.docType").val('.'+fileExt);
}
	$(document).ready(function () {
		if($("#tenderRequest\\.id").val()){
			$("#tender_request_form :input").attr('disabled','disabled');
			$("#tender_request_form :button").attr('disabled',false);
		}
		
	$("#createTender").on('click', function () { 
		openDialogForm('dialogCreateTender',"TenderRequest.createTenderPopup.do?tenderRequestId="+$("#tenderRequest\\.id").val(),"<s:text name='tender.create.tender.title'/>",600,400);
		 });
		
		$("#analyse").on('click', function () {    
			openDialogForm('dialogAnalyse',"TenderRequest.analysePopup.do?tenderRequestId="+$("#tenderRequest\\.id").val(),"<s:text name='tender.analyse.tender.title'/>",600,400);
		 });

		$("#notifyPPRC").on('click', function () {
			openDialogForm('dialogPPRCNotification',"TenderRequest.notifyPPRC.do?tenderRequestId="+$("#tenderRequest\\.id").val(),"<s:text name='tender.notify.pprc.title'/>",600,400);
		 });

		$("#proceed").on('click', function () {
			openDialogForm('tender_proceed_form_content',"TenderRequest.proceed.do?tenderRequestId="+$("#tenderRequest\\.id").val(),"<s:text name='tender.proceed.with.tender.title'/>",400,200);
		 });

		$("#republish").on('click', function () {
			openDialogForm('tender_republish_form_content',"TenderRequest.republish.do?tenderRequestId="+$("#tenderRequest\\.id").val(),"<s:text name='tender.republish.tender.title'/>",600,300);
		 });
		 
		$("#tenderRequest\\.organisation\\.orgaName").select2({
		    placeholder: "Enter activity",
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
			        	dom_code:"INFRS"
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
		    	$("#tenderRequest\\.organisation\\.id").val(item.id);
		    	$("#tenderRequest\\.organisation\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});
		if($("#tenderRequest\\.organisation\\.id").val()){
			$("#tenderRequest\\.organisation\\.orgaName").select2("data", {id: "<s:property value='tenderRequest.organisation.id'/>", name: "<s:property value="tenderRequest.organisation.orgaName"/>"});
		}
		$("#cancel").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "TenderRequest.tab.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#tender_request_tab_content").html(jqXHR.responseText);
					$.smallBox({
						title : "<s:text name="small.box.on.cancel.title"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C46A69",
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;        
		});
		Ladda.bind('#save');		
		$("#save").on('click', function () { 
// 			alert($("#fileAtt").value);
// 			var file = $("#fileAtt").files[0];  
// 		       var filename = file.name;
// 		       alert(filename);
			$("#tender_request_form :button").prop('disabled','disabled');
			$("#tender_request_form").submit();
			return false;        
		});
		
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#tender_request_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#tender_request_form_content").html(jqXHR.responseText);
					
					var errors_exits = jqXHR.getResponseHeader("errors_exist");
					if (errors_exits == "true") {
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					} else {
						$("#attach").hide();

						$("#rb_new").prop('checked','true');
						getTenderRequestByStatus("NEW");
						var link = "TenderRequest.tab.do?tenderRequestId=" + $("#tenderRequest\\.id").val();
	 					loadURL(link, $("#tender_request_tab_content"));
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}	    	
			    },	    
				complete: function(xhr) {
				}
			});	
			$("#tender_request_form :button").prop('disabled',false);			
		})();
		$("#tenderStatusId").val($("#tenderStatus\\.id").val());
		$("#attachId").val($("#attachment\\.id").val());	    	
	});
</script>