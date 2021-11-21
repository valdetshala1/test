        var map_a, editor;
        var orto,  pedolo, mu, compartments, stand, biodiv ,plots, fmr;
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

        function loadStandPlantFeature(standId){
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
			           map_a.raiseLayer(vectorLayer, map_a.layers.length);//make vector layer appear on top of all layers
	 			},
	 			complete:function(jqXHR, textStatus){
	 			}
	 		});
	 	}
       
       
//        function onPlanStart(feature) {
//        	var wkt_obj = wkt.write(feature);
//        	console.log("onPlanStart: " + wkt_obj);
//        	$geometry = $("#geometry");
//        	if($geometry){
//             	
//        	}
//        }
        
        function onPlan(feature) {
        	var wkt_obj = wkt.write(feature);
        	var area ;
        	console.log("onPlan: " + wkt_obj);
        	$geometry = $("#plantPlanedGeom");
        	$stand_geom=$("#standGeom").val();
        	$area = $("#planting\\.plArea");
        	if($geometry){
        		var polygonFeature = wkt.read(wkt_obj);
             	polygonFeature.geometry.transform(
    				   new OpenLayers.Projection("EPSG:900913"),
            	       new OpenLayers.Projection("EPSG:900916")
    			);
             	
             	var result = checkStandContains($stand_geom,polygonFeature.geometry);
             	if(result=='false'){
             		$.SmartMessageBox({
    					title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Stand doesn't contain <span class='txt-color-orangeDark'><strong>POLYGON </strong></span> ?",
//    					content : $.logoutMSG || "<s:text name='stand.map.overlaped'/><br>"+text ,
    					buttons : '[Ok]'
    				});	
                 }else {
                	 area = polygonFeature.geometry.getArea();
                     $geometry.val(polygonFeature.geometry); 
                  	 
                     var fSiper = (area/10000).toFixed(4);
           			 $area.val(fSiper);
                	 
                 }
         		
        	}
        
        }

        function onPlanEnd(feature) {
        	var wkt_obj = wkt.write(feature);
        	var area ;
        	console.log("onPlan: " + wkt_obj);
        	$geometry = $("#plantPlanedGeom");
        	$stand_geom=$("#standGeom").val();
        	$area = $("#planting\\.plArea");
        	if($geometry){
        		var polygonFeature = wkt.read(wkt_obj);
             	polygonFeature.geometry.transform(
    				   new OpenLayers.Projection("EPSG:900913"),
            	       new OpenLayers.Projection("EPSG:900916")
    			);
             	
             	var result = checkStandContains($stand_geom,polygonFeature.geometry);
             	if(result=='false'){
             		$.SmartMessageBox({
    					title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Stand doesn't contain <span class='txt-color-orangeDark'><strong>POLYGON </strong></span> ?",
//    					content : $.logoutMSG || "<s:text name='stand.map.overlaped'/><br>"+text ,
    					buttons : '[Ok]'
    				});	
                 }else {
                	 area = polygonFeature.geometry.getArea();
                     $geometry.val(polygonFeature.geometry); 
                  	 
                     var fSiper = (area/10000).toFixed(4);
           			 $area.val(fSiper);
                	 
                 }
         		
        	}
        }
        
        function checkStandContains(stand_geometry,polygon){
        	var result='';
        	if(stand_geometry!='' && polygon!=''){
    				$.ajax({
    					type : "GET", // GET or POST
    					url : "Input.checkStandContains.do?stand_geometry="+stand_geometry+"&polygon="+polygon, // the file to call
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
            
            var coordbar = new OpenLayers.Control.MousePosition({'div': document.getElementById("coordbar")});
            map_a.addControl(coordbar);
			
				
			//base layers
			// OSM
			var openstreetmap = new OpenLayers.Layer.OSM();
            
                // setup tiled layer
                fmr = new OpenLayers.Layer.WMS(
                    "vgis_mu_period_active", "http://192.168.0.30:8888/geoserver/kfis_gis/wms",
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
                pedolo = new OpenLayers.Layer.WMS(
                    "Soils", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
                    {
                        LAYERS: 'kfis_map:pedolo',
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
                        tilesOrigin : map_a.maxExtent.left + ',' + map_a.maxExtent.bottom
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
                    "Stands", "https://apps.geoland-kosova.com/giserver/kfis_map/wms",
                    {
                        LAYERS: 'kfis_map:stand',
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
                map_a.addLayers([openstreetmap, /* google_maps, google_satellite, google_terrain, */orto, vectorLayer,vectorLayerPlan, pedolo, mu, compartments, stand,biodiv, plots,fmr]);
//             editor = new OpenLayers.Editor(map, {
//                activeControls: ['Navigation', 'SnappingSettings', 'SplitFeature', 'MergeFeature', 'CleanFeature', 'CADTools', 'TransformFeature', 'Separator', 'DeleteFeature', 'DragFeature', 'SelectFeature', 'Separator', 'DrawHole', 'ModifyFeature', 'Separator'],
//                featureTypes: ['regular', 'polygon', 'path', 'point']
//            });
//            editor.startEditMode();
                
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
                                 handlerOptions: {holeModifier: "altKey"}}
                                 ),
//	                    union: new OpenLayers.Control.SelectFeature(vectorLayer,
//	   	                       {'displayClass': 'olControlSaveFeatures',
//		   	                   title: "<s:text name='frm.stand.map.merge'/>", 
//		   	                   id:"union",
//		   	            	   clickout: true, toggle: true,
//		   	                   multiple: true, hover: false,
//		   	                   toggleKey: "ctrlKey", // ctrl key removes from selection
//		   	                   multipleKey: "shiftKey"}),
                        modify: new OpenLayers.Control.ModifyFeature(vectorLayer,
                                {'displayClass': 'olControlModifyFeature',
                     	 		title: "<s:text name='frm.stand.map.feature'/>", 
                                 snappingOptions: snapVertex,
//                                 onModificationStart: onPlanStart,
                                 onModification: onPlan,
                                 onModificationEnd: onPlanEnd,
                                 multipleKey: "shiftKey"
                    	}) , 
                    	save: new OpenLayers.Control.Button(
                                
                                {displayClass: 'olControlSaveFeature', 
                            trigger: function() {
         						//saveaction
         						
         						var ctrl_split = map.getControlsBy("id", "split")[0];
         						if (ctrl_split.active) {
         							$.SmartMessageBox({
         								title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> <s:text name='global.grid.pagebar.button.save'/> <span class='txt-color-orangeDark'><strong><s:text name='vine.vineyard.map.save.split'/></strong></span> ?",
         								content : $.logoutMSG || "<s:text name='vine.vineyard.map.save.split.validate'/>." + vidcontent,
         								buttons : '[No][Yes]'
         	
         							}, function(ButtonPressed) {
         								if (ButtonPressed == "Yes") {
         									splitPolygon();
         								}
         								return false;
         							});	
         						}

         						var ctrl_union = map_a.getControlsBy("id", "union")[0];
         						if (ctrl_union.active) {
         							if(sel_wfs_features.length>1){
         								var sel_wkt_ids = [];
         								
         								var process = '{"identifier": "geo:union", "dataInputs": [';
         								for(var i=0; i < sel_wfs_features.length; i++){
         									var feature = sel_wfs_features[i];
         									var wkt_val = wkt.write(feature);
         									var polygonFeature = wkt.read(wkt_val);
         									polygonFeature.geometry.transform(map_a.getProjectionObject(), RKS); 
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
                map_a.addControl(wigdet_panel );
                selectFeature = new OpenLayers.Layer.Vector("Selection", {
                    styleMap: new OpenLayers.Style(OpenLayers.Feature.Vector.style["select"])
                });
            			 
			// map extent
			var mapextent = new OpenLayers.Bounds(7419294.456, 4634786.121, 7564763.285, 4792623.516).transform(RKS, map_a.getProjectionObject());
			map_a.zoomToExtent(mapextent);
			var lonLat = new OpenLayers.LonLat(7483083.112, 4700630.811).transform(RKS, map_a.getProjectionObject());
            map_a.setCenter(lonLat, 9);		
            
            var polyg_button="<s:text name='frm.stand.map.draw.polygin'/>";
            $("div[title=\""+polyg_button+"\"]").on('click',function(){
            	var feature = vectorLayer.features[0];
            	var wkt_w = wkt.write(feature); 
            	var wkt_f=wkt.read(wkt_w);
            	vectorLayerPlan.addFeatures(wkt_f);
            	vectorLayer.destroyFeatures();
    	        map_a.raiseLayer(vectorLayerPlan, map_a.layers.length);//make vector layer appear on top of all layers
            });
            
            }
        
            