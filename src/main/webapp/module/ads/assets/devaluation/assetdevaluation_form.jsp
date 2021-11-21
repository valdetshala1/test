<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="assetdevaluation_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="assetdevaluation_form" class="form-horizontal"
			action="AssetsDevaluationSave.do" accept-charset="utf8" method="post">
			
			<input type="hidden" id="assetsList" name="assetsList" value="<s:property value="assetsList"/>"/>
			
			<input type="hidden" id="assetsDevaluation.id"
				name="assetsDevaluation.id"
				value="<s:property value="assetsDevaluation.id"/>" />

			<fieldset>
				<legend><s:text name="asset.legend.assets.devaluate"/></legend>
				<!-- START assetsDevaluation.yearOfDeval -->
				<s:if test="fieldErrors.get('assetsDevaluation.yearOfDeval')!=null">
					<div class="form-group has-error">
						<label class="col-md-4 control-label">*<s:text name="asset.legend.year.of.devaluation"/></label>
						<div class="col-md-8">
							<input id="assetsDevaluation.yearOfDeval" name="assetsDevaluation.yearOfDeval" class="form-control" placeholder="<s:text name="asset.legend.year.of.devaluation"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('assetsDevaluation.yearOfDeval')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-4 control-label">*<s:text name="asset.legend.year.of.devaluation"/></label>
						<div class="col-md-8">
							<input id="assetsDevaluation.yearOfDeval" name="assetsDevaluation.yearOfDeval" value="<s:property value='assetsDevaluation.yearOfDeval'/>" class="form-control" placeholder="<s:text name="asset.legend.year.of.devaluation"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END assetsDevaluation.yearOfDeval -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAssetDeval" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveAssetDeval" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#assetdevaluation_form_content").on('remove',function(){
			$("#devaluate_button").removeClass('ui-state-disabled');
		});
		$('#assetsDevaluation\\.yearOfDeval').mask("9999");
		$("#assetsList").val($("#assets").val());

		$("#cancelAssetDeval").on('click', function() {
			$("#assetdevaluation_form_content").dialog("close");
			return false;
		});
		Ladda.bind('#saveAssetDeval');
		$("#saveAssetDeval").on('click', function() {
			$("#assetdevaluation_form :button").prop('disabled','disabled');
			$('#assetdevaluation_form').submit();
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
					$("#asset_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#assetdevaluation_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if (!errors) {
						$("#asset_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
						$("#assetdevaluation_form_content").dialog("close");
					} else {
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
						//$("#farmer_expander").html(jqXHR.responseText);
					}
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});
			$("#assetdevaluation_form :button").prop('disabled',false);				
		})();
	});

	
</script>