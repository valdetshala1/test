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
        $(document).ready(function () {
        	jQuery("#animalrequest_grid").jqGrid({
        	   	url:'DhpetGrid.animalRequest.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{animal_id:$("#dhpetWildAnimalId").val()},
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
        	   	colNames:['id',
        	        	   	'',
        	        	   	'<s:text name="dhpet.maint.of.mong.label.request.for"/>',
        	        	   	'<s:text name="dhpet.maint.of.mong.label.max.point"/>',
        	        	   	'<s:text name="dhpet.location.label.comments"/>',
        	    			'<s:text name="planting.stand.impl.created.date"/>',
	        	        	'<s:text name="planting.stand.impl.created.by"/>'
        	        	   	
			],
      	   		colModel:[
	      	      	{name:'id',index:'id', hidden:true, width:'100%'},
	      	      	{name:'act',index:'act', width:'20%',search:false},
	      	   		{name:'requestFor',index:'requestFor',width:'100%'},
	      	   		{name:'maxPoint',index:'maxPoint',width:'100%',align:"center"},
	      	   		{name:'note',index:'note',width:'100%'},
					{name:'createdDate',index:'createdDate', width:'100%',align:"center", search:false},
        	   		{name:'createdBy',index:'createdBy', width:'100%', search:false}
      	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#animalrequest_grid_pager',
        	 	gridComplete: function(){
        			var ids = jQuery("#animalrequest_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DhpetWildAnimalsRequest','#animalrequest_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#animalrequest_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "AnimalRequest.form.do?animalRequestId=" + rowData.id;
    				loadURL(link, $("#animalrequest_form_content"));
   				}        		
        	});

        	jQuery("#animalrequest_grid").jqGrid('navGrid','#animalrequest_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true}).navButtonAdd('#animalrequest_grid_pager',{
             	   	   caption:"", 
            	   	   title:"<s:text name="label.button.edit"/>", 
            	   	   buttonicon:"ui-icon-pencil", 
            	   	   onClickButton: function(){ 
            	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            	   			if(iRow){
            					var rowData = jQuery(this).getRowData(iRow);
            					var link = "AnimalRequest.form.do?animalRequestId=" + rowData.id;
            					loadURL(link, $("#animalrequest_form_content"));
            	   			}else{
            	   	   			alert("<s:text name="global.please.select.row"/>");
            	   	   		}   
            	   	   }, 
            	   	   position:"last"
             });
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_animalrequest_container').width();
            $('#animalrequest_grid').setGridWidth(width);
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
			<div id="jqGrid_animalrequest_container">
				<table id="animalrequest_grid" class="scroll"></table> 
				<div id="animalrequest_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	