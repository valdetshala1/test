<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div id="asset_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
	<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
		<form id="asset_form" class="form-horizontal"
			action="AssetSave.do" accept-charset="utf8" method="post">

			<input type="hidden" id="asset.id"
				name="asset.id"
				value="<s:property value="asset.id"/>" />

			<fieldset>
				<legend><s:text name="asset.legend.asset.data"/></legend>
				<!-- START asset.barcode -->
				<s:if test="fieldErrors.get('asset.barcode')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="asset.legend.barcode"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="asset.barcode"
								name="asset.barcode" class="form-control"
								placeholder="<s:text name="asset.legend.barcode"/>" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('asset.barcode')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="asset.legend.barcode"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="asset.barcode"
								name="asset.barcode"
								value="<s:property value='asset.barcode'/>"
								class="form-control" placeholder="<s:text name="asset.legend.barcode"/>"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END asset.barcode -->
				<!-- START asset.name -->
				<s:if test="fieldErrors.get('asset.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input maxlength="100" id="asset.name"
								name="asset.name" class="form-control" placeholder="<s:text name="label.person.firstname"/>"
								 type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('asset.name')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/></label>
						<div class="col-md-10">
							<input maxlength="100" id="asset.name"
								name="asset.name" placeholder="<s:text name="label.person.firstname"/>"
								value="<s:property value='asset.name'/>"
								class="form-control" type="text">
						</div>
					</div>
				</s:else>
				<!-- END asset.name -->
				<!-- Start asset.organisation -->
				<s:if test="fieldErrors.get('asset.organisation.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="asset.legend.department"/></label>
						<div class="col-md-10">
							<input id="asset.organisation.orgaName" name="asset.organisation.orgaName" class="form-control" placeholder="<s:text name="asset.legend.department"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('asset.organisation.id')"/> </span>
							<input id="asset.organisation.id" name="asset.organisation.id" value="<s:property value='asset.organisation.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="asset.legend.department"/></label>
						<div class="col-md-10">
						<input id="asset.organisation.orgaName" name="asset.organisation.orgaName" value="<s:property value='asset.organisation.orgaName'/>" class="form-control" placeholder="<s:text name="asset.legend.department"/>" type="text">
						<input id="asset.organisation.id" name="asset.organisation.id" value="<s:property value='asset.organisation.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END asset.organisation -->
				<!-- START asset.location -->
				<s:if test="fieldErrors.get('asset.location')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.grid.location"/></label>
						<div class="col-md-10">
							<input maxlength="255" id="asset.location" name="asset.location" class="form-control" placeholder="<s:text name="hum.employee.grid.location"/>" type="text"> 
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('asset.location')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.grid.location"/></label>
						<div class="col-md-10">
							<input maxlength="255" id="asset.location" name="asset.location" value="<s:property value='asset.location'/>" class="form-control" placeholder="<s:text name="hum.employee.grid.location"/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END asset.location -->
				
				<!-- START asset.dateOfPurchase -->
				<s:if test="fieldErrors.get('asset.dateOfPurchase')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="asset.label.date.of.purchase"/></label>
						<div class="col-md-10">
							<input id="asset.dateOfPurchase" name="asset.dateOfPurchase" class="form-control" placeholder="<s:text name="asset.label.date.of.purchase"/>" type="text" > <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('asset.dateOfPurchase')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="asset.label.date.of.purchase"/></label>
						<div class="col-md-10">
							<input id="asset.dateOfPurchase" name="asset.dateOfPurchase" value="<s:property value='asset.dateOfPurchase'/>" class="form-control" placeholder="<s:text name="asset.label.date.of.purchase"/>" type="text" >
						</div>
					</div>
				</s:else>
				<!-- END asset.dateOfPurchase -->
				<!-- START asset.quantity -->
<%-- 				<s:if test="fieldErrors.get('asset.quantity')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label">*<s:text name="dhpet.maint.of.mong.label.quantity"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<input id="asset.quantity" name="asset.quantity" class="form-control" placeholder="<s:text name="dhpet.maint.of.mong.label.quantity"/>" type="text" data="number">  --%>
<%-- 							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('asset.quantity')" /> </span> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label">*<s:text name="dhpet.maint.of.mong.label.quantity"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 							<input id="asset.quantity" name="asset.quantity" value="<s:property value='asset.quantity'/>" class="form-control" placeholder="<s:text name="dhpet.maint.of.mong.label.quantity"/>" type="text" data="number"> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END asset.quantity -->
				<!-- START asset.purchaseValue -->
				<s:if test="fieldErrors.get('asset.purchaseValue')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="asset.label.purchase.value"/></label>
						<div class="col-md-10">
							<input id="asset.purchaseValue" name="asset.purchaseValue" class="form-control" placeholder="<s:text name="asset.label.purchase.value"/>" type="text" data="number"> 
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('asset.purchaseValue')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="asset.label.purchase.value"/></label>
						<div class="col-md-10">
							<input id="asset.purchaseValue" name="asset.purchaseValue" value="<s:property value='asset.purchaseValue'/>" class="form-control" placeholder="<s:text name="asset.label.purchase.value"/>" type="text" data="number">
						</div>
					</div>
				</s:else>
				<!-- END asset.purchaseValue -->
				<!-- START asset.amortizationGrade -->
				<s:if test="fieldErrors.get('asset.amortizationGrade')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="asset.label.amortization.grade"/></label>
						<div class="col-md-10">
							<input id="asset.amortizationGrade" name="asset.amortizationGrade" class="form-control" placeholder="<s:text name='asset.label.amortization.grade'/>" type="text" data="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('asset.amortizationGrade')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="asset.label.amortization.grade"/></label>
						<div class="col-md-10">
							<input id="asset.amortizationGrade" name="asset.amortizationGrade" value="<s:property value='asset.amortizationGrade'/>" class="form-control" placeholder="<s:text name="asset.label.amortization.grade"/>" type="text" data="number">
						</div>
					</div>
				</s:else>
				<!-- END asset.amortizationGrade -->
			
				<!-- START asset.serialNo -->
				<s:if test="fieldErrors.get('asset.serialNo')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="asset.label.serial.no"/></label>
						<div class="col-md-10">
							<input maxlength="100" id="asset.serialNo" name="asset.serialNo" class="form-control" placeholder="<s:text name="asset.label.serial.no"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('asset.serialNo')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="asset.label.serial.no"/></label>
						<div class="col-md-10">
							<input maxlength="100" id="asset.serialNo" name="asset.serialNo" value="<s:property value='asset.serialNo'/>" class="form-control" placeholder="<s:text name="asset.label.serial.no"/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END asset.serialNo -->
				<!-- START asset.inFunction -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="asset.label.in.function"/></label>
						<div class="col-md-10">
							<input id="asset.inFunction" name="asset.inFunction"  value="<s:property value='asset.inFunction'/>" type="checkbox">
						</div>
				</div>
				<!-- END asset.inFunction -->
				<!-- START asset.damaged -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="asset.label.damage"/></label>
						<div class="col-md-10">
							<input id="asset.damaged" name="asset.damaged"  value="<s:property value='asset.damaged'/>" type="checkbox">
						</div>
				</div>
				<!-- END asset.damaged -->
				<!-- START asset.comments -->
				<s:if test="fieldErrors.get('asset.comments')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.comment"/></label>
						<div class="col-md-10">
								<textarea  maxlength="500" id="asset.comments" name="asset.comments" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"><s:property value='asset.comments'/></textarea>
								 <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('asset.comments')" /></span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.comment"/></label>
						<div class="col-md-10">
							<textarea  maxlength="500" id="asset.comments" name="asset.comments" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"><s:property value='asset.comments'/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END asset.comments -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAsset" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveAsset" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
	    $("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$('#asset\\.dateOfPurchase').datetimepicker({
			lang: '<s:property value="#lang"/>',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});

		$("#asset\\.organisation\\.orgaName").select2({
		    placeholder: "",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.organisation.do?",
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
		    	$( "#asset\\.organisation\\.id" ).val(item.id);
		    	$("#asset\\.organisation\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		$("#asset\\.organisation\\.orgaName").select2("data", {id: "<s:property value='asset.organisation.id'/>", name: "<s:property value="asset.organisation.orgaName"/>"});
		
		$('#asset\\.inFunction').on('change',function(event){
			$('#asset\\.inFunction').val( $('#asset\\.inFunction')[0].checked ? "true" : "false" );
		});
		$('#asset\\.inFunction').val('<s:property value="asset.inFunction"/>');
		if($('#asset\\.inFunction').val()=='true'){
			$('#asset\\.inFunction').prop('checked', true);
		};
	    
		$('#asset\\.damaged').on('change',function(event){
			$('#asset\\.damaged').val( $('#asset\\.damaged')[0].checked ? "true" : "false" );
		});
		$('#asset\\.damaged').val('<s:property value="asset.damaged"/>');
		if($('#asset\\.damaged').val()=='true'){
			$('#asset\\.damaged').prop('checked', true);
		};
		$("#cancelAsset").on('click', function() {
			$.ajax({
				type : "GET",
				url : "Asset.asset.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#assets_content").html(jqXHR.responseText);
					//alert after cancel action
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
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
		Ladda.bind('#saveAsset');
		$("#saveAsset").on('click', function() {
			$("#asset_form :button").prop('disabled','disabled');
			$('#asset_form').submit();
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
			    	var id=$("#asset\\.id").val();
					$("#asset_form_content").html(jqXHR.responseText);
					
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
					if(!errors_exits){
						jQuery("#asset_grid").trigger("reloadGrid");
						if(!id){
							loadURL("Asset.asset.do?assetId="+$("#asset\\.id").val(),$("#assets_content"));
						}else{
							$("#assetOrganisation").val($("#asset\\.organisation\\.id").val());//if organisation has changed
						}
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
			$("#asset_form :button").prop('disabled',false);				
		})();
	});

	
</script>