<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">

        $(document).ready(function () {
        	jQuery("#leave_grid").jqGrid({
        	   	url:'HrmGrid.leave.do?q=2',	
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
        	        	   	'<s:text name="hum.employee.grid.from.date"/>', 
        	        	   	'<s:text name="leave.ent.label.to.date"/>', 
        	        	   	'<s:text name="hrm.leave.label.days.requested"/>',
        	        	   	'<s:text name="annu.appprivate.label.status"/>',
        	        	   	'<s:text name="hrm.skill.label.attachment"/>',
        	        	   	'<s:text name="hum.employee.label.document"/>'
        	    ],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden:true, width:'100%',search:false},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'employee',index:'employee', hidden:true, width:'100%',search:false},
           	   		{name:'first_name',index:'p.first_name', width:'100%',search:true},
           	   		{name:'last_name',index:'p.last_name', width:'100%',search:true},        	   		
        	   		{name:'leave_type',index:'leave_type', width:'100%',search:false},
        	   		{name:'from_date',index:'from_date', width:'100%', align:"center",search:false},
        	   		{name:'to_date',index:'to_date', width:'100%', align:"center",search:false},
        	   		{name:'days_requested',index:'days_requested', width:'100%', align:"center",search:false},
        	   		{name:'status',index:'status', width:'100%',align:"left",search:false},
        	   		{name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'},	
        	   		{name:'doc',index:'doc', width:'100%',align:"left",hidden:true,search:false}
            	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#leave_grid_pager',
        	   	sortname: 'l.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Leave.form.do?leaveId=" + rowData.id;
    				loadURL(link, $("#leave_form_content"));
   				},
	       		gridComplete: function(){
   		       		var ids = jQuery("#leave_grid").jqGrid('getDataIDs');
	   				for(var i=0;i < ids.length;i++){
	   					var cl = ids[i];
    					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Leave','#leave_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
  				       jQuery("#leave_grid").jqGrid('setRowData',ids[i],{act:au});
	   				 	var doc = $(this).getCell(ids[i],"doc");
 				        if(doc == "true") {
				        	var url="LeaveDoc.do?attachmentId="+jQuery("#leave_grid").jqGrid().getRowData(ids[i]).id;
				        	be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
				        	jQuery("#leave_grid").jqGrid('setRowData',ids[i],{generate:be});
					        }

	   				}
  				}        		
        	});
              	
        	jQuery("#leave_grid").jqGrid('navGrid','#leave_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.jqGrid('filterToolbar',{searchOperators : true});
//         	jQuery("#leave_grid").jqGrid('navButtonAdd', '#leave_grid_pager', 
//                 	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
//                 	onClickButton: function() {
//                 		jQuery("#leave_grid").jqGrid('columnChooser');
//              }});
        	jQuery("#leave_grid").jqGrid('navButtonAdd', '#leave_grid_pager', 
                	{ caption: "", buttonicon: "ui-icon-pencil", title: '<s:text name="label.button.edit"/>',
                	onClickButton: function() {
            			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            			if(iRow){
            				var rowData = jQuery(this).getRowData(iRow);
            				var link = "Leave.form.do?leaveId=" + rowData.id;
            				loadURL(link, $("#leave_form_content"));
            			}else{
            				alert("<s:text name="tender.request.alarm"/>");
            	   		}
             }});
        	$("#leave_grid").navButtonAdd('#leave_grid_pager',{
         	   caption:"", 
         	   title:'<s:text name="label.button.edit"/>'+' status', 
         	   buttonicon:"ui-icon-shuffle", 
         	   onClickButton: function(){ 
         			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	    	   			if(iRow){
	    					var rowData = jQuery(this).getRowData(iRow);
	    					$("#statusId").val(rowData.id);
	    					var link = "Leave.statusForm.do?leaveId="+rowData.id;
		    				openDialogForm('status_container',link,"<s:text name="adm.humman.resource.leave.status"/>",800,650);
	    	   			}else{
	    	   				alert("<s:text name="tender.request.alarm"/>");
	    	   	   		}   
         	   }, 
         	   position:"last"
         	})
         	.navButtonAdd('#leave_grid_pager',{
		   	   caption:"",
		   	   title:"<s:text name="report.grid.caption"/>",  
		   	   buttonicon:"ui-icon-print", 
		   	   onClickButton: function(){ 
		   	      var link="Leave.reportGenerator.do";
		   	      openDialogForm("leave_report_generator",link,"<s:text name="label.employee.list"/>",550,500);
		   	   }, 
		   	   position:"last"
		   	});
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_leave_container').width();
            $('#leave_grid').setGridWidth(width);
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

			<div id="jqGrid_leave_container">
				<table id="leave_grid" class="scroll"></table> 
				<div id="leave_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			<input type="hidden" id="statusId" name="statusId" value="<s:property value='statusId'/>">
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
