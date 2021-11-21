<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>

<style>
.widget-toolbar {
    display: inline-block;
    float: right;
    width: auto;
    height: 32px;
    line-height: 32px;
    position: relative;
    border-left: 1px solid rgba(0, 0, 0, .09);
    cursor: pointer;
    padding: 0 8px;
    text-align: center;
}
.dhpet_vsplitter{
	left: 49% !important;
	display: none;
}
.no-padding {
    padding: 0!important;
}
.no-padding>pre {
    margin: 30px;
}
.splitter_panel .right_panel{
    position: absolute;
}
.splitter_panel .right_panel {
    right: 1.3% !important;
}
#dhpetmap{
	float: left; 
	width: 50% !important; 
	height: 100%;
	position: relative;
}

#dhpet_map {
	clear: both;
	position: relative;
	width: auto;
	height: 700px;
	border: 0px solid black;
}
@media (max-width: 800px){
	
	#dhpet_tabs{
		clear:both !important;
		position: relative !important;
		width: 100% !important;
	}
	
	.dhpet_vsplitter{
 		display: none !important;
	}
	#dhpetmap{
		width:100% !important;
	}
	#dhpet_map_content {
		width:98% !important;
	}
}
</style>
<head>
</head>
<body>    		    
<div id="container" >
<div id="location_map_page">
<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-compartment-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
<%-- 					<span class="widget-icon"> <i class="fa fa-eye"></i></span> --%>
<%-- 					<h2><s:text name="frm.compartment.data.grid"/></h2> --%>

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
							<div class="label label-warning" s>
								<span id="coordbar"></span>
							</div>
						</div>
						<div class="widget-toolbar">
							 <select id="projection">
								  <option value="EPSG:900916">KosovaRef: 900916</option>
							      <option value="EPSG:4326">WGS: 4326</option>
							      <option value="EPSG:900913">GoogleMap: 900913</option>
						    </select>
						</div>
						
						<div class="widget-toolbar  pull-left no-border">
		                    <div>
					            <a class="dropdown-toggle" href="#" data-toggle="dropdown" id="navLogin"   rel="tooltip" data-placement="bottom" title="Snapping Setting">
					            	<i class="icon-append fa fa-cogs"></i>
					            </a>
					            	
					            <div id="snappbox" class="dropdown-menu pull-right">
					            	<li class="dropdown" id="dhpet_snap">
					            		<div  >
											<form action="" id="snapp-form" class="smart-form" novalidate="novalidate">
												<div class="table-responsive">
													<input type="checkbox" id="snap_toggle" />
													<label>Snapping Setting</label>
														<table class="table table-bordered" id="snap_options">
															<thead>
																<tr>
																	<th>layers</th>
																	<th>node</th>
																	<th>vertex</th>
																	<th>edge</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>vectorLayer</td>
																	<td><input type="checkbox" id="0_node" /><input id="0_nodeTolerance" type="text" size="3" /></td>
																	<td><input type="checkbox" id="0_vertex" /><input id="0_vertexTolerance" type="text" size="3" /></td>
																	<td><input type="checkbox" id="0_edge" /><input id="0_edgeTolerance" type="text" size="3" /></td>
																</tr>
															</tbody>
														</table>
												</div>
											</form>
										</div>
									</li>	
			                    </div>	
					   	 	</div>
				    	</div>	
				</header>
				
<!-- 				<div id="dhpet_page_splitter" style="width: auto; height: 100%; padding-right: 0px;"> -->
					<div id="dhpetmap" style=" border-bottom-width: 0px; height: 916px;padding-bottom: 13px;" > 
						<div id="dhpet_map_content" style="float: left; width: 95%; height: 100%;"> 
							<div class="widget-body no-padding">
<!-- 								<div  id="fal_map" class="fal_map"></div> -->
									<jsp:include page="map.jsp"></jsp:include>
							</div>
						</div>
					</div>
					<div id="location_board_content" style="border: none; float: right; width: 50%; height: 100%;  font-size:90%;">	
						<jsp:include page="../location/location_board.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</article>
		<!-- END NEW WIDGET -->
		</div>
	<!-- end row -->
</section>	
<!-- end widget grid -->
<script type="text/javascript">
	var $tabs = $('#locationTabs').tabs({
	activate: function(event ,ui){
		var actNr = $("#locationTabs").tabs("option", "active");
		if(actNr==0){
			$( "#locationTabs" ).tabs( "option", "disabled", [ 1, 2, 3, 4 ] );
			$("#dhpetLocationId").val(null);
	}else if(actNr==1){
		var link = "AnimalLocation.page.do";
    	loadURL(link, $("#location_animal"));
   	}else if(actNr==2){
		var link = "HuntGroundEval.page.do";
    	loadURL(link, $("#hunt_ground_eval"));
   	}else if(actNr==3){
		var link = "AnimalCapacity.page.do";
    	loadURL(link, $("#animal_capacity"));
   	}else if(actNr==4){
		var link = "HuntedAnimal.page.do";
    	loadURL(link, $("#hunted_animal"));
   	}
}
});	

	
	init();
// 	$('#dhpet_page_splitter').css({width: '100%', height: '100%'}).split({orientation: 'vertical', position:'50%'});
    window.dispatchEvent(new Event('resize'));
    $(document).ready(function() {
    	$("#printPopup").on("click",function(){
    		var link = "PrintMap.form.do";
    		openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",400,150);
    	});
    });
</script>
</div>
</body>
</html>
