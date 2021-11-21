<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!-- widget div-->
<div id="order_status_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="order_status_content">
		<form id="order_status_form" class="smart-form" action="POrderStatusSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="order.id" name="order.id" value="<s:property value='order.id'/>" type="hidden">
				
						<label class="col-md-2 control-label"><s:text name="official.travel.status"/>:</label>
						<section>
							<div class="inline-group">
									<label class="radio">
								    <input type="radio" id="rej" name="status_code" value="RE">
								    <i></i><s:text name="frm.statuses.reject"/></label>
								    <label class="radio">
								    <input type="radio" id="ca" name="status_code" value="CA">
								    <i></i><s:text name="label.button.cancel"/></label>
								    <label class="radio">
								     <input type="radio" id="apr" name="status_code" value="AP">
								     <i></i><s:text name="frm.statuses.approve"/></label>
									     
							</div>
							<s:if test="fieldErrors.get('status_code')!=null">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('status_code')"/> </span>
							</s:if>
						</section>
						
				<s:if test="fieldErrors.get('textmsg')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>: </label>
					 	  <div class="col-md-10">
					      		<textarea id="textmsg" name="textmsg" class="form-control" placeholder="Comment"></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('textmsg')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="textmsg" name="textmsg" class="form-control" placeholder="Comment"><s:property value="textmsg"/></textarea>
					      </div>         
				     </div>
				</s:else>
			</fieldset>
			<footer>
				<div class="row">
					<div class="col-md-12">
						<button id="saveStatus" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<s:text name="label.button.save"></s:text>
						</button>
						<button id="cancelStatus" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
					</div>
				</div>
			</footer>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {
		
		$("#cancelStatus").on('click', function () {
			$("#order_status_content").dialog('close');
			return false;        
		});
		$("#saveStatus").on('click', function () {

			$.SmartMessageBox({
					title : "<s:text name="order.status.change"/>",
					content : "<s:text name="stand.growth.dialog.popup.content"/>",
					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
					icon : "fa fa-bell"
					
				}, function(ButtonPressed) {
					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
						$("#order_status_form :button").prop('disabled','disabled');
						$('#order_status_form').submit();
					}//EOF IF ButtonPressed
				});	 
			
			return false;        
		});

		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#order_status_form").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#order_status_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exist");
					var msg=jqXHR.getResponseHeader("message");
					if (errors_exits == "true") {
						var title="<s:text name="annu.plan.status.cannot.change"/>";
						if(msg!=null){
							title+=msg;
						}
							
						$.smallBox({
							title : title,
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					} else {
						$("#order_grid").trigger('reloadGrid');
						$("#order_status_content").dialog('close');
						$.smallBox({
							title : '<s:text name="annual.plan.status.changed.successfully"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}	
					  	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();
	});            
</script>