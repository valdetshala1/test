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
        	jQuery("#assetsstafassign_grid").jqGrid({
        	   	url:'AssetsGrid.assetsStaffAssign.do?assetId='+$("#assetId").val(),	
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
        	        	   	'<s:text name="asset.grid.asset"/>', 
        	        	   	'<s:text name="report.damage.grid.label.employee"/>', 
        	        	   	'<s:text name="asset.label.autorization.date"/>',
        	        	   	'<s:text name="report.thinning.grid.label.created.by"/>', 
        	        	   	'<s:text name="report.thinning.grid.label.created.time"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'assets',index:'assets', width:'100%'},
        	   		{name:'employee_id',index:'employee_id', width:'100%'},
        	   		{name:'date_of_autorization',index:'date_of_autorization', width:'100%', align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"center",sortable:false},
        	   		{name:'created_time',index:'created_time', width:'100%', align:"center",sortable:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#assetsstafassign_grid_pager',
        	   	sortname: 'asa.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "AssetsStaffAssign.form.do?assetStaffAssignId=" + rowData.id;
    				loadURL(link, $("#assetsstaffassign_form_content"));
   				}

        	});
              	
        	jQuery("#assetsstafassign_grid").jqGrid('navGrid','#assetsstafassign_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#assetsstafassign_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#assetsstafassign_grid_pager',{
        	   	   caption:"", 
        	   	   title:'<s:text name="label.button.edit"/>',
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "AssetsStaffAssign.form.do?assetStaffAssignId=" + rowData.id;
            				loadURL(link, $("#assetsstaffassign_form_content"));
        	   			}else{
        	   				alert('<s:text name="tender.request.alarm"/>');
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_assetsstafassign_container').width();
            $('#assetsstafassign_grid').setGridWidth(width);
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
		
			<div id="jqGrid_assetsstafassign_container">
<!-- 				<table id="assetsstafassign_grid" class="scroll" cellpadding="0" cellspacing="0"></table>  -->
				<table id="assetsstafassign_grid" class="scroll"></table> 
				<div id="assetsstafassign_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
