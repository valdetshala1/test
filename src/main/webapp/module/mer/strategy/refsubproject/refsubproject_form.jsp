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
		<form id="refsubproject_form" class="form-horizontal" action="RefSubProjectSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="refSubProject.id" name="refSubProject.id" value="<s:property value="refSubProject.id"/>" />
			
			<input type="hidden" id="refSubProject.person.id" name="refSubProject.person.id" value="<s:property value="refSubProject.person.id"/>" />
			<input type="hidden" id="refSubProject.createdDate" name="refSubProject.createdDate" value="<s:property value="refSubProject.createdDate"/>" />
			
			<input type="hidden" id="language" name="locale.language" value="<s:property value="locale.language"/>" />
			
			<fieldset>
				<legend><s:text name='mer.resp.refsubproject.data'/></legend>
				<!-- START refsubproject.merStrategy -->
					<input id="refSubProject.merStrategyByStrategyId.id" name="refSubProject.merStrategyByStrategyId.id" value="<s:property value="refSubProject.merStrategyByStrategyId.id"/>" class="form-control" type="hidden">
				<!-- END refsubproject.merStrategy -->
				
				<!-- START refSubProject.merSubProject -->
				<s:if test="fieldErrors.get('refSubProject.merSubProject')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.ref.merSubProject'/></label>
						<div class="col-md-10">
							<input id="merRefSubProject" name="merRefSubProject" class="form-control" type="text">
							<input id="refSubProject.merStrategyByRefStrategyId.id" name="refSubProject.merStrategyByRefStrategyId.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('refSubProject.merSubProject')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.ref.merSubProject'/></label>
						<div class="col-md-10">
							<input id="merRefSubProject" name="merRefSubProject" class="form-control" type="text">
							<input id="refSubProject.merStrategyByRefStrategyId.id" name="refSubProject.merStrategyByRefStrategyId.id" class="form-control" value="<s:property value='refSubProject.merStrategyByRefStrategyId.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END refSubProject.merSubProject -->
				
				<!-- START refsubproject.note -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="refSubProject.note" name="refSubProject.note" class="form-control"><s:property value="refSubProject.note"/></textarea>
						</div>									
					</div>
				<!-- END refsubproject.note -->
				
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelRefSP" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveRefSP" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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

	$("#refSubProject\\.merStrategyByStrategyId\\.id").val($("#strategyId").val());
	
		$("input[data='number']").mask("9999");

		$("#merRefSubProject").select2({
		    placeholder: "", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "MERInput.strategy.do?strategy_id="+$("#strategyId").val(),
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
		    formatResult: function(item){
			    if(item){
                	var desc =
                    '<div style="bordstrategypx solid #333333;  padding: 5px;">' +
	                    "<div><i class='fa fa-chevron-circle-right'> " + item.name +" ( "+ item.code+ " )</div>" +
                    '</div>';
                	return desc;
                }
                return "";
		    },
		    formatSelection: function(item) {
		    	$("#refSubProject\\.merStrategyByRefStrategyId\\.id").val(item.id);
		    	var val=item.name+" ( "+ item.code+" )";
		    	$("#merRefSubProject").val(val);
		        return val;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		if($("#refSubProject\\.merStrategyByRefStrategyId\\.id").val()){
			var sub_project_name="";
			var lang=$("#language").val();
			if(lang==="en"){
				sub_project_name="<s:property value='refSubProject.merStrategyByRefStrategyId.merSubProject.nameEn'/>";
			}else if(lang==="sr"){
				sub_project_name="<s:property value='refSubProject.merStrategyByRefStrategyId.merSubProject.nameSr'/>";
			}else {
				sub_project_name="<s:property value='refSubProject.merStrategyByRefStrategyId.merSubProject.name'/>";
			}
			
			$("#merRefSubProject").select2("data", {id: "<s:property value='refSubProject.merStrategyByRefStrategyId.id'/>", name: sub_project_name, code:"<s:property value='refSubProject.merStrategyByRefStrategyId.merSubProject.code'/>"});
		}

		Ladda.bind('#saveRefSP');
		$("#saveRefSP").on('click', function () {
			$("#refsubproject_form :button").prop('disabled','disabled'); 
			$('#refsubproject_form').submit();
			return false;        
		});
		
		$("#cancelRefSP").on('click', function() {
			$.ajax({
				type : "GET",
				url : "RefSubProject.form.do?",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#refsubproject_form_content").html(jqXHR.responseText);
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
					$("#refsubproject_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#refsubproject_form_content").html(jqXHR.responseText);
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
						jQuery("#refsubproject_grid").trigger("reloadGrid");
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
			$("#refsubproject_form :button").prop('disabled',false);
		})();			
});
	
</script>