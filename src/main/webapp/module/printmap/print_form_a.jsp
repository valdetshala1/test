<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../base/nocache.jsp"%>
<html >
	<div id="printmap_form_content" class="modal-body" style="padding-top: 8px; padding-left: 8px;padding-right: 8px; padding-bottom: 8px;" >
		<form id="printmap_form" class="smart-form" action="PrintMapValidate.do" accept-charset="utf8" method="post">
		<input  id="units" name="units" value="degrees" class="form-control" type="hidden">
		<input  id="srs" name="srs" value="EPSG:4326" class="form-control" type="hidden">
				<div class="row">
				<!-- scales START-->
					<section class="col col-6" >
						<label class="input"> *<s:text name="print.map.scale.form"/>:
							<select class="form-control"  style="height: 22px;" name="scalesMapPrint" id="scalesMapPrint" >
							</select>							
						</label>
					</section>
				<!-- scales END-->
				<!-- Layouts START-->
					<section class="col col-6">
						<label class="input"> *<s:text name="print.map.layout.form"/>:
							<select class="form-control" style="height: 22px;" name="layouts" id="layouts" >
						
							</select>							
						</label>
					</section>
				<!-- Layouts END-->
				</div>
				<div class="row">
					<section class="col col-8">
						<label class="input">
							<input  id="mapName" name="mapName"  placeholder="<s:text name="print.map.name"/>" value="<s:property value='mapName'/>" class="form-control" type="text" style="height: 25px;" >
						</label>
					</section>
					<section class="col col-4">
						<label class="input">
						<button id="validateMapPrint" class="btn btn-primary form-control"  type="button" style="height: 25px;">
							<i class="fa fa-save"></i>
							<s:text name="rbac.permission.grid.print"></s:text>
						</button>
						</label>
					</section>
				</div>
		</form>
	</div>
<script type="text/javascript">
var printUrl,createURL,jsonString;
$(document).ready(function (){
		var print_scale = [1200000, 1000000, 500000, 200000, 100000, 50000, 25000, 10000, 5000, 2500, 1000, 500, 250, 100];
		for(var i=0;i<print_scale.length;i++){
			$('#scalesMapPrint').append($("<option></option>").attr("value",print_scale[i]).text(print_scale[i]));	
// 			if(i==0){
// 				$('#scalesMapPrint').append($("<option></option>").attr("selected","selected");
// 			}
		} 
		$.ajax({
				type : "GET", // GET or POST
				url : "Input.readPrintFormats.do", // the file to call
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
				},
				dataType: "json",
		        data: {
					featureClass: "P",
					style: "full",
				},
				success : function(data, status, jqXHR) { // on success..
					if(!jQuery.isEmptyObject(data)){
						for(var i=0;i<data.length;i++){
							$('#layouts').append($("<option></option>").attr("value",data[i].width+':'+data[i].height).text(data[i].format));	
						} 
					}
				},
				complete:function(jqXHR, textStatus){
				}
			});
		
		var  featurePrint =   new OpenLayers.Layer.Vector('Vektori', 
        		{visibility: true, displayInLayerSwitcher: true, //styleMap: styles,
	            eventListeners: {
	                // whenever a sketch is complete, consider splitting polys
	                sketchcomplete: function(event) {
	                    var proceed = true;
	                    if (event.feature.geometry instanceof OpenLayers.Geometry.LineString) {
	  
	                    }
	                    return proceed;
	                }
	            }		
        });
		var extent='';
		$( "#layouts" ).change(function() {
			if($("#scalesMapPrint option:selected").text()!='')
				extent=createMapBoundsToPrint();
			});
		$( "#scalesMapPrint" ).change(function() {
			if($("#layouts option:selected").text()!='')
				extent=createMapBoundsToPrint();
			});
		$("#layouts option:first").attr('selected','selected');
		$("#scalesMapPrint option:first").attr('selected','selected');
		function createMapBoundsToPrint(){
			var extentPrint='';
			var width_height,width,height,x0,y0,vh,vw,x1,y1,x2,y2,bounds;
			var centerRKS=map_a.getCenter().transform("EPSG:900913","EPSG:900916");
			width_height = $('#layouts').val().split(":");
			width=width_height[0];
			height=width_height[1];
			x0=centerRKS.lon;
			y0=centerRKS.lat;
			vh=(height*$('#scalesMapPrint').val())/2000;
			vw=(width*$('#scalesMapPrint').val())/2000;
			x1=x0-vw;
			y1=y0-vh;
			x2=x0+vw;
			y2=y0+vh;
			//  map.addControl(polygon);
			var print_rect = 'polygon(('+x1+' '+ y1+', '+ x1+' '+ y2+', '+x2+' '+ y2+', '+x2+' '+ y1+', '+x1+' '+ y1+'))';
			var start_point = new OpenLayers.Geometry.Point(2314408.6166, 5227564.86);
			var end_point = new OpenLayers.Geometry.Point(x2,y2);
		    var feature = new OpenLayers.Feature.Vector(OpenLayers.Geometry.fromWKT(print_rect));
			var ln = feature.geometry.transform("EPSG:900916","EPSG:900913");
			featurePrint.destroyFeatures();
			var wkt_ln=new OpenLayers.Feature.Vector(
	    	 		ln
	    	);
			featurePrint.addFeatures([wkt_ln]);
				
			map_a.addLayer(featurePrint);
			var extent2=featurePrint.getDataExtent();
			map_a.zoomToExtent(extent2,false);
			extentPrint=x1+','+y1+','+x2+','+y2;
			return extentPrint;
		}
		function printMap(){
			var layerForPprint = printLayersName(map,vectorLayer);
// 			var layerForPprint='Aspect_Slope,vgis_stand_active,vgis_comp_active,vgis_mu_period_active,vgis_mu_period_active';
			if(extent!='' && $("#mapName").val() && $("#layouts option:selected").text()!='' && $("#scalesMapPrint option:selected").text()!=''){
				var url="PrintKfisMap.do?layers="+layerForPprint+"&tittle_name="+$("#mapName").val()+"&extent="+extent+"&scale="+$("#scalesMapPrint option:selected").val()+"&template="+$("#layouts option:selected").text();
				window.open(url,' ');
				
			}else{
				alert('<s:text name="form.input.fill.necesary.field"/>');
				}
			return false;
		}
		
		$("#validateMapPrint").on('click', function() {
			printMap();
			return false;
		});
		
		$('#layouts').val('<s:property value="layouts"/>');
		$('#scalesMapPrint').val('<s:property value="scalesPrint"/>');
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
						}
				    },
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});

});



</script>



</html>