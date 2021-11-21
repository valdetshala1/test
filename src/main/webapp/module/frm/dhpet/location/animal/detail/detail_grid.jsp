<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	jQuery("#locationdetail_grid").jqGrid({
        	   	url:'DhpetGrid.animalLocationDetail.do?',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{animalLocationId:$("#w_animal_location_id").val()},
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
        	        	   	'animal_location_id',
        	        	   	'<s:text name="label.person.gender"/>',
        	        	   	'<s:text name="animal.location.detail.age.type"/>',
         	        	   	'<s:text name="animal.quantity"/>',
							'<s:text name="dhpet.location.label.comments"/>',
							'<s:text name="planting.stand.impl.created.date"/>',
	        	        	'<s:text name="planting.stand.impl.created.by"/>',
			],
      	   		colModel:[
	      	      	{name:'id',index:'id', hidden:true, width:'100%',search:false},
	      	        {name:'act',index:'act', width:'20%',search:false},
		      	    {name:'animal_location_id',index:'animal_location_id', hidden:true, width:'100%',search:false},
	      	   		{name:'gender',index:'gender',width:'100%',search:false},
	      	   		{name:'age_type',index:'age_type',width:'100%',align:"center",search:false},
	      	   		{name:'quantity',index:'quantity',width:'100%',search:false},
					{name:'note',index:'note',width:'100%',search:false},
					{name:'created_date',index:'created_date', width:'100%',align:"center", search:false},
        	   		{name:'created_by',index:'created_by', width:'100%', search:false}
      	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#locationdetail_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#locationdetail_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DhpetAnimalLocationDetail','#locationdetail_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#locationdetail_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "DhpetAnimalLocationDetail.form.do?locationDetailId=" + rowData.id;
    				loadURL(link, $("#locationdetail_form_content"));
   				}        		
        	});

//         	jQuery("#locationdetail_grid").jqGrid('filterToolbar',{searchOperators : true});

        	jQuery("#locationdetail_grid").jqGrid('navGrid','#locationdetail_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true}).navButtonAdd('#locationdetail_grid_pager',{
             	   	   caption:"", 
            	   	   title:"<s:text name="label.button.edit"/>", 
            	   	   buttonicon:"ui-icon-pencil", 
            	   	   onClickButton: function(){ 
            	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            	   			if(iRow){
            	   				var rowData = jQuery(this).getRowData(iRow); 
                				var link = "DhpetAnimalLocationDetail.form.do?locationDetailId=" + rowData.id;
            					loadURL(link, $("#locationdetail_form_content"));
            	   			}else{
            	   	   			alert("<s:text name="global.please.select.row"/>");
            	   	   		}   
            	   	   }, 
            	   	   position:"last"
             });
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_locationdetail_container').width();
            $('#locationdetail_grid').setGridWidth(width);
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
			<div id="jqGrid_locationdetail_container">
				<table id="locationdetail_grid" class="scroll"></table> 
				<div id="locationdetail_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	