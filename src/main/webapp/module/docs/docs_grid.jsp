<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	jQuery("#docs_grid").jqGrid({
        	   	url:'Grid.kfisDocs.do?',	
        	 	postData:{tableName:$("#tabelName").val(),entityId:$("#entityId").val()},	
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
        	   	colNames:['Doc','nodeRef',
        	        	   	'objectTypeId',
        	        	   	'<s:text name="docs.name"/>',
        	        	   	'<s:text name="vehicles.label.type"/>',
        	        	   	'<s:text name="docs.content.stream.length"/>',
        	        	   	'<s:text name="finance.type.label.description"/>', 
        	        	   	'<s:text name="bid.grid.created.date"/>', 
        	        	   	'<s:text name="dem.fiskos.modyfied.data"/>',
        	        	   	'objectId',
        	        	   	'<s:text name="frm.inspection.created.by"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'nodeRef',index:'nodeRef',hidden:true, width:'100%'},
        	   		{name:'objectTypeId',index:'objectTypeId',hidden:true, width:'50%',search:false},
        	   		{name:'name',index:'name', width:'100%', align:"center"},
        	   		{name:'contentStreamMimeType',index:'contentStreamMimeType', width:'100%', align:"center"},
        	   		{name:'contentStreamLength',index:'contentStreamLength', width:'100%', align:"center"},
        	   		{name:'description',index:'description', width:'100%'},
        	   		{name:'creationDate',index:'creationDate', width:'100%'},
        	   		{name:'lastModificationDate',index:'lastModificationDate', width:'100%', align:"center"},
        	   		{name:'objectId',index:'objectId',hidden:true,width:'100%', align:"center"},
        	   		{name:'createdBy',index:'createdBy',hidden:true, width:'100%', align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#docs_grid_pager',
        	   	gridComplete: function(){			
        	   		var ids = jQuery("#docs_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        				var rowData = jQuery("#docs_grid").getRowData(cl); 
        				var doc = "<button class='btn btn-xs btn-default' data-original-title='Dokumenti' onclick=\"docGenDec('"+rowData.objectId+"','"+rowData.name+"');\"><i class='fa  fa-print'></i></button>";        				
        				jQuery("#docs_grid").jqGrid('setRowData',ids[i],{act:doc});
            		}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
   				}        		

        	});
              	
        	jQuery("#docs_grid").jqGrid('navGrid','#docs_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#docs_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_docs_grid_container').width();
            $('#docs_grid').setGridWidth(width);
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
		
		    <input type="hidden" id="tabelName"
				name="tabelName"
				value="<s:property value="tabelName"/>" />
				
		    <input type="hidden" id="entityId"
				name="entityId"
				value="<s:property value="entityId"/>" />

			<div id="jqGrid_docs_grid_container">
				<table id="docs_grid" class="scroll"></table> 
				<div id="docs_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
