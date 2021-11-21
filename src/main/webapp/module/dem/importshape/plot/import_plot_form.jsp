<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>


</head>
<body>    		    
<div id="plot_import_form_content">
<form id="plot_import_form" class="form-horizontal" action="ImportPlotSave.do" accept-charset="utf8" method="post"  enctype="multipart/form-data">
				<input id="regionId" name="regionId" type="hidden" value="<s:property value="regionId"/>"/>
				<input id="regionCode" name="regionCode" type="hidden" value="<s:property value="regionCode"/>"/>
				
				<input id="managementUnitId" name="managementUnitId" type="hidden" value="<s:property value="managementUnitId"/>"/>
				<input id="muCode" name="muCode" type="hidden" value="<s:property value="muCode"/>"/>
				
				<input id="shapeFileExt" name="shapeFileExt"  type="hidden"/>
				<input id="shxFileExt" name="shxFileExt" type="hidden"/>
				<input id="dbfFileExt" name="dbfFileExt" type="hidden"/>
				<input id="dbfTreeExt" name="dbfTreeExt" type="hidden"/>
					<br/>
					<br/>
				<div class="tab-content">	
				
				<!-- START regionName -->
				<s:if test="fieldErrors.get('regionName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='frm.compartment.region.name'/>
						</label>
						<div class="col-md-10">
							<input id="regionName" name="regionName" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('regionName')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='frm.compartment.region.name'/></label>
						<div class="col-md-10">
							<input id="regionName" name="regionName" value="<s:property value='regionName'/>" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END regionName -->
			 <!-- START mangementUnit -->
				<s:if test="fieldErrors.get('managementUnitName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='frm.protection.management.unit'/>
						</label>
						<div class="col-md-10">
							<input id="managementUnitName" name="managementUnitName" class="form-control" placeholder="<s:text name='frm.protection.management.unit'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnitName')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='frm.protection.management.unit'/></label>
						<div class="col-md-10">
							<input id="managementUnitName" name="managementUnitName" value="<s:property value='managementUnitName'/>" class="form-control" placeholder="<s:text name='frm.protection.management.unit'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END mangementUnit -->
		      </div>							
				<!-- START file -->
				<s:if test="fieldErrors.get('shapeFile')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/> (.shp)
						</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="shapeFile" name="shapeFile"  onchange="getShapeFileData(this);" title="Please select .shp file" type="file" accept=".shp">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fileUpload')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/> (.shp)</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="shapeFile" name="shapeFile"  onchange="getShapeFileData(this);" title="Please select .shp file" type="file" accept="application/.shp">
						</div>									
					</div>
				</s:else>
				<!-- END file -->					
				
				<!-- START file -->
				<s:if test="fieldErrors.get('shxFile')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/> (.shx)
						</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="shxFile" name="shxFile" onchange="getSHXFileData(this);" title="Please select .shx file" type="file">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fileUpload')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/> (.shx)</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="shxFile" name="shxFile" onchange="getSHXFileData(this);" title="Please select .shx file" type="file">
						</div>									
					</div>
				</s:else>
				<!-- END file -->
				
				<!-- START file -->
				<s:if test="fieldErrors.get('dbfFile')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/> (.dbf)
						</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="dbfFile" name="dbfFile" onchange="getDBFFileData(this);" title="Please select .dbf file" type="file">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fileUpload')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/> (.dbf)</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="dbfFile" name="dbfFile" onchange="getDBFFileData(this);" title="Please select .dbf file" type="file">
						</div>									
					</div>
				</s:else>
				<!-- END file -->
				
				<!-- START file -->
				<s:if test="fieldErrors.get('dbfTreeFile')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name=''/>Plot tree (.dbf)
						</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="dbfTreeFile" name="dbfTreeFile" onchange="getDBFTreeFileData(this);" title="Please select .dbf file" type="file">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fileUpload')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name=''/>Plot tree (.dbf)</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="dbfTreeFile" name="dbfTreeFile" onchange="getDBFTreeFileData(this);" title="Please select .dbf file" type="file">
						</div>									
					</div>
				</s:else>
				<!-- END file -->
				
				<!-- START note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name='leave.ent.label.note'/></label>
					<div class="col-md-10">
						<textarea id="note" name="note" class="form-control" style="text-align:left!important;float: left; margin: 0 10px 0 0;overflow: hidden;" placeholder="Enter a short synopsis"><s:property value="domain.description"/></textarea>
					</div>
				</div>
				<!-- END note -->
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

</div>	
<jsp:include page="../../../base/validation.jsp"></jsp:include> 
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	function getShapeFileData(myFile){
	    var file = myFile.files[0];  
	    var filename = file.name;
	    var fileExt = filename.split('.').pop();
	    $("#shapeFileName").val(filename);
	    $("#shapeFileExt").val(fileExt);
	}
	function getDBFFileData(myFile){
	    var file = myFile.files[0];  
	    var filename = file.name;
	    var fileExt = filename.split('.').pop();
	    $("#dbfFileName").val(filename);
	    $("#dbfFileExt").val(fileExt);
	}
	function getDBFTreeFileData(myFile){
	    var file = myFile.files[0];  
	    var filename = file.name;
	    var fileExt = filename.split('.').pop();
	    $("#dbfTreeExt").val(fileExt);
	}
	function getSHXFileData(myFile){
	    var file = myFile.files[0];  
	    var filename = file.name;
	    var fileExt = filename.split('.').pop();
	    $("#shxFileName").val(filename);
	    $("#shxFileExt").val(fileExt);
	}
	$(document).ready(function() {

		$("#shape_overlap_stand_grid_content").hide();
		$("#shape_out_state_grid_content").hide();
		$("#shape_fields_control_grid_content").hide();
		$("#shape_overlap_gis_grid_content").hide();
		
		$('#datefrom').datetimepicker({
			lang: 'al',
			format: 'Y-m-d',
			mask: false,
			formatDate: 'Y-m-d',
			onShow:function( ct ){
			   this.setOptions({
			    maxDate: $('#dateto').val()?$('#dateto').val():false
			   });
			},		
			timepicker: false,
		});	

		$('#dateto').datetimepicker({
			lang: 'al',
			format: 'Y-m-d',
			mask: false,
			formatDate:'Y-m-d',
			onShow:function( ct ){
			   this.setOptions({
			    minDate: $('#datefrom').val()?$('#datefrom').val():false
			   });
			},		
			timepicker: false,
	    			
		});	
			
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
		    	$("#regionCode").val(item.code);
		    	$("#managementUnitName").select2("data", {id: "", name: ""});
		    	$("#managementUnitName").prop("disabled", false);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		$("#regionName").select2("data", {id: $("#regionId").val(), name: $("#regionName").val(),code:$("#regionCode").val()});
		
		
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
		    	$("#managementUnitId").val(item.id);
		    	$("#managementUnitName").val(item.name);
		    	$("#muCode").val(item.code);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		$("#managementUnitName").select2("data", {id: $("#managementUnitId").val(), name: $("#managementUnitName").val(),code:$("#muCode").val()});
		
		$("#managementUnitName").on("select2-selecting", function(e) {
			//alert("select2:open");
		});

		$("#managementUnitName").on("select2-open", function(e) {
			var rid = $("#regionId").val();
			if(rid == ""){
				alert("<s:text name="dem.fiskos.pls.select.reg"/>");
				$("#managementUnitName").prop("disabled", true);
			}
		});	
				
		
			Ladda.bind('#save');	
			$("#save").on('click', function() {
				$('#plot_import_form').submit();
				return false;
			});
			
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "ImportShape.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#plot_import_form_content_page").html(jqXHR.responseText);
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
				$("#plot_import_form_content").html(jqXHR.responseText);
				var errors = jqXHR.getResponseHeader("errors_exits");
				if(!errors){
					$.smallBox({
						title : "<s:text name="small.box.on.save.title.success"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#739E73",
						timeout: 5000,
						icon : "fa fa-check",
						number : "1"
					});	
// 					var url="DemGrid.plotsExistingInDB.do?reg_code="+$("#regionCode").val()+"&mu_code="+$("#muCode").val();
// 					jQuery("#plots_existing").jqGrid('setGridParam', {url:url});
// 		            jQuery("#plots_existing").trigger('reloadGrid');
					$("#step_1").css("background","#34712A");
					$("#validation_li_2").addClass("active");
					$("#validation_li_1").removeClass("active");
					checkExistingPlots($("#regionCode").val(),$("#muCode").val());
				}else{
					$.smallBox({
						title : "<s:text name="small.box.on.save.title.failed"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C79121",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
					$("#step_1").css("background","#D84C4C");
				}					    	
		    },	    
			complete: function(xhr) {
			}
		});			

	});
</script>

</body>
</html>
