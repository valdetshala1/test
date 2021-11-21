<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
	<!-- widget div-->
	<div id="protocolports_form_content">
		<!-- widget edit box -->
		<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

		</div>
		<!-- end widget edit box -->
		<!-- widget content -->
		<div class="widget-body">
			<form id="protocolports_form" class="form-horizontal"
			action="ProtocolPortsSave.do" accept-charset="utf8" method="post">
			
				<input type="hidden" id="protocolPorts.id"
				name="protocolPorts.id"
				value="<s:property value="vehicle.id"/>" />
				
				<fieldset>
					<legend><s:text name="vehicles.legend.protocolports.data"/></legend>
					<!-- Start protocolPorts.organisation -->
					
					<!-- START protocolPorts.protocolType -->
					<s:if test="fieldErrors.get('protocolPorts.protocolType')!=null">
						<div class="form-group has-error">
						 	<label class="col-md-2 control-label">*<s:text name="protocolPorts.label.type"/></label>
						 	<div class="col-md-10">
						 		<input id="protocolPorts.protocolType"
							  	name="protocolPorts.protocolType"  maxlength="50" class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('protocolPorts.protocolType')" /> </span>
						 	</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="protocolPorts.label.type"/></label>
							<div class="col-md-10">
						 		<input id="protocolPorts.protocolType"
								name="protocolPorts.protocolType"  maxlength="50" 
								value="<s:property value='protocolPorts.protocolType'/>"
								class="form-control"placeholder="<s:text name="protocolPorts.label.type"/>"
								type="text">
							</div>	
						</div>
					</s:else>
					<!-- END protocolPorts.protocolName -->	
					
						<!-- START protocolPorts.protocolType -->
					<s:if test="fieldErrors.get('protocolPorts.protocolName')!=null">
						<div class="form-group has-error">
						 	<label class="col-md-2 control-label">*<s:text name="protocolPorts.label.name"/></label>
						 	<div class="col-md-10">
						 		<input id="protocolPorts.protocolName"
								name="protocolPorts.protocolName"  class="form-control"
								placeholder="Default Text Field" type="text"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('protocolPorts.protocolName')" /> </span>
						 	</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="protocolPorts.label.name"/></label>
							<div class="col-md-10">
						 		<input id="protocolPorts.protocolName"
								name="protocolPorts.protocolName" 
								value="<s:property value='protocolPorts.protocolName'/>"
								class="form-control"placeholder="<s:text name="protocolPorts.label.name"/>"
								type="text">
							</div>	
						</div>
					</s:else>
					<!-- END protocolPorts.protocolName -->	
				</fieldset>
			    <div class="form-actions">
					<div class="row">
						<div class="col-md-12">
							<button id="cancelLV" class="btn btn-default" type="button">
								<s:text name="label.button.cancel"></s:text>
							</button>
							<button id="saveLV" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
	    $("#cancelLV").on('click', function() {
			$.ajax({
				type : "GET",
				url : "ProtocolPorts.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#protocolports_form_content").html(jqXHR.responseText);
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

	    Ladda.bind('#saveLV');
		$("#saveLV").on('click', function() {
			$('#protocolports_form').submit();
			return false;
		});

	
	});
	</script>