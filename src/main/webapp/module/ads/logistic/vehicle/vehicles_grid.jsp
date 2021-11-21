<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	jQuery("#vehicles_grid").jqGrid({
        	   	url:'LogisticGrid.vehicle.do',	
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
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id',
        	   				'',
        	        	   	'<s:text name="asset.legend.department"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.dest"/>', 
        	        	   	'<s:text name="vehicles.grid.brand"/>',
        	        	   	'<s:text name="vehicles.label.type"/>',
        	        	   	'<s:text name="vehicles.label.year.product"/>', 
        	        	   	'<s:text name="vehicles.label.plate.number"/>',
        	        	   	'<s:text name="vehicles.label.first.registration"/>',
        	        	   	'<s:text name="vehicles.label.number.of.seats"/>',
        	        	   	'<s:text name="vehicles.label.color"/>',
        	        	   	'<s:text name="vehicles.label.engine.code"/>',
        	        	   	'<s:text name="vehicles.label.weight"/>',
        	        	   	'<s:text name="vehicles.label.type.engine"/>',
        	        	   	'<s:text name="vehicles.label.volume.capacity"/>',
        	        	   	'<s:text name="vehicles.label.created.by"/>',
        	        	   	'<s:text name="vehicles.label.created.time"/>'
        	        	   	],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%',search:false},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'party',index:'party', width:'160%',search:false},
        	   		{name:'destination',index:'destination', width:'100%',search:false},
        	   		{name:'brand',index:'brand', width:'80%', align:"center",search:false},
        	   		{name:'type',index:'type', width:'100%', align:"center",search:true},
        	   		{name:'year_product',index:'year_product', width:'100%', align:"center",search:false},
        	   		{name:'plate_number',index:'plate_number', width:'100%',align:"center",search:false},
        	   		{name:'first_registration',index:'first_registration', width:'100%',align:"center",search:false},
        	   		{name:'number_of_seats',index:'number_of_seats', width:'100%',align:"center",search:false},
        	   		{name:'color',index:'color', width:'100%',align:"left",search:false},
        	   		{name:'engine_code',index:'engine_code', width:'100%',align:"left",search:false},
        	   		{name:'weight',index:'weight', width:'100%',align:"center",search:false},
        	   		{name:'type_engine',index:'type_engine', width:'100%',align:"left",search:false},
        	   		{name:'volume_capacity',index:'volume_capacity', width:'100%',align:"center",search:false},
        	   		{name:'created_by',index:'created_by', width:'100%',align:"center",search:false},
        	   		{name:'created_date',index:'created_date', width:'100%',align:"center",search:false},
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#vehicles_grid_pager',
        	   	  	gridComplete: function(){
        			var ids = jQuery("#vehicles_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Vehicle','#vehicles_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#vehicles_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'l.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Vehicles.profile.do?vehicleId=" + rowData.id;
 					loadURL(link, $("#vehicles_profile_content"));
   				}        		

        	});
        	jQuery("#vehicles_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#vehicles_grid").jqGrid('navGrid','#vehicles_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#vehicles_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#vehicles_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="label.button.edit"/>", 
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "Vehicles.profile.do?vehicleId=" + rowData.id;
             					loadURL(link, $("#vehicles_profile_content"));
             	   			}else{
             	   	   			alert("<s:text name="global.please.select.row"/>"); 
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
            	   	.navButtonAdd('#vehicles_grid_pager',{
             	   	   caption:"Reports",
             	   	   title:"Report",
             	   	   id:"report_button",  
             	   	   buttonicon:"ui-icon-print", 
             	   	   onClickButton: function(){
                 	   	  $("#report_button").addClass("ui-state-disabled"); 
             	   	      var link="Vehicles.reportGenerator.do";
             	   	      openDialogForm("report_generator_content",link,"Generate Reports",650,550);
             	   	   }, 
             	   	   position:"last"
             	   	});

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_vehicles_container').width();
            $('#vehicles_grid').setGridWidth(width);
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

			<div id="jqGrid_vehicles_container">
				<table id="vehicles_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="vehicles_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
