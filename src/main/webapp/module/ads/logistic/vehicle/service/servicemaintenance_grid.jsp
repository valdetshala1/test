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
        	jQuery("#servicemaintenance_grid").jqGrid({
        	   	url:'LogisticGrid.vehicleServiceMaintenance.do?vehicleId='+$("#vehicleId").val(),	
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
        	        	   	'<s:text name="finance.costs.label.expenditure.type"/>', 
        	        	   	'<s:text name="finance.input.label.value"/>',
        	        	   	'<s:text name="vehicles.label.date.service"/>',
        	        	   	'<s:text name="vehicles.label.date.valid"/>',
        	        	   	'<s:text name="report.thinning.grid.label.created.by"/>',
        	        	   	'<s:text name="report.thinning.grid.label.created.time"/>'
        	        	  ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'vehicles',index:'vehicles', width:'100%', align:"center",sortable:false},
        	   		{name:'expenditure_type',index:'expenditure_type', width:'100%'},
        	   		{name:'value',index:'value', width:'100%', align:"center"},
        	   		{name:'date_service',index:'date_service', width:'100%', align:"center"},
        	   		{name:'date_valid',index:'date_valid', width:'100%', align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%',align:"left"},
        	   		{name:'created_time',index:'created_time', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#servicemaintenance_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "VehiclesServiceMaintenance.form.do?vehicleServiceMaintenanceId=" + rowData.id;
    				loadURL(link, $("#servicemaintenance_form_content"));
   				}
        	});
              	
        	jQuery("#servicemaintenance_grid").jqGrid('navGrid','#servicemaintenance_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#servicemaintenance_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#servicemaintenance_grid_pager',{
        	   	   caption:"", 
        	   	   title:"<s:text name="label.button.edit"/>", 
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "VehiclesServiceMaintenance.form.do?vehicleServiceMaintenanceId=" + rowData.id;
            				loadURL(link, $("#servicemaintenance_form_content"));
        	   			}else{
        	   	   			alert("<s:text name="global.please.select.row"/>"); 
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_servicemaintenance_container').width();
            $('#servicemaintenance_grid').setGridWidth(width);
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

			<div id="jqGrid_servicemaintenance_container">
<%-- 			<input id="vehicleId" class="vehicleId" value="<s:property value='logVehicles.id'/>" type="hidden"> --%>
				<table id="servicemaintenance_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="servicemaintenance_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
