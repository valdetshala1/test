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
        	jQuery("#fuelconsum_grid").jqGrid({
        	   	url:'LogisticGrid.fuelConsum.do?vehicleId='+$("#vehicleId").val(),	
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
        	        	   	'<s:text name="vehicles.label.driver"/>', 
        	        	   	'<s:text name="vehicles.label.vendor"/>', 
        	        	   	'<s:text name="vehicles.label.invoice.no"/>',
        	        	   	'<s:text name="vehicles.label.date"/>',
        	        	   	'<s:text name="vehicles.label.fuel.type"/>', 
        	        	   	'<s:text name="vehicles.label.liters"/>', 
        	        	   	'<s:text name="vehicles.label.mileage.when.filled"/>', 
        	        	   	'<s:text name="vehicles.label.total.mileage"/>', 
        	        	   	'<s:text name="report.thinning.grid.label.created.by"/>',
        	        	   	'<s:text name="report.thinning.grid.label.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'vehicle',index:'vehicle', width:'100%', align:"center"},
        	   		{name:'driver',index:'driver', width:'100%'},
        	   		{name:'vendor',index:'vendor', width:'100%'},
        	   		{name:'invoiceNumber',index:'invoiceNumber', width:'100%', align:"center"},
        	   		{name:'date',index:'date', width:'100%', align:"center"},
        	   		{name:'fuelType',index:'fuelType', width:'100%', align:"center"},
        	   		{name:'liter',index:'liter', width:'100%', align:"center"},
        	   		{name:'mileageWhenFilled',index:'mileageWhenFilled', width:'100%', align:"center"},
        	   		{name:'mileageWhenFilled',index:'mileageWhenFilled', width:'100%', align:"center"},
        	   		{name:'createdBy',index:'createdBy', width:'100%', align:"center"},
        	   		{name:'createdTime',index:'createdTime', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#fuelconsum_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "FuelConsum.form.do?fuelConsumId=" + rowData.id;
    				loadURL(link, $("#fuelconsum_form_content"));
   				}        		

        	});
              	
        	jQuery("#fuelconsum_grid").jqGrid('navGrid','#fuelconsum_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#fuelconsum_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#fuelconsum_grid_pager',{
        	   	   caption:"", 
        	   	   title:'<s:text name="label.button.edit"/>',
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
            				var link = "FuelConsum.form.do?fuelConsumId=" + rowData.id;
        					loadURL(link, $("#fuelconsum_form_content"));
        	   			}else{
        	   				alert('<s:text name="tender.request.alarm"/>');
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_fuelconsum_container').width();
            $('#fuelconsum_grid').setGridWidth(width);
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
			<div id="jqGrid_fuelconsum_container">
				<table id="fuelconsum_grid" class="scroll"></table> 
				<div id="fuelconsum_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
