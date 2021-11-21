<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="tender_proceed_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="tender_request_form" class="smart-form" action="" accept-charset="utf8" method="post">
			<footer class="form-actions">
							<button id="contract" class="btn btn-primary" type="button">
								<s:text name="tender.request.button.contract"/>
							</button>
							<button id="cancelTender" class="btn btn-danger" type="button">
								<s:text name="tender.request.button.cancel.tender"/>
							</button>
							
			</footer>
		</form>
	</div>
	<!-- end widget content -->
	
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {
		$("#cancelTender").on('click', function () {
			$("#tender_proceed_form_content").dialog('close');
			openDialogForm('cancel_tender_form_content',"TenderRequest.cancelTender.do?tenderRequestId="+$("#tenderRequest\\.id").val(),"<s:text name='tender.cancel.tender'/>",600,400);
		});
		 
		$("#contract").on('click', function () {
			var link = "Input.selectedBidder.do?tender_id="+$("#tenderRequest\\.id").val();
		       $.ajax({
		        type : "GET", // GET or POST
		        url : link, // the file to call
		        async : false,
		        beforeSend:function(jqXHR, settings) {
		        },
		        error : function(errorThrown, status, jqXHR) { // on error..
		         alert("error:" + errorThrown + ", status:" + status);
		        },
		        dataType: "json",
		        data: {
				      featureClass: "P",
				      style: "full",
				      maxRows: 12,
		    	 },
		         success : function(data, status, jqXHR) { // on success..
			         if(data.length>0){
			        	 $("#tender_proceed_form_content").dialog('close');
			        	 openDialogForm('tender_contract_form_content',"TenderContract.form.do?tenderId="+$("#tenderRequest\\.id").val(),"<s:text name='tender.create.contract'/>",600,800);
				     }else{
						alert('<s:text name="bid.contract.no.bid.selected"/>');
					 }
		        },
		        complete:function(jqXHR, textStatus){
		        }
		       }); 
		 });
		$("#tenderStatusId").val($("#tenderStatus\\.id").val());
		$("#attachId").val($("#attachment\\.id").val());	    	
	});
</script>