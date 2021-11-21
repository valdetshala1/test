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
        	jQuery("#operation_grid").jqGrid({
        	   	url:'AdmGrid.rbacOperation.do?permissionId='+$("#permissionId").val(),	
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
        	 	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'name',index:'name', width:'100%'}
        	   	],
        	   	rowNum:8,
        	   	rowList:[8,10,20,30],
        	   	pager: '#operation_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'Loading, please wait',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "User.form.do?userId=" + rowData.id;
 					loadURL(link, $("#user_form_content"));
   				}        		

        	});
              	
        	jQuery("#operation_grid").jqGrid('navGrid','#operation_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#operation_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
               
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_operation_container').width();
            $('#operation_grid').setGridWidth(width);
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

			<div id="jqGrid_operation_container">
				<table id="operation_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="operation_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
<!-- 			<div class="form-group"> -->
<!-- 					<div class="col-md-10"> -->
<!-- 						<label class="checkbox-inline"> -->
<%-- 							<s:iterator value="rbacOperationList"> --%>
<!-- 								<input type="checkbox"> -->
<%-- 									<s:property value="name"/> --%>
<!-- 								</label> -->
<!-- 								<label class="checkbox-inline"> -->
<!-- 								</label> -->
<%-- 							</s:iterator> --%>
<!-- 					</div> -->
<!-- 			</div> -->
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
