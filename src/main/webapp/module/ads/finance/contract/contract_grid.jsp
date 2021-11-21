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

        var width ;
        $(document).ready(function () {

        	jQuery("#contract_grid").jqGrid({
        	   	url:'FinGrid.contract.do',	
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
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
        	        	   	'Act',
							'<s:text name="finance.contract.name"/>',
							'<s:text name="finance.contract.number"/>',
							'<s:text name="fin.input.financial.organisation"/>', 
        	        	   	'<s:text name="adm.organisation.id"/>', 
							'<s:text name="finance.contract.contractor"/>',
							'<s:text name="finance.contract.cost"/>',
							'<s:text name="finance.payment.balance"/>',
							'<s:text name="finance.contract.approved.date"/>',
							'<s:text name="finance.contract.date.due.for.start"/>',
							'<s:text name="finance.contract.date.due.for.completion"/>',
							'<s:text name="contract.notification.date"/>',
							'<s:text name="contract.date.completed"/>',
							'<s:text name="contract.delayed"/>',
							'<s:text name="contract.notification.date"/>' 
						],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%',search:false},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'contract_name',index:'contract_name', width:'100%',search:true},
        	   		{name:'contract_number',index:'contract_number', width:'100%',search:false},
        	   		{name:'organisation',index:'organisation', width:'100%',search:false},
        	   		{name:'organisation_id',index:'organisation_id', width:'100%',hidden:true,search:false},
        	   		{name:'contractors',index:'contractors', width:'100%', align:"center",search:false},
        	   		{name: 'contract_costs',index: 'contract_costs', width:'100%', align: 'center',search:false},
        	   		{name:'balance',index:'balance', width:'100%',align:"center",sortable:false,search:false},
        	   		{name:'approved_date',index:'approved_date', width:'100%', align:"center",search:false},
        	   		{name:'date_due_for_start',index:'date_due_for_start', width:'100%', align:"center",search:false},
        	   		{name:'date_due_for_completion',index:'date_due_for_completion', width:'100%',align:"center",search:false},
        	   		{name:'notification_date',index:'notification_date', width:'100%',align:"center",search:false},
        	   		{name:'date_completed',index:'date_completed', width:'100%',align:"center",search:false},
        	   		{name:'delayed',index:'delayed', width:'100%',align:"center",formatter:"checkbox",search:false},
        	   		{name:'notify',index:'notify', width:'100%',align:"center",hidden:true,search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#contract_grid_pager',
        	   	sortname: 'c.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selRow = jQuery(this).jqGrid('getGridParam','selrow');
     	   			if(selRow){
     					var rowData = jQuery(this).getRowData(selRow); 
     					var link = "Contract.tab.do?contractId=" + rowData.id;
     					loadURL(link, $("#contract_tab_content"));
     	   			}else{
     	   	   			alert('<s:text name="tender.request.alarm"/>');
     	   	   		} 
   				},
   				gridComplete: function() {
   				    var rows = $(this).getDataIDs(); 
   				    for (var i = 0; i < rows.length; i++){
   				 	var cl = rows[i];
   				 	au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Contract','#contract_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
					jQuery("#contract_grid").jqGrid('setRowData',rows[i],{act:au});
   				        var delay = $(this).getCell(rows[i],"delayed");
   				     	var completedDate = $(this).getCell(rows[i],"date_completed");
   				        if(delay == "Yes" && completedDate=='') {
   				            $(this).jqGrid('setRowData',rows[i],false, {background:'red'});            
   				        }else{
   				         	var notify=$(this).getCell(rows[i],"notify");
    	   				    if(notify=="true"){
    	   				  		$(this).jqGrid('setRowData',rows[i],false, {background:'yellow'}); 
    	   	   				}
   	   				   	}
   				    }
   				},
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id,pager_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       pager_id="p_"+subgrid_table_id;
    		       jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><br>');
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FinGrid.contractDocuments.do?contract_id="+jQuery("#contract_grid").getRowData(row_id).id,
    		          datatype: "json",
    		          colNames: ['Id','ContractId','<s:text name="doc.name"/>',
    		    		          '<s:text name="finance.payment.created.by"/>',
    		    		          '<s:text name="finance.payment.created.by"/>',
    		    		          '<s:text name="tender.request.attachment"/>'],
    		          colModel: [
    		            {name:"id",index:"id",width:'100%',hidden:true},
    		            {name:"contract_id",index:"contract_id",width:'100%',hidden:true},
    		            {name:"doc_name",index:"doc_name",width:'300%',align:"left"},
    		            {name:"created_by",index:"created_by",width:'150%',align:"center"},           
    		            {name:"created_date",index:"created_date",width:'100%',align:"center"},
    		            {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'}
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
 	   		       		gridComplete: function(){
	 	   		       		var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
	 		   				for(var i=0;i < ids.length;i++){
	 		   					var url="GenerateContractDoc.do?docId="+jQuery("#"+subgrid_table_id).jqGrid().getRowData(ids[i]).id;
	 		   					be = "<button class='btn btn-xs btn-default' data-original-title='Status' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
	 		   				}
 	   					},
 	   					onSelectRow: function(){
							jQuery("#contract_grid").resetSelection();
 	 	   				}
    		       });
    		   }        		

        	});
        	jQuery("#contract_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#contract_grid").jqGrid('navGrid','#contract_grid_pager',
        			{edit: false, add:false, del:false, refresh:true, view:false, search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#contract_grid").navButtonAdd('#contract_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>', 
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "Contract.tab.do?contractId=" + rowData.id;
             					loadURL(link, $("#contract_tab_content"));
             	   			}else{
             	   	   			alert('<s:text name="tender.request.alarm"/>');
             	   	   		}  
             	   	   }, 
             	   	   position:"last"
             	   	})
             	   	.navButtonAdd('#contract_grid_pager',{
              	   	   caption:"Reports",
              	   	   title:"Report",  
              	   	   buttonicon:"ui-icon-print",
              	   	   id:"print_button", 
              	   	   onClickButton: function(){
                  	   	  $("#print_button").addClass("ui-state-disabled");
              	   	      var link="Contract.reportGenerator.do";
              	   	      openDialogForm("report_generator_content",link,"<s:text name="label.button.generate.report"/>",600,550);
              	   	   }, 
              	   	   position:"last"
              	   	});

        });

        $(window).bind('resize', function() {
             width = $('#jqGrid_contract_container').width();
            $('#contract_grid').setGridWidth(width);
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

			<div id="jqGrid_contract_container">
				<table id="contract_grid" class="scroll"></table> 
				<div id="contract_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
