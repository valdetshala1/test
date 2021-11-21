<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.leased{ background-color:yellow !important; }

td.subgrid-data div.tablediv table {
  width: 100%
}
.ui-jqgrid .ui-jqgrid-bdiv { overflow-y: none; }

.ui-jqgrid .ui-jqgrid-bdiv {
  position: relative; 
  margin: 0em; 
  padding:0; 
  
  overflow-x:hidden; 
  overflow-y:auto; 
  text-align:left;
}

.ui-jqgrid .ui-jqgrid-bdiv { height: auto; margin: 0em; max-height: 250px; overflow-x: auto;
overflow-y: auto; padding: 0px; position: relative; text-align: left; }
</style>

<script type="text/javascript">


$(document).ready(function () {
	var url = "AuditData.auditData.do?entity_name="+$("#entity_name").val()+"&entity_id="+$("#entity_id").val();

	jQuery("#audit_grid").jqGrid({
		url: url,
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
	   	colNames:[ 'Id','User','Date','Action'],
	   	colModel:[
		
			{name:'id',index:'id', hidden:true, width:'80%'},
	   	   	{name:'created_by',index:'created_by', width:'500%'},
			{name:'createdDate',index:'createdDate', width:'250%'},
			{name:'action',index:'action', width:'125%'}
		],
		rowNum : 10,
		rowList : [10, 20, 30],
		pager : '#pager_audit_grid',
		sortname : 'id',
   		height: '100%',
   		width: '100%',
   		autowidth: false,
		toolbarfilter: true,
		shrinkToFit: false,
        altRows: false,
        hoverRows: false,
		viewrecords : true,
		gridview: true,
		repeatitems: false,	
		scrolloffset: 0,
		multiselect : false,
		sortorder : "asc",
		subGrid: true,
	    subGridRowExpanded: function(subgrid_id, row_id) {
			var rowData = jQuery("#audit_grid").getRowData(row_id); 
			
	    	var subgrid_table_id, pager_id;
			subgrid_table_id = subgrid_id+"_t";
			pager_id = "p_"+subgrid_table_id;
			$("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
			jQuery("#"+subgrid_table_id).jqGrid({
				url:"AuditData.diffData.do?id="+rowData.id,
				datatype: "json",
				jsonReader : {
					root:"rows",
					page: "page",
					total: "total",
					records: "records",
					repeatitems: false,
					id: "0"
				},	           
				colNames: ['id',
							'Original', 
						   'Diff'
						  ],
				colModel: [
					{name:'id',index:'id', hidden:true,width:'40%'},
					{name:'detail',index:'detail', width:'350%'},
					{name:'diff',index:'diff', width:'340%'},
				],
				pager: pager_id,
				beforeSelectRow: function(rowid, e) {
				    return false;
				},
				rowList:[5,10,20,30],
				rowNum: 5,
				sortname: 'id',
				sortorder: "asc",
	    		height: '100%'
	        });
			jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,add:false,del:false,search : false});
	    },	
		caption : "Audit",
			hoverrows:false
		});
	
		jQuery("#audit_grid").jqGrid('navGrid', "#pager_audit_grid", {edit : false, add : false,del : false	,search : false});
});

</script>
<input type="hidden" id="entity_name" name="entity_name" value="<s:property value="entity_name"/>" />
<input type="hidden" id="entity_id" name="entity_id" value="<s:property value="entity_id"/>" />

<div id="audit_grid_container">
    <table id="audit_grid"><tr><td></td></tr></table>
	<div id="pager_audit_grid"></div>
</div>   
