<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/fileinput.min.css" />
<script type="text/javascript" src="js/bootstrap/fileinput.min.js"></script>
</head>
<body>
<!-- widget div-->
<div id="doc_edit_content">

	<jsp:include page="../../base/validation.jsp"></jsp:include>
	
	<!-- widget content -->
	<div class="widget-body">
<br><br>
		<form id="doc_edit_form" class="form-horizontal" action="DpDocEdit.do" accept-charset="utf8" enctype="multipart/form-data" method="post">
        <input type="hidden" name="doc.id" id="dp.doc.idid" value="<s:property value='doc.id'/>">
        <input type="hidden" name="docName" id="docName" value="<s:property value='docName'/>">
        <input type="hidden" name="docType" id="docType" value="<s:property value='docType'/>">
        <input type="hidden" name="docId" id="docId" value="<s:property value='docId'/>">
		  <div class="form-group">
			  <label class="control-label col-sm-4">*<s:text name="dp.doc.attachments"/></label>
			  <div class="col-md-6">
				<input type="file" class="file-loading" id="file" data-preview-file-type="any" name="file" onchange="getFileData(this);">			  
			  </div>
		  </div>	      
		       
		<div class="form-actions">
			<div class="row">
				<div class="col-md-12">
					<button id="cancelEdit" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
					<button id="saveEdit" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				</div>
			</div>
		</div>

		</form>
		
	</div>
	<!-- end widget content -->
	
</div>

<!-- end widget -->
<script type="text/javascript">
function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#docName").val(filename);
    $("#docType").val(fileExt);

}
	$(document).ready(function() {

// 		$("#fileUpload").fileinput({});
		
		$("#cancelEdit").on('click', function() {
			$("#doc_edit_content").dialog("close");
			return false;
		});
	    
		Ladda.bind('#saveEdit');
		$("#saveEdit").on('click', function() {
			if($('#doc_edit_form').valid()){
				$("#doc_edit_form :button").prop('disabled','disabled');
				$('#doc_edit_form').submit();
			}
			return false;
		});
		$("#file").fileinput({});
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
					$("#doc_edit_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
					if(!errors_exits){
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
						$("#doc_edit_content").dialog("close");	
						jQuery("#dp_grid").trigger("reloadGrid");							
					}else{
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}    	
			    },	    
				complete: function(xhr) {
				}
			});	
			$("#doc_edit_form :button").prop('disabled',false);			
		})();

			
	});
	
</script>
</body>
</html>