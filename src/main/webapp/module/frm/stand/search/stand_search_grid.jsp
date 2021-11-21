<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<script type="text/javascript">
		var selRows=[];
		function addRowToSel(id){
			$("#selected_grid").jqGrid('saveRow', id);
			var rowData = jQuery("#stand_search_grid").getRowData(id); 
			var addToSel=true;
			for(var i=0; i<selRows.length;i++){
				if(rowData.st_id==selRows[i]){
					addToSel=false;
					break;
				}
			}
			if(addToSel){
				selRows.push(rowData.st_id);
				   var parameters =
			        {
			            rowID: id,
			            initdata: {
							mu_id: rowData.mu_id,
				            mu_name: rowData.mu_name,
				            comp_id: rowData.comp_id,
				            comp_nr: rowData.comp_nr,
				            st_id: rowData.st_id,
				            stand_id: rowData.stand_id,
				            stand_nr: rowData.stand_nr,
				            basal_area: rowData.basal_area,
				            stand_type: rowData.stand_type,
				            access_type: rowData.access_type,
				            mngm_class: rowData.mngm_class
			            },
			            position: "last",
			            useDefValues: true,
			            useFormatter: false,
			            addRowParams: { extraparam: {} }
			        };
			    $("#selected_grid").jqGrid('addRow', parameters);
			    $("#selected_grid").jqGrid('setGridParam', {editable: true}); 
			}
		}
        $(document).ready(function () {
            var link = 'FrmGrid.standSearch.do?';
        	jQuery("#stand_search_grid").jqGrid({
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
        		shrinkToFit: false,
        		gridview: true,
        		multiselect: true,
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
        	   		{name:'mu_id',index:'mu_id',hidden:true, width:'50%',search:false},
        	   		{name:'mu_name',index:'mu_name', width:'100%' , search:true,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']}},
        	   		{name:'comp_id',index:'comp_id', hidden:true,width:'100%',align:"right",search:false},
        	   		{name:'comp_nr',index:'comp_nr', width:'70%',align:"center",search:true,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},searchtype:"number"},
        	   		{name:'st_id',index:'st_id', width:'100%',align:"center",hidden:true,search:false},
        	   		{name:'stand_id',index:'stand_id', width:'100%',hidden:true,align:"center",search:true,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},searchtype:"number"},
        	   		{name:'stand_nr',index:'stand_nr', width:'50%',hidden:false,align:"center",search:true,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},searchtype:"number"},
        	   		{name:'basal_area',index:'basal_area', width:'50%',align:"center" ,search:true,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},searchtype:"number"},
        	   		{name:'stand_type',index:'stand_type', width:'100%',align:"right", search:true,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},stype:'select', 
        	   			searchoptions:{ value: $("#stype").val()}},
        	   		{name:'access_type',index:'access_type', width:'100%',align:"right", search:true,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},stype:'select', 
        	   			searchoptions:{ value: $("#acctype").val()}},
        	   		{name:'mngm_class',index:'mngm_class', width:'100%',align:"right", search:true,searchoptions:{sopt:['eq','ne','lt','le','gt','ge','bw','ew','cn']},stype:'select', 
        	   			searchoptions:{ value: $("#mngm").val()}}
        	   	],
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	   	pager: '#stand_search_grid_pager',
        	   	sortname: 'id',
				gridComplete: function(){
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		loadComplete: function (){
        		},
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
   				},
   				onSelectAll: function(id,status){
   					var sel=$("#sel").is(":checked");
   					if(status && sel){
	   					for(var i=0; i<id.length;i++){
	   						addRowToSel(id[i]);
						}
   	   				}
   	   			},
   				onSelectRow: function(id,status){
   	   				var sel=$("#sel").is(":checked");
   					if(status && sel){
   						addRowToSel(id);
   					}
   	   			}

        	});
              	
        	jQuery("#stand_search_grid").jqGrid('navGrid','#stand_search_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:true},
        			{}, {},{},{multipleSearch:true,recreateFilter:true,showQuery: false,
        				onSearch: function () {
    				        var $filter = $("#" + $.jgrid.jqID("fbox_" + this.id)),
    				            sql = $filter.jqFilter('toSQLString');
    				            $("#fiterSql").val(sql);
    						}
					});

        $(window).bind('resize', function() {
            var width = $('#jqgrid_stand_search_grid_container').width();
            $('#stand_search_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }  
        $("#stand_search_grid").parents('div.ui-jqgrid-bdiv').css("max-height","260px"); 
        });     
    </script>
</head>
<body>
	<input id="fiterSql" name="fiterSql" value="<s:property value='fiterSql'/>" type="hidden">
	<input id="mngm" name="mngm" value="<s:property value='mngm'/>" type="hidden">
	<input id="stype" name="stype" value="<s:property value='stype'/>" type="hidden">
	<input id="acctype" name="acctype" value="<s:property value='acctype'/>" type="hidden">
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">
		<div id="jqgrid_stand_search_grid_container">
			<table id="stand_search_grid" class="scroll"></table> 
			<div id="stand_search_grid_pager" class="scroll" style="text-align:center;"></div>
		</div>
	</div>
	<!-- end widget div -->
	<fieldset><legend>Raporte</legend>
		<div id="stand_report_content">
			<jsp:include page="stand_report.jsp"></jsp:include>
		</div>
	</fieldset>
	
 </body>   
</html>	
