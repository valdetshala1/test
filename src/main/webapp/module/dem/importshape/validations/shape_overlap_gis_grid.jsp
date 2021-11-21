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
        $(document).ready(function () {
        	jQuery("#shape_overlap_stand_gis").jqGrid({
//         	   	url:'DemGrid.shapeOverlapStandGIS.do',	
				url:'',
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
        		cmTemplate: {sortable:false},
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
                cmTemplate: {sortable:false},
        	   	colNames:['fmr','mu','comp','stand','stand_id','fmr_b','mu_b','comp_b','stand_b','stand_id_b','count_part','area'],
        	   	colModel:[
        	   		{name:'fmr',index:'fmr', width:'100%',search:false},
        	   		{name:'mu',index:'mu', width:'100%',search:false},
        	   		{name:'comp',index:'comp', width:'100%',search:false},
        	   		{name:'stand',index:'stand', width:'100%',search:false},
        	   		{name:'stand_id',index:'stand_id', width:'100%',search:false},
        	   		{name:'fmr_b',index:'fmr_b', width:'100%',search:false},
        	   		{name:'mu_b',index:'mu_b', width:'100%',search:false},
        	   		{name:'comp_b',index:'comp_b', width:'100%',search:false},
        	   		{name:'stand_b',index:'stand_b', width:'100%',search:false},
        	   		{name:'stand_id_b',index:'stand_id_b', width:'100%',search:false},
        	   		{name:'count_part',index:'count_part', width:'100%',search:false},
        	   		{name:'area',index:'area', width:'100%',search:false},
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#shape_overlap_stand_gis_pager',
        	   	sortname: 'stand_id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		multiboxonly: false,
        		caption: "",
        		gridComplete: function(){
        			var gridLength = jQuery("#shape_overlap_stand_gis").jqGrid('getDataIDs').length;
        			if(gridLength>0){
        				$("#shape_overlap_gis_grid_content").show();
        				$("#step_4").css("background","#D84C4C");
        				$("#import_shape_content").hide();
        				window.open("ImportValidations.do?validationType=C&validationNumber=4",'_blank');
// 	 					$.ajax({
// 	   					    type : "GET",
// 	   					    url : "ImportShape.onFailImportStatus.do?import_type='C'",
// 	   					    async : false,
// 	   					    beforeSend : function(jqXHR, settings) {
// 	   					    },
// 	   					    error : function(errorThrown, status, jqXHR) {
// 	   					     alert("error:" + errorThrown + ", status:" + status);
// 	   					    },
// 	   					    success : function(data, status, jqXHR) {
// //		   					     alert("Import failed");
// 	   					    },
// 	   					    complete : function(jqXHR, textStatus) {
// 	   					    }
//    					   });
    					$.smallBox({
    						title : "<s:text name="small.box.on.save.title.failed"/>", 
    						content : "<s:text name="small.box.content"/>", 
    						color : "#C79121",
    						timeout: 5000,
    						icon : "fa fa-shield fadeInLeft animated",
    						number : "2"
    					});
            			}else{
            				$.smallBox({
        						title : "<s:text name="small.box.on.save.title.success"/>", 
        						content : "<s:text name="small.box.content"/>", 
        						color : "#739E73",
        						timeout: 5000,
        						icon : "fa fa-check",
        						number : "1"
        					});
            				$("#step_4").css("background","#34712A");
            				$("#validation_li_4").removeClass("active");
            				$("#validation_li_5").addClass("active");
        					jQuery("#shape_fields_control").jqGrid('setGridParam', {url:"DemGrid.shapeFieldsControl.do"});
        		            jQuery("#shape_fields_control").trigger('reloadGrid');	
                		}
            	},
        	});
              	
        	jQuery("#shape_overlap_stand_gis").jqGrid('navGrid','#shape_overlap_stand_gis_pager',
                	{edit: false, add:false, del:false, refresh:false, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_shape_overlap_stand_gis_container').width();
            $('#shape_overlap_stand_gis').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<input id="assets" value="<s:property value='assets'/>" type="hidden">
			<div id="jqGrid_shape_overlap_stand_gis_container">
				<table id="shape_overlap_stand_gis" class="scroll"></table> 
				<div id="shape_overlap_stand_gis_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
