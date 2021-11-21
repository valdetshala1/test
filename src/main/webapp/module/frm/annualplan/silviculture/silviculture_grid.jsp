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
			dom_code:"SLV"
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
                        
        	grid = jQuery("#silviculture_grid").jqGrid({
        	   	url:'FrmGrid.silviculture.do',	
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
        	   	colNames:[ 'Id','<s:text name="audit.title"/>',
        	        	   	'<s:text name="planting.stand.status"/>', 
          	   	            '<s:text name="frm.compartment.comp.id"/>',
            	   	        '<s:text name="frm.stand.stand.ID"/>', 
          	   	            '<s:text name="frm.compartment.comp.id"/>',
            	   	        '<s:text name="frm.stand.stand.ID"/>', 
        	        	   	'<s:text name="frm.silviculture.activity"/>',
        	        	   	'<s:text name="frm.silviculture.tree.species.group"/>',
        	        	   	'<s:text name="annual.plan.status.id"/>', 
        	        	   	'<s:text name="planting.stand.work.stage"/>',
        	        	   	'<s:text name="frm.silviculture.plan.area"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>',
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	'<s:text name="frm.silviculture.impl.area"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>', 
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	'<s:text name="annual.plan.status.id"/>',
        	        	   	'<s:text name="ann.plan.activity.ID"/>'
        	        	  ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act',hidden:false, width:'60%'},
        	   		{name:'status_icon',index:'status_icon', width:'50%', sortable:true, align:"left", editable:false, frozen:true, search:true, stype:'select', 
        	   			searchoptions:{ value: ':;NEW:<s:text name="tender.request.button.new"/>;SUB:<s:text name="annu.status.button.submitted"/>;APR:<s:text name="tender.request.button.approved"/>;REJ:<s:text name="tender.request.button.rejected"/>'}
                	},
                	{name:'comp_id',index:'comp_id', width:'100%',align:"center",hidden:true},
                	{name:'stand_id',index:'stand_id', width:'100%',align:"center",hidden:true},
                   	{name:'comp_nr',index:'comp_nr', width:'100%',align:"center"},
                	{name:'stand_nr',index:'stand_nr', width:'100%',align:"center"},
    				{name:'activity',index:'activity', width:'100%',align:"left"},
        	   		{name:'tree_species_group',index:'tree_species_group',  width:'100%',sortable:true, align:"left", editable:false, search:true, stype:'select', 
    					searchoptions:{ value: ':;CON:<s:text name="annu.mgmt.unit.label.coniferous"/>;BRO:<s:text name="annu.felling.label.brle.tree.regen.fel"/>'}, frozen:true},
        	   		{name:'stand_id',index:'stand_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'work_stage',index:'work_stage', width:'100%',align:"right", search:false},
        	   		{name:'pl_area',index:'pl_area', width:'100%',align:"right", search:false},
        	   		{name:'pl_created_date',index:'pl_created_date', width:'100%',align:"right", search:false},
        	   		{name:'pl_created_by',index:'pl_created_by', width:'100%',align:"right", search:false},
        	   		{name:'im_area',index:'im_area', width:'10s0%',align:"right", search:false},
        	   		{name:'im_created_date',index:'im_created_date', width:'100%',align:"right", search:false},
        	   		{name:'im_created_by',index:'im_created_by', width:'100%',align:"right", search:false},
        	   		{name:'status_id',index:'status_id', hidden:true},
        	   		{name:'activity_id',index:'activity_id', hidden:true}
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#silviculture_grid_pager',
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
	    				var link = "Silviculture.plan_page.do?silvicultureId=" + rowData.id +"&standId=" + rowData.stand_id + "&annualplanId=" + $("#annualplanId").val();
						openDialogForm('stand_page_content',link,"<s:text name="frm.stand.silviculture.planning"/>",windowWidth,windowHeight);
    				}else{alert('<s:text name="tender.request.alarm"/>');
    				}
					
   				},
   				onSelectRow: function(ids) { 
//    					var rowData = jQuery("#silviculture_grid").getRowData(ids);
//    	   				if(rowData) { 
//   	  	   	   			jQuery("#stand_silviculture_grid").jqGrid('setGridParam',{url:"FrmGrid.stands.do?comp_id="+rowData.id}); 
//    						jQuery("#stand_silviculture_grid").trigger('reloadGrid'); 
//    						}
				},
		        gridComplete: function(){
   		       		var ids = jQuery("#silviculture_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				   var rowData = jQuery("#silviculture_grid").getRowData(ids[i]);
    						au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('Activity','#silviculture_grid', '"+rowData.activity_id+"');\"><i class='fa fa-google'></i></button>";	
    						aud_data = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('StandSilvicultureActivity','#silviculture_grid', '"+ids[i]+"');\"><i class='fa fa-history'></i></button>";
    						jQuery("#silviculture_grid").jqGrid('setRowData',ids[i],{act:aud_data+au});
        			}	
				  },
 				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		    	var subgrid_table_id, pager_id;
     		       subgrid_table_id = subgrid_id+"_t";
     		       pager_id = "p_"+subgrid_table_id;
     		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FrmGrid.activityStatus.do?activity_id="+jQuery("#silviculture_grid").getRowData(row_id).activity_id,
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
 	   					jQuery("#silviculture_grid").resetSelection();
 	   				}
    		       });
    		       jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,search:false,add:false,del:false});
    		   }						     		

        	});

        	
            grid.jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                    {startColumnName: 'activity', numberOfColumns: 3, titleText: '<em><s:text name="frm.silviculture.activity"/></em>'},
                    {startColumnName: 'work_stage', numberOfColumns: 5, titleText: '<em><s:text name="frm.silviculture.planning"/></em>'},
                    {startColumnName: 'im_area', numberOfColumns: 5, titleText: '<em><s:text name="frm.infrastructure.planning.implementation"/></em>'}
                ]});  
                 	
        	
            grid.jqGrid('filterToolbar',{searchOperators : true});
              	
            grid.jqGrid('navGrid','#silviculture_grid_pager',
                	{edit: false, add:false, search:false,del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.navButtonAdd('#silviculture_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="label.button.edit"/>", 
		   	   buttonicon:"ui-icon-pencil", 
		   	   onClickButton: function(){ 
		   		var iRow = jQuery("#silviculture_grid").jqGrid('getGridParam','selrow');
	   			if(iRow){
					var rowData = jQuery("#silviculture_grid").getRowData(iRow); 
					var link = "Silviculture.plan_page.do?silvicultureId=" + rowData.id +"&standId=" + rowData.stand_id + "&annualplanId=" + $("#annualplanId").val();
					openDialogForm('stand_page_content',link,"<s:text name="frm.stand.silviculture.planning"/>",windowWidth,windowHeight);
	   			}else{
	   	   			alert("<s:text name="global.please.select.row"/>");
	   	   		}
		   	   }, 
		   	   position:"last"
		   	});
            if('<s:property value="user.getOrganisation().getOperLevelVal()"/>'=='R' && ( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL') ){	
            	jQuery("#silviculture_grid").navButtonAdd('#silviculture_grid_pager',{
			   	   caption:"", 
			   	   title:"<s:text name="frm.global.grid.button.trigger.workflow"/>", 
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
	     							url : 'SilvicultureStatus.do', 
	     							async : false,
	     							beforeSend : function(jqXHR, settings) {
	     							},
	     							error : function(errorThrown, status, jqXHR) { // on error..
	     								alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
	     							},
	     							success : function(data, status, jqXHR) { // on success..
	     								var errors = jqXHR.getResponseHeader("errors_exits");
	     								if(!errors){
	     									jQuery("#silviculture_grid").trigger("reloadGrid");
	     									
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
				   	   	alert("<s:text name="frm.global.please.select.row"/>");
				   	}		 
			   	   }, 
			   	   position:"last"
			   	});
			   }
//             if($("#planStatus").val()==='APR'){
// 			   	jQuery("#silviculture_grid").navButtonAdd('#silviculture_grid_pager',{
// 				   	   caption:"<s:text name="report.grid.caption"/>", 
// 				   	   title:"<s:text name="report.grid.caption"/>", 
// 				   	   buttonicon:"	ui-icon-print", 
// 				   	   onClickButton: function(){ 
// 								$.SmartMessageBox({
// 			     					title : "<s:text name="report.operation.alert.title"/>",
// 			     					content : "<s:text name="report.operation.alert.content"/>",
// 			     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
// 			     					icon : "fa fa-bell"
			     					
// 			     				}, function(ButtonPressed) {
// 			     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
// 			     						var parameters = "p_mun_id="+$("#munId").val()+"&p_year="+$("#year").val()+"&p_rep_type=Implementimi "+"&p_user="+$("#user").val();
// 			     						var reportName = "frm/annualplan/silviculture/municipality_implement_report.rptdesign";
// 			     						//openBirtViewer("frm/annualplan/silviculture/municipality_report.rptdesign", parameters);
// 			     						//var link = "frameset?__report="+reportName+"&__parameterpage=false&__title=KFIS Report Viewer&"+parameters;
// 			     						var link = "run?__report="+reportName+"&__parameterpage=false&__title=KFIS Report Viewer&"+parameters;
// 			     						var win = window.open(link, '_blank');
// 			     						win.focus();			     						
// 				     				}//EOF IF ButtonPressed
// 			     				});
// 				   	   }, 
// 				   	   position:"last"
// 				   	});	
//             }
	 if('<s:property value="user.getOrganisation().getOperLevelVal()"/>'=='R' && ( $("#planStatus").val()=='NEW' || $("#planStatus").val()=='RPL') ){	
        	jQuery("#stand_silviculture_grid").jqGrid({
        	   	url:'FrmGrid.stands.do',	
        	   	mtype: 'GET',
        	    postData: {mun_id: $("#munId").val()},	
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
        	        	   	'<s:text name="frm.compartment.comp.id"/>',
        	        	   	'<s:text name="frm.compartment.menu"/>', 
        	        	   	'<s:text name="law.suit.label.stand"/>',
        	        	   	'<s:text name="frm.stand.forest.type"/>', 
        	        	   	'<s:text name="frm.stand.stock.level"/>', 
        	        	   	'<s:text name="frm.stand.access.type"/>', 
        	        	   	'<s:text name="frm.stand.basal.area"/>', 
        	        	   	'<s:text name="frm.stand.estabilished.year"/>', 
        	        	   	'<s:text name="frm.stand.stand.height"/>',
        	        	   	'<s:text name="frm.stand.stand.acres"/>', 
        	        	   	'<s:text name="frm.compartment.region.name"/>',
        	        	   	'<s:text name="annual.plan.municipality"/>',
        	        	   	'<s:text name="law.suit.label.managment.unit"/>',
        	        	   	'<s:text name="frm.stand.volume.m3.ha"/>',
       	        	  	    '<s:text name="frm.stand.estemate.trees.per.ha"/>',
       	        	        '<s:text name="dem.fiskos.managment.class.id"/>'],	   	
       	   	colModel:[
       	   		{name:'id',index:'id',hidden:true, width:'50%'},
       	   		{name:'comp_objectid',index:'comp_objectid', hidden:true,width:'100%',align:"right"},
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
       	   		{name:'mgmt_unit',index:'mgmt_unit', width:'100%', search:false},
       	   		{name:'volume_m3ha',index:'volume_m3ha', width:'100%', search:false},
       	   		{name:'estimate_trees_per_ha',index:'municipality', width:'100%', search:false},
    	   		{name:'mngmclass',index:'mngmclass', width:'100%', search:false}
       	   		],       	   		
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	   	pager: '#stand_silviculture_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "<s:text name="frm.compartment.stands"/>",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				}        		

        	});

        	jQuery("#stand_silviculture_grid").jqGrid('filterToolbar',{searchOperators : true});
        	
        	jQuery("#stand_silviculture_grid").jqGrid('navGrid','#stand_silviculture_grid_pager',
                	{edit: false, add:false, search:false,del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
				   		jQuery("#stand_silviculture_grid").navButtonAdd('#stand_silviculture_grid_pager',{
					   	   caption: "",
					   	   title: "<s:text name="frm.stand.silviculture.planning"/>",  
					   	   buttonicon: "ui-icon-clipboard", 
					   	   onClickButton: function(){ 
					   			var iRow = jQuery("#stand_silviculture_grid").jqGrid('getGridParam','selrow');
					   			if(iRow){
									var rowData = jQuery("#stand_silviculture_grid").getRowData(iRow); 
									var link = "Silviculture.plan_page.do?standId=" + rowData.id + "&annualplanId=" + $("#annualplanId").val();
									openDialogForm('stand_page_content',link,"<s:text name="frm.stand.silviculture.planning"/>",windowWidth,windowHeight);
					   			}else{
					   	   			alert("<s:text name="global.please.select.row"/>");
					   	   		} 					   	      
					   	   }, 
					   	   position: "last"
		  		   }) ;
				 }
       
        $(window).bind('resize', function() {
            var width = $('#jqGrid_silvic_container').width();
            $('#silviculture_grid').setGridWidth(width);
            $('#stand_silviculture_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<input type="hidden" name="user" id="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<div id="jqGrid_silvic_container">
				<table id="silviculture_grid" class="scroll"></table> 
				<div id="silviculture_grid_pager" class="scroll" style="text-align:center;"></div>
				<br>
				
				<table id="stand_silviculture_grid" class="scroll"></table> 
				<div id="stand_silviculture_grid_pager" class="scroll" style="text-align:center;"></div>
				
				
			</div>
<%-- 			<input id="compId" value="<s:property value='compId'/>" type="hidden"> --%>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
