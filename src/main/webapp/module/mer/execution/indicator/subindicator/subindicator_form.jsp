<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body" id="subindicator_form_content">
		<form id="subindicator_form" class="form-horizontal" action="SubIndicatorSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="subindicator.id" name="subindicator.id" value="<s:property value="subindicator.id"/>" />
			<input type="hidden" id="subindicator.person.id" name="subindicator.person.id" value="<s:property value="subindicator.person.id"/>" />
			<input type="hidden" id="indicId" name="indicId" value="<s:property value="indicId"/>" />
			<input type="hidden" id="subindicator.createdDate" name="subindicator.createdDate" value="<s:property value="subindicator.createdDate"/>" />
			<input type="hidden" id="subindicator.merIndicator.id" name="subindicator.merIndicator.id" value="<s:property value="subindicator.merIndicator.id"/>" />
			<fieldset>
				<!-- START subindicator.name -->
				<s:if test="fieldErrors.get('subindicator.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.name'/></label>
						<div class="col-md-10">
							<input id="subindicator.name" name="subindicator.name" class="form-control" placeholder="<s:text name='mer.project.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subindicator.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.name'/></label>
						<div class="col-md-10">
							<input id="subindicator.name" name="subindicator.name" value="<s:property value='subindicator.name'/>" class="form-control" placeholder="<s:text name='mer.project.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END subindicator.name -->
				<!-- START subindicator.nameEn -->
				<s:if test="fieldErrors.get('subindicator.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameEn'/></label>
						<div class="col-md-10">
							<input id="subindicator.nameEn" name="subindicator.nameEn" class="form-control" placeholder="<s:text name='mer.project.nameEn'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subindicator.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.project.nameEn'/></label>
						<div class="col-md-10">
							<input id="subindicator.nameEn" name="subindicator.nameEn" value="<s:property value='subindicator.nameEn'/>" class="form-control" placeholder="<s:text name='mer.project.nameEn'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END subindicator.nameEn -->
				<!-- START subindicator.nameSr -->
				<s:if test="fieldErrors.get('subindicator.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='mer.project.nameSr'/></label>
						<div class="col-md-10">
							<input id="subindicator.nameSr" name="subindicator.nameSr" class="form-control" placeholder="<s:text name='mer.project.nameSr'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subindicator.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.project.nameSr'/></label>
						<div class="col-md-10">
							<input id="subindicator.nameSr" name="subindicator.nameSr" value="<s:property value='subindicator.nameSr'/>" class="form-control" placeholder="<s:text name='mer.project.nameSr'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END subindicator.nameSr -->
				<!-- START subindicator.uomId -->
				<s:if test="fieldErrors.get('subindicator.uom')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='order.item.uom'/></label>
						<div class="col-md-10">
							<input id="subindicator.uom.name" name="subindicator.uom.name" class="form-control" placeholder="<s:text name='order.item.uom'/>" type="text">
							<input id="subindicator.uom.id" name="subindicator.uom.id" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subindicator.uom')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='order.item.uom'/></label>
						<div class="col-md-10">
							<input id="subindicator.uom.name" name="subindicator.uom.name" value="<s:property value='subindicator.uom.name'/>"  class="form-control" placeholder="<s:text name='order.item.uom'/>" type="text">
							<input id="subindicator.uom.id" name="subindicator.uom.id" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END subindicator.nameSr -->
				<!-- START subindicator.note -->
				<s:if test="fieldErrors.get('subindicator.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="mer.execution.note"/></label>
						<div class="col-md-10">
							<textarea id="subindicator.note" name="subindicator.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('subindicator.note')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.execution.note'/></label>
						<div class="col-md-10">
							<textarea id="subindicator.note" name="subindicator.note" class="form-control" placeholder="<s:text name="mer.execution.note"/>"><s:property value='subindicator.note'/></textarea>
						</div>									
					</div>
				</s:else>
		<!-- END subindicator.note -->
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelSubIndic" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveSubIndic" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>
		</fieldset>
		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
<script type="text/javascript">
$(document).ready(function () {
	if(!$("#subindicator\\.merIndicator\\.id").val()){
			$("#subindicator\\.merIndicator\\.id").val($("#indicId").val());
		}
		$("#subindicator\\.uom\\.name").select2({
		    placeholder: "", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "OrderMgmtInput.uom.do",
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
		    formatResult: formatResult,
		    formatSelection: function(item) {
		    	$("#subindicator\\.uom\\.id").val(item.id);
		    	$("#subindicator\\.uom\\.name").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 

	 $("#subindicator\\.uom\\.name").select2("data", {id: "<s:property value='subindicator.uom.id'/>", name: "<s:property value="subindicator.uom.name"/> "});

	 	Ladda.bind('#saveSubIndic');
		$("#saveSubIndic").on('click', function () {  
			$("#subindicator_form :button").prop('disabled','disabled');             
			$('#subindicator_form').submit();
			return false;        
		});

		$("#cancelSubIndic").on('click', function() {
			$("#subindicator_popup").dialog("close");
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
					$("#subindicator_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#subindicator_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
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
						jQuery("#perf_indicator_grid").trigger("reloadGrid");
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
			$("#subindicator_form :button").prop('disabled',false);
		})();		
});
	
</script>