<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<jsp:include page="../../../base/validation.jsp"></jsp:include> 
<html>
<head>


</head>
<body>    		    
<form id="plot_export_form" class="form-horizontal" action="ExportPlotSave.do" accept-charset="utf8" method="post"  enctype="multipart/form-data">
<!-- 					<br/> -->
<!-- 					<br/> -->
				<div class="tab-content">	
				
				<!-- START regionName -->
				<s:if test="fieldErrors.get('regionId.empty')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='frm.compartment.region.name'/>
						</label>
						<div class="col-md-10">
							<input id="regionName" name="regionName" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
							<input id="regionId" name="regionId" type="hidden"/>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('regionId.empty')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='frm.compartment.region.name'/></label>
						<div class="col-md-10">
							<input id="regionName" name="regionName" value="<s:property value='regionName'/>" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
							<input id="regionId" name="regionId" type="hidden" value="<s:property value="regionId"/>"/>
						</div>									
					</div>
				</s:else>
				<!-- END regionName -->
			 <!-- START mangementUnit -->
				<s:if test="fieldErrors.get('muId.empty')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='frm.protection.management.unit'/>
						</label>
						<div class="col-md-10">
							<input id="managementUnitName" name="managementUnitName" class="form-control" placeholder="<s:text name='frm.protection.management.unit'/>" type="text">
							<input id="muId" name="muId" type="hidden"/>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('muId.empty')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='frm.protection.management.unit'/></label>
						<div class="col-md-10">
							<input id="managementUnitName" name="managementUnitName" value="<s:property value='managementUnitName'/>" class="form-control" placeholder="<s:text name='frm.protection.management.unit'/>" type="text">
							<input id="muId" name="muId" type="hidden" value="<s:property value="muId"/>"/>
						</div>									
					</div>
				</s:else>
				<!-- END mangementUnit -->
		</div>
				<div class="form-actions">
					<div class="row">
						<div class="col-md-12">
							<button id="cancel" class="btn btn-default" type="button">
								<s:text name="label.button.cancel"></s:text>
							</button>
							<button id="save" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
								<i class="fa fa-save"></i>
								<s:text name="label.button.save"></s:text>
							</button>
							
						</div>
					</div>
				</div>

		</form>

<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	$(document).ready(function() {

		
			
		$("#regionName").select2({
		    placeholder: "<s:text name="placeholder.enter.reg.name"/>",
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
		    	$("#regionId").val(item.id);
		    	$("#regionName").val(item.name);
		    	$("#managementUnitName").select2("data", {id: "", name: ""});
		    	$("#managementUnitName").prop("disabled", false);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		$("#regionName").select2("data", {id: $("#regionId").val(), name: $("#regionName").val()});
		
		
		$("#managementUnitName").select2({
		    placeholder: "<s:text name="dem.fiskos.enter.man.unit"/>",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.managementUnit.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	name_startsWith: term,
			        	regionId: $("#regionId").val(),
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
		    	$("#muId").val(item.id);
		    	$("#managementUnitName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});
		$("#managementUnitName").select2("data", {id: $("#muId").val(), name: $("#managementUnitName").val()});
		
		$("#managementUnitName").on("select2-open", function(e) {
			var rid = $("#regionId").val();
			if(rid == ""){
				alert("<s:text name="dem.fiskos.pls.select.reg"/>");
				$("#managementUnitName").prop("disabled", true);
			}
		});	
				
		
		Ladda.bind('#save');	
		$("#save").on('click', function() {
			$('#plot_export_form').submit();
			return false;
		});
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "ExportPlot.page.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#shape_export_content_page").html(jqXHR.responseText);
					$.smallBox({
						title : "<s:text name="small.box.on.cancel.title"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C46A69",
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 3000
					});
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			
			return false;
		});

		$('form').ajaxForm({
		    beforeSend: function() {
		    	$('#ajaxBusyB').show();
		    	$("#validation_li_1").addClass("active");
		    },
			error : function(response, status, err){
				$("#grant_dialog").html(response);
			},	    
		    success : function(data, status, jqXHR) {
				$("#export_plot_content").html(jqXHR.responseText);
				var errors = jqXHR.getResponseHeader("errors_exist");
				if(!errors){
					var url="PlotExport.do?regionId="+$("#regionId").val()+"&muId="+$("#muId").val();
					window.open(url,'_blank');
					$.smallBox({
						title : "<s:text name="small.box.on.save.title.success"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#739E73",
						timeout: 5000,
						icon : "fa fa-check",
						number : "1"
					});	
// 					$("#step_1").css("background","#34712A");
// 					 $("#validation_li_2").addClass("active");
// 					 $("#validation_li_1").removeClass("active");
// 					jQuery("#shape_out_state").jqGrid('setGridParam', {url:"DemGrid.shapeOutState.do"});
// 		            jQuery("#shape_out_state").trigger('reloadGrid');	
				}else{
					$.smallBox({
						title : "<s:text name="small.box.on.save.title.failed"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C79121",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
// 					$("#step_1").css("background","#D84C4C");
				}
		    },	    
			complete: function(xhr) {
			}
		});			

	});
</script>

</body>
</html>
