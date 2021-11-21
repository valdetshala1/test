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
        	jQuery("#leaveentitlement_grid").jqGrid({
        	   	url:'HrmGrid.leaveEntitlement.do',	
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
        	        	   	'<s:text name="leave.ent.label.employee"/>',
        	        	 	  '<s:text name="label.person.firstname"/>', 
            	        	  '<s:text name="label.person.lastname"/>',
        	        	   	
        	        	   	'<s:text name="leave.ent.label.leave.type"/>',
        	        	   	'<s:text name="leave.ent.label.number.of.days"/>',
        	        	   	'<s:text name="leave.ent.label.days.used"/>',
        	        	   	'<s:text name="leave.ent.label.date"/>',
        	        	   	'<s:text name="leave.ent.label.note"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%',search:false},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'employee_id',index:'employee_id', hidden:true, width:'100%',align:"left",search:true},
        	   		{name:'first_name',index:'p.first_name', width:'100%', align:"center",search:true},
        	   		{name:'last_name',index:'p.last_name', width:'100%', align:"center",search:true},
        	   		{name:'leave_type_id',index:'leave_type_id', width:'100%',align:"left",search:false},
        	   		{name:'no_of_days',index:'no_of_days', width:'100%',align:"center",search:false},
        	   		{name:'days_used',index:'days_used', width:'100%',align:"center",search:false},
        	   		{name:'date',index:'date', width:'100%',align:"center",search:false, sortable:false},
        	   		{name:'note',index:'note', width:'100%',align:"left",search:false, sortable:false},
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#leaveentitlement_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#leaveentitlement_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('LeaveEntitlement','#leaveentitlement_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#leaveentitlement_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'l.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "LeaveEntitlement.form.do?leaveEntitlementId=" + rowData.id;
    				loadURL(link, $("#leaveentitlement_form_content"));
   				}        		

        	});
              	
        	jQuery("#leaveentitlement_grid").jqGrid('navGrid','#leaveentitlement_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.jqGrid('filterToolbar',{searchOperators : true})
        			.navButtonAdd('#leaveentitlement_grid_pager',{
					   	   caption:"", 
					   	   title:'<s:text name="label.button.edit"/>',
					   	   buttonicon:"ui-icon-pencil", 
					   	   onClickButton: function(){ 
					   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
					   			if(iRow){
									var rowData = jQuery(this).getRowData(iRow); 
									var link = "LeaveEntitlement.form.do?leaveEntitlementId=" + rowData.id;
									loadURL(link, $("#leaveentitlement_form_content"));
					   			}else{
					   				alert("<s:text name="tender.request.alarm"/>");
					   	   		}   
					   	   }, 
					   	   position:"last"
					   	});
//    	.navButtonAdd('#leaveentitlement_grid_pager',{
//    	   caption:"",
//    	   title:'<s:text name="label.button.delete"/>',
//    	   buttonicon:"ui-icon-trash", 
//    	   onClickButton: function(){ 
//    	      alert("<s:text name="alarm.deleting.row"/>");
//    	   }, 
//    	   position:"last"
//    	});

        $(window).bind('resize', function() {
            var width = $('#jqGrid_emp_container').width();
            $('#leaveentitlement_grid').setGridWidth(width);
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

			<div id="jqGrid_emp_container">
				<table id="leaveentitlement_grid" class="scroll"></table> 
				<div id="leaveentitlement_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
