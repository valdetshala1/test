<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="complaint_content">
		<form id="bid_complaint_form" class="form-horizontal" action="BidComplaintSave.do" accept-charset="utf8" method="post">
			<div>
				<input id="bid.id" name="bid.id" value="<s:property value='bid.id'/>" type="hidden">
				<input id="complaint.prcmtTenderBid.id" name="complaint.prcmtTenderBid.id" value="<s:property value='complaint.prcmtTenderBid.id'/>" type="hidden">
				<input id="complaint.id" name="complaint.id" value="<s:property value='complaint.id'/>" type="hidden">
				<input id="complaint.docName" name="complaint.docName" value="<s:property value='complaint.docName'/>" type="hidden">
				<input id="complaint.docType" name="complaint.docType" value="<s:property value='complaint.docType'/>" type="hidden">
				<input type="hidden" id="complaint.prcmtTenderBid.prcmtTenderRequest.id" name="complaint.prcmtTenderBid.prcmtTenderRequest.id" value="<s:property value='complaint.prcmtTenderBid.prcmtTenderRequest.id' />">
				<!-- START complaint.complaint  -->
				<s:if test="fieldErrors.get('complaint.complaint')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="bid.complaint"/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="complaint.complaint" name="complaint.complaint" class="form-control" placeholder="Default Text Field"></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('complaint.complaint')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label">*<s:text name="bid.complaint"/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="complaint.complaint" name="complaint.complaint" class="form-control" placeholder="Default Text Field"><s:property value="complaint.complaint"/></textarea>
					      </div>         
				     </div>
				</s:else>
				<!-- END complaint.complaint-->	
				<!-- START attachment -->
				<s:if test="fieldErrors.get('complaint.doc')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="tender.request.attachment"/>:</label>
					 	  <div class="col-md-10">
					      	<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('complaint.doc')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="tender.request.attachment"/>:</label>
						<div class="col-md-10">
							<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
						</div>
					</div>
				</s:else>
				<!-- END attachment -->
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelComplaint" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
							<button id="saveComplaint" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
								<s:text name="label.button.save"></s:text>
							</button>
					</div>
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
    $("#complaint\\.docName").val(filename);
    $("#complaint\\.docType").val('.'+fileExt);
 }
	$(document).ready(function () {
		if(!$("#complaint\\.prcmtTenderBid\\.id").val()){
			$("#complaint\\.prcmtTenderBid\\.id").val($("#bid\\.id").val());
		}
		$("#cancelComplaint").on('click', function () {                    
			$("#bidComplaint").dialog('close');
			return false;        
		});
		if($("#hidePopupButtons").val()=='true'){
			$("#saveComplaint").hide();
			$("#saveComplaint").attr('disabled','disabled');
		}	

		Ladda.bind('#saveComplaint');	
		$("#saveComplaint").on('click', function () {
			$("#bid_complaint_form :button").prop('disabled','disabled');
			$('#bid_complaint_form').submit();
			return false;        
		});
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#complaint_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#complaint_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errrors_exist");
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
						$("#rb_pen").prop('checked','true');
						getTenderRequestByStatus("PEN");

						$("#bidComplaint").dialog('close');
						jQuery("#bid_grid").trigger('reloadGrid');
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
			$("#bid_complaint_form :button").prop('disabled',false);		
		})();

		$("#complaint\\.prcmtTenderBid\\.prcmtTenderRequest\\.id").val($("#tenderRequestId").val());
	});            
</script>