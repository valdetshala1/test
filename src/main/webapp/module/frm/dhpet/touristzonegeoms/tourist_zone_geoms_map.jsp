<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache_session.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
    $(window).load(function(){
    });
</script>
<script type="text/javascript">
var map, editor;
var orto,  mu, compartments, stand, plots, fmr;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";
var vectorLayer;
var selectFeature;
var splitFeature="";
var sel_wfs_features = [];
var vgis_stand_active;
var vgis_comp_active;
var snap;
var featureEdit;
var showInfo=false;
var mapLayers=[];

OpenLayers.ProxyHost = 'proxy.cgi?url=<%=session.getAttribute("proxy_cgi")%>'; 

function getGeo(process_array){
    var geo;
	var geopost = OpenLayers.Request.POST({
        	url: "/geoserver/wps",
        	async: false,
            data: new OpenLayers.Format.WPSExecute().write(process_array),
            success: function(response) {
            	console.log(response.responseText);
              	var features = new OpenLayers.Format.WKT().read(response.responseText);
            	console.log(features);
	            geo = features.geometry;
            }
      });
    return geo;	
 }
var wktFormat = new OpenLayers.Format.WKT();
var wpsFormat = new OpenLayers.Format.WPSExecute();

	function onModification(feature) {
		var wkt_obj = wkt.write(feature);
		var area;
		console.log("onModificationEnd: " + wkt_obj);
		$geometry = $("#geometry");
		$area = $("#touristZoneGeoms\\.area");
		if($geometry){
	     	var polygonFeature = wkt.read(wkt_obj);
	     	polygonFeature.geometry.transform(
				   new OpenLayers.Projection("EPSG:900913"),
	    	       new OpenLayers.Projection("EPSG:900916")
				   ); 
	     	var text = getOverlapTourstZoneGeoms(polygonFeature.geometry);
	     	if(text){
	     		$.SmartMessageBox({
					title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> <s:text name='global.map.overlap.polygon'/> <span class='txt-color-orangeDark'><strong><s:text name='dhpet.tourist.zone.geoms.title'/> </strong></span> ?",
					content : $.logoutMSG || "<s:text name='fal.request.overlap'/><br>"+text ,
					buttons : '[Ok]'
				});	
	         }else{
	        	area = polygonFeature.geometry.getArea();
	            $geometry.val(polygonFeature.geometry); 
	            	 	
	   			var fSiper = (area/10000).toFixed(4);
	   			$area.val(fSiper);
	         }
		}
	}

	function onModificationEnd(feature) {
		var wkt_obj = wkt.write(feature);
		var area;
		console.log("onModificationEnd: " + wkt_obj);
		$geometry = $("#geometry");
		$area = $("#touristZoneGeoms\\.area");
		if($geometry){
	     	var polygonFeature = wkt.read(wkt_obj);
	     	polygonFeature.geometry.transform(
				   new OpenLayers.Projection("EPSG:900913"),
	    	       new OpenLayers.Projection("EPSG:900916")
				   ); 
	     	var text = getOverlapTourstZoneGeoms(polygonFeature.geometry);
	     	if(text){
	     		$.SmartMessageBox({
					title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> <s:text name='global.map.overlap.polygon'/> <span class='txt-color-orangeDark'><strong><s:text name='dhpet.tourist.zone.geoms.title'/> </strong></span> ?",
					content : $.logoutMSG || "<s:text name='fal.request.overlap'/><br>"+text ,
					buttons : '[Ok]'
				});
	         }else{
	        	area = polygonFeature.geometry.getArea();
	            $geometry.val(polygonFeature.geometry); 
	            	
	   			var fSiper = (area/10000).toFixed(4);
	   			$area.val(fSiper);
	         }
		}
	}

function getOverlapTourstZoneGeoms(polygonFeature){
	var touristZoneGeomsId = new Array();
	var area = new Array();
	var link;
	if(polygonFeature){
		link = "TouristZoneGeomsGrid.getOverlapTourstZoneGeoms.do?polygon="+polygonFeature+"&tourist_zone_geoms_id="+$("#touristZoneGeoms\\.id").val();
    }
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
						touristZoneGeomsId[i]=data[i].touristZoneGeomsId;
						area[i]=(data[i].area/10000).toFixed(2);
						}
				},
				complete:function(jqXHR, textStatus){
				}
			});
         	var text="" ;
         	for(var i=0;i<touristZoneGeomsId.length;i++){
            	text = text +"<s:text name='dhpet.tourist.zone.geoms.title'/> :"+touristZoneGeomsId[i]+" <s:text name='dhpet.animal.capacity.label.area'/> :"+area[i]+" ha<br>";
             }
	}
	return text;
} 



var map, oleeditor, editor, mcontrol, wfs, wkt, layerSwitcher, drawControls, vectors,  
features, format, popup, bounds, pureCoverage = false;
	var  poly, draw, drawsnap, modify, line, point,popupVine;
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

function loadTouristZoneGeomsFeature(touristZoneGeomsId){
	var url ='MUnitMapJson.touristZoneGeoms.do?touristZoneGeomsId=' +touristZoneGeomsId;
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
		       
	           featureEdit.destroyFeatures();
	           vectorLayer.destroyFeatures();
	           var featureObject = geojson_format.read(featurecollection);
	           var wsss = wkt.write(featureObject);
	           vectorLayer.addFeatures(featureObject);
	           
	           map.zoomToExtent(vectorLayer.getDataExtent(),false);
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}



function drawLayer(){
$.ajax({
	type : "GET", // GET or POST
	url : "FrmGrid.layerGisData.do?module=TRZM", // the file to call
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
				                tilesOrigin : map.maxExtent.left + ',' + map.maxExtent.bottom
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
            maxResolution: 164.662109375,
            units: 'm',
            scales: [74153,50000,32957,21971,14648,9765,6510,4340,2893,1929,1286,857,572,381,254,169],
        };
        wkt = new OpenLayers.Format.WKT();	
					//Initialize the map
	//creates a new openlayers map in the <div> html element id map
	map = new OpenLayers.Map ('map_tzg', options, {
		controls:[
			new OpenLayers.Control.OverviewMap(),
			new OpenLayers.Control.KeyboardDefaults(),		
//			new OpenLayers.Control.ScaleLine(),
//			new OpenLayers.Control.Navigation(),
//			new OpenLayers.Control.PanZoom(),
			new OpenLayers.Control.LayerSwitcher(),
			new OpenLayers.Control.MousePosition({element: $('location')}),
			new OpenLayers.Control.Scale($('scale_tzg'))
		],
		projection: WGS84_google_mercator,
		displayProjection: RKS
	});
	map.addControl(new OpenLayers.Control.LayerSwitcher({'div':OpenLayers.Util.getElement('layerswitcherbox')}));
    //map = new OpenLayers.Map('map_tzg', options);
		
	var scale = new OpenLayers.Control.Scale(document.getElementById("scale_tzg"));
    map.addControl(scale);	

    var coordbar = new OpenLayers.Control.MousePosition({
        'div': document.getElementById("coordbar"),
        displayProjection:RKS
        });
    map.addControl(coordbar);
    
  
	//base layers
	// OSM
	var openstreetmap = new OpenLayers.Layer.OSM();
	
	var styles = new OpenLayers.StyleMap({
        "default": new OpenLayers.Style(null, {
            rules: [
                new OpenLayers.Rule({
                    symbolizer: {
                        "Point": {
                            pointRadius: 5,
                            graphicName: "square",
                            fillColor: "white",
                            fillOpacity: 0.25,
                            strokeWidth: 1,
                            strokeOpacity: 1,
                            strokeColor: "#3333aa"
                        },
                        "Line": {
                            strokeWidth: 3,
                            strokeOpacity: 1,
                            strokeColor: "#00ff00"
                        },
                        "Polygon": {
                            strokeWidth: 1,
                            strokeOpacity: 1,
                            fillColor: "#00ff00",
							fillOpacity: 0.15,
                            strokeColor: "#00ff00"
                        }
                    }
                })
            ]
        }),
        "select": new OpenLayers.Style(null, {
            rules: [
                new OpenLayers.Rule({
                    symbolizer: {
                        "Point": {
                            pointRadius: 5,
                            graphicName: "square",
                            fillColor: "white",
                            fillOpacity: 0.25,
                            strokeWidth: 2,
                            strokeOpacity: 1,
                            strokeColor: "red"
                        },
                        "Line": {
                            strokeWidth: 3,
                            strokeOpacity: 1,
                            strokeColor: "#0000ff"
                        },
                        "Polygon": {
                            strokeWidth: 2,
                            strokeOpacity: 1,
                            fillColor: "red",
                            strokeColor: "red"
                        }
                    }
                })
            ]
        }),
        "temporary": new OpenLayers.Style(null, {
            rules: [
                new OpenLayers.Rule({
                    symbolizer: {
                        "Point": {
                            graphicName: "square",
                            pointRadius: 5,
                            fillColor: "white",
                            fillOpacity: 0.25,
                            strokeWidth: 2,
                            strokeColor: "#0000ff"
                        },
                        "Line": {
                            strokeWidth: 3,
                            strokeOpacity: 1,
                            strokeColor: "#0000ff"
                        },
                        "Polygon": {
                            strokeWidth: 2,
                            strokeOpacity: 1,
                            strokeColor: "#0000ff",
                            fillColor: "#0000ff"
                        }
                    }
                })
            ]
        })
    });
	
	var defStyle = {strokeColor: "blue", strokeOpacity: "0.7", strokeWidth: 2, fillColor: "blue", pointRadius: 3, cursor: "pointer"};
    var sty = OpenLayers.Util.applyDefaults(defStyle, OpenLayers.Feature.Vector.style["select"]);
    var sm = new OpenLayers.StyleMap({
        'default': sty,
        'select': {strokeColor: "red", fillColor: "red"}
    });
    
    var styles_wfs = new OpenLayers.StyleMap({
        "default": new OpenLayers.Style(null, {
            rules: [
                new OpenLayers.Rule({
                    symbolizer: {
                        "Point": {
                            pointRadius: 5,
                            graphicName: "circle",
                            fillColor: "white",
                            fillOpacity: 0.25,
                            strokeWidth: 1,
                            strokeOpacity: 1,
                            strokeColor: "red"
                        },
                        "Line": {
                            strokeWidth: 3,
                            strokeOpacity: 1,
                            strokeColor: "green"
                        },
                        "Polygon": {
                            strokeWidth: 1,
                            strokeOpacity: 1,
                            fillColor: "red ",
                            strokeColor: "black"
                        }
                    }
                })
            ]
        }),
        "select": new OpenLayers.Style(null, {
            rules: [
                new OpenLayers.Rule({
                    symbolizer: {
                        "Point": {
                            pointRadius: 5,
                            graphicName: "trangle",
                            fillColor: "white",
                            fillOpacity: 0.25,
                            strokeWidth: 2,
                            strokeOpacity: 1,
                            strokeColor: "#0000ff"
                        },
                        "Line": {
                            strokeWidth: 3,
                            strokeOpacity: 1,
                            strokeColor: "#0000ff"
                        },
                        "Polygon": {
                            strokeWidth: 2,
                            strokeOpacity: 1,
                            fillColor: "#0000ff",
                            strokeColor: "#0000ff"
                        }
                    }
                })
            ]
        }),
        "temporary": new OpenLayers.Style(null, {
            rules: [
                new OpenLayers.Rule({
                    symbolizer: {
                        "Point": {
                            graphicName: "square",
                            pointRadius: 5,
                            fillColor: "white",
                            fillOpacity: 0.25,
                            strokeWidth: 2,
                            strokeColor: "#0000ff"
                        },
                        "Line": {
                            strokeWidth: 3,
                            strokeOpacity: 1,
                            strokeColor: "#0000ff"
                        },
                        "Polygon": {
                            strokeWidth: 2,
                            strokeOpacity: 1,
                            strokeColor: "#0000ff",
                            fillColor: "#0000ff"
                        }
                    }
                })
            ]
        })
    });
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

		// allow testing of specific renderers via "?renderer=Canvas", etc
        var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
        renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

		var geoserver_url = "<%=session.getAttribute("geoserver_url")%>";
		var geoserver_url_wfs = "<%=session.getAttribute("geoserver_url_wfs")%>";
		var gisserver_url = "<%=session.getAttribute("gisserver_url")%>";
        // setup tiled layer
        fmr = new OpenLayers.Layer.WMS(
            "Zonat turistike", geoserver_url,
            {
                LAYERS: 'kfis:dhpet_tourist_zone_geoms',
                STYLES: '',
                format: format,
                tiled: true,
				transparent: true,
                tilesOrigin : map.maxExtent.left + ',' + map.maxExtent.bottom
            },
            {
                buffer: 0,
                displayOutsideMaxExtent: true,
                isBaseLayer: false,
                yx : {'EPSG:900916' : false}
            } 
        );
       // 
// 		var orto33 = new OpenLayers.Layer.WMS(
//             "ORTOFOTO", "https://apps.geoland-kosova.com/giserver/kaveko/wms",
//             {
//                 layers: 'ORTOFOTO',
// 				STYLES: '',
//                 srs: 'EPSG:900913',
//                 format: format,
//                 tiled: true,
//                 transparent: true,
//                 },
//                 {
//                 buffer: 0,
//                 displayOutsideMaxExtent: true,
//                 isBaseLayer: false,
//                 yx : {'EPSG:900913' : false},
// 				visibility: false
//             } 
// 		);
		var orto = new OpenLayers.Layer.WMS(
				"ORTOFOTO 2012",
				"http://192.168.0.2:8888/geoserver/kaveko/wms",
				{layers: "ORTOFOTO",
				format: "image/png",
				transparent: "true", 
				srsName: "EPSG:900916",
				srs: "EPSG:900916"},
				{isBaseLayer: false, singleTile: false, buffer: 0, visibility: true}
			);

		vgis_comp_active = new OpenLayers.Layer.WMS(
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
		var standsWms = new OpenLayers.Layer.WMS(
	            "Nenngastrat", geoserver_url,
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
					visibility: false
	            } 
			);
		vgis_stand_active = new OpenLayers.Layer.Vector(
	            "Kap pikat e nngastres",
	            {minScale: '15000',
	            	strategies: [
     					// Load existing features
     					new OpenLayers.Strategy.BBOX()
       				],
   					projection : "EPSG:900913",
   					// Connection parameters for WFS (need to be adjusted to your WFS)
   					protocol: new OpenLayers.Protocol.WFS({
   					version: "1.1.0",
   					srsName: "EPSG:900913",
   					url: geoserver_url_wfs,
   					featureNS : "http://apps.geoland-kosova.com/kfis",
   					featureType: "vgis_stand_active",
   				    outputFormat: 'json', 
   				    readFormat: new OpenLayers.Format.GeoJSON() 
   					}),
   					extractAttributes: true,
   					visibility: false,
   					renderers: renderer,
   					styleMap: styles_wfs
	            } 
			);

			vgis_stand_active.events.on({
				featureselected: function(event) {
			        var feature = event.feature;
			        sel_wfs_features.push(feature);
					for(var i=0;i<sel_wfs_features.length;i++){
						console.log(sel_wfs_features[i].attributes.id);
					}	
			    }
			});	
	
			//select.removeFeatures([e.feature]); 
			vgis_stand_active.events.on({
				featureunselected: function(event) {
					var feature = event.feature;
					sel_wfs_features.pop(feature);
					for(var i=0;i<sel_wfs_features.length;i++){
						console.log(sel_wfs_features[i].attributes.id);
					}						
				}
			});
			
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

		 featureEdit =   new OpenLayers.Layer.Vector('Vektori', 
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
//        map.addLayers([openstreetmap,orto, vectorLayer,featureEdit,standsWms, vgis_stand_active,vgis_comp_active,fmr]);
      //ms
        drawLayer();
		var layerArray=[openstreetmap/*fake,orto, topo,mun vectorLayer,featureEdit, vgis_stand_active, vgis_linetemp,/*vgis_comp_active,fmr,linetemp*/];

		for(var i=0;i<mapLayers.length;i++){
			layerArray.push(mapLayers[i]);
			}
	
		map.addLayers(layerArray);   
		map.addLayer(vectorLayer); 
		map.addLayer(featureEdit);   

	    //ms           
        nav = new OpenLayers.Control.NavigationHistory();
        // parent control must be added to the map
        map.addControl(nav);

        panel1 = new OpenLayers.Control.Panel({'displayClass': 'olControlNavigationHistory', div: document.getElementById("panel1")});
        panel1.addControls([nav.next, nav.previous]);
        map.addControl(panel1);
        
        var snapVertex = {methods: ['vertex', 'edge'], layers: [vectorLayer, vgis_stand_active]};
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
            	length: new OpenLayers.Control.DynamicMeasure(
		        	OpenLayers.Handler.Path,  {'displayClass': 'olControlDynamicMeasureLength', title:'Measure lenght'}),
		        
				area: new OpenLayers.Control.DynamicMeasure(OpenLayers.Handler.Polygon, {
			 			'displayClass': 'olControlDynamicMeasureArea'
	        		 }), 
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
                         handlerOptions: {holeModifier: "altKey"}}),
                union: new OpenLayers.Control.SelectFeature(vgis_stand_active,
	                       {'displayClass': 'olControlMergeFeatures',
   	                   title: "<s:text name='frm.stand.map.merge'/>", 
   	                   id:"union",
   	            	   clickout: true, toggle: true,
   	                   multiple: true, hover: false,
   	                   toggleKey: "ctrlKey", // ctrl key removes from selection
   	                   multipleKey: "shiftKey"}),
                modify: new OpenLayers.Control.ModifyFeature(vectorLayer,
                        {'displayClass': 'olControlModifyFeature',
             	 		title: "<s:text name='frm.stand.map.feature'/>", 
                         snappingOptions: snapVertex,
                         onModification: onModification,
                         onModificationEnd: onModificationEnd
            	}) 
           
             };
        snap = new OpenLayers.Control.Snapping({
	        layer: vectorLayer,
	        targets: [vectorLayer, vgis_stand_active],
	        greedy: false
	    });
	    snap.activate(); 

        
        var wigdet_panel = new OpenLayers.Control.Panel({'displayClass': 'olControlEditingToolbar', 'div': OpenLayers.Util.getElement('mapcontrols')});
        for(var key in controlEdit){
        	wigdet_panel.addControls([controlEdit[key]]);
            }
        map.addControl(wigdet_panel );
        selectFeature = new OpenLayers.Layer.Vector("Selection", {
            styleMap: new OpenLayers.Style(OpenLayers.Feature.Vector.style["select"])
        });
    			 
		// map extent
		var mapextent = new OpenLayers.Bounds(7419294.456, 4634786.121, 7564763.285, 4792623.516).transform(RKS, map.getProjectionObject());
		map.zoomToExtent(mapextent);
		var lonLat = new OpenLayers.LonLat(7483083.112, 4700630.811).transform(RKS, map.getProjectionObject());
	    map.setCenter(lonLat, 9);		
	    
	
	    // START feature info popup 
	    map.events.register('click', map, function (e) {doGetFeatureInfoPopup(e); });
	    var select = new OpenLayers.Layer.Vector("Selection", {
            styleMap: new OpenLayers.Style(OpenLayers.Feature.Vector.style["select"])
        });
        
        var scontrol = new OpenLayers.Control.GetFeature({
            protocol: OpenLayers.Protocol.WFS.fromWMSLayer(standsWms),
            box: true,
            hover: false,
            multipleKey: "shiftKey",
            toggleKey: "ctrlKey"
        });
        scontrol.events.register("featureselected", this, function (e) {
            select.addFeatures([e.feature]);
        });
        scontrol.events.register("featureunselected", this, function (e) {
            select.removeFeatures([e.feature]);
        });

        scontrol.events.register("outfeature", this, function (e) {
            hover.removeFeatures([e.feature]);
        });
        map.addControl(scontrol);

		// END feature info popup 

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
                    return function() {target[type] = tog.checked;};
                })(tog, type, target);
                tol = document.getElementById(i + "_" + type + "Tolerance");
                tol.value = target[type + "Tolerance"];
                tol.onchange = (function(tol, type, target) {
                    return function() {
                        target[type + "Tolerance"] = Number(tol.value) || 0;
                    };
                })(tol, type, target);
            }
        }

        window.dispatchEvent(new Event('resize'));
   	}
    function scaleToSpecific(scale){
    	map.zoomToScale(scale); 
    }

    var projectionSelect = $('#projection_tzg');
	projectionSelect.on('change', function() {
		 var coordbar = new OpenLayers.Control.MousePosition({
 	        'div': document.getElementById("coordbar"),
 	        displayProjection: projectionSelect.val()
 	        });
 	    map.addControl(coordbar);
	});
 
</script>
<div  id="map_tzg" class="map_tzg"></div>
</body>
</html>