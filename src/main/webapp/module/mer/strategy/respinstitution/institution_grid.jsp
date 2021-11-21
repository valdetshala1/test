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
        	$grid = jQuery("#institution_grid").jqGrid({
        	   	url:'MERGrid.respInstitution.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{ strategy_id : $("#strategyId").val() },
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
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id', 
        	        	   'institution_id', 
        	        	   	'organisation_id',
        	        	   	'<s:text name="hum.employee.label.organisation"/>',
        	        	   	'<s:text name="hum.employee.label.notes"/>',
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>'
            	        	
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'institution_id',index:'sub_project_id',hidden:true},
        	   		{name:'organisation_id',index:'sub_project', hidden:true},
        	   		{name:'organisation',index:'organisation', width:'100%'},
        	   		{name:'note',index:'note', width:'100%'},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"center"},
        	   		{name:'created',index:'created',width:'100%', align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#institution_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "RespInstitution.form.do?institutionId=" + rowData.id;
 					loadURL(link, $("#institution_form_content"));
   				}        		

        	});

        	jQuery("#institution_grid").jqGrid('navGrid','#institution_grid_pager',
                	{edit: false, add:false, del:false},
        			{}, {},{},{multipleSearch:true, recreateFilter:true});
			
        	jQuery("#institution_grid").navButtonAdd('#institution_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
		             	   		var rowData = jQuery(this).getRowData(iRow); 
			             	   	var link = "RespInstitution.form.do?institutionId=" + rowData.id;
			 					loadURL(link, $("#institution_form_content"));
             	   			}
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_institution_container').width();
            $('#institution_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }
        });
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_institution_container">
				<table id="institution_grid" class="scroll"></table> 
				<div id="institution_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
