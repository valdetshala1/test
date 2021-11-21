<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- widget div-->
<div>

	<!-- widget content -->
	<div class="widget-body">
	
		<form id="taxrate_form" class="form-horizontal" action="TaxRateSave.do" accept-charset="utf8" method="post">
			
			<div class="row">
				
			<fieldset>
				<legend><s:text name="hrm.employee.salary.taxrate.menu"/></legend>
				<input id="taxrate.id" name="taxrate.id" value="<s:property value='taxrate.id'/>" type="hidden">
				<input id="taxrate.createdBy.id" name="taxrate.createdBy.id" value="<s:property value='taxrate.createdBy.id'/>" type="hidden">
				<input id="taxrate.createdDate" name="taxrate.createdDate" value="<s:date name='taxrate.createdDate' format='dd.MM.yyyy' />" type="hidden">
						
				<!-- START taxrate.taxNormName -->
				<s:if test="fieldErrors.get('taxrate.taxNormName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.taxNormName"/></label>
						<div class="col-md-10">
							<input id="taxrate.taxNormName" name="taxrate.taxNormName" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('taxrate.taxNormName')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.taxNormName"/></label>
						<div class="col-md-10">
							<input id="taxrate.taxNormName" name="taxrate.taxNormName" value="<s:property value='taxrate.taxNormName'/>" class="form-control" placeholder="" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END taxrate.taxNormName -->
											
				<!-- START taxrate.percent -->
				<s:if test="fieldErrors.get('taxrate.percent')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.percent"/></label>
						<div class="col-md-10">
							<input id="taxrate.percentage" name="taxrate.percentage" class="form-control" placeholder="" type="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('taxrate.percentage')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.percent"/></label>
						<div class="col-md-10">
							<input id="taxrate.percentage" name="taxrate.percentage" value="<s:property value='taxrate.percentage'/>" class="form-control" placeholder="" type="number">
						</div>									
					</div>
				</s:else>
				<!-- END taxrate.percent -->
				
				<!-- START taxrate.startAmount -->
				<s:if test="fieldErrors.get('taxrate.startAmount')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.startAmount"/></label>
						<div class="col-md-10">
							<input id="taxrate.startAmount" name="taxrate.startAmount" class="form-control" placeholder="" type="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('taxrate.startAmount')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.startAmount"/></label>
						<div class="col-md-10">
							<input id="taxrate.startAmount" name="taxrate.startAmount" value="<s:property value='taxrate.startAmount'/>" class="form-control" placeholder="" type="number">
						</div>									
					</div>
				</s:else>
				<!-- END taxrate.startAmount -->		
				
				<!-- START taxrate.endAmount -->
				<s:if test="fieldErrors.get('taxrate.endAmount')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.endAmount"/></label>
						<div class="col-md-10">
							<input id="taxrate.endAmount" name="taxrate.endAmount" class="form-control" placeholder="" type="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('taxrate.endAmount')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.endAmount"/></label>
						<div class="col-md-10">
							<input id="taxrate.endAmount" name="taxrate.endAmount" value="<s:property value='taxrate.endAmount'/>" class="form-control" placeholder="" type="number">
						</div>									
					</div>
				</s:else>
				<!-- END taxrate.endAmount -->		
				
				<!-- START taxrate.validDateFrom -->
				<s:if test="fieldErrors.get('taxrate.validDateFrom')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.validDateFrom"/></label>
						<div class="col-md-10">
							<input id="taxrate.validDateFrom" name="taxrate.validDateFrom" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('taxrate.validDateFrom')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.validDateFrom"/></label>
						<div class="col-md-10">
							<input id="taxrate.validDateFrom" name="taxrate.validDateFrom" value="<s:property value='taxrate.validDateFrom'/>" class="form-control" placeholder="" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END taxrate.validDateFrom -->		
				
				<!-- START taxrate.validDateTo -->
				<s:if test="fieldErrors.get('taxrate.validDateTo')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.validDateTo"/></label>
						<div class="col-md-10">
							<input id="taxrate.validDateTo" name="taxrate.validDateTo" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('taxrate.validDateTo')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.taxrate.validDateTo"/></label>
						<div class="col-md-10">
							<input id="taxrate.validDateTo" name="taxrate.validDateTo" value="<s:property value='taxrate.validDateTo'/>" class="form-control" placeholder="" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END taxrate.validDateFrom -->	
																

				<!-- START taxrate.validDateTo -->
				<s:if test="fieldErrors.get('taxrate.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.adjustment.note"/></label>
						<div class="col-md-10">
							<input id="taxrate.note" name="taxrate.note" class="form-control" placeholder="" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('taxrate.note')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrml.employee.salary.adjustment.note"/></label>
						<div class="col-md-10">
							<input id="taxrate.note" name="taxrate.note" value="<s:property value='taxrate.note'/>" class="form-control" placeholder="" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END taxrate.validDateFrom -->	
													
			</fieldset>
			
			</div>
			
			
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
						<button id="cancelTaxrate" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveTaxrate" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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

		/*
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$("#finInput\\.year").mask('9999');
		$("#finInput\\.month").val('<s:property value="finInput.month.DOMVALUE"/>');

	    $("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	    $("input[data='numberBigDec']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
		

		if($('#language').val()=='en'){
			$('#finInput\\.financialType\\.name').val('<s:property value="finInput.financialType.name"/>');
		}else if($('#language').val()=='sr'){
			$('#finInput\\.financialType\\.name').val('<s:property value="finInput.financialType.nameSr"/>');
		}else{
			$('#finInput\\.financialType\\.name').val('<s:property value="finInput.financialType.nameEn"/>');
		}
		*/

		$('#taxrate\\.validDateFrom').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: true,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		
		$('#taxrate\\.validDateTo').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: true,
			formatDate:'d.m.Y',
			timepicker: false,
		});
				


	     $("#cancelTaxrate").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "TaxRate.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#taxrate_form_content").html(jqXHR.responseText);
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
			
	    Ladda.bind('#saveTaxrate');
		$("#saveTaxrate").on('click', function() {
			$("#taxrate_form :button").prop('disabled','disabled');
			$('#taxrate_form').submit();
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
					$("#taxrate_form").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#taxrate_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
 					if(!errors){
 						jQuery("#taxrate_grid").trigger("reloadGrid");
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
			$("#taxrate_form :button").prop('disabled',false);
		})();
	    	
	});            
</script>