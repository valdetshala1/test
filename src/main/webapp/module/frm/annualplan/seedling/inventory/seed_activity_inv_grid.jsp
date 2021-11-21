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
        	jQuery("#seedactivity_inv_grid").jqGrid({
        	   	url:'FrmGrid.seedActivityGrid.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData: {inventory:'I'},
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
        	   	colNames:['id',
        	   	       		'<s:text name="planting.stand.status"/>',
        	        	   	'<s:text name="annu.seedling.label.activity"/>', 
        	        	   	'<s:text name="annu.seedling.label.tree.species"/>', 
        	        	   	'<s:text name="annu.seedling.label.institute"/>',
        	        	   	'<s:text name="annu.seedling.label.prod.type"/>',
        	        	   	'<s:text name="annu.seedling.label.work.stage"/>',
        	        	   	'<s:text name="annu.seedling.label.pr.value"/>',
        	        	   	'<s:text name="annu.seedling.label.pl.value"/>',
        	        	   	'<s:text name="annu.seedling.label.ex.value"/>',
        	        	   	'<s:text name="annu.seedling.label.im.value"/>',
        	        	   	'<s:text name="ann.plan.activity.ID"/>',
        	        	   	'<s:text name="annual.plan.status.id"/>', 
        	        	   	'<s:text name="ann.plan.activity.ID"/>' 
        	     		 ],
        	   	colModel:[
					{name:'id',index:'id',hidden:true, width:'100%'},
					{name:'status_icon',hidden:true,index:'status_icon', width:'100%', sortable:true, align:"left", editable:false, search:true, stype:'select', 
    					searchoptions:{sopt:['eq','ne'], value: ':;NEW:New;COMPLETED:Completed;SELECTED:Selected;TERRAIN:Terrain;APPROVED:Approved;PAYMENT_REQUEST:Payment Request;PAYMENBT:Payment;REJECTED_INCOMPLETE:Rejected for Incomplete;REJECTED_NOT_APPROVED:Rejected for not approval;REJECTED_PAYMENT_REQUEST:Rejected for Payment Request'}, frozen:true},
        	   		{name:'activity',index:'activity', width:'100%'},
        	   		{name:'treeSpecies',index:'treeSpecies', width:'100%'},
        	   		{name:'institute',index :'institute', width:'100%', align:"left"},
        	   		{name:'prodType',index:'prodType', width:'100%', align:"left"},		
        	   		{name:'workStage',index:'workStage', width:'100%',align:"left"},
        	   		{name:'prValue',index :'prValue', width:'100%', align:"center"},
        	   		{name:'plValue',index :'plValue', width:'100%', align:"center"},
        	   		{name:'exValue',index:'exValue', width:'100%', align:"left"},
        	   		{name:'imValue',index:'imValue', width:'100%', align:"center"},
        	   		{name:'activity_id',index:'activity_id',hidden:true},
        	   		{name:'status_id',index:'status_id', hidden:true},
        	   		{name:'activity_id',index:'activity_id', hidden:true}	
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#seedactivity_inv_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		multiboxonly: true,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',   				
        		onSelectRow: function(ids) { 
        			$("#stock_price").hide();
        			$("#seedlingInventory\\.seedActivity\\.id").val('');
	   				}
        	});
        	$("#seedactivity_inv_grid")
           	.navGrid('#seedactivity_inv_grid_pager',{edit:false,add:false,del:false,search:false})
           	.navButtonAdd('#seedactivity_inv_grid_pager',{
           	   caption:"", 
           	   title:"<s:text name="seed.inv.choosed"/>", 
           	   buttonicon:"ui-icon-check", 
           	   onClickButton: function(){ 
           			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
           			if(iRow){
        				var rowData = jQuery(this).getRowData(iRow); 
						$("#seedlingInventory\\.seedActivity\\.id").val(rowData.id);
						$("#stock_price").show();
               			}else{
           	   			alert('<s:text name="tender.request.alarm"/>');
           	   		}   

           	   }, 
           	   position:"last"
           	});
           	
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_seedactivityinv_container').width();
            $('#seedactivity_inv_grid').setGridWidth(width);
        });
  
    </script>

</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_seedactivityinv_container">
				<table id="seedactivity_inv_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="seedactivity_inv_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
 </body>   
			
</html>	
