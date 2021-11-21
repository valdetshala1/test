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
		<form id="managementUnit_form" class="form-horizontal"
			action="ManagementUnitSave.do" accept-charset="utf8" method="post">
		
			<fieldset>
				<legend><s:text name="frm.menagementunit.data"/></legend>
				
				<input id="managementUnit.id" name="managementUnit.id" value="<s:property value='managementUnit.id'/>" type="hidden">
<%-- 				<input id="managementUnit.managementUnitPeriod.id" name="managementUnit.managementUnitPeriod.id" value="<s:property value='managementUnit.managementUnitPeriod.id'/>" type="hidden"> --%>
			
				<!-- START managementUnit.muName -->
				<s:if test="fieldErrors.get('managementUnit.muName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/>:</label>
						<div class="col-md-10">
							<input id="managementUnit.muName" name="managementUnit.muName" class="form-control" placeholder="<s:text name="frm.menagementunit.name.label"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnit.id')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="label.person.firstname"/>:</label>
						<div class="col-md-10">
							<input id="managementUnit.muName" name="managementUnit.muName" value="<s:property value='managementUnit.muName'/>" class="form-control" placeholder="<s:text name="frm.menagementunit.name.label"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END managementUnit.muName -->
				
				<!-- START managementUnit.region -->
				<s:if test="fieldErrors.get('managementUnit.region.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='frm.compartment.region.name'/>:</label>
							<div class="col-md-10">
								<input id="managementUnit.region.name" name="managementUnit.region.name" class="form-control" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnit.region')"/> </span>
								<input id="managementUnit.region.id" name="managementUnit.region.id" value="<s:property value='managementUnit.region.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='frm.compartment.region.name'/>:</label>
							<div class="col-md-10">
								<input id="managementUnit.region.name" name="managementUnit.region.name" class="form-control" value="<s:property value='managementUnit.region.name'/>" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
								<input id="managementUnit.region.id" name="managementUnit.region.id" value="<s:property value='managementUnit.region.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				<!-- END managementUnit.region -->
				
				<!-- START managementUnit.muCode -->
				<s:if test="fieldErrors.get('managementUnit.muCode')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="requisition.unit.of.issue.code"/>:</label>
						<div class="col-md-10">
							<input id="managementUnit.muCode" name="managementUnit.muCode" class="form-control" placeholder="<s:text name="requisition.unit.of.issue.code"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnit.muCode')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="requisition.unit.of.issue.code"/>:</label>
						<div class="col-md-10">
							<input id="managementUnit.muCode" name="managementUnit.muCode" value="<s:property value='managementUnit.muCode'/>" class="form-control" placeholder="<s:text name="requisition.unit.of.issue.code"/>" type="text"/>
						</div>									
					</div>
				</s:else>
				<!-- END managementUnit.muName -->
				
				<!-- START managementUnit.remarks -->
				<s:if test="fieldErrors.get('managementUnit.remarks')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='annual.plan.remarks'/>:</label>
						<div class="col-md-10">
							<textarea id="managementUnit.remarks" name="managementUnit.remarks" class="form-control" placeholder="<s:text name='annual.plan.remarks'/>"><s:property value='managementUnit.remarks'/></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnit.remarks')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='annual.plan.remarks'/>:</label>
						<div class="col-md-10">
							<textarea id="managementUnit.remarks" name="managementUnit.remarks" class="form-control" placeholder="<s:text name='annual.plan.remarks'/>"><s:property value='managementUnit.remarks'/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END managementUnit.remarks -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelComp" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<s:if test="user.getOrganisation().getOperLevelVal()=='C'">
							<button id="saveComp" class="btn btn-primary" type="submit">
								<i class="fa fa-save"></i>
								<s:text name="label.button.save"></s:text>
							</button>
						</s:if>
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
		$("#managementUnit\\.muCode").attr('maxlength','3');
		 $("#managementUnit\\.region\\.name").select2({
		        placeholder: "Search for a repository",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.region.do",
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
		        	$("#managementUnit\\.region\\.id").val(item.id);
		        	$("#managementUnit\\.region\\.name").val(item.name);
		            return item.name;
		        },
		        allowClear: true,
		        dropdownCssClass: "bigdrop",
		        escapeMarkup: function (m) { return m; }
		    }); 

		    $("#managementUnit\\.region\\.name").select2("data", {id: "<s:property value='managementUnit.region.id'/>", name: "<s:property value='managementUnit.region.name'/>"});
			
		$("#cancelComp").on('click', function() {
			$("#management_form_content").dialog("close");
			return false;
		});

		$("#saveComp").on('click', function() {
			$('#managementUnit_form').submit();
			return false;
		});
		$("#managementUnit_form").submit(function() {
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
					$("#management_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#managementunit_grid").trigger("reloadGrid");
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
						$("#management_form_content").dialog("close");								
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