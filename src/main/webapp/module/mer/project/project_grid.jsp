<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	$grid = jQuery("#project_grid").jqGrid({
        	   	url:'MERGrid.project.do',	
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
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id', 
        	        	   	'',
        	        	   '<s:text name="mer.project.name"/>', 
        	        	   	'<s:text name="mer.project.nameEn"/>',
        	        	   	'<s:text name="mer.project.nameSr"/>',
        	        	   	'<s:text name="mer.project.code"/>',
        	        	   	'<s:text name="mer.project.pillar"/>',
        	        	   	'<s:text name="mer.project.description"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'name',index:'name', width:'100%', resizable:true},
        	   		{name:'name_en',index:'name_en', width:'100%'},
        	   		{name:'name_sr',index:'name_sr', width:'100%'},
        	   		{name:'code',index:'code', width:'100%', align:"center"},
        	   		{name:'pillar',index:'pillar',width:'100%'},
        	   		{name:'description',index:'description', width:'100%', align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created',index:'created', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#project_grid_pager',
        		gridComplete: function(){
        			var ids = jQuery("#project_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('MerProject','#project_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#project_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Project.form.do?userId=" + rowData.id;
 					loadURL(link, $("#user_form_content"));
   				}        		

        	});

        	jQuery("#project_grid").jqGrid('navGrid','#project_grid_pager',
                	{edit: false, add:false, del:false, search:false, cloneToTop: false},
        			{}, {},{},{multipleSearch:false, recreateFilter:false});
			
        	jQuery("#project_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#project_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	         					var rowData = jQuery(this).getRowData(iRow); 
	         					var link = "Project.form.do?projectId=" + rowData.id;
	         			 		openDialogForm('project_add_content',link,'<s:text name="mer.label.popup.edit.project.form"/>',800,500);
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	}).navButtonAdd('#project_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.add"/>',
             	   	   buttonicon:"ui-icon-plusthick", 
             	   	   onClickButton: function(){ 
       					var link = "Project.form.do";
     			   		openDialogForm('project_add_content',link,'<s:text name="mer.label.popup.add.project.form"/>',800,500);
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	}).navButtonAdd('#project_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.add.subproject"/>',
             	   	   buttonicon:"ui-icon-gear", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	         					var rowData = jQuery(this).getRowData(iRow); 
	         					var link = "SubProject.page.do?projId=" + rowData.id;
	         					loadURL(link, $("#subproject_page_content"));
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_user_container').width();
            $('#project_grid').setGridWidth(width);
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

			<div id="jqGrid_user_container">
				<table id="project_grid" class="scroll"></table> 
				<div id="project_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
