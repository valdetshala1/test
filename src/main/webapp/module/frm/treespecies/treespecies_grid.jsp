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
        	jQuery("#treespecies_grid").jqGrid({
        	   	url:'FrmGrid.treespecies.do',	
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
        	        	   '',
        	        	   	'<s:text name="leave.type.label.code"/>', 
        	        	   	'<s:text name="dhpet.wild.animal.label.name.en"/>', 
        	        	   	'<s:text name="dhpet.wild.animal.label.name.al"/>',
        	        	   	'<s:text name="dhpet.wild.animal.label.name.sr"/>',
        	        	   	'<s:text name="dhpet.wild.animal.label.name.la"/>', 
        	        	   	'<s:text name="tree.species.group.label"/>',
        	        	   	'<s:text name="tree.species.bonitet.label"/>', 
        	        	   	'<s:text name="tree.species.max.diam.label"/>'
        	        	  ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%',search:false},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'code',index:'code', width:'100%', align:"center",search:false},
        	   		{name:'nameEn',index:'nameEn', width:'100%',search:false},
        	   		{name:'nameAl',index:'nameAl', width:'100%',search:true},
        	   		{name:'nameSr',index:'nameSr', width:'100%',search:false},
        	   		{name:'nameLa',index:'nameLa', width:'100%',search:false},				
        	   		{name:'speciesGroup',index:'speciesGroup', width:'100%',search:false},
        	   		{name:'speciesBonitet',index:'speciesBonitet', width:'100%', align:"center",search:false},
        	   		{name:'maxDiameter',index:'maxDiameter', width:'100%', align:"center",search:false},
            	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#treespecies_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#treespecies_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('TreeSpecies','#treespecies_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#treespecies_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "TreeSpecies.form.do?treespeciesId=" + rowData.id;
    				loadURL(link, $("#treespecies_form_content"));
   				}        		

        	});
              	
        	jQuery("#treespecies_grid").jqGrid('navGrid','#treespecies_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        		.jqGrid('filterToolbar',{searchOperators : true})
        	.navButtonAdd('#treespecies_grid_pager',{
        	   	   caption:"", 
        	   	   title:'<s:text name="label.button.edit"/>',
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "TreeSpecies.form.do?treespeciesId=" + rowData.id;
        					loadURL(link, $("#treespecies_form_content"));
        	   			}else{
        	   				alert("<s:text name="tender.request.alarm"/>");
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	})
        $(window).bind('resize', function() {
            var width = $('#jqGrid_treespecies_container').width();
            $('#treespecies_grid').setGridWidth(width);
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

			<div id="jqGrid_treespecies_container">
				<table id="treespecies_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="treespecies_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
