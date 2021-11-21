var renderer;
var styles_wfs;


var map, editor;
        var orto,  pedolo, mu, compartments, stand, plots, fmr;
        var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";
        
            function init(){
			
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

            }
            