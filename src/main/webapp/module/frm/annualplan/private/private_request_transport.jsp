<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="private_request_transport_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="private_request_transport_form" class="form-horizontal" action="PrivateRequestTransportSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="privateRequest.id" name="privateRequest.id" value="<s:property value='privateRequest.id'/>" type="hidden">
				<input id="status.id" name="status.id" value="<s:property value='status.id'/>" type="hidden">
				<input id="annualplan.id" name="annualplan.id" value="<s:property value='annualplan.id'/>" type="hidden">
				<!-- START attachment -->
				<s:if test="fieldErrors.get('privateRequest.attachment')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='tender.request.attachment'/>: </label>
							<div class="col-md-10">
								<input id="file" name="file" type="file" class="btn btn-default btn-file" multiple onchange="getFileData(this);">
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('privateRequest.attachment')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name='tender.request.attachment'/>:</label>
						<div class="col-md-10">
								<input id="file" name="file" type="file" class="btn btn-default btn-file" multiple onchange="getFileData(this);">
						</div>
					</div>
				</s:else>
				<!-- END attachment -->
			   <!-- START status.remarks  -->
				<s:if test="fieldErrors.get('status.remarks')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>: </label>
							<div class="col-md-10">
								<textarea id="status.remarks" name="status.remarks" class="form-control" placeholder="<s:text name="annual.plan.status.remarks"/>" ></textarea>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('status.remarks')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name='tender.request.analyse.comment'/>:</label>
						<div class="col-md-10">
								<textarea id="status.remarks" name="status.remarks" class="form-control" placeholder="<s:text name="annual.plan.status.remarks"/>"></textarea>
						</div>
					</div>
				</s:else>			   
				<!-- END status.remarks -->	
				<input type="hidden" id="docNames1" name="docNames" value="<s:property value="docNames"/>" />
				<input type="hidden" id="docExts1" name="docExts" value="<s:property value="docExts"/>">			
				</fieldset>
		
		 <div class="form-actions">
					<div class="col-md-12">
						<button id="cancelTrn" class="btn btn-defoult" type="button">
							<s:text name="label.button.cancel"/>
						</button>
						<button id="saveTrn" class="btn btn-primary" type="submit">
							<s:text name="label.button.save"/>
						</button>
					</div>
			</div>
			
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">

function getFileData(myFile){
// 	alert(myFile.files.length);
	var names="";
	var exts="";
	for(var i=0;i<myFile.files.length;i++){
	    var file = myFile.files[i];  
	    var filename = file.name;
	    names+=";"+filename;
	    var fileExt = filename.split('.').pop();
	    exts+=";."+fileExt;
	}
	$("#docNames1").val(names);
	$("#docExts1").val(exts);
}

	$(document).ready(function () {
		$("input[data='number']").autoNumeric('init', {
			aDec : '.',
			aSep : ',',
			mDec : '2'
		});
		
		$("#saveTrn").on('click', function() {
			$(':button').prop('disabled','disabled');
			$('#private_request_transport_form').submit();
			return false;
		});

		$("#cancelTrn").on('click', function() {
			$("#private_request_transport_form_content").dialog("close");  
			return false;
		});
		

		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#private_request_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#private_request_transport_form_content").html(jqXHR.responseText);
					jQuery("#private_request_grid").trigger("reloadGrid");
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
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}	
					$(':button').prop('disabled',false);    	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();
	});            
</script>