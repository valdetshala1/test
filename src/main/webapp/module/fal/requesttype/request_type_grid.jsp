<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.unchecked{ background-color:red !important; }
ui-grid{ width:100% !important; }
.checkbox-grid li {
    display: block;
    float: right;
    width: 20%;
}
</style>
        <script type="text/javascript">

        function editRequestType(grid, rowId){
        	var rowData=jQuery("#request_type_grid").getRowData(rowId);
        	var link = "RequestType.form.do?requestTypeId=" + rowData.id;
        	loadURL(link,$("#request_type_form_content"));
        }
        var link ;
        $(document).ready(function () {
            link = 'FalGrid.requestTypes.do';
        	jQuery("#request_type_grid").jqGrid({
        	   	url:link,	
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
        	   	colNames:['ID', 
       	        	   	'',
       	        	 	'<s:text name="dhpet.wild.animal.label.name.al"/>',
       	        	   	'<s:text name="dhpet.wild.animal.label.name.en"/>',
       	        	   	'<s:text name="dhpet.wild.animal.label.name.sr"/>',
       	        	   	'<s:text name="seed.inv.price"/>',
       	        	   	'<s:text name="hum.employee.label.created.date"/>',
       	        	   	'<s:text name="budget.maintenance.financial.created.by"/>'
        	   		],       	   	
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'name_al',index:'name_al', width:'100%',align:"center",search:false},
        	   		{name:'name_en',index:'name_en', width:'100%',align:"center",search:false},
        	   		{name:'name_sr',index:'name_en', width:'100%',align:"center",search:false},
        	   		{name:'price',index:'price', width:'100%',align:"center",search:false},
        	   		{name:'created_date',index:'created_date', width:'100%',align:"center",search:false},
        	   		{name:'created_by',index:'created_by', width:'100%',align:"center",search:false}
        	   		],
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	   	pager: '#request_type_grid_pager',
        	   	sortname: 'id',
				gridComplete: function(){
        			var ids = jQuery("#request_type_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					pa = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"editRequestType('#request_type_grid', '"+cl+"');\"><i class='fa fa-pencil'></i></button>";
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('RequestType','#request_type_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#request_type_grid").jqGrid('setRowData',ids[i],{act:pa+au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiboxonly:true,
        		loadComplete: function (){
        			var rowIDs = jQuery("#request_type_grid").getDataIDs(); 
        		      for (var i=0;i<rowIDs.length;i=i+1){ 
        		        rowData=jQuery("#request_type_grid").getRowData(rowIDs[i]);
        		        var trElement = jQuery("#"+ rowIDs[i],jQuery('#request_type_grid'));
        		        if (rowData.status == 'UCH') { 
        		            trElement.removeClass('ui-widget-content');
        		            trElement.addClass('unchecked');
        		        }
        		      }
        		},
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>'

        	});
              	
        	jQuery("#request_type_grid").jqGrid('navGrid','#request_type_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false});

        $(window).bind('resize', function() {
            var width = $('#jqgrid_request_container').width();
            $('#request_type_grid').setGridWidth(width);
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
			<div id="jqgrid_request_container">
				<table id="request_type_grid" class="scroll"></table> 
				<div id="request_type_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
		
 </body>  
</html>	
