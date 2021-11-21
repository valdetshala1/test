<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<script type="text/javascript">
		
		$(document).ready(function() {
			if($("#profileLink").val()){
			var points = new Array();
			var dataPofile;
			if($("#profileLink").val()){
				var link = $("#profileLink").val();
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
							points.push(data[i].y);
						}
						dataPofile=data;
					},
					complete:function(jqXHR, textStatus){
					}
				});
			}
			var point;
		$('#altitude_profile').highcharts({
	        chart: {
	            type: 'area'
	        }, title: {
                text: ' '
            },
	        xAxis: {
	            allowDecimals: false,
	            labels: {
	                formatter: function () {
	                    return this.value; // clean, unformatted number for year
	                }
	            }
	        },
	        yAxis: {
	            title: {
	                text: ''
	            },
	            labels: {
	                formatter: function () {
	                    return this.value + 'm';
	                }
	            }
	        },
	        tooltip: {
	        	formatter: function() {
		        	//this.point.point
		        	featureEdit.removeFeatures(point);
		        	point = new OpenLayers.Feature.Vector(
			    		new OpenLayers.Geometry.Point(this.point.x913, this.point.y913));
		    		featureEdit.addFeatures(point);
	        		return '<b>Altitude <br>Value: '+ Highcharts.numberFormat(this.y, 0) +' m</b><br/>';
	            }
	        },
	        plotOptions: {
	            area: {
	                pointStart: 5,
	                marker: {
	                    enabled: false,
	                    symbol: 'circle',
	                    radius: 2,
	                    states: {
	                        hover: {
	                            enabled: true
	                        }
	                    }
	                }
	            }
	        },
	        series: [{
	            name: 'Altitude',
	            data: dataPofile
	        }]
	    });
			}
		});
		</script>
		
	</head>
	<input id="profileLink" name="profileLink" value="<s:property value='profileLink'/>" type="hidden">
	<body>
		<div id="altitude_profile" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	</body>
</html>