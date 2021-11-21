<%@ page session="true" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache_session.jsp"%>
<style type="text/css">
	/* General settings test */
	/* The map and the location bar */
#map_act {
			clear: both;
			position: relative;
			width: auto;
			height: 600px;
			border: 0px solid black;
		}
</style>
<!-- widget div-->
<div id="page_slv_content">

	<!-- widget content -->
	<div class="widget-body">
      <div class="col-sm-12">
				<div>
					<div class="widget-body no-padding">
						
						<div class="widget-body">
								<div class="widget-toolbar pull-left no-border" id="mapcontrols-widget">
									<div id="mapcontrols" class="olControlEditingToolbar"></div>
								</div>
								<div class="widget-toolbar pull-left no-border" id="panel1-widget" style="margin-left: -17px;">
									<div id="panel1"></div>
								</div>
								<a  id="printPopup"  class="widget-toolbar  pull-left no-border">
									<i class="fa fa-print"></i>
								</a>
								<div class="widget-toolbar" id="coordbar-widget">
									<div class="label label-warning" style="width: 100%;">
										<span id="scale"></span>
									</div>
								</div>	
								<div class="widget-toolbar" id="coordbar-widget">
									<div class="label label-warning" >
										<span id="coordbar"></span>
								</div>
								<div class="widget-toolbar">
									 <select id="projection">
										  <option value="EPSG:900916">KosovaRef: 900916</option>
									      <option value="EPSG:4326">WGS: 4326</option>
									      <option value="EPSG:900913">GoogleMap: 900913</option>
								    </select>
								</div>
							</div>	
							<div>
								<jsp:include page="fire_map.jsp"></jsp:include>	
							</div>
						</div>											
					</div>
				</div>
      </div>

      
		
<!-- 	</div> -->
	<!-- end tab content -->
		
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	pageSetUp();
	var geoserver_url = "<%=session.getAttribute("geoserver_url")%>";
	var geoserver_url_wfs = "<%=session.getAttribute("geoserver_url_wfs")%>";
	var gisserver_url = "<%=session.getAttribute("gisserver_url")%>";
	init();
	$(document).ready(function() {
		$("#printPopup").on("click",function(){
			var link = "PrintMap.print_a.do";
			openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,150);
		});
		if($("#firePolygon\\.id").val() &&  $("#isPoint").val()=='false'){
		 	  loadFirePolygon($("#firePolygon\\.id").val());
		 	}
		if($("#firePoint\\.id").val()&& $("#isPoint").val()=='true'){
			loadFirePoint($("#firePoint\\.id").val());
		 	}
// 		 var cadParcelid='<s:property value='parcelDetail.cadparcelid'/>';
// 		loadParcelFeature(cadParcelid);
	});
</script>