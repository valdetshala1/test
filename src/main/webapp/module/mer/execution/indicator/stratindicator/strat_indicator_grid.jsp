<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        function editStratEvaluation(link){
        	openDialogForm('strat_evaluation_form_content',link,"<s:text name="mer.strategy.evaluation"/>",650,500);
        }
        
        $(document).ready(function () {
        	$grid = jQuery("#strat_indicator_grid").jqGrid({
        	   	url:'MERGrid.indicator.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{strategy_id:$("#stratId").val(),indicatorType:"S"},
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
        	        	   '<s:text name="mer.project.name"/>', 
        	        	   	'<s:text name="mer.project.nameEn"/>',
        	        	   	'<s:text name="mer.project.nameSr"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},   	
        	   		{name:'name',index:'name', width:'100%', resizable:true},
        	   		{name:'name_en',index:'name_en', width:'100%'},
        	   		{name:'name_sr',index:'name_sr', width:'100%'},
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created',index:'created', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#strat_indicator_grid_pager',
        		gridComplete: function(){
        			var ids = jQuery("#strat_indicator_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('MerIndicator','#strat_indicator_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#strat_indicator_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
        			var selrow=$(this).jqGrid('getGridParam','selrow');
  		           if(selrow){
	    				var rowData = jQuery(this).getRowData(selrow); 
	    				var link = "StratIndicator.form.do?indicatorId=" + rowData.id;
	 					loadURL(link, $("#strat_indicator_form_content"));
  		           }
   				},
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"MERGrid.stratEvaluation.do?indicator_id="+jQuery("#strat_indicator_grid").getRowData(row_id).id,
    		          datatype: "json",
    		          colNames: ['Id','Indicator_id',
    		    		          '<s:text name="mer.stratEval.evalDate"/>',
    		    		          '<s:text name="mer.stratEval.programResults"/>',
    		     		          '<s:text name="hum.employee.label.notes"/>',
    		     		          
    		    		          '<s:text name="bid.grid.created.date"/>',
    		    		          '<s:text name="bid.grid.created.by"/>',
    		    		          '<s:text name="label.button.edit"/>'],
    		          colModel: [
    		            {name:"id",index:"id",width:'100%',hidden:true},
    		            {name:"inidcator_id", index:"inidcator_id", hidden:true},
    		            {name:"eval_date",index:"eval_date",width:'100%',align:'left'},
   		             	{name:"program_results",index:"program_results",width:'100%',align:"center"},
   		             	{name:"note",index:"note",width:'100%',align:"center"},
    		            {name:"created_date",index:"created_date",width:'100%',align:"center"},
    		            {name:"created_by",index:"created_by",width:'100%',align:"center"},
    		            {name:"edit",index:"edit",width:'100%',align:"center"}
    		          ],
    		       	  pager: '',
    		          height: 'auto',
    		          width: 'auto',
    		      	  viewrecords: true,
    		          sortname: 'id',
    		          sortorder: "asc",
 	   		       		gridComplete: function(){
	 	   		            var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
	 	   		           	for(var i=0;i < ids.length;i++){
		 	   		            var seId=jQuery("#"+subgrid_table_id).getRowData(ids[i]).id;
		 	   		            var indicatorId=jQuery("#"+subgrid_table_id).getRowData(ids[i]).inidcator_id;
		 	   		            var link = "StratEvaluation.form.do?stratEvalId=" +seId;
		 	   		        	$("#stratIndicatorId").val(indicatorId);
		 	   		            be = "<button class='btn btn-xs btn-default' data-original-title='<s:text name="label.button.edit"/>' onclick=\"editStratEvaluation('"+link+"');\"><i class='fa fa-pencil'></i></button>";
		 	   		            jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{edit:be});
	 	   		           }
 	   					},
	 	   				onSelectRow: function(ids) {
	 	   					jQuery("#strat_indicator_grid").resetSelection();
	 	   				}
    		       });
    		   }        		

        	});

        	jQuery("#strat_indicator_grid").jqGrid('navGrid','#strat_indicator_grid_pager',
                	{edit: false, add:false, del:false,serarch:false, refresh:true, cloneToTop: false},
        			{}, {},{},{multipleSearch:false, recreateFilter:false});
			
        	jQuery("#strat_indicator_grid")
                	.navButtonAdd('#strat_indicator_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	         					var rowData = jQuery(this).getRowData(iRow); 
	         					var link = "StratIndicator.form.do?indicatorId=" + rowData.id;
	         					loadURL(link, $("#strat_indicator_form_content"));
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	})
             	   	.navButtonAdd('#strat_indicator_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.evaluation"/>',
             	   	   buttonicon:"ui-icon-extlink", 
             	   	   onClickButton: function(){
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	         					var rowData = jQuery(this).getRowData(iRow);
	         					$("#stratIndicatorId").val(rowData.id); 
	         					var link = "StratEvaluation.form.do?";
	         					openDialogForm('strat_evaluation_form_content',link,"<s:text name="mer.strategy.evaluation"/>",650,500);
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_strat_indic_container').width();
            $('#strat_indicator_grid').setGridWidth(width);
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
			<div id="jqGrid_strat_indic_container">
				<table id="strat_indicator_grid" class="scroll"></table> 
				<div id="strat_indicator_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
		<input type="hidden" id="stratIndicatorId" name="stratIndicatorId" value='<s:property value="stratIndicatorId"/>'>
 </body>   
			
</html>	
