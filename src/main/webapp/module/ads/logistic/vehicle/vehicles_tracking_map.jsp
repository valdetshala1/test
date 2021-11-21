<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body> 
<script type="text/javascript">
var map_trac, editor,showActualPosition,deviceId;
var orto,  pedolo, mu, compartments, stand, biodiv ,trac, fmr;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";
var vectorLayer,vectorLayerPlan;
var selectFeature;
var harv_pl, harv_im;
var mapLayers=[];
var showInfo=false;
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

var map_trac, oleeditor, editor, mcontrol, wfs, wkt, layerSwitcher, mapPanel, drawControls, vectors,  
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

var actualLineGeom='';
var actualVehcilesPointGeom=[];
var actualVehiclesSpeed=[];
var actualVehiclesPlateNumber=[];


function getActualVehiclesDevicePoint(){
// 	if(showActualPosition=='true'){
	$.ajax({
		type : "GET", // GET or POST
		url : "LogisticGrid.getVehicleActualTracPoints.do?", // the file to call
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
				actualVehcilesPointGeom.push(data[i].actual_point);
				actualVehiclesSpeed.push(data[i].speed);
				actualVehiclesPlateNumber.push(data[i].plate_number);
			}
		},
		complete:function(jqXHR, textStatus){
		}
	});
}


function drawLayer(){
$.ajax({
	type : "GET", // GET or POST
	url : "FrmGrid.layerGisData.do?module=VHTM", // the file to call
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
				                tilesOrigin : map_trac.maxExtent.left + ',' + map_trac.maxExtent.bottom
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



function init_trac_map(){
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
	map_trac = new OpenLayers.Map ('map_trac', options, {
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
	map_trac.addControl(new OpenLayers.Control.LayerSwitcher({'div':OpenLayers.Util.getElement('layerswitcherbox')}));
	
	var scale = new OpenLayers.Control.Scale(document.getElementById("scale"));
	map_trac.addControl(scale);	
    
    var coordbar = new OpenLayers.Control.MousePosition({
        'div': document.getElementById("coordbar"),
         displayProjection: RKS
        });
    map_trac.addControl(coordbar);
	
    //map = new OpenLayers.Map('map_tracct', options);
		
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
		 trackLineLayer =   new OpenLayers.Layer.Vector('Gjurmet', 
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
		 var myStyle = {fill: true,fillColor: "#ff0000"};
		 
		 trackLineLayer1 =   new OpenLayers.Layer.Vector('Gjurmet1', 
	        		{visibility: true, displayInLayerSwitcher: true,style: myStyle, //styleMap: styles,
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
	        debugger
		var speed,plate_number,color,brand,uniqueid,course;
		 var styleMapWindig = new OpenLayers.StyleMap({
		        "default": {
		            externalGraphic: "img/tracking.png",
		            label:"",
		            graphicWidth: 40,
		            graphicHeight: 40,
		            graphicXOffset: -12,
		            graphicYOffset: -12,
		            rotation: "0",
		            fontSize:12,
		            fontColor:'#FFFF00',
		            labelOutlineColor:"black",
		            labelOutlineWidth:3,
		            fillOpacity: "1"
		        },
		        "select": {
		            cursor: "crosshair",
		            externalGraphic: "img/tracking.png",
		            graphicWidth: 40,
		            graphicHeight: 40,
		            graphicXOffset: -12,
		            graphicYOffset: -12,
		            rotation: "0",
		            fillOpacity: "1"
		        }
		    });

		  var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
          renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;
          
		 trackPointLayer =   new OpenLayers.Layer.Vector('Gjurma', 
				 {styleMap : styleMapWindig,
		          eventListeners:{
		            'featureselected':function(evt){
		                var feature = evt.feature;
		                var popup = new OpenLayers.Popup.FramedCloud("popup",
		                    OpenLayers.LonLat.fromString(feature.geometry.toShortString()),
		                    null,
		                    "<div style='font-size:.8em'>Numri i targave:" + feature.attributes.plate_number+" <br/>  Shpejtësia :"+ feature.attributes.speed+"</div>",
		                    null,
		                    true
		                );
		                feature.popup = popup;
		                map_trac.addPopup(popup);
		            },
		            'featureunselected':function(evt){
		                var feature = evt.feature;
		                map_trac.removePopup(feature.popup);
		                feature.popup.destroy();
		                feature.popup = null;
		            }
		        }
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
    //    map_trac.addLayers([openstreetmap]);

      //ms
        drawLayer();
		var layerArray=[openstreetmap,];

		for(var i=0;i<mapLayers.length;i++){
			layerArray.push(mapLayers[i]);
			}
	
		map_trac.addLayers(layerArray);   

	    //ms         
        nav = new OpenLayers.Control.NavigationHistory();
        // parent control must be added to the map
        map_trac.addControl(nav);

        panel1 = new OpenLayers.Control.Panel({'displayClass': 'olControlNavigationHistory', div: document.getElementById("panel1")});
        panel1.addControls([nav.next, nav.previous]);
        map_trac.addControl(panel1);
         

        selectFeature = new OpenLayers.Layer.Vector("Selection", {
            styleMap: new OpenLayers.Style(OpenLayers.Feature.Vector.style["select"])
        });
    			 
	// map extent
	var mapextent = new OpenLayers.Bounds(7419294.456, 4634786.121, 7564763.285, 4792623.516).transform(RKS, map_trac.getProjectionObject());
	map_trac.zoomToExtent(mapextent);
	var lonLat = new OpenLayers.LonLat(7483083.112, 4700630.811).transform(RKS, map_trac.getProjectionObject());
    map_trac.setCenter(lonLat, 9);	



    
    //track functions strat 
    
    var points=[
		new OpenLayers.Geometry.Point(7514033, 4723104).transform(RKS, map_trac.getProjectionObject()),
		new OpenLayers.Geometry.Point(7514074, 4723108).transform(RKS, map_trac.getProjectionObject()),
		new OpenLayers.Geometry.Point(7514097, 4723104).transform(RKS, map_trac.getProjectionObject())
        ];

    
    var p=	new OpenLayers.Geometry.Point(7514087 ,4723111).transform(RKS, map_trac.getProjectionObject());
    
    var line=new OpenLayers.Geometry.LineString(points);


// 	actualLineGeom='LINESTRING(7514033 4723104, 7514074 4723108, 7514097 4723104)';
// 	var wkt_f=new OpenLayers.Format.WKT().read(actualLineGeom);

// 	 wkt_f=wkt_f.geometry.transform(RKS, map_trac.getProjectionObject());
// 	 if(wkt_f==line){alert("Ok")};
// 	    var wkt_f1=new OpenLayers.Feature.Vector(
// 	    		wkt_f
// 	   	);
// 	 trackLineLayer1.addFeatures(wkt_f1);
// 	 map_trac.addLayer(trackLineLayer1);
    
//     line.addPoint(p);
    

    
 
  
 
//     tracLineFeature.addPoint(p);

//     trackLineLayer1.addFeatures(tracLineFeature1);

//     map_trac.addLayer(trackLineLayer1);

//     var tracPointFeature=new OpenLayers.Feature.Vector(
//     		new OpenLayers.Geometry.Point(7514087 ,4723111).transform(RKS, map_trac.getProjectionObject())
//       );
    
//     trackPointLayer.addFeatures(tracPointFeature);
//     map_trac.addLayer(trackPointLayer);


    
   function doGetFeatureInfoPopup(evt){
	if(showInfo){
		var point = map_trac.getLonLatFromPixel(evt.xy);
		var position = point.transform(new OpenLayers.Projection("EPSG:900913"), new OpenLayers.Projection("EPSG:900916"));
		
        var params = {
                BBOX: map_trac.getExtent().toBBOX(),
                lonlat : position,
                activityType:'HAR',
                annualPlanId:$("#annualplanId").val(),
                activeLayer: activeLayerId
               };
       mouseLoc = map_trac.getLonLatFromPixel(evt.xy);
       
       var request = OpenLayers.Request.GET({
    	    url: "MUnitMapJson.infopointHarvPl.do",
    	    data: params,
    	    params: params,
    	    callback: mapInfoHandler
    	});
       OpenLayers.Event.stop(evt);
	}
  }
			  
	 map_trac.events.register('click', map_trac, function (e) {doGetFeatureInfoPopup(e); });



	
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
			map_trac.addPopup(popup);
			popup.events.register("click", map_trac, popupDestroy);
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
        map_trac.raiseLayer(vectorLayerPlan, map_trac.layers.length);//make vector layer appear on top of all layers
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
	        map_trac.raiseLayer(vectorLayer, map_trac.layers.length);//make vector layer appear on top of all layers
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
	        map_trac.raiseLayer(vectorLayer, map_trac.layers.length);//make vector layer appear on top of all layers
        }
    });
    debugger

   setInterval(function() {
	   if(showActualPosition==true){
		   			actualVehcilesPointGeom=[];
		   			actualVehiclesSpeed=[];
		   			actualVehiclesPlateNumber=[];
		   			addNewPointInTracking();
		   }
   }, 5000);

  function addNewPointInTracking(){
	  trackPointLayer.destroyFeatures();  
    	 if(showActualPosition==true){
    		 getActualVehiclesDevicePoint();
    		 var pointFeatures=[];
				for(var i=0;i<actualVehcilesPointGeom.length;i++){
			     	var wkt_f_point=new OpenLayers.Format.WKT().read(actualVehcilesPointGeom[i]);
			    	wkt_f_point=wkt_f_point.geometry.transform(RKS, map_trac.getProjectionObject());
			
			    	var tracPointFeature=new OpenLayers.Feature.Vector(
			    			wkt_f_point,
			    			 {
			    				plate_number :actualVehiclesPlateNumber[i], 
			    				speed:actualVehiclesSpeed[i]
			                }
			    	);
	
			    	
			   	    trackPointLayer.addFeatures(tracPointFeature);
			   	   
    	 		}
// 			  	trackPointLayer.redraw();
			 	   var selector = new OpenLayers.Control.SelectFeature(trackPointLayer,{
		    	        hover:true,
		    	        autoActivate:true
		    	    });

			    	 map_trac.addControl(selector);  
			    	 map_trac.addLayer(trackPointLayer);
		    	    
    	 }

    

    }

    
}
var projectionSelect = $('#projection');
projectionSelect.on('change', function() {
		 var coordbar = new OpenLayers.Control.MousePosition({
	        'div': document.getElementById("coordbar"),
	         displayProjection: projectionSelect.val()
	      });
		 map_trac.addControl(coordbar);
});


</script>
</body>
</html>