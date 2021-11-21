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
function autoFillSearch(request, response, link, columnToSearchName) {
	//alert(columnToSearchName);
    var paramters = {
        colName: columnToSearchName,
        prefixText: request.term
    };
    $.ajax({
    	type:"get",
        url: link,
        dataType: "json",
        data: {
			featureClass: "P",
			style: "full",
			maxRows: 12,
			name_startsWith: request.term,
			dom_code:"PROTE"
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
}
        var comp_id;
        $(document).ready(function () {
        	grid = jQuery("#protection_grid").jqGrid({
        	   	url:'FrmGrid.protection.do',
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
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:[ 'Id','<s:text name="audit.title"/>',
        	        	   	'<s:text name="frm.protection.planning.status"/>', 
        	        	   	'<s:text name="planting.stand.activity"/>',
        	        	   	'<s:text name="frm.protection.cadastral.municipality"/>',
        	        	   	'<s:text name="annual.plan.status.id"/>', 
        	        	   	'<s:text name="frm.protection.unit.metric"/>',
        	        	   	'<s:text name="frm.protection.management.unit"/>', 
        	        	   	'<s:text name="frm.protection.work.stage"/>',
        	        	   	'<s:text name="frm.protection.plan.value"/>', 
        	        	   	'<s:text name="frm.protection.impl.value"/>',
        	        	   	'<s:text name="annual.plan.status.id"/>',
        	        	   	'<s:text name="ann.plan.activity.ID"/>' 
        	   			 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act',hidden:false, width:'60%'},
        	   		{name:'status_icon',index:'status_icon', width:'100%', sortable:true, align:"left", editable:false, frozen:true, search:true, stype:'select', 
        	   			searchoptions:{ value: ':;NEW:<s:text name="tender.request.button.new"/>;SUB:<s:text name="annu.status.button.submitted"/>;APR:<s:text name="tender.request.button.approved"/>;REJ:<s:text name="tender.request.button.rejected"/>'}
                	},
                	{name:'activity',index:'activity', width:'100%',align:"left", sorttype:'string', 
            	   		searchoptions:{
	            	   		sopt:['eq'],
	            	   		dataInit: function(elem) {
	            	   		    $(elem).autocomplete({
	            	   		        source: function (request, response) {
	            	   		            autoFillSearch(request, response, 'Input.activityDomain.do', $(elem).attr('name'));
	            	   		        },
	            	   		        select: function(event, ui) {
	            	   		            $(elem).val(ui.item.value);
	            	   		         	grid.jqGrid({search:true, postData: {activity_id: ui.item.id}});	     
	            	   			        $.extend(grid[0].p.postData,{activity_id: ui.item.id});  
	            	   			     	grid.trigger("reloadGrid",[{page:1}]);          	   		            
	            	   		        }            	   		        
	            	   		    });
	            	   		}            	   		
        	   			}
        	   		},
        	   		{name:'cadastralMunicipality',index:'cadastralMunicipality',  width:'100%',align:"right",hidden:true},
        	   		{name:'stand_id',index:'stand_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'units_metric',index:'units_metric', width:'100%',align:"right", search:false},
        	   		{name:'management_unit',index:'management_unit', width:'100%',align:"right", search:false},
        	   		{name:'work_stage',index:'work_stage', width:'100%',align:"right", search:false},
        	   		{name:'pl_value',index:'pl_value', width:'100%',align:"center", search:false},
        	   		{name:'im_value',index:'im_value', width:'100%',align:"center", search:false},
        	   		{name:'status_id',index:'status_id', hidden:true},
        	   		{name:'activity_id',index:'activity_id', hidden:true}
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#protection_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		multiboxonly: true,
        		caption: "<s:text name="annual.plan.grid.activities.caption"/>", 
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selectedRow = jQuery(this).jqGrid('getGridParam','selrow');
    				if(selectedRow){
	    				var rowData = jQuery(this).getRowData(selectedRow); 
	    				var link = "Protection.form.do?protectionId=" + rowData.id + "&annualplanId=" + $("#annualplanId").val();
						openDialogForm('protection_content',link,"<s:text name="annu.protection.legend.protection.form"/>",windowWidth,windowHeight); 
    				}else{alert('<s:text name="tender.request.alarm"/>');
    				}
   				},
		        gridComplete: function(){
   		       		var ids = jQuery("#protection_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				   var rowData = jQuery("#protection_grid").getRowData(ids[i]);
    						au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('Activity','#protection_grid', '"+rowData.activity_id+"');\"><i class='fa fa-google'></i></button>";	
    						aud_data = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('ProtectionActivity','#protection_grid', '"+ids[i]+"');\"><i class='fa fa-history'></i></button>";	

    						jQuery("#protection_grid").jqGrid('setRowData',ids[i],{act:aud_data+au});
        			}	
				  },
 				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id,pager_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       pager_id = "p_"+subgrid_table_id;
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FrmGrid.activityStatus.do?activity_id="+jQuery("#protection_grid").getRowData(row_id).activity_id,
    		          datatype: "json",
    		          colNames: ['Id',
	    		          '<s:text name="law.suit.label.status"/>',
	    		          '<s:text name="bid.grid.created.by"/>',
	    		          '<s:text name="bid.grid.created.date"/>',
	    		          '<s:text name="annual.plan.status.remarks"/>',
	    		          '<s:text name="hrm.skill.label.attachment"/>',
	    		          'encryptedText'
	    		          ],
			          colModel: [
			            {name:"id",index:"id",width:'100%',hidden:true},
			            {name:"status",index:"status",width:'300%',align:"left"},
			            {name:"created_by",index:"created_by",width:'100%',align:"center"},
			            {name:"created_date",index:"created_date",width:'100%',align:"center"},
			            {name:"remarks",index:"remarks",width:'100%',align:"center"},
			            {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'},
				  		{name:"encryptedText",index:"encryptedText",width:'200%',hidden:true}
				      ],
    		       	  pager: pager_id,
    		          height: '100%',
    		          width: 'auto',
    		          rowNum:10,
    	        	  rowList:[10,20,30],
    		      	  viewrecords: true,
    		          sortname: 'id',
    		          sortorder: "asc",
 	   		       	  gridComplete: function(){
	 	   		       		var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
	 		   				for(var i=0;i < ids.length;i++){
	 		   					var docId=jQuery("#"+subgrid_table_id).getRowData(ids[i]).id;
	 		        			var rowData = jQuery("#"+subgrid_table_id).getRowData(ids[i]); //rowData.encryptedText
	 							be = "<button class='btn btn-xs btn-default' data-original-title='Documents' title='<s:text name="audit.title"/>' onclick=\"docsList('"+rowData.encryptedText+"','#decision_grid', '"+rowData.id+"');\"><i class='fa fa-folder'></i></button>";	
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
	 		   				}
	   					},
 	   				onSelectRow: function(ids) { 
 	   					jQuery("#protection_grid").resetSelection();
 	   				}
    		       });
    		       jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,search:false,add:false,del:false});
    		   }						     		

        	});
            
            grid.jqGrid('filterToolbar',{searchOperators : true});
              	
            grid.jqGrid('navGrid','#protection_grid_pager',
                	{edit: false, add:false, search:false,del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.navButtonAdd('#protection_grid_pager',{
		   	   caption:"", 
		   	   title:'<s:text name="label.button.edit"/>', 
		   	   buttonicon:"ui-icon-pencil",
		   	   id:"pr_edit_button", 
		   	   onClickButton: function(){ 
		   			var iRow = grid.jqGrid('getGridParam','selrow');
		   			if(iRow){
		   			 	$("#pr_edit_button").addClass("ui-state-disabled");
		   				var rowData = jQuery("#protection_grid").getRowData(iRow); 
	    				var link = "Protection.form.do?protectionId=" + rowData.id +"&standId=" + rowData.stand_id + "&annualplanId=" + $("#annualplanId").val();
						openDialogForm('protection_content',link,"<s:text name="annu.protection.legend.protection.form"/>",windowWidth,windowHeight); 
		   			}else{
		   	   			alert('<s:text name="frm.global.please.select.row"/>');
		   	   		}   
		   	   }, 
		   	   position:"last"
		   	});
           if('<s:property value="user.getOrganisation().getOperLevelVal()"/>'=='R' && ( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL')  ){	
		   	grid.navButtonAdd('#protection_grid_pager',{
	           	   caption:"", 
	           	   title:'<s:text name="frm.protection.create.plan"/>', 
	           	   buttonicon:"ui-icon-clipboard", 
	           	   id:"pr_activity_button",
	           	   onClickButton: function(){ 
		           	   $("#pr_activity_button").addClass("ui-state-disabled");
	           			var link = "Protection.form.do?annualplanId=" + $("#annualplanId").val();
	        			openDialogForm('protection_content',link,"<s:text name="annual.plan.protection"/>",windowWidth,windowHeight); 
	           	   }, 
	           	   position:"last"
	           	}).navButtonAdd('#protection_grid_pager',{
				   	   caption:"", 
				   	   title:'<s:text name="frm.global.grid.button.trigger.workflow"/>', 
				   	   buttonicon:"ui-icon-transferthick-e-w", 
				   	   onClickButton: function(){ 
				   	   var ids = grid.jqGrid('getGridParam','selarrrow');
				   	   if (ids.length>0) {
		    				$.SmartMessageBox({
		     					title : "<s:text name="annual.plan.activity.status.change.title"/>", 
		     					content : "<s:text name="annual.plan.activity.status.change.content"/>", 
		     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
		     					icon : "fa fa-bell"
		     					
		     				}, function(ButtonPressed) {
		     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
		     		               var selectedVals = [];
		     		               for (var i=0, il=ids.length; i < il; i++) {
		     		                   var val = grid.jqGrid('getCell', ids[i], 'id');
		     		                   selectedVals.push(val);
		     		               }
		     		               var  formData = "activityIdList=" + selectedVals.join(",");
		     					   $.ajax({
		     							data : formData, 
		     							type : 'POST', // GET or POST
		     							url : 'ProtectionStatus.do', 
		     							async : false,
		     							beforeSend : function(jqXHR, settings) {
		     							},
		     							error : function(errorThrown, status, jqXHR) { // on error..
		     								alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
		     							},
		     							success : function(data, status, jqXHR) { // on success..
		     								var errors = jqXHR.getResponseHeader("errors_exits");
		     								if(!errors){
		     									jQuery("#protection_grid").trigger("reloadGrid");
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
//            if($("#planStatus").val()==='APR'){
// 				   	grid.navButtonAdd('#protection_grid_pager',{
// 					   	   caption:"<s:text name="report.grid.caption"/>", 
// 					   	   title:"<s:text name="report.grid.caption"/>", 
// 					   	   buttonicon:"	ui-icon-print", 
// 					   	   onClickButton: function(){ 
// 									$.SmartMessageBox({
// 				     					title : "<s:text name="report.operation.alert.title"/>", 
// 				     					content : "<s:text name="report.operation.alert.content"/>", 
// 				     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
// 				     					icon : "fa fa-bell"
				     					
// 				     				}, function(ButtonPressed) {
// 				     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
// 				     						var parameters = "p_mun_id="+$("#munId").val()+"&p_year="+$("#year").val()+"&p_rep_type=Implementimi "+"&p_user="+$("#user").val();	
// 				     						openBirtViewer("frm/annualplan/protection/municipality_implement_report.rptdesign", parameters);
// 					     					}//EOF IF ButtonPressed
// 				     				});
// 					   	   }, 
// 					   	   position:"last"
// 					   	});
//            }

        $(window).bind('resize', function() {
            var width = $('#jqGrid_protect_container').width();
            $('#protection_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<input type="hidden" name="user" id="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<div id="jqGrid_protect_container">
				<table id="protection_grid" class="scroll"></table> 
				<div id="protection_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
<%-- 			<input id="compId" value="<s:property value='compId'/>" type="hidden"> --%>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
