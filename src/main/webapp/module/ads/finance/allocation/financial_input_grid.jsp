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
        	jQuery("#fin_input_alloc_grid").jqGrid({
        		url:'FinGrid.financialInput.do?type=IN',	
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
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id',
        	   	      		 '',
        	        	   	'<s:text name="annu.felling.label.year"/>', 
        	        	   	'MonthKey',
        	        	   	'<s:text name="report.wood.production.label.month"/>', 
        	        	   	'<s:text name="finance.input.label.input.type"/>', 
        	        	   	'<s:text name="fin.input.financial.organisation"/>',
        	        	   	'<s:text name="finance.input.label.value"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'status_icon',index:'status_icon',hidden:false,sortable:false, width:'100%',search:false},
        	   		{name:'year',index:'year', width:'100%', align:"center",search:false},
        	   		{name:'monthKey',index:'monthKey',hidden:true, width:'100%'},
        	   		{name:'month',index:'month', width:'100%', search:false,stype:'select',
            	   		 searchoptions:{sopt:['eq','ne'], value: ':;JA:JA;FE:FE;MR:MR;AP:AP;MJ:MJ;JN:JN;JL:JL;AG:AG;SE:SE;OC:OC;NO:NO;DE:DE'}},
        	   		{name:'financial_type',index:'financial_type', width:'100%', align:"left",search:false},
        	   		{name:'municipality',index:'municipality', width:'100%', align:"left",search:false},
        	   		{name:'cumulative_value',index:'cumulative_value', width:'100%', align:"center",search:false},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"left",search:false},
        	   		{name:'created_time',index:'created_time', width:'100%',align:"center",search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#fin_input_alloc_grid_pager',
        	   	sortname: 'i.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "FinInput.form.do?finInputId=" + rowData.id;
 					loadURL(link, $("#financial_input_form_content"));
   				}   ,
        		loadBeforeSend: function (xhr, settings) {
//                  if(!$("#fire\\.id").val() || $("#empty_grid").val()=='true'){
               this.p.loadBeforeSend = null; //remove event handler
               return false; // dont send load data request
//                  }
           }
	          
        	});
              	
        	jQuery("#fin_input_alloc_grid").jqGrid('navGrid','#fin_input_alloc_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#fin_input_alloc_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#fin_input_alloc_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "FinInput.form.do?finInputId=" + rowData.id;
             					loadURL(link, $("#financial_input_form_content"));
             	   			}else{
             	   	   			alert("<s:text name="global.please.select.row"/>"); 
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	});

        });

        $(window).resize(function () {
            // when the browser size changes so does the grid
               $("#fin_input_alloc_grid").jqGrid('setGridWidth', $('#jqGrid_fin_input_alloc_container').width(), false);
           });

           $(window).bind('resize', function() {
            //trick - make small
            $('#fin_input_alloc_grid').setGridWidth(100);
            
            var width = $('#jqGrid_fin_input_alloc_container').width();
               // Set grid width to .jqGrid_order_item_container and them go responsive
               $("#fin_input_alloc_grid").jqGrid('setGridWidth', width, false);
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
			<div id="jqGrid_fin_input_alloc_container">
				<table id="fin_input_alloc_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="fin_input_alloc_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
