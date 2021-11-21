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
        	$grid = jQuery("#subproject_grid").jqGrid({
        	   	url:'MERGrid.subproject.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{project_id:$("#projId").val()},
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
        	        	   	'',
        	        	   '<s:text name="mer.project.name"/>', 
        	        	   	'<s:text name="mer.project.nameEn"/>',
        	        	   	'<s:text name="mer.project.nameSr"/>',
        	        	   	'<s:text name="mer.project.code"/>',
        	        	   	'<s:text name="mer.project.priority"/>',
        	        	   	'<s:text name="mer.project.description"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'name',index:'name', width:'200%', resizable:true},
        	   		{name:'name_en',index:'name_en', width:'200%'},
        	   		{name:'name_sr',index:'name_sr', width:'200%'},
        	   		{name:'code',index:'code', width:'50%', align:"center"},
        	   		{name:'priority',index:'priority', width:'50%', align:"center"},
        	   		{name:'description',index:'description', width:'50%'},
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created',index:'created', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#subproject_grid_pager',
        		gridComplete: function(){
        			var ids = jQuery("#subproject_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('MerSubProject','#subproject_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#subproject_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "SubProject.form.do?subprojectId=" + rowData.id;
 					loadURL(link, $("#subproject_form_content"));
   				}        		

        	});

        	jQuery("#subproject_grid").jqGrid('navGrid','#subproject_grid_pager',
                	{edit: false, add:false, del:false,search:false, refresh:true, view:false, cloneToTop: true},
        			{}, {},{},{multipleSearch:false, recreateFilter:true});
			
        	jQuery("#subproject_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#subproject_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	         					var rowData = jQuery(this).getRowData(iRow); 
	         					var link = "SubProject.form.do?subprojectId=" + rowData.id;
	         					loadURL(link, $("#subproject_form_content"));
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}  
                 	   	   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_subproject_container').width();
            $('#subproject_grid').setGridWidth(width);
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

			<div id="jqGrid_subproject_container">
				<table id="subproject_grid" class="scroll"></table> 
				<div id="subproject_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
