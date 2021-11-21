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
        $(document).ready(function () {
        	jQuery("#paymentperiod_grid").jqGrid({
        	   	url:'FinGrid.paymentPeriod.do?contractId='+$("#contractId").val(),	
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
							'<s:text name="finance.payment.contract.id"/>',
							'<s:text name="finance.payment.start.date"/>',
							'<s:text name="finance.payment.completion.date"/>',
							'<s:text name="finance.payment.period"/>',
							'<s:text name="finance.payment.realized"/>',
							'<s:text name="finance.payment.created.by"/>',
							'<s:text name="finance.payment.created.time"/>'
						],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%',align:"center"},
        	   		{name:'contract_id',index:'contract_id',hidden:true, width:'100%',align:"center"},
        	   		{name:'start_date',index:'start_date', width:'100%',align:"center"},
        	   		{name:'completion_date',index:'completion_date', width:'100%',align:"center"},
        	   		{name:'payment_period',index:'payment_period', width:'100%',align:"center"},
        	   		{name:'payment_realized',index:'payment_realized', width:'100%',align:"center",formatter:'checkbox'},
        	   		{name:'created_by',index:'created_by', width:'100%',align:"center"},
        	   		{name:'created_time',index:'created_time', width:'100%',align:"center"}
        	   		
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#paymentperiod_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Payment.form.do?paymentId=" + rowData.id;
 					loadURL(link, $("#paymentperiod_form_content"));
   				}        		

        	});
              	
        	jQuery("#paymentperiod_grid").jqGrid('navGrid','#paymentperiod_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#paymentperiod_grid").navButtonAdd('#paymentperiod_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "Payment.form.do?paymentId=" + rowData.id;
             					loadURL(link, $("#paymentperiod_form_content"));
             	   			}else{
             	   			alert('<s:text name="tender.request.alarm"/>');
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	});
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_paymentperiod_container').width();
            $('#paymentperiod_grid').setGridWidth(width);
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

			<div id="jqGrid_paymentperiod_container">
				<table id="paymentperiod_grid" class="scroll"></table> 
				<div id="paymentperiod_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
