<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache_session.jsp"%>
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
var featureEdit;
var mapLayers=[];
var showInfo=false;

OpenLayers.ProxyHost = 'proxy.cgi?url=<%=session.getAttribute("proxy_cgi")%>'; 

var wktFormat = new OpenLayers.Format.WKT();
var wpsFormat = new OpenLayers.Format.WPSExecute();
 
var map, oleeditor, editor, mcontrol, wfs, wkt, layerSwitcher, mapPanel, drawControls, vectors,  
features, format, popup, bounds, pureCoverage = false;
	var  poly, draw, modify, line, point,popupVine;
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
function getOverlapLeaseRequest(polygonFeature){
	var requestId = new Array();
	var area = new Array();
	var link;
	if(polygonFeature){
		link = "Input.getOverlapLeaseRequest.do?polygon="+polygonFeature+"&request_id="+$("#leaseRequest\\.id").val();
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
						requestId[i]=data[i].request_id;
						area[i]=(data[i].area/10000).toFixed(2);
						}
				},
				complete:function(jqXHR, textStatus){
				}
			});
         	var text="" ;
         	for(var i=0;i<requestId.length;i++){
            	text = text +" <s:text name='dhpet.animal.capacity.label.area'/> :"+area[i]+" ha<br>";
             }
	}
	return text;
} 

function onModification(feature) {
	var wkt_obj = wkt.write(feature);
	var area;
	$geometry = $("#geometry");
	$area = $("#leaseRequest\\.area");
	if($geometry){
     	var polygonFeature = wkt.read(wkt_obj);
     	polygonFeature.geometry.transform(
			   new OpenLayers.Projection("EPSG:900913"),
    	       new OpenLayers.Projection("EPSG:900916")
			   ); 
     	var text = getOverlapLeaseRequest(polygonFeature.geometry);
     	if(text){
     		$.SmartMessageBox({
				title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Overlaped <span class='txt-color-orangeDark'><strong><s:text name='fal.request.lease'/> </strong></span> ?",
				content : $.logoutMSG || "<s:text name='fal.request.overlap'/><br>"+text ,
				buttons : '[Ok]'
			});	
         }else{
    		area = polygonFeature.geometry.getArea();
            $geometry.val(polygonFeature.geometry); 
 			var fSiper = (area/10000).toFixed(4);
 			//alert(fSiper);
   			$area.val(fSiper);
         }
	}
}

function onModificationEnd(feature) {
	var wkt_obj = wkt.write(feature);
	var area;
	$geometry = $("#geometry");
	$area = $("#leaseRequest\\.area");
	if($geometry){
     	var polygonFeature = wkt.read(wkt_obj);
     	polygonFeature.geometry.transform(
			   new OpenLayers.Projection("EPSG:900913"),
    	       new OpenLayers.Projection("EPSG:900916")
			   ); 
     	var text = getOverlapLeaseRequest(polygonFeature.geometry);
     	if(text){
     		$.SmartMessageBox({
				title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Overlaped <span class='txt-color-orangeDark'><strong><s:text name='fal.request.lease'/> </strong></span> ?",
				content : $.logoutMSG || "<s:text name='fal.request.overlap'/><br>"+text ,
				buttons : '[Ok]'
			});		
         }else{
    		area = polygonFeature.geometry.getArea();
            $geometry.val(polygonFeature.geometry); 
 			var fSiper = (area/10000).toFixed(4);
   			$area.val(fSiper);
   			if($("#leaseRequest\\.requestType\\.id").val())
	    	calcPrice($('#leaseRequest\\.startLease').val(), $('#leaseRequest\\.endLease').val(), $("#leaseRequest\\.requestType\\.id").val(),fSiper);
   			
         }
	}
}

function loadRequestFeature(requestId){
	var url ='MUnitMapJson.requestFeature.do?request_id=' +requestId;
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
	
OpenLayers.DOTS_PER_INCH = 25.4 / 0.28;
function drawLayer(){
	$.ajax({
		type : "GET", // GET or POST
		url : "FrmGrid.layerGisData.do?module=RLLM", // the file to call
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
	var WGS84_google_mercator = new OpenLayers.Projection("EPSG:900913");
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
	map = new OpenLayers.Map ('fal_map', options, {
		controls:[
			new OpenLayers.Control.OverviewMap(),
			new OpenLayers.Control.KeyboardDefaults(),		
			new OpenLayers.Control.LayerSwitcher(),
			new OpenLayers.Control.MousePosition({element: $('location')}),
			new OpenLayers.Control.Scale($('scale'))
		],
		projection: WGS84_google_mercator,
		displayProjection: RKS
	});
	map.addControl(new OpenLayers.Control.LayerSwitcher({'div':OpenLayers.Util.getElement('layerswitcherbox')}));
		
	var scale = new OpenLayers.Control.Scale(document.getElementById("scale"));
    map.addControl(scale);	
    
    var coordbar = new OpenLayers.Control.MousePosition({'div': document.getElementById("coordbar"), displayProjection: RKS});
    map.addControl(coordbar);
	//base layers
	// OSM
	var openstreetmap = new OpenLayers.Layer.OSM();
    
	//Google Maps
	
		// allow testing of specific renderers via "?renderer=Canvas", etc
        var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
        renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

		var geoserver_url = "<%=session.getAttribute("geoserver_url")%>";
        // setup tiled layer
        fmr = new OpenLayers.Layer.WMS(
            "vgis_mu_period_active", geoserver_url,
            {
                LAYERS: 'kfis_gis:vgis_mu_period_active',
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
		var orto = new OpenLayers.Layer.WMS(
				"ORTOFOTO 2012",
				"https://apps.geoland-kosova.com/giserver/kaveko/wms",
				{layers: "ORTOFOTO",
				format: "image/png",
				transparent: "true", 
				srsName: "EPSG:900916",
				srs: "EPSG:900916"},
				{isBaseLayer: false, singleTile: false, buffer: 0, visibility: false}
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
//         map.addLayers([openstreetmap,orto, vectorLayer,featureEdit,standsWms, vgis_comp_active,fmr]);

		drawLayer();
		var layerArray=[openstreetmap/*fake,orto, topo,mun*/];

		for(var i=0;i<mapLayers.length;i++){
			layerArray.push(mapLayers[i]);
			}
	
	    map.addLayers(layerArray);
	    map.addLayer(vectorLayer);
	    map.addLayer(featureEdit);
	    
        nav = new OpenLayers.Control.NavigationHistory();
        // parent control must be added to the map
        map.addControl(nav);

        panel1 = new OpenLayers.Control.Panel({'displayClass': 'olControlNavigationHistory', div: document.getElementById("panel1")});
        panel1.addControls([nav.next, nav.previous]);
        map.addControl(panel1);
        
        var snapVertex = {methods: ['vertex', 'edge'], layers: [vectorLayer]};
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
		                 handlerOptions: {holeModifier: "altKey"}}),
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
	        targets: [vectorLayer],
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

        window.dispatchEvent(new Event('resize'));
        
   }
    var projectionSelect = $('#projection');
    projectionSelect.on('change', function() {
    		 var coordbar = new OpenLayers.Control.MousePosition({
    	        'div': document.getElementById("coordbar"),
    	         displayProjection: projectionSelect.val()
    	      });
    		 map.addControl(coordbar);
    });

    
</script>
<div  id="fal_map" class="fal_map"></div>
</body>
</html>