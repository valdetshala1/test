<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="protection_impl_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This projectSupporter used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="budget_mainntenance_form" class="form-horizontal" action="BudgetMainntenanceSave.do" accept-charset="utf8" method="post">
				<input id="budgetMainntenance.id" name="budgetMainntenance.id" value="<s:property value='budgetMainntenance.id'/>" type="hidden">
				<input id="language" name="language" value="<s:property value='locale.language'/>" type="hidden">
			<fieldset>
				<!-- START budgetMainntenance.financialType -->
				<s:if test="fieldErrors.get('budgetMainntenance.financialType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="budget.maintenance.financial.type"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.financialType.name" 
							name="budgetMainntenance.financialType.name" 
							class="form-control" placeholder="<s:text name="budget.maintenance.financial.type"/>" type="text" 
							value="<s:property value='budgetMainntenance.financialType.name'/>">
							<input id="budgetMainntenance.financialType.id" 
							name="budgetMainntenance.financialType.id" 
							type="hidden"/>
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('budgetMainntenance.financialType')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="budget.maintenance.financial.type"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.financialType.name" 
							name="budgetMainntenance.financialType.name" 
							class="form-control" placeholder="<s:text name="budget.maintenance.financial.type"/>" type="text"
							value="<s:property value='budgetMainntenance.financialType.name'/>">
							<input id="budgetMainntenance.financialType.id"
							name="budgetMainntenance.financialType.id"
							value="<s:property value="budgetMainntenance.financialType.id"/>" type="hidden"/>
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.financialType -->
				
				<!-- START budgetMainntenance.budgetCode -->
				<s:if test="fieldErrors.get('budgetMainntenance.budgetCode')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="budget.maintenance.financial.budget.code"/>:</label>
						<div class="col-md-10">
							<input maxlength="50" id="budgetMainntenance.budgetCode" name="budgetMainntenance.budgetCode" 
							class="form-control" placeholder="<s:text name="budget.maintenance.financial.budget.code"/>" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property 
							value="fieldErrors.get('budgetMainntenance.budgetCode')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="budget.maintenance.financial.budget.code"/>:</label>
						<div class="col-md-10">
							<input maxlength="50" id="budgetMainntenance.budgetCode" name="budgetMainntenance.budgetCode" 
							class="form-control" placeholder="<s:text name="budget.maintenance.financial.budget.code"/>" type="text"
							value="<s:property value='budgetMainntenance.budgetCode'/>">
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.budgetCode -->
				
				<!-- START budgetMainntenance.budgetYear -->
				<s:if test="fieldErrors.get('budgetMainntenance.budgetYear')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="budget.maintenance.financial.budget.year"/>:</label>
						<div class="col-md-10">
							<input maxlength="50" id="budgetMainntenance.budgetYear" name="budgetMainntenance.budgetYear" 
							class="form-control" placeholder="<s:text name="budget.maintenance.financial.budget.year"/>" type="number" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property 
							value="fieldErrors.get('budgetMainntenance.budgetYear')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="budget.maintenance.financial.budget.year"/>:</label>
						<div class="col-md-10">
							<input maxlength="50" id="budgetMainntenance.budgetCode" name="budgetMainntenance.budgetYear" 
							class="form-control" placeholder="<s:text name="budget.maintenance.financial.budget.year"/>" type="number"
							value="<s:property value='budgetMainntenance.budgetYear'/>">
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.budgetYear -->
								
				
				<!-- START budgetMainntenance.initialAnnualBudget -->
				<s:if test="fieldErrors.get('budgetMainntenance.initialAnnualBudget')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.initial.budget"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.initialAnnualBudget" 
							name="budgetMainntenance.initialAnnualBudget" class="form-control" 
							type="text" data="number" placeholder="<s:text name="budget.maintenance.financial.initial.budget"/>">
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('budgetMainntenance.initialAnnualBudget')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.initial.budget"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.initialAnnualBudget" 
							name="budgetMainntenance.initialAnnualBudget" class="form-control"
							type="text" data="number" value="<s:property value='budgetMainntenance.initialAnnualBudget'/>" placeholder="<s:text name="budget.maintenance.financial.initial.budget"/>">
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.initialAnnualBudget -->

				<!-- START budgetMainntenance.annualAllocation -->
				<s:if test="fieldErrors.get('budgetMainntenance.annualAllocation')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.annual.allocation"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.annualAllocation" 
							name="budgetMainntenance.annualAllocation" class="form-control" 
							type="text" data="number" placeholder="<s:text name="budget.maintenance.financial.annual.allocation"/>" >
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('budgetMainntenance.annualAllocation')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.annual.allocation"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.annualAllocation" 
							name="budgetMainntenance.annualAllocation" class="form-control"
							type="text" data="number"  value="<s:property value='budgetMainntenance.annualAllocation'/>" placeholder="<s:text name="budget.maintenance.financial.annual.allocation"/>">
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.annualAllocation -->
				
				<!-- START budgetMainntenance.currentExpenditure -->
				<s:if test="fieldErrors.get('budgetMainntenance.currentExpenditure')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.current.expenditure"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.currentExpenditure" 
							name="budgetMainntenance.currentExpenditure" class="form-control" 
							type="text" data="number" placeholder="<s:text name="budget.maintenance.financial.current.expenditure"/>">
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('budgetMainntenance.currentExpenditure')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.current.expenditure"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.currentExpenditure" 
							name="budgetMainntenance.currentExpenditure" class="form-control"
							type="text" data="number" value="<s:property value='budgetMainntenance.currentExpenditure'/>" placeholder="<s:text name="budget.maintenance.financial.current.expenditure"/>">
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.currentExpenditure -->
				
				<!-- START budgetMainntenance.commitment -->
				<s:if test="fieldErrors.get('budgetMainntenance.commitment')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.commitment"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.commitment" 
							name="budgetMainntenance.commitment" class="form-control" 
							type="text" data="number" placeholder="<s:text name="budget.maintenance.financial.commitment"/>">
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('budgetMainntenance.commitment')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.commitment"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.commitment" 
							name="budgetMainntenance.commitment" class="form-control"
							type="text" data="number" value="<s:property value='budgetMainntenance.commitment'/>" placeholder="<s:text name="budget.maintenance.financial.commitment"/>">
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.commitment -->
				
				<!-- START budgetMainntenance.availableBalance -->
				<s:if test="fieldErrors.get('budgetMainntenance.availableBalance')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.available.balance"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.availableBalance" 
							name="budgetMainntenance.availableBalance" class="form-control" 
							type="text" data="number" placeholder="<s:text name="budget.maintenance.financial.available.balance"/>">
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('budgetMainntenance.availableBalance')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.available.balance"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.availableBalance" 
							name="budgetMainntenance.availableBalance" class="form-control"
							type="text" data="number" value="<s:property value='budgetMainntenance.availableBalance'/>" placeholder="<s:text name="budget.maintenance.financial.available.balance"/>">
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.availableBalance -->

				<!-- START budgetMainntenance.bugetUtilizationInPercent -->
				<s:if test="fieldErrors.get('budgetMainntenance.bugetUtilizationInPercent')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.budget.utilization"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.bugetUtilizationInPercent" 
							name="budgetMainntenance.bugetUtilizationInPercent" class="form-control" 
							type="text" data="number" placeholder="<s:text name="budget.maintenance.financial.budget.utilization"/>">
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('budgetMainntenance.bugetUtilizationInPercent')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="budget.maintenance.financial.budget.utilization"/>:</label>
						<div class="col-md-10">
							<input id="budgetMainntenance.bugetUtilizationInPercent" 
							name="budgetMainntenance.bugetUtilizationInPercent" class="form-control"
							type="text" data="number" value="<s:property value='budgetMainntenance.bugetUtilizationInPercent'/>" placeholder="<s:text name="budget.maintenance.financial.budget.utilization"/>">
						</div>									
					</div>
				</s:else>
				<!-- END budgetMainntenance.bugetUtilizationInPercent -->
				
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelBgm" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveBgM" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("input[data='number']").autoNumeric('init',{mDec:"2",aSep:",",aDec:"."});
		
		 $("#budgetMainntenance\\.financialType\\.name").select2({
		        placeholder: "",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.financialType.do",
			        dataType: 'json',
			        quietMillis: 250,
			        data: function (term, page) {
			        return {
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
			    formatResult: function(item) {
				    var label = item.name + " (<span style='color:orange;'>" + item.code + "</span>)";
				    return label;
			    },		        
		        formatSelection: function(item) {
		        	$("#budgetMainntenance\\.financialType\\.id").val(item.id);
		        	$("#budgetMainntenance\\.financialType\\.name").val(item.name);
		        	var label = item.name;
		        	if(item.name){
		        		label = item.name + " (" + item.code + ")";
		        	}
		            return label;			            
		        },
		        allowClear: true,
		        escapeMarkup: function (m) { return m; }
		    });  

		 	if($('#language').val()=='al'){
				$('#budgetMainntenance\\.financialType\\.name').val('<s:property value="budgetMainntenance.financialType.name"/>');
			}else if($('#language').val()=='sr'){
				$('#budgetMainntenance\\.financialType\\.name').val('<s:property value="budgetMainntenance.financialType.nameSr"/>');
			}else{
				$('#budgetMainntenance\\.financialType\\.name').val('<s:property value="budgetMainntenance.financialType.nameEn"/>');
			}
			var finType=$('#budgetMainntenance\\.financialType\\.name').val();
	     	$("#budgetMainntenance\\.financialType\\.name").select2("data", {id: "<s:property value='budgetMainntenance.financialType.id'/>", name: finType});

		$("#cancelBgm").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "BudgetMainntenance.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#budget_mainntenance_form_content").html(jqXHR.responseText);
					//alert after cancel action
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color :  "#C46A69",
						//timeout 5000
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

		Ladda.bind('#saveBgM');
		$("#saveBgM").on('click', function() {
			if($('#budget_mainntenance_form').valid()){ 
				$("#budget_mainntenance_form :button").prop('disabled','disabled');
				$('#budget_mainntenance_form').submit();
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
			    	$("#budget_mainntenance_form_content").html(jqXHR.responseText);
					jQuery("#budget_mainntenance_grid").trigger("reloadGrid");
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
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
			$("#budget_mainntenance_form :button").prop('disabled',false);			
		})();
	});            
</script>