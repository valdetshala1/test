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

        $(document).ready(function () {
        	jQuery("#bid_grid").jqGrid({
        		url:'ProGrid.bids.do?tenderId='+$("#tenderRequestId").val(),	
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
        	   	colNames:['Id', 
        	        	   	'',
        	        	   	 '<s:text name="bid.grid.tender"/>',
        	        	   	 '<s:text name="bid.bidder"/>',
        	        	   	 '<s:text name="bid.bidValue"/>',
        	        	   	 '<s:text name="bid.grid.selected"/>',
        	        	   	 '<s:text name="tender.request.analyse.comment"/>',
        	        	   	 'doc',
        	        	   	 '<s:text name="bid.grid.created.by"/>',
        	        	   	 '<s:text name="bid.grid.created.date"/>',
        	        	   	 '<s:text name="tender.request.attachment"/>'
        	        	   ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'proTenderRequest',index:'proTenderRequest', width:'100%'},
        	   		{name:'proTenderBidder',index:'proTenderBidder', width:'100%'},
        	   		{name:'bid_value',index:'bid_value', width:'100%'},
        	   		{name:'selected',index:'selected', width:'100%',align:"center",formatter:"checkbox"},
        	   		{name:'comment',index:'comment', width:'100%',align:"center"},
        	   		{name:'doc',index:'doc', width:'100%',hidden:true},
        	   		{name:'createdBy',index:'party', width:'100%', align:"center"},
        	   		{name:'createdDate',index:'createdDate', width:'100%',align:"center"},
        	   		{name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'}
        	   		
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#bid_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		gridComplete: function(){
   		       		var ids = jQuery("#bid_grid").jqGrid('getDataIDs');
	   				for(var i=0;i < ids.length;i++){
		   				var rowData=jQuery("#bid_grid").jqGrid().getRowData(ids[i]);
		   				if(rowData.doc){
		   					var url="BidAttach.do?bidAttachmentId="+rowData.id;
		   					attachment = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
		   					jQuery("#bid_grid").jqGrid('setRowData',ids[i],{generate:attachment});
		   				}
		   				au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('PrcmtTenderBid','#bid_grid', '"+ids[i]+"');\"><i class='fa fa-history'></i></button>";	
    					jQuery("#bid_grid").jqGrid('setRowData',ids[i],{act:au});
		   				
		   				
	   				}
				},
        		loadtext:'Loading, please wait',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				
 					var selectedRow = jQuery(this).jqGrid('getGridParam','selrow');
    				if(selectedRow){
	 					var rowData = jQuery(this).getRowData(selectedRow); 
	    				var link = "Bid.form.do?bidId=" + rowData.id;
	 					loadURL(link, $("#bid_form_content"));
    				}else{alert('<s:text name="tender.request.alarm"/>');
    				}
   				},
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
     		       var subgrid_table_id,pager_id;
     		       subgrid_table_id = subgrid_id+"_t";
//      		   jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
				   pager_id = 'p_'+ subgrid_table_id;
     		       jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><br>');
     		       jQuery("#"+subgrid_table_id).jqGrid({
     		          url:"ProGrid.complaint.do?bidId="+jQuery("#bid_grid").getRowData(row_id).id,
     		          datatype: "json",
     		          colNames: ['Id','<s:text name="bid.complaint"/>','<text value="doc.name"/>','<s:text name="tender.request.attachment"/>'],
        		      colModel: [
     		            {name:"id",index:"id",width:'100',hidden:true},
     		            {name:"complaint",index:"complaint",width:'500'},
     		            {name:"docName",index:"docName",width:'200',align:"center"},
     		         	{name: "generate", index: "generate",sortable:false, search:false, width:'100',align:"center"}
     		          ],
     		       	  pager: pager_id,
     		          height: 'auto',
     		          width: 'auto',
     		          rowNum:10,
             	   	  rowList:[10,20,30],
     		      	  viewrecords: true,
     		          sortname: 'id',
     		          sortorder: "asc",
     		     	gridComplete: function(){
 	   		       		var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
 		   				for(var i=0;i < ids.length;i++){
	 		   				var url="ComplaintAttach.do?complaintId="+jQuery("#"+subgrid_table_id).jqGrid().getRowData(ids[i]).id;
 		   					be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
 		   				}
	   				},
	   				onSelectRow: function(){
	   					jQuery("#bid_grid").resetSelection();
 	   				}
     		       });
     		   }	        		

        	});
            	
        	jQuery("#bid_grid").jqGrid('navGrid','#bid_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#bid_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#bid_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="label.button.edit"/>", 
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "Bid.form.do?bidId=" + rowData.id;
             					loadURL(link, $("#bid_form_content"));
             	   			}else{
             	   	   			alert('<s:text name="tender.request.alarm"/>');
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
             	   	.navButtonAdd('#bid_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="label.button.evaluation"/>", 
             	   	   buttonicon:"ui-icon-calculator", 
             	   	   onClickButton: function(){ 
             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
         	   			if(iRow){   
	             	  		var rowData = jQuery(this).getRowData(iRow); 
	             	  		var url= "Bid.evaluationPopup.do?bidId="+rowData.id;
	                 	   	openDialogForm("evaluation_content",url, "<s:text name="bid.evaluation.title"/>", 500, 300);
       	   				}else{
           	   	   			alert('<s:text name="tender.request.alarm"/>');
           	   	   		}  
               	   	   },
             	   	   position:"last"
             	   	});
     	   	
     	   	if($("#tenderRequestStatus").val()=='PEN' || $("#tenderRequestStatus").val()=='SEL'){
     	   	jQuery("#bid_grid").navButtonAdd('#bid_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="bid.complaint"/>", 
             	   	   buttonicon:"ui-icon-notice", 
             	   	   onClickButton: function(){ 
             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
         	   			if(iRow){   
	             	  		var rowData = jQuery(this).getRowData(iRow); 
	             	  		var url= "Bid.complaintPopup.do?bidId="+rowData.id;
	                 	   		openDialogForm("bidComplaint",url, "<s:text name="bid.complaint.title"/>", 600, 300);
         	   				}else{
             	   	   			alert('<s:text name="tender.request.alarm"/>');
             	   	   		}  
                	   	   },
             	   	   position:"last"
             	   	});
     	   	}
     	   jQuery("#bid_grid").navButtonAdd('#bid_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="rbac.permission.grid.print"/>", 
             	   	   buttonicon:"ui-icon-print",
             	   	   id:"bid_report_id", 
             	   	   onClickButton: function(){ 
	         	   			var link = "Bid.reportGenerator.do?bidId="+$("#bid\\.prcmtTenderRequest\\.id").val();
	       					openDialogForm('bid_report_generator',link,'',600,400);
	       					$("#bid_report_id").addClass("ui-state-disabled");
	       					
	             	  		
// 							var link="ads/procurement/bid/bid_report.rptdesign";
// 							var parameters="p_tender_request_id="+rowData.id;
//             	   			openBirtViewer(link, parameters);
                	   },
             	   	   position:"last"
             	   	});
        });

        
        $(window).bind('resize', function() {
            var width = $('#jqGrid_bid_container').width();
            $('#bid_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }
        
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_bid_container">
				<table id="bid_grid" class="scroll"></table> 
				<div id="bid_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
