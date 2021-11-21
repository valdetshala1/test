<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">

		<form id="lawsuitstatus_form" class="form-horizontal" action="LawSuitStatusSave.do"
			accept-charset="utf8" method="post">
			
			<input type="hidden" id="lawSuitStatus.id" name="lawSuitStatus.id"
				value="<s:property value="lawSuitStatus.id"/>" />
				
			<input type="hidden" id="lawSuitStatus.active" name="lawSuitStatus.active"
				value="<s:property value="lawSuitStatus.active"/>" />
				
			<input type="hidden" id="lawSuitStatus.lawSuit.id" name="lawSuitStatus.lawSuit.id"
				value="<s:property value="lawSuitStatus.lawSuit.id"/>" />
			
			<input type="hidden" id="lawSuitStatus.createDate" name="lawSuitStatus.createDate"
				value="<s:property value="lawSuitStatus.createDate"/>" />
			
			<input type="hidden" id="lawSuitStatus.employee.id" name="lawSuitStatus.employee.id"
				value="<s:property value="lawSuitStatus.employee.id"/>" />
			
			<input id="lawSuitStatus.docName" name="lawSuitStatus.docName" class="form-control" value="<s:property value='lawSuitStatus.docName'/>" type="hidden">
			<input id="lawSuitStatus.docType" name="lawSuitStatus.docType" class="form-control" value="<s:property value='lawSuitStatus.docType'/>" type="hidden">
			
			<fieldset>
				<legend><s:text name="law.suit.legend.law.suit.status"/></legend>
				<!-- START lawSuitStatus.status -->
				<s:if test="fieldErrors.get('lawSuitStatus.status')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.status"/></label>
						<div class="col-md-10">
							<select class="form-control" id="lawSuitStatus.status" name="lawSuitStatus.status">
								<s:iterator value="lawsuitstatusList" var="st">
										<option value="<s:property value="#st.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#st.getDOMTEXT()"/>
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#st.getDOMTEXT_SR()" />
											</s:elseif>
											<s:else>
												<s:property value="#st.getDOMTEXT_EN()" />
											</s:else>
										</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('lawSuitStatus.status')"/>
							</span> 
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="law.suit.label.status"/></label>
					<div class="col-md-10">
						<select class="form-control" id="lawSuitStatus.status" name="lawSuitStatus.status">
								<s:iterator value="lawsuitstatusList" var="st">
										<option value="<s:property value="#st.getDOMVALUE()" />">
											<s:if test="%{locale.language=='al'}">
												<s:property value="#st.getDOMTEXT()"/>
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="#st.getDOMTEXT_SR()" />
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
				<!-- END lawSuitStatus.status -->
				<!-- START lawSuitStatus.courtSessionDate -->
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.court.session.date"/></label>
						<div class="col-md-10">
							<input id="lawSuitStatus.courtSessionDate" name="lawSuitStatus.courtSessionDate"
								value="<s:property value='lawSuitStatus.courtSessionDate'/>"
								class="form-control" placeholder="<s:text name="law.suit.label.court.session.date"/>"
								type="text">
						</div>
				</div>
				<!-- END lawSuitStatus.courtSessionDate -->
				<!-- START lawsuit.notes -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
					<div class="col-md-10">
						<textarea id="lawSuitStatus.note" name="lawSuitStatus.note" class="form-control" placeholder="<s:text name="hum.employee.label.notes"/>"><s:property value='lawSuitStatus.note'/></textarea>
					</div>									
				</div>
				<!-- END lawsuit.notes -->
				<!-- START lawSuitStatus.attachement -->
				<s:if test="fieldErrors.get('file')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="law.suit.label.attachement"/></label>
						<div class="col-md-10">
							<input type="file" class="btn btn-default" id="file" name="file" onchange="getFileData(this);">
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('file')"/>
							</span> 
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="law.suit.label.attachement"/></label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default" id="file" name="file" onchange="getFileData(this);">
					</div>
				</div>
				</s:else>
				<!-- END lawSuitStatus.attachement -->

			</fieldset>
		
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelLawSuitStatus" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveLawSuitStatus" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- end widget -->
<script type="text/javascript">
function getFileData(myFile){
    var file = myFile.files[0];  
    var filename = file.name;
    var fileExt = filename.split('.').pop();
    $("#lawSuitStatus\\.docName").val(filename);
    $("#lawSuitStatus\\.docType").val('.'+fileExt);
    
 }
	$(document).ready(function() {

		$('#lawSuitStatus\\.status').val('<s:property value="lawSuitStatus.status.DOMVALUE"/>');

		var  lsatatus='<s:property value="lawSuitStatus.status.DOMVALUE"/>';
		var lss='<s:property value="lawSuitStatus.id"/>';
		if(lss!=''){
			$('#lawSuitStatus\\.status').prop('disabled', true);
		};


		$('#lawSuitStatus\\.lawSuit\\.id').val($('#lawSuitId').val());
	
		$('#lawSuitStatus\\.courtSessionDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		
		$("#saveLawSuitStatus").on('click', function() {

			if(lss!=''){
				$('#lawSuitStatus\\.status').prop('disabled', false);
				$('#lawSuitStatus\\.status').val(lsatatus);
				}
			
			

			$("#lawsuitstatus_form :button").prop('disabled','disabled');
			$('#lawsuitstatus_form').submit();
			return false;
		});
		$("#cancelLawSuitStatus").on('click', function() {
			$.ajax({
				type : "GET",
				url : "LawSuitStatus.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#lawsuitstatus_form_content").html(jqXHR.responseText);
				},
				complete : function(jqXHR, textStatus) {
				}
			});
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
					$("#lawsuitstatus_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#lawsuitstatus_form_content").html(jqXHR.responseText);
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
						jQuery("#lawsuitstatus_grid").trigger("reloadGrid");
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
			$("#lawsuitstatus_form :button").prop('disabled',false);			
		})();
		
	});

	
</script>