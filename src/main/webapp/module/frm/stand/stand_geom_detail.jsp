<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>

</head>
<body>    		    
<div id="container">
<br>

<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-employee-form -->
			<!-- data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-fire-grid-" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
		
				<table id="user" class="table table-bordered table-striped" style="clear: both">
							<tbody>
								<tr>
									<td style="width:65%;"><s:text name="stand.geom.detail.min.elevation"/></td>
									<td style="width:35%" ><a  id="standGeomDetails.minElevation" data-type="text" data-pk="1" data-original-title=""><s:property value='standGeomDetails.minElevation'/></a></td>
								</tr>
								<tr>
									<td><s:text name="stand.geom.detail.max.elevation"/></td>
									<td><a  id="standGeomDetails.maxElevation" data-type="text" data-pk="1" data-original-title=""><s:property value='standGeomDetails.maxElevation'/></a></td>								
								</tr>
								<tr>
									<td><s:text name="stand.geom.detail.mean.elevation"/></td>
									<td><a  id="standGeomDetails.meanElevation" data-type="text" data-pk="1" data-original-title=""><s:property value='standGeomDetails.meanElevation'/></a></td>								
								</tr>
								<tr>
									<td><s:text name="stand.geom.detail.min.slope"/></td>
									<td><a  id="standGeomDetails.minSlop" data-type="text" data-pk="1" data-original-title=""><s:property value='standGeomDetails.minSlop'/></a></td>								
								</tr>
								<tr>
									<td><s:text name="stand.geom.detail.max.slope"/></td>
									<td><a  id="standGeomDetails.maxSlope" data-type="text" data-pk="1" data-original-title=""><s:property value='standGeomDetails.maxSlope'/></a></td>								
								</tr>
								<tr>
									<td><s:text name="stand.geom.detail.mean.slope"/></td>
									<td><a  id="standGeomDetails.meanSlope" data-type="text" data-pk="1" data-original-title=""><s:property value='standGeomDetails.meanSlope'/></a></td>								
								</tr>
								<tr>
									<td><s:text name="stand.geom.detail.exp"/></td>
									<td><a  id="standGeomDetails.exp" data-type="text" data-pk="1" data-original-title=""><s:property value='standGeomDetails.exp'/></a></td>								
								</tr>
								<tr>
									<td><s:text name="stand.geom.detail.soil.code"/></td>
									<td><a  id="standGeomDetails.soilCode" data-type="text" data-pk="1" data-original-title=""><s:property value='standGeomDetails.soilCode'/></a></td>								
								</tr>
							</tbody>
						</table>
			</div>
			<!-- END widget-employee-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		

		
	
</section>
<!-- end widget grid -->
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	$(document).ready(function () {
		$.ajax({
			type : "GET", // GET or POST
			url : "FrmGrid.geomDetails.do", // the file to call
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
						$("#minElevation").val(data[i].min_elevation);
						alert(data[i].min_elevation);
					} 
				}
			},
			complete:function(jqXHR, textStatus){
			}
		});
});

</script>

</div>
</body>
</html>
