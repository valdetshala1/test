<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	$grid = jQuery("#strategy_grid").jqGrid({
        	   	url:'MERGrid.strategyExecution.do',	
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
        	        	   'sub_project_id', 
        	        	   	'<s:text name="mer.strategy.merSubProject"/>',
        	        	   	'plan_period_id',
        	        	   	'<s:text name="mer.strategy.merPlanPeriod"/>',
        	        	   	'start_plan_period',
        	        	   	'end_plan_period',
        	        	   	'<s:text name="mer.strategy.results"/>',
        	        	   	'<s:text name="mer.strategy.pipCode"/>',
        	        	   	'<s:text name="mer.strategy.reviewTime"/>',
        	        	   	'<s:text name='finance.contractor.grid.cost'/>',
        	        	   	'<s:text name="mer.strategy.fullyFinanced"/>',
        	        	   	'<s:text name="mer.strategy.inNegotiations"/>',
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>'
            	        	
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'sub_project_id',index:'sub_project_id',hidden:true},
        	   		{name:'sub_project',index:'sub_project', width:'100%'},
        	   		{name:'plan_period_id',index:'plan_period_id', hidden:true},
        	   		{name:'plan_period',index:'plan_period', width:'100%'},
        	   		{name:'start_plan_period',index:'start_plan_period',hidden:true, width:'100%'},
        	   		{name:'end_plan_period',index:'end_plan_period',hidden:true, width:'100%'},
        	   		{name:'results',index:'results', width:'100%'},
        	   		{name:'pip_code',index:'pip_code'},
        	   		{name:'review_time',index:'review_time', width:'100%'},
        	   		{name:'cost',index:'cost', width:'100%',align:"center"},
        	   		{name:'fully_financed',index:'fully_financed', width:'100%',formatter:"checkbox",align:"center"},
        	   		{name:'in_negotiations_finance',index:'in_negotiations_finance',formatter:"checkbox",align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"center"},
        	   		{name:'created',index:'created',width:'100%', align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#strategy_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
   				}        		

        	});

        	jQuery("#strategy_grid").jqGrid('navGrid','#strategy_grid_pager',
                	{edit: false, add:false,search:false, del:false},
        			{}, {},{},{multipleSearch:false, recreateFilter:true});
			
        	jQuery("#strategy_grid").navButtonAdd('#strategy_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-gear", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
		             	   		var rowData = jQuery(this).getRowData(iRow); 
		             	  	 	var link = "Execution.board.do?stratId=" + rowData.id+"&&startPlanPeriod="+rowData.start_plan_period+"&&endPlanPeriod="+rowData.end_plan_period;
		 						loadURL(link, $("#strategy_content"));
             	   			}
             	   			else{
             	   			alert("<s:text name="global.please.select.row"/>"); 
                 	   			}
             	   			
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	})
             	   	.navButtonAdd('#strategy_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.report"/>',
             	   	   buttonicon:"ui-icon-print", 
             	   	   onClickButton: function(){ 
		             	  	 var link = "Execution.reportGenerator.do?";
		             	  	 openDialogForm('report_generator_content',link,"<s:text name="label.button.report.generator"/>",650,550);
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_strategy_container').width();
            $('#strategy_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }
        });
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_strategy_container">
				<table id="strategy_grid" class="scroll"></table> 
				<div id="strategy_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
