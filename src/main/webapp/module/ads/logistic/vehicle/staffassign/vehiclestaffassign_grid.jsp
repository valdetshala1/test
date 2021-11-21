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
        	jQuery("#vehiclestaffassign_grid").jqGrid({
        	   	url:'LogisticGrid.vehicleStaffAssign.do?vehicleId='+$("#vehicleId").val(),	
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
        	        	   	'<s:text name="report.damage.grid.label.employee"/>', 
        	        	   	'<s:text name="vehicles.grid.autorization"/>',
        	        	   	'<s:text name="vehicles.grid.date.of.autorization"/>',
        	        	   	'<s:text name="report.thinning.grid.label.created.by"/>',
        	        	   	'<s:text name="report.thinning.grid.label.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'logVehicles',index:'logVehicles', width:'100%', align:"center"},
        	   		{name:'employeeByEmployeeId',index:'employeeByEmployeeId', width:'100%'},
        	   		{name:'autorization',index:'autorization', width:'100%', align:"center",formatter:"checkbox"},
        	   		{name:'dateOfAutorization',index:'dateOfAutorization', width:'100%', align:"center"},
        	   		{name:'employeeByCreatedBy',index:'employeeByCreatedBy', width:'100%', align:"center"},
        	   		{name:'createdTime',index:'createdTime', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#vehiclestaffassign_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "VehicleStaffAssign.form.do?vehicleStaffAssignId=" + rowData.id;
    				loadURL(link, $("#vehiclestaffassign_form_content"));
   				}        		

        	});
              	
        	jQuery("#vehiclestaffassign_grid").jqGrid('navGrid','#vehiclestaffassign_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#vehiclestaffassign_grid").navButtonAdd('#vehiclestaffassign_grid_pager',{
        	   	   caption:"", 
        	   	   title:'<s:text name="label.button.delete"/>', 
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "VehicleStaffAssign.form.do?vehicleStaffAssignId=" + rowData.id;
            				loadURL(link, $("#vehiclestaffassign_form_content"));
        	   			}else{
        	   				alert('<s:text name="tender.request.alarm"/>');
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_vehiclestaffassign_container').width();
            $('#vehiclestaffassign_grid').setGridWidth(width);
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

			<div id="jqGrid_vehiclestaffassign_container">
<%-- 			<input id="vehicleId" class="vehicleId" value="<s:property value='logVehicles.id'/>" type="hidden"> --%>
				<table id="vehiclestaffassign_grid" class="scroll"></table> 
				<div id="vehiclestaffassign_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
