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
        	jQuery("#biodiversity_grid").jqGrid({
        	   	url:'FrmGrid.standBiodiversity.do?standId=<s:property value='standId'/>',	
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
        	   	           '<s:text name="frm.stand.biodiversity.name.label"/>',
        	   	           '<s:text name="frm.stand.biodiversity.biocode.label"/>',
        	   	           '<s:text name="frm.stand.biodiversity.taksator.label"/>',
        	   	           '<s:text name="frm.stand.biodiversity.remarks.label"/>',
        	        	 ],
        	     	colModel:[
        	              {name:'id',index:'id',hidden:true, width:'150%'},
        	              {name:'biodiversity_name',index:'biodiversity_name', width:'150%',align:"center"},
        	              {name:'biocode',index:'biocode',  width:'150%',align:"center"},
        	              {name:'taksator',index:'taksator', width:'150%',align:"center"},
        	              {name:'remarks',index:'remarks', width:'150%',align:"center"}
        	              ],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#biodiversity_grid_pager',
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
            var width = $('#jqGrid_biodiversity_container').width();
            $('#biodiversity_grid').setGridWidth(width);
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
			<div id="jqGrid_biodiversity_container">
				<table id="biodiversity_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="biodiversity_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
