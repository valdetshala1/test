        var map, editor;
        var orto,  pedolo, mu, compartments, stand, plots, fmr;
        var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";
        var vectorLayer;
        var selectFeature;
        var splitFeature="";
       
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
             	
        	var link = "Input.splitStands.do?linestring="+lineFeature+"&sid="+$("#stand\\.id").val();
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
						var features = wktFormat.read(data[i].geom);
						vectorLayer.addFeatures(features);
						splitFeature += data[i].geom916+";";
					}
				},
				complete:function(jqXHR, textStatus){
				}
			});
        }

        function onModification(feature) {
        	var wkt_obj = wkt.write(feature);
        	var area;
        	console.log("onModificationEnd: " + wkt_obj);
        	$geometry = $("#geometry");
        	$area = $("#stand\\.basalArea");
        	if($geometry){
             	var polygonFeature = wkt.read(wkt_obj);
             	polygonFeature.geometry.transform(
    				   new OpenLayers.Projection("EPSG:900913"),
            	       new OpenLayers.Projection("EPSG:900916")
    				   ); 
             	var text = getOverlapStand(polygonFeature.geometry);
             	if(text){
             		$.SmartMessageBox({
    					title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Overlaped <span class='txt-color-orangeDark'><strong>Vineyard </strong></span> ?",
    					content : $.logoutMSG || "<s:text name='vine.vineyard.map.overlaped'/><br>"+text ,
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
        	$area = $("#stand\\.basalArea");
        	if($geometry){
             	var polygonFeature = wkt.read(wkt_obj);
             	polygonFeature.geometry.transform(
    				   new OpenLayers.Projection("EPSG:900913"),
            	       new OpenLayers.Projection("EPSG:900916")
    				   ); 
             	var text = getOverlapStand(polygonFeature.geometry);
             	if(text){
             		$.SmartMessageBox({
    					title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Overlaped <span class='txt-color-orangeDark'><strong>Vineyard </strong></span> ?",
    					content : $.logoutMSG || "<s:text name='vine.vineyard.map.overlaped'/><br>"+text ,
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
        
        function getOverlapStand(polygonFeature){
    		var standId = new Array();
    		var area = new Array();
    		var link;
        	if(polygonFeature){
        		link = "Input.getOverlapVineyard.do?polygon="+polygonFeature+"&stand_id="+$("#stand\\.standId").val();
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
    							standId[i]=data[i].standId;
    							area[i]=(data[i].area/10000).toFixed(2);
    							}
    					},
    					complete:function(jqXHR, textStatus){
    					}
    				});
                 	var text="" ;
                 	for(var i=0;i<standId.length;i++){
                    	text = text +"<s:text name='law.suit.label.stand'/> :"+standId[i]+" <s:text name='dhpet.animal.capacity.label.area'/> :"+area[i]+" ha<br>";
                     }
        	}
        	return text;
        } 
        
        function splitPolygon(){
    		$.ajax({
    			type : "GET",
    			url : "StandSplitSave.do",
    			data: {standId: $("#stand\\.id").val(), polygons: splitFeature},
    			async : false,
    			beforeSend : function(jqXHR, settings) {
    			},
    			error : function(errorThrown, status, jqXHR) { 
    				alert("error:" + errorThrown + ", status:" + status);
    			},
    			success : function(data, status, jqXHR) { 
    				console.log(data);
    				var errors = jqXHR.getResponseHeader("errors_exits");
    				var snrError = jqXHR.getResponseHeader("snrError");
    				if(snrError){
    					$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>",
							content : snrError,
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});		
    				}else if(!errors){
    					$.smallBox({
    						title : "<s:text name='global.grid.pagebar.button.SaveOk'/>",
    						content : "<s:text name='wine.smallBox.message.contet'/>!",
    						color : "#739E73",
    						timeout: 5000,
    						icon : "fa fa-check",
    						number : "1"
    					});		
    					jQuery("#stand_grid").trigger("reloadGrid");
//    					wfsstand.refresh({force:true});
//    					stand.redraw(true);  
    				}    	    					
    			},
    			complete : function(jqXHR, textStatus) {
    			}
    		});
    		
        }
        
        var map, oleeditor, editor, mcontrol, wfs, wkt, layerSwitcher, mapPanel, drawControls, vectors,  
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
        
        function loadMUnitFeature(mUPeriodId){
        	var url ='MUnitMapJson.mUnitFeature.do?mup_id=' +mUPeriodId;
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
	 				  var featurecollection = jqXHR.responseText
	 					var format_empty = new OpenLayers.Format.GeoJSON({
	 					});	
						var format = new OpenLayers.Format.GeoJSON({
						  'internalProjection': new OpenLayers.Projection("EPSG:900916"),
						  'externalProjection': new OpenLayers.Projection("EPSG:4326")
						});
						//var jsonstring = format.write(vector_layer.features);
		 					
			           var geojson_format = new OpenLayers.Format.GeoJSON({
			        	'internalProjection': new OpenLayers.Projection("EPSG:900913"),
						'externalProjection': new OpenLayers.Projection("EPSG:900916")				           
				       });

			           vectorLayer.destroyFeatures();
			           var featureObject = geojson_format.read(featurecollection);
			          
			           vectorLayer.addFeatures(featureObject);
			           
			           map.zoomToExtent(vectorLayer.getDataExtent(),false);
	 			},
	 			complete:function(jqXHR, textStatus){
	 			}
	 		});
	 	}
        
        function loadCompFeature(compId){
        	var url ='MUnitMapJson.compFeature.do?comp_id=' +compId;
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
			           
			           map.zoomToExtent(vectorLayer.getDataExtent(),false);
	 			},
	 			complete:function(jqXHR, textStatus){
	 			}
	 		});
	 	}
        
        function loadStandFeature(standId){
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
			          
			           var wsss = wkt.write(featureObject);
			           
			           vectorLayer.addFeatures(featureObject);
			           
			           map.zoomToExtent(vectorLayer.getDataExtent(),false);
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
                    units: 'm'
                };
                wkt = new OpenLayers.Format.WKT();	
							//Initialize the map
			//creates a new openlayers map in the <div> html element id map
			map = new OpenLayers.Map ('map_comp', options, {
				controls:[
					new OpenLayers.Control.OverviewMap(),
					new OpenLayers.Control.KeyboardDefaults(),		
//					new OpenLayers.Control.ScaleLine(),
//					new OpenLayers.Control.Navigation(),
//					new OpenLayers.Control.PanZoom(),
					new OpenLayers.Control.LayerSwitcher(),
					new OpenLayers.Control.MousePosition({element: $('location')}),
					new OpenLayers.Control.Scale($('scale'))
				],
				projection: WGS84_google_mercator,
				displayProjection: RKS
			});
			map.addControl(new OpenLayers.Control.LayerSwitcher({'div':OpenLayers.Util.getElement('layerswitcherbox')}));
            //map = new OpenLayers.Map('map_comp', options);
				
			var scale = new OpenLayers.Control.Scale(document.getElementById("scale"));
            map.addControl(scale);	
            
            var coordbar = new OpenLayers.Control.MousePosition({'div': document.getElementById("coordbar")});
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
                                    fillColor: "yellow",
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
			
//			var road = new OpenLayers.Layer.Bing({
//                name: "Bing Road",
//                key: apiKey,
//                type: "Road"
//            });
//			var hybrid = new OpenLayers.Layer.Bing({
//                name: "Bing Hybrid",
//                key: apiKey,
//                type: "AerialWithLabels"
//            });
//            var aerial = new OpenLayers.Layer.Bing({
//                name: "Bing Aerial",
//                key: apiKey,
//                type: "Aerial"
//            });
            
                // setup tiled layer
                fmr = new OpenLayers.Layer.WMS(
                    "vgis_mu_period_active", "http://wms_kfis:123456@192.168.0.30:8888/geoserver/kfis_gis/wms",
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
                pedolo = new OpenLayers.Layer.WMS(
                    "Soils", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
                    {
                        LAYERS: 'kfis_map:pedolo',
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
                        yx : {'EPSG:900916' : false},
						visibility: false
                    } 
                );				
                mu = new OpenLayers.Layer.WMS(
                    "Managment Units", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
                    {
                        LAYERS: 'kfis_map:mu',
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
                compartments = new OpenLayers.Layer.WMS(
                    "Compartments", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
                    {
                        LAYERS: 'kfis_map:compartments',
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
                stand = new OpenLayers.Layer.WMS(
                    "Stands", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
                    {
                        LAYERS: 'kfis_map:stand',
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
                plots = new OpenLayers.Layer.WMS(
                    "Plots", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
                    {
                        LAYERS: 'kfis_map:plots',
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
				var orto = new OpenLayers.Layer.WMS(
		            "ORTOFOTO", "https://apps.geoland-kosova.com/giserver/wms",
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
                map.addLayers([openstreetmap, /* google_maps, google_satellite, google_terrain, */orto, vectorLayer, pedolo, mu, compartments, stand, plots,fmr]);
//             editor = new OpenLayers.Editor(map, {
//                activeControls: ['Navigation', 'SnappingSettings', 'SplitFeature', 'MergeFeature', 'CleanFeature', 'CADTools', 'TransformFeature', 'Separator', 'DeleteFeature', 'DragFeature', 'SelectFeature', 'Separator', 'DrawHole', 'ModifyFeature', 'Separator'],
//                featureTypes: ['regular', 'polygon', 'path', 'point']
//            });
//            editor.startEditMode();
                nav = new OpenLayers.Control.NavigationHistory();
                // parent control must be added to the map
                map.addControl(nav);

                panel1 = new OpenLayers.Control.Panel({'displayClass': 'olControlNavigationHistory', div: document.getElementById("panel1")});
                panel1.addControls([nav.next, nav.previous]);
                map.addControl(panel1);
                
                var snapVertex = {methods: ['vertex', 'edge'], layers: [vectorLayer, selectFeature]};
                controlEdit = {
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
	                    union: new OpenLayers.Control.SelectFeature(vectorLayer,
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
                    	}) , 
                    	save: new OpenLayers.Control.Button(
                                
                                {displayClass: 'olControlSaveFeature', 
                            trigger: function() {
         						//saveaction
         						
         						var ctrl_split = map.getControlsBy("id", "split")[0];
         						
         						if (ctrl_split.active) {
         							var save = "<s:text name='label.button.save'/>";
         							alert(save);
         							$.SmartMessageBox({
         								title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> "+save+" <span class='txt-color-orangeDark'><strong><s:text name='frm.compartment.stands'/></strong></span> ?",
         								content : $.logoutMSG || "<s:text name='frm.stand.split.save.text'/>." ,
         								buttons : '[No][Yes]'
         	
         							}, function(ButtonPressed) {
         								if (ButtonPressed == "Yes") {
         									splitPolygon();
         								}
         								return false;
         							});	
         						}

         						var ctrl_union = map.getControlsBy("id", "union")[0];
         						if (ctrl_union.active) {
         							if(sel_wfs_features.length>1){
         								var sel_wkt_ids = [];
         								
         								var process = '{"identifier": "geo:union", "dataInputs": [';
         								for(var i=0; i < sel_wfs_features.length; i++){
         									var feature = sel_wfs_features[i];
         									var wkt_val = wkt.write(feature);
         									var polygonFeature = wkt.read(wkt_val);
         									polygonFeature.geometry.transform(map.getProjectionObject(), RKS); 
         									var poly_value = polygonFeature.geometry;
         									sel_wkt_ids.push(feature.attributes.id);
         									
         									process += '{';
         									process += '"identifier": "geom",'; 
         									process += '"data": {';
         									process += '"complexData": {';
         									process += '"mimeType": "application/wkt",';
         									process += '"value":"' + poly_value + '"';
         									process += '}'; 
         									process += '}'; 
         									process += '}'; 

         									if(i<sel_wfs_features.length-1){
         											process += ',';
         								    }
         								 }     
         								  process += '], "responseForm": {"rawDataOutput": {"mimeType": "application/wkt", "identifier": "result"}}}';
         							 	  console.log(process);
         							 	 
         								  var process_array = JSON.parse(process);
         								  var geo1 = getGeo(process_array);
         								  var string = ""+geo1;
         								  var res = string.split("("); 
         									if(res[0]=="MULTIPOLYGON"){
         										
         										
         										var vidcontent = '<select name="vids" id="vids" style="background-color: #007700;" onchange="alert("test");">';
         										for(i=0;i<sel_wfs_features.length;i++){
         											vidcontent += "<option value=\"" + sel_wfs_features[i].attributes.id + "\">" + sel_wfs_features[i].attributes.nr + "</option>";
         										}
         										vidcontent += "</select>";
         											
         										$.SmartMessageBox({
         											title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Save <span class='txt-color-orangeDark'><strong>Vineyard Splitting</strong></span> ?",
         											content : $.logoutMSG || "<s:text name='vine.vineyard.map.save.union.validate'/>." + vidcontent,
         											buttons : '[No][Yes]'
         				
         										}, function(ButtonPressed) {
         											if (ButtonPressed == "Yes") {
         												unionPolygon();	
         											}
         											return false;
         										});	
         										$.SmartMessageBox({
         											title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> MULTIPOLYGON <span class='txt-color-orangeDark'><strong><s:text name='vine.vineyard.map.merge'/></strong></span> !",
         											content : $.logoutMSG || "",
         											buttons : '[Ok]'
         										});
         									}else{
         								
         			                	   		var vidcontent = '<select name="vids" id="vids" style="background-color: #007700;" onchange="alert("test");">';
         										for(i=0;i<sel_wfs_features.length;i++){
         											vidcontent += "<option value=\"" + sel_wfs_features[i].attributes.id + "\">" + sel_wfs_features[i].attributes.nr + "</option>";
         										}
         										vidcontent += "</select>";
         											
         										$.SmartMessageBox({
         											title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Save <span class='txt-color-orangeDark'><strong>Vineyard Splitting</strong></span> ?",
         											content : $.logoutMSG || "<s:text name='vine.vineyard.map.save.union.validate'/>." + vidcontent,
         											buttons : '[No][Yes]'
         				
         										}, function(ButtonPressed) {
         											if (ButtonPressed == "Yes") {
         												unionPolygon();	
         											}
         											return false;
         										});	
         									}	
         							}else{
         						      	$.SmartMessageBox({
         									title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Save <span class='txt-color-orangeDark'><strong>Vineyard Union</strong></span> !",
         									content : $.logoutMSG || "<s:text name='vine.vineyard.map.merge.validate'/>.",
         									buttons : '[Ok]'

         								}, function(ButtonPressed) {
         									if (ButtonPressed == "Ok") {
         									}

         								});								
         							}						
         						}
                             }, 
                          	title: '<s:text name="global.grid.pagebar.button.save"/>' })
                   
                     };
                
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

            }
            