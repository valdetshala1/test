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
        	jQuery("#fire_grid").jqGrid({
        	   	url:'FrmGrid.fireReport.do',	
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
        	        	   	'<s:text name="frm.compartment.region.name"/>',
        	        	   	'<s:text name="annual.plan.municipality"/>',
        	        	   	'<s:text name="frm.compartment.mu.name"/>',
        	   	           	'<s:text name="fire.fire.type"/>',
        	   	         	'<s:text name="fire.fire.cause"/>',
        	        	   	'<s:text name="fire.occurrence.date"/>',
        	        	   	'<s:text name="fire.extinguish.date"/>',
        	        	   	'<s:text name="fire.extinguish.by"/>',
        	        	   	'<s:text name="fire.damage.m3"/>',
        	        	   	'<s:text name="fire.damage.m2"/>',
        	        	   	'<s:text name="fire.damage.euro"/>',
        	        	   	'<s:text name="fire.damage.m3"/>',
        	        	   	'<s:text name="fire.damage.m2"/>',
        	        	   	'<s:text name="fire.damage.euro"/>',

        	        	   	'<s:text name="fire.proposed.action"/>',
        	        	   	'<s:text name="doc.name"/>',
        	        	   	'<s:text name="hum.employee.label.notes"/>',

        	        	   	'<s:text name="finance.payment.created.by"/>',
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false},
        	   		{name:'region',index:'region', width:'100%',align:"center"},
        	   		{name:'municipality',index:'municipality', hidden:false, width:'100%',align:"center"},
        	   		{name:'management_unit',index:'management_unit', width:'100%',align:"center"},
        	   		{name:'fire_type',index:'fire_type', width:'100%',align:"center"},
        	   		{name:'fire_cause',index:'fire_cause', width:'100%',align:"center"},
        	   		{name:'occurrence_date',index:'occurrence_date', width:'100%',align:"center"},
        	   		{name:'extinguish_date',index:'extinguish_date', width:'100%',align:"center", search:false},
        	   		{name:'extinguished_by',index:'extinguished_by', width:'100%',align:"center", search:false},

        	   		{name:'pub_damage_m3',index:'pub_damage_m3', width:'100%',align:"center"},
        	   		{name:'pub_damage_m2',index:'pub_damage_m2', width:'100%',align:"center"},
        	   		{name:'pub_damage_euro',index:'pub_damage_euro', width:'100%',align:"center"},

        	   		{name:'pvt_damage_m3',index:'pvt_damage_m3', width:'100%',align:"center"},
        	   		{name:'pvt_damage_m2',index:'pvt_damage_m2', width:'100%',align:"center"},
        	   		{name:'pvt_damage_euro',index:'pvt_damage_euro', width:'100%',align:"center"},

        	   		{name:'proposed_action',index:'proposed_action', width:'100%',align:"center"},
        	   		{name:"doc_name",index:"doc_name",width:'100%',sortable:false,align:'left',
        	        	 formatter: function (cellvalue, options, rowObject) {
        	        		 return '<a href="FireReportDoc.do?docId=' + rowObject.id + '" target="_blank"><span style="color:blue"><u>' + cellvalue +  '</u></span></a>';
        	             }
        	        },
        	        {name:'comment',index:'comment', width:'100%',align:"center",sortable:false},
        	         
        	   		{name:'created_by',index:'created_by', width:'100%',align:"right", search:false},
        	   		{name:'created_date',index:'created_date', width:'100%',align:"center", search:false}
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#fire_grid_pager',
        	   	sortname: 'f.id',
        	   	gridComplete: function(){
        			var ids = jQuery("#fire_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('FireReport','#fire_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#fire_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        	    multiselect: true,
        		multiboxonly:true,
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery("#fire_grid").getRowData(iRow); 
    				var link = "FireReport.form.do?fireId=" + rowData.id;
    				loadURL(link, $("#fire_form_content"));
   				},
   				onSelectRow: function(ids) { 
				}      		

        	});

        	jQuery("#fire_grid").jqGrid('navGrid','#fire_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        	.navButtonAdd('#fire_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="label.button.edit"/>", 
		   	   buttonicon:"ui-icon-pencil", 
		   	   onClickButton: function(){
		   			var iRow = jQuery("#fire_grid").jqGrid('getGridParam','selrow');
		   			if(iRow){
						var rowData = jQuery("#fire_grid").getRowData(iRow); 
						var link = "FireReport.form.do?fireId=" + rowData.id;
						loadURL(link, $("#fire_form_content"));
		   			}else{
		   	   			alert("<s:text name="global.please.select.row"/>");
		   	   		}   
		   	   }, 
		   	   position:"last"
		   	})
		   	.navButtonAdd('#fire_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="rbac.permission.grid.print"/>", 
		   	   buttonicon:"ui-icon-print",
		   	   id:"fire_print", 
		   	   onClickButton: function(){
			   	   $("#fire_print").addClass("ui-state-disabled");
			   	   var url="FireReport.reportGenerator.do";
		   			openDialogForm('fire_report_generator',url,'',500,500); 
		   	   }, 
		   	   position:"last"
		   	})
		   	.jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                    {startColumnName: 'pub_damage_m3', numberOfColumns: 3, titleText: '<em><s:text name="fire.public.forest.legend"/></em>'},
                    {startColumnName: 'pvt_damage_m3', numberOfColumns: 3, titleText: '<em><s:text name="fire.private.forest.legend"/></em>'},
                ]});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_fire_container').width();
            $('#fire_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_fire_container">
				<table id="fire_grid" class="scroll"></table> 
				<div id="fire_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
