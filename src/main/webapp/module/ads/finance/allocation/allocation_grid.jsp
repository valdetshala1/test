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
        	jQuery("#allocation_grid").jqGrid({
        	   	url:'FinGrid.allocation.do',	
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
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
        	        	   	'',
        	        	   	'<s:text name="output.salary.label.department"/>',
        	        	   	'<s:text name="annu.felling.label.municipality"/>', 
        	        	   	'<s:text name="fin.allocation.label.annual.sales"/>', 
        	        	   	'<s:text name="fin.allocation.label.other.income"/>',
        	        	   	'<s:text name="annu.mgmt.unit.grid.total"/>',
        	        	   	'<s:text name="fin.allocation.label.allocation.36"/>', 
        	        	   	'<s:text name="fin.allocation.label.municipality.30.portion"/>',
        	   	       		'<s:text name="fin.allocation.label.kfa.remainder"/>',
        	   	       		'<s:text name="report.wood.production.label.month"/>',
        	   	       		'<s:text name="report.wood.production.label.year"/>',
        	   	       		'<s:text name="report.thinning.grid.label.created.time"/>', 
        	   	       		'<s:text name="report.thinning.grid.label.created.by"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%',search:false},
        	   		{name:'act',index:'act', width:'110%',search:false},
        	   		{name:'department',index:'department', width:'100%',search:false},
        	   		{name:'municipality',index:'municipality', width:'100%',search:false},
        	   		{name:'wood_sales',index:'wood_sales', width:'100%', align:"center",search:false},
        	   		{name:'other_income',index:'other_income', width:'100%', align:"center",search:false},
        	   		{name:'total',index:'total', width:'100%', align:"center",search:false},
        	   		{name:'allocation_36',index:'allocation_36', width:'100%', align:"center",search:false},
        	   		{name:'municipality_30_portion',index:'municipality_30_portion', width:'100%', align:"center",search:false},
        	   		{name:'kfa_remainder',index:'kfa_remainder', width:'100%', align:"center",search:false},
        	   		{name:'month',index:'month', width:'100%',search:false},
        	   		{name:'year',index:'year', width:'100%', align:"center",search:false},
        	   		{name:'created_time',index:'created_time', width:'100%', align:"center",search:false},
        	   		{name:'created_by',index:'created_by', width:'100%',search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#allocation_grid_pager',
        	   	sortname: 'a.id',
        	   	gridComplete: function(){
        			var ids = jQuery("#allocation_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Allocation','#allocation_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#allocation_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "BudgetAllocation.form.do?annuBudgetAllocationId=" + rowData.id;
    				loadURL(link, $("#allocation_form_content"));
   				}        		

        	});

        	jQuery("#allocation_grid").jqGrid('navGrid','#allocation_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#allocation_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#allocation_grid_pager',{
        	   	   caption:"", 
        	   	   title:'<s:text name="label.button.edit"/>',
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "BudgetAllocation.form.do?annuBudgetAllocationId=" + rowData.id;
        					loadURL(link, $("#allocation_form_content"));
        	   			}else{
        	   	   			alert('<s:text name="tender.request.alarm"/>');
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	})
        	   	.navButtonAdd('#allocation_grid_pager',{
        	   	caption:"<s:text name='sub.menu.reports'/>",
          	   	title:"<s:text name='sub.menu.reports'/>", 
		   	   buttonicon: "ui-icon-print",
		   	   id:"print_button", 
		   	   onClickButton: function(){
			   	    $("#print_button").addClass("ui-state-disabled");
			   		var link = "BudgetAllocation.reportPopup.do?";
			   		openDialogForm('allocation_report_content',link,'<s:text name="label.button.generate.report"/>',800,420);
		   		
		   	   }, 
		   	   position:"last"
	   	});
     		

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_allocation_container').width();
            $('#allocation_grid').setGridWidth(width);
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
		<input id="financialOutput.outputType" name="financialOutput.outputType" value="<s:property value='allocation'/>" type="hidden">
			<div id="jqGrid_allocation_container">
<%-- 			<input id="vehicleId" class="vehicleId" value="<s:property value='logVehicles.id'/>" type="hidden"> --%>
				<table id="allocation_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="allocation_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
