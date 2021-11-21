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
        function isNumber(element){
        	$(element).keyup(function(){
                var val1 = element.value;
                var num = new Number(val1);
                if(isNaN(num))
                {this.value="";alert("Please enter a valid number");}
            });	
        }
        
//         var fire_details;
        $(document).ready(function () {
            var fireDetailsArray=new Array();
            var lastSel = 0;
    		var rowId = 0;
    		var fire_details = $("#fire_details"); 
        	fire_details.jqGrid({
            	   url:'FrmGrid.fireDetails.do?fire_id='+$("#fire\\.id").val(),	
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
                   colNames:['fd_id',
                             'fire_report_id',
                             '<s:text name="frm.stand.compartment"/>',
                             'comp_id', 
                             '<s:text name="law.suit.label.stand"/>', 
                             'stand_id',
                             '<s:text name="fire.damage.m2"/>',
                             '<s:text name="fire.damage.m3"/>',
                             '<s:text name="fire.damage.euro"/>'
                           ],
    	       	   colModel:[
    					{name:'fd_id',index:'fd_id', width:'100%', hidden:true, editable:true},	
    					{name:'fire_report_id',index:'fire_report_id', width:'100%', hidden:true, editable:false},
    					{ name: 'compId', index: 'compId', width: '200%', align: 'left',align:"center"},	     	
    	       	   		{name:'comp_id',index:'comp_id', width:'100%', editable:true,hidden:true},
    	       	   		{ name: 'standId', index: 'standId', width: '200%',align:"center", editable: true,
    						editoptions:{
    					        dataInit:function(el){
	    					    	    $(el).select2({
	    					    			placeholder: '-- Select --',                	        
	    					    	        minimumInputLength: 0,
	    					    	        ajax: {
	    					    		        url: "Input.stand.do?mu_id="+$("#fire\\.managementUnit\\.id").val(),
	    					    		        dataType: 'json',
	    					    		        quietMillis: 250,
	    					    		        data: function (term, page) {
		    					    		        return {
		    					    		        	featureClass: "P",
		    					    					style: "full",
		    					    					maxRows: 12,            
		    					    		        	name_startsWith: term,
		    					    		        };
	    					    		        },
	    					    		        results: function (data, page) {
	    					    		        return { results: data };
	    					    		        },
	    					    		        cache: true
	    					    	        },
	    					    	        initSelection: function(element, callback) {
	    					    	        },
	    					    	        dropdownAutoWidth: false,
	    					    	        formatResult : function(item){
	    					    	        	var desc='';
	    					                    if(item){
	    					                    	 desc =
	    					                        '<div style="border: 1px solid #333333;  padding: 5px;">' +
	    					                            "<div><s:text name="law.suit.label.stand"/> : " + item.stand_id + "</div>" +
	    					                            "<div><s:text name="frm.stand.compartment"/> : " + item.compId + "</div>" +
	    					                            "<div><s:text name="frm.compartment.mu.name"/> : " + item.mu_id + "</div>" +
	    					                        '</div>';
	    					                    	return desc;
	    					                    }else{
	    					                    	 return "";
	    					                    }
	    					                
	    					                    
	    					                },
	    					                formatSelection: function(item){
	    					                    var ids = fire_details.jqGrid('getDataIDs');
	    					                    for (var i = 0; i < ids.length + 1; i++) {
	    					                    	$('#' + ids[i] + '_stand_id').val(item.id);
	    					                    	$('#' + ids[i] + '_comp_id').val(item.comp_id);
	    					                    	$('#' + ids[i] + '_standId').val(item.stand_id);
	    					                    }
	    					                    return item.stand_id;
	    					                },	        
	    					    	        allowClear: true,
	    					    	        dropdownCssClass: "bigdrop",
	    					    	        escapeMarkup: function (m) { return m; }
	    					    	    });
    					        }
    						}
    					},	     	
    	       	   		{name:'stand_id',index:'stand_id', width:'100%', editable:true,hidden:true},
    	       	   		{name:'damage_m2',index:'damage_m2',align:"center", width:'100%', editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'damage_m3',index :'damage_m3',align:"center", width:'100%', align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'damage_euro',index:'damage_euro',align:"center", width:'100%', align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},		
    	       	   	
    	       	   	],
    	       	   pager: "#fire_detail_pager",
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
                   caption:"<s:text name="fire.firedetails"/>",
                   ajaxGridOptions: { contentType: "application/json"},
                   serializeGridData: function (data) {
                       //alert($.toJSON(data));
                       return JSON.stringify(fireDetailsArray);
                       //return $.toJSON(data);
                   },
                   loadBeforeSend: function (xhr, settings) {
                       if(!$("#fire\\.id").val() || $("#empty_grid").val()=='true'){
    	            	   this.p.loadBeforeSend = null; //remove event handler
    	            	   return false; // dont send load data request
                       }
                	},
                   gridComplete: function () {
                   },
                   afterSaveCell: function (rowid, name, val, iRow, iCol) {
                   },
                   oneditfunc: function() {
                       alert ("edited"); 
                   },
                   onSelectRow: function(id){
                      
                	   if (id && id !== lastSel) {
                           $("#fire_details").jqGrid('restoreRow', lastSel); 
                           $("#fire_details").jqGrid('saveRow', id);
                           $("#fire_details").editRow(id, true);
                       } else {
                    	   $("#fire_details").jqGrid('restoreRow', lastSel); 
                    	   $("#fire_details").editRow(id, true);
                       }
                	   lastSel = id;
          
                   }
                   
               });
        	$("#fire_details").jqGrid('navGrid','#fire_detail_pager',
                	{edit: false, add:false, del:false, view:false,search:false, refresh:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
              	.navButtonAdd('#fire_detail_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.add"/>", 
                	   buttonicon:"ui-icon-plus", 
                	   id:"add_button",
                	   onClickButton: function(){
                		   $("#fire_details").jqGrid('saveRow', rowId);
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

                       $("#fire_details").jqGrid('addRow', parameters);
                                       	   
                		   
                	   }, 
                	   position:"last"
                })           
              	.navButtonAdd('#fire_detail_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.delete"/>", 
                	   buttonicon:"ui-icon-trash",
                	   id:"delete_button", 
                	   onClickButton: function(){
                		   var selr = jQuery('#fire_details').jqGrid('getGridParam','selrow'); 
                		   if(selr){
                		   		$('#fire_details').jqGrid('delRowData', selr);
                		   }
                	   }, 
                	   position:"last"
                	});
//         	$("#fire_details").jqGrid('navGrid','#fire_detail_pager',{},{width:1000});
//   	        $(window).bind('resize', function() {
//   	            var width = $('#jqGrid_firedetails_container').width();
//   	            $('#fire_details').setGridWidth(width);
//   	        });
        	});
        $(window).resize(function () {
        	// when the browser size changes so does the grid
            $("#fire_details").jqGrid('setGridWidth', $('#jqGrid_firedetails_container').width(), false);
        });

        $(window).bind('resize', function() {
        	//trick - make small
        	$('#fire_details').setGridWidth(100);
        	
        	var width = $('#jqGrid_firedetails_container').width();
            // Set grid width to .jqGrid_order_item_container and them go responsive
            $("#fire_details").jqGrid('setGridWidth', width, false);
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
				<table id="fire_details" class="scroll"></table> 
				<div id="fire_detail_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
