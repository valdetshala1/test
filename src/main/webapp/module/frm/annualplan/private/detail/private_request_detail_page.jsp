<%@ page session="true" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache_session.jsp"%>
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

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
	<!-- start tabs definition -->

      <div class="col-sm-12">
     		<div class="jarviswidget jarviswidget-color-green" id="wid-id-2" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-collapsed="true">
			    <header>
					<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
					<h2>Harta</h2>	
				</header>
				<div>
					<div class="widget-body no-padding">
						
						<div class="widget-body">
								<div class="widget-toolbar pull-left no-border" id="mapcontrols-widget">
									<div id="mapcontrols" class="olControlEditingToolbar"></div>
								</div>
								<div class="widget-toolbar pull-left no-border" id="panel1-widget" style="margin-left: -17px;">
									<div id="panel1"></div>
								</div>
								<div class="widget-toolbar" id="coordbar-widget">
									<div class="label label-warning" style="width: 100%;">
										<span id="scale"></span>
									</div>
								</div>	
								<a  id="printPopup"  class="widget-toolbar  pull-left no-border">
									<i class="fa fa-print"></i>
								</a>
								<div class="widget-toolbar" id="coordbar-widget">
									<div class="label label-warning" style="width: 100%;">
										<span id="coordbar"></span>
								</div>
							</div>	
							<div class="widget-toolbar">
							<!-- add: non-hidden - to disable auto hide -->
								 <select id="projection">
									  <option value="EPSG:900916">KosovaRef: 900916</option>
								      <option value="EPSG:4326">WGS: 4326</option>
								      <option value="EPSG:900913">GoogleMap: 900913</option>
							    </select>
							</div>
							<div>
								<jsp:include page="private_request_detail_map.jsp"></jsp:include>	
							</div>
						</div>											
					</div>
				</div>
			</div>
      </div>
      <div class="col-sm-12">
		       <div class="jarviswidget jarviswidget-color-green" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false"  data-widget-collapsed="true">
		       	<header>
					<span class="widget-icon"> <i class="fa fa-map-marker"></i> </span>
					<h2>Detajet e parceles</h2>	
				</header>
				<div>
					<div class="widget-body no-padding">
						<jsp:include page="private_request_detail_form.jsp"></jsp:include>						
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
	init1();
	$(document).ready(function() {
		$("#printPopup").on("click",function(){
			var link = "PrintMap.print_a.do";
			openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,150);
		});
		 var cadParcelid='<s:property value='parcelDetail.cadparcelid'/>';
		loadParcelFeature(cadParcelid);
	});
</script>