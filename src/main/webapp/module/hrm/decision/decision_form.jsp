<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<style type="text/css">
.tokenize-sample{ width:100% !important; }
</style>
<!-- widget div-->
<div id="decision_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
<!-- enctype="multipart/form-data" -->
		<form id="decision_form" class="form-horizontal" action="DecisionSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input id="decision.id" name="decision.id" value="<s:property value='decision.id'/>" type="hidden">
			<input id="decision.decisionStatus.status" name="decision.decisionStatus.status" value="<s:property value='decision.decisionStatus.status.getDOMVALUE()'/>" type="hidden">
			<input id="decision.decisionStatus.id" name="decision.decisionStatus.id" value="<s:property value='decision.decisionStatus.id'/>" type="hidden">
			<input id="stat" name="stat" value="<s:property value='decision.decisionStatus.status.DOMKEY'/>" type="hidden">
			<!-- START decision.decisionType.id -->
				<s:if test="fieldErrors.get('decision.decisionType.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hrm.decision.decisiontype"/></label>
						<div class="col-md-10">
							<input id="decision.decisionType.nameAl" name="decision.decisionType.nameAl" class="form-control" placeholder="<s:text name="hum.employee.label.organisation"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:text name="hrm.decision.decisiontype"/> </span>
							<input id="decision.decisionType.id" name="decision.decisionType.id" value="<s:property value='decision.decisionType.id'/>" type="hidden">
						</div>
					</div>														
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hrm.decision.decisiontype"/></label>
						<div class="col-md-10">
						<input id="decision.decisionType.nameAl" name="decision.decisionType.nameAl" value="<s:property value='decision.decisionType.nameAl'/>" class="form-control" placeholder="<s:text name="hrm.decision.decisiontype"/>" type="text">
						<input id="decision.decisionType.id" name="decision.decisionType.id" value="<s:property value='decision.decisionType.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END decision.decisionType.id -->	
			
			<!-- START decision.dateOfRequest -->
				<s:if test="fieldErrors.get('decision.dateOfRequest')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hrm.official.travel.grid.req.date"/></label>
						<div class="col-md-10">
							<input id="decision.dateOfRequest" name="decision.dateOfRequest"
								class="form-control" 
								type="text">
								<span class="help-block"><i
								class="fa fa-warning"></i> <s:property value="fieldErrors.get('decision.dateOfRequest')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hrm.official.travel.grid.req.date"/></label>
						<div class="col-md-10">
							<input id="decision.dateOfRequest" name="decision.dateOfRequest" value="<s:property value='decision.dateOfRequest'/>" class="form-control" type="text">
						</div>
					</div>
				</s:else>
			<!-- END decision.dateOfRequest -->
			<!-- START decision.employee-->
			   <div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hrm.decision.employee"/></label>
					<div class="col-md-10">
						<select class="tokenize-sample" id="employeeIdList" name="employeeIdList" multiple="multiple" >
								<s:iterator value="decision.decisionEmployees" var="rb">
										<option value="<s:property value="employee.id"/>" selected="selected"><s:property value="employee.firstName"/> <s:property value="employee.lastName"/></option>
								</s:iterator>						
						</select>
					</div>
				</div>	
			<!-- END decision.employee -->
			<!-- START decision.note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="adm.person.label.address.notes"/></label>
					<div class="col-md-10">
						<textarea id="decision.note" name="decision.note" class="form-control"><s:property value="decision.note"/></textarea>
					</div>
				</div>	
			<!-- END decision.note -->
			
			<!-- START attachments -->
			<input type="hidden" id="docNames" name="docNames" value="<s:property value="docNames"/>">
			<input type="hidden" id="docExts" name="docExts" value="<s:property value="docExts"/>">
			<div class="form-group">
				<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/></label>
				<div class="col-md-10">
					<input id="file" name="file" type="file" class="btn btn-default btn-file" multiple onchange="getFileDatas(this);">
				</div>
			</div>	
			<!-- END attachments -->
				
			<footer class="form-actions">
				<button id="cancelDec" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
				<button id="saveDec" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
					<i class="fa fa-save"></i>
					<s:text name="label.button.save"></s:text>
				</button>
			</footer>			
		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
		
<script type="text/javascript">
 function getFileDatas(myFile){
	// 	alert(myFile.files.length);
		var names="";
		var exts="";
		for(var i=0;i<myFile.files.length;i++){
		    var file = myFile.files[i];  
		    var filename = file.name;
		    names+=";"+filename;
		    var fileExt = filename.split('.').pop();
		    exts+=";"+fileExt;
		}
		$("#docNames").val(names);
		$("#docExts").val(exts);
	}

	$(document).ready(function () {
		$('#decision\\.dateOfRequest').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			timepicker: false
		});
		$('#employeeIdList').tokenize({
		    datas: "Input.employee.do",
		    searchParam: 'name_startsWith',
		    newElements: true,
		    valueField: 'id',
		    textField: 'name',
		    dataType: 'json',
		    onAddToken: function(value, text){
			}
		});
		
		if($("#stat").val()=='REL' || $("#stat").val()=='REJ'){
				$("#decision_form :input").prop('disabled','disabled');
				$("#cancelDec").prop('disabled',false);
				$("#decision_form :file").prop('disabled','disabled');
			}
		
		$("#cancelDec").on('click', function(){
			$.ajax({
				type : "GET",
				url : "Decision.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#decision_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});
		});
		
		Ladda.bind('#saveDec');
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#decision_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#decision_form_content").html(jqXHR.responseText);
					
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
						jQuery("#decision_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
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

// 		$('#decision\\.dateOfRequest').datetimepicker({
// 		    			lang: 'al',
// 		    			format: 'd.m.Y',
// 		    			mask: false,
// 		    			formatDate:'d.m.Y',
// 		    			timepicker: false,
// 		    		});
 		
		$("#decision\\.decisionType\\.nameAl").select2({
		    placeholder: "", 
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.decisionTypes.do",
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
		    	$("#decision\\.decisionType\\.id").val(item.id);
		    	$("#decision\\.decisionType\\.nameAl").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		if($("#decision\\.decisionType\\.id").val()){
				var name=$("#decision\\.decisionType\\.nameAl").val();
				$("#decision\\.decisionType\\.nameAl").select2("data", {id: "<s:property value='decision.decisionType.id'/>", name: name});
		}
		

	});     
       
</script>