<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
<script type="text/javascript">
        function rowZoomTo(bbox,logTripsId){
        	cql_filterRefresh(logTripsId);
        	var bboxarray=bbox.split(",");
            var z=new OpenLayers.Bounds(bboxarray);
            var db=z.transform(RKS,WGS84_google_mercator);
			map_trac.zoomToExtent(db);
         }
        function zoomTo(bbox){
        	var bboxarray=bbox.split(",");
            var z=new OpenLayers.Bounds(bboxarray);
            var db=z.transform(RKS,WGS84_google_mercator);
			map_trac.zoomToExtent(db);
        }
        function cql_filterRefresh(logTripsIds){
        	var params='id in ('+logTripsIds+')';
			params=params.replace(/"/g,'\'');
			var filterParams={
					filter:null,
					cql_filter:null
			}
			if (OpenLayers.String.trim(params) != "") {
					filterParams["cql_filter"] = params;
			}
			trac.redraw(true);
			trac.mergeNewParams(filterParams);
			trac.redraw(true);
        }
        
        $(document).ready(function () {
        	jQuery("#tracking_grid").jqGrid({
        	 	postData:{start_date:$("#startDate").val(),end_date:$("#endDate").val(),devicesIds:$("select#deviceIds").val(),vehicleId:$("#vehicleId").val(),calcBesaOn:'start_time'},	
        	   	url:'LogisticGrid.tripFilter.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		jsonReader : {
   			      root:"rows",
   			      page: "page",
   			      total: "total",
   			      records: "records",
   			      repeatitems: false,
   			      id: "0"
        		},
        		height: '100%',
        		width: '100%',
        		autowidth: true,
        		shrinkToFit: true,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
            	   			'<s:text name="ads.device.zoom.menu"/>',
        	        	   	'<s:text name="ads.device.name"/>', 
        	        	   	'uniqueid', 
        	        	   	'<s:text name="ads.device.mobile.phone"/>', 
        	        	   	'min_id',
        	        	   	'max_id', 
        	        	 	'<s:text name="ads.device.protocol"/>',
        	        	   	'deviceid', 
        	        	   	'<s:text name="ads.device.start.time"/>', 
        	        	   	'<s:text name="ads.device.end.time"/>',  
           	        	   	'<s:text name="ads.device.duration.time"/>', 
        	        	   	'<s:text name="ads.device.start.device.time"/>',
        	        	   	'<s:text name="ads.device.end.device.time"/>', 
        	        	   	'<s:text name="ads.device.end.avarage.speed"/>',
        	        	   	'<s:text name="ads.device.end.max.speed"/>',
        	        	   	'',''
        	        	  ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'btn',index:'btn',hidden:false, width:'100%'},
        	   		{name:'device_name',index:'device_name', width:'100%', align:"center",sortable:false},
        	   		{name:'uniqueid',index:'uniqueid',hidden:true,  width:'100%', align:"center"},
        	   		{name:'phone',index:'phone', width:'100%', align:"center"},
        	   		{name:'min_id',index:' min_id',hidden:true, width:'100%', align:"center"},
        	   		{name:'max_id',index:'max_id',hidden:true, width:'100%', align:"center"},
        	   		{name:'protocol',index:'protocol', width:'100%', align:"center"},
        	   		{name:'deviceid',index:'deviceid',hidden:true, width:'100%', align:"center"},
        	   		{name:'start_time',index:'start_time', width:'100%',align:"center"},
        	   		{name:'end_time',index:'end_time',hidden:false, width:'100%',align:"center"},
        	   		{name:'duration_time',index:'duration_time',hidden:false, width:'100%',align:"center"},
        	   		{name:'start_device_time',index:'start_device_time',hidden:false, width:'100%',align:"center"},
        	   		{name:'end_device_time',index:'end_device_time',hidden:false, width:'100%',align:"center"},
        	   		{name:'average_speed',index:'average_speed',hidden:true, width:'100%',align:"center"},
        	   		{name:'max_speed',index:'max_speed', hidden:true,width:'100%',align:"center"},
        	   		{name:'bbox_result',index:'bbox_result',hidden:true, width:'100%'},
        	   		{name:'bbox_geom',index:'bbox_geom',hidden:true, width:'100%'}
        	   		
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#tracking_grid_pager',
        	   	sortname: 'd.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
        		loadComplete: function(data){
        			 log_trips_ids=data.logIds;
        			 cql_filterRefresh(log_trips_ids);
        			 zoomTo(data.bbox_rez);
                },
				gridComplete: function(){
        			var ids = jQuery("#tracking_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        				var rowData=jQuery("#tracking_grid").getRowData(cl);
						butt = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"rowZoomTo('"+rowData.bbox_geom+"',"+rowData.id+");\"><i class='fa fa-search-plus'></i></button>";
    					jQuery("#tracking_grid").jqGrid('setRowData',ids[i],{btn:butt});
        			}	
        		},
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Device.form.do?vehicleDeviceId=" + rowData.id;
    				loadURL(link, $("#device_form_content"));
    			}

        	});
            
        	jQuery("#tracking_grid").jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                	  {startColumnName: 'start_time', numberOfColumns: 2, titleText: '<em>Koha e serverit</em>'},
                      {startColumnName: 'start_device_time', numberOfColumns: 2, titleText: '<em>Koha e paisjes</em>'}            
            ]});  
              	
        	jQuery("#tracking_grid").jqGrid('navGrid','#tracking_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#tracking_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#tracking_grid_pager',{
        	   	   caption:"", 
        	   	   title:"<s:text name="label.button.edit"/>", 
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "Device.form.do?vehicleDeviceId=" + rowData.id;
        					loadURL(link, $("#device_form_content"));
        	   			}else{
        	   	   			alert("<s:text name="global.please.select.row"/>"); 
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	})
        	
        });
        $(window).bind('resize', function() {
            var width = $('#jqGrid_tracking_container').width();
            $('#tracking_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_tracking_container">
<%-- 			<input id="vehicleId" class="vehicleId" value="<s:property value='logVehicles.id'/>" type="hidden"> --%>
				<table id="tracking_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="tracking_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
