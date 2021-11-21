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
			dom_code:"PLNTG"
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
                        
        	grid_planting = jQuery("#planting_grid").jqGrid({
        	   	url:'FrmGrid.planting.do',	
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
        	   	colNames:[ 'Id','','<s:text name="audit.title"/>',
        	   	           '<s:text name="planting.stand.status"/>','','',
          	   	            '<s:text name="frm.compartment.comp.id"/>',
            	   	        '<s:text name="frm.stand.stand.ID"/>', 
        	   	           '<s:text name="planting.stand.activity"/>',
        	        	   '<s:text name="planting.stand.tree.species"/>',
        	        	   '<s:text name="planting.stand.work.stage"/>',
        	        	   
        	        	   '<s:text name="planting.stand.planned.area"/>',
        	        	   '<s:text name="planting.stand.planned.trees"/>',
        	        	   '<s:text name="planting.stand.plan.created.date"/>',
        	        	   '<s:text name="planting.stand.plan.created.by"/>',
        	        	   '<s:text name="planting.stand.impl.area"/>',
        	        	   '<s:text name="planting.stand.impl.trees"/>',
        	        	   '<s:text name="planting.stand.impl.created.date"/>',
        	        	   '<s:text name="planting.stand.impl.created.by"/>',

        	        	   '<s:text name="ann.plan.activity.ID"/>',
        	   	           '<s:text name="frm.stand.stand.ID"/>',
        	        	   '<s:text name="annual.plan.status.id"/>',
        	        	   '<s:text name="ann.plan.tree.species.ID"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'activity_id',index:'activity_id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act',hidden:false, width:'50%'},
        	   		{name:'status_icon',index:'status_icon', width:'50%', sortable:true, align:"left", editable:false, frozen:true, search:true, stype:'select', 
        	   			searchoptions:{ value: ':;NEW:<s:text name="tender.request.button.new"/>;SUB:<s:text name="annu.status.button.submitted"/>;APR:<s:text name="tender.request.button.approved"/>;REJ:<s:text name="tender.request.button.rejected"/>'}
                	},
                	{name:'comp_id',index:'comp_id',hidden:true, width:'100%',align:"center"},
                	{name:'stand_id',index:'stand_id', hidden:true,width:'100%',align:"center"},
                	{name:'comp_nr',index:'comp_nr', width:'100%',align:"center"},
                	{name:'stand_nr',index:'stand_nr', width:'100%',align:"center"},
                	{name:'activity',index:'activity', width:'100%',align:"left", search:false},
        	   		{name:'tree_species',index:'tree_species', width:'100%',align:"left", sorttype:'string', 
            	   		searchoptions:{
	            	   		sopt:['eq'],
	            	   		dataInit: function(elem) {
	            	   		    $(elem).autocomplete({
	            	   		        source: function (request, response) {
	            	   		            autoFillSearch(request, response, 'Input.treeSpecies.do', $(elem).attr('name'));
	            	   		        },
	            	   		        select: function(event, ui) {
	            	   		            $(elem).val(ui.item.value);
	            	   		         	grid_planting.jqGrid({search:true, postData: {tree_species_id: ui.item.id}});	     
	            	   			        $.extend(grid_planting[0].p.postData,{tree_species_id: ui.item.id});  
	            	   			     	grid_planting.trigger("reloadGrid",[{page:1}]);          	   		            
	            	   		        }            	   		        
	            	   		    });
	            	   		}            	   		
	    	   			}           	   		
        	   		},
        	   		{name:'work_stage',index:'work_stage', width:'100%',align:"center", search:false},

        	   		{name:'pl_area',index:'pl_area', width:'100%', formatter: 'number', sorttype: 'number', align:"center", search:false},
        	   		{name:'pl_trees',index:'pl_trees', width:'100%', formatter: 'number', sorttype: 'number', align:"center", search:false},
        	   		{name:'pl_created_date',index:'pl_created_date', width:'100%',align:"center", search:false},
        	   		{name:'pl_created_by',index:'pl_created_by', width:'100%',align:"center", search:false},

        	   		{name:'im_area',index:'im_area', width:'100%', formatter: 'number', sorttype: 'number', align:"center", search:false},
        	   		{name:'im_trees',index:'im_trees', width:'100%', formatter: 'number', sorttype: 'number', align:"center", search:false},
        	   		{name:'im_created_date',index:'im_created_date', width:'100%',align:"center", search:false},
        	   		{name:'im_created_by',index:'im_created_by', width:'100%',align:"center", search:false},

        	   		{name:'activity_id',index:'activity_id', hidden:true, width:'100%',align:"center"},
        	   		{name:'stand_id',index:'stand_id', hidden:true, width:'100%',align:"center"},
        	   		{name:'status_id',index:'status_id', hidden:true, width:'100%',align:"center"},
        	   		{name:'tree_species_id',index:'tree_species_id', hidden:true, width:'100%',align:"center"},
        	   		
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#planting_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		multiboxonly:true,
        		caption: '<s:text name="annual.plan.grid.activities.caption"/>',
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selRow = jQuery("#planting_grid").jqGrid('getGridParam','selrow');
		   			if(selRow){
						var rowData = jQuery("#planting_grid").getRowData(selRow); 
						var link = "Planting.planPage.do?standId="+rowData.stand_id+"&plantingId="+ rowData.id + "&annualplanId=" + $("#annualplanId").val();
						openDialogForm('planting_plan_page_content',link,"<s:text name="annual.plan.planting"/>",windowWidth,windowHeight);
						
		   			}else{
		   				alert("<s:text name="tender.request.alarm"/>");
		   	   		} 
   				},
		        gridComplete: function(){
   		       		var ids = jQuery("#planting_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				   var rowData = jQuery("#planting_grid").getRowData(ids[i]);
    						au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('Activity','#planting_grid', '"+rowData.activity_id+"');\"><i class='fa fa-google'></i></button>";	
    						aud_data = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('PlantingActivity','#planting_grid', '"+ids[i]+"');\"><i class='fa fa-history'></i></button>";
    						jQuery("#planting_grid").jqGrid('setRowData',ids[i],{act:aud_data+au});
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
    		          url:"FrmGrid.activityStatus.do?activity_id="+jQuery("#planting_grid").getRowData(row_id).activity_id,
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
      		            {name:"generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'},
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
 	   					jQuery("#planting_grid").resetSelection();
 	   				}
    		       });
    		       jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,search:false,add:false,del:false});
    		   }					     		

        	});

        	
        	jQuery("#planting_grid").jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                    {startColumnName: 'activity', numberOfColumns: 3, titleText: '<em><s:text name="planting.stand.activity"/></em>'},
                    {startColumnName: 'pl_area', numberOfColumns: 4, titleText: '<em><s:text name="planting.stand.legend.planning"/></em>'},
                    {startColumnName: 'im_area', numberOfColumns: 4, titleText: '<em><s:text name="planting.stand.legend.implementation"/></em>'}
                ]});  
                 	
        	
        	grid_planting.jqGrid('filterToolbar',{searchOperators : true});
              	
        	grid_planting.jqGrid('navGrid','#planting_grid_pager',
                	{edit: false, add:false, search:false,del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.navButtonAdd('#planting_grid_pager',{
		   	   caption:"", 
		   	   title:'<s:text name="label.button.edit"/>', 
		   	   buttonicon:"ui-icon-pencil",
		   	   id:"pl_edit_button", 
		   	   onClickButton: function(){ 
		   			var iRow = jQuery("#planting_grid").jqGrid('getGridParam','selrow');
		   			if(iRow){
		   				$("#pl_edit_button").addClass('ui-state-disabled');
						var rowData = jQuery("#planting_grid").getRowData(iRow); 
						var link = "Planting.planPage.do?standId="+rowData.stand_id+"&plantingId="+ rowData.id + "&annualplanId=" + $("#annualplanId").val();
						openDialogForm('planting_plan_page_content',link,"<s:text name="annual.plan.planting"/>",windowWidth,windowHeight);
						
		   			}else{
		   				alert("<s:text name="tender.request.alarm"/>");
		   	   		}   
		   	   }, 
		   	   position:"last"
		   	});
        	if(oplVal=='R'){
		   	grid_planting.navButtonAdd('#planting_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name='frm.global.grid.button.trigger.workflow'/>", 
		   	   buttonicon:"ui-icon-transferthick-e-w", 
		   	   onClickButton: function(){ 
			   		var rowData;
					var selectedRows=jQuery("#planting_grid").getGridParam('selarrrow');
					if(selectedRows.length>0){
						$.SmartMessageBox({
							title : "<s:text name="annual.plan.activity.status.change.title"/>",
	     					content : "<s:text name="annual.plan.activity.status.change.content"/>",
	     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
	     					icon : "fa fa-bell"
	     					
	     				}, function(ButtonPressed) {
	     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
	     						var selectedId=jQuery("#planting_grid").getRowData(selectedRows[0]).id;
	     						for(var i=1;i<selectedRows.length;i++){
	     								rowData=jQuery("#planting_grid").getRowData(selectedRows[i]);
	     								selectedId=selectedId+","+rowData.id; 
	     						}
	     					   $.ajax({
	     							type : 'POST', // GET or POST
	     							url : "PlantingStatus.do?activityList="+selectedId,
	     							async : false,
	     							beforeSend : function(jqXHR, settings) {
	     							},
	     							error : function(errorThrown, status, jqXHR) { // on error..
	     								alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
	     							},
	     							success : function(data, status, jqXHR) { // on success..
	     								var errors = jqXHR.getResponseHeader("errors_exist");
	     								if(!errors){
	     									jQuery("#planting_grid").trigger("reloadGrid");
	     									
	     									$.smallBox({
	     										title : '<s:text name="small.box.on.save.title.success"/>',
	     										content : '<s:text name="small.box.content"/>',
	     										color : "#739E73",
	     										timeout: 5000,
	     										icon : "fa fa-check",
	     										number : "1"
	     									});									
	     								}else{
	     									$.smallBox({
	     										title : '<s:text name="small.box.on.save.title.failed"/>',
	     										content : '<s:text name="small.box.content"/>',
	     										color : "#C79121",
	     										timeout: 5000,
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
						alert("<s:text name="tender.request.alarm"/>");
						}  
		   	   }, 
		   	   position:"last"
		   	});
        	}
//         	if($("#planStatus").val()==='APR'){
//         		grid_planting.navButtonAdd('#planting_grid_pager',{
//         			 caption:"<s:text name='report.grid.caption'/>", 
//   			   	   title:"<s:text name='report.grid.caption'/>", 
// 			   	   buttonicon:"	ui-icon-print", 
// 			   	   onClickButton: function(){ 
// 					   		$.SmartMessageBox({
// 		     					title : "<s:text name='report.operation.alert.title'/>",
// 		     					content : "<s:text name='report.operation.alert.content'/>",
// 		     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
// 		     					icon : "fa fa-bell"
		     					
// 		     				}, function(ButtonPressed) {
// 		     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
// 		     						var parameters = "p_mun_id="+$("#munId").val()+"&p_year="+$("#year").val()+"&p_rep_type=Implementimi "+"&p_user="+$("#user").val();
// 		     						openBirtViewer("frm/annualplan/planting/municipality_implement_report.rptdesign", parameters);
// 			     					}//EOF IF ButtonPressed
// 		     				});
// 			   	   }, 
// 			   	   position:"last"
// 			   	});
//         	}
        	if(oplVal=='R' &&( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL')){
        	jQuery("#stand_planting_grid").jqGrid({
        	   	url:'FrmGrid.stands.do?',
        	   	postData:{mun_id: $("#munId").val()},	
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
        		width: '100%',
        		autowidth: true,
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	/*colNames:['ID', 'COMP_ID','<s:text name="frm.stand.compartment"/>',
     	        	   	 '<s:text name="frm.stand.stand"/>',
    	        	   	 '<s:text name="frm.stand.forest.type"/>',
    	        	   	 '<s:text name="frm.stand.stock.level"/>',
    	        	   	 '<s:text name="frm.stand.access.type"/>',
    	        	   	 '<s:text name="frm.stand.basal.area"/>',
    	        	   	 '<s:text name="frm.stand.estabilished.year"/>',
    	        	   	 '<s:text name="frm.stand.stand.height"/>',
    	        	   	 '<s:text name="frm.stand.stand.acres"/>'],
    	        	   	 */	   	
         	   	colNames:['ID', 'COMP_ID','',
         	         	   	 '<s:text name="frm.compartment.comp.id"/>','',
	     	        	   	 '<s:text name="frm.stand.stand"/>',
	    	        	   	 '<s:text name="frm.stand.forest.type"/>',
	       	        	   	 '<s:text name="frm.stand.stock.level"/>',
	       	        	   	 '<s:text name="frm.stand.access.type"/>',
	       	        	   	 '<s:text name="frm.stand.basal.area"/>',
	       	        	   	 '<s:text name="frm.stand.estabilished.year"/>',
	       	        	   	 '<s:text name="frm.stand.stand.height"/>',
	       	        		 '<s:text name="frm.compartment.region.name"/>',
	       	        		 '<s:text name="annual.plan.municipality"/>',
	       	        		 '<s:text name="law.suit.label.managment.unit"/>',
	       	        		 '<s:text name="frm.stand.volume.m3.ha"/>',
	       	        	  	 '<s:text name="frm.stand.estemate.trees.per.ha"/>',
	       	        	     '<s:text name="dem.fiskos.managment.class.id"/>'],	   	
       	   	colModel:[
       	   		{name:'id',index:'id',hidden:true, width:'50%'},
       	   		{name:'comp_objectid',index:'comp_objectid', hidden:true,width:'100%',align:"right"},
       	   		{name:'comp_id',index:'comp_id', width:'100%', hidden:true, align:"center", search:true},
       	   		{name:'comp_nr',index:'comp_nr', width:'100%',align:"center", search:true},
       	   		{name:'stand_id',index:'stand_id',hidden:true, width:'100%',align:"center", search:true},
       	   		{name:'stand_nr',index:'stand_nr',  width:'100%',align:"center", search:true},
       	   		{name:'forest_typ',index:'forest_typ', width:'100%', search:false, hidden:true},
       	   		{name:'stock_level',index:'stock_level', width:'100%', search:false, hidden:true},
       	   		{name:'access_type',index:'access_type', width:'100%', search:false, hidden:true},
       	   		{name:'basal_area',index:'basal_area', width:'100%',align:"center", search:false},
       	   		{name:'estabilished_year',index:'estabilished_year', width:'100%',align:"center", search:false},
       	   		{name:'stand_height',index:'stand_height', width:'100%',align:"center", search:false},
       	   		{name:'region',index:'region', width:'100%', search:false},
       	   		{name:'municipality',index:'municipality', width:'100%', search:false},
       	   		{name:'mgmt_unit',index:'mgmt_unit', width:'100%', search:false},
       	   		{name:'volume_m3ha',index:'volume_m3ha', width:'100%', search:false},
       	   		{name:'estimate_trees_per_ha',index:'municipality', width:'100%', search:false},
    	   		{name:'mngmclass',index:'mngmclass', width:'100%', search:false}
       	   		],
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	   	pager: '#stand_planting_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "<s:text name="frm.compartment.stands"/>",
        		loadtext:'<s:text name="loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
   				}        		

        	});
        	
        	jQuery("#stand_planting_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#stand_planting_grid").jqGrid('navGrid','#stand_planting_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false, search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
			
        	if(oplVal=='R' &&($("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL')){
        		jQuery("#stand_planting_grid").navButtonAdd('#stand_planting_grid_pager',{
			   	   caption: "",
			   	   title: "",  
			   	   buttonicon: "ui-icon-clipboard",
			   	   id:"pl_activity_button",
			   	   onClickButton: function(){
			   			var iRow = jQuery("#stand_planting_grid").jqGrid('getGridParam','selrow');
			   			if(iRow){
			   				$("#pl_activity_button").addClass('ui-state-disabled');
							var rowData = jQuery("#stand_planting_grid").getRowData(iRow); 
							var link = "Planting.planPage.do?standId=" + rowData.id + "&annualplanId=" + $("#annualplanId").val();
							openDialogForm('planting_plan_page_content',link,"Stand Planting Planning",windowWidth,windowHeight);
			   			}else{
			   	   			alert("Please select row");
			   			}
			   	   }, 
			   	   position: "last"
	  		   });
        	}
        		}
        	
        $(window).bind('resize', function() {
            var width = $('#jqGrid_pp_container').width();
            $('#planting_grid').setGridWidth(width);
            $('#stand_planting_grid').setGridWidth(width);
        });
                
    }); 
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
<input type="hidden" name="user" id="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<div id="jqGrid_pp_container">
				<table id="planting_grid" class="scroll"></table> 
				<div id="planting_grid_pager" class="scroll" style="text-align:center;"></div>
				<br>
				<table id="stand_planting_grid" class="scroll"></table> 
				<div id="stand_planting_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			<input id="compId" value="<s:property value='compId'/>" type="hidden">
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
