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

        function displayDocumentIcons(cellvalue, options,rowData, rowObject){
        	var icon = "";
        	var doc_type=rowData.doc_type.replace('.', '');
        	icon='<img src="img/filetypes/32px/' + doc_type + '.png"/>';  
            return icon;
        }
        
        $(document).ready(function () {
        	$grid = jQuery("#strategy_grid").jqGrid({
        	   	url:'MERGrid.strategy.do',	
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
        	        	   'sub_project_id', 
        	        	   	'<s:text name="mer.strategy.merSubProject"/>',
        	        	   	'plan_period_id',
        	        	   	'<s:text name="mer.strategy.merPlanPeriod"/>',
        	        	   	'<s:text name="mer.strategy.results"/>',
        	        	   	'<s:text name="mer.planperiod.start.year"/>',
        	        	   	'<s:text name="mer.planperiod.endYear"/>',
        	        	   	'<s:text name="mer.strategy.pipCode"/>',
        	        	   	'<s:text name="mer.strategy.reviewTime"/>',
        	        	   	'<s:text name="finance.contractor.grid.cost"/>',
        	        	   	'<s:text name="mer.strategy.fullyFinanced"/>',
        	        	   	'<s:text name="mer.strategy.inNegotiations"/>',
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>'
            	        	
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},  
        	   		{name:'sub_project_id',index:'sub_project_id',hidden:true},
        	   		{name:'sub_project',index:'sub_project', width:'100%'},
        	   		{name:'plan_period_id',index:'plan_period_id', hidden:true, align:'center'},
        	   		{name:'plan_period',index:'plan_period', width:'100%', align:'center'},
        	   		{name:'results',index:'results', width:'100%'},
        	   		{name:'start_year',index:'start_year', width:'100%', align:'center'},
        	   		{name:'end_year',index:'end_year', width:'100%', align:'center'},
        	   		{name:'pip_code',index:'pip_code', align:'center'},
        	   		{name:'review_time',index:'review_time', width:'100%'},
        	   		{name:'cost',index:'cost', width:'100%',align:"center"},
        	   		{name:'fully_financed',index:'fully_financed', width:'100%',formatter:"checkbox",align:"center"},
        	   		{name:'in_negotiations_finance',index:'in_negotiations_finance',formatter:"checkbox",align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created',index:'created',width:'100%', align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#strategy_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#strategy_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Person','#strategy_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#strategy_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selrow = jQuery(this).jqGrid('getGridParam','selrow');
       				if(selrow){
    					var rowData = jQuery(this).getRowData(selrow);
    					var link = "MerStrategy.board.do?strategyId=" + rowData.id;
     					loadURL(link, $("#strategy_board_content"));	
       				}
   				},
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"MERGrid.strategyDoc.do?strategy_id="+jQuery("#strategy_grid").getRowData(row_id).id,
    		          datatype: "json",
    		          colNames: ['Id','',
    		    		          '<s:text name="doc.name"/>',
    		    		          '<s:text name="doc.type"/>',
    		     		          '<s:text name="doc.size"/>',
    		    		          '<s:text name="bid.grid.created.date"/>',
    		    		          '<s:text name="bid.grid.created.by"/>'],
    		          colModel: [
    		            {name:"id",index:"id",width:'100%',hidden:true},
    		            { name: "icon", index:"icon", width:'50%', align:"center",
    		                formatter: displayDocumentIcons 
    		            },
    		            {name:"doc_name",index:"doc_name",width:'300%',align:'left',
	    		           	 formatter: function (cellvalue, options, rowObject) {
	    		        		 return '<a href="StrategyDocGenerator.do?docId=' + rowObject.id + '" target="_blank"><span style="color:blue"><u>' + cellvalue +  '</u></span></a>';
	    		             }
   		             	},
   		             	{name:"doc_type",index:"doc_type",width:'100%',align:"center"},
   		             	{name:"doc_size",index:"doc_size",width:'100%',align:"center"},
    		            {name:"created_date",index:"created_date",width:'100%',align:"center"},
    		            {name:"created_by",index:"created_by",width:'100%',align:"center"},
    		          ],
    		       	  pager: '',
    		          height: 'auto',
    		          width: 'auto',
    		      	  viewrecords: true,
    		          sortname: 'id',
    		          sortorder: "asc",
 	   		       		gridComplete: function(){
 	   					},
	 	   				onSelectRow: function(ids) {
	 	   					jQuery("#strategy_grid").resetSelection();
	 	   				}
    		       });
    		   }

        	});

        	jQuery("#strategy_grid").jqGrid('navGrid','#strategy_grid_pager',
                	{edit: false, add:false, search:false,del:false},
        			{}, {},{},{multipleSearch:true, recreateFilter:true});
			
        	jQuery("#strategy_grid").navButtonAdd('#strategy_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
		             	   		var rowData = jQuery(this).getRowData(iRow); 
			             	   	var link = "MerStrategy.board.do?strategyId=" + rowData.id;
			 					loadURL(link, $("#strategy_board_content"));
             	   			}
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        	jQuery("#strategy_grid").navButtonAdd('#strategy_grid_pager',{
      	   	   caption:"", 
      	   	   title:'<s:text name="label.button.generate.report"/>',
      	   	   buttonicon:"ui-icon-print", 
      	   	   onClickButton: function(){ 
             	   	var link = "MerStrategy.reportGenerator.do?";
             	   	openDialogForm('report_generator_content',link,"<s:text name="label.button.report.generator"/>",600,320);
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
