<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	$grid = jQuery("#perf_eval_grid").jqGrid({
        	   	url:'MERGrid.perfEvaluation.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{subindicator_id:$("#subIndicId").val()},
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
        	   	    		'<s:text name="mer.execution.date"/>',
        	        	    '<s:text name="mer.perfEvaluation.target"/>', 
        	        	   	'<s:text name="mer.perfEvaluation.actual"/>',
        	        	   	'<s:text name="mer.execution.note"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'eval_date',index:'eval_date', width:'200%'},
        	   		{name:'target',index:'target',hidden:true, width:'200%',align:"center"},
        	   		{name:'actual',index:'actual', width:'200%', align:"center"},
        	   		{name:'note',index:'note', width:'50%', align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"left"},
        	   		{name:'created_date',index:'created_date', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#perf_eval_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "PerfEvaluation.form.do?perfEvaluationId=" + rowData.id;
 					loadURL(link, $("#perf_eval_form_content"));
   				}        		

        	});

        	jQuery("#perf_eval_grid").jqGrid('navGrid','#perf_eval_grid_pager',
                	{edit: false, add:false, del:false, search:false,refresh:true, view:false, cloneToTop: true},
        			{}, {},{},{multipleSearch:false, recreateFilter:true});
			
        	jQuery("#perf_eval_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#perf_eval_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	         					var rowData = jQuery(this).getRowData(iRow); 
	         					var link = "PerfEvaluation.form.do?perfEvaluationId=" + rowData.id;
	         					loadURL(link, $("#perf_eval_form_content"));
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}  
                 	   	   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_perf_eval_container').width();
            $('#perf_eval_grid').setGridWidth(width);
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

			<div id="jqGrid_perf_eval_container">
				<table id="perf_eval_grid" class="scroll"></table> 
				<div id="perf_eval_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
