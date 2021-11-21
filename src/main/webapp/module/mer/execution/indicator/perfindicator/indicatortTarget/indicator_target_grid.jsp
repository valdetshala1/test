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
        	$grid = jQuery("#indicator_target_grid").jqGrid({
        	   	url:'MERGrid.indicatorTarget.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{sub_indicator_id:$("#subIndicId").val()},
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
        	   	    		'<s:text name="annu.felling.label.year"/>',
        	        	    '<s:text name="mer.perfEvaluation.target"/>', 
        	        	   	'<s:text name="mer.execution.note"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'year',index:'year', width:'50%'},
        	   		{name:'target',index:'target', width:'100%',align:"center"},
        	   		{name:'note',index:'note', width:'200%', align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"left"},
        	   		{name:'created_date',index:'created_date', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#indicator_target_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
 					var link = "IndicatorTarget.form.do?indicatorTargetId=" + rowData.id;
 					loadURL(link, $("#indicator_target_form_content"));
   				}        		

        	});

        	jQuery("#indicator_target_grid").jqGrid('navGrid','#indicator_target_grid_pager',
                	{edit: false, add:false, del:false, search:false,refresh:true, view:false, cloneToTop: true},
        			{}, {},{},{multipleSearch:false, recreateFilter:true});
			
        	jQuery("#indicator_target_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#indicator_target_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	         					var rowData = jQuery(this).getRowData(iRow); 
	         					var link = "IndicatorTarget.form.do?indicatorTargetId=" + rowData.id;
	         					loadURL(link, $("#indicator_target_form_content"));
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}  
                 	   	   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_indic_target_container').width();
            $('#indicator_target_grid').setGridWidth(width);
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
			<div id="jqGrid_indic_target_container">
				<table id="indicator_target_grid" class="scroll"></table> 
				<div id="indicator_target_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
