<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- widget div-->
<div>

	<!-- widget content -->
	<div class="widget-body">
	
		<form id="payslip_form" role="form" class="form-horizontal" action="PayslipSave.do" accept-charset="utf8" method="post">
			
			<div class="row">

			<fieldset id="fs.employee.salary">
				<legend style="padding-left: 5px;"><s:text name="hrml.employee.salary"/></legend>
				<input id="salary.id" name="salary.id" value="<s:property value='salary.id'/>" type="hidden">
				<input id="salary.employee.id" name="salary.employee.id" value="<s:property value='salary.employee.id'/>" type="hidden">
				<!-- 
				<div style="color: red;">
				After employee selection, the salary definition should be called and listed for take over or changes.
				</div
				-->
				
				<!-- START "createPayslipAll" -->
				<div class="form-group">
					<label class="col-md-2 control-label" ><s:text name="hrm.employee.salary.payslip.employee.auto"/>
					<span class="help glyphicon glyphicon-info-sign" data-toggle="popover" data-placement="right" title="<s:text name='hrm.employee.salary.payslip.employee.auto.info'/>"></span>
					</label>
					<div class="col-md-10">
						<label>
						<input id="createPayslipAll" name="createPayslipAll" type="checkbox" class="checkbox style-0" value="false" alt="<s:text name="hrm.employee.salary.payslip.employee.auto.info"/>"/>
						<span>?</span>
						</label>
					</div>
				</div>

				<!-- END "createPayslipAll" -->					
											
				<!-- START salary.employee -->
				<s:if test="fieldErrors.get('salary.employee.firstName')!=null">
					<div id="fg.salary.firstName"  class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="employee.label"/></label>
						<div class="col-md-10">
							<input id="salary.employee.firstName" name="salary.employee.firstName" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('salary.employee.firstName')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div id="fg.salary.firstName" class="form-group">
						<label class="col-md-2 control-label">*<s:text name="employee.label"/></label>
						<div class="col-md-10">
							<input id="salary.employee.firstName" name="salary.employee.firstName" value="<s:property value='salary.employee.firstName'/>" class="form-control" placeholder="<s:text name="employee.name.placeholder"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END salary.employee -->
											
			</fieldset>
			
			<fieldset id="fs.emplyoee.salary.contribution">
				<legend style="padding-left: 5px;"><s:text name="hrml.employee.salary.contribution"/></legend>
	 			<s:if test="adjustments!=null and !adjustments.empty">
	 			<div class="form-group">
	 				<label class="col-md-2 control-label" ></label>
	 				<div class="col-md-10">
	 				<div class="table-responsive-sm">
						<table class="table table-striped w-auto" style="" >
							  <thead class="thead-dark">
							    <tr>
							      <th scope="col"><s:text name="hrml.employee.salary.adjustment.financialType.code"/></th>
							      <th scope="col"><s:text name="hrml.employee.salary.adjustment.financialType.name"/></th>
							      <th scope="col"><s:text name="hrml.employee.salary.adjustment.adjustmentDate"/></th>
							      <th scope="col"><s:text name="hrml.employee.salary.adjustment.amount"/></th>
							      <th scope="col">%</th>
							      <th scope="col"><s:text name="hrml.employee.salary.adjustment.deduction"/></th>
							      <th scope="col"><s:text name="hrml.employee.salary.adjustment.createdBy"/></th>
							      <th scope="col"><s:text name="hrml.employee.salary.adjustment.createdDate"/></th>
							      <th scope="col"><s:text name="hrml.employee.salary.adjustment.note"/></th>
							    </tr>
							  </thead>
							  <tbody>
								<s:iterator value="adjustments" var="rowstatus">
								 <s:property value="#rowstatus.count" />
								<s:if test="#rowstatus.odd == true"></s:if>
	    					    
								<tr class="table-info">
		    						<td><s:property value="financialType.code"/></td>		
									<td><s:property value="financialType.nameAl"/></td>		
									<td><s:property value="adjustmentDate"/></td>					
									<td><s:property value="amount"/></td>
									<td><s:property value="amountPercentage"/></td>
									<td>
									<s:if test="deduction == true">	
										<input id="deduction" name="deduction" type="checkbox" checked="checked" onclick="return false" value="<s:property value='deduction'/>"/>
									</s:if>
									<s:else>
										<input id="deduction" name="deduction" type="checkbox" onclick="return false" value="<s:property value='deduction'/>"/>
									</s:else>
									</td>
									<td><s:property value="createdBy.firstName"/>, <s:property value="createdBy.lastName"/></td>
									<td><s:property value="createdDate"/></td>
									<td><s:property value="note"/></td>
							    </tr>						    
							
								</s:iterator>
							  </tbody>
						</table>
					</div>
					</div>
				</div>
				</s:if>							
						                            			
			</fieldset>
			
			<fieldset>
				<legend style="padding-left: 5px;"><s:text name="hrm.employee.salary.payslip.form"/></legend>
				
				<!-- START payroll.fiscalYear -->
				<s:if test="fieldErrors.get('payroll.fiscalYear')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.payroll.fiscalYear"/></label>
							<div class="col-md-10">
								<input id="payroll.fiscalYear" name="payroll.fiscalYear" class="form-control" placeholder=""/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payroll.fiscalYear')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.payroll.fiscalYear"/></label>
						<div class="col-md-10">
							<input id="payroll.fiscalYear" name="payroll.fiscalYear" class="form-control" value="<s:property value='payroll.fiscalYear'/>" placeholder="" />
						</div>
					</div>
				</s:else>
				<!-- END payroll.fiscalYear -->
				
				<!-- START payroll.payMonth -->
				<s:if test="fieldErrors.get('payroll.payMonth')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.payroll.payMonth"/></label>
							<div class="col-md-10">
								<input id="payroll.payMonth" name="payroll.payMonth" class="form-control" placeholder=""/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payroll.payMonth')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.payroll.payMonth"/></label>
						<div class="col-md-10">
							<input id="payroll.payMonth" name="payroll.payMonth" class="form-control" value="<s:property value='payroll.payMonth'/>" placeholder="" />
						</div>
					</div>
				</s:else>
				<!-- END payroll.payMonth -->
					
				<!-- START payroll.payrollDate -->
				<s:if test="fieldErrors.get('payroll.payrollDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.payroll.payrollDate"/></label>
							<div class="col-md-10">
								<input id="payroll.payrollDate" name="payroll.payrollDate" class="form-control" placeholder=""/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('payroll.payrollDate')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="hrml.employee.salary.payroll.payrollDate"/></label>
						<div class="col-md-10">
							<input id="payroll.payrollDate" name="payroll.payrollDate" class="form-control" value="<s:property value='payroll.payrollDate'/>" placeholder="" />
						</div>
					</div>
				</s:else>
				<!-- END payroll.payrollDate -->								
								
			</fieldset>				
		
		</div>
		<!-- end row -->

			<div class="form-actions">
				
				<div class="row">
					<div class="col-md-12">
						<ul>
						<s:iterator value="fieldErrors">
						<li>
						    <s:property value="key"/>:
						    <s:iterator value="value"><s:property/></s:iterator>
						 </li>   
						</s:iterator>
						 </ul>
						
						</div>
				</div>
						
			
				<div class="row">
					<div class="col-md-12">
						<button id="cancelSalaryPayroll" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveSalaryPayroll" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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

function setReadonly(flag){
	$("#salary\\.grosssalary").prop('readonly', flag);
	$("#salary\\.netsalary").prop('readonly', flag);
	$("#salary\\.taxsalary").prop('readonly', flag);
	
	if(flag){
		$("#fg\\.salary\\.grosssalary").hide();
		$("#fg\\.salary\\.netsalary").hide();
		$("#fg\\.salary\\.taxsalary").hide();
		/*
		$("#fg\\.salary\\.firstName").hide();
		$("#fg\\.salary\\.basicsalary").hide();
		$("#fg\\.salary\\.autopay").hide();
		$("#fg\\.salary\\.payperiod").hide();
		*/
	}else{
		$("#fg\\.salary\\.grosssalary").show();
		$("#fg\\.salary\\.netsalary").show();
		$("#fg\\.salary\\.taxsalary").show();
		/*
		$("#fg\\.salary\\.firstName").show();
		$("#fg\\.salary\\.basicsalary").show();
		$("#fg\\.salary\\.autopay").show();
		$("#fg\\.salary\\.payperiod").show();
		*/
	}
}

$(document).ready(function () {

    	
	$('#adjustment\\.adjustmentDate').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		timepicker: false,
	});

	$('#payroll\\.payrollDate').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		timepicker: false,
	});


	$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	$("#payroll\\.fiscalYear").mask('9999');
	$("#payroll\\.payMonth").mask('99');		
	


	/*
	$("#payroll\\.fiscalYear").datetimepicker( {
		lang: 'al',
		format: "m.Y",
		viewMode: "years",
		timepicker: false,
	});	
	
	
	
		format: "dd.mm.yyyy",
	    autoclose: true,
	    todayHighlight: true,		
	
	*/


	$("#adjustment\\.deduction").on('change',function(event){
		if($('#adjustment\\.deduction').is(":checked")){
			$('#adjustment\\.deduction').val("true");
		}else{
			$('#adjustment\\.deduction').val("false");
		}
	});
	
	if($("#adjustment\\.deduction").val()=="true"){
		$("#adjustment\\.deduction").prop('checked',true);
	}else{
		$('#adjustment\\.autopay').val("false");
	}
	
	
	$("#createPayslipAll").on('change',function(event){
		
		if($('#createPayslipAll').is(":checked")){
			$('#createPayslipAll').val("true");

			//$("#fs\\.employee\\.salary").hide();
			
			$("#fg\\.salary\\.firstName").hide();
			$("#fs\\.emplyoee\\.salary\\.contribution").hide();
		}else{
			$('#createPayslipAll').val("false");
			//$("#fs\\.employee\\.salary").show();
			$("#fg\\.salary\\.firstName").show();
			$("#fs\\.emplyoee\\.salary\\.contribution").show();
		}
		
	});
	
	
	
	$('#addRow').on('click', function (e) {
		
	    var deductionId = $("#adjustment\\.financialType\\.id").val();
	    var deductionValue = $("#adjustment\\.amount").val();
	    var deductionValue = $("#salary\\.employee\\.id").val();
	    alert("add new contribution: " + id + ", " + value);

		$.ajax({
			type : "GET",
			url : "Salary.form.do", 
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			success : function(data, status, jqXHR) { // on success..
				$("#payslip_form_content").html(jqXHR.responseText);
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
	    //adjustment.financialType.name
	    
	});
	
	$("#salary\\.employee\\.firstName").select2({
	    placeholder: "<s:text name="organization.placeholder.enter.activity"/>", 
	    minimumInputLength: 1,
	    ajax: {
	        url: "Input.employeeWithSalary.do",
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
	    formatResult: function(item) {
		    return item.employee + " (" + item.birthdate+ ")";
	    },
	    formatSelection: function(item) {
		    console.log(item);
		    var label;
		    if(item.id){
		    	$("#salary\\.id").val(item.id);
		    	$("#salary\\.employee\\.id").val(item.employeeId);
		    	$("#salary\\.employee\\.firstName").val(item.employee);
		    	label = item.employee + " (" + item.birthdate+ ")";
		    }
		    return label;
	    	
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	}); 
	
	$("#salary\\.employee\\.firstName").select2("data", {id: "<s:property value='salary.employee.id'/>", birthdate: "<s:property value='salary.employee.birthdate'/>", employee: "<s:property value="salary.employee.firstName"/> <s:property value="salary.employee.lastName"/>"});
	

	 $("#adjustment\\.financialType\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.financialType.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	name_startsWith: term,
		        	type:"OU",
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
	        	$("#adjustment\\.financialType\\.id").val(item.id);
	        	$("#adjustment\\.financialType\\.name").val(item.name);
	        	var label = item.name;
	        	if(item.name){
	        		label = item.name + " (" + item.code + ")";
	        	}
	            return label;	        	
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });  

	     $("#adjustment\\.financialType\\.name").select2("data", {id: "<s:property value='adjustment.financialType.id'/>", name: "<s:property value='adjustment.financialType.name'/>", code: "<s:property value='adjustment.financialType.code'/>"});

	     
	
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$("#finInput\\.year").mask('9999');
		$("#finInput\\.month").val('<s:property value="finInput.month.DOMVALUE"/>');

		if($('#language').val()=='en'){
			$('#finInput\\.financialType\\.name').val('<s:property value="finInput.financialType.name"/>');
		}else if($('#language').val()=='sr'){
			$('#finInput\\.financialType\\.name').val('<s:property value="finInput.financialType.nameSr"/>');
		}else{
			$('#finInput\\.financialType\\.name').val('<s:property value="finInput.financialType.nameEn"/>');
		}

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
		     
		 $("#finInput\\.organisation\\.orgaName").select2("data", {id: "<s:property value='finInput.organisation.id'/>", name: "<s:property value='finInput.organisation.orgaName'/>"});

// 		 $("#finInput\\.organisation\\.orgaName").select2("data", {id: "<s:property value='user.organisation.id'/>", name: "<s:property value='user.organisation.orgaName'/>"});
		 

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
	        	$("#finInput\\.financialType\\.id").val(item.id);
	        	$("#finInput\\.financialType\\.name").val(item.name);
	        	var label = item.name;
	        	if(item.name){
	        		label = item.name + " (" + item.code + ")";
	        	}
	            return label;	        	
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });  

	     $("#finInput\\.financialType\\.name").select2("data", {id: "<s:property value='finInput.financialType.id'/>", name: "<s:property value='finInput.financialType.name'/>", code: "<s:property value='finInput.financialType.code'/>"});


	     $("#cancelSalaryPayroll").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "Payslip.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#payslip_form_content").html(jqXHR.responseText);
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
			
	    Ladda.bind('#saveSalaryPayroll');
		$("#saveSalaryPayroll").on('click', function() {
			//alert($('#adjustment\\.deductionDate').val());
			$("#payslip_form :button").prop('disabled','disabled');
			$('#payslip_form').submit();
			return false;
		});	
		
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					$("#payslip_form").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#payslip_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
 					if(!errors){
 						jQuery("#payslip_grid").trigger("reloadGrid");
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
					$('#ajaxBusyB').hide();
				}
			});		
			$("#payslip_form :button").prop('disabled',false);
		})();
	    	
	});            
</script>