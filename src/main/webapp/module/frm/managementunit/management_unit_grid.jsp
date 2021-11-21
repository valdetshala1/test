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
        function zoomUnit(grid, rowId){
        	var rowData=jQuery("#managementunit_grid").getRowData(rowId);
        	loadMUnitFeature(rowData.mu_period_id);
        }
        function jumpToComp(grid, rowId){
        	$( "#com_tab" ).tabs( "enable", 1 );
        	$( "#com_tab" ).tabs( "disable", 2 );
        	var rowData=jQuery("#managementunit_grid").getRowData(rowId);
        	var index = $("#com_tab>div").index($("#compartment_tab"));
        	$("#mu_id").val(rowData.id);
        	$("#region_id").val(rowData.region_id);
        	$("#mup_id").val(rowData.mu_period_id);
            $('#com_tab').tabs({ active: index });
           
        }
        function addMUPeriod(grid, rowId){
        	var rowData=jQuery("#managementunit_grid").getRowData(rowId);
        	var link="ManagementUnit.mupForm.do?managementUnitPeriod.managementUnit.id="+rowData.id;
        	openDialogForm('mup_form_content',link,"<s:text name='frm.managementunitperiod.name'/>",500,350);
        }
        $(document).ready(function () {
        	jQuery("#managementunit_grid").jqGrid({
        	   	url:'FrmGrid.managementUnits.do',	
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
        	   	colNames:[
							'',
        	        	   	'ID', 
        	        	   	'region_id',
        	        	   	'<s:text name="frm.compartment.region.name"/>',
        	        	   	'<s:text name="annu.management.unit.menu"/>',
        	        	   	'<s:text name="requisition.unit.of.issue.code"/>',
        	        	   	'<s:text name="dhpet.animal.capacity.label.area"/>',
        	        	   	'<s:text name="mer.execution.note"/>',
        	        	   	'mu_period_id',
        	        	   	'<s:text name="frm.menagementunit.list.compnum"/>',
        	        	   	'<s:text name="frm.menagementunit.list.standnum"/>'
        	   		],       	   	
        	   	colModel:[
					{name : 'act', index:'act', sortable:false, search:false, width:'80%' },
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'region_id',index:'region_id', hidden:true,width:'100%',align:"right"},
        	   		{name:'region_name',index:'region_name', width:'100%',align:"center",search:false},
        	   		{name:'mu_name',index:'mu_name', width:'100%',align:"center",search:true},
        	   		{name:'mu_code',index:'mu_code', width:'100%',align:"right",search:true},
        	   		{name:'area_mask',index:'area_mask', width:'100%',align:"right",search:false},
        	   		{name:'note',index:'note', width:'100%',align:"right",search:false},
        	   		{name:'mu_period_id',mu_period_id:'note',hidden:true, width:'100%',align:"right",search:false},
        	   		{name:'compartments_num',index:'compartments_num', width:'50%',align:"right",search:false},
        	   		{name:'stand_num',index:'stand_num', width:'50%',align:"right",search:false},
        	   		],
        	   	rowNum:15,
        	   	rowList:[15,30,60],
        	   	pager: '#managementunit_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        	    gridComplete: function(){
        			
        			var ids = jQuery("#managementunit_grid").jqGrid('getDataIDs');
        				
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        				var rowData=jQuery("#managementunit_grid").getRowData(cl);
        				var butt="";
        				if(rowData.area_mask){
	        				de = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"zoomUnit('#managementunit_grid', '"+cl+"');\"><i class='fa fa-search-plus'></i></button>";
	        				butt+=de;
	        			}
        				if(rowData.mu_period_id){
        					jc = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"jumpToComp('#managementunit_grid', '"+cl+"');\"><i class='fa fa-share'></i></button>";
        					butt+=jc;
            			}else{
        					pa = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"addMUPeriod('#managementunit_grid', '"+cl+"');\"><i class='fa fa-plus'></i></button>";
        					butt+=pa;
            			}
							au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('ManagementUnitPeriod','#managementunit_grid', '"+rowData.mu_period_id+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#managementunit_grid").jqGrid('setRowData',ids[i],{act:butt+au});
        			}	
        		},
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Stand.form.do?standId=" + rowData.id;
    				loadURL(link, $("#stand_form_content"));
   				}        		

        	});
        	var cLevel='<s:text name='user.getOrganisation().getOperLevelVal()'/>';
			if(cLevel=='C'){
        	jQuery("#managementunit_grid").jqGrid('navGrid','#managementunit_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false, search:false})
	       			.navButtonAdd('#managementunit_grid_pager',{
	       				caption:"", 
	      		   	   title:"Shto", 
	      		   	   buttonicon:"ui-icon-plus",
	      			   onClickButton: function(){
	      				 var myGrid = $('#managementunit_grid');
	      				 var iRow = myGrid.jqGrid ('getGridParam', 'selrow');
	      				var link;
		 		   			if(iRow){
		 		   				var rowData = jQuery("#managementunit_grid").getRowData(iRow); 
		      				  	link = "ManagementUnit.form.do?managementUnitId="+rowData.id;
		 		   			}else{
		 		   				link = "ManagementUnit.form.do";
			 		   			}
		 		   		openDialogForm('management_form_content',link,"<s:text name='law.suit.label.managment.unit'/>",500,500);
	      		   	   },  
	      		   	   position:"last"
       			   	});		
			}	
        	jQuery("#managementunit_grid").jqGrid('filterToolbar',{searchOperators : true});
 		   	
        $(window).bind('resize', function() {
            var width = $('#jqGrid_stand_container').width();
            $('#managementunit_grid').setGridWidth(width);
        });
        window.dispatchEvent(new Event('resize'));       
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }   
        });     
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div >

			<div id="jqGrid_stand_container">
				<table id="managementunit_grid" class="scroll"></table> 
				<div id="managementunit_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
