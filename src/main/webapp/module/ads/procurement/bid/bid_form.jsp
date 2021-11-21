<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="bid_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="bid_form" class="form-horizontal" action="BidSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="bid.legend.bid.data"/></legend>
				<input id="bid.id" name="bid.id" value="<s:property value='bid.id'/>" type="hidden">
				<input id="atach.id" name="atach.id" value="<s:property value='atach.id'/>" type="hidden">
				<input id="bid.docType" name="bid.docType" value="<s:property value='bid.docType'/>" type="hidden">
				<input id="bid.docName" name="bid.docName" value="<s:property value='bid.docName'/>" type="hidden">
				
				<!-- START bid.prcmtTenderRequest.id  -->
					<input type="hidden" id="bid.prcmtTenderRequest.id" name="bid.prcmtTenderRequest.id" value="<s:property value='bid.prcmtTenderRequest.id' />">
				<!-- END bid.prcmtTenderRequest.id   -->
				
				<!-- START bid.prcmtTenderBidder.id  -->
				<s:if test="fieldErrors.get('bid.prcmtTenderBidder.id')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name='bid.bidder'/>:</label>
					 	  <div class="col-md-10">
					      	 	<input id="bid.prcmtTenderBidder.companyName" name="bid.prcmtTenderBidder.companyName" class="form-control" placeholder="<s:text name='bid.bidder'/>" value="<s:property value='bid.prcmtTenderBidder.comopanyName' />">
					      		<input type="hidden" id="bid.prcmtTenderBidder.id" name="bid.prcmtTenderBidder.id" value="<s:property value='bid.prcmtTenderBidder.id' />">
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bid.prcmtTenderBidder.id')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label">*<s:text name='bid.bidder'/>:</label>
					 	  <div class="col-md-10">
					 	  		<input id="bid.prcmtTenderBidder.companyName" name="bid.prcmtTenderBidder.companyName" class="form-control" placeholder="<s:text name='bid.bidder'/>" value="<s:property value='bid.prcmtTenderBidder.companyName'/>">
					      		<input type="hidden" id="bid.prcmtTenderBidder.id" name="bid.prcmtTenderBidder.id" class="form-control" placeholder="<s:text name='bid.bidder'/>" value="<s:property value='bid.prcmtTenderBidder.id' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END bid.prcmtTenderBidder.id   -->

				<!-- START bid.bidValue -->
				<s:if test="fieldErrors.get('bid.bidValue')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name='bid.bidValue'/>:</label>
					 	  <div class="col-md-10">
					      	 	<input data='number' id="bid.bidValue" name="bid.bidValue" class="form-control"  value="<s:property value='bid.bidValue'/>">					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bid.bidValue')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label">*<s:text name='bid.bidValue'/>:</label>
					 	  <div class="col-md-10">
					 	  		<input data='number' id="bid.bidValue" name="bid.bidValue" class="form-control" value="<s:property value='bid.bidValue'/>">
					      </div>         
				     </div>
				</s:else>
				<!-- END bid.bidValue   -->
				
				<!-- START atach.attachment -->
				<s:if test="fieldErrors.get('file')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='tender.request.attachment'/>:</label>
					 	  <div class="col-md-10">
					      	 	<input class="btn btn-default btn-file" id="file" name="file" title="Please select a file" type="file" onchange="getFileData(this);">
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('file')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='tender.request.attachment'/>:</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="file" name="file" title="<s:text name='global.please.select.file'/>" type="file" onchange="getFileData(this);">
						</div>
					</div>
				</s:else>
				<!-- END atach.attachment -->				
				
				<div class="form-group">
					      <label class="col-md-2 control-label"><s:text name="tender.request.analyse.comment"/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="bid.note" name="bid.note" class="form-control" placeholder=""><s:property value='bid.note' /></textarea>
					      </div>         
				     </div>
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelBid" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"/>
						</button>
						<button id="saveBid" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"/>
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
    $("#bid\\.docName").val(filename);
    $("#bid\\.docType").val('.'+fileExt);
    
 }
	$(document).ready(function () {
		if($("#hideButtons").val()=='true'){
			$("#saveBid").hide();
			$("#saveBid").attr('disabled','disabled');
		}
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2',vMax:"9999999.99"});
		$("#bid\\.prcmtTenderBidder\\.companyName").select2({
		    placeholder: "<s:text name="organization.placeholder.enter.activity"/>", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.proTenderBidder.do",
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
		    	$("#bid\\.prcmtTenderBidder\\.id").val(item.id);
		    	$("#bid\\.prcmtTenderBidder\\.companyName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#bid\\.prcmtTenderBidder\\.companyName").select2("data", {id: "<s:property value='bid.prcmtTenderBidder.id'/>", name: "<s:property value="bid.prcmtTenderBidder.companyName"/>"});

		
		    
		$("#cancelBid").on('click', function () {  
			$.ajax({
				type : "GET",
				url : "Bid.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#bid_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
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

		Ladda.bind('#saveBid');			
		$("#saveBid").on('click', function () { 
			$("#bid_form :button").prop('disabled','disabled');
			$('#bid_form').submit();
			return false;        
		});

		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#bid_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#bid_form_content").html(jqXHR.responseText);
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
						jQuery("#bid_grid").trigger("reloadGrid");
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
			$("#bid_form :button").prop('disabled',false);				
		})();
		
		$("#bid\\.prcmtTenderRequest\\.id").val($("#tenderRequestId").val());	
	});            
</script>