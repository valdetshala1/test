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
        	jQuery("#budget_mainntenance_grid").jqGrid({
        	   	url:'FinGrid.budgetMainntenance.do',	
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
        	        	   	'<s:text name="budget.maintenance.financial.type"/>',
							'<s:text name="budget.maintenance.financial.budget.code"/>',
							'<s:text name="budget.maintenance.financial.budget.year"/>',
							'<s:text name="budget.maintenance.financial.initial.budget"/>',
							'<s:text name="budget.maintenance.financial.annual.allocation"/>',
							'<s:text name="budget.maintenance.financial.current.expenditure"/>',
							'<s:text name="budget.maintenance.financial.commitment"/>',
							'<s:text name="budget.maintenance.financial.available.balance"/>',
							'<s:text name="budget.maintenance.financial.budget.utilization"/>',
							'<s:text name="budget.maintenance.financial.created.by"/>',
							'<s:text name="budget.maintenance.financial.created.time"/>'

						],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%',search:false},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'fin_type',index:'fin_type', width:'100%',search:false},
        	   		{name:'budget_code',index:'budget_code', width:'100%', align:"left",search:true},
        	   		{name:'budget_year',index:'budget_year', width:'100%', align:"left",search:true},
        	   		{name:'initial_annual_budget',index:'initial_annual_budget', width:'100%', align:"center",search:false},
        	   		{name:'annual_allocation',index:'annual_allocation', width:'100%', align:"center",search:false},
        	   		{name:'current_expenditure',index:'current_expenditure', width:'100%', align:"center",search:false},
        	   		{name:'commitment',index:'commitment', width:'100%',align:"center",search:false},
        	   		{name:'available_balance',index:'available_balance', width:'100%',align:"center",search:false},
        	   		{name:'buget_utilization_in_percent',index:'buget_utilization_in_percent', width:'100%',align:"center",search:false},
        	   		{name:'created_by',index:'created_by', width:'100%',search:false},
        	   		{name:'created_date',index:'created_date', width:'100%',align:"center",search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#budget_mainntenance_grid_pager',
        	   	sortname: 'b.id',
        	   	gridComplete: function(){
        			var ids = jQuery("#budget_mainntenance_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('BudgetMainntenance','#budget_mainntenance_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#budget_mainntenance_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "BudgetMainntenance.form.do?budgetMainntenanceId=" + rowData.id;
 					loadURL(link, $("#budget_mainntenance_form_content"));
   				}        		

        	});
        	
        	jQuery("#budget_mainntenance_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#budget_mainntenance_grid").jqGrid('navGrid','#budget_mainntenance_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#budget_mainntenance_grid").navButtonAdd('#budget_mainntenance_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "BudgetMainntenance.form.do?budgetMainntenanceId=" + rowData.id;
             					loadURL(link, $("#budget_mainntenance_form_content"));
             	   			}else{
             	   	   			alert('<s:text name="tender.request.alarm"/>');
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
             	   	
             	   .navButtonAdd('#budget_mainntenance_grid_pager',{
	             	   caption:"<s:text name='sub.menu.reports'/>",
	              	   title:"<s:text name='sub.menu.reports'/>", 
        		   	   buttonicon: "ui-icon-print",
        		   	   id:"print_button", 
        		   	   onClickButton: function(){ 
            		   	   $("#print_button").addClass("ui-state-disabled");
        			   		var link = "FinInput.reportPopup.do";
        			   		openDialogForm('budgetreport',link,'<s:text name="label.button.generate.report"/>',800,420);
        		   	   }, 
        		   	   position:"last"
        	   		});
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_budget_container').width();
            $('#budget_mainntenance_grid').setGridWidth(width);
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

			<div id="jqGrid_budget_container">
				<table id="budget_mainntenance_grid" class="scroll"></table> 
				<div id="budget_mainntenance_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
