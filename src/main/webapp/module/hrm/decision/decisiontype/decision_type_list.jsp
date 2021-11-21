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
        	jQuery("#decision_type_grid").jqGrid({
        	   	url:'HrmGrid.decisionType.do',	
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
        	        	   	'<s:text name="leave.type.label.name"/>', 
        	        	   	'<s:text name="leave.type.label.name.sr"/>', 
        	        	   	'<s:text name="leave.type.label.name.en"/>',
        	        	   	'<s:text name="budget.maintenance.financial.created.by"/>',
        	        	   	'<s:text name="budget.maintenance.financial.created.time"/>',
        	        	   	'<s:text name="adm.person.label.address.notes"/>'
        	        	   	],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'name_al',index:'name_al', width:'100%'},
        	   		{name:'name_sr',index:'name_sr', width:'100%'},
        	   		{name:'name_en',index:'name_en', width:'100%', align:"center"},
        	   		{name:'created_by',index:'created_by', width:'100%', align:"center"},
        	   		{name:'created_date',index:'created_date', width:'100%', align:"center"},
        	   		{name:'note',index:'note', width:'100%', align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#decision_type_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#decision_type_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DecisionType','#decision_type_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#decision_type_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "DecisionType.form.do?decisionTypeId=" + rowData.id;
 					loadURL(link, $("#decision_type_form_content"));
   				}        		

        	});
              	
        	jQuery("#decision_type_grid").jqGrid('navGrid','#decision_type_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#decision_type_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#decision_type_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "DecisionType.form.do?decisionTypeId=" + rowData.id;
             					loadURL(link, $("#decision_type_form_content"));
             	   			}else{
             	   				alert('<s:text name="tender.request.alarm"/>');
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	});
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_financial_type_container').width();
            $('#decision_type_grid').setGridWidth(width);
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

			<div id="jqGrid_financial_type_container">
				<table id="decision_type_grid" class="scroll"></table> 
				<div id="decision_type_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
