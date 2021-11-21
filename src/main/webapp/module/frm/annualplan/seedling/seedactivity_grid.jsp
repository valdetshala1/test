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
        	var oplVal='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
        	var fiu='<s:property value="isForestInstituteUser()"/>';
        	jQuery("#seedactivity_grid").jqGrid({
        	   	url:'FrmGrid.seedActivityGrid.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData: {annualplanId: $("#annualplanId").val()},
        		jsonReader : {
   			      root:"rows",
   			      page: "page",
   			      total: "total",
   			      records: "records",
   			      repeatitems: false,
   			      id: "0"
        		},        		height: '100%',
        		width: '100%',
        		autowidth: true,
        		shrinkToFit: true,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['id',
        	   	       		'<s:text name="planting.stand.status"/>',
        	        	   	'<s:text name="annu.seedling.label.activity"/>', 
        	        	   	'<s:text name="annu.seedling.label.tree.species"/>', 
        	        	   	'<s:text name="annu.seedling.label.institute"/>',
        	        	   	'<s:text name="annu.seedling.label.prod.type"/>',
        	        	   	'<s:text name="annu.seedling.label.work.stage"/>',
        	        	   	'<s:text name="annu.seedling.label.pr.value"/>',
        	        	   	'<s:text name="annu.seedling.label.pl.value"/>',
        	        	   	'<s:text name="annu.seedling.label.ex.value"/>',
        	        	   	'<s:text name="annu.seedling.label.im.value"/>',
        	        	   	'<s:text name="ann.plan.activity.ID"/>',
        	        	   	'<s:text name="annual.plan.status.id"/>', 
        	        	   	'<s:text name="ann.plan.activity.ID"/>' 
        	     		 ],
        	   	colModel:[
					{name:'id',index:'id',hidden:true, width:'100%'},
					{name:'status_icon',index:'status_icon', width:'100%', sortable:true, align:"left", editable:false, search:true, stype:'select', 
    					searchoptions:{sopt:['eq','ne'], value: ':;NEW:New;COMPLETED:Completed;SELECTED:Selected;TERRAIN:Terrain;APPROVED:Approved;PAYMENT_REQUEST:Payment Request;PAYMENBT:Payment;REJECTED_INCOMPLETE:Rejected for Incomplete;REJECTED_NOT_APPROVED:Rejected for not approval;REJECTED_PAYMENT_REQUEST:Rejected for Payment Request'}, frozen:true},
        	   		{name:'activity',index:'activity', width:'100%'},
        	   		{name:'treeSpecies',index:'treeSpecies', width:'100%'},
        	   		{name:'institute',index :'institute', width:'100%'},
        	   		{name:'prodType',index:'prodType', width:'100%'},		
        	   		{name:'workStage',index:'workStage', width:'100%'},
        	   		{name:'prValue',index :'prValue', width:'100%', align:"center"},
        	   		{name:'plValue',index :'plValue', width:'100%', align:"center"},
        	   		{name:'exValue',index:'exValue', width:'100%', align:"center"},
        	   		{name:'imValue',index:'imValue', width:'100%', align:"center"},
        	   		{name:'activity_id',index:'activity_id',hidden:true},
        	   		{name:'status_id',index:'status_id', hidden:true},
        	   		{name:'activity_id',index:'activity_id', hidden:true}	
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#seedactivity_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		multiboxonly: true,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>"', 
        		ondblClickRow: function(id, iRow, iCol, e) {
    				var selectedRow = jQuery(this).jqGrid('getGridParam','selrow');
    				if(selectedRow){
	    				var rowData = jQuery(this).getRowData(selectedRow); 
	    				var link = "SeedActivity.planPage.do?seedActivityId=" + rowData.id+"&activityId="+rowData.activity_id+"&annualplanId="+$("#annualplanId").val();
	    				openDialogForm('seedactivity_plan_page_content',link,"<s:text name="annual.plan.seedling"/>",windowWidth,windowHeight);
					}else{alert('<s:text name="tender.request.alarm"/>');
    				}
   				},
 				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id, pager_id;
     		       subgrid_table_id = subgrid_id+"_t";
     		       pager_id = "p_"+subgrid_table_id;
     		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FrmGrid.activityStatusDoc.do?activity_id="+jQuery("#seedactivity_grid").getRowData(row_id).activity_id,
    		          datatype: "json",
    		          colNames: ['Id',
    		    		          '<s:text name="doc.name"/>', 
    		    		          '<s:text name="bid.grid.created.date"/>', 
    		    		          '<s:text name="hrm.skill.label.attachment"/>' 
    		    		        ],
    		          colModel: [
    		            {name:"id",index:"id",width:'100%',hidden:true},
    		            {name:"doc_name",index:"doc_name",width:'300%',align:"left"},
    		            {name:"created_date",index:"created_date",width:'100%',align:"center"},
    		            {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'}
    		          ],
    		       	  pager: pager_id,
    		          height: 'auto',
    		          width: 'auto',
    		          rowNum:8,
    	        	  rowList:[8,10,20,30],
    		      	  viewrecords: true,
    		          sortname: 'id',
    		          sortorder: "asc",
 	   		       		gridComplete: function(){
	 	   		       		var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
	 		   				for(var i=0;i < ids.length;i++){
	 		   					var docId=jQuery("#"+subgrid_table_id).getRowData(ids[i]).id;
	 		   					be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateFRMAttachment('"+docId+"');\"><i class='fa fa-paperclip'></i></button>";
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
	 		   				}
 	   					},
 	   				onSelectRow: function(ids) { 
 	   					jQuery("#seedactivity_grid").resetSelection();
 	   				}
    		       });
    		       jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,search:false,add:false,del:false});
    		   }		 
        	});
        	$("#seedactivity_grid")
           	.navGrid('#seedactivity_grid_pager',{edit:false,add:false,del:false,search:false})
           	.navButtonAdd('#seedactivity_grid_pager',{
           	   caption:"", 
           	   title:"<s:text name="label.button.edit"/>", 
           	   buttonicon:"ui-icon-pencil", 
           	   onClickButton: function(){ 
           			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
           			
           			if(iRow){
        				var rowData = jQuery(this).getRowData(iRow); 
        				var link = "SeedActivity.planPage.do?seedActivityId=" + rowData.id + "&activityId="+rowData.activity_id+"&annualplanId="+$("#annualplanId").val();
        				openDialogForm('seedactivity_plan_page_content',link,"<s:text name="annual.plan.seedling"/>",windowWidth,windowHeight); 
           			}else{
           	   			alert('<s:text name="tender.request.alarm"/>');
           	   		}   
           	   }, 
           	   position:"last"
           	})
           	if(fiu=='true'){
	            if( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL' ){	
		            jQuery("#seedactivity_grid").navButtonAdd('#seedactivity_grid_pager',{
		           	   caption:"", 
		           	   title:"<s:text name="frm.protection.create.plan"/>", 
		           	   buttonicon:"ui-icon-clipboard", 
		           	   onClickButton: function(){ 
		        			var link = "SeedActivity.planPage.do?annualplanId="+$("#annualplanId").val();
		        			openDialogForm('seedactivity_plan_page_content',link,"<s:text name="annual.plan.seedling"/>",windowWidth,windowHeight); 
		           	   }, 
		           	   position:"last"
		           	});
	           	}
           	}

           if(fiu=='true' ){
           		jQuery("#seedactivity_grid").navButtonAdd('#seedactivity_grid_pager',{
			   	   caption:"", 
			   	   title:"<s:text name="frm.global.grid.button.trigger.workflow"/>", 
			   	   buttonicon:"ui-icon-transferthick-e-w", 
			   	   onClickButton: function(){ 
				   		var rowData;
						var selectedRows=jQuery("#seedactivity_grid").getGridParam('selarrrow');
						if(selectedRows.length>0){
							$.SmartMessageBox({
		     					title : "<s:text name="annual.plan.activity.status.change.title"/>", 
		     					content : "<s:text name="annual.plan.activity.status.change.content"/>", 
		     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
		     					icon : "fa fa-bell"
		     					
		     				}, function(ButtonPressed) {
		     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
		     						var selectedId=jQuery("#seedactivity_grid").getRowData(selectedRows[0]).id;
		     						for(var i=1;i<selectedRows.length;i++){
		     								rowData=jQuery("#seedactivity_grid").getRowData(selectedRows[i]);
		     								selectedId=selectedId+","+rowData.id; 
		     						}
		     					   $.ajax({
		     							type : 'POST', // GET or POST
		     							url : "SeedActivityStatus.do?activityList="+selectedId,
		     							async : false,
		     							beforeSend : function(jqXHR, settings) {
		     							},
		     							error : function(errorThrown, status, jqXHR) { // on error..
		     								alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
		     							},
		     							success : function(data, status, jqXHR) { // on success..
		     								var errors = jqXHR.getResponseHeader("errors_exist");
		     								if(!errors){
		     									jQuery("#seedactivity_grid").trigger("reloadGrid");
		     									
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
							alert("<s:text name="global.please.select.at.last.one.row"/>");
							}  
			   	   }, 
			   	   position:"last"
			   	});
            }
        });
        

        $(window).bind('resize', function() {
            var width = $('#jqGrid_seedactivity_container').width();
            $('#seedactivity_grid').setGridWidth(width);
        });
  
    </script>

</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
		<input type="hidden" name="user" id="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<div id="jqGrid_seedactivity_container">
				<table id="seedactivity_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="seedactivity_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
 </body>   
			
</html>	
