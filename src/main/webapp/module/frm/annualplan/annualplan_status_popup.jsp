<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!-- widget div-->
<div id="annualplan_status_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="tender_status_contenet">
		<form id="annual_plan_form" class="smart-form" action="AnnualplanStatusSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="annualplan.id" name="annualplan.id" value="<s:property value='annualplan.id'/>" type="hidden">
				<input id="replan" name="replan" value="<s:property value='replan'/>" type="hidden">
				
				
				<!-- START tenderRequest.annualPlan-->
				<div id="statusDecision">
				<s:if test="replan==true">
					<div class="form-group has-error">
					<span class="help-block"><i class="fa fa-warning"></i><s:text name="annu.plan.only.replan"/>: <s:property value='tablesForReplan'/></span>
					</div>
					<br>
				</s:if>
						<label class="col-md-2 control-label"><s:text name="law.suit.label.status"/>:</label>
						<section>
							<div class="inline-group">
								<s:if test="replan==true">
									<label class="radio">
							      	<input type="radio" id="rep" name="decisionStatus" value="<s:property value='replanAP.getDOMVALUE()'/>">
							      	<i></i><s:text name="frm.statuses.replan"/></label>
								</s:if>	
								<s:else>
									<label class="radio">
								    <input type="radio" id="rej" name="decisionStatus" value="<s:property value='rejectAP.getDOMVALUE()'/>">
								    <i></i><s:text name="frm.statuses.reject"/></label>
								    <label class="radio">
								     <input type="radio" id="apr" name="decisionStatus" value="<s:property value='approveAP.getDOMVALUE()'/>">
								     <i></i><s:text name="frm.statuses.approve"/></label>
								</s:else>   
									     
							</div>
							<div class="has-error">
							<s:if test="fieldErrors.get('statusDecision')!=null">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('statusDecision')"/> </span>
							</s:if>
							</div>
						</section>
						
				</div>
				<!-- END tenderRequest.annualPlan-->
				<!-- START status.remarks  -->
				<s:if test="fieldErrors.get('status.remarks')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>: </label>
					 	  <div class="col-md-10">
					      		<textarea id="status.remarks" name="status.remarks" class="form-control" placeholder="<s:text name='tender.request.analyse.comment'/>"></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('status.remarks')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="status.remarks" name="status.remarks" class="form-control" placeholder="<s:text name='tender.request.analyse.comment'/>"><s:property value="status.remarks"/></textarea>
					      </div>         
				     </div>
				</s:else>
				<!-- END status.remarks -->	
			</fieldset>
			<footer>
				<div class="row">
					<div class="col-md-12">
						<button id="save" class="btn btn-primary" type="button">
							<s:text name="label.button.save"></s:text>
						</button>
						<button id="cancel" class="btn btn-default" type="button">
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
		
		$("#cancel").on('click', function () {
			$("#annual_plan_status_content").dialog('close');
			return false;        
		});
		$("#save").on('click', function () {

			$.SmartMessageBox({
					title : "<s:text name="annual.plan.annual.plan.status.change.title"/>",
					content : "<s:text name="annual.plan.activity.status.change.content"/>",
					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
					icon : "fa fa-bell"
					
				}, function(ButtonPressed) {
					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
						$(':button').prop('disabled','disabled');
						$('#annual_plan_form').submit();
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
					$("#annual_plan_form").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	
					$("#annualplan_status_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exist");
					var unControledActivity=jqXHR.getResponseHeader("unControledActivity");
					if (errors_exits == "true") {
						var title="<s:text name="annu.plan.status.cannot.change"/>"+". ";
						if(unControledActivity!=null){
							title+="<s:text name="annu.plan.check.activity.status"/>"+unControledActivity+"!";
							$("#annual_plan_status_content").dialog('close');
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
						$("#annualplan_grid").trigger('reloadGrid');
						$("#annual_plan_status_content").dialog('close');
						var link = "Annualplan.board.do?annualplanId="+'<s:property value="annualplan.id"/>' ;
						loadURL(link, $("#annualplan_content"));
						$.smallBox({
							title : '<s:text name="annual.plan.status.changed.successfully"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}	
					$(':button').prop('disabled',false); 	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();
	});            
</script>