<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="create_tender_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="create_tender_form" class="form-horizontal" action="CreateTenderSave.do" accept-charset="utf8" method="post">
				<input id="tenderRequest.id" name="tenderRequest.id" value="<s:property value='tenderRequest.id'/>" type="hidden">
				<input id="tenderRequest.declareOfNeeds" name="tenderRequest.declareOfNeeds" value="<s:property value='tenderRequest.declareOfNeeds'/>" type="hidden">
				<input id="tenderRequest.designationOfRequest" name="tenderRequest.designationOfRequest" value="<s:property value='tenderRequest.designationOfRequest'/>" type="hidden">
				<input id="tenderRequest.annualPlan" name="tenderRequest.annualPlan" value="<s:property value='tenderRequest.annualPlan'/>" type="hidden">
				<input id="tenderStatus.id" name="tenderStatus.id" value="<s:property value='tenderStatus.id'/>" type="hidden">
 				<input id="tenderStatus.status" name="tenderStatus.status" value="<s:property value='tenderdone.getDOMVALUE()'/>" type="hidden">
				<input id="attachment.id" name="attachment.id" value="<s:property value='attachment.id'/>" type="hidden">
				<input id="attachment.docName" name="attachment.docName" value="<s:property value='attachment.docName'/>" type="hidden">
				<input id="attachment.docType" name="attachment.docType" value="<s:property value='attachment.docType'/>" type="hidden">
				
				<!-- START tenderStatus.comment -->
				<s:if test="fieldErrors.get('tenderStatus.comment')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>:</label>
							<div class="col-md-10">
								<textarea id="tenderStatus.comment" name="tenderStatus.comment" class="form-control" placeholder="<s:text name='tender.request.analyse.comment'/>"> </textarea>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finInput.cumulativeValue')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name='tender.request.analyse.comment'/>:</label>
						<div class="col-md-10">
								<textarea id="tenderStatus.comment" name="tenderStatus.comment" class="form-control" placeholder="Default Text Field"><s:property value="tenderStatus.comment"/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END tenderStatus.comment -->
				<!-- START attachment -->
				<s:if test="fieldErrors.get('file')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name='tender.request.attachment'/>:</label>
					 	  <div class="col-md-10">
					      	<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('file')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='tender.request.attachment'/>:</label>
						<div class="col-md-10">
							<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
						</div>
					</div>
				</s:else>
				<!-- END attachment -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelTender" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveTender" class="btn btn-primary" type="submit">
							<s:text name='label.button.save'/>
						</button>
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
		$("#cancelTender").on('click', function () { 
			$("#dialogCreateTender").dialog("close");               
			return false;        
		});

		$("#saveTender").on('click', function () { 
			$('#create_tender_form').submit();
			return false;        
		});

	/**	$("#create_tender_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#create_tender_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exist");
 					if(!errors){
						$.smallBox({
							title : "Ruajtja eshte kryer me sukses.",
							content : "Ky mesazh do te largohet pas 5 sekondave!",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
 	 				}else{
						$.smallBox({
							title : "Ruajtja nuk mund te behet. Ju lutem korrigjoni gabimet! ",
							content : "Ky mesazh do te largohet pas 5 sekondave!",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
 	 	 			}
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});*/

		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#create_tender_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#create_tender_form_content").html(jqXHR.responseText);
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
						$("#rb_tdo").prop('checked','true');
						getTenderRequestByStatus("TDO");
						 
						$("#dialogCreateTender").dialog("close"); 
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
		})();
	});            
</script>