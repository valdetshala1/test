<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="tender_contract_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="tender_contract_form" class="form-horizontal" action="TenderContractSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="finance.contract.data.form"/></legend>
				<input id="contract.id" name="contract.id" value="<s:property value='contract.id'/>" type="hidden">
				<input id="doc.docType" name="doc.docType" value="<s:property value='doc.docType'/>" type="hidden">
				<input id="doc.docName" name="doc.docName" value="<s:property value='doc.docName'/>" type="hidden">
				<input id="tender.id" name="tender.id" value="<s:property value='tender.id'/>" type="hidden">
				<!-- START contract.contractName -->
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contract.name"/>:</label>
						<div class="col-md-10">
							<input id="tender.designationOfRequest" name="tender.designationOfRequest" disabled="disabled" value="<s:property value='tender.designationOfRequest'/>" class="form-control" placeholder="<s:text name="finance.contract.name"/>" type="text">
						</div>
					</div>
				<!-- END contract.contractName -->
				
				<!-- START contract.contractors -->
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contract.contractor"/>:</label>
						<div class="col-md-10">
							<input id="bidder.companyName" name="bidder.companyName" disabled="disabled" class="form-control" placeholder="<s:text name="finance.contract.contractor"/>" value="<s:property value='bidder.companyName' />">
							<input id="bidder.id" name="bidder.id" class="form-control" value="<s:property value='bidder.id'/>" type="hidden"/>
						</div>
					</div>
				<!-- END contract.contractors -->
				<!-- START contract.organisation -->
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contract.organisation"/>:</label>
						<div class="col-md-10">
							<input id="contract.organisation.orgaName" readonly="readonly" name="contract.organisation.orgaName" placeholder="Enter organisation name" class="form-control" value="<s:property value='tender.organisation.orgaName'/>"/>
							<input id="contract.organisation.id" name="contract.organisation.id" class="form-control" value="<s:property value='tender.organisation.id'/>" type="hidden"/>
						</div>
					</div>
				<!-- END contract.organisation -->
				<!-- START contract.contractNumber -->
				<s:if test="fieldErrors.get('contract.contractNumber')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.contract.number"/>:</label>
							<div class="col-md-10">
								<input id="contract.contractNumber" name="contract.contractNumber" placeholder="<s:text name="finance.contract.number"/>" class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contract.contractNumber')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.contract.number"/>:</label>
						<div class="col-md-10">
						<input id="contract.contractNumber" name="contract.contractNumber" class="form-control" placeholder="<s:text name="finance.contract.number"/>" value="<s:property value='contract.contractNumber'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contract.contractNumber -->
				
				
				
				<!-- START contract.approvedDate -->
				<s:if test="fieldErrors.get('contract.approvedDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.contract.approved.date"/>:</label>
							<div class="col-md-10">
								<input id="contract.approvedDate" name="contract.approvedDate" placeholder="dd.mm.yy"  class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contract.approvedDate')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contract.approved.date"/>:</label>
						<div class="col-md-10">
						<input id="contract.approvedDate" name="contract.approvedDate" class="form-control" placeholder="dd.mm.yy" value="<s:property value='contract.approvedDate'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contract.approvedDate -->
				
				<!-- START contract.cost -->
				<s:if test="fieldErrors.get('contract.cost')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.contract.cost"/>:</label>
							<div class="col-md-10">
								<input data="number" type="text" id="contract.contractCosts" name="contract.contractCosts" placeholder="<s:text name="finance.contract.cost"/>" class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contract.cost')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.contract.cost"/>:</label>
						<div class="col-md-10">
						<input data="number" type="text" id="contract.contractCosts" name="contract.contractCosts" class="form-control" placeholder="<s:text name="finance.contract.cost"/>" value="<s:property value='contract.contractCosts'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contract.approvedDate -->
				
				<!-- START contract.dateDueForStart -->
				<s:if test="fieldErrors.get('contract.dateDueForStart')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.contract.date.due.for.start"/>:</label>
							<div class="col-md-10">
								<input id="contract.dateDueForStart" name="contract.dateDueForStart" placeholder="dd.mm.yy" class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contract.dateDueForStart')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contract.date.due.for.start"/>:</label>
						<div class="col-md-10">
							<input id="contract.dateDueForStart" name="contract.dateDueForStart" placeholder="dd.mm.yy" class="form-control" value="<s:property value='contract.dateDueForStart'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contract.dateDueForStart -->
				
				<!-- START contract.dateDueForCompletion -->
				<s:if test="fieldErrors.get('contract.dateDueForCompletion')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="finance.contract.date.due.for.completion"/>:</label>
							<div class="col-md-10">
								<input id="contract.dateDueForCompletion" name="contract.dateDueForCompletion" placeholder="dd.mm.yy" class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contract.dateDueForCompletion')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="finance.contract.date.due.for.completion"/>:</label>
						<div class="col-md-10">
						<input id="contract.dateDueForCompletion" name="contract.dateDueForCompletion" placeholder="dd.mm.yy" class="form-control" value="<s:property value='contract.dateDueForCompletion'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contract.dateDueForCompletion -->
			
				<!-- START contract.notificationDate -->
<%-- 				<s:if test="fieldErrors.get('contract.notificationDate')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="contract.notification.date"/>:</label> --%>
<!-- 							<div class="col-md-10"> -->
<!-- 								<input id="contract.notificationDate" name="contract.notificationDate" placeholder="dd.mm.yy" class="form-control"/> -->
<%-- 								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contract.notificationDate')"/></span>  --%>
<!-- 							</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label" ><s:text name="contract.notification.date"/>:</label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 						<input id="contract.notificationDate" name="contract.notificationDate" placeholder="dd.mm.yy" class="form-control" value="<s:property value='contract.notificationDate'/>"/> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END contract.notificationDate -->
								
				<!-- START finished -->
				<div class="form-group" id="finish">
					<label class="col-md-2 control-label"><s:text name="contract.finished"/>:</label>
					<div class="col-md-10">
						<input type="checkbox" class="btn btn-default btn-file" id="finished" name="finished">
					</div>
				</div>
				<!-- END finished -->
				<div id="completed">
				<!-- START contract.dateCompleted -->
				<s:if test="fieldErrors.get('contract.dateCompleted')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="contract.date.completed"/>:</label>
							<div class="col-md-10">
								<input id="contract.dateCompleted" name="contract.dateCompleted" placeholder="dd.mm.yy" class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('contract.dateCompleted')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="contract.date.completed"/>:</label>
						<div class="col-md-10">
						<input id="contract.dateCompleted" name="contract.dateCompleted" placeholder="dd.mm.yy" class="form-control" value="<s:property value='contract.dateCompleted'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END contract.dateCompleted -->
				</div>
				
				<!-- START delayed -->
				<div class="form-group" id="delay">
					<label class="col-md-2 control-label"><s:text name="contract.delayed"/>:</label>
					<div class="col-md-10">
						<input type="checkbox" class="btn btn-default btn-file" id="contract.delayed" name="contract.delayed" value="<s:property value='contract.delayed'/>">
					</div>
				</div>
				<!-- END delayed-->
								
				<!-- START contract.attachment -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="finance.contract.attachment"/>:</label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default btn-file" id="file" name="file" onchange="getFileData(this);">
					</div>
				</div>
				<!-- END contract.attachment -->
				
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFCon" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFCon" class="btn btn-primary" type="submit">
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
function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#doc\\.docName").val(filename);
    $("#doc\\.docType").val('.'+fileExt);
}
	$(document).ready(function () {
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});

		$('#contract\\.approvedDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#contract\\.dateDueForStart').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
			sideBySide: false,
		});
		$('#contract\\.dateDueForCompletion').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
			sideBySide: false,
		});
		$('#contract\\.dateCompleted').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
			sideBySide: false,
		});
		$('#contract\\.notificationDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
			sideBySide: false,
		});

		if(!$("#contract\\.id").val()){
			$('#finish').hide();
			$("#delay").hide();
		}
		$('#finished').on('change',function(event){
			$('#finished').val( $('#finished')[0].checked ? "true" : "false" );
			if($('#finished').val()=="true"){
				$('#completed').show();
			}else{
				$('#completed').hide();
				$('#contract\\.dateCompleted').val(null);
			}
		});
		if(!$('#contract\\.dateCompleted').val()){
			$('#completed').hide();
		}else{
			$('#finished').prop("checked",true);
			$('#completed').show();
		}
		
		$('#contract\\.delayed').on('change',function(event){
			$('#contract\\.delayed').val( $('#contract\\.delayed')[0].checked ? "true" : "false" );
		});
		if($('#contract\\.delayed').val()=='true'){
			$('#contract\\.delayed').prop('checked', true);
		}
		
// 		$("#contract\\.organisation\\.orgaName").select2({
// 		    placeholder: "Enter activity",
// 		    minimumInputLength: 0,
// 		    ajax: {
// 		        url: "Input.organisation.do",
// 		        dataType: 'json',
// 		        quietMillis: 250,
// 		        data: function (term, page) {
// 			        if(term == "") term = " ";   
// 			        return {
// 			        	featureClass: "P",
// 						style: "full",
// 						maxRows: 12,            
// 			        	name_startsWith: term,
// 			        	dom_code:"INFRS"
// 			        };
// 		        },
// 		        results: function (data, page) { 
// 		        	return { results: data };
// 		        },
// 		        cache: true
// 		    },
// 		    initSelection: function(element, callback) {
// 		    },
// 		    dropdownAutoWidth: false,
// 		    formatResult: formatResult,
// 		    formatSelection: function(item) {
// 		    	$("#contract\\.organisation\\.id").val(item.id);
// 		    	$("#contract\\.organisation\\.orgaName").val(item.name);
// 		        return item.name;
// 		    },
// 		    allowClear: true,
// 		    escapeMarkup: function (m) { return m; }
// 		});
// 		$("#contract\\.organisation\\.orgaName").select2("data", {id: "<s:property value='contract.organisation.id'/>", name: "<s:property value="contract.organisation.orgaName"/>"});
		
		$("#cancelFCon").on('click', function () {                    
			$("#tender_contract_form_content").dialog('close');
			return false;        
		});
				
		$("#saveFCon").on('click', function () { 
			$('#tender_contract_form').submit();
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
					$("#tender_contract_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#tender_contract_form_content").html(jqXHR.responseText);
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
						$("#rb_con").prop('checked','true');
						getTenderRequestByStatus("CON");
						$("#tender_contract_form_content").dialog("close"); 
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
						//$("#farmer_expander").html(jqXHR.responseText);
					}	    	
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});				
		})();
			    	
	});            
</script>