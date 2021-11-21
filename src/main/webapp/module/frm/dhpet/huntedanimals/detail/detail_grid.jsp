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
        	jQuery("#huntdetail_grid").jqGrid({
        	   	url:'DhpetGrid.huntedAnimalDetail.do?',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{huntAnimalId:$("#huntAnimalId").val()},
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
        	        	   	'animal_location_id',
        	        	   	'<s:text name="label.person.gender"/>',
        	        	   	'<s:text name="hunt.deathCause"/>',
        	        	   	'<s:text name="animal.location.detail.age.type"/>',
         	        	   	'<s:text name="vehicles.label.weight"/>',
         	        	   	'<s:text name="hunt.animalsNumber"/>',
							'<s:text name="dhpet.location.label.comments"/>',
							'<s:text name="planting.stand.impl.created.date"/>',
	        	        	'<s:text name="planting.stand.impl.created.by"/>',
			],
      	   		colModel:[
	      	      	{name:'id',index:'id', hidden:true, width:'100%',search:false},
		      	    {name:'hunted_animal_id',index:'hunted_animal_id', hidden:true, width:'100%',search:false},
	      	   		{name:'gender',index:'gender',width:'100%',search:false},
	      	   		{name:'death_cause',index:'death_cause',width:'100%',align:"center",search:false},
	      	   		{name:'age',index:'age',width:'100%',search:false},
	      	   		{name:'weight',index:'weight',width:'100%',search:false},
	      	   		{name:'animals_number',index:'animals_number',width:'100%',search:false},
					{name:'notes',index:'notes',width:'100%',search:false},
					{name:'created_date',index:'created_date', width:'100%',align:"center", search:false},
        	   		{name:'created_by',index:'created_by', width:'100%', search:false}
      	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#huntdetail_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "DhpetHuntedAnimalDetail.form.do?huntDetailId=" + rowData.id;
    				loadURL(link, $("#huntdetail_form_content"));
   				}        		
        	});

//         	jQuery("#huntdetail_grid").jqGrid('filterToolbar',{searchOperators : true});

        	jQuery("#huntdetail_grid").jqGrid('navGrid','#huntdetail_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true}).navButtonAdd('#huntdetail_grid_pager',{
             	   	   caption:"", 
            	   	   title:"<s:text name="label.button.edit"/>", 
            	   	   buttonicon:"ui-icon-pencil", 
            	   	   onClickButton: function(){ 
            	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            	   			if(iRow){
            	   				var rowData = jQuery(this).getRowData(iRow); 
                				var link = "DhpetHuntedAnimalDetail.form.do?huntDetailId=" + rowData.id;
            					loadURL(link, $("#huntdetail_form_content"));
            	   			}else{
            	   	   			alert("<s:text name="global.please.select.row"/>");
            	   	   		}   
            	   	   }, 
            	   	   position:"last"
             });
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_huntdetail_container').width();
            $('#huntdetail_grid').setGridWidth(width);
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
			<div id="jqGrid_huntdetail_container">
				<table id="huntdetail_grid" class="scroll"></table> 
				<div id="huntdetail_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	