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
        function isNumber(element){
        	$(element).keyup(function(){
                var val1 = element.value;
                var num = new Number(val1);
                if(isNaN(num))
                {this.value="";alert("Please enter a valid number");}
            });	
        }
        var infrastructure_declare;
        $(document).ready(function () {
            var lastSel = 0;
    		var rowId = 0;
    		var infrastructure_declare = $("#infrastructure_declare"); 
        	infrastructure_declare.jqGrid({ 
            	   url:'FrmGrid.infraImplDeclare.do?road_id='+$("#roadActivity\\.id").val(),	
                   datatype: "json",
              	 	jsonReader : {
     			      root:"rows",
     			      page: "page",
     			      total: "total",
     			      records: "records",
     			      repeatitems: false,
     			     id: "0"
          			},
          		   rownumbers: true,
                   colNames:['rd_id',
                             'road_id',
                             '<s:text name='frm.infrastructure.planning.start.from'/>',
                             '<s:text name='frm.infrastructure.planning.end.in'/>',
                             '<s:text name='frm.infrastructure.planning.width'/>',
                             '<s:text name='frm.infrastructure.planning.length'/>',
                             '<s:text name='frm.harvest.planning.im.date'/>',
             	        	 '<s:text name="planting.stand.plan.created.date"/>',
               	        	 '<s:text name="planting.stand.plan.created.by"/>',
               	        	 'editable'		
                           ],
    	       	   colModel:[
    					{name:'rd_id',index:'rd_id', width:'100%', hidden:true, editable:false},	
    					{name:'road_id',index:'road_id', width:'100%', hidden:true, editable:false},
    	       	   		{name:'im_start_m',index:'im_start_m',align:"center", width:'100%', editable:true ,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'im_end_m',index:'im_end_m',align:"center", width:'100%', editable:true ,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'im_width',index:'im_width',align:"center", width:'100%', editable:true ,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'im_lenght',index:'im_lenght',align:"center", width:'100%', editable:false},
        	       	   	{name:'im_date',index:'im_date',align:"center",
    						editoptions:{ 
    							size:20, 
    						    dataInit:function(el){ 
    								$(el).datetimepicker({
    									lang: 'al',
    									format: 'd.m.Y',
    									mask: false,
    									formatDate:'d.m.Y',
    									timepicker: false,
    								});	                        
    						    }, 
    						    defaultValue: function(){ 
    						      var currentTime = new Date(); 
    						      var month = parseInt(currentTime.getMonth() + 1); 
    						      month = month <= 9 ? "0"+month : month; 
    						      var day = currentTime.getDate(); 
    						      day = day <= 9 ? "0"+day : day; 
    						      var year = currentTime.getFullYear();
    						      return day+"."+month + "."+year; 
    						    } 
    						  }    
        	       	   		 , width:'100%', editable:true},		
    	       	   		{name:'im_created_date_dec',index:'im_created_date_dec',align:"center", width:'100%', align:"right"},		
    	       	   		{name:'created_by_dec',index:'im_created_by_dec',align:"center", width:'100%', align:"right"},
    	       	   		{name:'edit',index:'edit',align:"center", width:'100%', align:"right" , hidden:true}		
    	       	   	],
    	       	   pager: "#infrastructure_declare_pager",
//                    rowNum:10,
//            	   	   rowList:[10,20,30],
                   viewrecords: true,
                   sortname: "f.id",
                   sortorder: "asc",
                   width: '100%',
                   height: '100%',
                   autowidth: true,
           		   shrinkToFit: false,
           		   gridview: true,
                   headertitles: true,
                   loadonce: true,
                   rowEdit: true,   
                   rowsubmit: 'clientArray',
                   cellsubmit : 'clientArray',
                   cmTemplate: {sortable:false},
                   editurl: 'clientArray',                           
                   add:true,
                   keys : true, 
                   caption:"<s:text name="frm.harvest.impl.declare"/>",
                   ajaxGridOptions: { contentType: "application/json"},
                   serializeGridData: function (data) {
                       //alert($.toJSON(data));
//                        return JSON.stringify(fireDetailsArray);
                       //return $.toJSON(data);
                   },
//                    loadBeforeSend: function (xhr, settings) {
//                        if(!$("#fire\\.id").val() || $("#empty_grid").val()=='true'){
//     	            	   this.p.loadBeforeSend = null; //remove event handler
//     	            	   return false; // dont send load data request
//                        }
//                 	},
                   gridComplete: function () {
                   },
                   afterSaveCell: function (rowid, name, val, iRow, iCol) {
                   },
                   oneditfunc: function() {
                       alert ("edited"); 
                   },
                   onSelectRow: function(id){
               	    editable = jQuery('#infrastructure_declare').jqGrid ('getCell', id, 'edit');
                	   if (id && id !== lastSel) {
                		   if(editable=''){
                           $("#infrastructure_declare").jqGrid('restoreRow', lastSel); 
                           $("#infrastructure_declare").jqGrid('saveRow', id);
                           $("#infrastructure_declare").editRow(id, true);
                		   }
                       } else {
                    	   if(editable=''){
                    	   $("#infrastructure_declare").jqGrid('restoreRow', lastSel); 
                    	   $("#infrastructure_declare").editRow(id, true);
                    	   }
                       }
                	   lastSel = id;
                   }
               });
        	$("#infrastructure_declare").jqGrid('navGrid','#infrastructure_declare_pager',
                	{edit: false, add:false, del:false, view:false,search:false, refresh:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});

        	 var oplVal='<s:property value="user.getOrganisation().getOperLevelVal()"/>';

 			if(oplVal=='M'){
             $("#infrastructure_declare").navButtonAdd('#infrastructure_declare_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.add"/>", 
                	   buttonicon:"ui-icon-plus", 
                	   id:"add_button",
                	   onClickButton: function(){
                		   $("#infrastructure_declare").jqGrid('saveRow', rowId);
                		   rowId++;
                		   var parameters =
                           {
                               rowID: rowId,
                               initdata: {
                               },
                               position: "last",
                               useDefValues: true,
                               useFormatter: false,
                               addRowParams: { extraparam: {} }
                           };

                       $("#infrastructure_declare").jqGrid('addRow', parameters);
                       $("#infrastructure_declare").jqGrid('setGridParam', {editable: true});    	   
                	   }, 
                	   position:"last"
                }).navButtonAdd('#infrastructure_declare_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.save"/>", 
            	   buttonicon:"ui-icon-disk", 
            	   onClickButton: function(){ 
            		   var selr = jQuery('#infrastructure_declare').jqGrid('getGridParam','selrow'); 
            		   $("#infrastructure_declare").jqGrid('saveRow', selr);
            	   }, 
            	   position:"last"
            	})          
              	.navButtonAdd('#infrastructure_declare_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.delete"/>", 
                	   buttonicon:"ui-icon-trash",
                	   id:"delete_button", 
                	   onClickButton: function(){
                		   var selr = jQuery('#infrastructure_declare').jqGrid('getGridParam','selrow'); 
                		   editable = jQuery('#infrastructure_declare').jqGrid ('getCell', selr, 'edit');
                		   if(selr && editable==''){
                		   		$('#infrastructure_declare').jqGrid('delRowData', selr);
                		   }
                	   }, 
                	   position:"last"
                	});
 				}  
        	});
        $(window).resize(function () {
        	// when the browser size changes so does the grid
            $("#infrastructure_declare").jqGrid('setGridWidth', $('#jqGrid_firedetails_container').width(), false);
        });

        $(window).bind('resize', function() {
        	//trick - make small
        	$('#infrastructure_declare').setGridWidth(100);
        	
        	var width = $('#jqGrid_firedetails_container').width();
            // Set grid width to .jqGrid_order_item_container and them go responsive
            $("#infrastructure_declare").jqGrid('setGridWidth', width, false);
        });            
             
//         /* Remove jquery-ui styles from jqgrid */
//         function removeJqgridUiStyles(){
//             $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
//             $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
//             $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
//             $(".ui-jqgrid-pager").removeClass("ui-state-default");
//         };
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_firedetails_container">
				<table id="infrastructure_declare" class="scroll"></table> 
				<div id="infrastructure_declare_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
