<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../base/nocache.jsp"%>
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
		var affreffproj_id="";
		var subgridRow="";
          var grid = $("#affref_project_grid");
          grid.jqGrid({
	        url: 'FrmGrid.affrefproject.do',
	        datatype: 'json',
	        mtype: 'GET',
 			colNames:['Id','encryptedText',
 				            '<s:text name="aff.reff.project.name"/>',
 				            '<s:text name="aff.reff.project.data.form"/>',
        	        	   	'<s:text name="adm.person.label.address.notes"/>',
        	        	   	'refer_id',
        	        	    '<s:text name="hum.employee.label.documents"/>',
        	        	   	], 
        	   	colModel:[
					{name:'id',index:'id',hidden:true, width:'100%'},
					{name:'encryptedText',index:'encryptedText',hidden:true, width:'100%'},
					{name:'name',index:'name', width:'300%'},	
					{name:'data_from',index:'data_from', width:'300%'},	
					{name:'remarks',index:'remarks', width:'300%'},
        	   		{name:'parent_id',index:'parent_id', hidden:true, width: 50, align:'center', sortable:false, search:false},
					{name:'act',index:'act', width:'50%',search:false}		
        	   	],
		     jsonReader : { 
		        	rows: "rows", 
		            page: "page", 
		            total: "total", 
		            records: "records", 
		            repeatitems: false, 
		            id: "0"
		     },
              sortname: 'name',
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
              ExpandColumn: 'name',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#affref_project_grid_pager",
              caption: "", 
              toppager:true,
              viewrecords: true,
              ExpandColClick: true,
              scrollrows: true,
              shrinkToFit: false,	
              loadComplete: function (data) {
		    	 $("#affref_project_grid").jqGrid('setGridParam', { sortname: 'name', sortorder: 'asc' });
		    	 $("#affref_project_grid").trigger("reloadGrid");
              },
	    	   gridComplete: function(){
	    			var ids = jQuery("#affref_project_grid").jqGrid('getDataIDs');
	    			for(var i=0;i < ids.length;i++){
	    					var cl = ids[i];
	    					//thrm_decision_status
	            			var rowData = jQuery("#affref_project_grid").getRowData(cl); //rowData.encryptedText
	    					dg = "<button class='btn btn-xs btn-default' data-original-title='Documents' title='<s:text name="audit.title"/>' onclick=\"docsList('"+rowData.encryptedText+"','#decision_grid', '"+rowData.id+"');\"><i class='fa fa-folder'></i></button>";	
	    					jQuery("#affref_project_grid").jqGrid('setRowData',ids[i],{act:dg});
	    			}	
	    		},
              onSelectRow: function(id, iRow){
            	  var rowData = jQuery(this).getRowData(id); 
            	  affreffproj_id=rowData.id;
            	  $("#affref_project_grid_"+id+"_t").resetSelection();
              },
              ondblClickRow: function(id, iRow, iCol, e) {
            	var rowData = jQuery(this).getRowData(iRow);
  				var link = "Inspection.form.do?inspectionId=" + affreffproj_id;
  				loadURL(link, $("#inspection_form_content")); 
 			 },
 			
 			subGrid: true,
		    subGridRowExpanded: function(subgrid_id, row_id) {
		       var subgrid_table_id;
		       subgrid_table_id = subgrid_id+"_t";
		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
		       jQuery("#"+subgrid_table_id).jqGrid({
		          url:"FrmGrid.affrefprojectTree.do?parent_id="+jQuery("#affref_project_grid").getRowData(row_id).id,
		          datatype: "json",
		      	  colNames:['Id','encryptedText',
			            '<s:text name="aff.reff.project.name"/>',
			            '<s:text name="aff.reff.project.data.form"/>',
		        	   	'<s:text name="adm.person.label.address.notes"/>',
		        	   	'refer_id',
		        	    '<s:text name="hum.employee.label.documents"/>',
	        	   	], 
			  	   colModel:[
							{name:'id',index:'id',hidden:true, width:'100%'},
							{name:'encryptedText',index:'encryptedText',hidden:true, width:'100%'},
							{name:'name',index:'name', width:'300%'},	
							{name:'data_from',index:'data_from', width:'300%'},	
							{name:'remarks',index:'remarks', width:'300%'},
			  	   			{name:'parent_id',index:'parent_id', hidden:true, width: 50, align:'center', sortable:false, search:false},
							{name:'act',index:'act', width:'50%',search:false}		
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
	              ExpandColumn: 'name',
	              treeIcons: {leaf:'ui-icon-document-b'},
		      	  gridComplete: function(){
		    			var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
		    			for(var i=0;i < ids.length;i++){
		    					var cl = ids[i];
		            			var rowData = jQuery("#"+subgrid_table_id).getRowData(cl); //rowData.encryptedText
		    					dg = "<button class='btn btn-xs btn-default' data-original-title='Documents' title='<s:text name="audit.title"/>' onclick=\"docsList('"+rowData.encryptedText+"','#affref_project_grid', '"+rowData.id+"');\"><i class='fa fa-folder'></i></button>";	
		    					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{act:dg});
		    			}	
		    	  },
	              onSelectRow: function(id, iRow,row_id){
						grid.jqGrid('resetSelection');
						affreffproj_id=id;
		             },
		       });
		   },
		   subGridBeforeExpand: function (subgridDivId, rowid) {
	           	 if (rowid != subgridRow) {
	           			affreffproj_id='';
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
          grid.navGrid('#affref_project_grid_pager',{edit:false,add:false,del:false,search:false})
			.navButtonAdd('#affref_project_grid_pager',{
			   caption:"", 
			   title:"<s:text name="label.button.edit"/>", 
			   buttonicon:"ui-icon-pencil", 
			   onClickButton: function(){
   	   			if(affreffproj_id!=''){
					var link = "AffRefProjects.form.do?affrefprojectId=" + affreffproj_id;
	 				loadURL(link, $("#affrefproject_form_content"));
 	 	   		}else{
 	   	   			alert("<s:text name="global.please.select.row"/>");
 	   	   		}  					
			   }, 
			   position:"last",
			   cursor: "pointer"
			}).navButtonAdd('#affref_project_grid_pager',{
				   caption:"", 
				   title:"<s:text name="label.button.reference"/>", 
				   buttonicon:"ui-icon-pin-w", 
				   onClickButton: function(){
					if(affreffproj_id!=""){
		   	   			var link = "AffRefProjects.form.do?parentId=" + affreffproj_id;//+"&refNo="+rowData.inspection_no;
		 				loadURL(link, $("#affrefproject_form_content"));
	 	   			}else{
	 	   	   			alert("<s:text name="global.please.select.row"/>");
	 	   	   		}  					
				   }, 
				   position:"last",
				   cursor: "pointer"
				});        	

          $("#searchterm").change(function() {
              var str = $("#searchterm").val();
              if (str) {
                  var re = new RegExp(str,"i");
                  var r = $("#affref_project_grid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       //var localRowData = grid.jqGrid("getLocalRow", rowId);
                       var rowData = $("#affref_project_grid").getRowData(rowId); 
  
                       if(re.test(rowData.orga_name)){
                            //ensure to show all parents of matched nodes
                       		console.log("Match:" + rowData.orga_name + ", Id: " + rowData.id);
                       		while (rowData !== null && rowData.parent_id !== "") {
                       			$($("#" + rowData.parent_id), "#affref_project_grid").show();
                                rowData = $("#affref_project_grid").getRowData(rowData.parent_id);
                       		}
                       		
                       }else{
                           $($("#" + rowId), "#affref_project_grid").hide();
                       }
                  });
              }else{
            	  var r = $("#affref_project_grid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       $($("#" + rowId), "#affref_project_grid").show(); 
                  });                 
              }
          });

          
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_affref_project_grid_container').width();
		$('#affref_project_grid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_affref_project_grid_container">
			<div style="clear:left;">
				<table id="affref_project_grid" class="scroll"></table>
				<div id="affref_project_grid_pager" class="scroll" style="text-align: center;"></div>
			</div>
		</div>
	</div>
	<!-- end widget div -->

</body>

</html>
