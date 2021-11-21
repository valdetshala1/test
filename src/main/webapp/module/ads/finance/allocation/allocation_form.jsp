<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<jsp:include page="../../../base/validation.jsp"></jsp:include>
  
  
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="allocation_form" class="form-horizontal" action="BudgetAllocationSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="fin.allocation.legend.annual.budget.allocation.data"/></legend>
				<input id="annuBudgetAllocation.id" name="annuBudgetAllocation.id" value="<s:property value='annuBudgetAllocation.id'/>" type="hidden">
				<input id="finInputIdList" name="finInputIdList" value="<s:property value='finInputIdList'/>" type="hidden">
				
				<!-- START annuBudgetAllocation.department  -->
				<s:if test="fieldErrors.get('annuBudgetAllocation.organization')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="annu.felling.label.municipality"/></label>
						<div class="col-md-10">
							<input id="annuBudgetAllocation.organisation.orgaName" name="annuBudgetAllocation.organisation.orgaName" class="form-control" placeholder="<s:text name="annu.felling.label.municipality"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('annuBudgetAllocation.organization')"/> </span>
							<input id="annuBudgetAllocation.organisation.id" name="annuBudgetAllocation.organisation.id" value="<s:property value='annuBudgetAllocation.organisation.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="annu.felling.label.municipality"/></label>
						<div class="col-md-10">
						<input id="annuBudgetAllocation.organisation.orgaName" name="annuBudgetAllocation.organisation.orgaName" value="<s:property value='annuBudgetAllocation.organisation.orgaName'/>" class="form-control" placeholder="<s:text name="annu.felling.label.municipality"/>" type="text">
						<input id="annuBudgetAllocation.organisation.id" name="annuBudgetAllocation.organisation.id" value="<s:property value='annuBudgetAllocation.organisation.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END annuBudgetAllocation.department  -->	
				<!-- START annuBudgetAllocation.month -->
				<s:if test="fieldErrors.get('annuBudgetAllocation.month')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="report.wood.production.label.month"/></label>
						<div class="col-md-10">
							<select class="form-control" id="annuBudgetAllocation.month" name="annuBudgetAllocation.month">
								<s:iterator value="monthList" var="st">
									<option value="<s:property value="#st.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#st.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#st.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#st.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('annuBudgetAllocation.month')"/>
							</span> 
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="report.wood.production.label.month"/></label>
					<div class="col-md-10">
						<select class="form-control" id="annuBudgetAllocation.month" name="annuBudgetAllocation.month">
								<s:iterator value="monthList" var="st">
									<option value="<s:property value="#st.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#st.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#st.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#st.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
						</select>
					</div>
				</div>
				</s:else>
				<!-- END annuBudgetAllocation.month -->
					<!-- START annuBudgetAllocation.year -->
				<s:if test="fieldErrors.get('annuBudgetAllocation.year')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="report.wood.production.label.year"/></label>
						<div class="col-md-10">
							<input data="number" id="annuBudgetAllocation.year" name="annuBudgetAllocation.year" class="form-control" placeholder="<s:text name="report.wood.production.label.year"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('annuBudgetAllocation.year')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="report.wood.production.label.year"/></label>
						<div class="col-md-10">
							<input data="number" id="annuBudgetAllocation.year" name="annuBudgetAllocation.year" value="<s:property value='annuBudgetAllocation.year'/>" class="form-control" placeholder="<s:text name="report.wood.production.label.year"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END annuBudgetAllocation.year -->
			</fieldset>
			<fieldset>
				<div id="finInput">
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="finance.input.legend.financial.input.data.grid"/></label>
						<div class="col-md-10">
							<jsp:include page="financial_input_grid.jsp"></jsp:include>						
						</div>									
					</div>
				</div>
			
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAllocation" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
<%-- 						<s:if test="annuBudgetAllocation.id==null"> --%>
						<button id="saveAllocation" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
<%-- 						</s:if> --%>
						
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
		$("#finInput").hide();
		if($("#annuBudgetAllocation\\.id").val()){
			$('#saveAllocation').prop('disabled','disabled');
			}    

		if($("#annuBudgetAllocation\\.year").val() && $("#annuBudgetAllocation\\.month").val() && $("#annuBudgetAllocation\\.organisation\\.id").val()){
		    jQuery("#fin_input_alloc_grid").jqGrid('setGridParam',{url:'FinGrid.financialInput.do?type=IN&year='+$("#annuBudgetAllocation\\.year").val()+"&month="+$("#annuBudgetAllocation\\.month").val()+"&municipality_id="+$("#annuBudgetAllocation\\.organisation\\.id").val()+"&allocation=true", datatype:"json"}).trigger('reloadGrid');
			$("#finInput").show();
			}
		
		$( "input[type='text']" ).change(function() {
			if($("#annuBudgetAllocation\\.year").val() && $("#annuBudgetAllocation\\.month").val() && $("#annuBudgetAllocation\\.organisation\\.id").val()){
			    jQuery("#fin_input_alloc_grid").jqGrid('setGridParam',{url:'FinGrid.financialInput.do?type=IN&year='+$("#annuBudgetAllocation\\.year").val()+"&month="+$("#annuBudgetAllocation\\.month").val()+"&municipality_id="+$("#annuBudgetAllocation\\.organisation\\.id").val()+"&allocation=true", datatype:"json"}).trigger('reloadGrid');
				$("#finInput").show();
				}
		});

		$( "#annuBudgetAllocation\\.month" ).change(function() {
			if($("#annuBudgetAllocation\\.year").val() && $("#annuBudgetAllocation\\.month").val() && $("#annuBudgetAllocation\\.organisation\\.id").val()){
			    jQuery("#fin_input_alloc_grid").jqGrid('setGridParam',{url:'FinGrid.financialInput.do?type=IN&year='+$("#annuBudgetAllocation\\.year").val()+"&month="+$("#annuBudgetAllocation\\.month").val()+"&municipality_id="+$("#annuBudgetAllocation\\.organisation\\.id").val()+"&allocation=true", datatype:"json"}).trigger('reloadGrid');
				$("#finInput").show();				}

			});
		
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: '', mDec: '0',vMax:9999});
// 		$("#annuBudgetAllocation\\.year").mask("9999");
		$("#employee\\.organisation\\.orgaName").autocomplete({
	        source: function(request, response) {
	            $.ajax({
	            	type:"get",
	                url: "Input.organisation.do",
	                dataType: "json",
	                data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						name_startsWith: request.term
					},
					success: function( data ) {
						response( $.map( data, function(item ) {
							return {
								label: item.name+" ("+item.oper_level_val+")",
	                            value: item.name+" ("+item.oper_level_val+")",
	                            id: item.id
							};
						}));
					},
	                maxRows: 100,
	        		minLength: 0   
	            });
	        },
	        select: function(event, ui) {
	        	 $("#employee\\.organisation\\.id" ).val( ui.item.id);
	        }  
	    });		

		$("#annuBudgetAllocation\\.organisation\\.orgaName").select2({
		    placeholder: "<s:text name="organisation.name.placeholder"/>", 
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
			        	orglevel:"M"
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
		    	$("#annuBudgetAllocation\\.organisation\\.id").val(item.id);
		    	$("#annuBudgetAllocation\\.organisation\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#annuBudgetAllocation\\.organisation\\.orgaName").select2("data", {id: "<s:property value='annuBudgetAllocation.organisation.id'/>", name: "<s:property value="annuBudgetAllocation.organisation.orgaName"/>"});
		
	 	$('#annuBudgetAllocation\\.month').val('<s:property value="annuBudgetAllocation.month.DOMVALUE"/>');
		    
		$("#cancelAllocation").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "BudgetAllocation.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#allocation_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						//timeout: 6000,
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

		
		
	    var  formData="finInputIdList=";
		$("#saveAllocation").on('click', function() {

			$.SmartMessageBox({
				title : "<s:text name="fin.allocation.conform.text"/>", 
				content : "<s:text name="fin.allocation.conform.mesage.content"/>", 
				buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
				icon : "fa fa-bell"
				
			}, function(ButtonPressed) {
				if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
					  var finData = $("#fin_input_alloc_grid").jqGrid('getRowData');
		              var finInputids = [];
		               for (var i=1; i<=finData.length; i++) {
		            	   var rowData = jQuery("#fin_input_alloc_grid").getRowData(i); 
		                   finInputids.push(rowData.id);
		               }
		               $("#finInputIdList").val(finInputids.join(","));
		               formData+= finInputids.join(",");
		               
					if($('#allocation_form').valid()){ 
						$("#allocation_form :button").prop('disabled','disabled');
						$('#allocation_form').submit();
					}
				}//EOF IF ButtonPressed
			});	 

			return false;
		});	
		

		(function() {
			$('form').ajaxForm({
// 				data:formData,
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#allocation_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						$("#allocation_grid").trigger("reloadGrid");
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
		})();
	
	});            
</script>