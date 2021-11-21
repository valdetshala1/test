<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
.ui-th-column-header{text-align: center;}
</style>
<script type="text/javascript">
        $(document).ready(function () {
        	jQuery("#confiscation_grid").jqGrid({
        	   	url:'FrmGrid.confiscationReport.do',
        	   	postData: {confType: "CO", startDate: $("#confiscationDateStart").val() , endDate:$("#confiscationDateEnd").val()},	
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
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:[ 'Id',
        	        	   	'',
        	        	   	'<s:text name="annual.plan.municipality"/>',
        	        		'<s:text name="frm.confiscaation.date"/>',
        	        		'<s:text name="hum.employee.label.notes"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>',
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'200%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'municipality',index:'municipality', hidden:false, width:'250%',align:"center"},
        	   		{name:'confiscation_date',index:'confiscation_date', width:'250%',align:"center"},
        	        {name:'remarks',index:'remarks', width:'320%',align:"center",sortable:false},
        	   		{name:'created_by',index:'created_by', width:'250%',align:"right", search:false},
        	   		{name:'created_date',index:'created_date', width:'200%',align:"center", search:false}
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#confiscation_grid_pager',
        	   	sortname: 'c.id',
        	   	gridComplete: function(){
        			var ids = jQuery("#confiscation_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('FireReport','#confiscation_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#confiscation_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        	    multiselect: true,
        		multiboxonly:true,
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery("#confiscation_grid").getRowData(iRow); 
					var link = "Confiscation.form.do?confiscationId=" + rowData.id;
					loadURL(link, $("#confiscation_form_content"));
   				},
   				onSelectRow: function(ids) { 
				}      		

        	});

        	jQuery("#confiscation_grid").jqGrid('navGrid','#confiscation_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        	.navButtonAdd('#confiscation_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="label.button.edit"/>", 
		   	   buttonicon:"ui-icon-pencil", 
		   	   onClickButton: function(){
		   			var iRow = jQuery("#confiscation_grid").jqGrid('getGridParam','selrow');
		   			if(iRow){
						var rowData = jQuery("#confiscation_grid").getRowData(iRow); 
						var link = "Confiscation.form.do?confiscationId=" + rowData.id;
						loadURL(link, $("#confiscation_form_content"));
		   			}else{
		   	   			alert("<s:text name="global.please.select.row"/>");
		   	   		}   
		   	   }, 
		   	   position:"last"
		   	})
		   	.navButtonAdd('#confiscation_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="rbac.permission.grid.print"/>", 
		   	   buttonicon:"ui-icon-print",
		   	   id:"confiscation_print", 
		   	   onClickButton: function(){
			   	   $("#confiscation_print").addClass("ui-state-disabled");
			   	   var url="Confiscation.reportGenerator.do";
		   			openDialogForm('confiscation_report_generator',url,'',500,500); 
		   	   }, 
		   	   position:"last"
		   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_confiscation_container').width();
            $('#confiscation_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>

		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_confiscation_container">
				<table id="confiscation_grid" class="scroll"></table> 
				<div id="confiscation_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
