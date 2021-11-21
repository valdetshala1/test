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
        	jQuery("#wildanimal_grid").jqGrid({
        	   	url:'DhpetGrid.wildAnimalGrid.do?',	
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
        	   	colNames:['id',
        	        	   	'',
        	        	   	'<s:text name="dhpet.wild.animal.label.name.al"/>',
        	        	   	'<s:text name="dhpet.wild.animal.label.name.la"/>',
        	        	   	'<s:text name="dhpet.wild.animal.label.name.en"/>',
        	        	   	'<s:text name="dhpet.wild.animal.label.name.sr"/>',
        	        		'<s:text name="dhpet.wild.animal.hunt.seasone"/>',
        	        		'<s:text name="dhpet.wild.animal.forbideen.seasone"/>',
        	        	   	'<s:text name="dhpet.location.label.comments"/>',
        	        	  	'<s:text name="bid.grid.created.date"/>',
        	        	   	'<s:text name="bid.grid.created.by"/>'
			],
      	   		colModel:[
	      	      	{name:'id',index:'id', hidden:true, width:'100%'},
	      	      	{name:'act',index:'act', width:'50%',search:false},
	      	   		{name:'nameAl',index:'nameAl',width:'100%'},
	      	   		{name:'nameLa',index:'nameLa',width:'100%'},
	      	   		{name:'nameEn',index:'nameEn',width:'100%'},
	      	   		{name:'nameSr',index:'nameSr',width:'100%'},
	      	   		{name:'hunt_seasone',index:'hunt_seasone',width:'100%'},
	      	 		{name:'hunt_forbidden_seasone',index:'hunt_forbidden_seasone',width:'100%'},
	      	  	 	{name:'note',index:'note',width:'100%'},
		      	   	{name:'createdDate',index:'createdDate',width:'100%',align:"center"},
		      	  	{name:'createdBy',index:'createdBy',width:'100%'}
      	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#wildanimal_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#wildanimal_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DhpetWildAnimals','#wildanimal_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#wildanimal_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "WildAnimal.board.do?dhpetWildAnimalId=" + rowData.id;
    				$('#dhpetWildAnimalId').val(rowData.id);
    				loadURL(link, $("#wildanimal_board_content"));
   				}        		
        	});

        	jQuery("#wildanimal_grid").jqGrid('navGrid','#wildanimal_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true}).navButtonAdd('#wildanimal_grid_pager',{
             	   	   caption:"", 
            	   	   title:"<s:text name="label.button.edit"/>", 
            	   	   buttonicon:"ui-icon-pencil", 
            	   	   onClickButton: function(){ 
            	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            	   			if(iRow){
            					var rowData = jQuery(this).getRowData(iRow);
            					var link = "WildAnimal.board.do?dhpetWildAnimalId=" + rowData.id;
            					$('#dhpetWildAnimalId').val(rowData.id);
            					loadURL(link, $("#wildanimal_board_content"));
            	   			}else{
            	   	   			alert("<s:text name="global.please.select.row"/>");
            	   	   		}   
            	   	   }, 
            	   	   position:"last"
             });
//         	jQuery("#wildanimal_grid").navButtonAdd('#wildanimal_grid_pager',{
//       	   	   caption:"", 
//      	   	   title:"<s:text name="label.button.edit"/>", 
//      	   	   buttonicon:"ui-icon-print", 
//      	   	   onClickButton: function(){ 
//      				   var link = "WildAnimal.popupReport.do";
//     			   	   openDialogForm('report_generator_content',link,"<s:text name="label.button.report.generator"/>",800,180);
//      	   	   }, 
//      	   	   position:"last"
//     		  });
        });

        

        $(window).bind('resize', function() {
            var width = $('#jqGrid_wildanimal_container').width();
            $('#wildanimal_grid').setGridWidth(width);
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
			<div id="jqGrid_wildanimal_container">
				<table id="wildanimal_grid" class="scroll"></table> 
				<div id="wildanimal_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	