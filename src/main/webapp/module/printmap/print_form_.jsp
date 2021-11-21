<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../base/nocache.jsp"%>
<html >

	<div id="printmap_form_content"class="modal-body">
	<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">Print Map</h4>
	</div>
	<form id="printmap_form" class="form-horizontal" action="PrintMapValidate.do" accept-charset="utf8" method="post">
	
	<input  id="units" name="units" value="degrees" class="form-control" type="hidden">
	<input  id="srs" name="srs" value="EPSG:4326" class="form-control" type="hidden">
<%-- 	<input  id="printLayers" name="printLayers" value="<s:property value='printLayers'/>" class="form-control" type="text"> --%>
			<div class="form-group">
				<label class="col-md-2 control-label"><s:text name="print.map.name"/>:</label>
				<div class="col-md-10">
					<input  id="mapName" name="mapName" value="<s:property value='mapName'/>" class="form-control" type="text">
				</div>
			</div>
<!-- 		<div class="widget-body"> -->
			<!-- scales START-->
				<s:if test="fieldErrors.get('scalesPrint')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="print.map.scale.form"/>:</label>
						<div class="col-md-10">
							<select class="form-control" name="scalesPrint" id="scalesPrint" >
								<option></option>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('scalesPrint')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="print.map.scale.form"/>:</label>
						<div class="col-md-10">
							<select class="form-control"  name="scalesPrint" id="scalesPrint" >
								<option></option>
							</select>
						</div>
					</div>
				</s:else>
			<!-- scales END-->
			
			<!-- Layouts START-->
			<s:if test="fieldErrors.get('layouts')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="print.map.layout.form"/>:</label>
						<div class="col-md-10">
							<select class="form-control" name="layouts" id="layouts" >
						<option></option>
					</select>
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('layouts')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="print.map.layout.form"/>:</label>
						<div class="col-md-10">
							<select class="form-control" name="layouts" id="layouts" >
						<option></option>
					</select>
						</div>
					</div>
				</s:else>
			<!-- Layouts END-->
			
			<!-- Rotation START-->
			<s:if test="fieldErrors.get('rotation')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="print.map.rotation.form"/>:</label>
						<div class="col-md-10">
							<input  id="rotation" name="rotation" value="<s:property value='rotation'/>" class="form-control" type="number">
							<span class="help-block"><i class="fa fa-warning"></i> 
							<s:property value="fieldErrors.get('rotation')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="print.map.rotation.form"/>:</label>
						<div class="col-md-10">
							<input  id="rotation" name="rotation" value="<s:property value='rotation'/>" class="form-control" type="number">
						</div>
					</div>
				</s:else>
			<!-- Rotation END-->
<!-- 		</div> -->
		
<!-- 		<div class="modal-footer"> -->
<!-- 			<button type="button" onclick="writeJSON();" class="btn btn-primary"> -->
<!-- 				Print -->
<!-- 		
	</button> -->
<!-- 		</div> -->
		
		<div class="modal-footer">
			<button id="validateMapPrint" class="btn btn-primary" type="button">
				<i class="fa fa-save"></i>
				<s:text name="label.button.save"></s:text>
			</button>
		</div>
	</form>
	</div>
<script type="text/javascript">
var printUrl,createURL,jsonString;
$(document).ready(function (){
		
		$.ajax({
			type : "GET",
			url : "/geoserver/pdf/info.json", 
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			success : function(data, status, jqXHR) { // on success..
				var a=data.scales;
				for(var i=0;i<a.length;i++){
					$('#scalesPrint').append($("<option></option>").attr("value",a[i].value) .text(a[i].name));	
				}
				var a=data.layouts;
				for(var i=0;i<a.length;i++){
					$('#layouts').append($("<option></option>").attr("value",a[i].name) .text(a[i].name));	
				}
				printUrl = data.printURL;
				createURL = data.createURL;
			},
			complete:function(jqXHR, textStatus){
			}
		});		


		$("#validateMapPrint").on('click', function() {
			$('#printmap_form').submit();
			return false;
		});
		
		$('#layouts').val('<s:property value="layouts"/>');
		$('#scalesPrint').val('<s:property value="scalesPrint"/>');
		$("#printmap_form").submit(function() {
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
				 success : function(data, status, jqXHR) {
						$("#printmap_form_content").html(jqXHR.responseText);
						var errors = jqXHR.getResponseHeader("errors_exits");
						if(!errors){
							writeJSON();
// 							$("#printModal").modal( "hide" );
						}
				    },
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
		function writeJSON(jsonString){
			var layerForPprint = printLayers(map,vectorLayer);
			jsonString='{'+
			'"units" : "meter",'+
			'"srs" : "EPSG:7392",'+
			'"layout" : "'+$("#layouts").val()+'",'+
			'"mapTitle" : "'+$("#mapName").val()+'",'+
// 			'"serialNo" : "0001",'+
			'"userName" : "admin",'+
			'"dpi" : 90,'+
			'"layers" : ['+layerForPprint+'],'+
			'"pages" : [{'+
					'"center" : ['+getCentre(map).lon+','+getCentre(map).lat+'],'+
					'"scale" : '+$("#scalesPrint").val()+','+
					'"rotation" : "'+$("#rotation").val()+'"'+
				'}'+
				']'+
			'}';
			$.ajax({
			    type: 'POST',
			    url: 'https://apps.geoland-kosova.com/geoserver/pdf/create.json',//createURL,
			    data: jsonString,
			    success: function(response) { 
		    		$.each(response, function( index, value ) {
		    		  window.location.href = value;
		    		});
		     	},
			    contentType: "application/json",
			    dataType: 'json',
			    scope : this
			});
		}
});



</script>



</html>