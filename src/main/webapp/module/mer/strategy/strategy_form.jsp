<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!-- widget div-->
<div id="strategy_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">
		<form id="strategy_form" class="form-horizontal" action="MerStrategySave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="strategy.id" name="strategy.id" value="<s:property value="strategy.id"/>" />
			
			<input type="hidden" id="strategy.person.id" name="strategy.person.id" value="<s:property value="strategy.person.id"/>" />
			<input type="hidden" id="strategy.createdDate" name="strategy.createdDate" value="<s:property value="strategy.createdDate"/>" />
			
			<input id="strategy.merPlanPeriod.startYear" name="strategy.merPlanPeriod.startYear" class="form-control" value="<s:property value='strategy.merPlanPeriod.startYear'/>" type="hidden">
			<input id="strategy.merPlanPeriod.endYear" name="strategy.merPlanPeriod.endYear" class="form-control" value="<s:property value='strategy.merPlanPeriod.endYear'/>" type="hidden">
			
			<input id="strategy.fullyFinanced" name="strategy.fullyFinanced" class="form-control" value="<s:property value='strategy.fullyFinanced'/>" type="hidden">
			<input id="strategy.inNegotiationsFinance" name="strategy.inNegotiationsFinance" class="form-control" value="<s:property value='strategy.inNegotiationsFinance'/>" type="hidden">
			
			<input type="hidden" id="language" name="locale.language" value="<s:property value="locale.language"/>" />
			
			<fieldset>
				<legend><s:text name='mer.strategy.data'/></legend>
				<!-- START strategy.merPlanPeriod -->
				<s:if test="fieldErrors.get('strategy.merPlanPeriod')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.merPlanPeriod'/></label>
						<div class="col-md-10">
							<input id="merPlanPeriod" name="merPlanPeriod" class="form-control" type="text">
							<input id="strategy.merPlanPeriod.id" name="strategy.merPlanPeriod.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.merPlanPeriod')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.merPlanPeriod'/></label>
						<div class="col-md-10">
							<input id="merPlanPeriod" name="merPlanPeriod" class="form-control" type="text">
							<input id="strategy.merPlanPeriod.id" name="strategy.merPlanPeriod.id" class="form-control" value="<s:property value='strategy.merPlanPeriod.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				<!-- END strategy.merPlanPeriod -->
				
				<!-- START strategy.merSubProject -->
				<s:if test="fieldErrors.get('strategy.merSubProject')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.merSubProject'/></label>
						<div class="col-md-10">
							<input id="merSubProject" name="merSubProject" class="form-control" type="text">
							<input id="strategy.merSubProject.id" name="strategy.merSubProject.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.merSubProject')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.merSubProject'/></label>
						<div class="col-md-10">
							<input id="merSubProject" name="merSubProject" class="form-control" type="text">
							<input id="strategy.merSubProject.id" name="strategy.merSubProject.id" class="form-control" value="<s:property value='strategy.merSubProject.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END strategy.merSubProject -->
				
				<!-- START strategy.results -->
				<s:if test="fieldErrors.get('strategy.results')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="mer.strategy.results"/></label>
						<div class="col-md-10">
							<textarea id="strategy.results" name="strategy.results" class="form-control"></textarea>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.results')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.strategy.results'/></label>
						<div class="col-md-10">
							<textarea id="strategy.results" name="strategy.results" class="form-control" ><s:property value="strategy.results"/></textarea>
						</div>									
					</div>
				</s:else>
				<!-- END strategy.results -->
				
				<!-- START strategy.years -->
				<div class="form-group">
		      		<s:if test="fieldErrors.get('strategy.startYear')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="mer.planperiod.start.year"/></label>
							<div class="col-md-4">
								<input id="strategy.startYear" name="strategy.startYear" class="form-control" data="numberLong" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.startYear')"/> </span>
							</div>
						</div>
					</s:if>
					<s:else>
			          <label class="control-label col-sm-2">*<s:text name="mer.planperiod.start.year"/></label>
			          <div class="col-md-4">
			           		<input class="form-control" data="numberLong" type="text" name="strategy.startYear" id="strategy.startYear" value="<s:property value="strategy.startYear"/>">
			          </div>
				  	</s:else>
				  	<s:if test="fieldErrors.get('strategy.endYear')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label"><s:text name="mer.planperiod.endYear"/></label>
							<div class="col-md-4">
								<input id="strategy.endYear" name="strategy.endYear" class="form-control" data="numberLong" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.endYear')"/> </span>
							</div>
						</div>
					</s:if>
					<s:else>
				  	 <label class="control-label col-sm-2"><s:text name="mer.planperiod.endYear"/></label>
			          <div class="col-md-4">
			           <input class="form-control" data="numberLong" type="text" name="strategy.endYear" id="strategy.endYear" value="<s:property value='strategy.endYear'/>">
			          </div>
			        </s:else>	          
		      	</div>
				<!-- END strategy.years -->
				
				<!-- START strategy.pipCode -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.strategy.pipCode'/></label>
						<div class="col-md-10">
							<input maxlength="10" id="strategy.pipCode" name="strategy.pipCode" class="form-control" value="<s:property value='strategy.pipCode'/>" type="text">
						</div>
					</div>
				<!-- END strategy.pipCode -->
				
				<!-- START strategy.reviewTime -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='mer.strategy.reviewTime'/></label>
						<div class="col-md-10">
							<input id="strategy.reviewTime" name="strategy.reviewTime" class="form-control" value="<s:property value='strategy.reviewTime'/>" type="text">
						</div>
					</div>
				<!-- END strategy.reviewTime -->
				
				<!-- START strategy.cost -->
				<s:if test="fieldErrors.get('strategy.cost')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="finance.contractor.grid.cost"/></label>
						<div class="col-md-10">
							<input id="strategy.cost" name="strategy.cost" class="form-control">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.cost')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='finance.contractor.grid.cost'/></label>
						<div class="col-md-10">
							<input id="strategy.cost" name="strategy.cost" class="form-control" value="<s:property value="strategy.cost"/>">
						</div>
					</div>
				</s:else>
				<!-- END strategy.cost -->
				
				<!-- START strategy.finance -->
				<s:if test="fieldErrors.get('strategy.finance')!=null">
					<div class="form-group">
						<div class=" has-error">
							<label class="col-md-2 control-label">*<s:text name='mer.strategy.finance'/></label>
						</div>
					    <div class="col-md-10">
							<label class="col-md-4 control-label">
								<input type="radio" class="radiobox" id="fully" name="strategy.finance">
								<span><s:text name="mer.strategy.fullyFinanced"/></span>
							</label>
							<label class="col-md-4 control-label">
								<input type="radio" class="radiobox" id="neg" name="strategy.finance">
								<span><s:text name="mer.strategy.inNegotiations"/></span>
							</label>
							
<!-- 							<label class=""><br> -->
<%-- 								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.cost')"/> </span> --%>
<!-- 							</label> -->
						</div>
						
						<div class="has-error">
								<span class="help-block">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-warning"></i> <s:property value="fieldErrors.get('strategy.finance')"/> </span>
						</div>
				     </div>
				</s:if>
				<s:else>
					<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name='mer.strategy.finance'/></label>
						<div class="col-md-10">
							<label class="col-md-4 control-label">
								<input type="radio" class="radiobox" id="fully" name="strategy.finance">
								<span><s:text name="mer.strategy.fullyFinanced"/></span>
							</label>
							<label class="col-md-4 control-label">
								<input type="radio" class="radiobox" id="neg" name="strategy.finance">
								<span><s:text name="mer.strategy.inNegotiations"/></span>
							</label>
						</div>
					</div>
				</s:else>
				<!-- END strategy.finance -->
				
				<!-- START strategy.note -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="strategy.note" name="strategy.note" class="form-control"><s:property value="strategy.note"/></textarea>
						</div>									
					</div>
				<!-- END strategy.note -->
				<!-- START strategy.attachment -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="hrm.skill.label.attachment"/></label>
					<div class="col-md-10">
						<input type="file" class="btn btn-default" id="file" name="file" onchange="getFileData(this);">
					</div>
				</div>
				<!-- END strategy.attachment -->
				<input id="doc.docName" name="doc.docName" class="form-control" value="<s:property value='doc.docName'/>" type="hidden">
				<input id="doc.docType" name="doc.docType" class="form-control" value="<s:property value='doc.docType'/>" type="hidden">
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelStr" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveStr"  class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
    $("#doc\\.docName").val(filename);
    $("#doc\\.docType").val('.'+fileExt);
    
 }
 
$(document).ready(function () {
		$("input[data='numberLong']").mask("9999");
		$("#strategy\\.cost").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		if($("#strategy\\.fullyFinanced").val()==="true"){
			$("#fully").prop("checked", true);
		}else if($("#strategy\\.inNegotiationsFinance").val()==="true"){
			$("#neg").prop("checked", true);
		}

		$("#fully").on('change', function(){
			$("#strategy\\.fullyFinanced").val(true);
			$("#strategy\\.inNegotiationsFinance").val(null);
		});

		$("#neg").on('change', function(){
			$("#strategy\\.inNegotiationsFinance").val(true);
			$("#strategy\\.fullyFinanced").val(null);
		});

		$('#strategy\\.reviewTime').datetimepicker({
			timepicker:false,
			format:'d.m.Y', 
			mask:false,
			formatDate:'d.m.Y'});
		
		$("#merPlanPeriod").select2({
		    placeholder: "", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "MERInput.planPeriod.do",
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
	                    "<div><i class='fa fa-chevron-circle-right'> Period : " + item.start_year +"-"+ item.end_year+ "</div>" +
                    '</div>';
                	return desc;
                }
                return "";
		    },
		    formatSelection: function(item) {
		    	$("#strategy\\.merPlanPeriod\\.id").val(item.id);
		    	var val=item.start_year+"-"+item.end_year;
		    	$("#merPlanPeriod").val(val);
		        return val;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		if($("#strategy\\.merPlanPeriod\\.id").val()){
			$("#merPlanPeriod").select2("data", {id: "<s:property value='strategy.merPlanPeriod.id'/>", start_year: "<s:property value="strategy.merPlanPeriod.startYear"/>", end_year: "<s:property value="strategy.merPlanPeriod.endYear"/>"});
		}
		$("#merSubProject").select2({
		    placeholder: "", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "MERInput.subProject.do",
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
		    	$("#strategy\\.merSubProject\\.id").val(item.id);
		    	var val=item.name+" ( "+ item.code+" )";
		    	$("#merSubProject").val(val);
		        return val;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		if($("#strategy\\.merSubProject\\.id").val()){
			var sub_project_name="";
			var lang=$("#language").val();
			if(lang==="en"){
				sub_project_name="<s:property value='strategy.merSubProject.nameEn'/>";
			}else if(lang==="sr"){
				sub_project_name="<s:property value='strategy.merSubProject.nameSr'/>";
			}else {
				sub_project_name="<s:property value='strategy.merSubProject.name'/>";
			}
			$("#merSubProject").select2("data", {id: "<s:property value='strategy.merSubProject.id'/>", name: sub_project_name, code:"<s:property value='strategy.merSubProject.code'/>"});
		}

		Ladda.bind('#saveStr');
		$("#saveStr").on('click', function () {
			$("#strategy_form :button").prop('disabled','disabled');
			$('#strategy_form').submit();
			return false;        
		});
		
		$("#cancelStr").on('click', function() {
			$.ajax({
				type : "GET",
				url : "MerStrategy.board.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#strategy_board_content").html(jqXHR.responseText);
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
					$("#strategy_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	var strategy_id=$("#strategy\\.id").val();
					$("#strategy_form_content").html(jqXHR.responseText);
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
						jQuery("#strategy_grid").trigger("reloadGrid");
						if(!strategy_id){
							loadURL("MerStrategy.board.do?strategyId="+$("#strategy\\.id").val(),$("#strategy_board_content"));
						}
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
			$("#strategy_form :button").prop('disabled',false);
		})();		
});
	
</script>