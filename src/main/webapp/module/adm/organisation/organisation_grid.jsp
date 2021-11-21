<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	jQuery("#organisation_grid").jqGrid({
        	   	url:'AdmGrid.organisation.do?',	
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
        	        	   	'<s:text name="adm.organisation.label.name"/>', 
        	        	   	'<s:text name="adm.organisation.label.parent"/>', 
        	        	   	'<s:text name="adm.organisation.label.code"/>', 
        	        	   	'<s:text name="adm.organisation.label.type"/>', 
        	        	   	 '<s:text name="adm.organisation.label.operation.level"/>',
        	        	   	 '<s:text name="adm.organisation.label.category"/>',
        	        	   	 '<s:text name="hrm.skill.label.start.date"/>',
        	        	   	 '<s:text name="hrm.skill.label.end.date"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden:true, width:'100%'},
        	   		{name:'orgaName',index:'orgaName', width:'100%'},
        	   		{name:'party',index:'party',width:'100%'},
        	   		{name:'code',index:'code', width:'100%', align:"center"},
        	   		{name:'orgaType',index:'orgaType', width:'100%', align:"center"},
        	   		{name:'operationLevel',index:'operationLevel', width:'100%', align:"center"},
        	   		{name:'orgaCategory',index:'orgaCategory', width:'100%',align:"left"},
        	   		{name:'startDate',index:'startDate', width:'100%',align:"left"},
        	   		{name:'endDate',index:'endDate', width:'100%',align:"left"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#organisation_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Organisation.form.do?organisationId=" + rowData.id;
    				loadURL(link, $("#organisation_form_content"));
   				}        		
        	});
              	
        	jQuery("#organisation_grid").jqGrid('navGrid','#organisation_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#organisation_grid").jqGrid('navButtonAdd', '#organisation_grid_pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                		jQuery("#organisation_grid").jqGrid('columnChooser');
             }});
        	jQuery("#organisation_grid").jqGrid('navButtonAdd', '#organisation_grid_pager', 
                	{ caption: "", buttonicon: "ui-icon-pencil", title: "<s:text name="label.button.edit"/>", 
                	onClickButton: function() {
            			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            			if(iRow){
            				var rowData = jQuery(this).getRowData(iRow);
            				var link = "Organisation.form.do?organisationId=" + rowData.id;
            				loadURL(link, $("#organisation_form_content"));
            			}else{
            	   			alert("<s:text name="global.please.select.row"/>"); 
            	   		}
             }});

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_organisation_container').width();
            $('#organisation_grid').setGridWidth(width);
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

			<div id="jqGrid_leave_container">
				<table id="organisation_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="organisation_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
