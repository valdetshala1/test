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
        var location_land_type;
        var lastSel = 0;
		var rowId = 0;
        $(document).ready(function () {
    		var location_land_type = $("#location_land_type"); 
            initDate = function (elem) {
                $(elem).datetimepicker({
        			lang: '<s:property value="#lang"/>',
        			format: 'd.m.Y',
        			mask: false,
        			formatDate:'d.m.Y',
        			timepicker: false,
        	    			
        		});
            },
            dateTemplate = {align: "center", sorttype: "date", width: 94,
                editrules: { date: true }, editoptions: { dataInit: initDate },
//                 searchoptions: {
//                     sopt: ["eq", "ne", "lt", "le", "gt", "ge"],
//                     attr: { maxlength: 9, size: 11 }, // for searching toolbar
//                     maxlength: 10, size: 11, // for searching dialog
//                     dataInit: initDate
//                 },
                formatter: "date", formatoptions: { srcformat: "ISO8601Short", newformat: "d.m.Y" }
                };
        	location_land_type.jqGrid({ 
            	   url:'DhpetGrid.locationlandtype.do?location_id='+$("#dhpetLocation\\.id").val(),	
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
                   colNames:['id',
                             'location_id',
                             '<s:text name='frm.dhpet.location.land.type.label'/>',
                             '<s:text name='frm.dhpet.location.priv.land.area.label'/>',
                             '<s:text name='frm.dhpet.location.pub.land.area.label'/>',
                             '<s:text name='frm.dhpet.location.total.area.label'/>',
                             '<s:text name='budget.maintenance.financial.created.by'/>',
                             '<s:text name='budget.maintenance.financial.created.time'/>'
                           ],
    	       	   colModel:[
    					{name:'t_id',index:'t_id', width:'100%', hidden:true, editable:true},	
    					{name:'location_id',index:'location_id', width:'100%', hidden:true, editable:false},
    					{ name: 'land_type', index: 'land_type', width: '110%', editable: true,  edittype: 'select',  align: 'left',
    					  	 editoptions: {
    					           value: {
    		                         'FL': 'Pyje dhe toka pyjore',
    		                         'PA': 'Livadhe',
    		                         'WS': 'Burime uji'
    	    					         }
    					  	 }
    					},
    	       	   		{name:'private_land_area',index:'private_land_area',align:"center", width:'80%', editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'public_land_area',index:'public_land_area',align:"center", width:'80%', editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'total_area',index:'total_area',align:"center", width:'80%', editable:false,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'created_by',index:'created_by',align:"center", width:'100%', editable:false},
    	       	   		{name:'created_date',index:'created_date',align:"center", width:'100%', editable:false}
 	    	       	   	],
    	       	   pager: "#location_land_type_pager",
//                    rowNum:10,
//            	   	   rowList:[10,20,30],
                   viewrecords: true,
                   sortname: "t_id",
                   sortorder: "asc",
                   width: 'auto',
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
                   caption:"<s:text name="frm.dhpet.hunting.land.type.compound"/>",
                   ajaxGridOptions: { contentType: "application/json"},
                   serializeGridData: function (data) {

                   },

                   gridComplete: function () {
//                 	   rowId=$("#location_land_type").getRowData().length;
                   },
                   afterSaveCell: function (rowid, name, val, iRow, iCol) {
                   },
                   oneditfunc: function() {
                       alert ("edited"); 
                   },
                   onSelectRow: function(id){
                	   if (id && id !== lastSel) {
                           $("#location_land_type").jqGrid('restoreRow', lastSel); 
                           $("#location_land_type").jqGrid('saveRow', id);
                           $("#location_land_type").editRow(id, true);
                       } else {
                    	   $("#location_land_type").jqGrid('saveRow', lastSel); 
                    	   $("#location_land_type").jqGrid('restoreRow', id); 
                     	   $("#location_land_type").editRow(id, true);
                       }
                	   lastSel = id;
                   }
                   
               });
        	location_land_type.jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                    {startColumnName: 'private_land_area', numberOfColumns: 2, titleText: '<em><s:text name="frm.dhpet.location.ownership.label"/></em>'},
                ]});  
        	$("#location_land_type").jqGrid('navGrid','#location_land_type_pager',
                	{edit: false, add:false, del:false, view:false,search:false, refresh:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});

        	  var oplVal='<s:property value="user.getOrganisation().getOperLevelVal()"/>';

             $("#location_land_type").navButtonAdd('#location_land_type_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.add"/>", 
                	   buttonicon:"ui-icon-plus", 
                	   id:"add_button",
                	   onClickButton: function(){
                		   $("#location_land_type").jqGrid('saveRow', rowId);
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

                       $("#location_land_type").jqGrid('addRow', parameters);
                	   }, 
                	   position:"last"
                }).navButtonAdd('#location_land_type_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.save"/>", 
            	   buttonicon:"ui-icon-disk", 
            	   onClickButton: function(){ 
            		   var selr = jQuery('#location_land_type').jqGrid('getGridParam','selrow'); 
            		   $("#location_land_type").jqGrid('saveRow', selr);
                       var private_ha=jQuery('#location_land_type').jqGrid ('getCell', selr, 'private_land_area');
                       var public_ha=jQuery('#location_land_type').jqGrid ('getCell', selr, 'public_land_area');
                       var total_ha=parseInt(private_ha)+parseInt(public_ha);
            		   jQuery('#location_land_type').jqGrid('setCell', selr, 'total_area', total_ha);

            	   }, 
            	   position:"last"
            	})          
              	.navButtonAdd('#location_land_type_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.delete"/>", 
                	   buttonicon:"ui-icon-trash",
                	   id:"delete_button", 
                	   onClickButton: function(){
                		   var selr = jQuery('#location_land_type').jqGrid('getGridParam','selrow'); 
                		   if(selr){
                		   		$('#location_land_type').jqGrid('delRowData', selr);
                		   }
                	   }, 
                	   position:"last"
                	});
        	});
        $(window).resize(function () {
        	// when the browser size changes so does the grid
            $("#location_land_type").jqGrid('setGridWidth', $('#jqGrid_firedetails_container').width(), false);
        });

        $(window).bind('resize', function() {
        	//trick - make small
        	$('#location_land_type').setGridWidth(100);
        	
        	var width = $('#jqGrid_firedetails_container').width();
            // Set grid width to .jqGrid_order_item_container and them go responsive
            $("#location_land_type").jqGrid('setGridWidth', width, false);
        });            
             
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_firedetails_container">
				<table id="location_land_type" class="scroll"></table> 
<!-- 				<input id="landtype_forest" id="landtype_forest"> -->
				<div id="location_land_type_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
