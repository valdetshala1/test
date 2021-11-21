<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<script type="text/javascript">
var map_a, editor;
var orto,  pedolo, mu, parcelGeom, cadZone, biodiv ,plots, fmr;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";
var vectorLayer,vectorLayerPlan;
var selectFeature;

var map_a, oleeditor, editor, mcontrol, wfs, wkt, layerSwitcher, mapPanel, drawControls, vectors,  
features, format, popup, bounds, pureCoverage = false;
	var snap, poly, draw, drawsnap, modify, line, point,popupVine;
	var isDtmActive, isTexturaActive, activeLayerId;
	var measureControls;  
	var lyr0, swipe;
	var vectors, panel, controls;
var mapLayers=[];

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

// zoom parcel
function loadParcelFeature(cadParcId){
	var url ='MUnitMapJson.parcelDetailGeom.do?cadParcId='+cadParcId;
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



function drawLayer(){
$.ajax({
	type : "GET", // GET or POST
	url : "FrmGrid.layerGisData.do?module=PRRQ", // the file to call
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



function init1(){
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
            units: 'm'
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
		],
		projection: WGS84_google_mercator,
		displayProjection: RKS
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
    
        parcelGeom = new OpenLayers.Layer.WMS(
                "Parcel", geoserver_url,
                {
                    layers: 'kfis_gis:tgis_parcelgeom',
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
		cadZone = new OpenLayers.Layer.WMS(
                "Zona Kadastrale",geoserver_url,
                {
                    layers: 'kfis_gis:tgis_cadastrale_zone',
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
       					
		var orto = new OpenLayers.Layer.WMS(
	            "Ortofoto", "https://skkv.rks-gov.net/geoserver/wms",
	            {
	                layers: 'ORTOFOTO',
					STYLES: '',
	                srs: 'EPSG:900916',
	                format: format,
	                tiled: true,
	                transparent: false,
	                },
	                {
	                buffer: 0,
	                displayOutsideMaxExtent: true,
	                isBaseLayer: true,
	                yx : {'EPSG:900916' : false},
					visibility: false
	            } 
			);
		var topo = new OpenLayers.Layer.WMS(
	            "Topografika", "http://geoportal.rks-gov.net/wms",
	            {
	                layers: 'Hartat_Topografike2015',
					STYLES: '',
	                srs: 'EPSG:7392',
	                format: format,
	                tiled: true,
	                transparent: false,
	                },
	                {
	                buffer: 0,
	                displayOutsideMaxExtent: true,
	                isBaseLayer: true,
	                yx : {'EPSG:7392' : false},
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
      //  map_a.addLayers([openstreetmap, /* google_maps, google_satellite, google_terrain, */orto,topo, vectorLayer,vectorLayerPlan, /*pedolo, mu,*/ parcelGeom, cadZone,/*biodiv, plots,*/]);
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
        		nav1:  new OpenLayers.Control.Navigation(
        				{ 'displayClass': 'olControlNavigation', tooltip: "Zoom In" }),    
            	zoombox: new OpenLayers.Control.ZoomBox(
            			{alwaysZoom:true, 'displayClass': 'olControlZoomBox', tooltip: "Zoom In" }),
      
   
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
        		 
	// map extent
	var mapextent = new OpenLayers.Bounds(7419294.456, 4634786.121, 7564763.285, 4792623.516).transform(RKS, map_a.getProjectionObject());
	map_a.zoomToExtent(mapextent);
	var lonLat = new OpenLayers.LonLat(7483083.112, 4700630.811).transform(RKS, map_a.getProjectionObject());
    map_a.setCenter(lonLat, 9);		
    


    
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
<div  id="map_act" class="map_act"></div>
</body>
</html>