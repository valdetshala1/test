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
			dom_code:"HARVT"
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
                        
        	grid_harvest = jQuery("#standactivity_grid").jqGrid({
        	   	url:'FrmGrid.standActivity.do',	
        	   	mtype: 'GET',
        	   	postData: {annualplanId: $("#annualplanId").val()},
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
        	   	colNames:[ 
        	        	'Id','<s:text name="audit.title"/>',
       	   	           '<s:text name="planting.stand.status"/>',
       	   	           '<s:text name="annu.felling.label.municipality"/>',
       	   	           '<s:text name="frm.compartment.comp.id"/>',
       	   	           '<s:text name="frm.stand.stand.ID"/>', 
       	   	     	   '<s:text name="frm.stand.stand.ID"/>', 
       	   	           '<s:text name="planting.stand.activity"/>',
       	        	   '<s:text name="frm.harvest.planning.tree.species.id"/>',
       	        	   '<s:text name="planting.stand.work.stage"/>',
       	        	   '<s:text name="frm.harvest.planning.pl.tech.volume"/>',
       	        	   '<s:text name="frm.harvest.planning.pl.fire.volume"/>',
       	        	   '<s:text name="frm.harvest.planning.pl.pulp.volume"/>',
       	        	   '<s:text name="planting.stand.plan.created.date"/>',
       	        	   '<s:text name="planting.stand.plan.created.by"/>',
       	        	   '<s:text name="frm.harvest.planning.pl.tech.volume"/>',
       	        	   '<s:text name="frm.harvest.planning.pl.fire.volume"/>',
       	        	   '<s:text name="frm.harvest.planning.pl.pulp.volume"/>',
       	        	   '<s:text name="planting.stand.plan.created.date"/>',
       	        	   '<s:text name="planting.stand.plan.created.by"/>',
       	        	   '<s:text name="frm.harvest.planning.damage.volume"/>',
       	        	   '<s:text name="ann.plan.activity.ID"/>', 
       	   	           '<s:text name="annual.plan.status.id"/>', 
       	        	   '<s:text name="annual.plan.status.code"/>', 
       	        	   '<s:text name="ann.plan.tree.species.ID"/>', 
       	        	   '<s:text name="ann.plan.annual.planning.ID"/>'
        	        	   
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act',hidden:false, width:'60%'},
        	   		{name:'status_icon',index:'status_icon', width:'50%', sortable:true, align:"left", editable:false, frozen:true, search:true, stype:'select', 
        	   			searchoptions:{ value: ':;NEW:<s:text name="tender.request.button.new"/>;SUB:<s:text name="annu.status.button.submitted"/>;APR:<s:text name="tender.request.button.approved"/>;REJ:<s:text name="tender.request.button.rejected"/>'}
                	},
                	{name:'municipality',index:'municipality', width:'50%',align:"right", search:false,hidden:true}, 
                	{name:'comp_nr',index:'comp_nr', width:'100%',align:"center"},
                	{name:'stand_nr',index:'stand_nr', width:'100%',align:"center"},
                	{name:'stand_id',index:'stand_id', width:'100%',align:"center", hidden:true},
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
	            	   			     	grid_harvest.jqGrid({search:true, postData: {activity_id: ui.item.id}});	     
	            	   			        $.extend(grid_harvest[0].p.postData,{activity_id: ui.item.id});  
	            	   			        grid_harvest.trigger("reloadGrid",[{page:1}]);          	   		            
	            	   		        }            	   		        
	            	   		    });
	            	   		}            	   		
        	   			}
        	   		},
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
	            	   			     	grid_harvest.jqGrid({search:true, postData: {tree_species_id: ui.item.id}});	     
	            	   			        $.extend(grid_harvest[0].p.postData,{tree_species_id: ui.item.id});  
	            	   			        grid_harvest.trigger("reloadGrid",[{page:1}]);          	   		            
	            	   		        }            	   		        
	            	   		    });
	            	   		}            	   		
	    	   			}           	   		
        	   		},
        	   		{name:'work_stage',index:'work_stage', width:'50%',align:"right", search:false},

        	   		{name:'pl_tech_volume',index:'pl_tech_volume', width:'50%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'pl_fire_volume',index:'pl_fire_volume', width:'50%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'pl_pulp_volume',index:'pl_pulp_volume', width:'50%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'pl_created_date',index:'pl_created_date', width:'50%',align:"right", search:false},
        	   		{name:'pl_created_by',index:'pl_created_by', width:'50%',align:"right", search:false},

        	   		{name:'im_tech_volume',index:'im_tech_volume', width:'50%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'im_fire_volume',index:'im_fire_volume', width:'50%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'im_pulp_volume',index:'im_pulp_volume', width:'50%', formatter: 'number', sorttype: 'number', align:"right", search:false},
        	   		{name:'im_created_date',index:'im_created_date', width:'50%',align:"right", search:false},
        	   		{name:'im_created_by',index:'im_created_by', width:'50%',align:"right", search:false},

        	   		{name:'damage_volume',index:'damage_volume', width:'50%', formatter: 'number', sorttype: 'number', align:"right", search:false},

        	   		{name:'activity_id',index:'activity_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'status_id',index:'status_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'status_code',index:'status_code', hidden:true, width:'100%',align:"right"},
        	   		{name:'tree_species_id',index:'tree_species_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'annual_planning_id',index:'annual_planning_id', hidden:true, width:'100%',align:"right"}
        	   		
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#standactivity_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		multiboxonly: true,
        		caption: '<s:text name="annual.plan.grid.activities.caption"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selectedRow = jQuery(this).jqGrid('getGridParam','selrow');
    				if(selectedRow){
	    				var rowData = jQuery(this).getRowData(selectedRow); 
	    				var link = "Harvest.standPlanPage.do?standharvestId=" + rowData.id + "&standId=" + rowData.stand_id + "&annualplanId=" + $("#annualplanId").val();
						openDialogForm('stand_page_content',link,"<s:text name="annual.plan.harvest"/>",windowWidth,windowHeight);
    				} 
   				},
		        gridComplete: function(){
   		       		var ids = jQuery("#standactivity_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				   var rowData = jQuery("#standactivity_grid").getRowData(ids[i]);
    						au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('Activity','#standactivity_grid', '"+rowData.activity_id+"');\"><i class='fa fa-google'></i></button>";	
    						aud_data = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('StandHarvestActivity','#standactivity_grid', '"+ids[i]+"');\"><i class='fa fa-history'></i></button>";	
    						jQuery("#standactivity_grid").jqGrid('setRowData',ids[i],{act:aud_data+au});
        			}	
				  },
   				onSelectRow: function(ids) { 
 				},
 				onSelectAll: function(aRowids, status) {
 				},
 				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id, pager_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       pager_id = "p_"+subgrid_table_id;
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FrmGrid.activityStatus.do?activity_id="+jQuery("#standactivity_grid").getRowData(row_id).activity_id,
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
	 	   					jQuery("#standactivity_grid").resetSelection();
	 	   				}
    		       });
    		       jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,search:false,add:false,del:false});
    		   }				     		
        	});

        	
            grid_harvest.jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                    {startColumnName: 'activity', numberOfColumns: 3, titleText: '<em><s:text name="planting.stand.activity"/></em>'},
                    {startColumnName: 'pl_tech_volume', numberOfColumns: 5, titleText: '<em><s:text name="frm.private.request.planning"/></em>'},
                    {startColumnName: 'im_tech_volume', numberOfColumns: 5, titleText: '<em><s:text name="frm.infrastructure.planning.implementation"/></em>'}
                ]});  
                 	
        	
            grid_harvest.jqGrid('filterToolbar',{searchOperators : true});
              	
            grid_harvest.jqGrid('navGrid','#standactivity_grid_pager',
                	{edit: false, search:false,add:false, del:false, refresh:true, view:true},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        	.navButtonAdd('#standactivity_grid_pager',{
		   	   caption:"", 
		   	   title:'<s:text name="label.button.edit"/>', 
		   	   id:"edit_button",
		   	   buttonicon:"ui-icon-pencil", 
		   	   onClickButton: function(){ 
		   			var iRow = grid_harvest.jqGrid('getGridParam','selrow');
		   			if(iRow){
		   				$("#edit_button").addClass('ui-state-disabled');
		   				var rowData = jQuery("#standactivity_grid").getRowData(iRow); 
						var link = "Harvest.standPlanPage.do?standharvestId=" + rowData.id + "&standId=" + rowData.stand_nr + "&annualplanId=" + $("#annualplanId").val();
						openDialogForm('stand_page_content',link,"<s:text name="annual.plan.harvest"/>",windowWidth,windowHeight); 
		   			}else{
		   				alert("<s:text name="tender.request.alarm"/>");
		   	   		}   
		   	   }, 
		   	   position:"last"
		   	});
            if(oplVal=='R'){
	            grid_harvest.navButtonAdd('#standactivity_grid_pager',{
			   	   caption:"", 
			   	   title:"<s:text name='frm.global.grid.button.trigger.workflow'/>", 
			   	   buttonicon:"ui-icon-transferthick-e-w", 
			   	   onClickButton: function(){ 
			   	   var ids = grid_harvest.jqGrid('getGridParam','selarrrow');
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
	     		                   var val = grid_harvest.jqGrid('getCell', ids[i], 'id');
	     		                   selectedVals.push(val);
	     		               }
	     		               var  formData = "activityIdList=" + selectedVals.join(",");
	     					   $.ajax({
	     							data : formData, 
	     							type : 'POST', // GET or POST
	     							url : 'HarvestStatus.do', 
	     							async : false,
	     							beforeSend : function(jqXHR, settings) {
	     							},
	     							error : function(errorThrown, status, jqXHR) { // on error..
	     								alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
	     							},
	     							success : function(data, status, jqXHR) { // on success..
	     								var errors = jqXHR.getResponseHeader("errors_exits");
	     								if(!errors){
	     									jQuery("#standactivity_grid").trigger("reloadGrid");
	     									
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
          
		   	
            if(oplVal=='R' &&( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL')){
        	jQuery("#stand_grid").jqGrid({
        	   	url:'FrmGrid.stands.do',
        	    postData: {mun_id: $("#munId").val(),for_harvest:true},	
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
        	   	colNames:['ID', 
        	        	   	 '<s:text name="frm.compartment.object.id"/>',
        	        	   	 '<s:text name="law.suit.label.managment.unit"/>',
        	        	   	 '<s:text name="frm.compartment.comp.id"/>',
        	        	   	 '<s:text name="frm.compartment.comp.id"/>',
        	        	   	 '<s:text name="frm.stand.stand"/>',
        	        	   	 '<s:text name="frm.stand.forest.type"/>',
	       	        	   	 '<s:text name="frm.stand.stock.level"/>',
	       	        	   	 '<s:text name="frm.stand.access.type"/>',
	       	        	   	 '<s:text name="frm.stand.basal.area"/>',
	       	        	   	 '<s:text name="frm.stand.estabilished.year"/>',
	       	        	   	 '<s:text name="frm.stand.stand.height"/>',
	       	        	  	 '<s:text name="frm.stand.stand.acres"/>',
	       	        	  	 '<s:text name="frm.compartment.region.name"/>',
	       	        	  	 '<s:text name="annual.plan.municipality"/>',
	       	        	  	
	       	        	  	 '<s:text name="frm.stand.volume.m3.ha"/>',
	       	        	  	 '<s:text name="frm.stand.estemate.trees.per.ha"/>',
	       	        	     '<s:text name="dem.fiskos.managment.class.id"/>'],	   	
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'comp_objectid',index:'comp_objectid', hidden:true,width:'100%',align:"right"},
        	   		{name:'mgmt_unit',index:'mgmt_unit', width:'100%', search:false},
        	   		{name:'stand_id',index:'stand_id', width:'100%',align:"center",hidden:true, search:true},
        	   		{name:'comp_nr',index:'comp_nr', width:'100%',align:"center", search:true},
        	   		{name:'stand_nr',index:'stand_nr', width:'100%',align:"center", search:true},
        	   		{name:'forest_typ',index:'forest_typ', width:'100%', search:false, hidden:true},
        	   		{name:'stock_level',index:'stock_level', width:'100%', search:false, hidden:true},
        	   		{name:'access_type',index:'access_type', width:'100%', search:false, hidden:true},
        	   		{name:'basal_area',index:'basal_area', width:'100%',align:"center", search:false},
        	   		{name:'estabilished_year',index:'estabilished_year', width:'100%',align:"center", search:false},
        	   		{name:'stand_height',index:'stand_height', width:'100%',align:"center", search:false},
        	   		{name:'stand_acres',index:'stand_acres', width:'100%',align:"center", search:false, hidden:true},
        	   		{name:'region',index:'region', width:'100%', search:false},
        	   		{name:'municipality',index:'municipality', width:'100%', search:false},
        	   		{name:'volume_m3ha',index:'volume_m3ha', width:'100%', search:false},
        	   		{name:'estimate_trees_per_ha',index:'estimate_trees_per_ha', width:'100%', search:false},
        	   		{name:'mngmclass',index:'mngmclass', width:'100%', search:false}
        	   		],
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	   	pager: '#stand_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "<s:text name="frm.compartment.stands"/>",
    			ondblClickRow: function(id, iRow, iCol, e) {
   				}        		

        	});
            
        	jQuery("#stand_grid").jqGrid('filterToolbar',{searchOperators : true});
        	
        	jQuery("#stand_grid").jqGrid('navGrid','#stand_grid_pager',
                	{edit: false, add:false, search:false,del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
			
        	if(oplVal=='R' &&( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL')){
        		  jQuery("#stand_grid").navButtonAdd('#stand_grid_pager',{
					   	   caption: "",
					   	   title: "<s:text name="annual.plan.activity.plan"/>",  
					   	   buttonicon: "ui-icon-clipboard",
					   	   id:"activity_button", 
					   	   onClickButton: function(){ 
					   			var iRow = jQuery("#stand_grid").jqGrid('getGridParam','selrow');
					   			if(iRow){
					   				$("#activity_button").addClass('ui-state-disabled');
									var rowData = jQuery("#stand_grid").getRowData(iRow); 
									var link = "Stand.planPage.do?standId=" + rowData.id + "&annualplanId=" + $("#annualplanId").val();
									openDialogForm('stand_page_content',link,"<s:text name="annual.plan.harvest"/>",windowWidth,windowHeight);
					   			}else{
					   				alert("<s:text name="tender.request.alarm"/>");
					   	   		} 					   	      
					   	   }, 
					   	   position: "last"
		  		   });
        	  }
            }
        $(window).bind('resize', function() {
            var width = $('#jqGrid_harvest_container').width();
            $('#standactivity_grid').setGridWidth(width);
            $('#stand_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<input type="hidden" name="user" id="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<div id="jqGrid_harvest_container">
			
				<table id="standactivity_grid" class="scroll"></table> 
				<div id="standactivity_grid_pager" class="scroll" style="text-align:center;"></div>
				<br>
				<table id="stand_grid" class="scroll"></table> 
				<div id="stand_grid_pager" class="scroll" style="text-align:center;"></div>
			
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
