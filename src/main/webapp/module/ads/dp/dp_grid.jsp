<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
/*
.ui-jqgrid .ui-jqgrid-toppager .ui-pg-div {
    margin-top: 2px;
    padding-right: 5px;
}
.ui-jqgrid .ui-jqgrid-toppager .ui-pg-div span.ui-icon {
    margin-top: -2px;
}
.ui-jqgrid .ui-jqgrid-pager .ui-pg-div {
    margin-top: 2px;
    padding-right: 5px;
}
.ui-jqgrid .ui-jqgrid-pager .ui-pg-div span.ui-icon {
    margin-top: -2px;
}
*/
</style>
<script type="text/javascript">
var iconAlert = '<span class="ui-state-error" style="border:0"><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span></span>';
var iconLupe = '<span class="ui-state-error" style="border:0"><span class="ui-icon ui-icon-search" style="float: left; margin-right: .3em;"></span></span>';

function displayDocumentIcons(cellvalue, options,rowData, rowObject){
	var icon = "";
	icon='<img src="img/filetypes/32px/' + rowData.doc_type + '.png"/>';  
    return icon;
}

function editFunction(url){
	openDialogForm('doc_edit_content',url,'test',600,300);
}
$(document).ready(function () {
       	$grid = jQuery("#dp_grid").jqGrid({
        	   	url:'DpGrid.dp.do',	
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
                ignoreCase: true,
                toppager: false,
//                 toolbar: [true, "both"],                
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
        	        	   	'',
        	   	       		'<s:text name="law.suit.label.status"/>',
        	        	   	'<s:text name="asset.legend.department"/>',
        	        	   	'<s:text name="law.suit.label.active"/>',
        	        	   	'<s:text name="dp.doc.number"/>',
        	        	   	'<s:text name="dp.doc.subject"/>',
        	        	   	'<s:text name="dp.document.type"/>',  
        	        	   	'<s:text name="dp.doc.attachments"/>',
        	        	   	'<s:text name="dp.shipper"/>',
        	        	   	'<s:text name="dp.receiver.person"/>',
//         	        	   	'<s:text name="processed"/>',
        	        	   	'<s:text name="dp.document.owner"/>',
        	        	   	'<s:text name="dp.issued.date"/>',
        	        	   	'<s:text name="dp.received.date"/>',
//         	        	   	'<s:text name="stored_date"/>',
        	        	   	'<s:text name="requisition.text.msg"/>',
        	        	   	'department_id',
        	        	   	'doctype_id',
        	        	   	'status_id',
        	        	   	'owner_id'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'status',index:'status', width:'50%',align:'center'},        	   		
        	   		{name:'department',index:'department', width:'100%'},
        	   		{name:'isactive',index:'isactive', width:'50%', align:'center',hidden:true},
        	   		{name:'documentno',index:'documentno', width:'100%', align:'center'},
        	   		{name:'doc_subject',index:'doc_subject', width:'100%', align:'center'},
        	   		{name:'doctype',index:'doctype', width:'100%',align:'left'},
        	   		{name:'attachments',index:'attachments', width:'100%',align:'center',hidden:true},
        	   		{name:'shipper',index:'shipper', width:'100%',align:'left'},
        	   		{name:'receiver',index:'receiver', width:'100%',align:'left'},
//         	   		{name:'processed',index:'processed', width:'60%',align:'center'},
        	   		{name:'owner',index:'owner', width:'100%',align:'left'},
        	   		{name:'issued_date',index:'issued_date', width:'100%',align:'left'},
        	   		{name:'received_date',index:'received_date', width:'100%',align:'left'},
//         	   		{name:'stored_date',index:'stored_date', width:'100%',align:'left'},
        	   		{name:'textmsg',index:'textmsg', width:'100%',align:'left',sortable:false},
        	   		{name:'department_id',index:'department_id', hidden:true, width:'100%'},
        	   		{name:'doctype_id',index:'doctype_id', hidden:true, width:'100%',align:'left'},
        	   		{name:'status_id',index:'status_id', hidden:true, width:'100%',align:'left'},
        	   		{name:'owner_id',index:'owner_id', hidden:true, width:'100%',align:'left'}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#dp_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#dp_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DpMngmt','#dp_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#dp_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'documentno',
        	    viewrecords: true,
        	    sortorder: 'asc',
        		multiselect: true,
        		multiboxonly: true,
        		caption: '',
        		subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		    	showSubGrids(subgrid_id, row_id);
     		   },
       		   ondblClickRow: function(id, iRow, iCol, e) {
       				var selrow = $grid.jqGrid('getGridParam','selrow');
       				if(selrow){
						var rowData = jQuery(this).getRowData(selrow); 
	  					var link = "DpMngmt.form.do?dpId=" + rowData.id;
	  					loadURL(link, $("#dp_content"));
       				}		
	  		   }      		     		
        	});

       	$grid.jqGrid('navGrid','#dp_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:false, cloneToTop: true,search:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});  

       	$grid.jqGrid ('navButtonAdd', '#dp_grid_toppager',
            	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns", 
            	onClickButton: function() {
            		$grid.jqGrid('columnChooser');
            	}
        })
    	.navButtonAdd('#dp_grid_toppager',{
  	   	   caption:"", 
  	   	   title:'<s:text name="label.button.edit"/>', 
  	   	   buttonicon:"ui-icon-pencil", 
  	   	   onClickButton: function(){ 
  	   			var iRow = $grid.jqGrid('getGridParam','selrow');
  	   			if(iRow){
  					var rowData = $grid.getRowData(iRow); 
  					var link = "DpMngmt.form.do?dpId=" + rowData.id;
  					loadURL(link, $("#dp_content"));
  	   			}else{
  	   	   			alert("<s:text name="tender.request.alarm"/>");
  	   	   		}   
  	   	   }, 
  	   	   position:"last"
  	   	})
    	.navButtonAdd('#dp_grid_pager',{ 
   	   	   caption:"", 
   	   	   title:'<s:text name="label.button.edit"/>', 
   	   	   buttonicon:"ui-icon-pencil", 
   	   	   onClickButton: function(){ 
   	   			var iRow = $grid.jqGrid('getGridParam','selrow');
   	   			if(iRow){
   					var rowData = $grid.getRowData(iRow); 
   					var link = "DpMngmt.form.do?dpId=" + rowData.id;
   					loadURL(link, $("#dp_content"));
   	   			}else{
   	   	   			alert("<s:text name="tender.request.alarm"/>");
   	   	   		}   
   	   	   }, 
   	   	   position:"last"
   	   	});   	   	        		     	
});

 $(window).bind('resize', function() {
     var width = $('#jqGrid_asset_container').width();
     $('#dp_grid').setGridWidth(width);
 });


 function showSubGrids(subgrid_id, row_id) {
	 var str = "<span style='color:blue;'>" + $grid.getRowData(row_id).documentno + "</span>";
	 showSubGrid_JQGrid2(subgrid_id, row_id, "<br><span style=''><b>&nbsp;Status of Document № " + str + "</b></span><br><br>", "jqgrid_status");
	 showSubGrid_JQGrid3(subgrid_id, row_id, "<br><span><b>&nbsp;Attachments of Document № " + str + "</b></span><br><br>", "jqgrid_attachs");
 }  

function showSubGrid_JQGrid2(subgrid_id, row_id, message, suffix) {
 var subgrid_table_id, pager_id, toppager_id;
 subgrid_table_id = subgrid_id+'_t';
 pager_id = 'p_'+ subgrid_table_id;
 toppager_id = subgrid_table_id + '_toppager';
 if (suffix) { subgrid_table_id += suffix; pager_id += suffix;  }
 if (message) jQuery('#'+subgrid_id).append(message);                        
 jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div>');
 jQuery("#"+subgrid_table_id).jqGrid({
       url:"DpGrid.status.do?dp_id="+$grid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
                  '<s:text name="annual.plan.status.code"/>',
 		          '<s:text name="requisition.dp.mngm.id"/>',
 		          '<s:text name="requisition.from.dpt.id"/>',
		          '<s:text name="requisition.from.dpt"/>',
		          '<s:text name="requisition.to.dpt.id"/>',
		          '<s:text name="requisition.to.dpt"/>',
		          '<s:text name="dhpet.wild.animal.label.action.taken"/>',
		          '<s:text name="requisition.text.msg"/>',
		          '<s:text name="adm.user.grid.created"/>',
		          '<s:text name="bid.grid.created.by"/>',
		          '<s:text name="dp.doc.category.updated"/>',
		          '<s:text name="dp.doc.category.updated.by"/>'
		],
       colModel: [
	        {name:"id",index:"id",width:'100%',hidden:true},
	        {name:"status_code",index:"status_code",width:'100%',align:"center"},
	        {name:"dp_mngm_id",index:"dp_mngm_id",width:'100%',hidden:true},
	  		{name:"from_dpt_id", index:"from_dpt_id",width:'100%', hidden:true},
	  	    {name:"from_dpt", index:"from_dpt",width:'100%', hidden:false},
	        {name:"to_dpt_id",index:"to_dpt_id",width:'100%',align:'left', hidden:true},
	        {name:"to_dpt",index:"to_dpt",width:'100%',align:'left'},
	        {name:"action_taken",index:"action_taken",width:'100%',align:"center"},           
	        {name:"textmsg",index:"textmsg",width:'100%',align:"center"},
	        {name:"created",index:"created",width:'100%',align:"center"},
	        {name:"createdby",index:"createdby",width:'100%',align:"center"},
	        {name:"updated",index:"updated",width:'100%',align:"center"},
	        {name:"updatedby",index:"updatedby",width:'100%',align:"center"}
       ],
       pager: pager_id,
       height: 'auto',
       width: 'auto',
       rowNum:10,
 	   rowList:[10,20,30],
       caption: '',
   	   viewrecords: true,
       sortname: 'status_code',
       sortorder: "asc",
       ondblClickRow: function(id, iRow, iCol, e){
	  },
	  onSelectRow: function(){
			jQuery("#dp_grid").resetSelection();
			  }
    }); 
}

function showSubGrid_JQGrid3(subgrid_id, row_id, message, suffix) {
 var subgrid_table_id, pager_id, toppager_id;

 subgrid_table_id = subgrid_id+'_t';
 pager_id = 'p_'+ subgrid_table_id;
 toppager_id = subgrid_table_id + '_toppager';
 if (suffix) { subgrid_table_id += suffix; pager_id += suffix;  }
 if (message) jQuery('#'+subgrid_id).append(message);                        
 jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><br>');
 
  jQuery("#"+subgrid_table_id).jqGrid({
       url:"DpGrid.attachments.do?dp_id="+$grid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
                  '',
                  'dp_mngm_id',
  		          '<s:text name="doc.name"/>',
 		          '<s:text name="doc.content.type"/>',
 		          '<s:text name="doc.type"/>',
 		          '<s:text name="doc.size"/>',
 		          '<s:text name="adm.user.grid.created"/>',
		          '<s:text name="bid.grid.created.by"/>',
		          '<s:text name="dp.doc.category.updated"/>',
		          '<s:text name="dp.doc.category.updated.by"/>',
 		         '<s:text name="label.button.edit"/>'
 		],
       colModel: [
         {name:"id",index:"id",width:'100%',hidden:true},
         {name:"dp_mngm_id",index:"dp_mngm_id",width:'100%',hidden:true},
         { name: "icon", index:"icon", width:'50%', align:"center",
             formatter: displayDocumentIcons 
         },         
         {name:"doc_name",index:"doc_name",width:'250%',align:'left',
        	 formatter: function (cellvalue, options, rowObject) {
        		 return '<a href="DpDocGenerator.do?docId=' + rowObject.id + '" target="_blank"><span style="color:blue"><u>' + cellvalue +  '</u></span></a>';
             }              
         },
         {name:"doc_content_type",index:"doc_content_type",width:'150%',align:'left',hidden:true},
         {name:"doc_type",index:"doc_type",width:'50%',align:"center"},           
         {name:"doc_size",index:"doc_size",width:'100%',align:"center"},
         {name:"created",index:"created",width:'100%',align:"center"},
         {name:"createdby",index:"createdby",width:'100%',align:"center"},
         {name:"updated",index:"updated",width:'100%',align:"center"},
         {name:"updatedby",index:"updatedby",width:'100%',align:"center"},
         {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'}
       ],
       pager: pager_id,
   	gridComplete: function(){
		var ids = jQuery("#dp_grid").jqGrid('getDataIDs');
		for(var i=0;i < ids.length;i++){
			var cl = ids[i];
				pa = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"editRequestType('#request_type_grid', '"+cl+"');\"><i class='fa fa-pencil'></i></button>";
				au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DpMngmtStatus','#dp_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
				jQuery("#dp_grid").jqGrid('setRowData',ids[i],{act:pa+au});
		}	
	},
       height: 'auto',
       width: 'auto',
       caption: '',
       rowNum:10,
 	   rowList:[10,20,30],
	   autowidth: false,
	   shrinkToFit: false,
	   gridview: true,
       headertitles: true,
       ignoreCase: true, 	   
   	   viewrecords: true,
       sortname: 'doc_name',
       sortorder: "asc",
       ondblClickRow: function(id, iRow, iCol, e){
	  },
	  onSelectRow: function(){
			jQuery("#dp_grid").resetSelection();
	  },
	  gridComplete: function(){
     		var ids = jQuery(this).jqGrid('getDataIDs');
				for(var i=0;i < ids.length;i++){
		        	var url="DpMngmt.docEdit.do?docId="+jQuery("#"+subgrid_table_id).jqGrid().getRowData(ids[i]).id;
		        	be = "<button class='btn btn-xs btn-default' data-original-title='Edit' onclick=\"editFunction('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
 					jQuery(this).jqGrid('setRowData',ids[i],{generate:be});
				}
		}
    }); 
}

function imageFormat( cellvalue, options, rowObject ){
	return '<img src="img/filetypes/'+rowObject['doc_type']+'_type.png" width="30px" height="30px"/>';
}

function formatOperations(cellvalue, options, rowObject) {
    return "<a href='/exam/editQuestion.html?q_id=" + cellvalue +"'><u>Edit</u></a>  "+
	       "<a href='/exam/deleteQuestion.html?q_id=" + cellvalue +"'><u>Delete</u></a>";
}

function editLinkFmatter(cellvalue, options, rowObject) {
    return "<a href='" +
        $.param({
            documentId: rowObject["@id"],
            action: 'OpenDocument'
        }) + "' class='requestlink' target='_blank'>" + cellvalue + "</a>";
}

</script>
</head>
<body>
		<!-- widget div -->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_asset_container">
				<table id="dp_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="dp_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>

		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
