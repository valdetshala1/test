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
        	jQuery("#register_grid").jqGrid({
        	   	url:'LogisticGrid.vehicleRegister.do?vehicleId='+$("#vehicleId").val(),	
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
        	        	   	'<s:text name="vehicles.label.registered.date"/>', 
        	        	   	'<s:text name="vehicles.label.valide.to.date"/>', 
        	        	   	'<s:text name="vehicles.label.mileage.at.register"/>', 
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="bid.grid.created.date"/>' 
        	        	  ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'vehicles',index:'vehicles', width:'100%', align:"center",sortable:false},
        	   		{name:'registered_date',index:'registered_date', width:'100%', align:"center"},
        	   		{name:'valide_to_date',index:'valide_to_date', width:'100%', align:"center"},
        	   		{name:'mileage_at_register',index:'mileage_at_register', width:'100%', align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"center"},
        	   		{name:'created_time',index:'created_time', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#register_grid_pager',
        	   	sortname: 'l.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "VehiclesRegister.form.do?vehicleRegisterId=" + rowData.id;
    				loadURL(link, $("#register_form_content"));
    			}

        	});
              	
        	jQuery("#register_grid").jqGrid('navGrid','#register_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#register_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#register_grid_pager',{
        	   	   caption:"", 
        	   	   title:"<s:text name="label.button.edit"/>", 
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "VehiclesRegister.form.do?vehicleRegisterId=" + rowData.id;
        					loadURL(link, $("#register_form_content"));
        	   			}else{
        	   	   			alert("<s:text name="global.please.select.row"/>"); 
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_register_container').width();
            $('#register_grid').setGridWidth(width);
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
		
			<div id="jqGrid_register_container">
<%-- 			<input id="vehicleId" class="vehicleId" value="<s:property value='logVehicles.id'/>" type="hidden"> --%>
				<table id="register_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="register_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
