<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
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
<div id="preq_form_content">

	<jsp:include page="../../../base/validation.jsp"></jsp:include>

	<!-- widget content -->
	<div class="widget-body">

		<form id="preq_form" class="form-horizontal" action="PReqSave.do" accept-charset="utf8" method="post">
		
        <input type="hidden" name="requisition.id" id="requisition.id" value="<s:property value='requisition.id'/>">
        <input type="hidden" name="requisition.requisitionStatus.id" id="requisition.requisitionStatus.id" value="<s:property value='requisition.requisitionStatus.id'/>">
        <input type="hidden" name="requisition.requisitionStatus.statusCode" id="requisition.requisitionStatus.statusCode" value="<s:property value='requisition.requisitionStatus.statusCode'/>">
        <input type="hidden" name="requisition.created" id="requisition.created" value="<s:date name="requisition.created" format="dd.MM.YYY"/>">
        <input type="hidden" name="requisition.personByCreatedby.id" id="requisition.personByCreatedby" value="<s:property value='requisition.personByCreatedby.id'/>">
        <input type="hidden" name="requisition.dpMngmt.documentno" id="requisition.dpMngmt.documentno" value="<s:property value='requisition.dpMngmt.documentno'/>">
        <input type="hidden" name="requisition.dpMngmt.docSubject" id="requisition.dpMngmt.docSubject" value="<s:property value='requisition.dpMngmt.docSubject'/>">
        <input type="hidden" id="dpMngmt_id" name="dpMngmt_id"  value="<s:property value='requisition.dpMngmt.id'/>"/>
        <input type="hidden" id="documentno" name="documentno"  value="<s:property value='requisition.dpMngmt.documentno'/>"/>
        <input type="hidden" id="dpMngmt_docSubject" name="dpMngmt_docSubject"  value="<s:property value='requisition.dpMngmt.docSubject'/>"/>
        <input type="hidden" id="requisition.currency.description" name="requisition.currency.description"  value="<s:property value='requisition.currency.description'/>"/>
        <input type="hidden" id="requisition.currency.cursymbol" name="requisition.currency.cursymbol"  value="<s:property value='requisition.currency.cursymbol'/>"/>
        <input type="hidden" id="isBPartner" name="isBPartner"  value="<s:property value='requisition.isBpartner'/>"/>
        
        <fieldset>
		<legend><s:text name="requisition.purchase.requisition"/></legend>
	      	<div class="form-group">
	          <label class="control-label col-sm-2">*<s:text name="requisition.transactional.document"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="trxdoctype" id="trxdoctype">
	           <input class="form-control" type="hidden" name="requisition.dpMngmt.id" id="requisition.dpMngmt.id">
	          </div>
	          <label class="control-label col-sm-2">*<s:text name="requisition.department.owner"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="requisition.organisation.orgaName" id="requisition.organisation.orgaName" value="<s:property value='requisition.organisation.orgaName'/>">
	           <input class="form-control" type="hidden" name="requisition.organisation.id" id="requisition.organisation.id" value="<s:property value='requisition.organisation.id'/>" />
	          </div>	          
	      	</div>      
	      	
	      	<div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="requisition.req.no"/></label>
	          <div class="col-md-4">
	           <input class="form-control uneditable-input" readonly="readonly" type="text" name="requisition.requisitionNr" id="requisition.requisitionNr" value="<s:property value='requisition.requisitionNr'/>">
	          </div>
	          <label class="control-label col-sm-2"><s:text name="requisition.sub.dep"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="subdepartment" id="subdepartment"/>
	          </div>	          
	      	</div>

	      	<div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="requisition.destination.type"/></label>
	          <div class="col-md-4">
				<select class="form-control" id="requisition.destinationType" name="requisition.destinationType">
					<s:if test='requisition.destinationType == "E"'>
				    <option selected="selected" value="E"><s:text name="requisition.expense"/></option>
				    </s:if>
				    <s:else>
				    <option value="E"><s:text name="requisition.expense"/></option>
				    </s:else>
					<s:if test='requisition.destinationType == "I"'>
				    <option selected="selected" value="I"><s:text name="requisition.invertory"/></option>
				    </s:if>
				    <s:else>
				    <option value="I"><s:text name="requisition.invertory"/></option>
				    </s:else>				    
				    
				</select>		           
	          </div>
	          <label class="control-label col-sm-2"><s:text name="requisition.desired.date"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="requisition.desiredDate" id="requisition.desiredDate" value="<s:property value='requisition.desiredDate'/>">
	          </div>	          
	      	</div> 	      	
	      	 
	      	<div class="form-group">
	          <label class="control-label col-sm-2">*<s:text name="frm.private.request.requester"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="requisition.requesterName" id="requisition.requesterName" value="<s:property value='requisition.requesterName'/>">
	          </div>
	          <label class="control-label col-sm-2">*<s:text name="requisition.requester.phone"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="requisition.requesterPhone" id="requisition.requesterPhone" value="<s:property value='requisition.requesterPhone'/>">
	          </div>	          
	      	</div>	
	      	
	      	<div class="form-group">
	          <label class="control-label col-sm-2"><s:text name="requisition.total.amount"/></label>
	          <div class="col-md-4">
	          <input class="form-control uneditable-input" readonly="readonly" type="text" name="requisition.totalAmount" id="requisition.totalAmount" value="<s:property value='requisition.totalAmount'/>">
	          </div>	      	
	          <label class="control-label col-sm-2">*<s:text name="requisition.currency"/></label>
	          <div class="col-md-4">
	          <input class="form-control" type="text" name="currencyName" id="currencyName">
	          <input class="form-control" type="hidden" name="requisition.currency.id" id="requisition.currency.id" value="<s:property value='requisition.currency.id'/>">
	          </div>
	      	</div>      
		       
		</fieldset>
		
		<fieldset>
			<legend><s:text name="requisition.supplier"/></legend>
			
	      	<div class="form-group">
	          <label class="control-label col-sm-2">*<s:text name="requisition.business.partner"/>?</label>
	          <div class="col-md-4">
					<label class="radio radio-inline">
						<input type="radio" id="yesBpartner" class="radiobox" name="requisition.isBpartner" value="Y"><span><s:text name="rbac.permission.button.yes"/></span>
					</label>
					<label class="radio radio-inline">
						<input type="radio" id="noBpartner" class="radiobox" name="requisition.isBpartner" value="N"><span><s:text name="rbac.permission.button.no"/></span>
					</label>
	          </div>
	          <div id="bpartner_content">
	          <label class="control-label col-sm-2">*<s:text name="business.partner"/></label>
	          <div class="col-md-4">
	           <input class="form-control" type="text" name="requisition.bpartner.name" id="requisition.bpartner.name"/>
	           <input class="form-control" type="hidden" name="requisition.bpartner.id" id="requisition.bpartner.id" value="<s:property value='requisition.bpartner.id'/>">
	          </div>
	          </div>	          
	      	</div> 
	      	<div id="supplier_content">
		      	<div class="form-group">
		          <label class="control-label col-sm-2">*<s:text name="requisition.supplier"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="requisition.supplierName" id="requisition.supplierName" value="<s:property value='requisition.supplierName'/>">
		          </div>
		          <label class="control-label col-sm-2">*<s:text name="finance.contractor.label.contact.person"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="requisition.supplierContact" id="requisition.supplierContact" value="<s:property value='requisition.supplierContact'/>">
		          </div>	          
		      	</div>	
		      	
		      	<div class="form-group">
		          <label class="control-label col-sm-2">*<s:text name="bidder.address"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="requisition.supplierAddress" id="requisition.supplierAddress" value="<s:property value='requisition.supplierAddress'/>">
		          </div>
		          <label class="control-label col-sm-2">*<s:text name="requisition.web.site"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="requisition.supplierSite" id="requisition.supplierSite" value="<s:property value='requisition.supplierSite'/>">
		          </div>	          
		      	</div>	      	
	
		      	<div class="form-group">
		          <label class="control-label col-sm-2">*<s:text name="bidder.contact.phone"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="requisition.supplierPhone" id="requisition.supplierPhone" value="<s:property value='requisition.supplierPhone'/>">
		          </div>
		          <label class="control-label col-sm-2">*<s:text name="requisition.fax"/></label>
		          <div class="col-md-4">
					<input class="form-control" type="text" name="requisition.supplierFax" id="requisition.supplierFax" value="<s:property value='requisition.supplierFax'/>">
		          </div>	          
		      	</div>
	      	</div>			
		</fieldset>
		
        <fieldset>
			<legend><s:text name="requisition.purchase.items"/></legend>
			<s:if test="requisition !=null && requisition.id != null">
			<div id="item_grid_errors"></div>
       		<div>
       		<jsp:include page="requsition_item_grid.jsp"></jsp:include>
       		</div>
       		</s:if>
       		<s:else>
       		<span class="label label-info"><s:text name="requisition.after.saveing.req"/></span>
       		</s:else>
		</fieldset>		
		
		<div class="form-actions">
			<div class="row">
				<div class="col-md-12">
					
					<s:if test="requisition != null && requisition.id != null">
					<button id="prstatus" class="btn btn-default" type="button">
						<i class="fa fa-gears"></i>
						<s:text name="label.button.processing"></s:text>
					</button>
					</s:if>
					
					<s:if test="requisition != null && requisition.id != null && requisition.statusCode == 'AP'">	
					<button id="pr2po" class="btn btn-default" type="button">
						<i class="fa fa-copy"></i>
						<s:text name="label.button.copy.pr2po"></s:text>
					</button>				
					</s:if>
					
					<button id="cancel" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
					<button id="save" class="btn btn-primary" type="submit">
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

		if($("#requisition\\.requisitionStatus\\.statusCode").val()=='AP'){
			$("#save").prop('disabled','disabled');
			$("#prstatus").prop('disabled','disabled');
			$("#preq_form :input").prop('readonly',true);
		}
		
		if($("#isBPartner").val()=="Y"){
			$("#bpartner_content").show();
			$("#supplier_content").hide();
			$("#yesBpartner").prop('checked',true);
			$("#requisition\\.isBpartner").val("Y");
		}else {
			$("#bpartner_content").hide();
			$("#supplier_content").show();
			$("#noBpartner").prop('checked',true);
			$("#requisition\\.isBpartner").val("N");
		}
		
		$("#noBpartner").on('change', function(){
			$("#bpartner_content").hide();
			$("#supplier_content").show();
			$("#requisition\\.isBpartner").val("N");
		});
		$("#yesBpartner").on('change', function(){
			$("#bpartner_content").show();
			$("#supplier_content").hide();
			$("#requisition\\.isBpartner").val("Y");
		});
		
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});

		$('#requisition\\.desiredDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});	

		$("#requisition\\.bpartner\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 1,
	        ajax: {
		        url: "OrderMgmtInput.busPartner.do",
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
            formatResult : function(item){
                if(item){
                	var desc =
                    '<div style="border: 1px solid #333333;  padding: 5px;">' +
                        "<div>Name : " + item.name + "</div>" +
                    '</div>';
                	return desc;
                }
                return "";
                
            },
            formatSelection: function(item){
            	$("#requisition\\.bpartner\\.id").val(item.id);
            	$("#requisition\\.bpartner\\.name").val(item.name);
	            return item.name;
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

	    
	    $("#requisition\\.bpartner\\.name").select2("data", {id: "<s:property value='requisition.bpartner.id'/>", name: "<s:property value='requisition.bpartner.name'/>"});

	    
	    $("#trxdoctype").select2({
	        placeholder: "<s:text name="requisition.search.transactional.doc"/>",
	        minimumInputLength: 0,
	        ajax: {
		        url: "OrderMgmtInput.txndocs.do",
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
            formatResult : function(item){
                if(item){
                	var desc =
                    '<div style="border: 1px solid #333333;  padding: 5px;">' +
                        "<div>documentno : " + item.documentno + "</div>" +
                        "<div>doc_subject : " + item.doc_subject + "</div>" +
                        "<div>doctype : " + item.doctype + "</div>" +
                        "<div>department : " + item.department + "</div>" +
                        "<div>created : " + item.created + "</div>" +
                        "<div>createdby : " + item.createdby + "</div>" +
                    '</div>';
                	return desc;
                }
                return "";
                
            },
            formatSelection: function(item){
		    	$("#requisition\\.dpMngmt\\.id").val(item.id);
		    	if(item.department_id){
		    		$("#requisition\\.organisation\\.orgaName").select2("data", {id: item.department_id, name: item.department});
		    		$("#requisition\\.organisation\\.id").val(item.department_id);
		    	}
		    	if(item.documentno){
		    		$("#requisition\\.dpMngmt\\.documentno").val(item.documentno);
		    		$('#requisition\\.dpMngmt\\.docSubject').val(item.doc_subject);
	            	return item.documentno + '-' + item.doc_subject;
		    	}
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

	    
	    //$("#trxdoctype").select2("data", {id: $("#dpMngmt_id").val() ,documentno: $("#documentno").val(), doc_subject: $("#dpMngmt_docSubject").val()});
	    
		<s:if test="requisition!=null">
	    $("#trxdoctype").select2("data", {id: "<s:property value='requisition.dpMngmt.id'/>", documentno: $("#requisition\\.dpMngmt\\.documentno").val(),  doc_subject: $('#requisition\\.dpMngmt\\.docSubject').val()});
	    </s:if>
	    
		$("#requisition\\.organisation\\.orgaName").select2({
		    placeholder: "<s:text name="dp.doc.enter.dep"/>",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.organisation.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        if(term == "") term = " ";   
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
		    	$("#requisition\\.organisation\\.id").val(item.id);
		    	$("#requisition\\.organisation\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#requisition\\.organisation\\.orgaName").select2("data", {id: "<s:property value='requisition.organisation.id'/>", name: "<s:property value="requisition.organisation.orgaName"/>"});

	    $("#currencyName").select2({
	        placeholder: "<s:text name="requisition.search.currency"/>",
	        minimumInputLength: 0,
	        ajax: {
		        url: "OrderMgmtInput.currency.do",
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
		        return { results: data};
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
	        dropdownAutoWidth: false,
            formatResult : function(item){
                return item.iso_code + ", " + item.cursymbol + ", " + item.description;
            },
            formatSelection: function(item){
                if(item.id){
            		$("#requisition\\.currency\\.id").val(item.id);
            		$("#requisition\\.currency\\.description").val(item.description);
            		$("#requisition\\.currency\\.cursymbol").val(item.cursymbol);
                	return item.description + " - " + item.cursymbol;
                }
            },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 
	    <s:if test="requisition!=null">
	    	$("#currencyName").select2("data", {id: "<s:property value='requisition.currency.id'/>", description: $("#requisition\\.currency\\.description").val(), cursymbol: $("#requisition\\.currency\\.cursymbol").val()});	    
		</s:if>
	    <s:if test="requisition != null && requisition.id != null">
		$("#prstatus").on('click', function() {
			$.ajax({
				type : "GET",
				url : "RequisitionStatusSave.do",
				data: {requisitionId: $("#requisition\\.id").val()},
				async : false,
				beforeSend : function(jqXHR, settings){},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					ajaxResponse(data, status, jqXHR);
				},
				complete : function(jqXHR, textStatus) {}
			});
			return false;
		});	    
		</s:if>

	    <s:if test="requisition != null && requisition.id != null && requisition.statusCode == 'AP'">
		$("#pr2po").on('click', function() {
			$.ajax({
				type : "POST",
				url : "PRtoPOSave.do",
				data: {requisitionId: $("#requisition\\.id").val()},
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
		        error: function(jqXHR, textStatus, errorThrown) {
		        	alert("error:" + errorThrown + ", status:" + status);
		        },
				success : function(data, status, jqXHR) {
					ajaxResponse(data, status, jqXHR);
				},
				complete:function(jqXHR, textStatus){}
			});
			return false;
		});
		</s:if>
				
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "PReq.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#preq_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete : function(jqXHR, textStatus) {}
			});
			return false;
		});
	    

		$("#save").on('click', function () {  
			if($('#preq_form').valid()){
				$("#preq_form :button").prop('disabled','disabled'); 
				$('#preq_form').submit();
			}
			return false;        
		});

		$("#preq_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
		        error: function(XMLHttpRequest, textStatus, errorThrown) {
	                $("#preq_content").html(XMLHttpRequest.responseText);
		        },
				success : function(data, status, jqXHR) {
// 					ajaxResponse(data, status, jqXHR);
					$("#preq_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					var check = $("#errors_exists").val();
					if(check == 'false' || check == undefined){
						$("#preq_grid").trigger("reloadGrid");
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
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});


		$(".fieldErrors").each(function() {
			var fid = $(this).attr("id");
			fid = fid.replaceAll(".", "\\.");
			console.log(fid);
			
			//$("#requisition\\.organisation\\.orgaName").parent().parent().removeClass("form-group");
			
			if($("#" + fid).parent().parent().hasClass("form-group")){
				$("#" + fid).parent().parent().removeClass("form-group");
				$("#" + fid).parent().parent().addClass("form-group has-error");
			}
		});		

});

function ajaxResponse(data, status, jqXHR){
	$("#preq_content").html(jqXHR.responseText);
	var errors = jqXHR.getResponseHeader("errors_exits");
	var check = $("#errors_exists").val();
	if(check == 'false' || check == undefined){
		$("#preq_grid").trigger("reloadGrid");
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