<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<script type="text/javascript">
        $(document).ready(function () {
            
        	jQuery("#selected_grid").jqGrid({
        	   	url: "",	
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
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
                colNames:['mu_id',
        	        	  '<s:text name="annu.management.unit.menu"/>',
        	        	  'comp_id',
        	        	  '<s:text name="frm.stand.compartment"/>',
        	        	  'st_id',
        	        	  '<s:text name="frm.stand.stand"/>',
        	        	  '<s:text name="frm.stand.stand"/>',
        	        	  '<s:text name="frm.stand.basal.area"/>',
        	        	  '<s:text name="frm.stand.forest.type"/>',
        	        	  '<s:text name="frm.stand.access.type"/>',
        	        	  '<s:text name="dem.fiskos.managment.class.id"/>',
        	        	  
         	        	   	
         	        	   	
        	   		],       	   	
        	   	colModel:[
        	   		{name:'mu_id',index:'mu_id',hidden:true, width:'50%',search:false,editable:false},
        	   		{name:'mu_name',index:'mu_name', width:'100%' , search:true,editable:false,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']}},
        	   		{name:'comp_id',index:'comp_id', hidden:true,width:'100%',align:"right",search:false,editable:false},
        	   		{name:'comp_nr',index:'comp_nr', width:'70%',align:"center",search:true,editable:false,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},searchtype:"number"},
        	   		{name:'st_id',index:'st_id', width:'100%',align:"center",hidden:true,search:false,editable:false},
        	   		{name:'stand_id',index:'stand_id', width:'100%',hidden:true,align:"center",search:true,editable:false,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},searchtype:"number"},
        	   		{name:'stand_nr',index:'stand_nr', width:'50%',hidden:false,align:"center",search:true,editable:false,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},searchtype:"number"},
        	   		{name:'basal_area',index:'basal_area', width:'50%',align:"center" ,search:true,editable:false,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},searchtype:"number"},
        	   		{name:'stand_type',index:'stand_type', width:'100%',align:"right", search:true,editable:false,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},stype:'select', 
        	   			searchoptions:{ value: $("#stype").val()}},
        	   		{name:'access_type',index:'access_type', width:'100%',align:"right", search:true,editable:false,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},stype:'select', 
        	   			searchoptions:{ value: $("#acctype").val()}},
        	   		{name:'mngm_class',index:'mngm_class', width:'100%',align:"right", search:true,editable:false,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},stype:'select', 
        	   			searchoptions:{ value: $("#mngm").val()}}
        	   	],
        	   	pager: '#selected_grid_pager',
        	   	sortname: 'id',
				gridComplete: function(){
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiboxonly:true,
        		loadComplete: function (){
        		},
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
   				}        		

        	});
              	
        	jQuery("#selected_grid").jqGrid('navGrid','#selected_grid_pager',
                	{edit: false, add:false, del:false, search:false, refresh:false, view:false},
        			{}, {},{},{multipleSearch:false,recreateFilter:true})
        			.navButtonAdd('#selected_grid_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.delete"/>", 
                	   buttonicon:"ui-icon-trash",
                	   id:"delete_button", 
                	   onClickButton: function(){
                		   var selr = jQuery('#selected_grid').jqGrid('getGridParam','selrow'); 
                		   if(selr){
                			   	var rowData = jQuery("#selected_grid").getRowData(selr); 
                			   	var index = selRows.indexOf(rowData.st_id);
                			   	if(index!=-1)
                			   		selRows.splice(index, 1);
                		   		
                		   		$('#selected_grid').jqGrid('delRowData', selr);
                		   }
                	   }, 
                	   position:"last"
                	});

        $(window).bind('resize', function() {
            var width = $('#jqgrid_selected_container').width();
            $('#selected_grid').setGridWidth(width);
        });
        $("#selected_grid").parents('div.ui-jqgrid-bdiv').css("max-height","260px");        
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
<input id="compId" name="compId" value="<s:property value='compId'/>" type="hidden">
<input id="mupId" name="mupId" value="<s:property value='mupId'/>" type="hidden">
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqgrid_selected_container">
				<table id="selected_grid" class="scroll"></table> 
				<div id="selected_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
 </body>   
			
</html>	
