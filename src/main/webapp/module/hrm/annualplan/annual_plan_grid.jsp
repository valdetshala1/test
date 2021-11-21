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
       	$grid = jQuery("#annual_plan_grid").jqGrid({
        	   	url:'HrmGrid.annualPlan.do',	
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
//                 toolbar: [true, "both"],                
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
        	        	   	'',
        	   	       		'<s:text name="leave.type.label.name"/>',
        	        	   	'<s:text name="leave.type.label.name.en"/>',
        	        	   	'<s:text name="leave.type.label.name.sr"/>',
        	        	   	'<s:text name="hrm.ann.plan.submission.date"/>',
        	        	   	'<s:text name="law.suit.label.status"/>',
        	        	   	'<s:text name="hum.employee.label.comment"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'annual_plan_al',index:'annual_plan_al', width:'50%',align:'center'},        	   		
        	   		{name:'annual_plan_en',index:'annual_plan_en', width:'100%'},
        	   		{name:'annual_plan_sr',index:'annual_plan_sr', width:'50%', align:'center'},
        	   		{name:'submission_date',index:'submission_date', width:'100%', align:'center'},
        	   		{name:'current_status',index:'current_status', width:'100%', align:'center'},
        	   		{name:'comment',index:'comment', width:'100%',align:'left'}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#annual_plan_grid_pager',
        		gridComplete: function(){
        			var ids = jQuery("#annual_plan_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					pa = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"editRequestType('#request_type_grid', '"+cl+"');\"><i class='fa fa-pencil'></i></button>";
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('HrmAnnualPlanStatus','#annual_plan_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#annual_plan_grid").jqGrid('setRowData',ids[i],{act:pa+au});
        			}	
        		},
        	   	sortname: 'a.id',
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
	  					var link = "HrmAnnPlan.form.do?planId=" + rowData.id;
	  					loadURL(link, $("#annual_plan_form_content"));
       				}
	  		   }
        	});

       	$grid.jqGrid('navGrid','#annual_plan_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});  

       	$grid.navButtonAdd('#annual_plan_grid_pager',{ 
   	   	   caption:"", 
   	   	   title:'<s:text name="label.button.edit"/>', 
   	   	   buttonicon:"ui-icon-pencil", 
   	   	   onClickButton: function(){ 
   	   			var iRow = $grid.jqGrid('getGridParam','selrow');
   	   			if(iRow){
   					var rowData = $grid.getRowData(iRow); 
   					var link = "HrmAnnPlan.form.do?planId=" + rowData.id;
  					loadURL(link, $("#annual_plan_form_content"));
   	   			}else{
   	   	   			alert("<s:text name="tender.request.alarm"/>");
   	   	   		}   
   	   	   }, 
   	   	   position:"last"
   	   	})
   	   	.navButtonAdd('#annual_plan_grid_pager',{
   	   	   caption:"", 
   	   	   title:'<s:text name="attendanceRecord.change.status"/>',
   	   	   buttonicon:"ui-icon-shuffle", 
   	   	   onClickButton: function(){
   	   			var iRow = $grid.jqGrid('getGridParam','selrow');
   	   			if(iRow){
   					var rowData = $grid.getRowData(iRow); 
   					var link = "HrmAnnPlan.statusPopup.do?planId=" + rowData.id;
  					openDialogForm('annual_plan_status_content',link,"",750,550);
   	   			}else{
   	   	   			alert("<s:text name="tender.request.alarm"/>");
   	   	   		}
   	   	   },
   	   	   position:"last"
   	   	});
});

 $(window).bind('resize', function() {
     var width = $('#jqGrid_asset_container').width();
     $('#annual_plan_grid').setGridWidth(width);
 });


 function showSubGrids(subgrid_id, row_id) {
	 showSubGrid_JQGrid2(subgrid_id, row_id,'',"jqgrid_status");//, "<br><span style=''><b>&nbsp; </b></span><br><br>", "jqgrid_status");
	 showSubGrid_JQGrid3(subgrid_id, row_id,'<br><span><b></b></span>', "jqgrid_attachs");//, "<br><span><b>&nbsp; </b></span><br><br>", "jqgrid_attachs");
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
       url:"HrmGrid.annualPlanStatus.do?plan_id="+$grid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
                  '<s:text name="annual.plan.status"/>',
 		          '<s:text name="mer.execution.note"/>',
		          '<s:text name="bid.grid.created.by"/>',
		          '<s:text name="adm.user.grid.created"/>'
		          
		],
       colModel: [
	        {name:"id",index:"id",width:'100%',hidden:true},
	        {name:"status",index:"status",width:'150%',align:"center"},
	        {name:"note",index:"note",width:'250%',hidden:false},
	  		{name:"create_by", index:"create_by",width:'100%', hidden:false},
	  	    {name:"create_date", index:"create_date",width:'100%', hidden:false}
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
       ondblClickRow: function(id, iRow, iCol, e){
	  },
	  onSelectRow: function(){
			jQuery("#annual_plan_grid").resetSelection();
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
       url:"HrmGrid.annualPlanDoc.do?plan_id="+$grid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
                  'annual_plan_id',
                  '',
  		          '<s:text name="doc.name"/>',
 		          '<s:text name="doc.type"/>',
 		          '<s:text name="annual.plan.status"/>',
 		          '<s:text name="mer.execution.note"/>',
 		          '<s:text name="adm.user.grid.created"/>',
		          '<s:text name="bid.grid.created.by"/>',
 		],
       colModel: [
         {name:"id",index:"id",width:'100%',hidden:true},
         {name:"annual_plan_id",index:"annual_plan_id",width:'100%',hidden:true},
         { name: "icon", index:"icon", width:'50%', align:"center",
             formatter: displayDocumentIcons 
         },
         
         {name:"doc_name",index:"doc_name",width:'250%',align:'left',
        	 formatter: function (cellvalue, options, rowObject) {
        		 return '<a href="HrmAnnPlanDoc.do?docId=' + rowObject.id + '" target="_blank"><span style="color:blue"><u>' + cellvalue +  '</u></span></a>';
             }
         },
         {name:"doc_type",index:"doc_type",width:'50%',align:"center"},
         {name:"status_name",index:"status_name",width:'100%',align:"center"},           
         {name:"note",index:"note",width:'250%',align:"center"},
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
			jQuery("#annual_plan_grid").resetSelection();
	  },
	  gridComplete: function(){
		}
    }); 
}

</script>
</head>
<body>
		<!-- widget div -->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_asset_container">
				<table id="annual_plan_grid" class="scroll"></table> 
				<div id="annual_plan_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>

		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
