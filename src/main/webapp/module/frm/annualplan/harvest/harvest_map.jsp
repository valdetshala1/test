<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body> 
<script type="text/javascript">
var map_a, editor;
var orto,  pedolo, mu, compartments, stand, biodiv ,plots, fmr;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";
var vectorLayer,vectorLayerPlan;
var selectFeature;
var harv_pl, harv_im;
var showInfo=false;
var mapLayers=[];
function getGeo(process_array){
    var geo;
	var geopost = OpenLayers.Request.POST({
        	url: "/geoserver/wps",
        	async: false,
            data: new OpenLayers.Format.WPSExecute().write(process_array),
            success: function(response) {
              	var features = new OpenLayers.Format.WKT().read(response.responseText);
            	console.log(features);
	            geo = features.geometry;
            }
      });
    return geo;	
 }
var wktFormat = new OpenLayers.Format.WKT();
var wpsFormat = new OpenLayers.Format.WPSExecute();


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
	if($("#standharvest\\.activityStatus\\.status").val()=='TERRAIN_DONE'){
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

/**
 * Upon completion of the splitter sketch, look for target polygons to split.
 */
 
function onModificationEnd(feature) {
	var wkt_obj = wkt.write(feature);
	$geometry = null;
	if($("#standharvest\\.activityStatus\\.status").val()=='TERRAIN_DONE'){
		$geometry = $("#imMultipolygon");
		
	}else{
		$geometry = $("#plMultipolygon");
	}
	$stand_geom=$("#stand\\.theGeom").val();
	if($geometry){
		var polygonFeature = wkt.read(wkt_obj);
     	polygonFeature.geometry.transform(
			   new OpenLayers.Projection("EPSG:900913"),
    	       new OpenLayers.Projection("EPSG:900916")
			   ); 
//      	var text = checkStandContains($stand_geom,polygonFeature.geometry);
		var result="";
		var harvStatus=$("#standharvest\\.activityStatus\\.status").val();
    	if(harvStatus=='TERRAIN_DONE'){
    		result=checkPlanContains($("#activity\\.id").val(),polygonFeature.geometry);
       	}else{
       		result=checkStandContains($("#stand\\.id").val(),polygonFeature.geometry);
        }
     	if(result=="false"){
         	var resultText="";
         	if(harvStatus=='TERRAIN_DONE'){
        		resultText='Planed area';
             	}else{
             		resultText='Stand';
             	}
    		$.SmartMessageBox({
				title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> "+resultText+" doesn't contain <span class='txt-color-orangeDark'><strong>POLYGON </strong></span> ?",
				buttons : '[OK]',
				icon : "fa fa-bell"
			});
         }else{
            $geometry.val(polygonFeature.geometry); 
         }
  			
	}
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

function onPlan(feature) {
	var wkt_obj = wkt.write(feature);
	$geometry = null;
	if($("#standharvest\\.activityStatus\\.status").val()=='TERRAIN_DONE'){
		$geometry = $("#imMultipolygon");
		
	}else{
		$geometry = $("#plMultipolygon");
	}
	$stand_geom=$("#stand\\.theGeom").val();
	if($geometry){
		var polygonFeature = wkt.read(wkt_obj);
     	polygonFeature.geometry.transform(
			   new OpenLayers.Projection("EPSG:900913"),
    	       new OpenLayers.Projection("EPSG:900916")
			   ); 
//      	var text = checkStandContains($stand_geom,polygonFeature.geometry);
		var result="";
		var harvStatus=$("#standharvest\\.activityStatus\\.status").val();
    	if(harvStatus=='TERRAIN_DONE'){
    		result=checkPlanContains($("#activity\\.id").val(),polygonFeature.geometry);
       	}else{
       		result=checkStandContains($("#stand\\.id").val(),polygonFeature.geometry);
        }
     	if(result=="false"){
         	var resultText="";
         	if(harvStatus=='TERRAIN_DONE'){
        		resultText='Planed area';
             	}else{
             		resultText='Stand';
             	}
    		$.SmartMessageBox({
				title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> "+resultText+" doesn't contain <span class='txt-color-orangeDark'><strong>POLYGON </strong></span> ?",
				buttons : '[OK]',
				icon : "fa fa-bell"
			});
         }else{ 
            $geometry.val(polygonFeature.geometry); 
         }
  			
	}
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


var map_a, oleeditor, editor, mcontrol, wfs, wkt, layerSwitcher, mapPanel, drawControls, vectors,  
features, format, popup, bounds, pureCoverage = false;
	var snap, poly, draw, drawsnap, modify, line, point,popupVine;
	var isDtmActive, isTexturaActive, activeLayerId;
	var measureControls; 
	var lyr0, swipe;
	var vectors, panel, controls;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";

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
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}
	function loadPlHarvFeature(harvId){
		var url ='MUnitMapJson.plHarvFeature.do?harv_id=' +harvId;
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
	function loadImHarvFeature(harvId){
		var url ='MUnitMapJson.imHarvFeature.do?harv_id=' +harvId;
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

	           vectorLayerPlan.destroyFeatures();
	           var featureObject = geojson_format.read(featurecollection);
	          
	           vectorLayerPlan.addFeatures(featureObject);
	           
	           map_a.zoomToExtent(vectorLayerPlan.getDataExtent(),false);
	           map_a.raiseLayer(vectorLayerPlan, map_a.layers.length);//make vector layer appear on top of all layers
			},
			complete:function(jqXHR, textStatus){
			}
		});
		return false;
	}
	
	function loadBiodivFeature(biodivId){
		var url ='MUnitMapJson.biodivFeature.do?biodiv_id=' +biodivId;
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
				},
				complete:function(jqXHR, textStatus){
				}
			});
	}	



	function drawLayer(){
	$.ajax({
		type : "GET", // GET or POST
		url : "FrmGrid.layerGisData.do?module=HRV", // the file to call
		async : false,
		beforeSend:function(jqXHR, settings) {
		},
		error : function(errorThrown, status, jqXHR) { // on error..
//				alert("error:" + errorThrown + ", status:" + status);
		},
		dataType: "json",
        data: {
			featureClass: "P",
			style: "full",
		},
		success : function(data, status, jqXHR) { // on success..
			if(!jQuery.isEmptyObject(data)){
				for(var i=0;i<data.length;i++){
//						pvtApr.push([j,data[i].number_of_requests]);
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
	map_a = new OpenLayers.Map ('map_act', options, {
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
	
    //map = new OpenLayers.Map('map_act', options);
		
	//base layers
	// OSM
	var openstreetmap = new OpenLayers.Layer.OSM();
	//Google Maps
/*			
		var google_maps = new OpenLayers.Layer.Google("Google Maps", {numZoomLevels: 20});
	//Google Satellite
	var google_satellite = new OpenLayers.Layer.Google("Google Satellite", {type: google.maps.MapTypeId.SATELLITE, numZoomLevels: 20});				
     // terrain  
	var google_terrain = new OpenLayers.Layer.Google("Google terrain", {type: google.maps.MapTypeId.TERRAIN, numZoomLevels: 20});				 
*/
	//Bing Maps
	
//	var road = new OpenLayers.Layer.Bing({
//        name: "Bing Road",
//        key: apiKey,
//        type: "Road"
//    });
//	var hybrid = new OpenLayers.Layer.Bing({
//        name: "Bing Hybrid",
//        key: apiKey,
//        type: "AerialWithLabels"
//    });
//    var aerial = new OpenLayers.Layer.Bing({
//        name: "Bing Aerial",
//        key: apiKey,
//        type: "Aerial"
//    });
    
        // setup tiled layer
        fmr = new OpenLayers.Layer.WMS(
            "vgis_mu_period_active",geoserver_url,
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
                yx : {'EPSG:900916' : false}
            } 
        );
//         pedolo = new OpenLayers.Layer.WMS(
//             "Soils", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
//             {
//                 LAYERS: 'kfis_map:pedolo',
//                 STYLES: '',
//                 format: format,
//                 tiled: true,
// 				transparent: true,
//                 tilesOrigin : map_a.maxExtent.left + ',' + map_a.maxExtent.bottom
//             },
//             {
//                 buffer: 0,
//                 displayOutsideMaxExtent: true,
//                 isBaseLayer: false,
//                 yx : {'EPSG:900916' : false},
// 				visibility: false
//             } 
//         );				
        compartments = new OpenLayers.Layer.WMS(
            "Compartments", geoserver_url,
            {
                LAYERS: 'vgis_comp_active',
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
        stand = new OpenLayers.Layer.WMS(
            "Stands", geoserver_url,
            {
                LAYERS: 'vgis_stand_active',
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
      harv_pl = new OpenLayers.Layer.WMS(
                "Pl Harvest", geoserver_url,
                {
                    LAYERS: 'kfis_gis:vgis_activity_har_pl_ac',
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
      harv_im = new OpenLayers.Layer.WMS(
                "Im Harvest", geoserver_url,
                {
                    LAYERS: 'kfis_gis:vgis_activity_har_im_ac',
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
        biodiv = new OpenLayers.Layer.WMS(
                "Biodiversity",geoserver_url,
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
            "Plots", gisserver_url,
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
            "ORTOFOTO", gisserver_url,
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
 //       map_a.addLayers([openstreetmap, /* google_maps, google_satellite, google_terrain, */orto, vectorLayer,  compartments, stand,harv_pl,harv_im,vectorLayerPlan/**biodiv, plots**/,fmr]);
      //ms
        drawLayer();
		var layerArray=[openstreetmap];

		for(var i=0;i<mapLayers.length;i++){
			layerArray.push(mapLayers[i]);
			}
	
		map_a.addLayers(layerArray); 
		map_a.addLayer(vectorLayer);
		map_a.addLayer(vectorLayerPlan);

	    //ms   

        //     editor = new OpenLayers.Editor(map, {
//        activeControls: ['Navigation', 'SnappingSettings', 'SplitFeature', 'MergeFeature', 'CleanFeature', 'CADTools', 'TransformFeature', 'Separator', 'DeleteFeature', 'DragFeature', 'SelectFeature', 'Separator', 'DrawHole', 'ModifyFeature', 'Separator'],
//        featureTypes: ['regular', 'polygon', 'path', 'point']
//    });
//    editor.startEditMode();
        
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
        		line: new OpenLayers.Control.DrawFeature(vectorLayer,
                        OpenLayers.Handler.Path,
                        {'displayClass': 'olControlDrawFeaturePath',
            			title: "<s:text name='frm.stand.map.draw.line'/>", 
            			id:"split",
                        handlerOptions: snapVertex}),
                polygon: new OpenLayers.Control.DrawFeature(vectorLayer,
                        OpenLayers.Handler.Polygon,
                        {'displayClass': 'olControlDrawFeaturePolygon',
            			title: "<s:text name='frm.stand.map.draw.polygin'/>", 
            			id:"polygon",
                         handlerOptions: snapVertex}),
//                union: new OpenLayers.Control.SelectFeature(vectorLayer,
//	                       {'displayClass': 'olControlSaveFeatures',
//   	                   title: "<s:text name='frm.stand.map.merge'/>", 
//   	                   id:"union",
//   	            	   clickout: true, toggle: true,
//   	                   multiple: true, hover: false,
//   	                   toggleKey: "ctrlKey", // ctrl key removes from selection
//   	                   multipleKey: "shiftKey"}),
                modify: new OpenLayers.Control.ModifyFeature(vectorLayer,
                        {'displayClass': 'olControlModifyFeature',
             	 		title: "<s:text name='frm.stand.map.feature'/>", 
                         snappingOptions: snapVertex,
                         onModification: onPlan,
                         onModificationEnd: onModificationEnd
            	}) 
           
             };

        
        var wigdet_panel = new OpenLayers.Control.Panel({'displayClass': 'olControlEditingToolbar', 'div': OpenLayers.Util.getElement('mapcontrols')});
        for(var key in controlEdit){
        	wigdet_panel.addControls([controlEdit[key]]);
            }
        map_a.addControl(wigdet_panel );
        selectFeature = new OpenLayers.Layer.Vector("Selection", {
            styleMap: new OpenLayers.Style(OpenLayers.Feature.Vector.style["select"])
        });
    			 
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
	                activityType:'HAR',
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
    	vectorLayer.destroyFeatures();
        map_a.raiseLayer(vectorLayerPlan, map_a.layers.length);//make vector layer appear on top of all layers
    });

    var split_button="<s:text name='frm.stand.map.draw.line'/>";
    $("div[title=\""+split_button+"\"]").on('click',function(){
        if(vectorLayerPlan.features.length>0){
        	alert("destroyFeatures");
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

    var projectionSelect = $('#projection');
	projectionSelect.on('change', function() {
 		 var coordbar = new OpenLayers.Control.MousePosition({
  	        'div': document.getElementById("coordbar"),
 	         displayProjection: projectionSelect.val()
  	      });
 	    map_a.addControl(coordbar);
	});
    

</script>
</body>
</html>