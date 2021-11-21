<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="tender_request_analyse_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="tender_status_contenet">
		<form id="tender_request_analyse_form" class="form-horizontal" action="TenderRequestAnalyseSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="tenderRequest.id" name="tenderRequest.id" value="<s:property value='tenderRequest.id'/>" type="hidden">
				<input id="tenderRequest.declareOfNeeds" name="tenderRequest.declareOfNeeds" value="<s:property value='tenderRequest.declareOfNeeds'/>" type="hidden">
				<input id="tenderRequest.designationOfRequest" name="tenderRequest.designationOfRequest" value="<s:property value='tenderRequest.designationOfRequest'/>" type="hidden">
				<input id="approved" name="approved" value="<s:property value='approved.getDOMVALUE()'/>" type="hidden">
				<input id="rejected" name="rejected" value="<s:property value='rejected.getDOMVALUE()'/>" type="hidden">
 				<input id="tenderStatus.status" name="tenderStatus.status" value="<s:property value='tenderStatus.status'/>" type="hidden">
				<input id="attachment.id" name="attachment.id" value="<s:property value='attachment.id'/>" type="hidden">
				<input id="tenderStatus.id" name="tenderStatus.id" value="<s:property value='tenderStatus.id'/>" type="hidden">
				<input id="attachment.docName" name="attachment.docName" value="<s:property value='attachment.docName'/>" type="hidden">
				<input id="attachment.docType" name="attachment.docType" value="<s:property value='attachment.docType'/>" type="hidden">
				
				<!-- START tenderRequest.annualPlan-->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="tender.request.analyse.is.in.annual.plan"/>:</label>
						<div class="col-md-10">
							<input id="checkAnnuPlan" name="checkAnnuPlan" type="checkbox">
							<input type="hidden" id="tenderRequest.annualPlan" name="tenderRequest.annualPlan" value="<s:property value='tenderRequest.annualPlan'/>">
						</div>
				</div>
				<!-- END tenderRequest.annualPlan-->
				
				<!-- START tenderStatus.comment  -->
				<s:if test="fieldErrors.get('tenderStatus.comment')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>: </label>
					 	  <div class="col-md-10">
					      		<textarea id="tenderStatus.comment" name="tenderStatus.comment" class="form-control" placeholder="<s:text name='tender.request.analyse.comment'/>"></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('tenderStatus.comment')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>:</label>
					 	  <div class="col-md-10">
					 	  
					      		<textarea id="tenderStatus.comment" name="tenderStatus.comment" class="form-control" placeholder="<s:text name='tender.request.analyse.comment'/>"><s:property value="tenderStatus.comment"/></textarea>
					      </div>         
				     </div>
				</s:else>
				<!-- END tenderStatus.comment-->	
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
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAnalyse" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="approvedAnalyse" class="btn btn-primary" type="submit">
							<s:text name="tender.request.button.approved"/>
						</button>
						<button id="rejectedAnalyse" class="btn btn-danger" type="button">
							<s:text name="tender.request.button.rejected"/>
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
		if(!'<s:property value="attachment.id"/>'){
			$('#tenderRequest\\.annualPlan').val("false");}
		else{	
			if($('#tenderRequest\\.annualPlan').val()){
				$('#checkAnnuPlan').prop('checked','true');
			}
			}
		$('#checkAnnuPlan').change(function(){
			 if($(this).is(':checked')){
					$('#tenderRequest\\.annualPlan').val("true");
			    } else {
			    	$('#tenderRequest\\.annualPlan').val("false");
			    }
		});

		
// 		$("#checkAnnuPlan").on('change',function(event){
// 			$('#tenderRequest\\.annualPlan').val($(check)[0].checked ? "true" : "false");
// 			alert($('#tenderRequest\\.annualPlan').val());
// 		});
		
		$("#cancelAnalyse").on('click', function () {
			$("#dialogAnalyse").dialog("close");                    
			return false;        
		});
		var reqStatus="";
		$("#approvedAnalyse").on('click', function () { 
			reqStatus="APR";
			$('#tenderStatus\\.status').val($("#approved").val());
			$('#tender_request_analyse_form').submit();
			return false;        
		});
		
		$("#rejectedAnalyse").on('click', function () { 
			reqStatus="REJ";
			$('#tenderStatus\\.status').val($("#rejected").val());
			$('#tender_request_analyse_form').submit();
			return false;        
		});
		
		/**$("#tender_request_analyse_form").submit(function() {
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
					$("#tender_status_contenet").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
 					if(!errors){
 						$("#tender_request_grid").trigger("reloadGrid");
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
					$("#tender_request_analyse_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	
					$("#tender_request_analyse_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
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
						getTenderRequestByStatus(reqStatus);
						if(reqStatus=="APR"){
						$("#rb_apr").prop('checked','true');
						}else{
							$("#rb_rej").prop('checked','true');
						}
						$("#dialogAnalyse").dialog("close"); 
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
// $("#tenderStatus\\.id").val($("#tenderStatusId").val());
// $("#attachment\\.id").val($("#attachId").val());		    	
	});            
</script>