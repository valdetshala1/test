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
			dom_code:"INFRS"
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
        	var oplVal='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
            setHeaderWidth = function () {
                var $self = $(this),
                    colModel = $self.jqGrid("getGridParam", "colModel"),
                    cmByName = {},
                    ths = this.grid.headers,
                    cm,
                    i,
                    l = colModel.length;

                for(i = 0; i < l; i++) {
                    cm = colModel[i];
                    cmByName[cm.name] = $(ths[i].el).outerWidth();
                }
                $("#h1").width(cmByName.amount + cmByName.tax + cmByName.total - 1);
                $("#h2").width(cmByName.closed + cmByName.ship_via - 1);
                //$("#h2").width($("#h0").width() - $("#h1").outerWidth());
            };

//             $.jgrid.formatter.integer.thousandsSeparator = ',';
//             $.jgrid.formatter.number.thousandsSeparator = ',';
//             $.jgrid.formatter.currency.thousandsSeparator = ',';
                        
        	infrastructure_grid = jQuery("#infrastructure_grid").jqGrid({
        	   	url:'FrmGrid.infrastructure.do',	
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
        		},
        		height: '100%',
        		width: '100%',
        		autowidth: true,
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:[ 'Id','',
        	   	           '<s:text name="planting.stand.status"/>',
        	   	           '<s:text name="planting.stand.activity"/>',
        	   	           '<s:text name="frm.infrastructure.planning.road.name"/>',
        	   	           '<s:text name="annu.seedling.label.work.stage"/>',
        	   	           '<s:text name="frm.infrastructure.planning.length"/>',
        	   	           '<s:text name="frm.infrastructure.planning.start.from"/>',
        	   	           '<s:text name="frm.infrastructure.planning.end.in"/>',
        	   	           '<s:text name="frm.infrastructure.planning.width"/>',
        	   	           '<s:text name="planting.stand.plan.created.by"/>',
        	   	           '<s:text name="planting.stand.plan.created.date"/>',
        	   	           
        	   	           '<s:text name="frm.infrastructure.planning.length"/>',
        	   	           '<s:text name="frm.infrastructure.planning.start.from"/>',
        	   	           '<s:text name="frm.infrastructure.planning.end.in"/>',
        	   	           '<s:text name="frm.infrastructure.planning.width"/>',
        	   	           '<s:text name="planting.stand.plan.created.by"/>',
        	   	           '<s:text name="planting.stand.plan.created.date"/>',
        	   	           
        	   	           '<s:text name="ann.plan.activity.ID"/>',
        	   	           '<s:text name="ann.plan.road.id"/>',
        	   	           '<s:text name="annual.plan.status.id"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act',hidden:false, width:'20%'},
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
	            	   		         infrastructure_grid.jqGrid({search:true, postData: {activity_id: ui.item.id}});	     
	            	   			        $.extend(infrastructure_grid[0].p.postData,{activity_id: ui.item.id});  
	            	   			     infrastructure_grid.trigger("reloadGrid",[{page:1}]);          	   		            
	            	   		        }            	   		        
	            	   		    });
	            	   		}            	   		
        	   			}
        	   		},
        	   		{name:'road_name',index:'road_name', width:'100%',align:"left", search:false},
        	   		{name:'work_stage',index:'work_stage', width:'100%',align:"right", search:false},

        	   		{name:'pl_lenght',index:'pl_lenght', width:'100%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'pl_start_m',index:'pl_start_m', width:'100%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'pl_end_m',index:'pl_end_m', width:'100%',align:"right", search:false},
        	   		{name:'pl_width',index:'pl_width', width:'100%',align:"right", search:false},
        	   		{name:'pl_created_by',index:'pl_created_by', width:'100%',align:"right", search:false},
        	   		{name:'pl_created_ate',index:'pl_created_ate', width:'100%',align:"right", search:false},
        	   		
        	   		{name:'im_lenght',index:'im_lenght', width:'100%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'im_start_m',index:'im_start_m', width:'100%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'im_end_m',index:'im_end_m', width:'100%',align:"right", search:false},
        	   		{name:'im_width',index:'im_width', width:'100%',align:"right", search:false},
        	   		{name:'im_reated_by',index:'im_reated_by', width:'100%',align:"right", search:false},
        	   		{name:'im_created_date',index:'im_created_date', width:'100%',align:"right", search:false},
        	   		
        	   		{name:'activity_id',index:'activity_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'road_id',index:'road_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'status_id',index:'status_id', hidden:true, width:'100%',align:"right"},
        	   		
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#infrastructure_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		multiboxonly: true,
        		caption: "<s:text name="annual.plan.grid.activities.caption"/>", 
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selectedRow = jQuery(this).jqGrid('getGridParam','selrow');
    				if(selectedRow){
	    				var rowData = jQuery(this).getRowData(selectedRow); 
	    				var link = "Infrastructure.form.do?roadId=" + rowData.road_id+"&roadActivityId="+rowData.id + "&annualPlanId=" + $("#annualplanId").val();
						openDialogForm('infrastructure_content',link,"Infrastructure Planning",windowWidth,windowHeight);

    				}
   				},
		        gridComplete: function(){
	   		       		var ids = jQuery("#infrastructure_grid").jqGrid('getDataIDs');
	        			for(var i=0;i < ids.length;i++){
	        				   var rowData = jQuery("#infrastructure_grid").getRowData(ids[i]);
	    						au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('RoadActivity','#infrastructure_grid', '"+ids[i]+"');\"><i class='fa fa-history'></i></button>";	
	        					jQuery("#infrastructure_grid").jqGrid('setRowData',ids[i],{act:au});
	        			}	
 				  },
   				onSelectRow: function(ids) { 
				},
 				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id, pager_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       pager_id = "p_"+subgrid_table_id;
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FrmGrid.activityStatus.do?activity_id="+jQuery("#infrastructure_grid").getRowData(row_id).activity_id,
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
    		          height: 'auto',
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
 	   					jQuery("#infrastructure_grid").resetSelection();
 	   				}
    		       });
    		       jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,search:false,add:false,del:false});
    		   }						     		

        	});

        	
        	jQuery("#infrastructure_grid").jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
					{startColumnName: 'activity', numberOfColumns: 3, titleText: '<em><s:text name="frm.private.request.activity"/></em>'},
                    {startColumnName: 'plLenght', numberOfColumns: 6, titleText: '<em><s:text name="frm.private.request.planning"/></em>'},
                    {startColumnName: 'imLenght', numberOfColumns: 6, titleText: '<em><s:text name="frm.infrastructure.planning.implementation"/></em>'}
                ]});  
                 	
        	
        	infrastructure_grid.jqGrid('filterToolbar',{searchOperators : true});
              	
        	infrastructure_grid.jqGrid('navGrid','#infrastructure_grid_pager',
                	{edit: false, add:false, search:false,del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.navButtonAdd('#infrastructure_grid_pager',{
		   	   caption:"",
		   	   id:"in_edit_button", 
		   	   title:"<s:text name="label.button.edit"/>", 
		   	   buttonicon:"ui-icon-pencil", 
		   	   onClickButton: function(){ 
		   			var iRow = jQuery("#infrastructure_grid").jqGrid('getGridParam','selrow');
		   			if(iRow){
			   			$("#in_edit_button").addClass('ui-state-disabled');
		   				var rowData = jQuery("#infrastructure_grid").getRowData(iRow); 
	    				var link = "Infrastructure.form.do?roadId=" + rowData.road_id+"&roadActivityId="+rowData.id + "&annualPlanId=" + $("#annualplanId").val();
						openDialogForm('infrastructure_content',link,"Infrastructure Planning",windowWidth,windowHeight);
		   			}else{
		   	   			alert("<s:text name="global.please.select.row"/>"); 
		   	   		}   
		   	   }, 
		   	   position:"last"
		   	});
        	if(oplVal=='R'){
        	infrastructure_grid.navButtonAdd('#infrastructure_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="frm.global.grid.button.trigger.workflow"/>", 
		   	   buttonicon:"ui-icon-transferthick-e-w",
		   	   onClickButton: function(){ 
		   		var rowData;
				var selectedRows=jQuery("#infrastructure_grid").getGridParam('selarrrow');
				if(selectedRows.length>0){
					$.SmartMessageBox({
     					title : "<s:text name="annual.plan.activity.status.change.title"/>", 
     					content : "<s:text name="annual.plan.activity.status.change.content"/>", 
     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
     					icon : "fa fa-bell"
     					
     				}, function(ButtonPressed) {
     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
     						var selectedId=jQuery("#infrastructure_grid").getRowData(selectedRows[0]).id;
     						for(var i=1;i<selectedRows.length;i++){
     								rowData=jQuery("#infrastructure_grid").getRowData(selectedRows[i]);
     								selectedId=selectedId+","+rowData.id; 
     						}
     					   $.ajax({
     							type : 'POST', // GET or POST
     							url : "InfrastructureStatus.do?activityList="+selectedId,
     							async : false,
     							beforeSend : function(jqXHR, settings) {
     							},
     							error : function(errorThrown, status, jqXHR) { // on error..
     								alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
     							},
     							success : function(data, status, jqXHR) { // on success..
     								var errors = jqXHR.getResponseHeader("errors_exist");
     								if(!errors){
     									jQuery("#infrastructure_grid").trigger("reloadGrid");
     									
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
     										content : "<s:text name="frm.private.small.box.content"/>", 
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
//         	if($("#planStatus").val()==='APR'){
//         	infrastructure_grid.navButtonAdd('#infrastructure_grid_pager',{
// 			   	   caption:"Report", 
// 			   	   title:"Report", 
// 			   	   id:"report_button",
// 			   	   buttonicon:"	ui-icon-print", 
// 			   	   onClickButton: function(){ 
// 							$.SmartMessageBox({
// 		     					title : "<s:text name="report.operation.alert.title"/>", 
// 		     					content : "<s:text name="report.operation.alert.content"/>", 
// 		     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
// 		     					icon : "fa fa-bell"
		     					
// 		     				}, function(ButtonPressed) {
// 		     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
// 		     						var parameters = "p_mun_id="+$("#munId").val()+"&p_year="+$("#year").val()+"&p_rep_type=Implementimi "+"&p_user="+$("#user").val();
// 		     						openBirtViewer("frm/annualplan/infrastructure/municipality_implement_report.rptdesign", parameters);
// 			     					}//EOF IF ButtonPressed
// 		     				});
// 			   	   }, 
// 			   	   position:"last"
// 			   	});
//         	}
        	if(oplVal=='R' &&( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL')){
        	jQuery("#road_grid").jqGrid({
        	   	url:'FrmGrid.road.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData: {munId: $("#munId").val()},
        		jsonReader : {
   			      root:"rows",
   			      page: "page",
   			      total: "total",
   			      records: "records",
   			      repeatitems: false,
   			      id: "0"
        		},
        		width: '100%',
        		autowidth: false,
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['ID', 
        	        	   	'<s:text name="frm.infrastructure.cad.mun.id"/>', 
        	        	   	'<s:text name="frm.infrastructure.cad.mun.name"/>', 
        	        	   	'<s:text name="annual.plan.municipality.id"/>', 
        	        	   	'<s:text name="hrm.skill.grid.name"/>', 
        	        	   	'<s:text name="frm.infrastructure.road.type"/>', 
        	        	   	'<s:text name="frm.stand.access.type"/>', 
        	        	   	'<s:text name="frm.infrastructure.road.status"/>', 
        	        	   	'<s:text name="frm.infrastructure.last.activity.year"/>', 
        	        	   	'<s:text name="frm.infrastructure.road.length"/>', 
        	        	   	'<s:text name="bid.grid.created.date"/>', 
        	        	   	'<s:text name="bid.grid.created.by"/>' 
        	   		],	   	
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'cadastralMunId',index:'cadastralMunId', hidden:true,width:'100%',align:"right"},
        	   		{name:'cadMunName',index:'cadMunName', width:'100%',align:"right"},
        	   		{name:'mu_id',index:'mu_id', width:'100%',align:"right"},
        	   		{name:'name',index:'name', width:'100%',align:"right"},
        	   		{name:'roadType',index:'roadType', width:'100%',align:"right"},
        	   		{name:'accessType',index:'accessType', width:'100%',align:"right"},
        	   		{name:'roadStatus',index:'roadStatus', width:'100%',align:"right"},
        	   		{name:'lastActivityYear',index:'lastActivityYear', width:'100%',align:"right"},
        	   		{name:'roadLength',index:'roadLength', width:'100%',align:"right"},
        	   		{name:'createdDate',index:'createdDate', width:'100%',align:"right"},
        	   		{name:'createdBy',index:'createdBy', width:'100%',align:"right"}
        	   		],
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	   	pager: '#road_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "<s:text name="frm.infrastructure.roads"/>", 
        		loadtext:'<s:text name="grid.loading.text"/>', 
    			ondblClickRow: function(id, iRow, iCol, e) {
   				}        		

        	});
        	
        	jQuery("#road_grid").jqGrid('navGrid','#road_grid_pager',
                	{edit: false, add:false, search:false,del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        		if(oplVal=='R' &&( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL')){
        			jQuery("#road_grid").navButtonAdd('#road_grid_pager',{
					   	   caption: "",
					   	   title: "<s:text name="annual.plan.infrastructure"/>", 
					   	   buttonicon: "ui-icon-clipboard",
					   	   id:"in_activity_button", 
					   	   onClickButton: function(){ 
					   			var iRow = jQuery("#road_grid").jqGrid('getGridParam','selrow');
					   			if(iRow){
		     						$("#in_activity_button").addClass('ui-state-disabled');
									var rowData = jQuery("#road_grid").getRowData(iRow); 
									var link = "Infrastructure.form.do?roadId="+rowData.id+"&annualPlanId=" + $("#annualplanId").val();
									openDialogForm('infrastructure_content',link,"Infrastructure Planning",windowWidth,windowHeight);
					   			}else{
					   	   			alert("<s:text name="global.please.select.row"/>"); 
					   	   		} 					   	      
					   	   }, 
					   	   position: "last"
		  		   });
        		}
        }
            
        $(window).bind('resize', function() {
            var width = $('#jqGrid_road_container').width();
            $('#infrastructure_grid').setGridWidth(width);
            $('#road_grid').setGridWidth(width);
        });
                
    }); 
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<input type="hidden" name="user" id="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<div id="jqGrid_road_container">
				<table id="infrastructure_grid" class="scroll"></table> 
				<div id="infrastructure_grid_pager" class="scroll" style="text-align:center;"></div>
				<br>
				<table id="road_grid" class="scroll"></table> 
				<div id="road_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
