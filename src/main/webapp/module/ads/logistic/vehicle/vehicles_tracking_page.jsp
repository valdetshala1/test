<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache_session.jsp"%>
	
<section id="widget-grid" class="">	
	<div class="row">
		<article class="col-sm-12">
				<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-vehicle-tracking-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
					<header>
							<div class="widget-toolbar pull-left no-border">
								<span class="onoffswitch-title" rel="tooltip" data-placement="bottom" title="Gjurmimi ne kohe reale"><i class="fa fa-map-marker "></i></span>
								<span class="onoffswitch">
									<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox"  id="tracId" 
									onclick="trackOnOf(this);"/>
									<label class="onoffswitch-label" for="tracId"> <span class="onoffswitch-inner" data-swchon-text="On" data-swchoff-text="Off"></span> <span class="onoffswitch-switch"></span> </label> </span>
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
								<div class="label label-warning" >
									<span id="coordbar"></span>
							</div>
							<div class="widget-toolbar">
								<!-- add: non-hidden - to disable auto hide -->
									 <select id="projection">
										  <option value="EPSG:900916">KosovaRef: 900916</option>
									      <option value="EPSG:4326">WGS: 4326</option>
									      <option value="EPSG:900913">GoogleMap: 900913</option>
								    </select>
							</div>
						</div>	
					</header>
					<div class="row">
						<section class="col col-12">
							<div  id="map_trac" class="map_trac">
								<jsp:include page="vehicles_tracking_map.jsp"></jsp:include>
							</div>
						</section>
					</div>
					
<!-- 					</form> -->
				</div>
			</article>
	  </div>

</section>	


<script type="text/javascript">
function trackOnOf(element) {
    if (element.checked) {
    	showActualPosition=true;
    } else {
    	showActualPosition=false;
    }
}
	var log_trips_ids='';
	var bbox_result='';
	var bbox_geom='';
	var calcBesaOn="start_time";
    var geoserver_url = "<%=session.getAttribute("geoserver_url")%>";
	var geoserver_url_wfs = "<%=session.getAttribute("geoserver_url_wfs")%>";
	var gisserver_url = "<%=session.getAttribute("gisserver_url")%>";
	init_trac_map();
	function refreshTripGrid(){
		$("#tracking_grid").jqGrid('setGridParam', {  
			postData: {"start_date":$("#startDate").val(), "end_date":$("#endDate").val(), "calcBesaOn":calcBesaOn ,
				"devicesIds": $("select#deviceIds").val(), "vehicleId":$("#vehicleId").val()}}).trigger('reloadGrid'); 
	}
	
$(document).ready(function() {
	$("#printPopup").on("click",function(){   
		var link = "PrintMap.form.do";
		openDialogForm('print_page_content',link,"<s:text name="frm.print.map.form"/>",700,400);
	});
	$("#activeDeviceInfo").hide();
	$("#serverTime").removeClass();
	$("#serverTime").addClass("btn btn-primary  btn-block");
	
	$("#serverTime").click(function() {
		calcBesaOn="start_time";
		$("#serverTime").removeClass();
			$("#serverTime").addClass("btn btn-primary  btn-block");
		$("#deviceTime").removeClass();
			$("#deviceTime").addClass("btn btn-default  btn-block");
			 refreshTripGrid()
	});

	$("#deviceTime").click(function() {
		calcBesaOn="start_device_time";
		$("#deviceTime").removeClass();
			$("#deviceTime").addClass("btn btn-primary  btn-block");
		$("#serverTime").removeClass();
			$("#serverTime").addClass("btn btn-default  btn-block");
			 refreshTripGrid()
	});
	
	
	var dt_from = "2014/11/01 00:34:44";
	var dt_to = "2014/11/24 16:37:43";


	$("#startDate").change(function() {
		if($("#endDate").val())
		   refreshTripGrid();
	});
	$("#endDate").change(function() {
		if($( "#startDate" ).val())
		refreshTripGrid();
	});
	
	$('.slider-time').html(dt_from);
	$('.slider-time2').html(dt_to);
	var min_val = Date.parse(dt_from)/1000;
	var max_val = Date.parse(dt_to)/1000;

	function zeroPad(num, places) {
	  var zero = places - num.toString().length + 1;
	  return Array(+(zero > 0 && zero)).join("0") + num;
	}
	function formatDT(__dt) {
	    var year = __dt.getFullYear();
	    var month = zeroPad(__dt.getMonth()+1, 2);
	    var date = zeroPad(__dt.getDate(), 2);
	    var hours = zeroPad(__dt.getHours(), 2);
	    var minutes = zeroPad(__dt.getMinutes(), 2);
	    var seconds = zeroPad(__dt.getSeconds(), 2);
	    return year + '-' + month + '-' + date + ' ' + hours + ':' + minutes + ':' + seconds;
	};
	$("#slider-range").slider({
	    range: true,
	    min: min_val,
	    max: max_val,
	    step: 10,
	    values: [min_val, max_val],
	    slide: function (e, ui) {
	        var dt_cur_from = new Date(ui.values[0]*1000); //.format("yyyy-mm-dd hh:ii:ss");
	        $('.slider-time').html(formatDT(dt_cur_from));

	        var dt_cur_to = new Date(ui.values[1]*1000); //.format("yyyy-mm-dd hh:ii:ss");                
	        $('.slider-time2').html(formatDT(dt_cur_to));
	    }
	});

	$('#startDate').datetimepicker({
		lang: 'al',
		format: 'Y-m-d h:i:s',
		mask: false,
		formatDate:'Y-m-d h:i:s',
		timepicker: true
	});

	$('#endDate').datetimepicker({
		lang: 'al',
		format: 'Y-m-d h:i:s',
		mask: false,
		formatDate:'Y-m-d h:i:s',
		timepicker: true
	});

	
//     $("#nouislider-3").noUiSlider({
//         range: [0, 1000],
//         start: [264, 776],
//         step: 1,
//         connect: true,
//         slide: function () {
//             var values = $(this).val();
//             $(".nouislider-value").text(values[0] + " - " + values[1]);
//         }
//     });
	$('#deviceIds').tokenize({
	    datas: "Input.devices.do?vehicle_id="+$("#vehicleId").val(),
	    searchParam: 'name_startsWith',
	    newElements: true,
	    valueField: 'id',
	    textField: 'name',
	    dataType: 'json',
	    onAddToken: function(value, text){
	    	console.log(value + ", " + text);
	    	refreshTripGrid()
		}
	});

});

</script>
