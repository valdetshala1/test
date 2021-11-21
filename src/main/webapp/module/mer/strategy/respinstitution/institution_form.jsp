<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
		<form id="institution_form" class="form-horizontal" action="RespInstitutionSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="institution.id" name="institution.id" value="<s:property value="institution.id"/>" />
			
			<input type="hidden" id="institution.person.id" name="institution.person.id" value="<s:property value="institution.person.id"/>" />
			<input type="hidden" id="institution.createdDate" name="institution.createdDate" value="<s:property value="institution.createdDate"/>" />
			
			<input type="hidden" id="language" name="locale.language" value="<s:property value="locale.language"/>" />
			
			<fieldset>
				<legend><s:text name='mer.resp.institution.data'/></legend>
				<!-- START institution.merStrategy -->
					<input id="institution.merStrategy.id" name="institution.merStrategy.id" value="<s:property value="institution.merStrategy.id"/>" class="form-control" type="hidden">
				<!-- END institution.merStrategy -->
				
				<!-- START institution.organisation -->
				<s:if test="fieldErrors.get('institution.organisation')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='hum.employee.label.organisation'/></label>
						<div class="col-md-10">
							<input id="institution.organisation.orgaName" name="institution.organisation.orgaName" class="form-control" type="text">
							<input id="institution.organisation.id" name="institution.organisation.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('institution.organisation')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='hum.employee.label.organisation'/></label>
						<div class="col-md-10">
							<input id="institution.organisation.orgaName" name="institution.organisation.orgaName" value="<s:property value="institution.organisation.orgaName"/>" class="form-control" type="text">
							<input id="institution.organisation.id" name="institution.organisation.id" class="form-control" value="<s:property value='institution.organisation.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END institution.organisation -->
				<!-- START institution.note -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="institution.note" name="institution.note" class="form-control"><s:property value="institution.note"/></textarea>
						</div>									
					</div>
				<!-- END institution.note -->
				
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelIns" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveIns" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>
		</fieldset>
		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
<script type="text/javascript">
$(document).ready(function () {

	$("#institution\\.merStrategy\\.id").val($("#strategyId").val());
	
		$("input[data='number']").mask("9999");

		$("#institution\\.organisation\\.orgaName").select2({
		    placeholder: "", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.organisation.do",
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
		    	$("#institution\\.organisation\\.id").val(item.id);
		    	$("#institution\\.organisation\\.orgaName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#institution\\.organisation\\.orgaName").select2("data", {id: "<s:property value='institution.organisation.id'/>", name: "<s:property value='institution.organisation.orgaName'/>"});

		Ladda.bind('#saveIns');
		$("#saveIns").on('click', function () {
			$("#institution_form :button").prop('disabled','disabled'); 
			$('#institution_form').submit();
			return false;        
		});
		
		$("#cancelIns").on('click', function() {
			$.ajax({
				type : "GET",
				url : "RespInstitution.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#institution_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						//timeout: 6000,
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
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
					$("#institution_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#institution_form_content").html(jqXHR.responseText);
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
						jQuery("#institution_grid").trigger("reloadGrid");
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
			$("#institution_form :button").prop('disabled',false);
		})();			
});
	
</script>