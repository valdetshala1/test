<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="annualplan_submit_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="privateRequest_submit_content">
		<form id="private_request_submit_form1" class="smart-form" action="PrivateRequestStatus.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="privateRequest.id" name="privateRequest.id" value="<s:property value='privateRequest.id'/>" type="hidden">
				<input id="privateRequest.plTechVolume" name="privateRequest.plTechVolume" value="<s:property value='privateRequest.plTechVolume'/>" type="hidden">
				<input id="privateRequest.plFireVolume" name="privateRequest.plFireVolume" value="<s:property value='privateRequest.plFireVolume'/>" type="hidden">
				
				<input id="status.id" name="status.id" value="<s:property value='status.id'/>" type="hidden">
				<input id="annualplan.id" name="annualplan.id" value="<s:property value='annualplan.id'/>" type="hidden">
					<!-- START privateRequest.alwTechVolume -->
					<div class="row"> 
			<section class="col col-6">
				<label class="input">*<s:text name="privateRequest.alwTechVolume.label"/>: <s:if
						test="fieldErrors.get('privateRequest.alwTechVolume')!=null">
						<div class="form-group has-error">
							<input id="privateRequest.alwTechVolume"
								name="privateRequest.alwTechVolume" class="form-control" 
								placeholder="<s:text name='frm.private.request.pl.tech.volume'/>" type="text" data="number"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('privateRequest.alwTechVolume')" /> </span>
						</div>
					</s:if> <s:else>
						<div class="form-group">
							<input id="privateRequest.alwTechVolume"
								name="privateRequest.alwTechVolume" class="form-control"
								value="<s:property value='privateRequest.alwTechVolume'/>"
								placeholder="<s:text name='frm.private.request.pl.tech.volume'/>" type="text" data="number">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END privateRequest.alwTechVolume-->
			<!-- START privateRequest.alwFireVolume -->
			<section class="col col-6">
				<label class="input">*<s:text name="privateRequest.alwFireVolume.label"/>: <s:if
						test="fieldErrors.get('privateRequest.alwFireVolume')!=null">
						<div class="form-group has-error">
							<input id="privateRequest.alwFireVolume"
								name="privateRequest.alwFireVolume" class="form-control"
								placeholder="<s:text name='frm.private.request.pl.fire.volume'/>" type="text" data="number"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('privateRequest.alwFireVolume')" /> </span>
						</div>
					</s:if> <s:else>
						<div class="form-group">
							<input id="privateRequest.alwFireVolume"
								name="privateRequest.alwFireVolume" class="form-control"
								value="<s:property value='privateRequest.alwFireVolume'/>"
								placeholder="<s:text name='frm.private.request.pl.fire.volume'/>" type="text" data="number">
						</div>
					</s:else>
				</label>
			</section>
			<!-- END privateRequest.alwFireVolume-->
			</div>
			<div class="row">
			<!-- START status.remarks  -->
			<section class="col col-6">
				<label class="input"><s:text name='tender.request.analyse.comment'/>: <s:if
						test="fieldErrors.get('status.remarks')!=null">
						<div class="form-group has-error">
								<textarea id="status.remarks" name="status.remarks" class="form-control" placeholder="<s:text name="annual.plan.status.remarks"/>" <s:text name='status.remarks'/>></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('status.remarks')"/></span>
						
						</div>
					</s:if> <s:else>
						<div class="form-group">
							<textarea id="status.remarks" name="status.remarks" class="form-control" placeholder="<s:text name="annual.plan.status.remarks"/>"></textarea>
						</div>
					</s:else>
				</label>
			</section>
			<!-- END status.remarks -->	
			</div>
			</fieldset>
			<footer class="form-actions">
						<button id="save_submit1" class="btn btn-primary" type="button">
							<s:text name="label.button.save"></s:text>
						</button>
						<button id="cancel" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
			</footer>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {
		$("input[data='numberLong']").autoNumeric('init', {
			aDec : '.',
			aSep : ',',
			mDec : '0'
		});
		$("input[data='number']").autoNumeric('init', {
			aDec : '.',
			aSep : ',',
			mDec : '2'
		});
		
		$("#cancel").on('click', function () {
			$("#private_request_submit_content").dialog('close');
			return false;        
		});
		$("#save_submit1").on('click', function () {
			$.SmartMessageBox({
					title : "<s:text name="annual.plan.annual.plan.status.change.title"/>",
					content : "<s:text name="annual.plan.activity.status.change.content"/>",
					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
					icon : "fa fa-bell"
					
				}, function(ButtonPressed) {
					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
						$(':button').prop('disabled','disabled');
						$('#private_request_submit_form1').submit();
					}//EOF IF ButtonPressed
				});	 
			
			return false;        
		});
		$("#private_request_submit_form1").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					var errors = jqXHR.getResponseHeader("errors_exist");
					
					if(!errors){
						jQuery("#private_request_grid").trigger("reloadGrid");
						$("#privateRequest_submit_content").html(jqXHR.responseText);
						$.smallBox({
							title : "<s:text name='annual.plan.status.changed.successfully'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : "<s:text name='annual.plan.status.not.changed'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}
					$(':button').prop('disabled',false);
				},  
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});

// 		(function() {
// 			$('form').ajaxForm({
// 				beforeSerialize: function($form, options) {         
// 				},
// 			    beforeSend: function() {
// 			    },
// 				error : function(response, status, err){
// 					$("#private_request_submit_form").html(response);
// 					alert("error:" + errorThrown + ", status:" + status);
// 				},	    
// 					success : function(data, status, jqXHR) { // on success..
// 						var errors = jqXHR.getResponseHeader("errors_exist");
						
// 						if(!errors){
// 							jQuery("#private_request_grid").trigger("reloadGrid");
// 							$("#privateRequest_submit_content").html(jqXHR.responseText);
// 							$.smallBox({
// 								title : "<s:text name='annual.plan.status.changed.successfully'/>",
// 								content : "<s:text name='small.box.content'/>",
// 								color : "#739E73",
// 								timeout: 5000,
// 								icon : "fa fa-check",
// 								number : "1"
// 							});									
// 						}else{
// 							var noActivity=jqXHR.getResponseHeader("noActivity");
// 							var msg='';
// 							if(noActivity){
// 								msg=noActivity;
// 							}else{
// 								msg="<s:text name='annual.plan.submit.activities.in'/>"+jqXHR.getResponseHeader("unsubmitedActivity");
// 							}
// 							$("#private_request_submit_content").dialog('close');	
// 							$.smallBox({
// 								title : "<s:text name='annual.plan.status.not.changed'/>"+msg,
// 								content : "<s:text name='small.box.content'/>",
// 								color : "#C79121",
// 								timeout: 5000,
// 								icon : "fa fa-shield fadeInLeft animated",
// 								number : "2"
// 							});
// 						}
						
// 					},    
// 				complete: function(xhr) {
// 				}
// 			});				
// 		})();
	});            
</script>