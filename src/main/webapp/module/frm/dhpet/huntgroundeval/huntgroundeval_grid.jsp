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
        	jQuery("#huntgroundeval_grid").jqGrid({
        	   	url:'DhpetGrid.dhpetHuntGroundEvalGrid.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{annualplanId:$("#annualplanId").val(),animalLocationId:$("#w_animal_location_id").val()},
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
        	        	   	'<s:text name="dhpet.maint.of.mong.grid.location"/>',
        	        	   	'<s:text name="dhpet.animal.capacity.label.wild.animals"/>',
        	        	   	'<s:text name="annual.plan.year"/>',
        	        	   	'<s:text name="dhpet.maint.of.mong.label.request.for"/>',
        	        	   	'<s:text name="dhpet.maint.of.mong.label.max.point"/>',
        	        	   	'<s:text name="dhpet.maint.of.mong.label.defined.point"/>',
        	    			'<s:text name="planting.stand.impl.created.date"/>',
	        	        	'<s:text name="planting.stand.impl.created.by"/>'
        	        	   	
			],
      	   		colModel:[
	      	      	{name:'id',index:'id', hidden:true, width:'100%',search:false},
	      	        {name:'act',index:'act', width:'20%',search:false},
	      	   		{name:'dhpetLocation',index:'dhpetLocation',hidden:true,width:'100%',search:false},
	      	   		{name:'dhpetWildAnimals',index:'dhpetWildAnimals',hidden:true, width:'100%',search:false},
	      	   		{name:'year',index:'year', width:'100%',hidden:true,align:'center',search:false},
	      	   		{name:'requestFor',index:'requestFor',width:'100%',search:false},
	      	   		{name:'maxPoint',index:'maxPoint',width:'100%',align:"center",search:false},
	      	   		{name:'definedPoint',index:'definedPoint',width:'100%',align:"center",search:false},
					{name:'createdDate',index:'createdDate', width:'100%',align:"center", search:false},
        	   		{name:'createdBy',index:'createdBy', width:'100%', search:false}
      	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#huntgroundeval_grid_pager',
        		gridComplete: function(){
        			var ids = jQuery("#huntgroundeval_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('DhpetHuntGroundEval','#huntgroundeval_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#huntgroundeval_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "HuntGroundEval.form.do?dhpetHuntGroundEvalId=" + rowData.id;
    				$('#dhpetHuntGroundEvalId').val(rowData.id);
    				loadURL(link, $("#huntgroundeval_form_content"));
   				}        		
        	});
//         	jQuery("#huntgroundeval_grid").jqGrid('filterToolbar',{searchOperators : true});

        	jQuery("#huntgroundeval_grid").jqGrid('navGrid','#huntgroundeval_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true}).navButtonAdd('#huntgroundeval_grid_pager',{
             	   	   caption:"", 
            	   	   title:"<s:text name="label.button.edit"/>", 
            	   	   buttonicon:"ui-icon-pencil", 
            	   	   onClickButton: function(){ 
            	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            	   			if(iRow){
            					var rowData = jQuery(this).getRowData(iRow);
            					var link = "HuntGroundEval.form.do?dhpetHuntGroundEvalId=" + rowData.id;
            					$('#dhpetHuntGroundEvalId').val(rowData.id);
            					loadURL(link, $("#huntgroundeval_form_content"));
            	   			}else{
            	   	   			alert("<s:text name="global.please.select.row"/>");
            	   	   		}   
            	   	   }, 
            	   	   position:"last"
             });
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_huntgroundeval_container').width();
            $('#huntgroundeval_grid').setGridWidth(width);
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
			<div id="jqGrid_huntgroundeval_container">
				<table id="huntgroundeval_grid" class="scroll"></table> 
				<div id="huntgroundeval_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	