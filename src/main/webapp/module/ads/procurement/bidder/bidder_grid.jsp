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
        	jQuery("#bidder_grid").jqGrid({
        	   	url:'ProGrid.bidders.do?',	
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
        	        	   	'<s:text name="bidder.company.name"/>',
        	        	   	 '<s:text name="bidder.fiscal.number"/>', 
        	        	   	 '<s:text name="bidder.address"/>', 
        	        	   	 '<s:text name="bidder.contact.person"/>',
        	        	   	 '<s:text name="bidder.contact.phone"/>',
        	        	   	 '<s:text name="bidder.email"/>',
        	        	   	 '<s:text name="bidder.contractor"/>',
        	        	   	 '<s:text name="bidder.comments"/>',
        	        	   	 '<s:text name="bid.grid.created.by"/>',
        	        	   	 '<s:text name="bid.grid.created.date"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'comopanyName',index:'comopanyName', width:'100%'},
        	   		{name:'fiscalNumber',index:'fiscalNumber', width:'100%'},
        	   		{name:'address',index:'address', width:'100%', align:"center"},
        	   		{name:'contactPerson',index:'contactPerson', width:'100%', align:"center"},
        	   		{name:'contactPhone',index:'contactPhone', width:'100%', align:"center"},
        	   		{name:'EMail',index:'EMail', width:'100%', align:"center"},
        	   		{name:'contractor',index:'contractor', hidden:true,width:'100%', align:"center"},
        	   		{name:'comments',index:'comments', width:'100%', align:"center"},
        	   		{name:'createdBy',index:'party', width:'100%', align:"center"},
        	   		{name:'createdDate',index:'createdDate', width:'100%',align:"center"}
        	   	],
        	   	rowNum:8,
        	   	rowList:[8,10,20,30],
        	   	pager: '#bidder_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#bidder_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('PrcmtTenderBidder','#bidder_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#bidder_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'Loading, please wait',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Bidder.form.do?bidderId=" + rowData.id;
 					loadURL(link, $("#bidder_form_content"));
   				}        		

        	});
            	
        	jQuery("#bidder_grid").jqGrid('navGrid','#bidder_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#bidder_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#bidder_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="label.button.edit"/>", 
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "Bidder.form.do?bidderId=" + rowData.id;
             					loadURL(link, $("#bidder_form_content"));
             	   			}else{
             	   	   			alert('<s:text name="tender.request.alarm"/>');
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	});
        });

        
        $(window).bind('resize', function() {
            var width = $('#jqGrid_bidder_container').width();
            $('#bidder_grid').setGridWidth(width);
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
			<div id="jqGrid_bidder_container">
				<table id="bidder_grid" class="scroll"></table> 
				<div id="bidder_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
