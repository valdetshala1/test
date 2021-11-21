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
        	$grid = jQuery("#donor_grid").jqGrid({
        	   	url:'MERGrid.financeDonor.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{ strategy_id : $("#stratId").val() },
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
        	        	   'strategy_id', 
        	        	   '<s:text name="mer.strategy.merSubProject"/>',
        	        	   'donor_id',
        	        	   	'<s:text name="mer.fin.donor.donor"/>',
        	        	   	'<s:text name="mer.fin.donor.donationYear"/>',
        	        	   	'<s:text name="mer.fin.donor.amount"/>',
        	        	   	'<s:text name="hum.employee.label.notes"/>',
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>'
            	        	
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'strategy_id',index:'strategy_id',hidden:true},
        	   		{name:'strategy',index:'strategy',width:'100%'},
        	   		{name:'donor_id',index:'donor_id', hidden:true},
        	   		{name:'donor',index:'donor',width:'100%'},
        	   		{name:'donation_year',index:'donation_year', width:'100%',align:"center"},
        	   		{name:'amount',index:'amount', width:'100%',align:"center"},
        	   		{name:'note',index:'note', width:'100%'},
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created_date',index:'created_date',width:'100%', align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#donor_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#donor_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('MerFinanceDonor','#donor_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#donor_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "FinDonor.form.do?donorId=" + rowData.id;
 					loadURL(link, $("#donor_form_content"));
   				}        		

        	});

        	jQuery("#donor_grid").jqGrid('navGrid','#donor_grid_pager',
                	{edit: false, add:false, search:false,del:false},
        			{}, {},{},{multipleSearch:false, recreateFilter:true});
			
        	jQuery("#donor_grid").navButtonAdd('#donor_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
		             	   		var rowData = jQuery(this).getRowData(iRow); 
			             	   	var link = "FinDonor.form.do?donorId=" + rowData.id;
			 					loadURL(link, $("#donor_form_content"));
             	   			}
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_donor_container').width();
            $('#donor_grid').setGridWidth(width);
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
			<div id="jqGrid_donor_container">
				<table id="donor_grid" class="scroll"></table>
				<div id="donor_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
