<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../base/nocache.jsp"%>
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
        	$grid = jQuery("#help_grid").jqGrid({
        	   	url:'HelpGrid.help.do',	
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
        	   	       		'<s:text name="help.grid.role"/>',
        	        	   	'<s:text name="help.grid.code"/>', 
        	        	   	'<s:text name="help.grid.document"/>',
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'role',index:'role',width:'100%',align:"center"},
        	   		{name:'code',index:'code', width:'100%',align:"center",hidden:true},
        	   		{name:'html',index:'html', width:'100%',align:"center",
            	   		formatter: function (cellvalue, options, rowObject) {
                	   		var url="HelpDoc.do?fileName="+rowObject.code;
	  	        			return '<a href="'+url+'" target="_blank"><span style="color:blue"><u>' + '<s:text name="help.grid.manual"/>: '+rowObject.role +  '</u></span></a>';
	  	             	}
   	             	}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#help_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		gridComplete: function(){
  				},
  				onSelectRow: function(iRow){

  	  	  		}

        	});

        	jQuery("#help_grid").jqGrid('navGrid','#help_grid_pager',
                	{edit: false, add:false, del:false,search:false},
        			{}, {},{},{multipleSearch:true, recreateFilter:true});

        $(window).bind('resize', function() {
            var width = $('#jqGrid_help_container').width();
            $('#help_grid').setGridWidth(width);
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

			<div id="jqGrid_help_container">
				<table id="help_grid" class="scroll"></table> 
				<div id="help_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
	<input type="hidden" id="fileName" name="fileName" value="<s:property value="fileName"/>">
	
 </body>   
			
</html>	
