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
        function  editSubIndicator(link){
        	openDialogForm('subindicator_popup',link,'<s:text name="mer.label.popup.edit.subindicator.form"/>',800,500);
            };
            
        function perfEvaluate(subIndicId){
        	var link = "PerfEvaluation.page.do?subIndicId=" +subIndicId;
        	openDialogForm('perfevaluation_popup',link,'<s:text name="mer.label.popup.perf.evaluate.form"/>',800,600);
            };
            
        function  defineTarget(subIndicId,projectStart,projectEnd){
        	var link = "IndicatorTarget.page.do?subIndicId=" +subIndicId;
        	openDialogForm('indicator_target_popup',link,'<s:text name="mer.label.popup.perf.target.define.form"/>',800,600);
            };
            
        $(document).ready(function () {
        	$grid = jQuery("#perf_indicator_grid").jqGrid({
        	   	url:'MERGrid.indicator.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{strategy_id:$("#stratId").val(),indicatorType:"P"},
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
                overflow:'hidden',
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id', 
        	        	   	'',
        	        	   '<s:text name="mer.project.name"/>', 
        	        	   	'<s:text name="mer.project.nameEn"/>',
        	        	   	'<s:text name="mer.project.nameSr"/>',
        	        	   	'<s:text name="mer.execution.note"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},   	
        	   		{name:'name',index:'name', width:'100%', resizable:true},
        	   		{name:'name_en',index:'name_en', width:'100%'},
        	   		{name:'name_sr',index:'name_sr', width:'100%'},
        	   		{name:'note',index:'note', width:'100%'},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"left"},
        	   		{name:'created',index:'created', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#perf_indicator_grid_pager',
        		gridComplete: function(){
        			var ids = jQuery("#perf_indicator_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('MerIndicator','#perf_indicator_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#perf_indicator_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
 					var selrow = jQuery(this).jqGrid('getGridParam','selrow');
 		           if(selrow){
		 		         var rowData = jQuery(this).getRowData(selrow);
           				var link = "PerfIndicator.form.do?indicatorId=" + rowData.id;
       					loadURL(link, $("#perf_indicator_form_content"));
 		           }
 					
   				} ,
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"MERGrid.subIndicator.do?indicatorId="+jQuery("#perf_indicator_grid").getRowData(row_id).id,
    		          datatype: "json",
    	        	   	colNames:['Id', 
    	        	        	   '<s:text name="mer.project.name"/>', 
    	        	        	   	'<s:text name="mer.project.nameEn"/>',
    	        	        	   	'<s:text name="mer.project.nameSr"/>',
    	        	        		'<s:text name="order.item.uom"/>',
    	        	        		'<s:text name="mer.execution.note"/>',
    	        	        	   	'<s:text name="finance.payment.created.by"/>', 
    	        	        	   	'<s:text name="finance.payment.created.time"/>',
    	        	        		'<s:text name="label.button.edit"/>',
    	        	        		'<s:text name="label.button.evaluate"/>-<s:text name="mer.perfEvaluation.target"/>'
    	        	        	 ],
    		          colModel: [
    		            {name:'id',index:'id',hidden:true, width:'100%'},
	        	   		{name:'name',index:'name', width:'100%', resizable:true},
	        	   		{name:'name_en',index:'name_en', width:'100%'},
	        	   		{name:'name_sr',index:'name_sr', width:'100%'},
	        	   		{name:'uom',index:'uom', width:'100%'},
	        	   		{name:'note',index:'note', width:'100%'},
	        	   		{name:'created_by',index:'created_by', width:'100%', align:"left"},
	        	   		{name:'created',index:'created', width:'100%',align:"center"},
	        	   	    {name: 'edit', index: 'edit',sortable:false, align:"center",search:false, width:'100%'},
	        	   	 	{name: 'evaluate', index: 'evaluate',sortable:false, align:"center",search:false, width:'100%'}
    		          ],
    		       	  pager: '',
    		          height: '100%',
    		          width: 'auto',
    		          rowNum:8,
    	        	  rowList:[8,10,20,30],
    		      	  viewrecords: true,
    		          sortname: 'id',
    		          sortorder: "asc",
    		          onSelectRow: function(){
    		        	  jQuery("#perf_indicator_grid").resetSelection();
        		      },
	   		          gridComplete: function(){
	 	   		       		var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
	 		   				for(var i=0;i < ids.length;i++){
	 		   					var subindcId=jQuery("#"+subgrid_table_id).getRowData(ids[i]).id;
	 		   					var link = "SubIndicator.form.do?subindicatorId=" +subindcId;
	 		   					be = "<button class='btn btn-xs btn-default' data-original-title='<s:text name="label.button.edit"/>' onclick=\"editSubIndicator('"+link+"');\"><i class='fa fa-pencil'></i></button>";
	 		   					ev = "<button class='btn btn-xs btn-default' data-original-title='<s:text name="label.button.evaluate"/>' onclick=\"perfEvaluate('"+subindcId+"');\"><i class='fa fa-check-square-o'></i></button>";
								tg= "<button class='btn btn-xs btn-default' data-original-title='<s:text name="label.button.indicator.target"/>' onclick=\"defineTarget('"+subindcId+"');\"><i class='fa fa-th-large'></i></button>";
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{edit:be});
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{evaluate:ev+" "+tg});
	 		   				}
 	   					}
    		       });
    		   }        		

        	});

        	jQuery("#perf_indicator_grid").jqGrid('navGrid','#perf_indicator_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, cloneToTop: false},
        			{}, {},{},{multipleSearch:false, recreateFilter:false});
			
        	jQuery("#perf_indicator_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#perf_indicator_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	            				var rowData = jQuery(this).getRowData(iRow); 
	            				var link = "PerfIndicator.form.do?indicatorId=" + rowData.id;
	         					loadURL(link, $("#perf_indicator_form_content"));
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	}).navButtonAdd('#perf_indicator_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.add.subIndicator"/>',
             	   	   buttonicon:"ui-icon-plusthick", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	         					var rowData = jQuery(this).getRowData(iRow); 
	         					var link = "SubIndicator.form.do?indicId=" + rowData.id;
	         			   		openDialogForm('subindicator_popup',link,'<s:text name="mer.label.popup.add.subindicator.form"/>',800,500);
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		} 

             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_indic_container').width();
            $('#perf_indicator_grid').setGridWidth(width);
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
			<div id="jqGrid_indic_container">
				<table id="perf_indicator_grid" class="scroll"></table> 
				<div id="perf_indicator_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
