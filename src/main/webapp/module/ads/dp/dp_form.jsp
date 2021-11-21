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
<div id="dp_form_content">

	<jsp:include page="../../base/validation.jsp"></jsp:include>
	
	<!-- widget content -->
	<div class="widget-body">
	<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
		<form id="dpmngmt_form" class="form-horizontal" action="DpMngmtSave.do" accept-charset="utf8" enctype="multipart/form-data" method="post">
        <input type="hidden" name="dp.id" id="dp.id" value="<s:property value='dp.id'/>">
        <input type="hidden" name="dp.dpMngmtStatus.statusCode" id="dp.dpMngmtStatus.statusCode" value="<s:property value='dp.dpMngmtStatus.statusCode'/>">
        <input type="hidden" name="dp.created" id="dp.created" value="<s:date name="dp.created" format="dd.MM.YYY"/>">
        <input type="hidden" name="dp.personByCreatedby.id" id="dp.personByCreatedby" value="<s:property value='dp.personByCreatedby.id'/>">
        <input type="hidden" name="docOwnerId" id="docOwnerId" value="<s:property value='docOwnerId'/>">
        <input type="hidden" name="dp.dpMngmtStatus.msgType" id="dp.dpMngmtStatus.msgType" value="<s:property value='dp.dpMngmtStatus.msgType'/>">
        <s:if test="dp!=null && dp.id!=null">
		<fieldset>
		<legend><s:text name="dp.processing"></s:text></legend>
		  <div class="form-group">
		  	<label class="control-label col-sm-2"><s:text name="dp.last.processing"></s:text></label>
		    <div class="col-md-6">
		    <span class="label bg-color-darken txt-color-white"><s:text name="law.suit.label.status"/>: <s:property value='dp.dpMngmtStatus.statusCode'/></span>
		    <span class="label bg-color-darken txt-color-white"><s:text name="dp.message.type"/>: <s:property value='dp.dpMngmtStatus.msgType'/></span>
		    <span class="label label-primary"><s:text name="dp.from"/>:&nbsp;<s:property value='dp.dpMngmtStatus.organisationByFromDptId.orgaName'/></span>
		    <span class="label label-success"><s:text name="dp.to"/>:&nbsp;<s:property value='dp.dpMngmtStatus.organisationByToDptId.orgaName'/></span>
		    </div>
	        <label class="control-label col-sm-2"><s:text name="dp.action"/>*</label>
	        <div class="col-md-2">
				<select class="form-control" id="statusCode" name="statusCode">
					<option/>
					<option value="REC"><s:text name="dp.received"/></option>
					<option value="POS"><s:text name="dp.post"/></option>
				    <option value="FOR"><s:text name="dp.forward"/></option>
				</select>
	        </div>		    
		  </div>	   
		  
	      <div class="form-group">	      
	          <label class="control-label col-sm-2"><s:text name="dp.source.department"/></label>
	          <div class="col-md-4">
	           <input readonly class="form-control" type="text" name="fromDepartment" id="fromDepartment" value="<s:property value='dp.dpMngmtStatus.organisationByFromDptId.orgaName'/>">
	           <input class="form-control" type="hidden" name="fromDtp.id" id="fromDtp.id" value="<s:property value='dp.dpMngmtStatus.organisationByFromDptId.id'/>" />
	          </div>	      
	          <label class="control-label col-sm-2"><s:text name="dp.target.department"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="toDepartment" id="toDepartment" value="<s:property value='dp.dpMngmtStatus.organisationByToDptId.orgaName'/>">
	           <input class="form-control" type="hidden" name="toDtp.id" id="toDtp.id" value="<s:property value='dp.dpMngmtStatus.organisationByToDptId.id'/>"/>
	           <input class="form-control" type="hidden" name="toDtp.orgaName" id="toDtp.orgaName" value="<s:property value='toDtp.orgaName'/>"/>
	          </div>
	      </div>	
	      	
		</fieldset>
		</s:if>
		        
		<fieldset>
		<legend><s:text name="dp.document"/></legend>
	      <div class="form-group">	      
	          <label class="control-label col-sm-2"><s:text name="dp.message.type"/>*</label>
	          <div class="col-md-4">
					<select class="form-control" id="msgType" name="msgType">
					    <option value="U"><s:text name="dp.unicast"/></option>
					    <option value="M"><s:text name="dp.multicast"/></option>
					    <option value="B"><s:text name="dp.broadcast"/></option>
					</select>	           
	          </div>	      
	          <label class="control-label col-sm-2"><s:text name="dp.department.owner"/>*</label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="dp.organisation.orgaName" id="dp.organisation.orgaName">
	           <input class="form-control" type="hidden" name="dp.organisation.id" id="dp.organisation.id" value="<s:property value='dp.organisation.id'/>" />
	          </div>
	      </div>		
	      <div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="dp.document.type"/>*</label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="dp.docType.name" id="dp.docType.name">
	           <input class="form-control" type="hidden" name="dp.docType.id" id="dp.docType.id">
	          </div>
	          <label class="control-label col-sm-2"><s:text name="dp.document.owner"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="owner" id="owner">
	           <input class="form-control" type="hidden" name="dp.personByOwnerId.id" id="dp.personByOwnerId.id">
	          </div>
	      </div>
	      <div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="dp.doc.number"/></label>
	          <div class="col-md-4">
	           <input class="form-control uneditable-input" readonly="readonly" type="text" name="dp.documentno" id="dp.documentno" value="<s:property value='dp.documentno'/>" />
	          </div>
	          <label class="control-label col-sm-2"><s:text name="dp.doc.subject"/>*</label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="dp.docSubject" id="dp.docSubject" value="<s:property value='dp.docSubject'/>" />
	          </div>
	      </div>
	      <div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="dp.issued.date"/></label>
	          <div class="col-md-4">
				<div class="input-group date">
                   	<input type='text' id="dp.issuedDate" name="dp.issuedDate" value="<s:property value='dp.issuedDate'/>" data-date-format="dd.MM.YYYY" class="form-control" placeholder="Issued Date" type="date"/>
                   	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
               	</div>	           
	          </div>
	          <label class="control-label col-sm-2"><s:text name="dp.received.date"/></label>
	          <div class="col-md-4">
				<div class="input-group date">
                   	<input type='text' id="dp.receivedDate" name="dp.receivedDate" value="<s:property value='dp.receivedDate'/>" data-date-format="dd.MM.YYYY" class="form-control" placeholder="Rreceived Date" type="date"/>
                   	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
               	</div>	           
	          </div>
	      </div>
	      <div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="dp.shipper"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="dp.shipper" id="dp.shipper" value="<s:property value='dp.shipper'/>" />
	          </div>
	          <label class="control-label col-sm-2"><s:text name="dp.receiver.person"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="dp.receiver" id="dp.receiver" value="<s:property value='dp.receiver'/>" />
	          </div>
	      </div>		
		  <div class="form-group">
			  <label class="control-label col-sm-2"><s:text name="finance.type.label.description"/></label>
			  <div class="col-md-10">
   				 <textarea class="form-control" rows="3" id="comment"></textarea>
			  </div>
		  </div>	       
		  <div class="form-group">
			  <label class="control-label col-sm-2"><s:text name="dp.doc.attachments"/></label>
			  <div class="col-md-10">
				<input id="fileUpload" name="fileUpload" class="file-loading" type="file" multiple=true data-preview-file-type="any" data-upload-url="#">			  
			  </div>
		  </div>	      
		       
		</fieldset>
		
		<div class="form-actions">
			<div class="row">
				<div class="col-md-12">
					<button id="cancel" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
					<button id="save" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
	$(document).ready(function() {

		$("#msgType option[value='"+$("#dp\\.dpMngmtStatus\\.msgType").val()+"']").prop('selected', true);
		$("#statusCode option[value='"+$("#dp\\.dpMngmtStatus\\.statusCode").val()+"']").prop('selected', true);
		
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	    
		$('#dp\\.receivedDate').datetimepicker({
			lang: '<s:property value="#lang"/>',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});

		$('#dp\\.issuedDate').datetimepicker({
			lang: '<s:property value="#lang"/>',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});			

		
	    $("#dp\\.docType\\.name").select2({
	        placeholder: "Search for a repository",
	        minimumInputLength: 0,
	        ajax: {
		        url: "DpInput.docType.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	orgtype: "D",
		        	name_startsWith: term,
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
	        	$("#dp\\.docType\\.id").val(item.id);
	        	$("#dp\\.docType\\.name").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

	    $("#dp\\.docType\\.name").select2("data", {id: "<s:property value='dp.docType.id'/>", name: "<s:property value="dp.docType.name"/>"});
	    
		$("#dp\\.organisation\\.orgaName").select2({
		    placeholder: "Enter Department",
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
		    	$("#dp\\.organisation\\.id").val(item.id);
		    	$("#dp\\.organisation\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#dp\\.organisation\\.orgaName").select2("data", {id: "<s:property value='dp.organisation.id'/>", name: "<s:property value='dp.organisation.orgaName'/>"});

		$("#toDepartment").select2({
		    placeholder: "Enter Target Department",
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
		    	$("#toDtp\\.id").val(item.id);
		    	$("#toDepartment").val(item.name);
		    	$("#toDtp\\.orgaName").val(item.name);
		    	
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		$("#toDepartment").select2("data", {id: "<s:property value='dp.dpMngmtStatus.organisationByToDptId.id'/>", name: "<s:property value='dp.dpMngmtStatus.organisationByToDptId.orgaName'/>"});		
		if(!$("#toDtp\\.orgaName").val()){
			$("#toDtp\\.orgaName").val($("#toDepartment").val());
		}
		$("#owner").select2({
		    placeholder: "Enter Owner",
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.person.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	name_startsWith: term,
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
		    	$("#dp\\.personByOwnerId\\.id").val(item.id);
		    	$("#owner").val(item.name);
		    	$("#docOwnerId").val(item.id);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#owner").select2("data", {id: "<s:property value='dp.personByOwnerId.id'/>", name: "<s:property value='dp.personByOwnerId.firstName'/> <s:property value='dp.personByOwnerId.lastName'/>"});

		$("#fileUpload").fileinput({});
		
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "DpMngmt.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#dp_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
	    
		Ladda.bind('#save');
		$("#save").on('click', function() {
			if($('#dpmngmt_form').valid()){ 
				$("#dpmngmt_form :button").prop('disabled','disabled');
				$('#dpmngmt_form').submit();
			}
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
					$("#dp_form_content").html(jqXHR.responseText);
					jQuery("#dp_grid").trigger("reloadGrid");
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
			$("#dpmngmt_form :button").prop('disabled',false);			
		})();
	});
	
</script>
</body>
</html>