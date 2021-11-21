<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">

ui-grid{ width:100% !important; }
.ui-th-column-header{text-align: center;}

</style>
<script type="text/javascript">
        var comp_id;
        $(document).ready(function () {
        	grid = jQuery("#private_grid").jqGrid({
        	   	url:'FrmGrid.privateplan.do',
        	   	postData:{annualplanId:$("#annualplanId").val()},	
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
        	   	colNames:[  'Id',
        	        	   	'<s:text name="law.suit.label.status"/>', 
        	        	   	'<s:text name="annu.seedling.label.activity"/>', 
        	        	   	'<s:text name="annu.seedling.label.work.stage"/>', 
        	        	   	'<s:text name="annu.seedling.label.pl.value"/>', 
        	        	   	'<s:text name="annu.seedling.label.im.value"/>', 
        	        	   	'<s:text name="frm.private.plan.start.cmpgn.date"/>', 
        	        	   	'<s:text name="frm.private.plan.end.cmpgn.date"/>' 
        	        	  ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'status_icon',index:'status_icon', width:'100%', sortable:true, align:"left", editable:false, search:true, stype:'select', 
    					searchoptions:{sopt:['eq','ne'], value: ':;NEW:New;COMPLETED:Completed;SELECTED:Selected;TERRAIN:Terrain;APPROVED:Approved;PAYMENT_REQUEST:Payment Request;PAYMENBT:Payment;REJECTED_INCOMPLETE:Rejected for Incomplete;REJECTED_NOT_APPROVED:Rejected for not approval;REJECTED_PAYMENT_REQUEST:Rejected for Payment Request'}, frozen:true},
        	   		{name:'activity',index:'activity', width:'100%',align:"left", sorttype:'string', searchoptions:{sopt:['eq','bw','bn','cn','nc','ew','en']}},
        	   		{name:'work_stage',index:'work_stage', width:'50%',align:"right", search:false},
        	   		{name:'pl_value',index:'pl_value', width:'50%',align:"center", search:false},
        	   		{name:'im_value',index:'im_value', width:'50%',align:"center", search:false},
        	   		{name:'start_cmpgn_date',index:'start_cmpgn_date', width:'50%',align:"center", search:false},
        	   		{name:'end_cmpgn_date',index:'end_cmpgn_date', width:'50%',align:"center", search:false},
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#private_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		caption: "<s:text name="annual.plan.grid.activities.caption"/>", 
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery("#private_grid").getRowData(iRow); 
    				var link = "PrivateActivity.form.do?privateActivityId=" + rowData.id + "&annualplanId=" + $("#annualplanId").val();
					openDialogForm('private_content',link,"Private Activity Form",800,650);
   				}				     		

        	});
            
            grid.jqGrid('filterToolbar',{searchOperators : true});
              	
            grid.jqGrid('navGrid','#private_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        		.navButtonAdd('#private_grid_pager',{
		   	   caption:"", 
		   	   title:'<s:text name="label.button.edit"/>', 
		   	   buttonicon:"ui-icon-pencil", 
		   	   onClickButton: function(){ 
		   			var iRow = grid.jqGrid('getGridParam','selrow');
		   			if(iRow){
		   				var rowData = jQuery("#private_grid").getRowData(iRow); 
	    				var link = "PrivateActivity.form.do?privateActivityId=" + rowData.id  + "&annualplanId=" + $("#annualplanId").val();
						openDialogForm('private_content',link,"Private Activity Form ",800,650);
		   			}else{
		   	   			alert('<s:text name="frm.global.please.select.row"/>');
		   	   		}   
		   	   }, 
		   	   position:"last"
		   	});
           if('<s:property value="user.getOrganisation().getOperLevelVal()"/>'=='R' ){	
		   	grid.navButtonAdd('#private_grid_pager',{
	           	   caption:"", 
	           	   title:'<s:text name="frm.protection.create.plan"/>', 
	           	   buttonicon:"ui-icon-clipboard", 
	           	   onClickButton: function(){ 
	           			var link = "PrivateActivity.form.do?annualplanId=" + $("#annualplanId").val();
	        			openDialogForm('private_content',link,"Private Activity Planning",800,650);
	           	   }, 
	           	   position:"last"
	           	}).navButtonAdd('#private_grid_pager',{
				   	   caption:"", 
				   	   title:'<s:text name="frm.global.grid.button.trigger.workflow"/>', 
				   	   buttonicon:"ui-icon-transferthick-e-w", 
				   	   onClickButton: function(){ 
				   	   var ids = grid.jqGrid('getGridParam','selarrrow');
				   	   if (ids.length>0) {
		    				$.SmartMessageBox({
		     					title : "<s:text name="annual.plan.activity.status.change.title"/>", 
		     					content : "<s:text name="annual.plan.activity.status.change.content"/>", 
		     					buttons : '[No][Yes]',
		     					icon : "fa fa-bell"
		     					
		     				}, function(ButtonPressed) {
		     					if (ButtonPressed === "Yes") {
		     		               var selectedVals = [];
		     		               for (var i=0, il=ids.length; i < il; i++) {
		     		                   var val = grid.jqGrid('getCell', ids[i], 'id');
		     		                   selectedVals.push(val);
		     		               }
		     		               var  formData = "activityIdList=" + selectedVals.join(",");
		     					   $.ajax({
		     							data : formData, 
		     							type : 'POST', // GET or POST
		     							url : 'PrivateStatus.do', 
		     							async : false,
		     							beforeSend : function(jqXHR, settings) {
		     							},
		     							error : function(errorThrown, status, jqXHR) { // on error..
		     								alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
		     							},
		     							success : function(data, status, jqXHR) { // on success..
		     								var errors = jqXHR.getResponseHeader("errors_exits");
		     								if(!errors){
		     									jQuery("#private_grid").trigger("reloadGrid");
		     									$.smallBox({
		     										title : "<s:text name="small.box.on.save.title.success"/>", 
		     										content : "<s:text name="small.box.content"/>", 
		     										color : "#739E73",
		     										timeout: 2000,
		     										icon : "fa fa-check",
		     										number : "1"
		     									});									
		     								}else{
		     									$.smallBox({
		     										title : "<s:text name="small.box.on.save.title.failed"/>", 
		     										content : "<s:text name="small.box.content"/>", 
		     										color : "#C79121",
		     										timeout: 2000,
		     										icon : "fa fa-shield fadeInLeft animated",
		     										number : "2"
		     									});
		     								}
		     							},
		     							complete : function(jqXHR, textStatus) {
		     							}
		     						});	
		     					}//EOF IF ButtonPressed
		     				});				   	   
				   	   	}else{
					   	   	alert('<s:text name="frm.global.please.select.row"/>');
					   	}		 
				   	   }, 
				   	   position:"last"
				   	});
				 }  	
				   

        $(window).bind('resize', function() {
            var width = $('#jqGrid_private_container').width();
            $('#private_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_private_container">
				<table id="private_grid" class="scroll"></table> 
				<div id="private_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
<%-- 			<input id="compId" value="<s:property value='compId'/>" type="hidden"> --%>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
