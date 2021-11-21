<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>    		    
<div id="line_import_form_content">
<form id="line_import_form" class="form-horizontal" action="ImportLineSave.do" accept-charset="utf8" method="post"  enctype="multipart/form-data">
				<input id="regionId" name="regionId" type="hidden" value="<s:property value="regionId"/>"/>
				<input id="regCode" name="regCode" type="hidden" value="<s:property value="regCode"/>"/>
				<input id="munitCode" name="munitCode" type="hidden" value="<s:property value="munitCode"/>"/>
				<input id="shapeFileExt" name="shapeFileExt"  type="hidden"/>
				<input id="shxFileExt" name="shxFileExt" type="hidden"/>
				<input id="dbfFileExt" name="dbfFileExt" type="hidden"/>
				<input id="managementUnitId" name="managementUnitId" type="hidden" value="<s:property value="managementUnitId"/>"/>
				<br/>
				<div class="tab-content">	
		      </div>							
				<!-- START file -->
				<s:if test="fieldErrors.get('shapeFileExt')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/> (.shp)
						</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="shapeFile" name="shapeFile"  onchange="getShapeFileData(this);" title="Please select .shp file" type="file" accept=".shp">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('shapeFileExt')"/> </span>
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
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('shxFile')"/> </span>
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
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dbfFile')"/> </span>
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
				
				<!-- START note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name='leave.ent.label.note'/></label>
					<div class="col-md-10">
						<textarea id="lineNote" name="lineNote" class="form-control" style="text-align:left!important;float: left; margin: 0 10px 0 0;overflow: hidden;" placeholder="Enter a short synopsis"><s:property value="domain.description"/></textarea>
					</div>
				</div>
				<jsp:include page="../../../base/validation.jsp"></jsp:include> 
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
	function getSHXFileData(myFile){
	    var file = myFile.files[0];  
	    var filename = file.name;
	    var fileExt = filename.split('.').pop();
	    $("#shxFileName").val(filename);
	    $("#shxFileExt").val(fileExt);
	}
	$(document).ready(function() {
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
			
			$("#save").on('click', function() {
				$('#line_import_form').submit();
				return false;
			});
			
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "ImportLine.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#line_import_form_content").html(jqXHR.responseText);
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
		    },
			error : function(response, status, err){
			},	    
		    success : function(data, status, jqXHR) {
				$("#line_import_form_content").html(jqXHR.responseText);
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
		           
				}else{
					$.smallBox({
						title : "<s:text name="small.box.on.save.title.failed"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C79121",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				}					    	
		    },	    
			complete: function(xhr) {
			}
		});			

	});
</script>

</body>
</html>
