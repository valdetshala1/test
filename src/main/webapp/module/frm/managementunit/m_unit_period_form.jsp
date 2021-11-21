<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
<%-- 		<jsp:include page="../../base/validation.jsp"></jsp:include> --%>
		<form id="mUnitPeriod_form" class="form-horizontal"
			action="MUnitPeriodSave.do" accept-charset="utf8" method="post">
		
			<fieldset>
				
				<input id="managementUnitPeriod.id" name="managementUnitPeriod.id" value="<s:property value='managementUnitPeriod.id'/>" type="hidden">
				<input id="managementUnitPeriod.managementUnit.id" name="managementUnitPeriod.managementUnit.id" value="<s:property value='managementUnitPeriod.managementUnit.id'/>" type="hidden">
			
				<!-- START managementUnitPeriod.startDate -->
					<s:if test="fieldErrors.get('managementUnitPeriod.startDate')!=null">
						<div class="has-error">
							<label class="control-label col-sm-2"><s:text name="fin.contactor.from"/></label>
					          <div class="col-md-10">
								<div class="input-group form-group date">
									<input type='text' id="managementUnitPeriod.startDate" name="managementUnitPeriod.startDate" value="<s:property value='managementUnitPeriod.startDate'/>" class="form-control" placeholder="Date to" type="text"/>
		                    		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnitPeriod.startDate')"/> </span>					
							</div>
						</div>
					</s:if>
					<s:else>
			          <label class="control-label col-sm-2">*<s:text name="fin.contactor.from"/></label>
			          <div class="col-md-10">
						<div class="input-group  form-group date">
	                    	<input type='text' id="managementUnitPeriod.startDate" name="managementUnitPeriod.startDate" value="<s:property value='managementUnitPeriod.startDate'/>" class="form-control" placeholder="Date to" type="text"/>
	                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                	</div>
			          </div>
			          </s:else>
			    <!-- END managementUnitPeriod.startDate -->
			          
				<!-- START managementUnitPeriod.endDate -->
					<s:if test="fieldErrors.get('managementUnitPeriod.endDate')!=null">
						<div class="has-error">
							<label class="control-label col-sm-2"><s:text name="fin.contactor.to"/></label>
					          <div class="col-md-10">
								<div class="input-group form-group date">
									<input type='text' id="managementUnitPeriod.endDate" name="managementUnitPeriod.endDate" value="<s:property value='managementUnitPeriod.endDate'/>" class="form-control" placeholder="Date to" type="text"/>
		                    		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
								</div>
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnitPeriod.endDate')"/> </span>					
							</div>
						</div>
					</s:if>
					<s:else>
			          <label class="control-label col-sm-2">*<s:text name="fin.contactor.to"/></label>
			          <div class="col-md-10">
						<div class="input-group form-group date">
	                    	<input type='text' id="managementUnitPeriod.endDate" name="managementUnitPeriod.endDate" value="<s:property value='managementUnitPeriod.endDate'/>"  class="form-control" placeholder="Date to" type="text"/>
	                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                	</div>
			          </div>
			          </s:else>
			          <!-- END managementUnitPeriod.endDate -->
				
				<!-- START managementUnitPeriod.note -->
				<s:if test="fieldErrors.get('managementUnitPeriod.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='annual.plan.remarks'/>:</label>
						<div class="col-md-10">
							<textarea id="managementUnitPeriod.note" name="managementUnitPeriod.note" class="form-control" placeholder="<s:text name='annual.plan.remarks'/>"><s:property value='managementUnitPeriod.note'/></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnitPeriod.note')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='annual.plan.remarks'/>:</label>
						<div class="col-md-10">
							<textarea id="managementUnitPeriod.note" name="managementUnitPeriod.note" class="form-control" placeholder="<s:text name='annual.plan.remarks'/>"><s:property value='managementUnitPeriod.note'/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END managementUnitPeriod.note -->
				
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelMup" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
<%-- 						<s:if test="user.getOrganisation().getOperLevelVal()=='C'"> --%>
						<button id="saveMup" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
<%-- 						</s:if> --%>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function() {
		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
		
		$('#managementUnitPeriod\\.startDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			onShow:function( ct ){
			},		
			timepicker: false,
	    			
		});

		$('#managementUnitPeriod\\.endDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			onShow:function( ct ){
			},		
			timepicker: false,
	    			
		});
					
		$("#cancelMup").on('click', function() {
			$("#mup_form_content").dialog("close");
			return false;
		});

		$("#saveMup").on('click', function() {
			$('#mUnitPeriod_form').submit();
			return false;
		});
		$("#mUnitPeriod_form").submit(function() {
			var this_form = $(this);

			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#mup_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
						$("#mup_form_content").dialog("close");
						jQuery("#managementunit_grid").trigger("reloadGrid");
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
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});

	});

	
</script>