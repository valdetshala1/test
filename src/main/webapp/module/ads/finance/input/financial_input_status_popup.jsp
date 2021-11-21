<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<link rel="stylesheet" type="text/css" media="all" href="css/fileinput.min.css" />
<script type="text/javascript" src="js/bootstrap/fileinput.min.js"></script>

<div id="fininput_status_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->
<jsp:include page="../../../base/validation.jsp"></jsp:include>
	<!-- widget content -->
	<div class="widget-body" id="tender_status_contenet">
		<form id="fininput_status" class="form-horizontal" action="FinInputStatusSave.do" accept-charset="utf8" method="post">
			<fieldset>
			<legend><s:text name="law.suit.label.status"/></legend>
				<input id="finInput.id" name="finInput.id" value="<s:property value='finInput.id'/>" type="hidden">
				<input id="regStatus" name="regStatus" value="<s:property value='regStatus'/>" type="hidden">
				
				<div id="statusDecision">
<%-- 						<label class="col-md-2 control-label"><s:text name="law.suit.label.status"/>:</label> --%>
						<s:if test="fieldErrors.get('status.status')!=null">
							<div class="form-group has-error">
							      <div class="col-md-10">
							      <s:if test="regStatus==true">
								      <label class="col-md-4 control-label">
											<input type="radio" class="radiobox" id="apr" name="status.status" value="REGIONALVALIDATED">
											<span><s:text name="frm.statuses.approve"/></span>
									  </label>
							      </s:if>
							      <s:else>
								      <label class="col-md-4 control-label">
											<input type="radio" class="radiobox" id="apr" name="status.status" value="CENTRALAPPROVAL">
											<span><s:text name="frm.statuses.approve"/></span>
									  </label>
							      </s:else>
									<label class="col-md-4 control-label">
										<input type="radio" class="radiobox" id="rej" name="status.status" value="REJECTED">
										<span><s:text name="frm.statuses.reject"/></span>
									</label>
								</div>
						     </div>
<%-- 						     <span class="help-block form-group has-error"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('status.status')"/> </span> --%>
						</s:if>
						<s:else>
							<div class="form-group">
								 <div class="col-md-10">
							      <s:if test="regStatus==true">
								      <label class="col-md-4 control-label">
											<input type="radio" class="radiobox" id="apr" name="status.status" value="REGIONALVALIDATED">
											<span><s:text name="frm.statuses.approve"/></span>
									  </label>
							      </s:if>
							      <s:else>
								      <label class="col-md-4 control-label">
											<input type="radio" class="radiobox" id="apr" name="status.status" value="CENTRALAPPROVAL">
											<span><s:text name="frm.statuses.approve"/></span>
									  </label>
							      </s:else>
									<label class="col-md-4 control-label">
										<input type="radio" class="radiobox" id="rej" name="status.status" value="REJECTED">
										<span><s:text name="frm.statuses.reject"/></span>
									</label>
								</div>
							</div>
						</s:else>
				</div>
				<!--  START doc.file -->
				<div class="form-group">
					  <label class="control-label col-sm-2"><s:text name="dp.doc.attachments"/></label>
					  <div class="col-md-10">
						<input id="file" name="file" class="form-control" type="file" >			  
					  </div>
			  	</div>
				<!-- END doc.file -->
				<!-- START status.note  -->
				<s:if test="fieldErrors.get('status.note')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='hum.employee.label.comment'/>: </label>
					 	  <div class="col-md-10">
					      		<textarea id="status.note" name="status.note" class="form-control"></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('status.note')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name='hum.employee.label.comment'/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="status.note" name="status.note" class="form-control"><s:property value="status.note"/></textarea>
					      </div>         
				     </div>
				</s:else>
				<!-- END status.note -->	
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancel" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="save" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>
<!-- 			<footer> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<button id="save" class="btn btn-primary" type="button"> -->
<%-- 							<s:text name="label.button.save"></s:text> --%>
<!-- 						</button> -->
<!-- 						<button id="cancel" class="btn btn-default" type="button"> -->
<%-- 							<s:text name="label.button.cancel"></s:text> --%>
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</footer> -->
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {
		$("#cancel").on('click', function () {
			$("#fininput_status_form_content").dialog('close');
			return false;        
		});
		$("#save").on('click', function () {
			$(':button').prop('disabled','disabled');
			$('#fininput_status').submit();			
			return false;        
		});

		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#fininput_status_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#fininput_status_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
					if (errors_exits == "true") {
						$.smallBox({
							title : '<s:text name="annual.plan.status.not.changed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					} else {
						$("#financial_input_grid").trigger('reloadGrid');
						$("#fininput_status_form_content").dialog('close');
						var link = "FinInput.form.do?" ;
						loadURL(link, $("#annual_plan_form_content"));
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