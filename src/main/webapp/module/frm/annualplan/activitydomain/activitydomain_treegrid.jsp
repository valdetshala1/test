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

th.ui-th-column div{
white-space:normal !important;
height:auto !important;
padding-top:2px;
padding-bottom:2px;
}
.ui-jqgrid .ui-jqgrid-sortable {cursor:default;}
.ui-th-column-header{text-align: center;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var activity_doamin_id="";
		var subgridRow="";
          var grid = $("#activity_domain_grid");
          grid.jqGrid({
	        url: 'FrmGrid.activitydomain.do',
	        datatype: 'json',
	        mtype: 'GET',
 			colNames:['id', 
		      	        'parent_id',
		      	        '<s:text name="adm.organisation.label.name"/>', 
		      	     	'<s:text name="finance.type.label.name.en"/>', 
		      	    	'<s:text name="finance.type.label.name.sr"/>', 
		      	        '<s:text name="adm.organisation.label.code"/>'
		      	        ],
        	   	colModel:[ 
    				{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
    				{name:'parent_id',index:'parent_id', width: 100, sortable:false, hidden:true, key:true},
    	            {name:'name_al',index:'name_al', width: 200,align:'left', sortable:false, search:true}, 
    	            {name:'name_en',index:'name_en', width: 150,align:'center', sortable:false, search:true}, 
    	            {name:'name_sr',index:'name_sr', width: 150,align:'center', sortable:false, search:true},
    	            {name:'code',index:'code', width: 50, align:'center', sortable:false, search:false}
    	        ],
		     jsonReader : { 
		        	rows: "rows", 
		            page: "page", 
		            total: "total", 
		            records: "records", 
		            repeatitems: false, 
		            id: "0"
		     },
              sortname: 'name_al',
              gridview: false,
  	          loadonce: false,
	          ignoreCase: true, 
			  headertitles : true,
			  hoverrows : false,
			  viewsortcols : [ false, 'vertical', true ],
				rowNum : 10,
				rowList : [ 10, 20, 30 ],	                       
              loadui: "disable",
              treeGridModel: 'adjacency',
              treedatatype: 'json',
              ExpandColumn: 'name_al',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#activity_domain_grid_pager",
              caption: "", 
              toppager:true,
              viewrecords: true,
              ExpandColClick: true,
              scrollrows: true,
              shrinkToFit: true,	
              loadComplete: function (data) {
		    	 $("#activity_domain_grid").jqGrid('setGridParam', { sortname: 'name_al', sortorder: 'asc' });
		    	 $("#activity_domain_grid").trigger("reloadGrid");
              },
	    	   gridComplete: function(){
	    			var rowIds = $("#activity_domain_grid").getDataIDs();
	                $.each(rowIds, function (index, rowId) {
	                        $("#activity_domain_grid").expandSubGridRow(rowId); 
	                });
	    		},
              onSelectRow: function(id, iRow){
            	  var rowData = jQuery(this).getRowData(id); 
            	  activity_doamin_id=rowData.id;
            	  $("#activity_domain_grid_"+id+"_t").resetSelection();
              },
              ondblClickRow: function(id, iRow, iCol, e) {
            	var rowData = jQuery(this).getRowData(iRow);
  				var link = "Inspection.form.do?inspectionId=" + activity_doamin_id;
  				loadURL(link, $("#inspection_form_content")); 
 			 },
 			
 			subGrid: true,
		    subGridRowExpanded: function(subgrid_id, row_id) {
		    	debugger
		       var subgrid_table_id;
		       subgrid_table_id = subgrid_id+"_t";
		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
		       jQuery("#"+subgrid_table_id).jqGrid({
		          url:"FrmGrid.activityDomainTree.do?parent_id="+jQuery("#activity_domain_grid").getRowData(row_id).id,
		          datatype: "json",
		      	  colNames:['id', 
		      	        'parent_id',
		      	        '<s:text name="adm.organisation.label.name"/>', 
		      	     	'<s:text name="finance.type.label.name.en"/>', 
		      	    	'<s:text name="finance.type.label.name.sr"/>', 
		      	        '<s:text name="adm.organisation.label.code"/>'
		      	        ], 
			  	   colModel:[ 
						{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
						{name:'parent_id',index:'parent_id', width: 100,  hidden:true},
			            {name:'name_al',index:'name_al', width: 250,align:'left'}, 
			            {name:'name_en',index:'name_en', width: 250,align:'center'}, 
			            {name:'name_sr',index:'name_sr', width: 250,align:'center'},
			            {name:'code',index:'code', width: 50, align:'center', sortable:false, search:false}
			        ],
		       	  pager: '',
		          height: 'auto',
		          width: 'auto',
		          rowNum:10,
	        	  rowList:[10,20,30],
		      	  viewrecords: true,
		          sortname: 'id',
		          sortorder: "asc",
		          treeReader : {
				    	 level_field : 'level',
				    	 parent_id_field : 'parent_id'
				     },
			      treeGrid: true,
	              gridview: false,
	  	          loadonce: false,
		          ignoreCase: true,
		          loadui: "disable",
		          treeGridModel: 'adjacency',
	              treedatatype: 'json',
	              ExpandColumn: 'name_al',
	              treeIcons: {leaf:'ui-icon-document-b'},
		      	  gridComplete: function(){
		    	  },
	              onSelectRow: function(id, iRow,row_id){
						grid.jqGrid('resetSelection');
						activity_doamin_id=id;
		             },
		       });
		   },
		   subGridBeforeExpand: function (subgridDivId, rowid) {
	           	 if (rowid != subgridRow) {
	           			activity_doamin_id='';
	           			subgridRow=rowid;
	              	  	var grid = $(this);
	              	 	var rows = grid.jqGrid("getDataIDs");
	              	  	$.each(rows, function(index, rowId) {
	              	 		 grid.collapseSubGridRow(rowId);
	              	  		if (index + 1 == rows.length) { 
	              	  			subgridRow = rowid;
	              	  			grid.expandSubGridRow(rowid);
	              	  		}
	              	 	});
	              	  return false;
	              }
	              return true;
	        },
          });
          grid.navGrid('#activity_domain_grid_pager',{edit:false,add:false,del:false,search:false})
			.navButtonAdd('#activity_domain_grid_pager',{
			   caption:"", 
			   title:"<s:text name="label.button.edit"/>", 
			   buttonicon:"ui-icon-pencil", 
			   onClickButton: function(){
   	   			if(activity_doamin_id!=''){
					var link = "ActivityDomain.form.do?activityDomainId=" + activity_doamin_id;
	 				loadURL(link, $("#activitydomain_form_content"));
 	 	   		}else{
 	   	   			alert("<s:text name="global.please.select.row"/>");
 	   	   		}  					
			   }, 
			   position:"last",
			   cursor: "pointer"
			}).navButtonAdd('#activity_domain_grid_pager',{
				   caption:"", 
				   title:"<s:text name="label.button.reference"/>", 
				   buttonicon:"ui-icon-pin-w", 
				   onClickButton: function(){
					if(activity_doamin_id!=""){
		   	   			var link = "ActivityDomain.form.do?parentId=" + activity_doamin_id;//+"&refNo="+rowData.inspection_no;
		 				loadURL(link, $("#activitydomain_form_content"));
	 	   			}else{
	 	   	   			alert("<s:text name="global.please.select.row"/>");
	 	   	   		}  					
				   }, 
				   position:"last",
				   cursor: "pointer"
				});        	
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_activity_domain_grid_container').width();
		$('#activity_domain_grid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_activity_domain_grid_container">
			<div style="clear:left;">
				<table id="activity_domain_grid" class="scroll"></table>
				<div id="activity_domain_grid_pager" class="scroll" style="text-align: center;"></div>
			</div>
		</div>
	</div>
	<!-- end widget div -->

</body>

</html>
