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
        	 jQuery("#publish_grid").jqGrid({
        	   	url:'PublishGrid.publishing.do',	
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
        	   	       		'<s:text name="pub.publishing.title.label"/>',
        	   	       		'<s:text name="pub.publishing.titleEn.label"/>',
        	   	     		'<s:text name="pub.publishing.titleSr.label"/>',
        	        	   	'<s:text name="pub.publishing.publishedDate.label"/>', 
        	        	   	'<s:text name="pub.publishing.important.label"/>',
        	        	   	'<s:text name="pub.publishing.published.label"/>',
        	   	        	'<s:text name="annual.plan.created.by"/>',
        	   	        	'<s:text name="hum.employee.label.created.date"/>',
        	   	        	],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'title',index:'title',width:'100%',align:'center'},
        	   		{name:'titleEn',index:'titleEn',width:'100%',align:'center'},
        	   		{name:'titleSr',index:'titleSr',width:'100%',align:'center'},
        	   		{name:'published_date',index:'published_date', width:'100%',align:"center"},
        	   		{name:'important',index:'important', width:'100%',align:"center", formatter: "checkbox"},
        	   		{name:'published',index:'published', width:'100%',align:"center", formatter: "checkbox"},
        	   		{name:'created_by',index:'created_by', width:'100%',align:"center"},
        	   		{name:'created_date',index:'created_date', width:'100%',align:"center"}
        	   	
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#publish_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		gridComplete: function(){
  				},
  				onSelectRow: function(iRow){

  	  	  		},
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Publish.form.do?publishingId=" + rowData.id;
 					loadURL(link, $("#pub_form_content"));
   				}      

        	});
         	jQuery("#publish_grid").jqGrid('navGrid','#publish_grid_pager',
                	{edit: false, add:false, del:false},
        			{}, {},{},{multipleSearch:true, recreateFilter:true});
			
        	 jQuery("#publish_grid").navButtonAdd('#publish_grid_pager',{
       	   	   caption:"", 
       	   	   title:'<s:text name="label.button.edit"/>',
       	   	   buttonicon:"ui-icon-pencil", 
       	   	   onClickButton: function(){ 
           	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
       	   			if(iRow){
       					var rowData = jQuery(this).getRowData(iRow); 
         				var link = "Publish.form.do?publishingId=" + rowData.id;
      					loadURL(link, $("#pub_form_content"));
       	   			}else{
       	   	   			alert("<s:text name="global.please.select.row"/>"); 
       	   	   		}   
       	   	   }, 
       	   	   position:"last",
       	   	   cursor: "pointer"
       	   	});



        $(window).bind('resize', function() {
            var width = $('#jqGrid_publish_container').width();
            $('#publish_grid').setGridWidth(width);
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

			<div id="jqGrid_publish_container">
				<table id="publish_grid" class="scroll"></table> 
				<div id="publish_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
	<input type="hidden" id="fileName" name="fileName" value="<s:property value="fileName"/>">
	
 </body>   
			
</html>	
