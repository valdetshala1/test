<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
<script type="text/javascript">
var iconAlert = '<span class="ui-state-error" style="border:0"><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span></span>';
var iconLupe = '<span class="ui-state-error" style="border:0"><span class="ui-icon ui-icon-search" style="float: left; margin-right: .3em;"></span></span>';

/*
'OP': 'Open',
'AP': 'Approve',
'RE': 'Reject',
'CA': 'Cancel',
'CL': 'Close'
*/
function displayIcons(cellvalue, options, rowObject){
	var icon = "";
	 if(cellvalue){
	    if(cellvalue=="OP" || cellvalue=="NEW"){
	    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_op.png'/> <span style='text-transform: uppercase;'><s:text name='tender.request.button.new'/></span></span>";
	    }else if(cellvalue=="AP"){
	    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_ap.png'/> <span style='text-transform: uppercase;'><s:text name="tender.request.button.approved"/></span></span>";
	    }else if(cellvalue=="RE"){
	    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_re.png'/> <span style='text-transform: uppercase;'><s:text name="tender.request.button.rejected"/></span></span>";
	    }else if(cellvalue=="CA"){
	    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_ca.png'/> <span style='text-transform: uppercase;'><s:text name="tender.request.button.canceled"/></span></span>";
	    }else if(cellvalue=="CL"){
	    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_cl.png'/> <span style='text-transform: uppercase;'><s:text name="fin.contactor.closed"/></span></span>";
	    }else{
	    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_" + cellvalue.toLowerCase() + ".png'/> " + cellvalue.toUpperCase() + "</span>";
	    }
	}
    /*
	var icon = "<img src='img/status/status_" + cellvalue.toLowerCase() + ".png'/> " + cellvalue;    
	*/
    return icon;
}

function displayDocumentIcons(cellvalue, options,rowData, rowObject){
	var icon = "";
	icon='<img src="img/filetypes/32px/' + rowData.doc_type + '.png"/>';  
    return icon;
}

$(document).ready(function () {
       	$rqgrid = jQuery("#preq_grid").jqGrid({
        	   	url:'OrderMgmtGrid.requisition.do',	
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
                toolbar: [true, "both"],                
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
        	   				'',
        	        	   	'<s:text name="bpartner.is.active"/>',
        	   	       		'<s:text name="annual.plan.status.code"/>',
        	   	       		'status',
        	   	       	    '<s:text name="requisition.no"/>',
        	   	       		'<s:text name="requisition.document.id"/>',
        	   	       		'<s:text name="requisition.document.no"/>',
        	   	       		
        	        	   	'<s:text name="adm.organisation.legend.organisation.id"/>',
        	        	   	'<s:text name="requisition.organisation.name"/>',
        	        	   	
        	        	   	'<s:text name="requisition.requester.name"/>',
        	        	   	'<s:text name="requisition.requester.phone"/>',
        	        	   	'<s:text name="requisition.destination.type"/>',

        	        	   	'<s:text name="requisition.is.bpartner"/>',  
        	        	   	'<s:text name="requisition.bpartner.id"/>',
        	        	   	'<s:text name="bpartner.bussines.partner"/>',
        	        	   	
        	        	   	'<s:text name="requisition.supplier.name"/>',
        	        	   	'<s:text name="requisition.supplier.contact"/>',
        	        	   	'<s:text name="bidder.contact.phone"/>',
        	        	   	'<s:text name="requisition.supplier.address"/>',
        	        	   	'<s:text name="requisition.supplier.fax"/>',
        	        	   	'<s:text name="requisition.supplier.email"/>',
        	        	   	'<s:text name="requisition.supplier.site"/>',
        	        	   	        	        	   	
        	        	   	'<s:text name="requisition.total.amount"/>',
        	        	   	'currency_id',
        	        	   	'<s:text name="requisition.currency"/>',
        	        	   	'<s:text name="requisition.desired.date"/>',
        	        	   	'<s:text name="adm.user.grid.created"/>',
        	        	   	'<s:text name="bid.grid.created.by"/>',
        	        	   	'<s:text name="dp.doc.category.updated"/>',
        	        	   	'<s:text name="dp.doc.category.updated.by"/>',
        	        	   	'<s:text name="requisition.text.msg"/>',
        	        	   	'<s:text name="annual.plan.status.id"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden: true, width:'50%'},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'isactive',index:'isactive', hidden: true,formatter:"checkbox", width:'50%',align:'left'},
        	   		{name:'status_code',index:'status_code', width:'100%',align:'left', formatter: displayIcons},
        	   		{name:'status',index:'status', width:'100%',align:'left',hidden:true},
        	   		{name:'requisition_nr',index:'requisition_nr', width:'50%',align:'center'},
        	   		{name:'document_id',index:'document_id', width:'50%',align:'center'},
        	   		{name:'documentno',index:'documentno', width:'50%',align:'center'},

        	   		{name:'organisation_id',index:'organisation_id', width:'100%'},        	   		
        	   		{name:'organisation_name',index:'organisation_name', width:'100%'},

        	   		{name:'requester_name',index:'requester_name', width:'100%'},
        	   		{name:'requester_phone',index:'requester_phone', width:'100%'},
        	   		{name:'destination_type',index:'destination_type', width:'100%'},

        	   		{name:'is_bpartner',index:'is_bpartner', width:'100%',align:"center",formatter:"checkbox"},
        	   		{name:'bpartner_id',index:'bpartner_id', width:'50%', align:'center',hidden:true},
        	   		{name:'bpartner',index:'bpartner', width:'100%', align:'center'},
        	   		
        	   		{name:'supplier_name',index:'supplier_name', width:'100%', align:'center'},
        	   		{name:'supplier_contact',index:'supplier_contact', width:'100%', align:'center'},
        	   		{name:'supplier_phone',index:'supplier_phone', width:'100%'},
        	   		{name:'supplier_address',index:'supplier_address', width:'100%'},
        	   		{name:'supplier_fax',index:'supplier_fax', width:'100%'},
        	   		{name:'supplier_email',index:'supplier_email', width:'100%',align:'left'},
        	   		{name:'supplier_site',index:'supplier_site', width:'100%'},
        	   		
        	   		{name:'total_amount',index:'total_amount', width:'100%',align:'center'},
        	   		{name:'currency_id',index:'currency_id', width:'100%',hidden:true},
        	   		{name:'currency_symbol',index:'currency_symbol', width:'100%'},
        	   		{name:'desired_date',index:'desired_date', width:'100%'},
        	   		{name:'created',index:'created', width:'100%'},
        	   		{name:'createdby',index:'createdby', width:'100%'},
        	   		{name:'updated',index:'updated', width:'60%',align:'center'},
        	   		{name:'updatedby',index:'updatedby', width:'100%'},
        	   		{name:'textmsg',index:'textmsg', width:'100%'},
        	   		{name:'status_id',index:'status_id', width:'100%'}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#preq_grid_pager',
        	   		gridComplete: function(){
        			var ids = jQuery("#preq_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Requisition','#preq_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#preq_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'requisition_nr',
        	    viewrecords: true,
        	    sortorder: 'asc',
        		multiselect: true,
        		multiboxonly: true,
        		caption: '',
        		subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		    	showSubGrids(subgrid_id, row_id);
     		    },
     		    onCellSelect: function (rowid, iCol, aData) {
       	   			if(rowid){
      					var rowData = $rqgrid.getRowData(rowid);
      					if(rowData.status!=="AP"){
							$("#print_req").addClass("ui-state-disabled");
          				}else{
          					$("#print_req").removeClass("ui-state-disabled");
              			}
       	   			}
     	        },
       		   ondblClickRow: function(id, iRow, iCol, e) {
       			var selrow = $rqgrid.jqGrid('getGridParam','selrow');
   				if(selrow){
					var rowData = jQuery(this).getRowData(selrow);
					var link = "PReq.form.do?requisitionId=" + rowData.id;
  					loadURL(link, $("#preq_content"));	
   				}			
	  		  }      		         
        	});

       	$rqgrid.jqGrid('navGrid','#preq_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:false, cloneToTop: true,search:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});  

       	$rqgrid.jqGrid ('navButtonAdd', '#preq_grid_toppager',
            	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns", 
            	onClickButton: function() {
            		$rqgrid.jqGrid('columnChooser');
            	}
        })
    	.navButtonAdd('#preq_grid_toppager',{
  	   	   caption:"", 
  	   	   title:'<s:text name="label.button.edit"/>', 
  	   	   buttonicon:"ui-icon-pencil", 
  	   	   onClickButton: function(){ 
  	   			var iRow = $rqgrid.jqGrid('getGridParam','selrow');
  	   			if(iRow){
  					var rowData = $rqgrid.getRowData(iRow);
  					var link = "PReq.form.do?requisitionId=" + rowData.id;
  					loadURL(link, $("#preq_content"));
  	   			}else{
  	   	   			alert("<s:text name="tender.request.alarm"/>");
  	   	   		}
  	   	   }, 
  	   	   position:"last"
  	   	})
    	.navButtonAdd('#preq_grid_pager',{ 
   	   	   caption:"", 
   	   	   title:'<s:text name="label.button.edit"/>', 
   	   	   buttonicon:"ui-icon-pencil", 
   	   	   onClickButton: function(){ 
   	   			var iRow = $rqgrid.jqGrid('getGridParam','selrow');
   	   			if(iRow){
  					var rowData = $rqgrid.getRowData(iRow); 
  					var link = "PReq.form.do?requisitionId=" + rowData.id;
  					loadURL(link, $("#preq_content"));
   	   			}else{
   	   	   			alert("<s:text name="tender.request.alarm"/>");
   	   	   		}   
   	   	   }, 
   	   	   position:"last"
   	   	})
   	   	.navButtonAdd('#preq_grid_pager',{ 
   	   	   caption:'Reports', 
   	   	   title:'<s:text name="label.button.report"/>', 
   	   	   buttonicon:"ui-icon-print",
   	   	   id:"print_req", 
   	   	   onClickButton: function(){ 
   	   			var iRow = $rqgrid.jqGrid('getGridParam','selrow');
   	   			if(iRow){
  					var rowData = $rqgrid.getRowData(iRow);
//   					var link="ads/order/requisition/requisition_report.rptdesign";
//   					var parameters = "p_req_id="+rowData.id;
//   					openBirtViewer(link, parameters);
// 						var link = "module/ads/order/requisition/requisition_report_generator.jsp";
						var link = "PReq.rep_generator.do?req_id="+rowData.id;
// 						loadURL(link, $("#preq_content"));
   	   					openDialogForm("report_generator_content", link, "Generate Reports",650,180);
   	   			}else{
   	   	   			alert("<s:text name="tender.request.alarm"/>");
						
   	   	   	   		}
   	   	   }, 
   	   	   position:"last"
   	   	});   	   	        		     	
});

 $(window).bind('resize', function() {
     var width = $('#jqGrid_preq_container').width();
     $('#preq_grid').setGridWidth(width);
 });


 function showSubGrids(subgrid_id, row_id) {
	 var str = "<span style='color:blue;'>" + $rqgrid.getRowData(row_id).documentno + "</span>";
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
 jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><div id='+pager_id+' class="scroll" style="text-align:center;"></div>');
 jQuery("#"+subgrid_table_id).jqGrid({
       url:"DpGrid.status.do?dp_id="+$rqgrid.getRowData(row_id).document_id,
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
       caption: '',
       rowNum:10,
 	   rowList:[10,20,30],
   	   viewrecords: true,
       sortname: 'status_code',
       sortorder: "asc",
       ondblClickRow: function(id, iRow, iCol, e){
	  },
	  onSelectRow: function(){
			jQuery("#req_grid").resetSelection();
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
 jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><div id='+pager_id+' class="scroll" style="text-align:center;"></div>');
 
  jQuery("#"+subgrid_table_id).jqGrid({
       url:"DpGrid.attachments.do?dp_id="+$rqgrid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
                  'dp_mngm_id',
                  '',
  		          '<s:text name="doc.name"/>',
 		          '<s:text name="doc.content.type"/>',
 		          '<s:text name="doc.type"/>',
 		          '<s:text name="doc.size"/>',
 		          '<s:text name="adm.user.grid.created"/>',
		          '<s:text name="bid.grid.created.by"/>',
		          '<s:text name="dp.doc.category.updated"/>',
		          '<s:text name="dp.doc.category.updated.by"/>'
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
         {name:"doc_content_type",index:"doc_content_type",width:'150%',align:'left'},
         {name:"doc_type",index:"doc_type",width:'50%',align:"center"},           
         {name:"doc_size",index:"doc_size",width:'100%',align:"center"},
         {name:"created",index:"created",width:'100%',align:"center"},
         {name:"createdby",index:"createdby",width:'100%',align:"center"},
         {name:"updated",index:"updated",width:'100%',align:"center"},
         {name:"updatedby",index:"updatedby",width:'100%',align:"center"}
       ],
       pager: pager_id,
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

			<div id="jqGrid_preq_container">
				<table id="preq_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="preq_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>

		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
