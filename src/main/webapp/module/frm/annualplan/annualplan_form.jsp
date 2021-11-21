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
	<div id="annualplan_form_content" class="widget-body">

		<form id="annualplan_form" class="form-horizontal" action="AnnualplanSave.do" accept-charset="utf8" method="post">
		
			<fieldset>
				<legend><s:text name='annual.plan.data'/></legend>
				
				<input id="annualplan.id" name="annualplan.id" value="<s:property value='annualplan.id'/>" type="hidden">
				<input id="enableField" name="enableField" value="<s:property value='enableField'/>" type="hidden">
				<input id="newAP" name="newAP" value="<s:property value='newAP'/>" type="hidden">
			    <input id="annualplan.annualPlanningStatus.id" name="annualplan.annualPlanningStatus.id" value="<s:property value='annualplan.annualPlanningStatus.id'/>" type="hidden">
				<input id="annualplan.annualPlanningStatus.status" name="annualplan.annualPlanningStatus.status" value="<s:property value='annualplan.annualPlanningStatus.status'/>" type="hidden">
				<div class="form-group" id="central">
						<label class="col-md-2 control-label"><s:text name='annual.plan.central.plan'/></label>
						<div class="col-md-10">
							<input id="checkCentralPlan" name="checkCentralPlan" value="<s:property value='checkCentralPlan'/>"  type="checkbox" >
							<input id="centralplan" name="centralplan" value="<s:property value='centralplan'/>"  type="hidden" >
 						</div>
				</div>
			<!-- START annualplan.managementUnit -->
				<div id="mundiv">
					<s:if test="fieldErrors.get('annualplan.cadastralMunicipality.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='annual.plan.municipality'/>:</label>
							<div class="col-md-10">
								<input id="annualplan.cadastralMunicipality.name" name="annualplan.cadastralMunicipality.name" class="form-control" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('annualplan.cadastralMunicipality.id')"/> </span>
								<input id="annualplan.cadastralMunicipality.id" name="annualplan.cadastralMunicipality.id" value="<s:property value='annualplan.cadastralMunicipality.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='annual.plan.municipality'/>:</label>
							<div class="col-md-10">
								<input id="annualplan.cadastralMunicipality.name" name="annualplan.cadastralMunicipality.name" class="form-control" value="<s:property value='annualplan.cadastralMunicipality.name'/>" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
								<input id="annualplan.cadastralMunicipality.id" name="annualplan.cadastralMunicipality.id" value="<s:property value='annualplan.cadastralMunicipality.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				</div>
				<!-- END annualplan.managementUnit -->
				
				
				<!-- START annualplan.year -->
				<s:if test="fieldErrors.get('annualplan.year')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='annual.plan.year'/>:</label>
						<div class="col-md-10">
						<div class="input-group date">
							<input type='text' id="annualplan.year" name="annualplan.year"  data-date-format="YYYY" class="form-control" placeholder="<s:text name='annual.plan.year'/>" type="number"/> 
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							</div>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('annualplan.year')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='annual.plan.year'/>:</label>
						<div class="col-md-10">
							<div class="input-group date">
		                    	<input type='text' id="annualplan.year" name="annualplan.year" value="<s:property value='annualplan.year'/>" data-date-format="YYYY" class="form-control" placeholder="<s:text name='annual.plan.year'/>" type="number"/>
		                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                	</div>
						</div>
					</div>
				</s:else>
				<!-- END annualplan.year -->
				
				<!-- START annualplan.remarks -->
				<s:if test="fieldErrors.get('annualplan.remarks')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='annual.plan.remarks'/>:</label>
						<div class="col-md-10">
							<textarea id="annualplan.remarks" name="annualplan.remarks" class="form-control" placeholder="<s:text name='annual.plan.remarks'/>"><s:property value='annualplan.remarks'/></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('annualplan.remarks')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='annual.plan.remarks'/>:</label>
						<div class="col-md-10">
							<textarea id="annualplan.remarks" name="annualplan.remarks" class="form-control" placeholder="<s:text name='annual.plan.remarks'/>"><s:property value='annualplan.remarks'/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END annualplan.remarks -->

			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelAnnu" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveAnnu" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
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
		//http://xdsoft.net/jqplugins/datetimepicker/
		//http://tarruda.github.io/bootstrap-datetimepicker/
		//http://xdsoft.net/jqplugins/datetimepicker/
		
		var actalUser="<s:property value='user.getOrganisation().getOperLevelVal()'/>";
		if(actalUser=='C'){
			$('#central').show();
			$("#annualplan\\.cadastralMunicipality\\.name").prop('disabled','disabled');
			if(!$("#annualplan\\.cadastralMunicipality\\.id").val()){
				$("#checkCentralPlan").prop('checked',true);
				$("#checkCentralPlan").prop('disabled','disabled');
				$("#centralplan").val('true');
				$("#mundiv").hide();
			}else{
				$('#central').hide();
			}
		}else{
			$('#central').hide();
			$("#mundiv").show();
		}
		$('#checkCentralPlan').change(function() {
			if($("#checkCentralPlan").is(':checked')){
				$("#mundiv").hide();
				$("#centralplan").val('true');
				$("#annualplan\\.cadastralMunicipality\\.name").val("");
				$("#annualplan\\.cadastralMunicipality\\.id").val(null);
			}else{
				 $("#mundiv").show();
				 $("#centralplan").val('false');
			}
  		  });
		  if($("#annualplan\\.id").val() && !$("#annualplan\\.cadastralMunicipality\\.id").val()){
			  $("#mundiv").hide();
				$("#centralplan").val('true');
				$("#checkCentralPlan").prop("checked",true);
		  }

		  
		
	    if($("#enableField").val()=='false'){
	    	$("#annualplan\\.year").attr('readonly',true);
			$("#annualplan\\.cadastralMunicipality\\.name").attr('readonly',true);
	    }else{
	    	$('#annualplan\\.year').datetimepicker({
				timepicker:false,
				format:'Y', 
				mask:false,
				formatDate:'YYYY'});
			$('#annualplan\\.year').mask('9999');
	    }

		if( $("#annualplan\\.id").val()=='' ||  $("#annualplan\\.annualPlanningStatus\\.status").val()==$("#newAP").val()){
			$("#annualplan\\.remarks").attr('readonly',false);
		}else {
			$("#annualplan\\.remarks").attr('readonly',true);
			$("#saveAnnu").attr('disabled','disabled');
			$("#saveAnnu").hidde;
		} 
			
	    $("#annualplan\\.cadastralMunicipality\\.name").select2({
	        placeholder: "Search for a repository",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.municipality.do",
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
	        	$("#annualplan\\.cadastralMunicipality\\.id").val(item.id);
	        	$("#annualplan\\.cadastralMunicipality\\.name").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

	    $("#annualplan\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='annualplan.cadastralMunicipality.id'/>", name: "<s:property value='annualplan.cadastralMunicipality.name'/>"});
		
		$("#cancelAnnu").on('click', function() {
			$.ajax({
				type : "GET",
				url : "Annualplan.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#annualplan_form_content").html(jqXHR.responseText);
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
	

		$("#saveAnnu").on('click', function() {
			$(':button').prop('disabled','disabled');
			$('#annualplan_form').submit();
			return false;
		});
		$("#annualplan_form").submit(function() {
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
					$("#annualplan_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#annualplan_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}
					$(':button').prop('disabled',false);
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});

	});

	
</script>