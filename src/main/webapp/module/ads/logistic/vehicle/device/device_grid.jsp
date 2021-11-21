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
        $(document).ready(function () {
//             alert($("#vehicleId").val());
        	jQuery("#device_grid").jqGrid({
        	   	url:'LogisticGrid.devices.do?vehicleId='+$("#vehicleId").val(),	
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
        	        	   	'<s:text name="vehicles.legend.vehicle"/>', 
        	        	   	'<s:text name="vehicles.label.protocol.type"/>', 
        	        	   	'<s:text name="vehicles.label.device.name"/>', 
        	        	   	'<s:text name="vehicles.label.device.uniqueid"/>',
        	        	   	'<s:text name="vehicles.label.device.phone"/>', 
        	        	 	'<s:text name="vehicles.label.active.device"/>',
        	        	   	'<s:text name="vehicles.label.status"/>', 
        	        	   	'<s:text name="hrm.skill.label.start.date"/>', 
        	        	   	'<s:text name="hrm.skill.label.end.date"/>',  
           	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="bid.grid.created.date"/>',
        	        	   	'<s:text name="vehicles.lastupdate"/>', 
        	        	   	'<s:text name="vehicles.positionid"/>' 
        	        	  ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'vehicles',index:'vehicles', width:'100%', align:"center",sortable:false},
        	   		{name:'protocol_type',index:'protocol_type',hidden:true,  width:'100%', align:"center"},
        	   		{name:'name',index:'name', width:'100%', align:"center"},
        	   		{name:'uniqueid',index:' uniqueid', width:'100%', align:"center"},
        	   		{name:'phone',index:'phone', width:'100%', align:"center"},
        	   		{name:'active_device',index:'active_device', width:'100%', align:"center"},
        	   		{name:'status',index:'status',hidden:true, width:'100%',align:"center"},
        	   		{name:'active_start_date',index:'acti  ve_start_date',hidden:false, width:'100%',align:"center"},
        	   		{name:'active_end_date',index:'active_end_date',hidden:false, width:'100%',align:"center"},
        	   		{name:'created_by',index:'created_by',hidden:false, width:'100%',align:"center"},
        	   		{name:'created_date',index:'created_date',hidden:false, width:'100%',align:"center"},
        	   		{name:'lastupdate',index:'lastupdate',hidden:true, width:'100%',align:"center"},
        	   		{name:'positionid',index:'positionid', hidden:true,width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#device_grid_pager',
        	   	sortname: 'd.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Device.form.do?vehicleDeviceId=" + rowData.id;
    				loadURL(link, $("#device_form_content"));
    			}

        	});

        	jQuery("#device_grid").jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                    {startColumnName: 'active_device', numberOfColumns: 4, titleText: '<em>Periudha aktive e paisjes:</em>'},
                ]});  
              	
        	jQuery("#device_grid").jqGrid('navGrid','#device_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#device_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#device_grid_pager',{
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
            var width = $('#jqGrid_device_container').width();
            $('#device_grid').setGridWidth(width);
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
		
			<div id="jqGrid_device_container">
<%-- 			<input id="vehicleId" class="vehicleId" value="<s:property value='logVehicles.id'/>" type="hidden"> --%>
				<table id="device_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="device_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
