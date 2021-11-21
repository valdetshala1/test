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
       	jQuery("#bpartner_grid").jqGrid({
        	   	url:'ExOfficeGrid.bPartner.do',	
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
    	        	   	'<s:text name="party_id"/>',
//     	        	   	'<s:text name="bpartner.is.active"/>', 
    	        	   	'<s:text name="adm.organisation.label.name"/>',
//     	        	   	'<s:text name="bpartner.name2"/>',  
    	        	   	'<s:text name="finance.type.label.description"/>',
    	        	   	'<s:text name="bpartner.bussines.number"/>',
    	        	   	'<s:text name="bpartner.soc.sec.num"/>',
    	        	   	'<s:text name="bpartner.con.est.date"/>',
//     	        	   	'<s:text name="bpartner.ven.dis.perc"/>',
//     	        	   	'<s:text name="bpartner.is.sum"/>',
//     	        	   	'<s:text name="bpartner.is.one.time"/>',
//     	        	   	'<s:text name="bpartner.is.prospect"/>',
//     	        	   	'<s:text name="bpartner.is.vendor"/>',
//     	        	   	'<s:text name="bpartner.is.employee"/>',
//     	        	   	'<s:text name="bpartner.is.costumer"/>',
    	        	   	'<s:text name="bpartner.reference.no"/>',
//     	        	   	'<s:text name="bpartner.rating"/>',
//     	        	   	'<s:text name="bpartner.sales.vol"/>',
    	        	   	'<s:text name="bpartner.num.emp"/>',
//     	        		'<s:text name="bpartner.flat.discount"/>',
//     	        		'<s:text name="bpartner.total.open.balance"/>',
    	        		'<s:text name="bpartner_parent_id"/>',
    	        	   	'<s:text name="adm.user.grid.created"/>',
    	        		'<s:text name="bid.grid.created.by"/>',
    	        		'<s:text name="dp.doc.category.updated"/>',
    	        	   	'<s:text name="dp.doc.category.updated.by"/>'
        	    ],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'party_id',index:'party_id', hidden:true, width:'100%'},
//         	   		{name:'isactive',index:'isactive', width:'100%',align:"center"},
        	   		{name:'name',index:'name', search:true, width:'100%'},
//         	   		{name:'name2',index:'name2', search:true, width:'100%'},
        	   		{name:'description',index:'description', search:false, width:'100%', align:"center"},
        	   		{name:'employer_id_number',index:'employer_id_number', search:false, width:'100%'},
        	   		{name:'social_security_number',index:'social_security_number', search:false, width:'100%'},
        	   		{name:'contact_etbilished_date',index:'contact_etbilished_date', search:false, width:'100%', align:"center"},
//         	   		{name:'vendor_discount_percent',index:'vendor_discount_percent', search:false, width:'100%',align:"center"},
//         	   		{name:'issummary',index:'issummary', search:false, width:'100%',align:"center"},
//         	   		{name:'isonetime',index:'isonetime', width:'100%', search:false, align:"center"},
//         	   		{name:'isprospect',index:'isprospect', search:false, width:'100%', align:"center"},
//         	   		{name:'isvendor',index:'isvendor', search:false, width:'100%', align:"center"},
//         	   		{name:'isemployee',index:'isemployee', search:false, width:'100%', align:"center"},
//         	   		{name:'iscustomer',index:'iscustomer', search:true, width:'100%',align:"center"},
        	   		{name:'referenceno',index:'referenceno', search:false, width:'100%'},
//         	   		{name:'rating',index:'rating', search:false, width:'100%', align:"center"},
//         	   		{name:'salesvolume',index:'salesvolume', search:false, width:'100%', align:"center"},
        	   		{name:'numberemployees',index:'numberemployees', search:false, width:'100%', align:"center"},
//         	   		{name:'flatdiscount',index:'flatdiscount', search:false, width:'100%',align:"center"},
//         	   		{name:'totalopenbalance',index:'totalopenbalance', search:false, width:'100%',align:"center"},
        	   		{name:'bpartner_parent_id',index:'bpartner_parent_id', hidden:true, width:'100%'},
        	   		{name:'created',index:'created', width:'100%', search:false, align:"center"},
        	   		{name:'createdby',index:'createdby', search:false, width:'100%'},
        	   		{name:'updated',index:'updated', search:false, width:'100%', align:"center"},
        	   		{name:'updatedby',index:'updatedby', search:false, width:'100%'}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#bpartner_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#bpartner_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Bpartner','#bpartner_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#bpartner_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "BPartner.form.do?bpartnerId=" + rowData.id;
 					loadURL(link, $("#bpartner_form_content"));
   				}        		

        	});
        	
        	jQuery("#bpartner_grid").jqGrid('filterToolbar',{searchOperators : true});
        	  	
        	jQuery("#bpartner_grid").jqGrid('navGrid','#bpartner_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#bpartner_grid").navButtonAdd('#bpartner_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "BPartner.form.do?bpartnerId=" + rowData.id;
             					loadURL(link, $("#bpartner_form_content"));
             	   			}else{
             	   				alert('<s:text name="tender.request.alarm"/>');
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
});

$(window).bind('resize', function() {
    var width = $('#jqGrid_bpartner_grid_container').width();
    $('#bpartner_grid').setGridWidth(width);
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

			<div id="jqGrid_bpartner_grid_container">
				<table id="bpartner_grid" class="scroll"></table> 
				<div id="bpartner_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

</body>   
</html>	
