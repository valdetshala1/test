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
        	jQuery("#animalcapacity_grid").jqGrid({
        	   	url:'DhpetGrid.animalCapacityGrid.do?',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{annualplanId:$("#annualplanId").val()},
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
        	        	   	'<s:text name="dhpet.animal.capacity.label.habitat.location"/>',
        	        	   	'<s:text name="dhpet.animal.capacity.label.wild.animals"/>',
        	        	   	'<s:text name="annual.plan.year"/>',
        	        	   	'<s:text name="dhpet.animal.capacity.label.use.of.land"/>',
        	        	   	'<s:text name="dhpet.animal.capacity.label.area"/>',
        	        	   	'<s:text name="dhpet.animal.capacity.label.percentage"/>',
        	    			'<s:text name="planting.stand.impl.created.date"/>',
	        	        	'<s:text name="planting.stand.impl.created.by"/>'
			],
      	   		colModel:[
	      	      	{name:'id',index:'id', hidden:true, width:'100%',search:false},
	      	        {name:'act',index:'act', width:'20%',search:false},
	      	   		{name:'dhpetLocation',index:'dhpetLocation',hidden:true,width:'100%',search:false},
	      	   		{name:'animal',index:'animal',hidden:true,width:'100%',search:false},
	      	   		{name:'year',index:'year',hidden:true,width:'100%',align:'center', search:false},
	      	   		{name:'useOfLand',index:'useOfLand', width:'100%',search:false},
	      	   		{name:'area',index:'area',width:'100%',align:"center",search:false},
	      	   		{name:'percentage',index:'percentage',width:'100%',align:"center",search:false},
	      	    	{name:'created',index:'created', width:'100%',align:"center", search:false},
    	   		    {name:'createdBy',index:'createdBy', width:'100%', search:false}
      	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#animalcapacity_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#animalcapacity_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DhpetAnimalCapacity','#animalcapacity_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#animalcapacity_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "AnimalCapacity.form.do?dhpetAnimalCapacityId=" + rowData.id;
    				$('#dhpetAnimalCapacityId').val(rowData.id);
    				loadURL(link, $("#animalcapacity_form_content"));
   				}        		
        	});
//         	jQuery("#animalcapacity_grid").jqGrid('filterToolbar',{searchOperators : true});

        	jQuery("#animalcapacity_grid").jqGrid('navGrid','#animalcapacity_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true}).navButtonAdd('#animalcapacity_grid_pager',{
             	   	   caption:"", 
            	   	   title:"<s:text name="label.button.edit"/>", 
            	   	   buttonicon:"ui-icon-pencil", 
            	   	   onClickButton: function(){ 
            	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            	   			if(iRow){
            					var rowData = jQuery(this).getRowData(iRow);
            					var link = "AnimalCapacity.form.do?dhpetAnimalCapacityId=" + rowData.id;
            					$('#dhpetAnimalCapacityId').val(rowData.id);
            					loadURL(link, $("#animalcapacity_form_content"));
            	   			}else{
            	   	   			alert("<s:text name="global.please.select.row"/>");
            	   	   		}   
            	   	   }, 
            	   	   position:"last"
             });
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_animalcapacity_container').width();
            $('#animalcapacity_grid').setGridWidth(width);
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
			<div id="jqGrid_animalcapacity_container">
				<table id="animalcapacity_grid" class="scroll"></table> 
				<div id="animalcapacity_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	