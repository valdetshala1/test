<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="dossierquestion_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="dossier_question_form" class="form-horizontal" action="DossierQuestionSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="dossierQuestion.id" name="dossierQuestion.id" value="<s:property value='dossierQuestion.id'/>" type="hidden">
				<input id="dossierQuestion.prcmtDossierRequest.id" name="dossierQuestion.prcmtDossierRequest.id" value="<s:property value='dossierQuestion.prcmtDossierRequest.id'/>" type="hidden">
				
				<!-- START dossierQuestion.prcmtTenderBidder.id  -->
				<s:if test="fieldErrors.get('dossierQuestion.question')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='ads.procurement.dossierquestion'/>
					      :</label>
					 	  <div class="col-md-10">
					 	  		<textarea id="dossierQuestion.question" name="dossierQuestion.question" class="form-control" placeHolder="Enter the question!"></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dossierQuestion.question')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name='ads.procurement.dossierquestion'/>:</label>
					 	  <div class="col-md-10">
					 	  	<textarea id="dossierQuestion.question" name="dossierQuestion.question" class="form-control" placeHolder="Enter the question!"><s:property value="dossierQuestion.question"/></textarea>
					      </div>         
				     </div>
				</s:else>
				<!-- END dossierQuestion.prcmtTenderBidder.id   -->
				
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
							<button id="cancelQuestion" class="btn btn-default" type="button">
								<s:text name="label.button.cancel"></s:text>
							</button>
							<button id="saveQuestion"  class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		$("#cancelQuestion").on('click', function () {      
			$("#dossierquestion_form_content").dialog('close');
			return false;        
		});

		Ladda.bind('#saveQuestion');			
		$("#saveQuestion").on('click', function () {
			$("#dossier_question_form :button").prop('disabled','disabled');
			$("#dossier_question_form").submit();
			return false;        
		});

		if($("#hidePopupButtons").val()=='true'){
			$("#saveQuestion").hide();
			$("#saveQuestion").attr('disabled','disabled');
		}
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#dossierquestion_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
$("#dossierquestion_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						$("#dossierquestion_form_content").dialog('close');
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>", 
							content : "<s:text name='small.box.content'/>", 
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>", 
							content : "<s:text name='small.box.content'/>", 
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
			$("#dossier_question_form :button").prop('disabled',false);				
		})();
		$("#dossierQuestion\\.prcmtDossierRequest\\.id").val($("#dossierId").val());	    	
	});            
</script>