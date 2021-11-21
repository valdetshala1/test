<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div>


	<!-- widget content -->
	<div class="widget-body">
		<jsp:include page="../../base/validation.jsp"></jsp:include>
		<form id="compartment_form" class="form-horizontal"
			action="CompartmentSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="compartment.id" name="compartment.id" value="<s:property value='compartment.id'/>" type="hidden">
				<input id="compartment.managementUnitPeriod.id" name="compartment.managementUnitPeriod.id" value="<s:property value='compartment.managementUnitPeriod.id'/>" type="hidden">
				<input id="compartment.managementUnit.id" name="compartment.managementUnit.id" value="<s:property value='compartment.managementUnit.id'/>" type="hidden">
				
				<!-- START compartment.cadastralMunicipality -->
				<s:if test="fieldErrors.get('compartment.cadastralMunicipality')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='annual.plan.municipality'/>:</label>
							<div class="col-md-10">
								<input id="compartment.cadastralMunicipality.name" name="compartment.cadastralMunicipality.name" class="form-control" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('compartment.cadastralMunicipality')"/> </span>
								<input id="compartment.cadastralMunicipality.id" name="compartment.cadastralMunicipality.id" value="<s:property value='compartment.cadastralMunicipality.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='annual.plan.municipality'/>:</label>
							<div class="col-md-10">
								<input id="compartment.cadastralMunicipality.name" name="compartment.cadastralMunicipality.name" class="form-control" value="<s:property value='compartment.cadastralMunicipality.name'/>" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
								<input id="compartment.cadastralMunicipality.id" name="compartment.cadastralMunicipality.id" value="<s:property value='compartment.cadastralMunicipality.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				<!-- END compartment.cadastralMunicipality -->
				
				<!-- START compartment.compNr -->
				<s:if test="fieldErrors.get('compartment.compNr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="frm.compartment.comp.id"/>:</label>
						<div class="col-md-10">
							<input  id="compartment.compNr" name="compartment.compNr" class="form-control" placeholder="<s:text name="frm.compartment.comp.id"/>" type="text"> 
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('compartment.compNr')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="frm.compartment.comp.id"/>:</label>
						<div class="col-md-10">
							<input  id="compartment.compNr" name="compartment.compNr" value="<s:property value='compartment.compNr'/>" class="form-control" placeholder="<s:text name="frm.compartment.comp.id"/>" type="text">
						</div>
					</div>
				</s:else>
				<!-- END compartment.compNr -->

				
				<!-- START compartment.remarks -->
				<s:if test="fieldErrors.get('compartment.remarks')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='annual.plan.remarks'/>:</label>
						<div class="col-md-10">
							<textarea id="compartment.remarks" name="compartment.remarks" class="form-control" placeholder="<s:text name='annual.plan.remarks'/>"><s:property value='compartment.remarks'/></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('compartment.remarks')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='annual.plan.remarks'/>:</label>
						<div class="col-md-10">
							<textarea id="compartment.remarks" name="compartment.remarks" class="form-control" placeholder="<s:text name='annual.plan.remarks'/>"><s:property value='compartment.remarks'/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END compartment.remarks -->
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelComp" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<s:if test="user.getOrganisation().getOperLevelVal()=='C' || user.getOrganisation().getOperLevelVal()=='R'">
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
		$("#compartment\\.compNr").attr('maxlength','3');
		 $("#compartment\\.cadastralMunicipality\\.name").select2({
		        placeholder: "Search for a repository",
		        minimumInputLength: 0,
		        ajax: {
			        url: "Input.municipality.do?region_id="+$("#region_id").val(),
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
		        	$("#compartment\\.cadastralMunicipality\\.id").val(item.id);
		        	$("#compartment\\.cadastralMunicipality\\.name").val(item.name);
		            return item.name;
		        },
		        allowClear: true,
		        dropdownCssClass: "bigdrop",
		        escapeMarkup: function (m) { return m; }
		    }); 

		    $("#compartment\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='compartment.cadastralMunicipality.id'/>", name: "<s:property value='compartment.cadastralMunicipality.name'/>"});
			
		$("#cancelComp").on('click', function() {
			$("#compartment_form_content").dialog("close");
			return false;
		});

		$("#saveComp").on('click', function() {
			$('#compartment_form').submit();
			return false;
		});
		$("#compartment_form").submit(function() {
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
					$("#compartment_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#compartment_grid").trigger("reloadGrid");
						$("#compartment_form_content").dialog("close");
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
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});

	});

	
</script>