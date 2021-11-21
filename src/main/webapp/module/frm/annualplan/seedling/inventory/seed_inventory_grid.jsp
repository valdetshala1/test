<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
</style>
<script type="text/javascript">
	$(document).ready(function() {
			
        grid = jQuery("#seed_inventory_grid").jqGrid({
    	   	url:'FrmGrid.seedInventory.do?',	
    	   	mtype: 'GET',
    		datatype: "json",
    		postData: {seedActId: $("#seedActId").val()},
    		jsonReader : {
			      root:"rows",
			      page: "page",
			      total: "total",
			      records: "records",
			      repeatitems: false,
			      id: "0"
    		},
    		height: '100%',
    		width: 'auto',
    		autowidth: true,
    		shrinkToFit: false,
    		gridview: true,
            headertitles: true,
            viewrecords: true,
            rownumbers: true,
            //picture, name, title, Hier date, work email, work phone, contract type / Employment status
    	   	colNames:[	'Id', '',
    	        	   	'<s:text name="seed.inv.seed.activity"/>', 
    	        	   	'<s:text name="annu.seedling.label.tree.species"/>',
    	        	   	'<s:text name="annu.seedling.label.prod.type"/>',
    	        	   	'<s:text name="frm.stand.age"/>',
    	        	   	'<s:text name="annu.felling.label.year"/>',
    	        	   	'<s:text name="seed.inv.stock"/>',
    	        	   	'<s:text name="seed.inv.price"/>',
    	        	   	'<s:text name="bid.grid.created.by"/>',
    	        	   	'<s:text name="bid.grid.created.date"/>',
    	        	 	'<s:text name="dem.fiskos.changed.by"/>',
    	        	   	'<s:text name="dem.fiskos.changed.date"/>'
    	        	 ],
    	   	colModel:[
    	   		{name:'id',index:'id',hidden:true, width:'50%'},
    	   		{name:'act',index:'act',hidden:false, width:'20%'},
    	   		{name:'seed_activity_id',index:'seed_activity_id', width:'100%',align:'center'},
    	   		{name:'treeSpecies',index:'treeSpecies', width:'100%'},
    	   		{name:'prod_type',index:'prod_type', width:'100%', align:"center"},
    	   		{name:'age',index:'age', width:'100%', align:"center"},
    	   		{name:'seed_year',index:'seed_year', width:'100%', align:"center"},
    	   		{name:'stock',index:'stock', width:'100%', align:"center"},
    	   		{name:'price',index:'price', width:'100%', align:"center"},
    	   		{name:'created_by',index:'created_by', width:'100%', align:"center"},
    	   		{name:'created_date',index:'created_date', width:'100%', align:"center"},
    	   		{name:'changed_by',index:'changed_by', width:'100%', align:"center"},
    	   		{name:'changed_date',index:'changed_date', width:'100%', align:"center"}
    	   		
    	   	],
    	   	rowNum:10,
    	   	rowList:[10,20,30],
    	   	pager: '#seed_inventory_grid_pager',
    	   	sortname: 'id',
    	    viewrecords: true,
    	    sortorder: "desc",
    		multiselect: false,
    		caption: "",
    		loadtext:'<s:text name="grid.loading.text"/>', 
			ondblClickRow: function(id, iRow, iCol, e) {
				var rowData = jQuery(this).getRowData(iRow); 
				var link = "SeedInventory.form.do?seedActivityId="+$("#seedActId").val()+"&&seedlingInventoryId=" + rowData.id;
					loadURL(link, $("#seed_inventory_form_content"));
			},
	        gridComplete: function(){
		       	var ids = jQuery("#seed_inventory_grid").jqGrid('getDataIDs');
    			for(var i=0;i < ids.length;i++){
						aud_data = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('SeedInventoryAction','#seed_inventory_grid', '"+ids[i]+"');\"><i class='fa fa-history'></i></button>";	
						jQuery("#seed_inventory_grid").jqGrid('setRowData',ids[i],{act:aud_data});
    			}	
			  }
    	});		

    	grid.jqGrid('navGrid','#seed_inventory_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});
		
    	grid.jqGrid ('navButtonAdd', '#pager', 
            	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
            	onClickButton: function() {
                	grid.jqGrid('columnChooser');
            	}})
            	.navButtonAdd('#seed_inventory_grid_pager',{
         	   	   caption:"", 
         	   	   title:"<s:text name="label.button.edit"/>",
         	   	   buttonicon:"ui-icon-pencil", 
         	   	   onClickButton: function(){ 
         	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
         	   			if(iRow){
         					var rowData = jQuery(this).getRowData(iRow); 
         					var link = "SeedInventory.form.do?seedActivityId="+$("#seedActId").val()+"&&seedlingInventoryId=" + rowData.id;
        					loadURL(link, $("#seed_inventory_form_content"));	
         					
         	   			}else{
         	   	   			alert("<s:text name="global.please.select.row"/>"); 
         	   	   		}    
         	   	   }, 
         	   	   position:"last"
         	   	});
	 		jQuery("#seed_inventory_grid").navButtonAdd('#seed_inventory_grid_pager',{
			   	   caption:"<s:text name="label.button.report"/>",
			   	   title:"<s:text name="label.button.report.generator"/>", 
			   	   buttonicon: "ui-icon-print", 
			   	   onClickButton: function(){ 
				   		var link = "SeedInventory.reportGenerator.do";
				   		openDialogForm('report_generator_content',link,"<s:text name="label.button.report.generator"/>",800,420);
			   		
			   	   }, 
			   	   position:"last"
		   	});
		   	
        
	});
	$(window).bind('resize', function() {
		var width = $('#jqGrid_seed_inventory_container').width();
		$('#seed_inventory_grid').setGridWidth(width);
	});


</script>

</head>
<body>

	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">
		<div id="jqGrid_seed_inventory_container">
			<table id="seed_inventory_grid" class="scroll" cellpadding="0" cellspacing="0"></table>
			<div id="seed_inventory_grid_pager" class="scroll" style="text-align: center;"></div>
		</div>

	</div>
	<!-- end widget div -->
	

</body>

</html>
