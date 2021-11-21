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
//         var comp_id;
 		function zoomComp(grid, rowId){
        	var rowData=jQuery("#compartment_grid").getRowData(rowId);
        	loadCompFeature(rowData.id);
        }

 		function jumpToStands(grid, rowId){
 			$( "#com_tab" ).tabs( "enable", 2 );
        	var rowData=jQuery("#compartment_grid").getRowData(rowId);
        	var index = $("#com_tab>div").index($("#stand_tab"));
        	$("#compId").val(rowData.id);
        	$("#comp_id").val(rowData.id);
        	$("#mun_id").val(rowData.mun_id);
        	$("#mun_name").val(rowData.mun_name);
            $('#com_tab').tabs({ active: index });	
        }
        $(document).ready(function () {
        	jQuery("#compartment_grid").jqGrid({
        	   	url:'FrmGrid.compartmens.do?mup_id=' + $("#mup_id").val(),	
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
        	   	colNames:[ 'Id',
            	   		   '',
        	        	   '',
        	        	   '',
        	   	           '<s:text name="frm.compartment.region.name"/>',
        	   	           '<s:text name="frm.compartment.comp.id"/>',
        	        	   '<s:text name="frm.compartment.remarks"/>',
        	        	   '<s:text name="frm.menagementunit.list.standnum"/>',
        	        	   '<s:text name="dhpet.animal.capacity.label.area"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'mun_id',index:'mun_id',hidden:true, width:'50%'},
        	   		{name:'mun_name',index:'mun_name',hidden:true, width:'50%'},
        	   		{name : 'act', index:'act', sortable:false, search:false, width:'90%' },
        	   		{name:'region_name',index:'region_name', width:'100%',align:"center", search:true},
        	   		{name:'comp_nr',index:'comp_nr', width:'100%',align:"center", search:true},
        	   		{name:'note',index:'note', width:'100%',align:"center", sorttype:'string',search:false , searchoptions:{sopt:['eq','bw','bn','cn','nc','ew','en']}},
        	   		{name:'nr_stands',index:'nr_stands', width:'50%',align:"center", sorttype:'string',search:false , searchoptions:{sopt:['eq','bw','bn','cn','nc','ew','en']}},
        	   		{name:'area_mask',index:'area_mask', width:'100%',align:"center", sorttype:'string', search:false , searchoptions:{sopt:['eq','bw','bn','cn','nc','ew','en']}},

        	   		],
        	   	rowNum:23,
        	   	rowList:[23,30,50],
        	   	pager: '#compartment_grid_pager',
        	   	sortname: 'c.id',
        	    viewrecords: true,
        	    sortorder: "desc",
				gridComplete: function(){
        			var ids = jQuery("#compartment_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        				var rowData=jQuery("#compartment_grid").getRowData(cl);
        				var butt="";
        				js = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"jumpToStands('#compartment_grid', '"+cl+"');\"><i class='fa fa-arrow-right'></i></button>";
						au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('Compartment','#compartment_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        				butt+=js;
						if(rowData.area_mask){
							zc = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"zoomComp('#compartment_grid', '"+cl+"');\"><i class='fa fa-search-plus'></i></button>";
							butt+=zc;
						}
    					jQuery("#compartment_grid").jqGrid('setRowData',ids[i],{act:butt+au});
        			}	
        		},
//         	    multiselect: true,
        		multiboxonly:true,
//         		caption: "<s:text name='frm.comartment.compartments'/>",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery("#compartment_grid").getRowData(iRow); 
    				var link = "Compartment.form.do?compartmentId=" + rowData.id;
    				loadURL(link, $("#compartment_form_content"));
   				},
   				onSelectRow: function(ids) { 
   					var rowData = jQuery("#compartment_grid").getRowData(ids);
   	   				if(rowData) { 
  	  	   	   			jQuery("#stand_grid").jqGrid('setGridParam',{url:"FrmGrid.stands.do?comp_id="+rowData.id}); 
   						jQuery("#stand_grid").trigger('reloadGrid'); 
   						}
				}      		

        	});

        	jQuery("#compartment_grid").jqGrid('filterToolbar',{searchOperators : true});

              	
        	jQuery("#compartment_grid").jqGrid('navGrid','#compartment_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.navButtonAdd('#compartment_grid_pager',{
				   	   caption:"", 
				   	   title:"<s:text name="label.button.edit"/>", 
				   	   buttonicon:"	ui-icon-plusthick",
					   onClickButton: function(){
		      				 var myGrid = $('#compartment_grid');
		      				 var iRow = myGrid.jqGrid ('getGridParam', 'selrow');
		      				var link;
			 		   			if(iRow){
			 		   				var rowData = jQuery("#compartment_grid").getRowData(iRow); 
			      				  	link = "Compartment.form.do?compartmentId=" + rowData.id+"&compartment.managementUnit.id="+$("#mu_id").val()+"&compartment.managementUnitPeriod.id="+$("#mup_id").val();
			 		   			}else{
			 		   				link = "Compartment.form.do?compartment.managementUnit.id="+$("#mu_id").val()+"&compartment.managementUnitPeriod.id="+$("#mup_id").val();
				 		   			}
			 		   		openDialogForm('compartment_form_content',link,'<s:text name="frm.compartment.data"/>',500,500);
		      		   	   }, 
				   	   position:"last"
				   	});
       
        $(window).bind('resize', function() {
            var width = $('#jqGrid_comp_container').width();
//             $('#compartment_grid').setGridWidth(width);	
//             $('#stand_grid').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
<input id="mu_id" name="mu_id" value="<s:property value='mu_id'/>" type="hidden">
<input id="mup_id" name="mup_id" value="<s:property value='mup_id'/>" type="hidden">
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_comp_container">
				<table id="compartment_grid" class="scroll"></table> 
				<div id="compartment_grid_pager" class="scroll" style="text-align:center;"></div>
				<br>
<!-- 				<table id="stand_grid" class="scroll"></table>  -->
<!-- 				<div id="stand_grid_pager" class="scroll" style="text-align:center;"></div> -->
			</div>
			<input id="compId" value="<s:property value='compId'/>" type="hidden">
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
