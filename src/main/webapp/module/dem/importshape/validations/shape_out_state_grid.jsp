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
        	jQuery("#shape_out_state").jqGrid({
//         	   	url:'DemGrid.shapeOutState.do',
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
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
                cmTemplate: {sortable:false},
        	   	colNames:['Stand_id','area out'],
        	   	colModel:[
        	   		{name:'stand_id',index:'stand_id', width:'100%',search:false},
        	   		{name:'area_out',index:'area_out', width:'100%',search:false},
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#shape_out_state_pager',
        	   	sortname: 'stand_id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		multiboxonly: false,
        		caption: "",
        		gridComplete: function(){
        			var gridLength = jQuery("#shape_out_state").jqGrid('getDataIDs').length;
        			if(gridLength>0){
//         				shapeOutState();
        				window.open("ImportValidations.do?validationType=C&validationNumber=2",'_blank');
//     	 				$.ajax({
// 	   					    type : "GET",
// 	   					    url : "ImportShape.onFailImportStatus.do?import_type='C'",
// 	   					    async : false,
// 	   					    beforeSend : function(jqXHR, settings) {
// 	   					    },
// 	   					    error : function(errorThrown, status, jqXHR) {
// 	   					     alert("error:" + errorThrown + ", status:" + status);
// 	   					    },
// 	   					    success : function(data, status, jqXHR) {
// // 		   					     alert("Import failed");
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
    					$("#import_shape_content").hide();
        				$("#shape_out_state_grid_content").show();
        				$("#step_2").css("background","#D84C4C");
            			}else{
            				$.smallBox({
        						title : "<s:text name="small.box.on.save.title.success"/>", 
        						content : "<s:text name="small.box.content"/>", 
        						color : "#739E73",
        						timeout: 5000,
        						icon : "fa fa-check",
        						number : "1"
        					});
            				$("#step_2").css("background","#34712A");
            				$("#validation_li_2").removeClass("active");
            				$("#validation_li_3").addClass("active");
        					jQuery("#shape_overlap_stand").jqGrid('setGridParam', {url:"DemGrid.shapeOverlapStand.do"});
        		            jQuery("#shape_overlap_stand").trigger('reloadGrid');	
                		}
            	},
        		loadBeforeSend: function(){
//         			$("#validation_li_2").addClass("active");	
            	}
        	});
              	
        	jQuery("#shape_out_state").jqGrid('navGrid','#shape_out_state_pager',
                	{edit: false, add:false, del:false, refresh:false, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});

        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_shosh_container').width();
            $('#shape_out_state').setGridWidth(width);
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
			<div id="jqGrid_shosh_container">
				<table id="shape_out_state" class="scroll"></table> 
				<div id="shape_out_state_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
