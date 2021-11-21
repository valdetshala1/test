<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<script type="text/javascript" src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/ajaxwidget/ui.combobox-custom.css">		
	
<!-- widget div-->
<div id="decision_status_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
<!-- enctype="multipart/form-data" -->
		<form id="decision_status_form" class="form-horizontal" action="DecisionStatusSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
				<input id="decisionId" name="decisionId" value="<s:property value='decisionId'/>" type="hidden">
				<input id="relased" name="relased" value="<s:property value='relased'/>" type="hidden">
				
				<!-- START tenderRequest.annualPlan-->
				<div id="statusDecision">
						<section>
							<div class="form-group">
								<s:if test="relased==true">
								<label class="col-md-2 control-label"><s:text name="law.suit.label.status"/>:</label>
									<div class="col-md-10">
										<label class="radio  radio-inline">
								      	<input type="radio" id="rel" name="decisionStatus" value="<s:property value='relase.getDOMVALUE()'/>" checked="checked">
								      	<i></i><s:text name="decision.type.legend.decision.relase.data"/></label>
							      	</div>
								</s:if>	
								<s:else>
								<label class="col-md-2 control-label"><s:text name="law.suit.label.status"/>:</label>
									<div class="col-md-10">
										<label class="radio  radio-inline">
									    <input type="radio" id="rej" name="decisionStatus" value="<s:property value='rejected.getDOMVALUE()'/>">
									    <i></i><s:text name="frm.statuses.reject"/></label>
									    <label class="radio  radio-inline">
									     <input type="radio" id="apr" name="decisionStatus" value="<s:property value='approved.getDOMVALUE()'/>">
									     <i></i><s:text name="frm.statuses.approve"/></label>
									</div>
								</s:else>   
									     
							</div>
							<div class="form-group has-error">
							<s:if test="fieldErrors.get('statusDecision')!=null">
								<label class="col-md-2 control-label"></label>
								<div class="col-md-10">
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('statusDecision')"/> </span>
								</div>
							</s:if>
							</div>
						</section>
						
				</div>
				<!-- END tenderRequest.annualPlan-->			
			<!-- START decision.note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
					<div class="col-md-10">
						<textarea id="status.note" name="status.note" class="form-control"><s:property value="status.note"/></textarea>
					</div>
				</div>	
			<!-- END decision.note -->
			
			<!-- START attachments -->
			<input type="hidden" id="docNamesStat" name="docNamesStat" value="<s:property value="docNamesStat"/>">
			<input type="hidden" id="docExtsStat" name="docExtsStat" value="<s:property value="docExtsStat"/>">
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/></label>
					<div class="col-md-10">
						<input id="fileStat" name="fileStat" type="file" class="btn btn-default btn-file" multiple onchange="getFileStatData(this);">
					</div>
				</div>	
			<!-- END attachments -->
				
			<footer class="form-actions">
				<button id="cancelDecStat" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
				<button id="saveDec" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
					<i class="fa fa-save"></i>
					<s:text name="label.button.save"></s:text>
				</button>
			</footer>			
		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
		
<script type="text/javascript">


		function getFileStatData(myFile){
			var names="";
			var exts="";
			for(var i=0;i<myFile.files.length;i++){
			    var file = myFile.files[i];  
			    var filename = file.name;
			    names+=";"+filename;
			    var fileExt = filename.split('.').pop();
			    exts+=";."+fileExt;
			}
			$("#docNamesStat").val(names);
			$("#docExtsStat").val(exts);
		}

	$(document).ready(function () {
		$("#cancelDecStat").on('click', function(){
			$("#decision_status_content").dialog('close');
		});
		
		Ladda.bind('#saveDec');
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#decision_status_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#decision_status_form_content").html(jqXHR.responseText);
					
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
						jQuery("#decision_grid").trigger("reloadGrid");
						var link = "Decision.form.do?decisionId="+$("#decisionId").val();
						loadURL(link, $("#decision_form_content"));
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
						$("#decision_status_content").dialog('close');
					}
					$(':button').prop('disabled',false);	    	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();

	});     
       
</script>