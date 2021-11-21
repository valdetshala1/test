<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/module/base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        var myCustomFormatter = function(cellVal,options,rowObject) {
            return "<input style='height:22px;' type='button' value='Show Document' onclick=\"window.location.href='editItem.asp?ID="+cellVal+"'\"  />";  
        };
        
        $(document).ready(function () {
        	 jQuery("#taxrate_grid").jqGrid({
        	   	url:'FinGrid.salarytaxrate.do',	
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
        	   	colNames:['Id',
        	   	       		'<s:text name="hrml.employee.salary.taxrate.taxNormName"/>',
        	   	       		'<s:text name="hrml.employee.salary.taxrate.percent"/>',
        	   	     		'<s:text name="hrml.employee.salary.taxrate.startAmount"/>',
        	        	   	'<s:text name="hrml.employee.salary.taxrate.endAmount"/>',
        	        	   	'<s:text name="hrml.employee.salary.taxrate.validDateFrom"/>',
        	        	   	'<s:text name="hrml.employee.salary.taxrate.validDateTo"/>',
        	        	   	'<s:text name="hrml.employee.salary.taxrate.valid"/>',
        	   	        	'<s:text name="hrml.employee.salary.adjustment.createdBy"/>',
        	   	        	'<s:text name="hrml.employee.salary.adjustment.createdDate"/>',
        	   	        	],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'taxNormName',index:'taxNormName',width:'100%',align:'center'},
        	   		{name:'percent',index:'percent',width:'100%',align:'center'},
        	   		{name:'startAmount',index:'startAmount',width:'100%',align:'center',
        	   			formatter:'currency', formatoptions:{prefix:'',suffix:' €',thousandsSeparator:','}
            	   	},
        	   		{name:'endAmount',index:'endAmount', width:'100%',align:"center",
            	   		formatter:'currency', formatoptions:{prefix:'',suffix:' €',thousandsSeparator:','}
            	   	},
        	   		{name:'validDateFrom',index:'validDateFrom', width:'100%',align:"center"},
        	   		{name:'validDateTo',index:'validDateTo', width:'100%',align:"center"},
        	   		{name:'valid',index:'valid', width:'100%',align:"center", sortable:false,search:false,formatter:"checkbox"},
        	   		{name:'createdBy',index:'createdBy', width:'100%',align:"center"},
        	   		{name:'createdDate',index:'createdDate', width:'100%',align:"center"}
        	   	
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#taxrate_grid_pager',
        	   	sortname: 'percentage',
        	    viewrecords: true,
        	    sortorder: "asc",
        		multiselect: false,
        		caption: "Tax Rates",
        		gridComplete: function(){
  				},
  				onSelectRow: function(iRow){

  	  	  		},
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "TaxRate.form.do?taxrateId=" + rowData.id;
 					loadURL(link, $("#taxrate_form_content"));
   				}      

        	});
         	jQuery("#taxrate_grid").jqGrid('navGrid','#taxrate_grid_pager',
                	{edit: false, add:false, del:false},
        			{}, {},{},{multipleSearch:true, recreateFilter:true});
			
        	 jQuery("#taxrate_grid").navButtonAdd('#taxrate_grid_pager',{
       	   	   caption:"", 
       	   	   title:'<s:text name="label.button.edit"/>',
       	   	   buttonicon:"ui-icon-pencil", 
       	   	   onClickButton: function(){ 
           	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
       	   			if(iRow){
       					var rowData = jQuery(this).getRowData(iRow); 
         				var link = "TaxRate.form.do?taxrateId=" + rowData.id;
      					loadURL(link, $("#taxrate_form_content"));
       	   			}else{
       	   	   			alert("<s:text name="global.please.select.row"/>"); 
       	   	   		}   
       	   	   }, 
       	   	   position:"last",
       	   	   cursor: "pointer"
       	   	});



        $(window).bind('resize', function() {
            var width = $('#jqGrid_taxrate_container').width();
            $('#taxrate_grid').setGridWidth(width);
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

		<div id="jqGrid_taxrate_container">
			<table id="taxrate_grid" class="scroll"></table> 
			<div id="taxrate_grid_pager" class="scroll" style="text-align:center;"></div>
		</div>
	</div>
	<!-- end widget div -->
	
 </body>   
			
</html>	
