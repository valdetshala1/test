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
var saved='false';
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


        	var lastSel = 0;
			var rowId = 0; 
			jQuery("#private_request_impl_grid").jqGrid({
        	   	url:'FrmGrid.privateRequestImpl.do',	
        		datatype: "json",
        		postData: {pvtReq_id: $("#pvtReq_id").val()},
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
        	   	colNames:[ 'Id',
        	        	   	'<s:text name="frm.private.request.id"/>', 
        	        	   	'<s:text name="frm.private.request.actual.status"/>', 
        	        	   	'<s:text name="frm.private.request.is.new"/>', 
        	        	   	'<s:text name="ann.plan.tree.species.ID"/>', 
        	        	   	'<s:text name="annu.seedling.label.tree.species"/>', 
        	        	   	'<s:text name="law.suit.label.diameter.13"/>', 
        	        	   	'<s:text name="frm.private.request.factor"/>', 
        	        	   	'<s:text name="law.suit.label..leight"/>', 
        	        	   	'<s:text name="frm.private.request.tech.volume"/>', 
        	        	   	'<s:text name="frm.private.request.fire.volume"/>', 
        	        	   	'<s:text name="frm.private.pulp.volume"/>', 
        	        	   	'<s:text name="frm.private.request.pulp.volume"/>', 
        	        	   	'<s:text name="frm.stand.remarks"/>', 
        	        	   	'<s:text name="bid.grid.created.date"/>', 
        	        	   	'<s:text name="bid.grid.created.by"/>' 
        	        	  ],
        	   	colModel:[
        	   		{name:'idImpl',index:'idImpl',hidden:true, width:'50%', editable:false},
        	   		{name:'pvt_req_id',index:'pvt_req_id',hidden:true, width:'50%', editable:false},
        	   		{name:'actual_status',index:'actual_status',hidden:true, width:'50%', editable:false},
        	   		{name:'isnew',index:'isnew',hidden:true, width:'50%', editable:false},
        	   		{name:'tree_species_id',index:'tree_species_id',hidden:true, width:'50%'},
        	   		{name:'tree_species',index:'tree_species', width:'50%',align:"right", search:false, editable:true,sortable : true,
            	   		editoptions: {size:10,maxlength:30, dataInit:function(el){
          						$(el).autocomplete({
        					        source: function(request, response) {
        					            $.ajax({
        					            	type:"get",
        					                url: "Input.treeSpecies.do",
        					                dataType: "json",
        					                data: {
        										featureClass: "P",
        										style: "full",
        										maxRows: 12,
        										name_startsWith: request.term,
        										
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
        					        },
        					        select: function(event, ui) {
												var ts= ui.item.id;
												$('#private_request_impl_grid').jqGrid("setCell", rowId , 'tree_species_id', ts);
        					        }  
        					    });
                	   		}
	
            	   		} },
        	   		{name:'diameter_1_3',index:'diameter_1_3', width:'50%',align:"right", search:false, editable:true,  formatter: 'number'},
        	   		{name:'factor',index:'factor', width:'50%',align:"right", search:false, editable:true,  formatter: 'number'},
        	   		{name:'height',index:'height', width:'50%',align:"right", search:false, editable:true , formatter: 'number'},
        	   		{name:'tech_volume',index:'tech_volume', width:'50%',align:"center", search:false, editable:true, formatter: 'number'},
        	   		{name:'fire_volume',index:'fire_volume', width:'50%',align:"center", search:false, editable:true,  formatter: 'number'},
        	   		{name:'pulp_volume',index:'pulp_volume', width:'50%',align:"center", search:false, editable:true,  formatter: 'number'},
        	   		{name:'volume_total',index:'volume_total', width:'50%',align:"center", search:false, editable:false,   formatter: 'number'},
        	   		{name:'remarks',index:'remarks', width:'50%', search:false, editable:true},
        	   		{name:'created_date',index:'created_date', width:'50%',align:"center", search:false,  editable:false},
        	   		{name:'created_by',index:'created_by', width:'50%', search:false,  editable:false}
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#private_request_impl_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		caption: "<s:text name="frm.private.request.marking.data"/>", 
	               loadonce: true,
	               rowEdit: true,   
	               rowsubmit: 'clientArray',
	               cellsubmit : 'clientArray',
	               editurl: 'clientArray',                           
	               pager: "#private_request_impl_grid_pager",
	               loadtext:'<s:text name="grid.loading.text"/>', 
	               add:true,
	               keys : true, 
	               ajaxGridOptions: { contentType: "application/json"},
    			ondblClickRow: function(id, iRow, iCol, e) {

					
   				},
   		      onSelectRow: function(id){
           	   if (id && id !== lastSel) {
                      $("#private_request_impl_grid").jqGrid('restoreRow', lastSel); 
                      $("#private_request_impl_grid").jqGrid('saveRow', id);
                      $("#private_request_impl_grid").editRow(id, true);
                  } else {
               	   $("#private_request_impl_grid").jqGrid('restoreRow', lastSel); 
               	   $("#private_request_impl_grid").editRow(id, true);
                  }
           	   lastSel = id;
     
              }
   								     		

        	}).navGrid('#private_request_impl_grid_pager',{edit:false,add:false,del:false,search:false});

        	
            grid.jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                ]});  
                 	
        	var userLevel='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
            grid.jqGrid('filterToolbar',{searchOperators : true});
              	
            grid.jqGrid('navGrid','#private_request_impl_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
			
//             var rowDataReqImpl=$("#private_request_impl_grid").jqGrid('getGridParam', 'records');
//             alert(rowDataReqImpl);
				if(($("#pvtReq_status").val()==$("#statusSubmit").val() && userLevel=='R') || ($("#pvtReq_status").val()==$("#terrainDoneStatus").val() && userLevel=='R') ){
	        	grid.navButtonAdd('#private_request_impl_grid_pager',{
		            	   caption:"", 
		            	   title:"<s:text name="label.button.add"/>",  
		            	   buttonicon:"ui-icon-plus", 
		            	   
		            	   onClickButton: function(){ 
		            		   $("#private_request_impl_grid").jqGrid('saveRow', rowId);
		            		   rowId++;
		            		   var parameters =
		                       {
		                           rowID: rowId,
		                           initdata: {
		                               id: rowId,
		                        	   isnew:"true"
		                               //IdField: $('#IdField').val(),
		                               //Description: $('#IdField option:selected').text()
		                           },
		                           position: "last",
		                           useDefValues: true,
		                           useFormatter: false,
		                           addRowParams: { extraparam: {} }
		                       };

		                   $("#private_request_impl_grid").jqGrid('addRow', parameters);
		                        saved='false';           	   
		            		   
		            	   }, 
		            	   position:"last"
		            }).navButtonAdd('#private_request_impl_grid_pager',{
		            	   caption:"", 
		            	   title:"<s:text name="label.button.save"/>", 
		            	   buttonicon:"ui-icon-disk", 
		            	   onClickButton: function(){ 
		            		   var selr = jQuery('#private_request_impl_grid').jqGrid('getGridParam','selrow'); 
		            		   $("#private_request_impl_grid").jqGrid('saveRow', selr);
		            		   var tech_volume=jQuery('#private_request_impl_grid').jqGrid ('getCell', rowId, 'tech_volume');
		            		   var fire_volume=jQuery('#private_request_impl_grid').jqGrid ('getCell', rowId, 'fire_volume');
		            		   var pulp_volume=jQuery('#private_request_impl_grid').jqGrid ('getCell', rowId, 'pulp_volume');
		            		   var volume_total=parseFloat(tech_volume)+parseFloat(fire_volume)+parseFloat(pulp_volume);
		            		   jQuery('#private_request_impl_grid').jqGrid('setCell', rowId, 'volume_total', volume_total);
		            		   saved='true';
		            	   }, 
		            	   position:"last"
		            	})
		          	.navButtonAdd('#private_request_impl_grid_pager',{
		            	   caption:"", 
		            	   title:"<s:text name="label.button.delete"/>", 
		            	   buttonicon:"ui-icon-trash", 
		            	   onClickButton: function(){ 
		            		   var selr = jQuery('#private_request_impl_grid').jqGrid('getGridParam','selrow'); 
		            		   $('#private_request_impl_grid').jqGrid('delRowData', selr);
		            	   }, 
		            	   position:"last"
		            	});
				}
       
        $(window).bind('resize', function() {
            var width = $('#jqGrid_prvReqImpl_container').width();
            $('#private_request_impl_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_prvReqImpl_container">
				<input id="pvtReq_id" name="pvtReq_id" value="<s:property value='privateRequest.id'/>" type="hidden">
				<input id="pvtReq_status" name="pvtReq_status" value="<s:property value='privateRequest.activityStatus.status.getDOMKEY()'/>" type="hidden">
				<input id="statusSubmit" name="statusSubmit" value="<s:property value='statusSubmit.getDOMKEY()'/>" type="hidden">
				<input id="terrainDoneStatus" name="terrainDoneStatus" value="<s:property value='terrainDone.getDOMKEY()'/>" type="hidden">
				<table id="private_request_impl_grid" class="scroll"></table> 
				<div id="private_request_impl_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
<%-- 			<input id="compId" value="<s:property value='compId'/>" type="hidden"> --%>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
