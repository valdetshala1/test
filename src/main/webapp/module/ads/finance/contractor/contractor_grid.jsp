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
        	jQuery("#contractor_grid").jqGrid({
        	   	url:'FinGrid.contractors.do',	
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
        	        	   	'<s:text name="finance.contractor.label.company.name"/>', 
        	        	   	'<s:text name="finance.contractor.label.fiscal.number"/>',
        	        	   	'<s:text name="finance.contractor.label.business.number"/>', 
        	        	   	'<s:text name="finance.contractor.label.address"/>',
        	        	   	'<s:text name="finance.contractor.label.contact.person"/>', 
        	        	   	'<s:text name="finance.contractor.label.contact.phone"/>', 
        	        	   	'<s:text name="finance.contractor.label.email"/>', 
        	        	   	'<s:text name="hum.employee.label.notes"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%',search:false},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'comopany_name',index:'comopany_name', width:'100%',search:true},
        	   		{name:'fiscal_number',index:'fiscal_number', width:'100%',search:false},
        	   		{name:'business_number',index:'business_number', width:'100%',search:false},
        	   		{name:'address',index:'address', width:'100%', align:"center",search:false},
        	   		{name:'contact_person',index:'contact_person', width:'100%', align:"center",search:false},
        	   		{name:'phone',index:'phone', width:'100%', align:"center",search:false},
        	   		{name:'e_mail',index:'e_mail', width:'100%',align:"left",search:false},
        	   		{name:'note',index:'note', width:'100%',align:"left",sortable:false,search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#contractor_grid_pager',
        	   	sortname: 'id',
        	   	gridComplete: function(){
        			var ids = jQuery("#contractor_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Contractor','#contractor_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#contractor_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selRow = jQuery(this).jqGrid('getGridParam','selrow');
     	   			if(selRow){
     					var rowData = jQuery(this).getRowData(selRow); 
     					var link = "Contractor.form.do?contractorId=" + rowData.id;
     					loadURL(link, $("#contractor_form_content"));
     	   			}else{
     	   				alert('<s:text name="tender.request.alarm"/>');
     	   	   		} 
   				},
   			 	subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id,pager_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       pager_id="p_"+subgrid_table_id;
    		       jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><br>');
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FinGrid.contract.do?contractorId="+jQuery(contractor_grid).getRowData(row_id).id,
    		          datatype: "json",
    		          colNames:['Id',
    							'<s:text name="finance.contract.name"/>',
    							'<s:text name="finance.contract.number"/>',
    							'<s:text name="fin.input.financial.organisation"/>', 
            	        	   	'<s:text name="adm.organisation.id"/>', 
    							'<s:text name="finance.contract.contractor"/>',
    							'<s:text name="finance.contract.cost"/>',
    							'<s:text name="finance.contract.approved.date"/>',
    							'<s:text name="finance.contract.date.due.for.start"/>',
    							'<s:text name="finance.contract.date.due.for.completion"/>',
    							'<s:text name="contract.notification.date"/>',
    							'<s:text name="contract.date.completed"/>',
    							'<s:text name="contract.delayed"/>',
    							'<s:text name="contract.notification.date"/>' 
    						],
            	   	colModel:[
            	   		{name:'id',index:'id',hidden:true, width:'100%'},
            	   		{name:'contract_name',index:'contract_name', width:'100%'},
            	   		{name:'contract_number',index:'contract_number', width:'100%'},
            	   		{name:'organisation',index:'organisation', width:'100%'},
            	   		{name:'organisation_id',index:'organisation_id', width:'100%',hidden:true},
            	   		{name:'contractors',index:'contractors', width:'100%', align:"center"},
            	   		{name: 'contract_costs',index: 'contract_costs', width:'100%', align: 'center'},
            	   		{name:'approved_date',index:'approved_date', width:'100%', align:"center"},
            	   		{name:'date_due_for_start',index:'date_due_for_start', width:'100%', align:"center"},
            	   		{name:'date_due_for_completion',index:'date_due_for_completion', width:'100%',align:"center"},
            	   		{name:'notification_date',index:'notification_date', width:'100%',align:"center"},
            	   		{name:'date_completed',index:'date_completed', width:'100%',align:"center"},
            	   		{name:'delayed',index:'delayed', width:'100%',align:"center",formatter:"checkbox"},
            	   		{name:'notify',index:'notify', width:'100%',align:"center",hidden:true}
            	   	],
    		       	  pager: pager_id,
    		          height: 'auto',
    		          width: 'auto',
    		          rowNum:10,
   		    	   	  rowList:[10,20,30],
    		      	  viewrecords: true,
    		          sortname: 'c.id',
    		          sortorder: "asc",
	 	   		      gridComplete: function(){
		 	   		  },
		 	   		  onSelectRow: function(){
						jQuery("#contractor_grid").resetSelection();
	 	   			  }
    		       });
    		   }        		

        	});

        	jQuery("#contractor_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#contractor_grid").jqGrid('navGrid','#contractor_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:true},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#contractor_grid").navButtonAdd('#contractor_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "Contractor.form.do?contractorId=" + rowData.id;
             					loadURL(link, $("#contractor_form_content"));
             	   			}else{
             	   			alert('<s:text name="tender.request.alarm"/>');
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_contractor_container').width();
            $('#contractor_grid').setGridWidth(width);
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

			<div id="jqGrid_contractor_container">
				<table id="contractor_grid" class="scroll"></table> 
				<div id="contractor_grid_pager" class="scroll" style="text-align:center;"></div>
				<div id="contracts_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
