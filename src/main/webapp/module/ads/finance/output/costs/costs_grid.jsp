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

function customFormatter ( cellvalue, options, rowObject ){
	if(cellvalue == 'C'){
		return "<i class='fa fa-university'></i> <span style='color:blue;'>" + cellvalue + "</span>";
	}else if(cellvalue == 'R'){
		return "<i class='fa fa-sitemap'></i> <span style='color:green;'>" + cellvalue + "</span>";
	}else if(cellvalue == 'M'){
		return "<i class='fa fa-home'></i> <span style='color:#61210B;'>" + cellvalue + "</span>";
	}else{
		return cellvalue;
	}
}

function formatCell(cellvalue, options, rowData, rowObject){
	//rowData.payment_date
	//console.log(cellvalue + ", " + rowObject.payment_date);
	if(cellvalue){
		return "<i class='fa fa-check'></i> <span style='color:green;'>" + cellvalue + "</span>";
	}else{
		//return "<i class='fa fa-square-o'></i> <span style='color:blue;'>" + cellvalue + "</span>";
		return cellvalue;
	}
}  

        department = function (elem) {
    		$(elem).autocomplete({
    	        source: function(request, response) {
    	            $.ajax({
    	            	type:"get",
    	                url: "Input.organisation.do",
    	                dataType: "json",
    	                data: {
    						featureClass: "P",
    						style: "full",
    						maxRows: 12,
    						name_startsWith: request.term,
    						orgtype: "D"
    					},
    					success: function( data ) {
    						response( $.map( data, function(item ) {
    							return {
    								label: item.name,
    	                            value: item.name,
    	                            id: item.id
    							};
    						}));
    					},
    	                maxRows: 100,
    	        		minLength: 0   
    	            });
    	        },
    	        select: function(event, ui) {
    	            $(elem).val(ui.item.value);
    			     var grid = $("#costs_grid");
    			     grid.jqGrid({
    			         search:true, // if you want to force the searching
    			         postData: { department: ui.item.id}
    			     });	     
    			     $.extend(grid[0].p.postData,{department: ui.item.id});
    			     grid.trigger("reloadGrid",[{page:1}]);            
    	        }  
    	    });
    	};
        $(document).ready(function () {
        	jQuery("#costs_grid").jqGrid({
        	   	url:'FinGrid.financialSalaryOutput.do?outputType='+$('#financialOutput\\.outputType').val(),	
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
        	   	colNames:['Id',
        	        	   	'',
        	        	   	'<s:text name="output.salary.label.uop.number"/>', 
        	        	   	'<s:text name="output.salary.label.free.balance"/>', 
        	        	   	'<s:text name="output.salary.label.date.of.commitment"/>',
        	        	   	'<s:text name="finance.costs.label.expenditure.type"/>',
        	        	   	'<s:text name="output.salary.label.department"/>',
        	        	   	'<s:text name="output.salary.label.economic.code"/>', 
        	        	   	'<s:text name="output.salary.label.description.of.economic.code"/>',
        	   	       		'<s:text name="output.salary.label.value.in.euro"/>',
        	   	       		'<s:text name="output.salary.label.description.cpo"/>',
        	   	       		'<s:text name="finance.costs.label.source.found"/>', 
        	   	       		'<s:text name="output.salary.label.beneficiary"/>',
        	   	       		'<s:text name="finance.costs.label.nrb.code"/>',
        	   	       		'<s:text name="finance.costs.label.invoice.number"/>',
        	   	       		'<s:text name="output.salary.label.payment.date"/>' , 
        	   	       		'<s:text name="output.salary.label.month"/>',
        	   	       		'<s:text name="finance.payment.created.by"/>',
        	   	       		'<s:text name="report.thinning.grid.label.created.time"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'uop_number',index:'uop_number', width:'100%', align:"center", search:true},
        	   		{name:'free_balance',index:'free_balance', width:'100%', align:"center", search:false},
        	   		{name:'date_of_commitment',index:'date_of_commitment', width:'100%', align:"center", search:false},
        	   		{name:'expenditure_type',index:'expenditure_type',width:'100%', search:false},
        	   		{name:'department',index:'department', width:'100%', sorttype:'string', 
            	   		searchoptions:{
            	   			sopt:['eq','bw','bn','cn','nc','ew','en'],
            	   			dataInit: department
                       }},
        	   		{name:'economic_code',index:'economic_code', width:'100%', search:false},
        	   		{name:'description_of_economic_code',index:'description_of_economic_code', width:'100%',sortable:false, search:false},
         	        {name:'value_in_euro',index:'value_in_euro',width:'100%', align:'center', search:false, formatter:'currency',
                        formatoptions:{prefix:'',suffix:' €',thousandsSeparator:','}},
                        
        	   		{name:'description_cpo',index:'description_cpo', width:'100%',sortable:false, search:false},
        	   		{name:'souce_fund',index:'souce_fund', width:'100%', align:"center", search:false},
        	   		{name:'beneficiary',index:'beneficiary', width:'100%', search:false},
        	   		{name:'nrb_code',index:'nrb_code', width:'100%', search:false},
        	   		{name:'invoice_number',index:'invoice_number', width:'100%', search:false},
        	   		{name:'payment_date',index:'payment_date', width:'100%', align:"center", search:true,
        	   			formatter: formatCell },
        	   		{name:'month',index:'month', width:'100%', search:true,stype:'select',
              	   		 searchoptions:{sopt:['eq','ne'], value: ':;JA:JA;FE:FE;MR:MR;AP:AP;MJ:MJ;JN:JN;JL:JL;AG:AG;SE:SE;OC:OC;NO:NO;DE:DE'}},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"left", search:false},
        	   		{name:'created_time',index:'created_time', width:'100%', align:"center", search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#costs_grid_pager',
        	   	sortname: 'id',
        		gridComplete: function(){
        			var ids = jQuery("#costs_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('FinancialOutput','#costs_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#costs_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "FinOutput.costsform.do?financialOutputId=" + rowData.id;
    				loadURL(link, $("#costs_form_content"));
   				}        		

        	});
        	jQuery("#costs_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#costs_grid").jqGrid('navGrid','#costs_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#costs_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#costs_grid_pager',{
        	   	   caption:"", 
        	   	   title:"<s:text name="label.button.edit"/>",  
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "FinOutput.costsform.do?financialOutputId=" + rowData.id;
        					loadURL(link, $("#costs_form_content"));
        	   			}else{
        	   	   			alert("<s:text name="global.please.select.row"/>"); 
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	}) .navButtonAdd('#costs_grid_pager',{
	             	   caption:"<s:text name='sub.menu.reports'/>",
	              	   title:"<s:text name='sub.menu.reports'/>", 
     		   	   buttonicon: "ui-icon-print", 
     		   	   onClickButton: function(){ 
     			   		var link = "FinOutput.costsReportPopup.do";
     			   		openDialogForm('financialCostsReportGen',link,'<s:text name="label.button.generate.report"/>',800,420);
     		   	   }, 
     		   	   position:"last"
     	   	});
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_costs_container').width();
            $('#costs_grid').setGridWidth(width);
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
		<input id="financialOutput.outputType" name="financialOutput.outputType" value="<s:property value='costs'/>" type="hidden">
			<div id="jqGrid_costs_container">
<%-- 			<input id="vehicleId" class="vehicleId" value="<s:property value='logVehicles.id'/>" type="hidden"> --%>
				<table id="costs_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="costs_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
