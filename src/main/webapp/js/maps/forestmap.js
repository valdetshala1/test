        var map, editor;
        var orto,  pedolo, mu, compartments, stand, plots, fmr;
        var mapLayers=[];
        function drawLayer(){
        	$.ajax({
    			type : "GET", // GET or POST
    			url : "FrmGrid.layerGisData.do?module=DASH", // the file to call
    			async : false,
    			beforeSend:function(jqXHR, settings) {
    			},
    			error : function(errorThrown, status, jqXHR) { // on error..
//    					alert("error:" + errorThrown + ", status:" + status);
    			},
    			dataType: "json",
    	        data: {
    				featureClass: "P",
    				style: "full",
    			},
    			success : function(data, status, jqXHR) { // on success..
    				if(!jQuery.isEmptyObject(data)){
    					for(var i=0;i<data.length;i++){
//     						pvtApr.push([j,data[i].number_of_requests]);
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
    	 
            function initMapDesh(){
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
				
							//Initialize the map
			//creates a new openlayers map in the <div> html element id map
			map = new OpenLayers.Map ('map_m', options, {
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
			map.addControl(new OpenLayers.Control.LayerSwitcher({'div':OpenLayers.Util.getElement('layerswitcherbox')}));
			var scaleline = new OpenLayers.Control.ScaleLine();
			map.addControl(scaleline);
			//base layers
			// OSM
			var openstreetmap = new OpenLayers.Layer.OSM();

                // setup tiled layer

                map.addLayers([openstreetmap, /* google_maps, google_satellite, google_terrain, orto,  pedolo, mu, compartments, stand, plots,fmr*/]);
            
        		drawLayer();
        		var layerArray=[openstreetmap];

        		for(var i=0;i<mapLayers.length;i++){
        			layerArray.push(mapLayers[i]);
        			}
        	
        	    map.addLayers(layerArray);  
                editor = new OpenLayers.Editor(map, {
                activeControls: ['Navigation', 'SnappingSettings', 'SplitFeature', 'MergeFeature', 'CleanFeature', 'CADTools', 'TransformFeature', 'Separator', 'DeleteFeature', 'DragFeature', 'SelectFeature', 'Separator', 'DrawHole', 'ModifyFeature', 'Separator'],
                featureTypes: ['regular', 'polygon', 'path', 'point']
            });
            editor.startEditMode();
            			 
			// map extent
			var mapextent = new OpenLayers.Bounds(7419294.456, 4634786.121, 7564763.285, 4792623.516).transform(RKS, map.getProjectionObject());
			map.zoomToExtent(mapextent);
			var lonLat = new OpenLayers.LonLat(7483083.112, 4700630.811).transform(RKS, map.getProjectionObject());
            map.setCenter(lonLat, 9);		

            }
            