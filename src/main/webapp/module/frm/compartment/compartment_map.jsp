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
var mu, compartments, stand, plots, fmr;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";
var vectorLayer,vectorLayerRoad;
var selectFeature;
var splitFeature="";
var sel_wfs_features = [];
var vgis_stand_active_wfs;
var vgis_comp_active;
var snap;
var featureEdit;
var showInfo=false;
var mapLayers=[];
var renderer;
var styles_wfs;
var munNameChecked;
var toSaveSplit=true;

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

//START SPLIT
/**
 * Upon completion of the splitter sketch, look for target polygons to split.
 */
 function jumpToAltitude(link){
	
 	var index = $("#com_tab>div").index($("#profile_tab"));
 	$( "#com_tab" ).tabs( "enable", index );
//  	$("#profileLink").val(link);
     $('#com_tab').tabs({ active: index });	

     var url = "Compartment.altitudeProfile.do?profileLink="+link;
 	 loadURL(url, $("#profile_tab"));
 }
 var wigdet_panel;

function getAltitude(event) {
	featureEdit.removeAllFeatures();
	 var splitter = event.feature;
	    splitter.geometry.transform(
				   new OpenLayers.Projection("EPSG:900913"),
			       new OpenLayers.Projection("EPSG:900916")
				   ); 
	     var candidate_obj = wkt.write(splitter);
	     var link="Input.getAltitudeProfile.do?linestring="+candidate_obj;
	     jumpToAltitude(link);
	     splitter.geometry.transform(
				   new OpenLayers.Projection("EPSG:900916"),
			       new OpenLayers.Projection("EPSG:900913")
				   ); 
	     
    return false;
}
function handleSplitDraw(event) {
    var splitter = event.feature;
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
	var wkt_obj = wkt.write(line);
	var lineFeature = wkt.read(wkt_obj);
	lineFeature.geometry.transform(
			   new OpenLayers.Projection("EPSG:900913"),
		       new OpenLayers.Projection("EPSG:900916")
			   ); 
	var link = "Input.splitStands.do?linestring="+lineFeature.geometry+"&sid="+$("#stand\\.id").val();
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
			$("#saveStand").show();
		},
		complete:function(jqXHR, textStatus){
		}
	});
}
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
				vgis_stand_active_wfs.refresh({force:true});
				splitFeature="";
				//standsWms.redraw(true);  
			}    	    					
		},
		complete : function(jqXHR, textStatus) {
		}
		});
	}
	//END SPLIT

	//START UNION
	function saveUnionPolygon(){
		console.log("sel_wfs_features length: " + sel_wfs_features.length);
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
		  var geo = getGeo(process_array);
		  console.log("geo: " + geo);
		  if(geo){
		  	var myform = $('<form>').appendTo('body');
		    $input1 = $('<input type="hidden" name="selectedSids"/>').val(sel_wkt_ids.join(";"));
		    $input2 = $('<input type="hidden" name="polygon"/>').val(geo);
		    $input3 = $('<input type="hidden" name="standId"/>').val($("#sids").val());
		    $input4 = $('<input type="hidden" name="compId"/>').val($("#stand.\\compartment\\.id").val());

		    myform.append($input1);
		    myform.append($input2);
		    myform.append($input3);
		    myform.append($input4);
		    console.log(myform.serialize());
			$.ajax({
				type : "GET",
				url : "StandUnionSave.do",
				data: myform.serialize(),
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { 
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { 
					console.log(data);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						
						$.smallBox({
							title : "<s:text name='global.grid.pagebar.button.SaveOk'/>",
							content : "<s:text name='wine.smallBox.message.contet'/>!",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});		
						
						vgis_stand_active_wfs.refresh({force:true});
						standsWms.redraw(true); 
						sel_wfs_features.length = 0;
						sel_wfs_features = [];									
						
					}else{
						$.smallBox({
							title : "<s:text name='global.grid.pagebar.button.SaveNotOk'/>",
							content : "<s:text name='wine.smallBox.message.contet'/>!",
							color : "#739G73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
					}    	    					
				},
				complete : function(jqXHR, textStatus) {
				}
			});
	  }        
	}
	//END UNION

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
					title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Overlaped <span class='txt-color-orangeDark'><strong><s:text name='law.suit.label.stand'/> </strong></span> ?",
					content : $.logoutMSG || "<s:text name='stand.map.overlaped'/><br>"+text ,
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
	        var result=checkGeometrysInMunicipality($("#mun_id").val(),polygonFeature.geometry);
            if(result=="f"){
        		var textMessage='<s:text name="frm.fire.polygon.mun.check.message1"/>'+$("#mun_name").val()+'<s:text name="frm.fire.polygon.mun.check.message2"/>'+munNameChecked;
          		$.SmartMessageBox({
    				title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> "+textMessage +" </strong></span>",
    				buttons : '[OK]',
    				icon : "fa fa-bell"
    			});
	         }else{
	 	     	var text = getOverlapStand(polygonFeature.geometry);
	 	     	if(text){
			 	   	$.SmartMessageBox({
						title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Overlaped <span class='txt-color-orangeDark'><strong><s:text name='law.suit.label.stand'/> </strong></span> ?",
						content : $.logoutMSG || "<s:text name='stand.map.overlaped'/><br>"+text ,
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
	}

function getOverlapStand(polygonFeature){
	var standId = new Array();
	var area = new Array();
	var link;
	if(polygonFeature){
		link = "Input.getOverlapStand.do?polygon="+polygonFeature+"&stand_id="+$("#stand\\.standId").val();
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
//var WGS84 = new OpenLayers.Projection("EPSG:4326");
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

//OpenLayers.DOTS_PER_INCH = 25.4 / 0.28;
OpenLayers.DOTS_PER_INCH = 90.71428571428572;

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
				  var featurecollection = jqXHR.responseText;
// 					var format_empty = new OpenLayers.Format.GeoJSON({
// 					});	
// 				var format = new OpenLayers.Format.GeoJSON({
// 				  'internalProjection': new OpenLayers.Projection("EPSG:900916"),
// 				  'externalProjection': new OpenLayers.Projection("EPSG:4326")
// 				});
				//var jsonstring = format.write(vector_layer.features);
 					
	           var geojson_format = new OpenLayers.Format.GeoJSON({
	        	'internalProjection': new OpenLayers.Projection("EPSG:900913"),
				'externalProjection': new OpenLayers.Projection("EPSG:900916")				           
		       });

	           featureEdit.destroyFeatures();
	           var featureObject = geojson_format.read(featurecollection);
	           featureEdit.addFeatures(featureObject);
	           
	           map.zoomToExtent(featureEdit.getDataExtent(),false);
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

	           featureEdit.destroyFeatures();
	           var featureObject = geojson_format.read(featurecollection);
	           featureEdit.addFeatures(featureObject);
	           
	           map.zoomToExtent(featureEdit.getDataExtent(),false);
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}

function loadLineFeature(lineId){
	var url ='MUnitMapJson.lineFeature.do?line_temp_id=' +lineId;
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

	           vectorLayerRoad.destroyFeatures();
	           var featureObject = geojson_format.read(featurecollection);
	           vectorLayerRoad.addFeatures(featureObject);
	           
	           map.zoomToExtent(vectorLayerRoad.getDataExtent(),false);
			},
			complete:function(jqXHR, textStatus){
			}
		});
	}

function loadRoadFeature(roadId){
	var url ='MUnitMapJson.roadFeature.do?roadId=' +roadId;
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

	           vectorLayerRoad.destroyFeatures();
	           var featureObject = geojson_format.read(featurecollection);
	           vectorLayerRoad.addFeatures(featureObject);
	           
	           map.zoomToExtent(vectorLayerRoad.getDataExtent(),false);
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
		splitFeature="";
	}

 	function drawLayer(){
    	$.ajax({
			type : "GET", // GET or POST
			url : "FrmGrid.layerGisData.do?module=COMP", // the file to call
			async : false,
			beforeSend:function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
//					alert("error:" + errorThrown + ", status:" + status);
			},
			dataType: "json",
	        data: {
				featureClass: "P",
				style: "full",
			},
			success : function(data, status, jqXHR) { // on success..
				if(!jQuery.isEmptyObject(data)){
					for(var i=0;i<data.length;i++){
// 						pvtApr.push([j,data[i].number_of_requests]);
						var feutureStructure;
						if(data[i].service_type=='wms'){
							feutureStructure=new OpenLayers.Layer.WMS(
						            ""+data[i].store, data[i].url,
						            {
						                LAYERS: ''+data[i].feature_type_layer,
						                STYLES: '',
						                format: format,
						                tiled: data[i].tiled,
						              //  srsName: 'EPSG:900913',
//						                srs:'EPSG:900913',
										transparent: data[i].transparent
//						                tilesOrigin : map.maxExtent.left + ',' + map.maxExtent.bottom
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
									{layers: ''+data[i].feature_type_layer, format: ''+data[i].outputformat
									//srs: "EPSG:900913"
									},
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
	//var WGS84 = new OpenLayers.Projection("EPSG:4326");
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
//            scales: [74153,50000,32957,21971,14648,9765,6510,4340,2893,1929,1286,857,572,381,254,169],
            scales: [150000,100000,75000,50000,25000,15000,10000,7500,5000,2500,1500,1000,750,500,250],
        };
        wkt = new OpenLayers.Format.WKT();	
					//Initialize the map
	//creates a new openlayers map in the <div> html element id map
	map = new OpenLayers.Map ('map_comp', options, {
		controls:[
			new OpenLayers.Control.OverviewMap(),
			new OpenLayers.Control.KeyboardDefaults(),		
			new OpenLayers.Control.ScaleLine(),
			new OpenLayers.Control.Navigation({
			            dragPanOptions: {
			                enableKinetic: false
			            }
			        }),	
//			new OpenLayers.Control.PanZoom(),
			new OpenLayers.Control.LayerSwitcher(),
			new OpenLayers.Control.MousePosition({element: $('location')}),
			new OpenLayers.Control.Scale($('scale'))
		],
		
        maxZoom: '25',
		//	maxResolution: 320.978515625,
		//	resolutions: [305.74811309814453, 152.87405654907226, 76.43702827453613, 38.218514137268066, 19.109257068634033, 9.554628534317017, 4.777314267158508, 2.388657133579254, 1.194328566789627, 0.5971642833948135, 0.29858214169740677],
			resolutions: [560, 280, 209.99999999999997, 140, 70, 41.99999999999999, 27.999999999999996, 20.999999999999996, 13.999999999999998, 6.999999999999999, 2.8, 1.4, 0.7, 0.42],
			//	projection: new OpenLayers.Projection('EPSG:900913'),
			//maxExtent: new OpenLayers.Bounds(2228554.0,5137217.0,2515274.0,5423937.0),
			units: "m"
			//	,				allOverlays: true
	});

	map.addControl(new OpenLayers.Control.LayerSwitcher({'div':OpenLayers.Util.getElement('layerswitcherbox')}));
    //map = new OpenLayers.Map('map_comp', options);
		
	var scale = new OpenLayers.Control.Scale(document.getElementById("scale"));
    map.addControl(scale);	

    var coordbar = new OpenLayers.Control.MousePosition({
        'div': document.getElementById("coordbar"),
         displayProjection: $("#projection").val()
        });
    map.addControl(coordbar);

  
	//base layers
	// OSM
	var openstreetmap = new OpenLayers.Layer.OSM();
//	var google_maps = new OpenLayers.Layer.Google("Google Maps", {numZoomLevels: 20, visibility: false});
	//Google Satellite
//	var google_satellite = new OpenLayers.Layer.Google("Google Satellite", {type: google.maps.MapTypeId.SATELLITE, numZoomLevels: 20, visibility: false});				
     // terrain  
//	var google_terrain = new OpenLayers.Layer.Google("Google terrain", {type: google.maps.MapTypeId.TERRAIN, numZoomLevels: 20, visibility: false});
	var orto12 = new OpenLayers.Layer.WMS(
			"ORTOFOTO 2012",
			//"http://82.114.91.52/giserver/wms",
			 "https://tasim:tasim@skkv.rks-gov.net/geoserver/wms",
			{layers: 'kaveko:ORTOFOTO', format: 'image/png',
			srs: "EPSG:900913"
		},
			{tileSize: new OpenLayers.Size(256,256)},
			{isBaseLayer: true, singleTile: false, buffer: 0, visibility: true}
		);
	
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
    
    styles_wfs = new OpenLayers.StyleMap({
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
        renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
        renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

		var geoserver_url = "<%=session.getAttribute("geoserver_url")%>";
		var geoserver_url_wfs = "<%=session.getAttribute("geoserver_url_wfs")%>";
		var gisserver_url = "<%=session.getAttribute("gisserver_url")%>";
        // setup tiled layer
		var fake = new OpenLayers.Layer("e Zbrazet");
		fake.isBaseLayer=true;
		fake.displayInLayerSwitcher=true;
		
			
			
        fmr = new OpenLayers.Layer.WMS(
            "vgis_mu_period_active", geoserver_url,
            {
                LAYERS: 'kfis_gis:vgis_mu_period_active',
                STYLES: '',
                format: format,
                tiled: true,
				transparent: true
//                tilesOrigin : map.maxExtent.left + ',' + map.maxExtent.bottom
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
	            "Ortofoto", "https://apps.geoland-kosova.com/geoserver/IIIS/wms",
	            {
	                layers: 'IIIS:ORTOFOTO',
					STYLES: '',
	          //      srs: 'EPSG:900916',
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
		var mun = new OpenLayers.Layer.WMS(
	            "Komuna", "https://apps.geoland-kosova.com/geoserver/kaveko_enti/wms",
	            {
	                layers: 'kaveko_enti:tcadastral_municipality',
					STYLES: '',
	//                srs: 'EPSG:900916',
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
		var topo = new OpenLayers.Layer.WMS(
	            "Topografika", "http://geoportal.rks-gov.net/wms",
	            {
	                layers: 'Hartat_Topografike2015',
					STYLES: '',
	//                srs: 'EPSG:7392',
	                format: format,
	                tiled: false,
	                transparent: true,
	                },
	                {
	                buffer: 0,
	                displayOutsideMaxExtent: true,
	                isBaseLayer: false,
	                yx : {'EPSG:7392' : false},
					visibility: false
	            } 
			);
		vgis_comp_active = new OpenLayers.Layer.WMS(
	            "Ngastrat", geoserver_url,
	            {
	                layers: 'vgis_comp_active',
					STYLES: '',
//	                srs: 'EPSG:900916',
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
	 var linetemp = new OpenLayers.Layer.WMS(
	            "Rrugtë pyjore", geoserver_url,
	            {
	                layers: 'linetemp',
					STYLES: '',
//	                srs: 'EPSG:900916',
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
//	                srs: 'EPSG:900916',
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
		vgis_stand_active_wfs = new OpenLayers.Layer.Vector(
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
   					//url: geoserver_url_wfs,
   					url:"https://apps.geoland-kosova.com/geoserver/wfs",
   					featureNS : "https://apps.geoland-kosova.com/kfis",
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
		vgis_linetemp = new OpenLayers.Layer.Vector(
	            "vij e perkoheshme",
	            {minScale: '50000',
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
   					featureNS : "https://apps.geoland-kosova.com/kfis",
   					featureType: "linetemp",
   				    outputFormat: 'json', 
   				    readFormat: new OpenLayers.Format.GeoJSON() 
   					}),
   					extractAttributes: true,
   					visibility: false,
   					renderers: renderer,
   					styleMap: styles_wfs
	            } 
			);
		
			vgis_stand_active_wfs.events.on({
				
				featureselected: function(event) {
				
			        var feature = event.feature;
			        sel_wfs_features.push(feature);
					for(var i=0;i<sel_wfs_features.length;i++){
						console.log(sel_wfs_features[i].attributes.id);
					}	
			    }
			});	
	
			//select.removeFeatures([e.feature]); 
			vgis_stand_active_wfs.events.on({
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
	                        	var ctrl_split = map.getControlsBy("id", "split")[0];
	                        
	     						if (ctrl_split.active) {
		                            handleSplitDraw(event);
		                            proceed = false;
		                            toSaveSplit=true;
		                           }else{
			                           getAltitude(event);
										}
	                        }
	                        return proceed;
	                    }
	                }						
        		}
		            					 
	        );
		 vectorLayerRoad =   new OpenLayers.Layer.Vector('Vektori i rrugëve', 
	        		{ visibility: true, displayInLayerSwitcher: true, //styleMap: styles,
		                eventListeners: {
		                    // whenever a sketch is complete, consider splitting polys
		                    sketchcomplete: function(event) {
		                        var proceed = true;
		                        if (event.feature.geometry instanceof OpenLayers.Geometry.LineString) {
// 		                        	var ctrl_split = map.getControlsBy("id", "road")[0];
// 		     						if (ctrl_split.active) {
// 			                            handleSplitDraw(event);
// 			                            proceed = false;
// 			                           }else{
// 				                           getAltitude(event);
// 											}
		                        }
		                        return proceed;
		                    }
	                }						
     			}
		            					 
	        );
		 featureEdit =   new OpenLayers.Layer.Vector('Vektori', 
	        		{visibility: true, displayInLayerSwitcher: true, //styleMap: styles,
	                eventListeners: {
	                    // whenever a sketch is complete, consider splitting polys
	                    sketchcomplete: function(event) {
	                        var proceed = true;
	                        if (event.feature.geometry instanceof OpenLayers.Geometry.LineString) {
	                        
// 	                        	var ctrl_split = map.getControlsBy("id", "split")[0];
// 	     						if (ctrl_split.active) {
// 		                            handleSplitDraw(event);
// 		                            proceed = false;
// 		                           }else{
			                           getAltitude(event);
// 										}
	                        }
	                        return proceed;
	                    }
	                }						
     		} );
		drawLayer();
		var layerArray=[openstreetmap,orto12,fake/*,orto, topo,mun vectorLayer,vectorLayerRoad,featureEdit,standsWms, vgis_stand_active, vgis_linetemp,/*vgis_comp_active,fmr,linetemp*/];

		for(var i=0;i<mapLayers.length;i++){
			layerArray.push(mapLayers[i]);
			}
	
		 map.addLayer(vgis_stand_active_wfs);
   		map.addLayers(layerArray);
	    map.addLayer(vectorLayer);
	    map.addLayer(vectorLayerRoad);
	    map.addLayer(featureEdit);
	    map.addLayer(standsWms);
	    
	  
	    
        nav = new OpenLayers.Control.NavigationHistory();
        // parent control must be added to the map
        map.addControl(nav);

        panel1 = new OpenLayers.Control.Panel({'displayClass': 'olControlNavigationHistory', div: document.getElementById("panel1")});
        panel1.addControls([nav.next, nav.previous]);
        map.addControl(panel1);
      
        

        var snapVertex = {methods: ['vertex', 'edge'], layers: [vectorLayer, vgis_stand_active_wfs]};
        controlEditLine={
                deleteShape: new OpenLayers.Control.SelectFeature(
                		vectorLayerRoad, 
              			    {
              			        displayClass: "olControlDelete",
              			        title: '<s:text name='frm.stand.map.feature.deletebtn'/>',
              			        eventListeners: {
              			            featurehighlighted: function overlay_delete(event) {
              			                var feature = event.feature;
              			                if( confirm("<s:text name='frm.stand.map.feature.delete.msg'/>") ) { // prompt
              			                	vectorLayerRoad.removeFeatures( [ feature ] );

              			                }
              			            }
              			        }   
              			    } 
              			),
              	 lineRoad: new OpenLayers.Control.DrawFeature(vectorLayerRoad,
                                 OpenLayers.Handler.Path,
                                 {'displayClass': 'olControlDrawFeaturePath',
      	               			 title: "Drow Road", 
      	               			 id:"drawRoadId",
                                 handlerOptions: {holeModifier: "altKey"}}),
              	 modifyRoad: new OpenLayers.Control.ModifyFeature(vectorLayerRoad,
                                 {'displayClass': 'olControlModifyFeature',
                      	 		  title: "<s:text name='frm.stand.map.feature'/>", 
                      	 		  id:'modifyRoadId',
                                  snappingOptions: snapVertex,
                                  onModification: onModification,
                                  onModificationEnd: onModificationEnd
                     	}) 
            
                };
        controlEditPolygon={
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
                 save: new OpenLayers.Control.Button(
                                 {displayClass: 'olControlSaveFeature', 
                                 trigger: function() {
          						 var ctrl_split = map.getControlsBy("id", "split")[0];
          						if (ctrl_split.active && toSaveSplit==true) {
          							$.SmartMessageBox({
          								title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> <s:text name='label.button.save'/> <span class='txt-color-orangeDark'><strong><s:text name='frm.compartment.stands'/></strong></span> ?",
          								content : $.logoutMSG || "<s:text name='frm.stand.split.save.text'/>." ,
          								buttons : '[No][Yes]'
          	
          							}, function(ButtonPressed) {
          								if (ButtonPressed === "Yes") {
          									splitPolygon();
          								}
          								
          							});	
              						toSaveSplit=false;
          							
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
          										var vidcontent = '<select name="sids" id="sids" style="background-color: #007700;" onchange="alert("test");">';
          										for(i=0;i<sel_wfs_features.length;i++){
          											vidcontent += "<option value=\"" + sel_wfs_features[i].attributes.id + "\">" + sel_wfs_features[i].attributes.stand_id + "</option>";
          										}
          										vidcontent += "</select>";
          											
          										$.SmartMessageBox({
          											title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Save <span class='txt-color-orangeDark'><strong><s:text name='law.suit.label.stand'/> Merge</strong></span> ?",
          											content : $.logoutMSG || "<s:text name='map.merge.validate'/>." + vidcontent,
          											buttons : '[No][Yes]'
          				
          										}, function(ButtonPressed) {
          											if (ButtonPressed == "Yes") {
          												saveUnionPolygon();	
          											}
          											return false;
          										});	
          										$.SmartMessageBox({
          											title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> MULTIPOLYGON <span class='txt-color-orangeDark'><strong><s:text name='frm.stand.map.merge'/></strong></span> !",
          											content : $.logoutMSG || "",
          											buttons : '[Ok]'
          										});
          									}else{
          			                	   		var vidcontent = '<select name="sids" id="sids" style="background-color: #007700;" onchange="alert("test");">';
          										for(var i=0;i<sel_wfs_features.length;i++){
          											vidcontent += "<option value=\"" + sel_wfs_features[i].attributes.id + "\">" + sel_wfs_features[i].attributes.stand_id + "</option>";
          										}
          										vidcontent += "</select>";
          											
          										$.SmartMessageBox({
          											title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Save <span class='txt-color-orangeDark'><strong><s:text name='map.union.polygons'/></strong></span> ?",
          											content : $.logoutMSG || "<s:text name='map.save.union.validate'/>." + vidcontent,
          											buttons : '[No][Yes]'
          				
          										}, function(ButtonPressed) {
          											if (ButtonPressed == "Yes") {
          												saveUnionPolygon();	
          											}
          											return false;
          										});	
          									}	
          							}else{
          						      	$.SmartMessageBox({
          									title : "<i class='fa fa-sign-out txt-color-orangeDark'></i> Save <span class='txt-color-orangeDark'><strong>Stand Union</strong></span> !",
          									content : $.logoutMSG || "<s:text name='map.merge.validate'/>.",
          									buttons : '[Ok]'

          								}, function(ButtonPressed) {
          									if (ButtonPressed == "Ok") {
          									}

          								});								
          							}						
          						}
                              }, 
                           	title: '<s:text name="global.grid.pagebar.button.save"/>' }),
                        	line: new OpenLayers.Control.DrawFeature(vectorLayer,
                                    OpenLayers.Handler.Path,
                                    {'displayClass': 'olControlDrawFeaturePath',
                        			title: "<s:text name='frm.stand.map.draw.line'/>", 
                        			id:"split",
                                    handlerOptions: snapVertex}),
                 union: new OpenLayers.Control.SelectFeature(vgis_stand_active_wfs,
 	                       {'displayClass': 'olControlMergeFeatures',
    	                   title: "<s:text name='frm.stand.map.merge'/>", 
    	                   id:"union",
    	            	   clickout: true, toggle: true,
    	                   multiple: true, hover: false,
    	                   toggleKey: "ctrlKey", // ctrl key removes from selection
    	                   multipleKey: "shiftKey"}),
    	         polygon: new OpenLayers.Control.DrawFeature(vectorLayer,
    	                           OpenLayers.Handler.Polygon,
    	                           {'displayClass': 'olControlDrawFeaturePolygon',
    	               			title: "<s:text name='frm.stand.map.draw.polygin'/>", 
    	               			id:'drawPolygonId',
    	                           handlerOptions: {holeModifier: "altKey"}}),
                 modify: new OpenLayers.Control.ModifyFeature(vectorLayer,
                         {'displayClass': 'olControlModifyFeature',
              	 		 title: "<s:text name='frm.stand.map.feature'/>",
              	 		 id:'modifyId', 
                          snappingOptions: snapVertex,
                          onModification: onModification,
                          onModificationEnd: onModificationEnd
             			}) 
                };
        controlEdit = {
        	
             	length: new OpenLayers.Control.DynamicMeasure(
      			        OpenLayers.Handler.Path,  { geodesic: true, 'displayClass': 'olControlDynamicMeasureLength', title:'Matja e distances'}),
     			        


 	    		area: new OpenLayers.Control.DynamicMeasure(
 	        		 OpenLayers.Handler.Polygon
 	        		 , {
 	        			geodesic: true, 'displayClass': 'olControlDynamicMeasureArea', title:'Matja e siperfaqes', 
 	        		  	        			snappingOptions: snapVertex
 			        		 }
 	        		 ),
	       
        		nav1:  new OpenLayers.Control.Navigation(
        				{ 'displayClass': 'olControlNavigation', tooltip: "Zoom In" }),  
                 
            	zoombox: new OpenLayers.Control.ZoomBox(
            			{alwaysZoom:true, 'displayClass': 'olControlZoomBox', tooltip: "Zoom In" }),
        	
                lineAltitude: new OpenLayers.Control.DrawFeature(featureEdit,
                        OpenLayers.Handler.Path,
                        {'displayClass': 'olAltitude',
            			title: "<s:text name='frm.stand.map.altitude.profile'/>", 
            			id:"altitude"}),
               
//                   	print: new OpenLayers.Control.Button(
//                             {displayClass: 'olControlSaveFeature', 
//                         trigger: function() {
//                             var url ='RequestType.print.do?printLayers='+printLayers();
//                         	openDialogForm('print_mao',url,"PrinsnappPrt Maap!",500,500);
//                          }, 
//                       	title: 'Print' })
           
             };
        snap = new OpenLayers.Control.Snapping({
	        layer: vectorLayer,
	        targets: [vectorLayer, vgis_stand_active_wfs],
	        greedy: false
	    });
	    snap.activate(); 

        
         wigdet_panel = new OpenLayers.Control.Panel({'displayClass': 'olControlEditingToolbar', 'div': OpenLayers.Util.getElement('mapcontrols')});
        for(var key in controlEdit){
        	wigdet_panel.addControls([controlEdit[key]]);
            }
        for(var key in controlEditPolygon){
        	wigdet_panel.addControls([controlEditPolygon[key]]);
            }

        map.addControl(wigdet_panel);
        
        selectFeature = new OpenLayers.Layer.Vector("Selection", {
            styleMap: new OpenLayers.Style(OpenLayers.Feature.Vector.style["select"])
        });
    			 
		// map extent

//		var mapextent = new OpenLayers.Bounds(7419294.456, 4634786.121, 7564763.285, 4792623.516).transform(RKS, map.getProjectionObject());
		var mapextent =  new OpenLayers.Bounds(2228554.0,5137217.0,2515274.0,5423937.0);		
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

	    $("div[title=\"<s:text name='frm.stand.map.draw.line'/>\"]").on('change',function(){
			$("#saveStand").hide();
		});
    }
    function popupDestroy(e) {
    	if (popup != null) {
    		popup.destroy();
    		popup = null;
    	}
    	e.stopPropagation();
    }
    
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
			map.addPopup(popup);
			popup.events.register("click", map, popupDestroy);
       }	
	    
	}
    function standInfo(standId,compId,mupId){
    	var actNr = $("#com_tab").tabs("option", "active");
    	var isActive=(actNr==2);
    	if(isActive && standId!=null){
	        var link = "Stand.form.do?standId=" + standId;
	    	loadURL(link,$("#stand_form_content"));
	    	loadStandFeature(standId);
		}else{
			$("#comp_id").val(compId);
	    	$("#mup_id").val(mupId);
	    	$("#standId").val(standId);
		}
    	$( "#com_tab" ).tabs( "enable", 1 );
    	$( "#com_tab" ).tabs( "enable", 2 );
        $('#com_tab').tabs({ active: 2 });
        
		
	}
    function doGetFeatureInfoPopup(evt){
		if(showInfo){
			var point = map.getLonLatFromPixel(evt.xy);
			var position = point.transform(new OpenLayers.Projection("EPSG:900913"), new OpenLayers.Projection("EPSG:900916"));
			
	        var params = {
	                BBOX: map.getExtent().toBBOX(),
	                lonlat : position,
	                activeLayer: activeLayerId
	               };
	       mouseLoc = map.getLonLatFromPixel(evt.xy);
	       
	       var request = OpenLayers.Request.GET({
	    	    url: "MUnitMapJson.infopoint.do",
	    	    data: params,
	    	    params: params,
	    	    callback: mapInfoHandler
	    	});
	       OpenLayers.Event.stop(zevt);
		}
	}
    function infoOnOf(element) {
 	    if (element.checked) {
 	    	showInfo=true;
 	    	 map.events.register('click', map, function (e) {doGetFeatureInfoPopup(e); });
 	    } else {
 	    	showInfo=false;
 	    }
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
   
    var projectionSelect = $('#projection');
	projectionSelect.on('change', function() {
 		 var coordbar = new OpenLayers.Control.MousePosition({
  	        'div': document.getElementById("coordbar"),
 	         displayProjection: $('#projection').val()
  	      });
 	    map.addControl(coordbar);
	});


</script>
<div  id="map_comp" class="map_comp"></div>
</body>
</html>