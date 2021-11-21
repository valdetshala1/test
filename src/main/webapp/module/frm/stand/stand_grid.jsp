<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.unchecked{ background-color:red !important; }
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">

        function editStand(grid, rowId){
        	var rowData=jQuery("#stand_grid").getRowData(rowId);
        	var link = "Stand.form.do?standId=" + rowData.id+"&compId=<s:property value="compId"/>&mupId=<s:property value="mupId"/>";
        	loadURL(link,$("#stand_form_content"));
        	loadStandFeature(rowData.id);
        }
        $(document).ready(function () {
            var link = 'FrmGrid.stands.do?comp_id='+$("#comp_id").val();
        	jQuery("#stand_grid").jqGrid({
        	   	url:link,	
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
        	   	colNames:['ID', 
       	        	   	'',
       	        	   	'<s:text name="frm.compartment.comp.id"/>',
       	        	   	'<s:text name="frm.stand.compartment"/>',
       	        	   	'<s:text name="frm.stand.stand"/>',
       	        	   	'',
       	        	   	'<s:text name="dem.fiskos.managment.class.id"/>',
       	        	   	'<s:text name="frm.stand.forest.type"/>',
       	        	   	'<s:text name="frm.stand.access.type"/>',
       	        	   	'<s:text name="frm.stand .basal.area"/>  (ha)',
//        	        	   	'<s:text name="frm.stand.estabilished.year"/>',
//        	        	   	'<s:text name="frm.stand.stand.height"/>',
//        	        	   	'<s:text name="frm.stand.stand.acres"/>',
       	        	   	'<s:text name="official.travel.status"/>'
        	   		],       	   	
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'60%',search:false},
        	   		{name:'comp_objectid',index:'comp_objectid', hidden:true,width:'100%',align:"right"},
        	   		{name:'comp_nr',index:'comp_nr', width:'50%',align:"center",search:false},
        	   		{name:'stand_nr',index:'stand_nr', width:'50%',align:"center",search:true},
        	   		{name:'stand_id',index:'stand_id',hidden:true, width:'100%',align:"center",search:true},
        	   		{name:'mngmclass',index:'mngmclass', width:'100%',align:"right",search:false},
        	   		{name:'stand_type',index:'stand_type', width:'100%',align:"right",search:false},
        	   		{name:'access_type',index:'access_type', width:'100%',align:"right",search:false},
        	   		{name:'basal_area',index:'basal_area', width:'100%',align:"center",search:false},
//         	   		{name:'estabilished_year',index:'estabilished_year', width:'100%',align:"center",search:false},
//         	   		{name:'stand_height',index:'stand_height', width:'100%',align:"center",search:false},
//         	   		{name:'stand_acres',index:'stand_acres', width:'100%',align:"center",search:false},
        	   		{name:'status',index:'status', width:'100%',align:"center",hidden:false,search:false}
        	   		],
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	   	pager: '#stand_grid_pager',
        	   	sortname: 'id',
				gridComplete: function(){
        			var ids = jQuery("#stand_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
    						au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('Stand','#stand_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					pa = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"editStand('#stand_grid', '"+cl+"');\"><i class='fa fa-pencil'></i></button>";
        					jQuery("#stand_grid").jqGrid('setRowData',ids[i],{act:pa+' '+au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiboxonly:true,
        		loadComplete: function (){
        			var rowIDs = jQuery("#stand_grid").getDataIDs(); 
        		      for (var i=0;i<rowIDs.length;i=i+1){ 
        		        rowData=jQuery("#stand_grid").getRowData(rowIDs[i]);
        		        var trElement = jQuery("#"+ rowIDs[i],jQuery('#stand_grid'));
        		        if (rowData.status == 'UCH') { 
        		            trElement.removeClass('ui-widget-content');
        		            trElement.addClass('unchecked');
        		        }
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
              	
        	jQuery("#stand_grid").jqGrid('navGrid','#stand_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false, search:false})
        			.navButtonAdd('#stand_grid_pager',{
				   	   caption:"", 
				   	   title:"<s:text name="label.button.edit"/>", 
				   	   buttonicon:"ui-icon-pencil", 
				   	   onClickButton: function(){ 
				   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
				   			if(iRow){
								var rowData = jQuery(this).getRowData(iRow); 
								var link = "Stand.form.do?standId=" + rowData.id;
								loadURL(link, $("#stand_form_content"));
				   			}else{
				   	   			alert("<s:text name="global.please.select.row"/>");
				   	   		}   
				   	   }, 
				   	   position:"last"
				   	})
				   	.navButtonAdd('#stand_grid_pager',{
					   	   caption:"<s:text name="label.button.report"/>", 
					   	   title:"<s:text name="label.button.report"/>", 
					   	   buttonicon:"ui-icon-print", 
					   	   onClickButton: function(){
						   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
					   			if(iRow){ 
					   				var rowData = jQuery(this).getRowData(iRow); 
									var link = "Stand.report.do?standId=" + rowData.id;
									openDialogForm('report_generator_content',link,"<s:text name="label.button.report.generator"/>",800,420);
					   			}else{
					   	   			alert("<s:text name="global.please.select.row"/>");
					   	   		}
					   	   }, 
					   	   position:"last"
					});
        jQuery("#stand_grid").jqGrid('filterToolbar',{searchOperators : true});

        $(window).bind('resize', function() {
            var width = $('#jqgrid_stand_container').width();
            $('#stand_grid').setGridWidth(width);
        });
                
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
<input id="compId" name="compId" value="<s:property value='compId'/>" type="hidden">
<input id="mupId" name="mupId" value="<s:property value='mupId'/>" type="hidden">
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqgrid_stand_container">
				<table id="stand_grid" class="scroll"></table> 
				<div id="stand_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
		
		<div id="stand_form_content">
			<jsp:include page="stand_form.jsp"></jsp:include>
		</div>
 </body>   
			
</html>	
