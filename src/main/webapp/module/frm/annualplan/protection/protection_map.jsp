<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<script type="text/javascript">
var map_a, editor, popup;
var orto,  pedolo, mu, compartments, stand, biodiv ,plots, fmr;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";
var vectorLayer,vectorLayerPlan;
var selectFeature;
var mapLayers=[];

var map_a, oleeditor, editor, mcontrol, wfs, wkt, layerSwitcher, mapPanel, drawControls, vectors,  
features, format, popup, bounds, pureCoverage = false;
	var snap, poly, draw, drawsnap, modify, line, point,popupVine;
	var isDtmActive, isTexturaActive, activeLayerId;
	var measureControls;  
	var lyr0, swipe;
	var vectors, panel, controls,showInfo;

	var vis, ms;
var result_layer;

// World Geodetic System 1984 projection
var WGS84 = new OpenLayers.Projection("EPSG:4326");
 // WGS84 Google Mercator projection
var WGS84_google_mercator = new OpenLayers.Projection("EPSG:900913");
 // KosovaRef01 Projection 
var RKS = new OpenLayers.Projection("EPSG:900916");	 	

function toggleControl(element) {
    for(key in drawControls) {
       
        var control = drawControls[key];
        if(element.value == key) {//&& element.checked
        	 alert(key + "? " + element.value);
            control.activate();
        } else {
            control.deactivate();
        }
    }
}

OpenLayers.DOTS_PER_INCH = 25.4 / 0.28;

function loadStandActFeature(standId){
	var url ='MUnitMapJson.standFeature.do?stand_id=' +standId;
	if(url){
		var request = $.ajax({
			type : 'GET', // GET or POST
			url : url,  
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) {
				alert("error:" + errorThrown + ", status:" + status);
			},
			success : function(data, status, jqXHR) { 
				  var featurecollection = jqXHR.responseText;
 					
	           var geojson_format = new OpenLayers.Format.GeoJSON({
	        	'internalProjection': new OpenLayers.Projection("EPSG:900913"),
				'externalProjection': new OpenLayers.Projection("EPSG:900916")				           
		       });

	           vectorLayer.destroyFeatures();
	           var featureObject = geojson_format.read(featurecollection);
	          
	           vectorLayer.addFeatures(featureObject);
	           
	           map_a.zoomToExtent(vectorLayer.getDataExtent(),false);
	           map_a.raiseLayer(vectorLayer, map_a.layers.length);//make vector layer appear on top of all layers
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}
}
function loadImpSlvFeature(implSlv_id){
	var url ='MUnitMapJson.implSlvFeature.do?implSlv_id=' +implSlv_id;
	if(url){
		var request = $.ajax({
			type : 'GET', // GET or POST
			url : url,  
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) {
				alert("error:" + errorThrown + ", status:" + status);
			},
			success : function(data, status, jqXHR) { 
				  var featurecollection = jqXHR.responseText;
 					
	           var geojson_format = new OpenLayers.Format.GeoJSON({
	        	'internalProjection': new OpenLayers.Projection("EPSG:900913"),
				'externalProjection': new OpenLayers.Projection("EPSG:900916")				           
		       });

	           vectorLayer.destroyFeatures();
	           var featureObject = geojson_format.read(featurecollection);
	          
	           vectorLayer.addFeatures(featureObject);
	           
	           map_a.zoomToExtent(vectorLayer.getDataExtent(),false);
	           map_a.raiseLayer(vectorLayer, map_a.layers.length);//make vector layer appear on top of all layers
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}
}


function loadPlSlvFeature(slvId){
	var url ='MUnitMapJson.plSlvFeature.do?slv_id=' +slvId;
	$.ajax({
		type : 'GET', // GET or POST
		url : url,  
		async : false,
		beforeSend:function(jqXHR, settings) {
		},
		error : function(errorThrown, status, jqXHR) {
			alert("error:" + errorThrown + ", status:" + status);
		},
		success : function(data, status, jqXHR) { 
		   var featurecollection = jqXHR.responseText;
           var geojson_format = new OpenLayers.Format.GeoJSON({
        	'internalProjection': new OpenLayers.Projection("EPSG:900913"),
			'externalProjection': new OpenLayers.Projection("EPSG:900916")				           
	       });
  
           vectorLayer.destroyFeatures();
           var featureObject = geojson_format.read(featurecollection);
          
           vectorLayer.addFeatures(featureObject);
           
           map_a.zoomToExtent(vectorLayer.getDataExtent(),false);
           map_a.raiseLayer(vectorLayer, map_a.layers.length);//make vector layer appear on top of all layers
		},
		complete:function(jqXHR, textStatus){
		}
	});
	return false;
}

function loadMUPeriodFeature(mng_period_id){
	var url ='MUnitMapJson.MUPeriodFeature.do?mng_period_id='+mng_period_id;
	$.ajax({
		type : 'GET', // GET or POST
		url : url,  
		async : false,
		beforeSend:function(jqXHR, settings) {
		},
		error : function(errorThrown, status, jqXHR) {
			alert("error:" + errorThrown + ", status:" + status);
		},
		success : function(data, status, jqXHR) { 
		   var featurecollection = jqXHR.responseText;
           var geojson_format = new OpenLayers.Format.GeoJSON({
        	'internalProjection': new OpenLayers.Projection("EPSG:900913"),
			'externalProjection': new OpenLayers.Projection("EPSG:900916")				           
	       });

           vectorLayer.destroyFeatures();
           var featureObject = geojson_format.read(featurecollection);
          
           vectorLayer.addFeatures(featureObject);
           
           map_a.zoomToExtent(vectorLayer.getDataExtent(),false);
           map_a.raiseLayer(vectorLayer, map_a.layers.length);
		},
		complete:function(jqXHR, textStatus){
		}
	});
	return false;
}

/**
* Upon completion of the splitter sketch, look for target polygons to split.
*/
function handleSplitDraw(event) {
   var splitter = event.feature;
   var features = vectorLayer.features;
   var candidates = OpenLayers.Array.filter(vectorLayer.features, function(feature) {
       var hit = false;
       if (feature.geometry.intersects(splitter.geometry)) {
           hit = true;
       }
       return hit;
   });
   var candidate;
   for (var i=0, ii=candidates.length; i<ii; ++i) {
       candidate = candidates[i];
       if (candidate.geometry.intersects(splitter.geometry)) {
       	vectorLayer.removeFeatures([candidate]);
           executeSplit(candidate, splitter);
       }
   }
   return false;
}

function executeSplit(poly, line) {
 	var vertices = line.geometry.getVertices();
	var transformedVertices = [];
	for(var i=0; i < vertices.length; i++){
	    	transformedVertices.push(vertices[i].transform(
	        new OpenLayers.Projection("EPSG:900913"),
	        new OpenLayers.Projection("EPSG:900916")
	    ));
	}
	var lineFeature = new OpenLayers.Geometry.LineString(transformedVertices); 
	var link='';
	if($("#silviculture\\.activityStatus\\.status").val()=='APPROVED'){
		link = "Input.getPlanSplit.do?linestring="+line.geometry+"&activity_id="+$("#activity\\.id").val();
	}else{
		link = "Input.getStandSplit.do?linestring="+line.geometry+"&stand_id="+$("#stand\\.id").val();
	}
// 	 link = "Input.getStandSplit.do?linestring="+line.geometry+"&stand_id="+$("#stand\\.id").val();
	if(link){
		$.ajax({
			type : "GET", // GET or POST
			url : link, // the file to call
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			dataType: "json",
		      data: {
				featureClass: "P",
				style: "full",
				maxRows: 12,
			},
			success : function(data, status, jqXHR) { // on success..
				for(var i=0;i<data.length;i++){
					var features = wkt.read(data[i].geom913);
					vectorLayer.addFeatures(features);
				}
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}
}


function onPlan(feature) {
	var wkt_obj = wkt.write(feature);
	var area ;
	$geometry = null;
	var implBoolean=$("#silviculture\\.activityStatus\\.status").val()=='APPROVED';
	var text="POLYGON is out of stand!!";
	if(implBoolean){
		$geometry = $("#imSlvGeom");
		$area = $("#implArea");
		text="POLYGON is out of plan!!";
	}else{
		$geometry = $("#plSlvGeom");
		$area = $("#silviculture\\.plArea");
	}
	if($geometry){
		var polygonFeature = wkt.read(wkt_obj);
     	polygonFeature.geometry.transform(
			   new OpenLayers.Projection("EPSG:900913"),
    	       new OpenLayers.Projection("EPSG:900916")
		);
     	var result = '';
//      	if(implBoolean){
//      		result = checkPlanContains($("#activity\\.id").val(),polygonFeature.geometry);
//      		if(result!='false' && rowId>implNumber){
// 				result = checkImplOverlap(polygonFeature.geometry,$("#silviculture\\.id").val(),rowId);
// 				text="POLYGON overlaps other implementations!!";
//          	}       	
//          	}else{
//        		result=checkStandContains($("#stand\\.id").val(),polygonFeature.geometry);
//         }
     	
     	if(result=='false'){
     		$.SmartMessageBox({
     			title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> "+text+" <span class='txt-color-orangeDark'></span> ?",
     			//content : $.logoutMSG || "<s:text name='stand.map.overlaped'/><br>"+text ,
				buttons : '[Ok]'
			});	
         }else {
              area = polygonFeature.geometry.getArea();
             $geometry.val(polygonFeature.geometry); 
             var fSiper = (area/10000).toFixed(4);
   			 $area.val(fSiper);
   			 if($("#silviculture\\.activityStatus\\.status").val()=='APPROVED'){
   				setAreaGeom($area.val(),rowId,$geometry.val());
   	   			}
         }
 		
	}

}

function onPlanEnd(feature) {
	var wkt_obj = wkt.write(feature);
	var area ;

	$geometry = null;
	$area = null;
	
// 	if($geometry){
		var polygonFeature = wkt.read(wkt_obj);
     	polygonFeature.geometry.transform(
			   new OpenLayers.Projection("EPSG:900913"),
    	       new OpenLayers.Projection("EPSG:900916")
		);
     	var result = '';
//      	if(implBoolean){
//      		result = checkPlanContains($("#activity\\.id").val(),polygonFeature.geometry);
//      		if(result!='false' && rowId>implNumber){
// 				result = checkImplOverlap(polygonFeature.geometry,$("#silviculture\\.id").val(),rowId);
// 				text="POLYGON overlaps other implementations!!";
//          	} 
//      	   }else{
//        			result = checkStandContains($("#stand\\.id").val(),polygonFeature.geometry);
//      	   }
//      	if(result=='false'){
//      		$.SmartMessageBox({
// 				title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> "+text+" <span class='txt-color-orangeDark'></span> ?",
// //				content : $.logoutMSG || "<s:text name='stand.map.overlaped'/><br>"+text ,
// 				buttons : '[Ok]'
// 			});	
//          }else {
        	 area = polygonFeature.geometry.getArea();
           	 
//              $geometry.val(polygonFeature.geometry); 
          	 
             var fSiper = (area/10000).toFixed(4);
             if( $("#protection\\.unitsMetric\\.name").val()!='ha')
            	 fSiper='';
//    			 $area.val(fSiper);
//     		if(implBoolean){
       			setAreaGeom(fSiper,rowId,polygonFeature.geometry);
//        	   	} 
//          }
 		
// 	}
}

function checkStandContains(stand_id,polygon){
	var result='';
	if(stand_id!='' && polygon!=''){
		$.ajax({
			type : "GET", // GET or POST
			url : "Input.checkStandContains.do?stand_id="+stand_id+"&polygon="+polygon, // the file to call
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			dataType: "json",
               data: {
				featureClass: "P",
				style: "full",
				maxRows: 12,
			},
			success : function(data, status, jqXHR) { // on success..
				result=data.result;
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}
	return result;
}

function checkPlanContains(activity_id,polygon){
	var result='';
	if(activity_id!='' && polygon!=''){
		$.ajax({
			type : "GET", // GET or POST
			url : "Input.checkPlanContains.do?activity_id="+activity_id+"&polygon="+polygon, // the file to call
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			dataType: "json",
               data: {
				featureClass: "P",
				style: "full",
				maxRows: 12,
			},
			success : function(data, status, jqXHR) { // on success..
				result=data.result;
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}
	return result;
}
function checkImplOverlap(polygon,planId,row_id){
	var result='';
	var implArray = $("#silviculture_declare").jqGrid('getRowData');
	var jsonText = JSON.stringify(implArray);
	if(jsonText!='' && polygon!=''){
		$.ajax({
			type : "GET", // GET or POST
			url : "Input.checkImplSlvOverlap.do?implArray="+jsonText+"&polygon="+polygon+"&planId="+planId+"&rowId="+row_id, // the file to call
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			dataType: "json",
            data: {
				featureClass: "P",
				style: "full",
				maxRows: 12,
			},
			success : function(data, status, jqXHR) { // on success..
				if(!jQuery.isEmptyObject(data))
					result=data[0].result;
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}
	return result;
}


function drawLayer(){
$.ajax({
	type : "GET", // GET or POST
	url : "FrmGrid.layerGisData.do?module=PROT", // the file to call
	async : false,
	beforeSend:function(jqXHR, settings) {
	},
	error : function(errorThrown, status, jqXHR) { // on error..
//			alert("error:" + errorThrown + ", status:" + status);
	},
	dataType: "json",
    data: {
		featureClass: "P",
		style: "full",
	},
	success : function(data, status, jqXHR) { // on success..
		if(!jQuery.isEmptyObject(data)){
			for(var i=0;i<data.length;i++){
//					pvtApr.push([j,data[i].number_of_requests]);
				var feutureStructure;
				if(data[i].service_type=='wms'){
					feutureStructure=new OpenLayers.Layer.WMS(
				            ""+data[i].store, data[i].url,
				            {
				                LAYERS: ''+data[i].feature_type_layer,
				                STYLES: '',
				                format: format,
				                tiled: data[i].tiled,
				                srsName: ""+data[i].srs_name,
								transparent: data[i].transparent,
				                tilesOrigin : map_a.maxExtent.left + ',' + map_a.maxExtent.bottom
				            },
				            {
				                buffer: 0,
				                displayOutsideMaxExtent: true,
				                visibility: data[i].visibility,
				                isBaseLayer:  data[i].is_base_layer
				                
				               // yx : {'EPSG:900916' : false}
				            } 
				        );

				}else if(data[i].service_type=='wfs'){
					
					feutureStructure=new OpenLayers.Layer.Vector(
				            ""+data[i].store,
				            {minScale: ''+data[i].min_scale,
				            	strategies: [
			     					// Load existing features
			     					new OpenLayers.Strategy.BBOX()
			       				],
			   					projection : "EPSG:900913",
			   					// Connection parameters for WFS (need to be adjusted to your WFS)
			   					protocol: new OpenLayers.Protocol.WFS({
			   					version: "1.1.0",
			   					srsName: ""+data[i].srs_name,
			   					url: data[i].url,
			   					featureNS : ""+data[i].featurens,
			   					featureType: ""+data[i].feature_type_layer,
			   				    outputFormat: ''+data[i].outputformat, 
			   				    readFormat: new OpenLayers.Format.GeoJSON() 
			   					}),
			   					extractAttributes: true,
			   					visibility: data[i].visibility,
			   					renderers: renderer,
			   					styleMap: styles_wfs
				            } 
						);
				}else if(data[i].service_type=='tms'){
					feutureStructure = new OpenLayers.Layer.WMS(
							""+data[i].featurens,
							//"http://82.114.91.52/giserver/wms",
							 "/tms",
							{layers: ''+data[i].feature_type_layer, format: ''+data[i].outputformat,
							srs: "EPSG:900913"},
							{tileSize: new OpenLayers.Size(data[i].tileSize,data[i].tileSize)},
							{isBaseLayer: data[i].is_base_layer, singleTile: false, buffer: 0, visibility: data[i].visibility}
						);
				}
				mapLayers.push(feutureStructure)
				
			} 
		}
	},
	complete:function(jqXHR, textStatus){
	}
});

}




function init(){
				// World Geodetic System 1984 projection
	var WGS84 = new OpenLayers.Projection("EPSG:4326");
	 // WGS84 Google Mercator projection
	var WGS84_google_mercator = new OpenLayers.Projection("EPSG:900913");
	 // KosovaRef01 Projection 
	var RKS = new OpenLayers.Projection("EPSG:900916");
	
        // if this is just a coverage or a group of them, disable a few items,
        // and default to jpeg format
        format = 'image/png';
    
        var options = {
            	projection: WGS84_google_mercator,
            	displayProjection: RKS,
                maxResolution: 164.662109375,
                units: 'm',
//                scales: [74153,50000,32957,21971,14648,9765,6510,4340,2893,1929,1286,857,572,381,254,169],
                scales: [150000,100000,75000,50000,25000,15000,10000,7500,5000,2500,1500,1000,750,500,250],
            };
    wkt = new OpenLayers.Format.WKT();	
					//Initialize the map
	//creates a new openlayers map in the <div> html element id map
	map_a = new OpenLayers.Map ('map_a', options, {
		controls:[
			new OpenLayers.Control.OverviewMap(),
			new OpenLayers.Control.KeyboardDefaults(),		
			new OpenLayers.Control.ScaleLine(),
			new OpenLayers.Control.Navigation(),
			new OpenLayers.Control.PanZoom(),
			new OpenLayers.Control.LayerSwitcher(),
			new OpenLayers.Control.MousePosition({element: $('location')}),
			new OpenLayers.Control.Scale($('scale'))
		]
	});
	map_a.addControl(new OpenLayers.Control.LayerSwitcher({'div':OpenLayers.Util.getElement('layerswitcherbox')}));
	
	var scale = new OpenLayers.Control.Scale(document.getElementById("scale"));
	map_a.addControl(scale);	
    
    var coordbar = new OpenLayers.Control.MousePosition({
	        'div': document.getElementById("coordbar"),
	        displayProjection: RKS
        });
    map_a.addControl(coordbar);
	
		
	//base layers
	// OSM
	var openstreetmap = new OpenLayers.Layer.OSM();
    
        // setup tiled layer
        fmr = new OpenLayers.Layer.WMS(
            "vgis_mu_period_active", geoserver_url,
            {
                LAYERS: 'kfis_gis:vgis_mu_period_active',
                STYLES: '',
                format: format,
                tiled: true,
				transparent: true,
                tilesOrigin : map_a.maxExtent.left + ',' + map_a.maxExtent.bottom
            },
            {
                buffer: 0,
                displayOutsideMaxExtent: true,
                isBaseLayer: false,
                visibility:false,
                yx : {'EPSG:900916' : false}
            } 
        );
     var   slv_pl = new OpenLayers.Layer.WMS(
                "Pl silviculture", geoserver_url,
                {
                    LAYERS: 'kfis:silviculture_pl_declare',
                    STYLES: '',
                    format: format,
                    tiled: true,
    				transparent: true,
                    tilesOrigin : map_a.maxExtent.left + ',' + map_a.maxExtent.bottom
                },
                {
                    buffer: 0,
                    displayOutsideMaxExtent: true,
                    isBaseLayer: false,
                    visibility:false,
                    yx : {'EPSG:900916' : false}
                } 
            );
    var  slv_im = new OpenLayers.Layer.WMS(
                "Im silviculture", geoserver_url,
                {
                    LAYERS: 'kfis:silviculture_impl_declare',
                    STYLES: '',
                    format: format,
                    tiled: true,
    				transparent: true,
                    tilesOrigin : map_a.maxExtent.left + ',' + map_a.maxExtent.bottom
                },
                {
                    buffer: 0,
                    displayOutsideMaxExtent: true,
                    isBaseLayer: false,
                    visibility:false,
                    yx : {'EPSG:900916' : false}
                } 
            );
			
 
        compartments = new OpenLayers.Layer.WMS(
                "Ngastrat", geoserver_url,
                {
                    layers: 'vgis_comp_active',
			        STYLES: '',
                    srs: 'EPSG:900916',
                    format: format,
                    tiled: false,
                    transparent: true,
                 },
                 {
                    buffer: 0,
                    displayOutsideMaxExtent: true,
                    isBaseLayer: false,
                    yx : {'EPSG:900916' : false},
        			visibility: false
     			}
		);
		stand = new OpenLayers.Layer.WMS(
                "NenNgastrat",geoserver_url,
                {
                    layers: 'vgis_stand_active',
			        STYLES: '',
                    srs: 'EPSG:900916',
                    format: format,
                    tiled: false,
                    transparent: true,
                 },
                 {
                    buffer: 0,
                    displayOutsideMaxExtent: true,
                    isBaseLayer: false,
                    yx : {'EPSG:900916' : false},
        			visibility: true
     			}
		);
        biodiv = new OpenLayers.Layer.WMS(
                "Biodiversity", "https://192.168.0.30:8888/geoserver/kfis_gis/wms",
                {
                    LAYERS: 'kfis_gis:vgis_biodiv_active',
                    STYLES: '',
                    format: format,
                    tiled: true,
					transparent: true,
                    tilesOrigin : map_a.maxExtent.left + ',' + map_a.maxExtent.bottom
                },
                {
                    buffer: 0,
                    displayOutsideMaxExtent: true,
                    isBaseLayer: false,
                    yx : {'EPSG:900916' : false}
                } 
            );
        plots = new OpenLayers.Layer.WMS(
            "Plots", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
            {
                LAYERS: 'kfis_map:plots',
                STYLES: '',
                format: format,
                tiled: true,
				transparent: true,
                tilesOrigin : map_a.maxExtent.left + ',' + map_a.maxExtent.bottom
            },
            {
                buffer: 0,
                displayOutsideMaxExtent: true,
                isBaseLayer: false,
                yx : {'EPSG:900916' : false}
            } 
        );							
		var orto = new OpenLayers.Layer.WMS(
            "ORTOFOTO",gisserver_url,
            {
                layers: 'kaveko:ORTOFOTO',
				STYLES: '',
                srs: 'EPSG:900916',
                format: format,
                tiled: true,
                transparent: true,
                },
                {
                buffer: 0,
                displayOutsideMaxExtent: true,
                isBaseLayer: false,
                yx : {'EPSG:900916' : false},
				visibility: false
            } 
		);

		 vectorLayer =   new OpenLayers.Layer.Vector('Vektori', 
	        		{visibility: true, displayInLayerSwitcher: true, //styleMap: styles,

	                eventListeners: {
	                    // whenever a sketch is complete, consider splitting polys
	                    sketchcomplete: function(event) {
	                        var proceed = true;
	                        if (event.feature.geometry instanceof OpenLayers.Geometry.LineString) {
	                            handleSplitDraw(event);
	                            proceed = false;
	                        }
	                        return proceed;
	                    }
	                }						
        		}
	        );
		 vectorLayerPlan =   new OpenLayers.Layer.Vector('VektoriPlan', 
	        		{visibility: true, displayInLayerSwitcher: false, //styleMap: styles,

	                eventListeners: {
	                    // whenever a sketch is complete, consider splitting polys
	                    sketchcomplete: function(event) {
	                        var proceed = true;
	                        if (event.feature.geometry instanceof OpenLayers.Geometry.LineString) {
	                            handleSplitDraw(event);
	                            proceed = false;
	                        }
	                        return proceed;
	                    }
	                }						
        		}
		            					 
	        );
       // map_a.addLayers([openstreetmap, /* google_maps, google_satellite, google_terrain, */orto, vectorLayer,vectorLayerPlan, /*pedolo, mu,*/ compartments, stand,/*biodiv, plots,*/fmr,slv_pl,slv_im]);
      //ms
        drawLayer();
		var layerArray=[openstreetmap,/*fake,orto, topo,mun, vectorLayer,vectorLayerPlan, vgis_stand_active, vgis_linetemp,/*vgis_comp_active,fmr,linetemp*/];

		for(var i=0;i<mapLayers.length;i++){
			layerArray.push(mapLayers[i]);
			}
	
		map_a.addLayers(layerArray);   
		map_a.addLayer(vectorLayer);
		map_a.addLayer(vectorLayerPlan);

	    //ms           
        nav = new OpenLayers.Control.NavigationHistory();
        // parent control must be added to the map
        map_a.addControl(nav);

        panel1 = new OpenLayers.Control.Panel({'displayClass': 'olControlNavigationHistory', div: document.getElementById("panel1")});
        panel1.addControls([nav.next, nav.previous]);
        map_a.addControl(panel1);
        
        var snapVertex = {methods: ['vertex', 'edge'], layers: [vectorLayer, selectFeature]};
        controlEdit = {
           		deleteShape: new OpenLayers.Control.SelectFeature(
          				vectorLayer, 
          			    {
          			        displayClass: "olControlDelete",
          			        title: '<s:text name='frm.stand.map.feature.deletebtn'/>',
          			        eventListeners: {
          			            featurehighlighted: function overlay_delete(event) {
          			                var feature = event.feature;
          			                if( confirm("<s:text name='frm.stand.map.feature.delete.msg'/>") ) { // prompt
          			                	vectorLayer.removeFeatures( [ feature ] );

          			                }
          			            }
          			        }   
          			    } 
          			),
        		nav1:  new OpenLayers.Control.Navigation(
        				{ 'displayClass': 'olControlNavigation', tooltip: "Zoom In" }),    
            	zoombox: new OpenLayers.Control.ZoomBox(
            			{alwaysZoom:true, 'displayClass': 'olControlZoomBox', tooltip: "Zoom In" }),
                polygon: new OpenLayers.Control.DrawFeature(vectorLayer,
                        OpenLayers.Handler.Polygon,
                        {'displayClass': 'olControlDrawFeaturePolygon',
            			  title: "<s:text name='frm.stand.map.draw.polygin'/>", 
                          handlerOptions: {holeModifier: "altKey"}}
                         ),
                modify: new OpenLayers.Control.ModifyFeature(vectorLayer,
                        {'displayClass': 'olControlModifyFeature',
             	 		title: "<s:text name='frm.stand.map.feature'/>", 
                         snappingOptions: snapVertex,
                         onModification: onPlan,
                         onModificationEnd: onPlanEnd,
                         multipleKey: "shiftKey"
            	}) 
             };
        snap = new OpenLayers.Control.Snapping({
	        layer: vectorLayer,  
	        targets: [vectorLayer],
	        greedy: false
	    });
	    snap.activate(); 
        var wigdet_panel = new OpenLayers.Control.Panel({'displayClass': 'olControlEditingToolbar', 'div': OpenLayers.Util.getElement('mapcontrols')});
        for(var key in controlEdit){
        	wigdet_panel.addControls([controlEdit[key]]);
            }
        map_a.addControl(wigdet_panel );
        selectFeature = new OpenLayers.Layer.Vector("Selection", {
            styleMap: new OpenLayers.Style(OpenLayers.Feature.Vector.style["select"])
        });
  debugger      		 
	// map extent
	var mapextent = new OpenLayers.Bounds(7419294.456, 4634786.121, 7564763.285, 4792623.516).transform(RKS, map_a.getProjectionObject());
	map_a.zoomToExtent(mapextent);
	var lonLat = new OpenLayers.LonLat(7483083.112, 4700630.811).transform(RKS, map_a.getProjectionObject());
    map_a.setCenter(lonLat, 9);	




    function doGetFeatureInfoPopup(evt){
    	if(showInfo){
    		var point = map_a.getLonLatFromPixel(evt.xy);
    		var position = point.transform(new OpenLayers.Projection("EPSG:900913"), new OpenLayers.Projection("EPSG:900916"));
    		
            var params = {
                    BBOX: map_a.getExtent().toBBOX(),
                    lonlat : position,
                    activityType:'SLV',
                    annualPlanId:$("#annualplanId").val(),
                    activeLayer: activeLayerId
                   };
           mouseLoc = map_a.getLonLatFromPixel(evt.xy);
           
           var request = OpenLayers.Request.GET({
        	    url: "MUnitMapJson.infopointHarvPl.do",
        	    data: params,
        	    params: params,
        	    callback: mapInfoHandler
        	});
           OpenLayers.Event.stop(evt);
    	}
    }
     map_a.events.register('click', map_a, function (e) {doGetFeatureInfoPopup(e); });

     function mapInfoHandler(request) {
    		var content = request.responseText;
     	if (content.indexOf('no results') == -1) {
         	popupContentHTML = '<div style="background-color:#E7E7E7;"><s:text name="map.tab.vineyards"/><br>' + content + '</div>';

             var popup_info = content;
    			if (popup != null) {
    			    popup.destroy();
    			    popup = null;
    			}
    			popup = new OpenLayers.Popup.FramedCloud("<s:text name='kaveko.map.info.vineyeard'/>", mouseLoc,
             	new OpenLayers.Size(250,120), popup_info, null, true);
    			popup.setBackgroundColor("#bcd2ee");
    			map_a.addPopup(popup);
    			popup.events.register("click", map_a, popupDestroy);
        }	
    	    
    	}
    	
     function popupDestroy(e) {
     	if (popup != null) {
     		popup.destroy();
     		popup = null;
     	}
     	e.stopPropagation();
     }
     	

     	
    
    var polyg_button="<s:text name='frm.stand.map.draw.polygin'/>";
    $("div[title=\""+polyg_button+"\"]").on('click',function(){
		for(var i=0;vectorLayer.features.length>i;i++){
			var feature = vectorLayer.features[i];
	    	var wkt_w = wkt.write(feature); 
	    	var wkt_f=wkt.read(wkt_w);
	    	vectorLayerPlan.addFeatures(wkt_f);
		}
		if($("#protection\\.activityStatus\\.status").val()=='APPROVED'){
 			addRow();
		}
    	vectorLayer.destroyFeatures();
        map_a.raiseLayer(vectorLayerPlan, map_a.layers.length);//make vector layer appear on top of all layers
    });

    var modify_button="<s:text name='frm.stand.map.feature'/>";
    $("div[title=\""+modify_button+"\"]").on('click',function(){
        if(vectorLayerPlan.features.length>0 && vectorLayer.features.length<=0){
        	vectorLayer.destroyFeatures();
	        for(var i=0;vectorLayerPlan.features.length>i;i++){
				var feature = vectorLayerPlan.features[i];
		    	var wkt_w = wkt.write(feature); 
		    	var wkt_f=wkt.read(wkt_w);
		    	vectorLayer.addFeatures(wkt_f);
			}
	    	
	        vectorLayerPlan.destroyFeatures();
	        map_a.raiseLayer(vectorLayer, map_a.layers.length);//make vector layer appear on top of all layers
        }
    });
    
 }


function initSnap() {
    // add behavior to snap elements
    var snapCheck = document.getElementById("snap_toggle");
    snapCheck.checked = true;
    snapCheck.onclick = function() {
        if(snapCheck.checked) {
            snap.activate();
            document.getElementById("snap_options").style.display = "block";
        } else {
            snap.deactivate();
            document.getElementById("snap_options").style.display = "none";
        }
    };
    
    var target, type, tog, tol;
    var types = ["node", "vertex", "edge"];
    for(var i=0; i<snap.targets.length; ++i) {
        target = snap.targets[i];
        for(var j=0; j<types.length; ++j) {
            type = types[j];
            tog = document.getElementById(i + "_" + type);
            tog.checked = target[type];
            tog.onclick = (function(tog, type, target) {
                return function() {target[type] = tog.checked;}
            })(tog, type, target);
            tol = document.getElementById(i + "_" + type + "Tolerance");
            tol.value = target[type + "Tolerance"];
            tol.onchange = (function(tol, type, target) {
                return function() {
                    target[type + "Tolerance"] = Number(tol.value) || 0;
                }
            })(tol, type, target);
        }
    }
}
var projectionSelect = $('#projection');
projectionSelect.on('change', function() {
		 var coordbar = new OpenLayers.Control.MousePosition({
	        'div': document.getElementById("coordbar"),
	         displayProjection: projectionSelect.val()
	      });
	    map_a.addControl(coordbar);
});

</script>
<div  id="map_a" class="map_a"></div>
</body>
</html>