<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
<style type="text/css">
input[readonly] {
    background-color: #fff;
    /* any other styles */
}
</style>
</head>
<body>
<!-- widget div-->
<div id="item_receipt_content">

	<jsp:include page="../../base/validation.jsp"></jsp:include>

	<!-- widget content -->
	<div class="widget-body">

		<form id="item_receipt_form" class="form-horizontal" action="ItemReceiptSave.do" accept-charset="utf8" method="post">
		
        <input type="hidden" name="item.id" id="item.id" value="<s:property value='item.id'/>">
        
        <fieldset>
		<legend><s:text name="requisition.purchase.requisition"/></legend>
			
			<div class="form-group">
	          <label class="control-label col-sm-2">*<s:text name="order.item.name"/></label>
	          <div class="col-md-4">
	           <input class="form-control" readonly type="text" name="item.itemName" id="item.itemName" value="<s:property value='item.itemName'/>">
	          </div>
	          <label class="control-label col-sm-2">*<s:text name="order.item.qty.ordered"/></label>
	          <div class="col-md-4">
	           <input class="form-control" readonly type="text" name="item.qtyordered" id="item.qtyordered" value="<s:property value='item.qtyordered'/>">
	          </div>	          
	      	</div>
	      	
	      	<div class="form-group">
	          <label class="control-label col-sm-2">*<s:text name="order.item.qty.delivered"/></label>
	          <div class="col-md-4">
	           <input class="form-control" data="number" type="text" name="item.qtydelivered" id="item.qtydelivered" value="<s:property value='item.qtydelivered'/>">
	          </div>
	          <label class="control-label col-sm-2">*<s:text name="order.item.date.delivered"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="item.datedelivered" id="item.datedelivered" value="<s:property value='item.datedelivered'/>">
	          </div>	          
	      	</div>      
	      	
	      	<div class="form-group">
	      	  <label class="control-label col-sm-2">*<s:text name="order.item.qty.rejected"/></label>
	          <div class="col-md-4">
	           <input class="form-control" data="number" type="text" name="item.qtyrejected" id="item.qtyrejected" value="<s:property value='item.qtyrejected'/>">
	          </div>
	          <label class="control-label col-sm-2"><s:text name="order.item.qty.reserved"/></label>
	          <div class="col-md-4">
	           <input class="form-control" data="number" type="text" name="item.qtyreserved" id="item.qtyreserved" value="<s:property value='item.qtyreserved'/>">
	          </div>
	      	</div>
	      	</fieldset> 
			<fieldset>
			<legend><s:text name="law.suit.label.status"/></legend>
		      	<div class="form-group">
		          <label class="control-label col-sm-2"><s:text name="law.suit.label.status"/></label>
		          <div class="col-md-4">
					<select class="form-control" id="item.statusCode" name="item.statusCode">
						<option></option>
					    <option value="RE"><s:text name="item.status.reject"/></option>
					    <option value="CA"><s:text name="item.status.cancel"/></option>
					    <option value="CL"><s:text name="item.status.close"/></option>
					</select>
		          </div>
		          <label class="control-label col-sm-2"><s:text name="hum.employee.label.comment"/></label>
		          <div class="col-md-4">
		           <textarea class="form-control" name="msg" id="msg"><s:property value='msg'/></textarea>
		          </div>	          
		      	</div> 	      	
	      	</fieldset> 
		
		
		<div class="form-actions">
			<div class="row">
				<div class="col-md-12">
					<button id="cancelMR" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
					<button id="saveMR" class="btn btn-primary" type="submit">
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
	$("#item\\.id").val($("#itemId").val());
	$("#item\\.itemName").val($("#itemName").val());
	$("#item\\.qtyordered").val($("#itemQtyOrdered").val());
	
		$(function() {
		    $.ajaxSetup({
		        error: function(jqXHR, exception) {
		            if (jqXHR.status === 0) {
		                alert('Not connect.n Verify Network.');
		            } else if (jqXHR.status == 404) {
		                alert('Requested page not found. [404]');
		            } else if (jqXHR.status == 500) {
		                alert('Internal Server Error [500].');
		            } else if (exception === 'parsererror') {
		                alert('Requested JSON parse failed.');
		            } else if (exception === 'timeout') {
		                alert('Time out error.');
		            } else if (exception === 'abort') {
		                alert('Ajax request aborted.');
		            } else {
		                alert('Uncaught Error.n' + jqXHR.responseText);
		            }
		        }
		    });
		});	
		
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});

		$('#item\\.datedelivered').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});	

				
		$("#cancelMR").on('click', function() {
			$("#item_receipt_content").dialog("close");
			return false;
		});

		Ladda.bind('#saveMR');
		$("#saveMR").on('click', function() {
			$("#item_receipt_form :button").prop('disabled','disabled');
			$('#item_receipt_form').submit();
			return false;
		});	
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					 $("#item_receipt_content").html(XMLHttpRequest.responseText);
		        },
				success : function(data, status, jqXHR) {
					ajaxResponse(data, status, jqXHR);	
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});		
			$("#item_receipt_form :button").prop('disabled',false);
		})();


		$(".fieldErrors").each(function() {
			var fid = $(this).attr("id");
			fid = fid.replaceAll(".", "\\.");
			console.log(fid);
			//$("#requisition\\.organisation\\.orgaName").parent().parent().removeClass("form-group");
			
			if($("#" + fid).parent().parent().hasClass("form-group")){
// 				$("#" + fid).parent().parent().removeClass("form-group");
				$("#" + fid).parent().addClass("has-error");
			}
		});		

});

function ajaxResponse(data, status, jqXHR){
	$("#item_receipt_content").html(jqXHR.responseText);
	var errors = jqXHR.getResponseHeader("errors_exits");
	var check = $("#errors_exists").val();
	if(!errors){
		$("#order_item_grid").trigger("reloadGrid");
		$("#item_receipt_content").dialog("close");
		$.smallBox({
			title : '<s:text name="small.box.on.save.title.success"/>',
			content : '<s:text name="small.box.content"/>',
			color : "#739E73",
			timeout: 5000,
			icon : "fa fa-check",
			number : "1",
		});	
	}else{
		$.smallBox({
			title : '<s:text name="small.box.on.save.title.failed"/>',
			content : '<s:text name="small.box.content"/>',
			color : "#C79121",
			timeout: 5000,
			icon : "fa fa-shield fadeInLeft animated",
			number : "2",
		});
	}	
}

</script>
</body>
</html>