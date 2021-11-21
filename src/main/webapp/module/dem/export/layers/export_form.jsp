<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<jsp:include page="../../../base/validation.jsp"></jsp:include> 
<html>
<body> 
<div id="export_layer_content">   		    
<form id="layer_export_form" class="form-horizontal" action="ExportLayerSave.do" accept-charset="utf8" method="post"  enctype="multipart/form-data">
	<input id="layerFormatName" name="layerFormatName" class="form-control" value="kml"  type="hidden">
				<div class="tab-content">	
					<s:if test="fieldErrors.get('layerName')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label" for="select-1">*Layers</label>
								<div class="col-md-10">
									<select class="form-control" id="layerName" name="layerName">
									<option value="<s:property value="" />"><s:property value="" /></option>
										<s:iterator value="layerNames" var="ln">
											<option value="<s:property value="#ln" />">
													<s:property value="#ln" />
											</option>
										</s:iterator>						
									</select>
									<span class="help-block"><i class="fa fa-warning"></i>
									</span> 
								</div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label" >*Layers</label>
							<div class="col-md-10">
									<select class="form-control" id="layerName" name="layerName">
										<option value="<s:property value="" />"><s:property value="" /></option>
										<s:iterator value="layerNames" var="ln">
											<option value="<s:property value="#ln" />">
													<s:property value="#ln" />
											</option>
										</s:iterator>						
									</select>
							</div>
						</div>
					</s:else>
					<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name="print.map.layout.form"/></label>
							<div class="col-md-10">
								<select class="form-control" id="layerFormat" name="layerFormat">
									<option value="kml">KML</option>
									<option value="gml">GML2</option>
									<option value="gml">GML3.1</option>
									<option value="gml">GML3.2</option>
									<option value="geojson">GeoJSON</option>
									<option value="zip">Shapefile</option>
								</select> 						
							</div>									
					</div>
				</div>
				<div class="form-actions">
					<div class="row">
						<div class="col-md-12">
							<button id="cancelLayer" class="btn btn-default" type="button">
								<s:text name="label.button.cancel"></s:text>
							</button>
							<button id="genLayer" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
	$(document).ready(function() {
		$("#layerFormat").change(function() {
			$("#layerFormatName").val($("#layerFormat option:selected").text());
		});
		$("#genLayer").on('click', function() {
			if($("#layerName").val() && $("#layerFormat option:selected").val()){
				var url="ExportLayerSave.do?layerName="+$("#layerName").val()+"&layerFormat="+$("#layerFormat option:selected").val()+"&layerFormatName="+$("#layerFormatName").val();
				window.open(url,' ');
			}else{
				alert('<s:text name="form.input.fill.necesary.field"/>');
				}
			return false;
		});
		$("#cancelLayer").on('click', function() {
			$.ajax({
				type : "GET",
				url : "ExportLayer.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#export_layer_base_content").html(jqXHR.responseText);
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

// 		$('form').ajaxForm({
// 		    beforeSend: function() {
// 		    	$('#ajaxBusyB').show();
// 		    	$("#validation_li_1").addClass("active");
// 		    },
// 			error : function(response, status, err){
// 				$("#grant_dialog").html(response);
// 			},	    
// 		    success : function(data, status, jqXHR) {
// 				$("#export_layer_content").html(jqXHR.responseText);
// 				var errors = jqXHR.getResponseHeader("errors_exist");
// 				if(!errors){
// 					var url="ExportLayer.do?regionId="+$("#regionId").val()+"&muId="+$("#muId").val();
// 					window.open(url,'_blank');
// 					$.smallBox({
// 						title : "<s:text name="small.box.on.save.title.success"/>", 
// 						content : "<s:text name="small.box.content"/>", 
// 						color : "#739E73",
// 						timeout: 5000,
// 						icon : "fa fa-check",
// 						number : "1"
// 					});	
// 				}else{
// 					$.smallBox({
// 						title : "<s:text name="small.box.on.save.title.failed"/>", 
// 						content : "<s:text name="small.box.content"/>", 
// 						color : "#C79121",
// 						timeout: 5000,
// 						icon : "fa fa-shield fadeInLeft animated",
// 						number : "2"
// 					});
// 				}
// 		    },	    
// 			complete: function(xhr) {
// 			}
// 		});			

	});
</script>

</body>
</html>
