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
        	jQuery("#leavetype_grid").jqGrid({
        	   	url:'HrmGrid.leaveType.do',	
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
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id',
        	        	   	'',
        	        	   	'<s:text name="leave.type.label.name"/>', 
        	        	   	'<s:text name="leave.type.label.name.en"/>', 
        	        	   	'<s:text name="leave.type.label.name.sr"/>',
        	        	   	'<s:text name="leave.type.label.code"/>',
        	        	   	'<s:text name="leave.type.grid.is.paid"/>', 
        	        	   	'<s:text name="leave.type.grid.is.awol"/>',
        	        	   	'<s:text name="leave.type.grid.is.annual"/>', 
        	        	   	'<s:text name="leave.type.grid.exclude.en.reports.if.no.entitlement"/>', 
        	        	   	'<s:text name="leave.type.operational.contry.id"/>',
        	        	   	'<s:text name="leave.type.label.bg.color"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'name',index:'name', width:'100%'},
        	   		{name:'nameEn',index:'nameEn', width:'100%'},
        	   		{name:'nameSr',index:'nameSr', width:'100%', align:"center"},
        	   		{name:'code',index:'code', width:'100%', align:"center"},
        	   		{name:'ispaid',index:'ispaid', width:'100%', align:"center",hidden:true},
        	   		{name:'isawol',index:'isawol', width:'100%', align:"center",hidden:true},				
        	   		{name:'isannual',index:'isannual', width:'100%', align:"center",hidden:true},		
//         	   		{name:'deleted',index:'deleted', width:'100%', align:"center"},
        	   		{name:'excludeInReportsIfNoEntitlement',index:'excludeInReportsIfNoEntitlement',hidden:true, width:'100%', align:"center"},
        	   		{name:'operationalCountryId',index:'operationalCountryId', width:'100%', align:"center",hidden:true},
        	   		{name:'bgColor',index:'bgColor', width:'100%', align:"center",hidden:true},
        	   			
            	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#leavetype_grid_pager',
        	 	gridComplete: function(){
        			var ids = jQuery("#leavetype_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('LeaveType','#leavetype_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#leavetype_grid").jqGrid('setRowData',ids[i],{act:au});
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
    				var link = "LeaveType.form.do?leaveTypeId=" + rowData.id;
    				loadURL(link, $("#leavetype_form_content"));
   				}        		

        	});
              	
        	jQuery("#leavetype_grid").jqGrid('navGrid','#leavetype_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        	.navButtonAdd('#leavetype_grid_pager',{
        	   	   caption:"", 
        	   	   title:'<s:text name="label.button.edit"/>',
        	   	   buttonicon:"ui-icon-pencil", 
        	   	   onClickButton: function(){ 
        	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        	   			if(iRow){
        					var rowData = jQuery(this).getRowData(iRow); 
        					var link = "LeaveType.form.do?leaveTypeId=" + rowData.id;
        					loadURL(link, $("#leavetype_form_content"));
        	   			}else{
        	   				alert("<s:text name="tender.request.alarm"/>");
        	   	   		}   
        	   	   }, 
        	   	   position:"last"
        	   	});

        $(window).bind('resize', function() {
            var width = $('#jqGrid_emp_container').width();
            $('#leavetype_grid').setGridWidth(width);
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
				<table id="leavetype_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="leavetype_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
