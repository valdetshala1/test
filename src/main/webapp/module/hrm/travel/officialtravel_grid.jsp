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
        	$('#officialTravel\\.returnDate').datetimepicker({
    			lang: 'al',
    			format: 'd.m.Y',
    			mask: false,
    			formatDate:'d.m.Y',
    			timepicker: false,
    		});
        	jQuery("#officialtravel_grid").jqGrid({
        	   	url:'HrmGrid.officialTravel.do',	
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
        	   	colNames:['Id',
        	        	   	'',
        	        	   	'<s:text name="report.damage.grid.label.employee"/>',
        	        		  '<s:text name="label.person.firstname"/>', 
            	        	  '<s:text name="label.person.lastname"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.type"/>',
        	        	   	'<s:text name="hrm.official.travel.label.reimburse"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.date"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.dest"/>',
        	        	   	'<s:text name="hrm.official.travel.label.reason"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.days.req"/>',
        	        	   	'<s:text name="annu.appprivate.label.status"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.req.user"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.req.date"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.req.comm"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.day.appr"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.appr.user"/>',
        	        	   	'<s:text name="hrm.official.travel.grid.appr.date"/>',
        	        	   	'<s:text name="hrm.official.travel.appr.comm"/>',
        	        	   	'<s:text name="hrm.official.travel.ret.date"/>',
        	        	   	'<s:text name="hrm.leave.label.days.spent"/>',
        	        	   	'<s:text name="hrm.skill.label.attachment"/>',
        	        	   	'<s:text name="hum.employee.label.document"/>'
        	    ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'employee_id',index:'employee_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'first_name',index:'p.first_name', width:'100%', align:"center",search:true},
        	   		{name:'last_name',index:'p.last_name', width:'100%', align:"center",search:true},
        	   		
        	   		{name:'travel_type',index:'travel_type', width:'100%',align:"center",search:false},
        	   		{name:'reimbursement_expenses',index:'reimbursement_expenses', width:'100%',align:"center",formatter:"checkbox",search:false},
        	   		{name:'date',index:'date', width:'100%',align:"center",search:false},
        	   		{name:'from_to',index:'from_to', width:'100%',align:"right",search:false},
        	   		{name:'reason',index:'reason', width:'100%',align:"right",search:false,sortable:false},
        	   		{name:'days_requested',index:'days_requested', width:'100%',align:"center",search:false},
        	   		{name:'status',index:'status', width:'100%',align:"right",search:false},
        	   		{name:'requested_user_id',index:'requested_user_id', width:'100%',align:"center",hidden:true,search:false},
        	   		{name:'requested_date',index:'requested_date', width:'100%',align:"right",search:false,sortable:false,},
        	   		{name:'requested_comments',index:'requested_comments', width:'100%',align:"right",search:false,sortable:false},
        	   		{name:'days_approved',index:'days_approved', width:'100%',align:"right",search:false},
        	   		{name:'approved_user_id',index:'approved_user_id', width:'100%',align:"right",hidden:true,search:false},
        	   		{name:'approved_date',index:'approved_date', width:'100%',align:"right",search:false,sortable:false,},
        	   		{name:'approved_comments',index:'approved_comments', width:'100%',align:"right",search:false,sortable:false},
        	   		{name:'return_date',index:'return_date', width:'100%',align:"right",search:false,sortable:false,},
        	   		{name:'days_spent',index:'days_spent', width:'100%',search:false},
        	   		{name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'},
        	   		{name:'doc',index:'doc', width:'100%',hidden:true,search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#officialtravel_grid_pager',
        	   	sortname: 'ot.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "OfficialTravel.form.do?officialTravelId=" + rowData.id;
    				loadURL(link, $("#officialtravel_form_content"));
   				},
	       		gridComplete: function(){
   		       		var ids = jQuery(this).jqGrid('getDataIDs');
	   				for(var i=0;i < ids.length;i++){
	   					var cl = ids[i];
    					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('OfficalTravel','#officialtravel_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
    					jQuery("#officialtravel_grid").jqGrid('setRowData',ids[i],{act:au});
    					
	   					var doc = $(this).getCell(ids[i],"doc");
				        if(doc == "true") {
				        	var url="TravelDoc.do?attachmentId="+jQuery("#officialtravel_grid").jqGrid().getRowData(ids[i]).id;
				        	be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
		   					jQuery(this).jqGrid('setRowData',ids[i],{generate:be});
				        }
	   				}
  				}
        	});
              	
        	jQuery("#officialtravel_grid").jqGrid('navGrid','#officialtravel_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.jqGrid('filterToolbar',{searchOperators : true})
        			.navButtonAdd('#officialtravel_grid_pager',{
             	   	   caption:"", 
            	   	   title:"<s:text name="label.button.edit"/>", 
            	   	   buttonicon:"ui-icon-pencil", 
            	   	   onClickButton: function(){ 
            	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
            	   			if(iRow){
            					var rowData = jQuery(this).getRowData(iRow); 
            					var link = "OfficialTravel.form.do?officialTravelId=" + rowData.id;
            					$('#officialTravelId').val(rowData.id);
            					loadURL(link, $("#officialtravel_form_content"));
            	   			}else{
            	   	   			alert("<s:text name="global.please.select.row"/>");
            	   	   		}   
            	   	   }, 
            	   	   position:"last"
            	   	})
            	   	.navButtonAdd('#asset_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="rbac.permission.grid.devaluate"/>", 
             	   	   buttonicon:"	ui-icon-arrowthickstop-1-n", 
             	   	onClickButton: function(){ 
	             	   	var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	    	   			if(iRow){
	    					var rowData = jQuery(this).getRowData(iRow); 
	    					var link = "OfficialTravel.form.do?officialTravelId=" + rowData.id;
	    					$('#officialTravelId').val(rowData.id);
	    					loadURL(link, $("#officialtravel_form_content"));
	    	   			}else{
	    	   	   			alert("<s:text name="global.please.select.row"/>");
	    	   	   		}   
               	   },  
             	   	   position:"last"
             	   	});
        	$("#officialtravel_grid").navButtonAdd('#officialtravel_grid_pager',{
            	   caption:"", 
            	   title:"Edit status", 
            	   buttonicon:"ui-icon-shuffle", 
            	   onClickButton: function(){
            			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	    	   			if(iRow){
	    	   				var rowData = jQuery(this).getRowData(iRow);
	    					$("#userTravelId").val(rowData.id);
		    				openDialogForm('status_container',"OfficialTravel.statusForm.do?officialTravelId="+rowData.id,"Official travel status",600,600);
	    	   			}else{
	    	   	   			alert("Please select row");
	    	   	   		}   
            	   }, 
            	   position:"last"
            	});
        	$("#officialtravel_grid").navButtonAdd('#officialtravel_grid_pager',{
         	   caption:"", 
         	   title:"Report", 
         	   buttonicon:"ui-icon-print", 
         	   onClickButton: function(){
		    	openDialogForm('report_generator',"OfficialTravel.reportGenerator.do?","<s:text name='label.button.report.generator'/>",650,500);
         	   },
	         	   position:"last"
         	});
            
        	
        });
        $(window).bind('resize', function() {
            var width = $('#jqGrid_ot_container').width();
            $('#officialtravel_grid').setGridWidth(width);
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

			<div id="jqGrid_ot_container">
				<table id="officialtravel_grid" class="scroll"></table> 
				<div id="officialtravel_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			<input type="hidden" id="userTravelId" name="userTravelId" value="<s:property value='userTravelId'/>">
<!-- 			<div id="status_container"> -->
<%-- 				<jsp:include page="officialtravel_status.jsp"></jsp:include> --%>
<!-- 			</div> -->
		</div>
<!-- 		<!-- end widget div --> 

 </body>   
			
</html>	