<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<form id="app_rej_form" class="form-horizontal" action="ApproveRejectSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="requestId" name="requestId" value="<s:property value='requestId'/>" type="hidden">
				<input id="approvedRejected" name="approvedRejected" value="<s:property value='approvedRejected'/>" type="hidden">
				
				<!-- START requestStatus.note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="leave.ent.label.note" />:</label>
					<div class="col-md-10">
						<textarea id="requestStatus.note" name="requestStatus.note" class="form-control" placeholder="Default Text Field"><s:property value='requestStatus.note'/></textarea>
					</div>									
				</div>
				<!-- START requestStatus.note -->
				
				<!-- START attachment -->
				<input type="hidden" id="docNamesDecision" name="docNamesDecision" value="<s:property value="docNamesDecision"/>">
				<input type="hidden" id="docExtsDecision" name="docExtsDecision" value="<s:property value="docExtsDecision"/>">
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name='law.suit.label.attachement'/>:</label>
					<div class="col-md-10">
						<input id="decisionfile" name="decisionfile" type="file" class="btn btn-default btn-file" multiple onchange="getdecisionfileData(this);">
					</div>									
				</div>
				<!-- END attachment -->
				
			</fieldset>
				<footer class="form-actions" id="leaseRequest-button">
					<button id="saveAppRej" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
					<button id="cancelAppRej" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
				</footer>
		</form>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cancelAppRej").on('click', function() {
			$("#app_rej_popup_content").dialog('close');
			return false;
		});
		
		$("#saveAppRej").on('click', function() {
			$('#app_rej_form').submit();
			return false;
		});
		
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#app_rej_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("error_exists");
					if(errors){
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});						
					}else{
						jQuery("#request_grid").trigger("reloadGrid");
						$("#app_rej_popup_content").dialog('close');
						$("#approve_reject_butt").hide();
						
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>",
							content : "<s:text name='small.box.content'/>",
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
	function getdecisionfileData(myFile){
		var names="";
		var exts="";
		for(var i=0;i<myFile.files.length;i++){
		    var file = myFile.files[i];  
		    var filename = file.name;
		    names+=";"+filename;
		    var fileExt = filename.split('.').pop();
		    exts+=";."+fileExt;
		}
		
		$("#docNamesDecision").val(names);
		$("#docExtsDecision").val(exts);
	}
</script>
</html>