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
        	$grid = jQuery("#planperiod_grid").jqGrid({
        	   	url:'DhpetGrid.planPeriod.do',	
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
        	        	   '<s:text name="dhpet.location.menu"/>', 
        	        	   '<s:text name="mer.planperiod.start.year"/>', 
        	        	   	'<s:text name="mer.planperiod.endYear"/>',
        	        	   	'<s:text name="hum.employee.label.notes"/>',
        	        	   	'<s:text name="doc.name"/>',
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>',
        	        	   	
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'location',index:'location', width:'100%',align:'center'},
        	   		{name:'start_year',index:'start_year', width:'100%',align:'center'},
        	   		{name:'end_year',index:'end_year', width:'100%', align:'center'},
        	   		{name:'remark',index:'remark', width:'100%', align:"center"},
        	   		{name:"doc_name",index:"doc_name",width:'100%',align:'left',
       	        	 	formatter: function (cellvalue, options, rowObject) {
       	        		 	return '<a href="DhpetPlanPeriodDoc.do?docId=' + rowObject.id + '" target="_blank"><span style="color:blue"><u>' + cellvalue +  '</u></span></a>';
       	             	}              
       	         	},
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created_date',index:'created_date',width:'100%', align:"center"},
        	   		
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#planperiod_grid_pager',
        	  	gridComplete: function(){
        			var ids = jQuery("#planperiod_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DhpetPeriodPlan','#planperiod_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#planperiod_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "DhpetPlanPeriod.form.do?periodId=" + rowData.id;
 					loadURL(link, $("#planperiod_form_content"));
   				}        		

        	});

        	jQuery("#planperiod_grid").jqGrid('navGrid','#planperiod_grid_pager',
                	{edit: false, add:false, del:false,search:false, refresh:true},
        			{}, {},{},{multipleSearch:false, recreateFilter:true});
			
        	jQuery("#planperiod_grid").navButtonAdd('#planperiod_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
		             	   		var rowData = jQuery(this).getRowData(iRow); 
		        				var link = "DhpetPlanPeriod.form.do?periodId=" + rowData.id;
		     					loadURL(link, $("#planperiod_form_content"));
             	   			}
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	})
             	   	.navButtonAdd('#planperiod_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="tender.request.annual.plan"/>',
             	   	   buttonicon:"ui-icon-wrench", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
		             	   		var rowData = jQuery(this).getRowData(iRow); 
		        				var link = "DhpetAnnualPlan.page.do?periodId=" + rowData.id;
		        				openDialogForm('annualplan_page_content',link,"<s:text name="tender.request.annual.plan"/>",900	,800);
             	   			}
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_planperiod_container').width();
            $('#planperiod_grid').setGridWidth(width);
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

			<div id="jqGrid_planperiod_container">
				<table id="planperiod_grid" class="scroll"></table> 
				<div id="planperiod_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
