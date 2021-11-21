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
		var inspection_id="";
		var subgridRow="";
          var grid = $("#insp_treegrid");
          grid.jqGrid({
	        url: 'FrmGrid.inspection.do',
	        datatype: 'json',
	        mtype: 'GET',
 				colNames:['Id',
 				            '<s:text name="frm.inspection.inspection.no.label"/>',
 				            '<s:text name="frm.inspection.type.label"/>',
        	        	   	'<s:text name="frm.inspection.date"/>',
        	        	   	'<s:text name="hum.employee.label.comment"/>',
        	        	   	'<s:text name="frm.inspection.region.name"/>', 
        	        	   	'<s:text name="frm.inspection.cadastralMunicipality.name"/>', 
        	        		'<s:text name="frm.inspection.inspActionType.label"/>',

        	        	   	'<s:text name="frm.inspection.set.data.procesverbal"/>', 
        	        	   	'<s:text name="frm.inspection.procesverbalNo.label"/>', 
        	        	   	'<s:text name="frm.inspection.contactPerson.label"/>',
        	        	   	'<s:text name="frm.inspection.procesverbalNote.label"/>',

        	        	   	'<s:text name="frm.inspection.set.data.sequestration"/>',
        	        	    '<s:text name="frm.inspection.seqTeachVolume.label"/>',
        	        	    '<s:text name="frm.inspection.seqFireVolume.label"/>',
        	        	    '<s:text name="frm.inspection.seqNote.label"/>',
        	        	    
        	        	    '<s:text name="frm.inspection.set.data.charges"/>',
        	        	    '<s:text name="frm.inspection.chargesType.label"/>',
        	        	    '<s:text name="frm.inspection.chargesRefNo.label"/>',
        	        	    '<s:text name="frm.inspection.chargesNote.label"/>',
        	        	    
          	        	   	'<s:text name="frm.inspection.created.by"/>',
        	        	   	'<s:text name="frm.inspection.created.date"/>',
        	        	   	'<s:text name="adm.organisation.parent.id"/>',
        	        	   	], 
        	   	colModel:[
					{name:'id',index:'id',hidden:true, width:'100%'},
					{name:'inspection_no',index:'inspection_no', width:'100%'},	
					{name:'inspection_type',index:'inspection_type', width:'100%'},
        	   		{name:'inspection_date',index :'inspection_date', width:'100%', align:'center' },
        	   		{name:'notes',index:'notes', width:'100%'},
         	   		{name:'region_name',index:'region_name', width:'100%'},
        	   		{name:'mun_name',index:'mun_name', width:'100%'},
        	   		{name:'type_action',index :'type_action', width:'100%'},
        	   		

        	   		
        	   		{name:'procesverbal',index:'procesverbal', width:'100%'},
        	   		{name:'procesverbal_no',index:'procesverbal_no', width:'100%', align:'center'},
        	   		{name:'contact_person',index:'contact_person', width:'100%'},
        	   		{name:'procesverbal_note',index:'procesverbal_note', width:'100%'},

        	   		{name:'sequestration',index:'sequestration', width:'100%'},
        	   		{name:'seq_teach_volume',index:'seq_teach_volume', width:'100%', align:'center'},
        	   		{name:'seq_fire_volume',index:'seq_fire_volume', width:'100%', align:'center'},
        	   		{name:'seq_note',index:'seq_note', width:'100%'},

        	   		{name:'charges',index:'charges', width:'100%'},
        	   		{name:'charges_type',index:'charges_type', width:'100%'},
        	   		{name:'charges_ref_no',index:'charges_ref_no', width:'100%', align:'center'},
        	   		{name:'charges_note',index:'charges_note', width:'100%'},
        	   		
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created_date',index:'created_date', width:'100%', align:"center"},
        	   		{name:'parent_id',index:'parent_id', hidden:true, width: 50, align:'center', sortable:false, search:false}
        	   			
        	   	],
		     jsonReader : { 
		        	rows: "rows", 
		            page: "page", 
		            total: "total", 
		            records: "records", 
		            repeatitems: false, 
		            id: "0"
		     },
              sortname: 'inspection_no',
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
              ExpandColumn: 'inspection_no',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#insp_treegrid_pager",
              caption: "", 
              toppager:true,
              viewrecords: true,
              ExpandColClick: true,
              scrollrows: true,
              shrinkToFit: false,	
              loadComplete: function (data) {
		    	 $("#insp_treegrid").jqGrid('setGridParam', { sortname: 'inspection_no', sortorder: 'asc' });
		    	 $("#insp_treegrid").trigger("reloadGrid");
              },
              onSelectRow: function(id, iRow){
            	  var rowData = jQuery(this).getRowData(id); 
            	  inspection_id=rowData.id;
            	  $("#insp_treegrid_"+id+"_t").resetSelection();
              },
              ondblClickRow: function(id, iRow, iCol, e) {
            	var rowData = jQuery(this).getRowData(iRow);
  				var link = "Inspection.form.do?inspectionId=" + inspection_id;
  				loadURL(link, $("#inspection_form_content")); 
 			 },
 			
 			subGrid: true,
		    subGridRowExpanded: function(subgrid_id, row_id) {
		       var subgrid_table_id;
		       subgrid_table_id = subgrid_id+"_t";
		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
		       jQuery("#"+subgrid_table_id).jqGrid({
		          url:"FrmGrid.inspectionTree.do?parent_id="+jQuery("#insp_treegrid").getRowData(row_id).id,
		          datatype: "json",
		          colNames: ['Id',
	 				            '<s:text name="frm.inspection.inspection.no.label"/>',
	 				            '<s:text name="frm.inspection.type.label"/>',
	        	        	   	'<s:text name="frm.inspection.date"/>',
	        	        	   	'<s:text name="hum.employee.label.comment"/>',
	        	        	   	'<s:text name="frm.inspection.region.name"/>', 
	        	        	   	'<s:text name="frm.inspection.cadastralMunicipality.name"/>', 
	        	        		'<s:text name="frm.inspection.inspActionType.label"/>',

	        	        	   	'<s:text name="frm.inspection.set.data.procesverbal"/>', 
	        	        	   	'<s:text name="frm.inspection.procesverbalNo.label"/>', 
	        	        	   	'<s:text name="frm.inspection.contactPerson.label"/>',
	        	        	   	'<s:text name="frm.inspection.procesverbalNote.label"/>',

	        	        	   	'<s:text name="frm.inspection.set.data.sequestration"/>',
	        	        	    '<s:text name="frm.inspection.seqTeachVolume.label"/>',
	        	        	    '<s:text name="frm.inspection.seqFireVolume.label"/>',
	        	        	    '<s:text name="frm.inspection.seqNote.label"/>',
	        	        	    
	        	        	    '<s:text name="frm.inspection.set.data.charges"/>',
	        	        	    '<s:text name="frm.inspection.chargesType.label"/>',
	        	        	    '<s:text name="frm.inspection.chargesRefNo.label"/>',
	        	        	    '<s:text name="frm.inspection.chargesNote.label"/>',
	        	        	    
	          	        	   	'<s:text name="frm.inspection.created.by"/>',
	        	        	   	'<s:text name="frm.inspection.created.date"/>',
	        	        	   	'<s:text name="adm.organisation.parent.id"/>',
		    		        ],
		          colModel: [
						{name:'id',index:'id',hidden:true, width:'100%'},
						{name:'inspection_no',index:'inspection_no', width:'100%'},	
						{name:'inspection_type',index:'inspection_type', width:'100%'},
						{name:'inspection_date',index :'inspection_date', width:'100%', align:'center' },
						{name:'notes',index:'notes', width:'100%'},
						{name:'region_name',index:'region_name', width:'100%'},
						{name:'mun_name',index:'mun_name', width:'100%'},
						{name:'type_action',index :'type_action', width:'100%'},
						
						{name:'procesverbal',index:'procesverbal', width:'100%'},
						{name:'procesverbal_no',index:'procesverbal_no', width:'100%', align:'center'},
						{name:'contact_person',index:'contact_person', width:'100%'},
						{name:'procesverbal_note',index:'procesverbal_note', width:'100%'},
					
						{name:'sequestration',index:'sequestration', width:'100%'},
						{name:'seq_teach_volume',index:'seq_teach_volume', width:'100%', align:'center'},
						{name:'seq_fire_volume',index:'seq_fire_volume', width:'100%', align:'center'},
						{name:'seq_note',index:'seq_note', width:'100%'},
					
						{name:'charges',index:'charges', width:'100%'},
						{name:'charges_type',index:'charges_type', width:'100%'},
						{name:'charges_ref_no',index:'charges_ref_no', width:'100%', align:'center'},
						{name:'charges_note',index:'charges_note', width:'100%'},
						
						{name:'created_by',index:'created_by', width:'100%'},
						{name:'created_date',index:'created_date', width:'100%', align:"center"},
						{name:'parent_id',index:'parent_id', hidden:true, width: 50, align:'center', sortable:false, search:false}
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
	              ExpandColumn: 'inspection_no',
	              treeIcons: {leaf:'ui-icon-document-b'},
	              onSelectRow: function(id, iRow,row_id){
						grid.jqGrid('resetSelection');
						inspection_id=id;
		             },
		       });
		   },
		   subGridBeforeExpand: function (subgridDivId, rowid) {
	           	 if (rowid != subgridRow) {
	           			inspection_id='';
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

      	
          grid.jqGrid('setGroupHeaders', {
              useColSpanStyle: false,
              groupHeaders: [
                  {startColumnName: 'inspection_no', numberOfColumns: 4, titleText: '<em>Inspection</em>'},
                  {startColumnName: 'procesverbal', numberOfColumns: 4, titleText: '<em><s:text name="frm.inspection.set.data.procesverbal"/></em>'},
                  {startColumnName: 'sequestration', numberOfColumns: 4, titleText: '<em><s:text name="frm.inspection.set.data.sequestration"/></em>'},
                  {startColumnName: 'charges', numberOfColumns: 4, titleText: '<em><s:text name="frm.inspection.set.data.charges"/></em>'}
              ]});  

			
          grid.navGrid('#insp_treegrid_pager',{edit:false,add:false,del:false,search:false})
			.navButtonAdd('#insp_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="label.button.edit"/>", 
			   buttonicon:"ui-icon-pencil", 
			   onClickButton: function(){
   	   			if(inspection_id!=''){
					var link = "Inspection.form.do?inspectionId=" + inspection_id;
	 				loadURL(link, $("#inspection_form_content"));
 	 	   		}else{
 	   	   			alert("<s:text name="global.please.select.row"/>");
 	   	   		}  					
			   }, 
			   position:"last",
			   cursor: "pointer"
			}).navButtonAdd('#insp_treegrid_pager',{
				   caption:"", 
				   title:"<s:text name="hum.employee.label.documents"/>", 
				   buttonicon:"ui-icon-folder-open", 
				   onClickButton: function(){
					if(inspection_id!=""){
	 					var link = "Inspection.docGrid.do?inspectionId=" + inspection_id;
	 					openDialogForm('inspection_doc_content',link,"Inspection Doc",800,650);
	 	   			}else{
	 	   	   			alert("<s:text name="global.please.select.row"/>");
	 	   	   		}  					
				   }, 
				   position:"last",
				   cursor: "pointer"
				}).navButtonAdd('#insp_treegrid_pager',{
				   caption:"", 
				   title:"<s:text name="label.button.reference"/>", 
				   buttonicon:"ui-icon-pin-w", 
				   onClickButton: function(){
					if(inspection_id!=""){
		   	   			var link = "Inspection.form.do?parentId=" + inspection_id;//+"&refNo="+rowData.inspection_no;
		 				loadURL(link, $("#inspection_form_content"));
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
                  var r = $("#insp_treegrid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       //var localRowData = grid.jqGrid("getLocalRow", rowId);
                       var rowData = $("#insp_treegrid").getRowData(rowId); 
  
                       if(re.test(rowData.orga_name)){
                            //ensure to show all parents of matched nodes
                       		console.log("Match:" + rowData.orga_name + ", Id: " + rowData.id);
                       		while (rowData !== null && rowData.parent_id !== "") {
                       			$($("#" + rowData.parent_id), "#insp_treegrid").show();
                                rowData = $("#insp_treegrid").getRowData(rowData.parent_id);
                       		}
                       		
                       }else{
                           $($("#" + rowId), "#insp_treegrid").hide();
                       }
                  });
              }else{
            	  var r = $("#insp_treegrid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       $($("#" + rowId), "#insp_treegrid").show(); 
                  });                 
              }
          });

   		jQuery("#insp_treegrid").navButtonAdd('#insp_treegrid_pager',{
		   	   caption:"<s:text name="label.button.report"/>",
		   	   title:"<s:text name="label.button.report.generator"/>", 
		   	   buttonicon: "ui-icon-print", 
		   	   onClickButton: function(){ 
			   		var link = "Inspection.reportGenerator.do?";
			   		openDialogForm('report_generator_content',link,"<s:text name="label.button.report.generator"/>",800,420);
		   		
		   	   }, 
		   	   position:"last"
	    	});
          
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_insp_treegrid_container').width();
		$('#insp_treegrid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_insp_treegrid_container">
			<div style="clear:left;">
				<table id="insp_treegrid" class="scroll"></table>
				<div id="insp_treegrid_pager" class="scroll" style="text-align: center;"></div>
			</div>
		</div>
	</div>
	<!-- end widget div -->

</body>

</html>
