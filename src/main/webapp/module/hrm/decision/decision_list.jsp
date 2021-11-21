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



$(document).ready(function () {
       	$grid = jQuery("#decision_grid").jqGrid({
        	   	url:'HrmGrid.decision.do',	
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
                ignoreCase: true,
                toppager: false,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
        	        	   	'',
        	   	       		'<s:text name="official.travel.status"/>',
        	        	   	'<s:text name="hrm.decision.decisiontype"/>',
        	        	   	'<s:text name="hrm.decision.decisiondate"/>',
        	        	   	'<s:text name="adm.person.label.address.notes"/>',
        	        	   	'status_key'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'current_status',index:'current_status', width:'50%',align:'center'},        	   		
        	   		{name:'decision_type',index:'decision_type', width:'100%'},
        	   		{name:'date_of_request',index:'date_of_request', width:'50%', align:'center'},
        	   		{name:'note',index:'note', width:'100%', align:'center',sortable:false},
        	   		{name:'status_key',index:'status_key', width:'100%', align:'center', hidden:true}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#decision_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#decision_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Decision','#decision_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
//         					dg = "<button class='btn btn-xs btn-default' data-original-title='Documents' title='<s:text name="audit.title"/>' onclick=\"docsList('thrm_decision','#decision_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	

        					jQuery("#decision_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'a.id',
        	    viewrecords: true,
        	    sortorder: 'asc',
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
						if(rowData.status_key=='REL' || rowData.status_key=='REJ'){
							$("#changeStat").hide();
							}else{
								$("#changeStat").show();
								}
	  					var link = "Decision.form.do?decisionId=" + rowData.id;
	  					loadURL(link, $("#decision_form_content"));
       				}
	  		   },
	  		 onSelectRow: function(ids) {
		  			var selrow = $grid.jqGrid('getGridParam','selrow');
	   				if(selrow){
						var rowData = jQuery(this).getRowData(selrow); 
						if(rowData.status_key=='REL' || rowData.status_key=='REJ'){
							$("#changeStat").hide();
							}else{
								$("#changeStat").show();
								}
	   				}
				}
        	});

       	$grid.jqGrid('navGrid','#decision_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});  

       	$grid.navButtonAdd('#decision_grid_pager',{ 
   	   	   caption:"", 
   	   	   title:'<s:text name="label.button.edit"/>', 
   	   	   buttonicon:"ui-icon-pencil", 
   	   	   onClickButton: function(){ 
   	   			var iRow = $grid.jqGrid('getGridParam','selrow');
   	   			if(iRow){
   					var rowData = $grid.getRowData(iRow); 
   					var link = "Decision.form.do?decisionId=" + rowData.id;
  					loadURL(link, $("#decision_form_content"));
   	   			}else{
   	   	   			alert("<s:text name="tender.request.alarm"/>");
   	   	   		}   
   	   	   }, 
   	   	   position:"last"
   	   	})
   	   	.navButtonAdd('#decision_grid_pager',{ 
    	   	   caption:"", 
    	   	   id:"changeStat",
       	   	   title:'<s:text name="attendanceRecord.change.status"/>', 
       	   	   buttonicon:"ui-icon-shuffle", 
       	   	   onClickButton: function(){ 
       	   			var iRow = $grid.jqGrid('getGridParam','selrow');
       	   			if(iRow){
       					var rowData = $grid.getRowData(iRow); 
       					var link = "Decision.decisionStatus.do?decisionId=" + rowData.id;
       					openDialogForm('decision_status_content',link,"<s:text name="decision.status.popup"/>",900,500);
       	   			}else{
       	   	   			alert("<s:text name="tender.request.alarm"/>");
       	   	   		}   
       	   	   }, 
       	   	   position:"last"
       	   	});  	   	        		     	
});

 $(window).bind('resize', function() {
     var width = $('#jqGrid_asset_container').width();
     $('#decision_grid').setGridWidth(width);
 });


 function showSubGrids(subgrid_id, row_id) {
	 showSubGrid_JQGrid2(subgrid_id, row_id,'',"jqgrid_status");//, "<br><span style=''><b>&nbsp; </b></span><br><br>", "jqgrid_status");
	 //showSubGrid_JQGrid3(subgrid_id, row_id,'<br><span><b></b></span>', "jqgrid_attachs");//, "<br><span><b>&nbsp; </b></span><br><br>", "jqgrid_attachs");
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
       url:"HrmGrid.decisionStatus.do?decisionId="+$grid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
           		   '',
                  '<s:text name="annual.plan.status"/>',
 		          '<s:text name="mer.execution.note"/>',
		          '<s:text name="bid.grid.created.by"/>',
		          '<s:text name="adm.user.grid.created"/>',
		          'encryptedText'
		],
       colModel: [
	        {name:"id",index:"id",width:'100%',hidden:true},
	        {name:'act',index:'act', width:'50%',search:false},
	        {name:"status",index:"status",width:'100%',align:"center"},
	        {name:"note",index:"note",width:'200%',hidden:false},
	  		{name:"create_by", index:"create_by",width:'100%', hidden:false},
	  	    {name:"create_date", index:"create_date",width:'100%', hidden:false},
	  		{name:"encryptedText",index:"encryptedText",width:'200%',hidden:true}
	  	    ],
       pager: pager_id,
       height: 'auto',
       width: '100%',
       rowNum:10,
 	   rowList:[10,20,30],
       caption: '<s:text name="law.suit.label.status"/>',
   	   viewrecords: true,
   		shrinkToFit: true,
       sortname: 'status',
       sortorder: "asc",
	   	gridComplete: function(){
			var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
			for(var i=0;i < ids.length;i++){
					var cl = ids[i];
					//thrm_decision_status
        			var rowData = jQuery("#"+subgrid_table_id).getRowData(cl); //rowData.encryptedText
					dg = "<button class='btn btn-xs btn-default' data-original-title='Documents' title='<s:text name="audit.title"/>' onclick=\"docsList('"+rowData.encryptedText+"','#decision_grid', '"+rowData.id+"');\"><i class='fa fa-folder'></i></button>";	
					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{act:dg});
			}	
		},
       ondblClickRow: function(id, iRow, iCol, e){
	  },
	  onSelectRow: function(){
			jQuery("#decision_grid").resetSelection();
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
       url:"HrmGrid.decisionDoc.do?decisionId="+$grid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
                  'decision_id',
                  '',
  		          '<s:text name="doc.name"/>',
 		          '<s:text name="doc.type"/>',
 		         '<s:text name="law.suit.label.status"/>',
 		          '<s:text name="adm.user.grid.created"/>',
		          '<s:text name="bid.grid.created.by"/>',
 		],
       colModel: [
         {name:"id",index:"id",width:'100%',hidden:true},
         {name:"decision_id",index:"decision_id",width:'100%',hidden:true},
         { name: "icon", index:"icon", width:'50%', align:"center",
             formatter: displayDocumentIcons 
         },
         {name:"doc_name",index:"doc_name",width:'250%',align:'left',
        	 formatter: function (cellvalue, options, rowObject) {
        		 return '<a href="DecisionDoc.do?docId=' + rowObject.id + '" target="_blank"><span style="color:blue"><u>' + cellvalue +  '</u></span></a>';
             }
         },
         {name:"doc_type",index:"doc_type",width:'50%',align:"center"},           
         {name:"status_name",index:"status_name",width:'100%',align:"center"},
         {name:"created_date",index:"created_date",width:'100%',align:"center"},
         {name:"created_by",index:"created_by",width:'100%',align:"center"}
         
       ],
       pager: pager_id,
       height: 'auto',
       width: '100%',
       caption: '<s:text name="dp.doc.attachments"/>',
       rowNum:10,
 	   rowList:[10,20,30],
	   autowidth: false,
	   shrinkToFit: true,
	   gridview: true,
       headertitles: true,
       ignoreCase: true, 	   
   	   viewrecords: true,
       sortname: 'doc_name',
       sortorder: "asc",
       ondblClickRow: function(id, iRow, iCol, e){
	  },
	  onSelectRow: function(){
	  		jQuery("#decision_grid").resetSelection();
	  },
	  gridComplete: function(){
		}
    }); 
}//decisionStatus

</script>
</head>
<body>
		<!-- widget div -->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_asset_container">
				<table id="decision_grid" class="scroll"></table> 
				<div id="decision_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>

		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
