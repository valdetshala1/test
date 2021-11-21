<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	municipality = function (elem) {
		$(elem).autocomplete({
	        source: function(request, response) {
	            $.ajax({
	            	type:"get",
	                url: "Input.municipality.do",
	                dataType: "json",
	                data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						name_startsWith: request.term,
						orgtype: "D"
					},
					success: function( data ) {
						response( $.map( data, function(item ) {
							return {
								label: item.name,
	                            value: item.name,
	                            id: item.id
							};
						}));
					},
	                maxRows: 100,
	        		minLength: 0   
	            });
	        },
	        select: function(event, ui) {
	            $(elem).val(ui.item.value);
			     var grid = $("#annualplan_pvt_req_grid");
			     grid.jqGrid({
			         search:true, // if you want to force the searching
			         postData: { mun_id: ui.item.id}
			     });	     
			     $.extend(grid[0].p.postData,{mun_id: ui.item.id});
			     grid.trigger("reloadGrid",[{page:1}]);            
	        }  
	    });
	};

    initDateEdit = function (elem) {
        setTimeout(function () {
            $(elem).datepicker({
                dateFormat: "dd-M-yy",
                autoSize: true,
                //showOn: "button", // it dosn't work in searching dialog
                changeYear: true,
                changeMonth: true,
                showButtonPanel: true,
                showWeek: true
            });
        }, 100);
    };
    
    initDateSearch = function (elem) {
        setTimeout(function () {
            $(elem).datepicker({
                dateFormat: "dd-M-yy",
                autoSize: true,
                changeYear: true,
                changeMonth: true,
                showWeek: true,
                showButtonPanel: true
            });
        }, 100);
    };
    	
        var comp_id;
        $(document).ready(function () {
            var oplVal='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
        	jQuery("#annualplan_pvt_req_grid").jqGrid({
        	   	url:'FrmGrid.annualPlanningPvtReq.do',	
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
        	   	colNames:[ 'Id',
        	        	   '<s:text name="planting.stand.status"/>', 
        	   	           '<s:text name="annual.plan.municipality.id"/>',
        	   	            '<s:text name="annual.plan.municipality"/>',
        	   	        	'<s:text name="annual.plan.year"/>',
        	   	        	'<s:text name="ann.plan.created.by.id"/>',
        	   	        	'<s:text name="annual.plan.created.by"/>',
        	   	        	'<s:text name="annual.plan.remarks"/>',
        	   	        	'<s:text name="annual.plan.status.remarks"/>',
        	   	  			'<s:text name="annual.plan.status.code"/>',
        	   				'<s:text name="annual.plan.status"/>',
        	   				'<s:text name="annual.plan.status.id"/>',
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'status_icon',index:'status_icon', width:'100%', sortable:true, align:"left", editable:false, frozen:true, search:true, stype:'select', 
        	   			searchoptions:{sopt:['eq','ne'], value: ':;NEW:New;SUB:Submitted;APR:Approved'}
                	},
        	   		{name:'mun_id',index:'mun_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'mun_name',index:'mun_name', width:'100%',align:"right", sorttype:'string', 
            	   		searchoptions:{
            	   			sopt:['eq','bw','bn','cn','nc','ew','en'],
            	   			dataInit: municipality
                       }
        	   		},
        	   		
        	   		{name:'year',index:'year', width:'100%',align:"right", sorttype:'number', searchoptions:{sopt:['eq','bw','bn','cn','nc','ew','en']}},
        	   		/*
                    { name: "year", index: "year", width: 80, align: "center", sorttype: "date",
                        formatter: "date", formatoptions: { newformat: "d-M-Y" }, editable: true, datefmt: "d-M-Y",
                        editoptions: { dataInit: initDateEdit },
                        searchoptions: { sopt: ["eq", "ne", "lt", "le", "gt", "ge"], dataInit: initDateSearch } },
                    */            	   		
        	   		{name:'created_by_id',index:'created_by_id', hidden:true, width:'100%',align:"right", search:false},
        	   		{name:'created_by',index:'created_by', hidden:false, width:'100%',align:"right", search:false},
        	   		{name:'remarks',index:'remarks', hidden:false, width:'100%',align:"right", search:false},
        	   		{name:'status_remarks',index:'status_remarks', width:'100%',align:"right", search:false},
        	   		{name:'status',index:'status', hidden:false, width:'100%',align:"right", search:false},
        	   		{name:'status_id',index:'status_id', hidden:true, width:'100%',align:"right", search:false},
        	   		{name:'status_code',index:'status_code', hidden:true, width:'100%',align:"right", search:false}
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#annualplan_pvt_req_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "<s:text name="annual.plan.menu"/>", 
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery("#annualplan_pvt_req_grid").getRowData(iRow); 
    				var link = "Annualplan.form.do?annualplanId=" + rowData.id;
    				loadURL(link, $("#annualplan_form_content"));
   				},
   				onSelectRow: function(ids) { 
   					var rowData = jQuery("#annualplan_pvt_req_grid").getRowData(ids);
   	   				if(rowData) { 
  	  	   	   			jQuery("#stand_grid").jqGrid('setGridParam',{url:"FrmGrid.stands.do?comp_id="+rowData.id}); 
   						jQuery("#stand_grid").trigger('reloadGrid'); 
   						}
				}      		

        	});

        	jQuery("#annualplan_pvt_req_grid").jqGrid('filterToolbar',{searchOperators : true});

              	
        	jQuery("#annualplan_pvt_req_grid").jqGrid('navGrid','#annualplan_pvt_req_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
//         			.navButtonAdd('#annualplan_pvt_req_grid_pager',{
// 		   	   caption:"", 
// 		   	   title:"<s:text name="label.button.edit"/>",  
// 		   	   buttonicon:"ui-icon-pencil", 
// 		   	   onClickButton: function(){ 
// 		   			var iRow = jQuery("#annualplan_pvt_req_grid").jqGrid('getGridParam','selrow');
// 		   			if(iRow){
// 						var rowData = jQuery("#annualplan_pvt_req_grid").getRowData(iRow); 
// 						var link = "Annualplan.form.do?annualplanId=" + rowData.id;
// 	    				loadURL(link, $("#annualplan_form_content"));
// 		   			}else{
// 		   	   			alert("<s:text name="global.please.select.row"/>"); 
// 		   	   		}   
// 		   	   }, 
// 		   	   position:"last"
// 		   	})
		   	.navButtonAdd('#annualplan_pvt_req_grid_pager',{
		   	   caption:"",
		   	   title:"<s:text name="label.button.start.create.request"/>",  
		   	   buttonicon: "ui-icon-gear", 
		   	   onClickButton: function(){ 
		   		var iRow = jQuery("#annualplan_pvt_req_grid").jqGrid('getGridParam','selrow');
					if(iRow){
						var rowData = jQuery("#annualplan_pvt_req_grid").getRowData(iRow); 
						var link = "PrivateRequest.page.do?annualplanId=" + rowData.id;
						loadURL(link, $("#annualplan_pvt_req_content"));

					}else{
			   			alert("<s:text name="global.please.select.row"/>"); 
			   		} 
		   		
		   	   }, 
		   	   position:"last"
	   	});
        	
    	   	
 

       
        $(window).bind('resize', function() {
            var width = $('#jqGrid_comp_container').width();
            $('#annualplan_pvt_req_grid').setGridWidth(width);
            $('#stand_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_comp_container">
				<table id="annualplan_pvt_req_grid" class="scroll"></table> 
				<div id="annualplan_pvt_req_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			<input id="compId" value="<s:property value='compId'/>" type="hidden">
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
