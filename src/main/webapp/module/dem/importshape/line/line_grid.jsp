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
		function zoomLine(grid, rowId){
	    	var rowData=jQuery("#line_grid").getRowData(rowId);
	    	loadLineFeature(rowData.id);
	    }
		function zoomRoad(grid, rowId){
	    	var rowData=jQuery("#road_grid").getRowData(rowId);
	    	loadRoadFeature(rowData.id);
	    }
	    function deleteLinertemp(linetempId){
			$.SmartMessageBox({
				title : "<s:text name="line.temp.status.deleted.title"/>", 
				content : "<s:text name="annual.plan.activity.status.change.content"/>", 
				buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
				icon : "fa fa-bell"
				
			}, function(ButtonPressed) {
				if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
					   $.ajax({
							data : "lineTempId="+linetempId, 
							type : 'POST', // GET or POST
							url : 'DeleteLineTemp.do', 
							async : false,
							beforeSend : function(jqXHR, settings) {
							},
							error : function(errorThrown, status, jqXHR) { // on error..
								alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
							},
							success : function(data, status, jqXHR) { // on success..
								var errors = jqXHR.getResponseHeader("errors_exits");
								if(!errors){
									jQuery("#line_grid").trigger("reloadGrid");
									$.smallBox({
										title : '<s:text name="small.box.on.delete.title.success"/>',
										content : '<s:text name="small.box.content"/>',
										color : "#739E73",
										timeout: 5000,
										icon : "fa fa-check",
										number : "1"
									});									
								}else{
									$.smallBox({
										title : '<s:text name="small.box.on.delete.title.failed"/>',
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
		

		    }
	          
        $(document).ready(function () {
            var actualStatus="IM";
        	$grid = jQuery("#line_grid").jqGrid({
        	   	url:'DemGrid.linetemp.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData:{status:actualStatus},
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
                overflow:'hidden',
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id', 
        	        	   	'',
        	        	   'ltheme', 
        	        	   '<s:text name="frm.line.ltheme.name"/>',
        	        	   	'<s:text name="frm.line.quality.cl"/>',
        	        	   	'<s:text name="frm.line.maintenance"/>',
        	        	   	'<s:text name="hum.employee.label.comment"/>',
        	        	   	'<s:text name="frm.line.file.format"/>',
        	        	   	'<s:text name="vehicles.label.date"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'50',search:false},   	
        	   		{name:'ltheme12',index:'ltheme12', width:'50', resizable:true},
        	   		{name:'ltheme12_name',index:'ltheme12_name', width:'150', resizable:true},
        	   		{name:'quality_cl',index:'quality_cl', width:'50'},
        	   		{name:'maintenanc',index:'maintenanc', width:'50'},
        	   		{name:'comment',index:'comment', width:'100'},
        	   		{name:'file_format',index:'file_format', width:'50'},
        	   		{name:'date',index:'date', width:'100'},
        	   		{name:'created_by',index:'created_by', width:'100', align:"left"},
        	   		{name:'created',index:'created', width:'100',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#line_grid_pager',
        		gridComplete: function(){
        			var ids = jQuery("#line_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
							au = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"zoomLine('#line_grid', '"+cl+"');\"><i class='fa fa-search-plus'></i></button>";
							de = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"deleteLinertemp( '"+cl+"');\"><i class='fa  fa-trash-o'></i></button>";
  							var btn = au;
  							if(actualStatus=='IM'){
  								btn=au+" "+de;
  	  							}
        					jQuery("#line_grid").jqGrid('setRowData',ids[i],{act:btn});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
 					var selrow = jQuery(this).jqGrid('getGridParam','selrow');
 		           if(selrow){
		 		         var rowData = jQuery(this).getRowData(selrow);
           				var link = "PerfIndicator.form.do?indicatorId=" + rowData.id;
       					loadURL(link, $("#perf_indicator_form_con tent"));
 		           }
 					
   				}    		

        	});

        	jQuery("#line_grid").jqGrid('navGrid','#line_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, cloneToTop: false},
        			{}, {},{},{multipleSearch:false, recreateFilter:false});
			
        	jQuery("#line_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#line_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
	             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
	         	   			if(iRow){
	            				var rowData = jQuery(this).getRowData(iRow); 
	            				var link = "ImportLine.form_content.do?lineTempId=" + rowData.id;
	         					loadURL(link, $("#linetemp_form_content"));
	         	   			}else{
	         	   	   			alert("<s:text name="global.please.select.row"/>"); 
	         	   	   		}   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
 
        jQuery("#road_grid").jqGrid({
    	   	url:'FrmGrid.road.do',	
    	   	mtype: 'GET',
    		datatype: "json",
    	//	postData: {munId: $("#munId").val()},
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
        	   			'',
    	        	   	'<s:text name="frm.infrastructure.cad.mun.id"/>', 
    	        	   	'<s:text name="frm.infrastructure.cad.mun.name"/>', 
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
    	   		{name:'act',index:'act', width:'25',search:false},   	
    	   		{name:'cadastralMunId',index:'cadastralMunId', hidden:true,width:'100',align:"right"},
    	   		{name:'cadMunName',index:'cadMunName', width:'100',align:"right"},
    	   		{name:'name',index:'name', width:'100%',align:"right"},
    	   		{name:'roadType',index:'roadType', width:'100',align:"right"},
    	   		{name:'accessType',index:'accessType', width:'100',align:"right"},
    	   		{name:'roadStatus',index:'roadStatus', width:'100',align:"right"},
    	   		{name:'lastActivityYear',index:'lastActivityYear', width:'100',align:"right"},
    	   		{name:'roadLength',index:'roadLength', width:'100',align:"right"},
    	   		{name:'createdDate',index:'createdDate', width:'100',align:"right"},
    	   		{name:'createdBy',index:'createdBy', width:'100',align:"right"}
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
    		gridComplete: function(){
    			var ids = jQuery("#road_grid").jqGrid('getDataIDs');
    			for(var i=0;i < ids.length;i++){
    					var cl = ids[i];
						au = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"zoomRoad('#line_grid', '"+cl+"');\"><i class='fa fa-search-plus'></i></button>";
    					jQuery("#road_grid").jqGrid('setRowData',ids[i],{act:au});
    			}	
    		},
			ondblClickRow: function(id, iRow, iCol, e) {
				}        		

    	});
    	
    	jQuery("#road_grid").jqGrid('navGrid','#road_grid_pager',
            	{edit: false, add:false, search:false,del:false, refresh:true, view:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }
        $("#roadDiv").hide();
        $('input[type=radio]').change(function() {
            if (this.value == 'US') {
               $("#tempDiv").hide();
               $("#roadDiv").show();
               var width = $('#jqGrid_line_container').width();
               $('#road_grid').setGridWidth(width);
            }
            else{
            	actualStatus=this.value;
            	jQuery("#line_grid").jqGrid('setGridParam', { 
                    postData: { status: actualStatus }
                  }).trigger('reloadGrid');  
                
                 $("#tempDiv").show();
            	 $("#roadDiv").hide();
            }
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_line_container').width();
            $('#line_grid').setGridWidth(width);
            $('#road_grid').setGridWidth(width);
        });
        

        
        });
    </script>
    
</head>
<body>
	<div class="smart-form">
	 <section>
			<div class="inline-group">
				<label class="radio">
					<input type="radio" name="radio-inline" value="IM" id="imported" checked="">
					<i></i><s:text name='dem.line.status.imported'/></label>
				<label class="radio">
					<input type="radio" id="deleted" value="DL" name="radio-inline">
					<i></i><s:text name='dem.line.status.deleted'/></label>
				<label class="radio">
					<input type="radio" id="used" value="US" name="radio-inline">
					<i></i><s:text name='dem.line.status.used'/></label>
			</div>
		</section>
		</div>
		<!-- widget div-->
		<div  style="margin-bottom: 1.0em;">
			<div id="jqGrid_line_container">
				<div id="roadDiv">
				  	<table id="road_grid" class="scroll"></table> 
					<div id="road_grid_pager" class="scroll" style="text-align:center;"></div>	
				</div>
				<div id="tempDiv">
					<table id="line_grid" class="scroll"></table> 
					<div id="line_grid_pager" class="scroll" style="text-align:center;"></div>
				</div>

			</div>
		</div>
		
		<!-- end widget div -->
 </body>   
			
</html>	
