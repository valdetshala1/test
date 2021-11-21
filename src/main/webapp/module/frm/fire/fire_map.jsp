<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<script type="text/javascript">
var map_a, editor;
var orto,  pedolo, mu, parcelGeom, cadZone, biodiv ,plots, fmr;
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
	var vectors, panel, controls;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";

var vis, ms;
var result_layer;
var munNameChecked;

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


function checkGeometrysInMunicipality(mun_id,polygon){
	var result='';
	if(mun_id!='' && polygon!=''){
		$.ajax({
			type : "GET", // GET or POST
			url : "Input.geomIsInMunicipality.do?munId="+mun_id+"&polygon="+polygon, // the file to call
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
				munNameChecked=data.name;
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}
	return result;
}



function loadFirePoint(firePointId){
	var url ='MUnitMapJson.firePointGeom.do?firePointId='+firePointId;
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

function loadFirePolygon(firePolygonId){
	var url ='MUnitMapJson.firePolygonGeom.do?firePolygonId='+firePolygonId;
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

function onPlan(feature) {
	var wkt_obj = wkt.write(feature);
	var textMessage='';
	$geometry =null;
	if($("#isPoint").val()=='true'){
		$geometry =$("#pointFire");
	}else{
		$geometry =$("#polygonFire");
		}
	
	if($geometry){	
		var polygonFeature = wkt.read(wkt_obj);
     	polygonFeature.geometry.transform(
			   new OpenLayers.Projection("EPSG:900913"),
    	       new OpenLayers.Projection("EPSG:900916")
		); 
    	var result=checkGeometrysInMunicipality($("#fire\\.cadastralMunicipality\\.id").val(),polygonFeature.geometry);
    	if($("#isPoint").val()=='true'){
    		textMessage='<s:text name="frm.fire.point.mun.check.message1"/>'+$("#fire\\.cadastralMunicipality\\.name").val()+'<s:text name="frm.fire.point.mun.check.message2"/>'+munNameChecked;
    	}else{
    		textMessage='<s:text name="frm.fire.polygon.mun.check.message1"/>'+$("#fire\\.cadastralMunicipality\\.name").val()+'<s:text name="frm.fire.polygon.mun.check.message2"/>'+munNameChecked;
    		}
        if(result=="f"){
      		$.SmartMessageBox({
				title : "<i class='fa fa-sign-out txt-color-orangeDark'></i>  "+textMessage +" </strong></span>",
				buttons : '[OK]',
				icon : "fa fa-bell"
			});
    	}else{
            $geometry.val(polygonFeature.geometry); 
        	$("#fire_point_popup_content").dialog("close");
        	$("#fire_polygon_popup_content").dialog("close");
        	}
	}

}


function drawLayer(){
$.ajax({
	type : "GET", // GET or POST
	url : "FrmGrid.layerGisData.do?module=RPFM", // the file to call
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
        displayProjection:RKS
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
    //    map_act.addLayers([openstreetmap, /* google_maps, google_satellite, google_terrain, */orto,topo, vectorLayer,vectorLayerPlan, /*pedolo, mu,*/ parcelGeom, cadZone,/*biodiv, plots,*/]);
      //ms
        drawLayer();
		var layerArray=[openstreetmap,/*fake,orto, topo,mun*/ vectorLayer,vectorLayerPlan, /*vgis_stand_active, vgis_linetemp,/*vgis_comp_active,fmr,linetemp*/];

		for(var i=0;i<mapLayers.length;i++){
			layerArray.push(mapLayers[i]);
			}
	
		map_a.addLayers(layerArray);   

	    //ms           
        nav = new OpenLayers.Control.NavigationHistory();
        // parent control must be added to the map
        map_a.addControl(nav);

        panel1 = new OpenLayers.Control.Panel({'displayClass': 'olControlNavigationHistory', div: document.getElementById("panel1")});
        panel1.addControls([nav.next, nav.previous]);
        map_a.addControl(panel1);
        var snapVertex = {methods: ['vertex', 'edge'], layers: [vectorLayer, selectFeature]};
        if($("#isPoint").val()=='true'){
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
                    point: new OpenLayers.Control.DrawFeature(vectorLayer,
                                    OpenLayers.Handler.Point,
                                    {  'displayClass': 'olControlDrawFeaturePoint',
                        				title: "Pika", 
                        				id:"point",
                        				featureAdded: onPlan
                        			})
       
                 };
        }else{
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
                            {  'displayClass': 'olControlDrawFeaturePolygon',
                				title: "Poligoni", 
                				id:"polygon",
                				featureAdded: onPlan
                			})
       
                 };
        }

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