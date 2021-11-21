<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->
<jsp:include page="../../../base/validation.jsp"></jsp:include>
	<!-- widget content -->
	<div class="widget-body">
		
		<form id="financial_input_form" class="form-horizontal" action="FinInputSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="finance.input.legend.financial.input.data"/></legend>
				<input id="finInput.id" name="finInput.id" value="<s:property value='finInput.id'/>" type="hidden">
				<input id="finInput.employee.id" name="finInput.employee.id" value="<s:property value='finInput.employee.id'/>" type="hidden">
				<input id="finInput.employee.organisation.operLevelVal" name="finInput.employee.organisation.operLevelVal" value="<s:property value='finInput.employee.organisation.operLevelVal'/>" type="hidden">
				<input id="finInput.createdTime" name="finInput.createdTime" value="<s:property value='finInput.createdTime'/>" type="hidden">
				
				<input id="status.id" name="status.id" value="<s:property value='status.id'/>" type="hidden">
				<input id="status.status" name="status.status" value="<s:property value='status.status.getDOMVALUE()'/>" type="hidden">
				<input id="status.employee.id" name="status.employee.id" value="<s:property value='status.employee.id'/>" type="hidden">
				<input id="status.createDate" name="status.createDate" value="<s:property value='status.createDate'/>" type="hidden">
				
				<input id="noChange" name="noChange" value="<s:property value='noChange'/>" type="hidden">
				<input id="munReadOnly" name="munReadOnly" value="<s:property value='munReadOnly'/>" type="hidden">
				
				<input id="language" value="<s:property value="locale.language"/>" type="hidden"/>
							
				<!-- START finInput.year -->
				<s:if test="fieldErrors.get('finInput.year')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="annual.plan.year"/></label>
							<div class="col-md-10">
								<input id="finInput.year" name="finInput.year" class="form-control"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finInput.year')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="annual.plan.year"/></label>
						<div class="col-md-10">
						<input id="finInput.year" name="finInput.year" class="form-control" value="<s:property value='finInput.year'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END finInput.year -->
				
				<!-- START finInput.month -->
				<s:if test="fieldErrors.get('finInput.month')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="output.salary.label.month"/></label>
							<div class="col-md-10">
								<select class="form-control" id="finInput.month" name="finInput.month">
									<option></option>
									<s:iterator value="monthList" var="ml">
										<option value="<s:property value="#ml.getDOMVALUE()"/>">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#ml.getDOMTEXT()"/>
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#ml.getDOMTEXT_SR()"/>
											</s:elseif>
											<s:else>
												<s:property value="#ml.getDOMTEXT_EN()"/>
											</s:else>
										</option>
									</s:iterator>
								</select>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finInput.month')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="output.salary.label.month"/></label>
						<div class="col-md-10">
							<select class="form-control" id="finInput.month" name="finInput.month">
								<option></option>
								<s:iterator value="monthList" var="ml">
									<option value="<s:property value="#ml.getDOMVALUE()"/>">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#ml.getDOMTEXT()"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#ml.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#ml.getDOMTEXT_EN()"/>
										</s:else>
									</option>
								</s:iterator>
							</select>
						</div>
					</div>
				</s:else>
				<!-- END finInput.month -->
				
				<!-- START finInput.organisation -->
				<s:if test="fieldErrors.get('finInput.organisation')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="bidder.cadastral.municipality"/></label>
							<div class="col-md-10">
								<input id="finInput.organisation.orgaName" name="finInput.organisation.orgaName" class="form-control"/>
								<input id="finInput.organisation.id" name="finInput.organisation.id" class="form-control" type="hidden" placeholder="<s:text name="fin.input.financial.organisation"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finInput.organisation')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="bidder.cadastral.municipality"/></label>
						<div class="col-md-10">
							<input id="finInput.organisation.orgaName" name="finInput.organisation.orgaName" class="form-control" value="<s:property value='finInput.organisation.orgaName'/>" placeholder="<s:text name="fin.input.financial.organisation"/>"/>
							<input id="finInput.organisation.id" name="finInput.organisation.id" class="form-control" value="<s:property value='finInput.organisation.id'/>" type="hidden"/>
						</div>
					</div>
				</s:else>
				<!-- END finInput.organisation -->
				
				<!-- START finInput.financialType -->
				<s:if test="fieldErrors.get('finInput.financialType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.input.label.input.type"/></label>
							<div class="col-md-10">
								<input id="finInput.financialType.name" name="finInput.financialType.name" class="form-control" placeholder="<s:text name="finance.input.label.input.type"/>"/>
								<input id="finInput.financialType.id" name="finInput.financialType.id" class="form-control" type="hidden"/>
								<input id="finInput.financialType.code" name="finInput.financialType.code" type="hidden" value="<s:property value='finInput.financialType.code'/>"/>
								<input id="finInput.financialType.nameAl" name="finInput.financialType.nameAl" type="hidden" value="<s:property value='finInput.financialType.nameAl'/>">								
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finInput.financialType')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.input.label.input.type"/></label>
						<div class="col-md-10">
							<input id="finInput.financialType.name" name="finInput.financialType.name" class="form-control" value="<s:property value='finInput.financialType.nameAl'/>" placeholder="<s:text name="finance.input.label.input.type"/>" />
							<input id="finInput.financialType.id" name="finInput.financialType.id" class="form-control" value="<s:property value='finInput.financialType.id'/>" type="hidden"/>
							<input id="finInput.financialType.code" name="finInput.financialType.code" type="hidden" value="<s:property value='finInput.financialType.code'/>"/>
							<input id="finInput.financialType.nameAl" name="finInput.financialType.nameAl" type="hidden" value="<s:property value='finInput.financialType.nameAl'/>">
						</div>
					</div>
				</s:else>
				<!-- END finInput.financialType -->
				
				<!-- START finInput.cumulativeValue -->
				<s:if test="fieldErrors.get('finInput.cumulativeValue')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.input.label.cumulative.value"/></label>
							<div class="col-md-10">
								<input id="finInput.cumulativeValue" name="finInput.cumulativeValue" class="form-control" placeholder="<s:text name="finance.input.label.cumulative.value"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('finInput.cumulativeValue')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="finance.input.label.cumulative.value"/></label>
						<div class="col-md-10">
						<input id="finInput.cumulativeValue" name="finInput.cumulativeValue" class="form-control" value="<s:property value="#action.getText('{0,number,#,##0.00}', {finInput.cumulativeValue})"/>" placeholder="<s:text name="finance.input.label.cumulative.value"/>" title="<s:property value='finInput.cumulativeValue'/>" />
						</div>
					</div>
				</s:else>
				<!-- END finInput.cumulativeValue -->

				<!-- START finInput.inputDate-->
				<s:if test="fieldErrors.get('finInput.inputDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finInput.inputDate"/></label>
						<div class="col-md-10">
							<input id="finInput.inputDate" name="finInput.inputDate" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('finInput.inputDate')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="finInput.inputDate"/></label>
						<div class="col-md-10">
							<input id="finInput.inputDate" name="finInput.inputDate" value="<s:property value='finInput.inputDate'/>" class="form-control" placeholder="" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END finInput.inputDate-->				
				
				<div class="form-group">
					<!-- START status.doc -->
					<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
					<div class="col-md-10">
						<input id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);" >
						<span><a href="FinInputDoc.do?docId=<s:property value='status.id'/>" target="_blank" ><s:property value='status.docName'/></a></span>
					</div>
					<input id="status.docName" name="status.docName" value="<s:property value='status.docName'/>" type="hidden">	
					<input id="status.docType" name="status.docType" value="<s:property value='status.docType'/>" type="hidden">
					<!-- END status.doc -->
				</div>
				<!-- START status.note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/>:</label>
			 	  	<div class="col-md-10">
			      		<textarea id="status.note" name="status.note" class="form-control" ><s:property value='status.note'/></textarea>
			      	</div> 
		      	</div>
				<!-- END status.note -->
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFI" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFI" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
function formatResult(item){
	return item.name + " (" + item.code + ")";
}

function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#status\\.docName").val(filename);
    $("#status\\.docType").val(fileExt);
}

$(document).ready(function () {
	/*
		$.extend($.fn.autoNumeric.defaults, {              
			aSep: '.',              
			aDec: ','          
		});
		*/
	
		//$("input[data='number']").autoNumeric('init', {aDec: ',', aSep: '.', mDec: '2', aSign: '€ '});
		//$('#finInput\\.cumulativeValue').autoNumeric('init',{aDec: '.', aSep: ',', mDec: '2'});
		$("#finInput\\.cumulativeValue").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2', dGroup: '3', vMin: '0.00', vMax: '999999999.99'});
		$('#finInput\\.cumulativeValue').autoNumeric('update',{aDec: '.', aSep: ',', mDec: '2', dGroup: '3', vMin: '0.00', vMax: '999999999.99'});
		
		
		$("#finInput\\.year").mask('9999');
		$("#finInput\\.month").val('<s:property value="finInput.month.DOMVALUE"/>');

		
		
		/*
		$('#finInput\\.cumulativeValue').autoNumeric('destroy');
		$('#finInput\\.cumulativeValue').autoNumeric('update', {aDec: '.', aSep: ',', mDec: '2'});
		*/ 
		
		$('#finInput\\.inputDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
				
		 $("#finInput\\.organisation\\.orgaName").select2({
		        placeholder: "",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.organisation.do",
			        dataType: 'json',
			        quietMillis: 250,
			        data: function (term, page) {
			        return {	
			        	name_startsWith: term,
			        	orglevel:'M',
			        };
			        },
			        results: function (data, page) { 
			        return { results: data };
			        },
			        cache: true
		        },
		        initSelection: function(element, callback) {
		        },
		        formatResult: formatResult,
		        formatSelection: function(item) {
		        	$("#finInput\\.organisation\\.id").val(item.id);
		        	$("#finInput\\.organisation\\.orgaName").val(item.name);
		            return item.name;
		        },
		        allowClear: true,
		        escapeMarkup: function (m) { return m; }
		    });  
		     
		 $("#finInput\\.organisation\\.orgaName").select2("data", {
			 id: "<s:property value='finInput.organisation.id'/>", 
			 name: "<s:property value='finInput.organisation.orgaName'/>"});

		 $("#finInput\\.financialType\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.financialType.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	name_startsWith: term,
		        	type:"IN",
		        };
		        },
		        results: function (data, page) { 
		        return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
		    formatResult: function(item) {
			    var label = item.name + " (<span style='color:orange;'>" + item.code + "</span>)";
			    return label;
		    },
	        formatSelection: function(item) {
		        console.log(item);
	        	$("#finInput\\.financialType\\.id").val(item.id);
	        	$("#finInput\\.financialType\\.code").val(item.code);
	        	$("#finInput\\.financialType\\.nameAl").val(item.name);
	        	
	        	var label = item.name;
	        	if(item.name){
	        		label = item.name + " (" + item.code + ")";
	        	}
	            return label;	        	
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });  


		<s:if test="%{locale.language=='al'}">
	     $("#finInput\\.financialType\\.name").select2("data", {
		     id: "<s:property value='finInput.financialType.id'/>", 
		     name: "<s:property value='finInput.financialType.nameAl'/>", 
		     code: "<s:property value='finInput.financialType.code'/>"});				

		</s:if>
		<s:elseif test="%{locale.language=='sr'}">
	     $("#finInput\\.financialType\\.name").select2("data", {
		     id: "<s:property value='finInput.financialType.id'/>", 
		     name: "<s:property value='finInput.financialType.nameSr'/>", 
		     code: "<s:property value='finInput.financialType.code'/>"});				

		</s:elseif>
		<s:else>
	     $("#finInput\\.financialType\\.name").select2("data", {
		     id: "<s:property value='finInput.financialType.id'/>", 
		     name: "<s:property value='finInput.financialType.nameEn'/>", 
		     code: "<s:property value='finInput.financialType.code'/>"});				
		</s:else>

			
   

	     $("#cancelFI").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "FinInput.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#financial_input_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;        
		});
			
	    Ladda.bind('#saveFI');
		$("#saveFI").on('click', function() {
			$("#financial_input_form :button").prop('disabled','disabled');
			$('#financial_input_form').submit();
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
					$("#financial_input_form").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#financial_input_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exist");
 					if(!errors){
 						jQuery("#financial_input_grid").trigger("reloadGrid");
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
					//$('#ajaxBusyB').hide();
				}
			});		
			$("#financial_input_form :button").prop('disabled',false);
		})();
		
		if($("#munReadOnly").val()=='true'){
			$("#finInput\\.organisation\\.orgaName").prop('readonly',true);
		}	
		
		if($("#noChange").val()=='true'){

			$("#financial_input_form :input").prop('disabled','disabled');
			$("#cancelFI").prop('disabled',false);		    
		}	    	
	});            
</script>