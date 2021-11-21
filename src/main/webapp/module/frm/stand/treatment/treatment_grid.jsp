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
        	jQuery("#treatment_grid").jqGrid({
        	   	url:'FrmGrid.standTreatment.do?standId=<s:property value='standId'/>',	
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
        	   	colNames:[ 'Id',
        	   	           '<s:text name="frm.stand.treatment.name.label"/>',
        	   	           '<s:text name="frm.stand.treatment.date.label"/>',
        	   	           '<s:text name="frm.stand.treatment.percent.area.label"/>'
        	        	 ],
        	     	colModel:[
        	              {name:'id',index:'id',hidden:true, width:'200%'},
        	              {name:'treatment_name',index:'treatment_name', width:'200%',align:"center"},
        	              {name:'treatment_date',index:'treatment_date',  width:'200%',align:"center"},
        	              {name:'treatment_area_perc',index:'treatment_area_perc', width:'200%',align:"center"}
        	              ],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#treatment_grid_pager',
        	   	sortname: 'a.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
   				}        		

        	});
              	

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_treatment_container').width();
            $('#treatment_grid').setGridWidth(width);
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
			<div id="jqGrid_treatment_container">
			<input id="standId" class="standId" value="<s:property value='standId'/>" type="hidden">
				<table id="treatment_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="treatment_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
