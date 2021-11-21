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
		<form id="planperiod_form" class="form-horizontal" action="DhpetPlanPeriodSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="period.id" name="period.id" value="<s:property value="period.id"/>" />
			<input type="hidden" id="period.employee.id" name="period.employee.id" value="<s:property value="period.employee.id"/>" />
			<input type="hidden" id="period.createdDate" name="period.createdDate" value="<s:property value="period.createdDate"/>" />
			<fieldset>
				<legend><s:text name='mer.planperiod.data'/></legend>
				
				<!-- START period.dhpetLocation.habitatLocation -->
				<s:if test="fieldErrors.get('period.location')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dhpet.location.label.habitat.location'/>
						</label>
						<div class="col-md-10">
							<input id="period.dhpetLocation.habitatLocation" name="period.dhpetLocation.habitatLocation" class="form-control" placeholder="<s:text name='dhpet.location.label.habitat.location'/>" type="text">
							<input id="period.dhpetLocation.id" name="period.dhpetLocation.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('period.location')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dhpet.location.label.habitat.location'/></label>
						<div class="col-md-10">
							<input id="period.dhpetLocation.habitatLocation" name="period.dhpetLocation.habitatLocation" value="<s:property value='period.dhpetLocation.habitatLocation'/>" class="form-control" placeholder="<s:text name='dhpet.location.label.habitat.location'/>" type="text">
							<input id="period.dhpetLocation.id" name="period.dhpetLocation.id" value="<s:property value='period.dhpetLocation.id'/>"class="form-control" type="hidden" >
						</div>									
					</div>
				</s:else>
				<!-- END period.dhpetLocation.habitatLocation -->
				
				<div class="form-group ">
					<!-- START period.startYear -->
					<s:if test="fieldErrors.get('period.startYear')!=null">
						<div class="has-error">
							<label class="col-sm-2 control-label">*<s:text name='mer.planperiod.start.year'/></label>
							<div class="col-md-4">
								<input data="number" id="period.startYear" name="period.startYear" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('period.startYear')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<label class="col-sm-2 control-label">*<s:text name='mer.planperiod.start.year'/></label>
						<div class="col-md-4">
							<input data="number" id="period.startYear" name="period.startYear" value="<s:property value='period.startYear'/>" class="form-control" type="text">
						</div>									
					</s:else>
					<!-- END period.startYear -->
					<!-- START period.endYear -->
					<s:if test="fieldErrors.get('period.endYear')!=null">
						<div class=" has-error">
							<label class="col-sm-2 control-label">*<s:text name='mer.planperiod.endYear'/></label>
							<div class="col-md-4">
								<input data="number" id="period.endYear" name="period.endYear" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('period.endYear')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<label class="col-sm-2 control-label">*<s:text name='mer.planperiod.endYear'/></label>
						<div class="col-md-4">
							<input data="number" id="period.endYear" name="period.endYear" value="<s:property value='period.endYear'/>" class="form-control" type="text">
						</div>									
					</s:else>
					<!-- END period.endYear -->
				</div>
				
				<!-- START attachment -->
				<s:if test="fieldErrors.get('attachment')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label">*<s:text name="tender.request.attachment"/>:</label>
					 	  <div class="col-md-10">
					      	<input class="form-control input-xs-g" id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">
					       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('attachment')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/>:</label>
						<div class="col-md-10">
							<input class="form-control input-xs-g" id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileData(this);">							
						</div>
					</div>
				</s:else>
				<input id="period.docName" name="period.docName" type="hidden" value="<s:property value='period.docName'/>">
				<input id="period.docType" name="period.docType" type="hidden" value="<s:property value='period.docType'/>">
				<!-- END attachment -->
				
				<!-- START period.note -->
				<s:if test="fieldErrors.get('period.remark')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="period.remark" name="period.remark" class="form-control"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('period.remark')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='hum.employee.label.notes'/></label>
						<div class="col-md-10">
							<textarea id="period.remark" name="period.remark" class="form-control" ><s:property value="period.remark"/></textarea>
						</div>									
					</div>
				</s:else>
				
		<!-- END period.note -->
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelPLP" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="savePLP" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
function getFileData(myFile){
   var file = myFile.files[0];  
   var filename = file.name;
   var fileExt = filename.split('.').pop();
   $("#period\\.docName").val(filename);
   $("#period\\.docType").val('.'+fileExt);
}
$(document).ready(function () {
		$("input[data='number']").mask("9999");

		Ladda.bind('#savePLP');
		$("#savePLP").on('click', function () {    
			$("#planperiod_form :button").prop('disabled','disabled');           
			$('#planperiod_form').submit();
			return false;        
		});

		$("#period\\.dhpetLocation\\.habitatLocation").select2({
		    placeholder: "",
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.dhpetLocation.do",
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
		    	$("#period\\.dhpetLocation\\.id").val(item.id);
		    	$("#period\\.dhpetLocation\\.habitatLocation").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		$("#period\\.dhpetLocation\\.habitatLocation").select2("data", {id: "<s:property value='period.dhpetLocation.id'/>", name: "<s:property value='period.dhpetLocation.habitatLocation'/>"});
		
		$("#cancelPLP").on('click', function() {
			$.ajax({
				type : "GET",
				url : "DhpetPlanPeriod.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#planperiod_form_content").html(jqXHR.responseText);
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
					$("#planperiod_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#planperiod_form_content").html(jqXHR.responseText);
					var errors_exits = jqXHR.getResponseHeader("errors_exist");
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
						jQuery("#planperiod_grid").trigger("reloadGrid");
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
			$("#planperiod_form :button").prop('disabled',false);
		})();		
});
	
</script>