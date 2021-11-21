<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid {
	width: 100% !important;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
			
        grid = jQuery("#role_grid").jqGrid({
    	   	url:'AdmGrid.rbacRoles.do',	
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
    	        	   	'<s:text name="leave.type.label.name"/>',
    	        	   	'<s:text name="finance.type.label.name.en"/>', 
    	      	    	'<s:text name="finance.type.label.name.sr"/>', 
    	        	   	'<s:text name="leave.type.label.code"/>' 
    	        	 ],
    	   	colModel:[
    	   		{name:'id',index:'id',hidden:true, width:'50%'},
    	   		{name:'act',index:'act', width:'10%',search:false},
    	   		{name:'name',index:'name', width:'100%'},
    	   		{name:'name_en',index:'name_en', width:'100%'},
    	   		{name:'name_sr',index:'name_sr', width:'100%'},
    	   		{name:'code',index:'code', width:'100%', align:"center"},
    	   	],
    	   	rowNum:10,
    	   	rowList:[10,20,30],
    	   	pager: '#role_grid_pager',
    		gridComplete: function(){
    			var ids = jQuery("#role_grid").jqGrid('getDataIDs');
    			for(var i=0;i < ids.length;i++){
    				var cl = ids[i];
    					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('RbacUseRole','#role_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
    					jQuery("#role_grid").jqGrid('setRowData',ids[i],{act:au});
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
				var link = "Role.form.do?roleId=" + rowData.id;
					loadURL(link, $("#role_form_content"));
				}        		

    	});		

    	grid.jqGrid('navGrid','#role_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});
		
    	grid.jqGrid ('navButtonAdd', '#pager', 
            	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
            	onClickButton: function() {
                	grid.jqGrid('columnChooser');
            	}})
            	.navButtonAdd('#role_grid_pager',{
         	   	   caption:"", 
         	   	   title:"<s:text name="label.button.edit"/>",
         	   	   buttonicon:"ui-icon-pencil", 
         	   	   onClickButton: function(){ 
         	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
         	   			if(iRow){
         					var rowData = jQuery(this).getRowData(iRow); 
         					var link = "Role.form.do?roleId=" + rowData.id;
         					loadURL(link, $("#role_form_content"));
         	   			}else{
         	   	   			alert("<s:text name="global.please.select.row"/>"); 
         	   	   		}    
         	   	   }, 
         	   	   position:"last"
         	   	})
	});
        			
	
	function displayButtons(cellvalue, options, rowObject)
    {
		perId=rowObject.rbac_id
        var detail = "<input style='width:80% ' type='button' id='"+perId+"' value='Detail' onclick=\"openPopup(this)\"  />";
        return detail;
    }
	
	$(window).bind('resize', function() {
		var width = $('#jqGrid_rbacrole_container').width();
		$('#role_grid').setGridWidth(width);
	});


</script>

</head>
<body>

	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">
		<div id="jqGrid_rbacrole_container">
			<table id="role_grid" class="scroll" cellpadding="0" cellspacing="0"></table>
			<div id="role_grid_pager" class="scroll" style="text-align: center;"></div>
		</div>

	</div>
	<!-- end widget div -->
	

</body>

</html>
