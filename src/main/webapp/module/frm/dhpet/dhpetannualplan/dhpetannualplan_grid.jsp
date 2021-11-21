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
        	$grid = jQuery("#annualplan_grid").jqGrid({
        	   	url:'DhpetGrid.annualplan.do?',	
        	   	postData: {periodId:'<s:property value="periodId"/>'},
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
        	        	    '<s:text name="tender.request.annual.plan"/>', 
        	        	   	'<s:text name="annual.plan.year"/>',
        	        	   	'<s:text name="hum.employee.label.notes"/>',
        	        	   	'<s:text name="doc.name"/>',
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>',
        	        	   	
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'period_plan',index:'period_plan', width:'100%',align:'center'},
        	   		{name:'year',index:'year', width:'100%', align:'center'},
        	   		{name:'remark',index:'remark', width:'100%', align:"center"},
        	   		{name:"doc_name",index:"doc_name",width:'100%',align:'left',
       	        	 	formatter: function (cellvalue, options, rowObject) {
       	        		 	return '<a href="DhpetAnnualPlanDoc.do?docId=' + rowObject.id + '" target="_blank"><span style="color:blue"><u>' + cellvalue +  '</u></span></a>';
       	             	}              
       	         	},
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created_date',index:'created_date',width:'100%', align:"center"},
        	   		
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#annualplan_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "DhpetAnnualPlan.form.do?annualplanId=" + rowData.id;
 					loadURL(link, $("#annualplan_form_content"));
   				}        		

        	});

        	jQuery("#annualplan_grid").jqGrid('navGrid','#annualplan_grid_pager',
                	{edit: false, add:false, del:false,search:false, refresh:true},
        			{}, {},{},{multipleSearch:false, recreateFilter:true});
			
        	jQuery("#annualplan_grid").navButtonAdd('#annualplan_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
		             	   		var rowData = jQuery(this).getRowData(iRow); 
		        				var link = "DhpetAnnualPlan.form.do?annualplanId=" + rowData.id;
		     					loadURL(link, $("#annualplan_form_content"));
             	   			}
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_annualplan_container').width();
            $('#annualplan_grid').setGridWidth(width);
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

			<div id="jqGrid_annualplan_container">
				<table id="annualplan_grid" class="scroll"></table> 
				<div id="annualplan_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
