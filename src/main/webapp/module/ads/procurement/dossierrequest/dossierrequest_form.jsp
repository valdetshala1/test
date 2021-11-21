<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="dossierrequest_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="dossier_request_form" class="form-horizontal" action="DossierRequestSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="ads.procurement.dossierrequest"/>
				</legend>
				<input id="dossierRequest.id" name="dossierRequest.id" value="<s:property value='dossierRequest.id'/>" type="hidden">
				<input id="dossierRequest.prcmtTenderRequest.id" name="dossierRequest.prcmtTenderRequest.id" value="<s:property value='dossierRequest.prcmtTenderRequest.id'/>" type="hidden">
				<input id="hideButton" name="hideButton" value="<s:property value='hideButtons'/>" type="hidden">
				
				<!-- START dossierRequest.prcmtTenderBidder.id  -->
				<s:if test="fieldErrors.get('dossierRequest.prcmtTenderBidder.id')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name='tender.bidder'/>
					      :</label>
					 	  <div class="col-md-10">
					      	 	<input id="dossierRequest.prcmtTenderBidder.companyName" name="dossierRequest.prcmtTenderBidder.companyName" class="form-control" placeholder="<s:text name='tender.bidder'/>" >
					      		<input type="hidden" id="dossierRequest.prcmtTenderBidder.id" name="dossierRequest.prcmtTenderBidder.id" >
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dossierRequest.prcmtTenderBidder.id')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label">*<s:text name='tender.bidder'/>:</label>
					 	  <div class="col-md-10">
					 	  		<input id="dossierRequest.prcmtTenderBidder.companyName" name="dossierRequest.prcmtTenderBidder.companyName" class="form-control" placeholder="<s:text name='tender.bidder'/>" value="<s:property value='dossierRequest.prcmtTenderBidder.companyName' />">
					      		<input type="hidden" id="dossierRequest.prcmtTenderBidder.id" name="dossierRequest.prcmtTenderBidder.id" class="form-control" placeholder="<s:text name='tender.bidder'/>" value="<s:property value='dossierRequest.prcmtTenderBidder.id' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END dossierRequest.prcmtTenderBidder.id   -->
				
				<!-- START dossierRequest.sent  -->
				<s:if test="fieldErrors.get('dossierRequest.sent')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='ads.procurement.dossierrequest.sent'/>:</label>
					 	  <div class="col-md-10">
					      	 	<input type="checkbox" id="dossierRequest.sent" name="dossierRequest.sent" class="form-control" value="<s:property value='dossierRequest.sent' />">
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name='ads.procurement.dossierrequest.sent'/>:</label>
					 	  <div class="col-md-10">
					 	  		<input type="checkbox" id="dossierRequest.sent" name="dossierRequest.sent" value="<s:property value='dossierRequest.sent' />">
					      </div>         
				     </div>
				</s:else>
				<!-- END dossierRequest.sent   -->
				
				<!-- START dossierRequest.sentDate  -->
				<div id="sentDate">
				<s:if test="fieldErrors.get('dossierRequest.prcmtTenderBidder.id')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='ads.procurement.dossierrequest.sent.date'/>:</label>
					 	  <div class="col-md-10">
					      	 	<input id="dossierRequest.sentDate" name="dossierRequest.sentDate" class="form-control" placeholder="dd.mm.yy" >
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dossierRequest.prcmtTenderBidder.id')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name='ads.procurement.dossierrequest.sent.date'/>:</label>
					 	  <div class="col-md-10">
					 	  		<input id="dossierRequest.sentDate" name="dossierRequest.sentDate" class="form-control" placeholder="dd.mm.yy" value="<s:property value='dossierRequest.sentDate' />">
					      </div>         
				     </div>
				</s:else>
				</div>
				<!-- END dossierRequest.sentDate   -->
				<!-- START dossierRequest.note  -->
				<div class="form-group">
				      <label class="col-md-2 control-label"><s:text name="tender.request.analyse.comment"/>:</label>
				 	  <div class="col-md-10">
				      		<textarea id="dossierRequest.note" name="dossierRequest.note" class="form-control" ><s:property value='dossierRequest.note' /></textarea>
				      </div>         
			     </div>
				<!-- END dossierRequest.note   -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
							<button id="cancelDos" class="btn btn-default" type="button">
								<s:text name="label.button.cancel"></s:text>
							</button>
							<button id="saveDos" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {

		$("#sentDate").hide();
		
		$('#dossierRequest\\.sent').change(function(){
			 if($(this).is(':checked')){
					$('#dossierRequest\\.sent').val("true");
					$("#sentDate").show();
			    } else {
			    	$('#dossierRequest\\.sent').val("false");
			    	$("#sentDate").hide();
			    	$('#dossierRequest\\.sentDate').val(null);
			    }
		});
// 		$("#hideButton").val($("#hideButtons").val());
// 		alert($("#hideButtons").val());


		$('#dossierRequest\\.sentDate').datetimepicker({
			timepicker:false,
			format:'d.m.Y', 
			mask:false,
			formatDate:'d.m.Y'
		});
			
		if($("#hideButtons").val()=='true'){
			$("#saveDos").hide();
			$("#saveDos").attr('disabled','disabled');
		}

		<s:if test="dossierRequest.sent">
			$('#dossierRequest\\.sent').prop('checked','true');
			$("#sentDate").show();
		</s:if>
		
		$("#dossierRequest\\.prcmtTenderBidder\\.companyName").select2({
		    placeholder: "<s:text name="organization.placeholder.enter.activity"/>", 
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.proTenderBidder.do",
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
		    	$("#dossierRequest\\.prcmtTenderBidder\\.id").val(item.id);
		    	$("#dossierRequest\\.prcmtTenderBidder\\.companyName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#dossierRequest\\.prcmtTenderBidder\\.companyName").select2("data", {id: "<s:property value='dossierRequest.prcmtTenderBidder.id'/>", name: "<s:property value="dossierRequest.prcmtTenderBidder.companyName"/>"});
		
		
		$("#cancelDos").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "DossierRequest.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#dossierrequest_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : "<s:text name='small.box.on.cancel.title'/>", 
						content : "<s:text name='small.box.content'/>", 
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
		Ladda.bind('#saveDos');		
		$("#saveDos").on('click', function () {
			$("#dossier_request_form :button").prop('disabled','disabled');
			$("#dossier_request_form").submit();
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
					$("#dossierrequest_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#dossierrequest_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						$("#dossierrequest_grid").trigger("reloadGrid");
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>", 
							content : "<s:text name='small.box.content'/>", 
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>", 
							content : "<s:text name='small.box.content'/>", 
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}	    	
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});
			$("#dossier_request_form :button").prop('disabled',false);
		})();
		$("#dossierRequest\\.prcmtTenderRequest\\.id").val($("#tenderRequestId").val());
	});            
</script>