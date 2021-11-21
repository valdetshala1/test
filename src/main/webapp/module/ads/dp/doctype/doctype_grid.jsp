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
       	jQuery("#doctype_grid").jqGrid({
        	   	url:'DpGrid.docType.do',	
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
        	   	colNames:[
    	        	   	'Id',
    	        	   	'',
    	        	   	'<s:text name="dp.doc.category.id"/>',
    	        	   	'<s:text name="dp.doc.type.label.name"/>', 
    	        	   	'<s:text name="dp.doc.type.label.nameEn"/>', 
    	        	   	'<s:text name="dp.doc.type.label.nameSr"/>', 
//     	        	   	'<s:text name="dp.doc.type.label.printname"/>',
//     	        	   	'<s:text name="dp.doc.type.label.printnameEn"/>',
//     	        	   	'<s:text name="dp.doc.type.label.printnameSr"/>',
    	        	   	'<s:text name="dp.doc.category.label.name"/>',  
    	        	   	'<s:text name="dp.doc.category.docbasetype"/>',
    	        	   	'<s:text name="dp.doc.category.isactive"/>',
//     	        	   	'<s:text name="dp.doc.type.issotrx"/>',
//     	        	   	'<s:text name="dp.doc.type.isdocnocontrolled"/>',
    	        	   	'<s:text name="dp.doc.category.description"/>',
    	        	   	'<s:text name="dp.doc.type.documentnote"/>',
    	        	   	'<s:text name="bid.grid.created.date"/>',
    	        	   	'<s:text name="bid.grid.created.by"/>',
    	        	   	'<s:text name="dp.doc.category.updated"/>',
    	        	   	'<s:text name="dp.doc.category.updated.by"/>'
        	    ],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'category_id',index:'category_id', hidden:true, width:'100%'},
        	   		{name:'name',index:'name', search:false, width:'100%'},
        	   		{name:'name_en',index:'nameEn', search:false, width:'100%'},
        	   		{name:'name_sr',index:'nameSr', search:false, width:'100%'},
//         	   		{name:'printname',index:'printname', search:true, width:'100%'},
//         	   		{name:'printnameEn',index:'printnameEn', search:true, width:'100%'},
//         	   		{name:'printnameSr',index:'printnameSr', search:true, width:'100%'},
        	   		{name:'category_name',index:'category_name', search:false, width:'100%'},
        	   		{name:'docbasetype',index:'docbasetype', search:false, width:'100%'},
        	   		{name:'isactive',index:'isactive', search:false, width:'100%', align:"center"},
//         	   		{name:'issotrx',index:'issotrx', search:false, width:'100%', align:"center"},
//         	   		{name:'isdocnocontrolled',index:'isdocnocontrolled', search:false, width:'100%', align:"center"},
        	   		{name:'description',index:'description', search:false, width:'100%',sortable:false},
        	   		{name:'documentnote',index:'documentnote', search:false, width:'100%',sortable:false},
        	   		{name:'created',index:'created', width:'100%', search:false, align:"center"},
        	   		{name:'createdby',index:'createdby', search:false, width:'100%'},
        	   		{name:'updated',index:'updated', search:false, width:'100%', align:"center"},
        	   		{name:'updatedby',index:'updatedby', search:false, width:'100%'}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#doctype_grid_pager',
        		gridComplete: function(){
        			var ids = jQuery("#doctype_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DocType','#doctype_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#doctype_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "DpTypeMngmt.form.do?docTypeId=" + rowData.id;
 					loadURL(link, $("#doctype_form_content"));
   				}        		

        	});
        	
//         	jQuery("#doctype_grid").jqGrid('filterToolbar',{searchOperators : true});
        	  	
        	jQuery("#doctype_grid").jqGrid('navGrid','#doctype_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#doctype_grid").navButtonAdd('#doctype_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "DpTypeMngmt.form.do?docTypeId=" + rowData.id;
             					loadURL(link, $("#doctype_form_content"));
             	   			}else{
             	   				alert('<s:text name="tender.request.alarm"/>');
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
});

$(window).bind('resize', function() {
    var width = $('#jqGrid_doctype_grid_container').width();
    $('#doctype_grid').setGridWidth(width);
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

			<div id="jqGrid_doctype_grid_container">
				<table id="doctype_grid" class="scroll"></table> 
				<div id="doctype_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

</body>   
</html>	
