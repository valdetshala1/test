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
        var planting_declare;
        var rowId = 0;
       
        $(document).ready(function () {
            var lastSel = 0;
//     		var rowId = 0;
    		var planting_declare = $("#planting_declare"); 
        	planting_declare.jqGrid({ 
            	   url:'FrmGrid.plantImplDeclare.do?plant_activity_id='+$("#planting\\.id").val(),	
                   datatype: "json",
              	 	jsonReader : {
     			      root:"rows",
     			      page: "page",
     			      total: "total",
     			      records: "records",
     			      repeatitems: false,
     			     id: "0"
          			},
          		   rownumbers: false,
                   colNames:['sd_id',
                             'slv_act_id',
                             '',
                             '<s:text name="planting.stand.impl.area"/>',
                             '<s:text name="planting.stand.impl.trees"/>',
                             '<s:text name='frm.harvest.planning.im.date'/>', 
             	        	 '<s:text name="planting.stand.plan.created.date"/>',
               	        	 '<s:text name="planting.stand.plan.created.by"/>',
               	        	 'editable','im_geom','row_id'
                           ],
    	       	   colModel:[
    					{name:'pd_id',index:'pd_id', width:'100%', hidden:true, editable:false},
    					{name:'plant_activity_id',index:'plant_activity_id', width:'100%', hidden:true, editable:false},
    					{name:'draw',index:'draw', width:'50%'},	
    	       	   		{name:'im_area',index:'im_area',align:"center", width:'100%', editable:false ,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'im_trees',index:'im_trees',align:"center", width:'100%', editable:true ,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
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
    	       	   		{name:'edit',index:'edit',align:"center", width:'100%', align:"right" , hidden:true},
    	       	   		{name:'im_geom',index:'im_geom',align:"center", width:'100%', align:"right" , hidden:true},
    	       	   		{name:'row_id',index:'row_id',align:"center", width:'100%', align:"right" , hidden:true},
    	    	       	 ],
    	       	   pager: "#planting_declare_pager",
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
                   caption:"<s:text name="frm.harvest.impl.declare"/>",
                   ajaxGridOptions: { contentType: "application/json"},
                   serializeGridData: function (data) {
                   },
                   gridComplete: function () {
                	   	rowId = $("#planting_declare").getRowData().length;
                	   	
                	   	var ids = jQuery("#planting_declare").jqGrid('getDataIDs');
           				for(var i=0;i < ids.length;i++){
	           				var cl = ids[i];
	           				var rowData=jQuery("#planting_declare").jqGrid('getRowData',cl);
	           				if(rowData.pd_id){
		         				var pa = "<button class='btn btn-xs btn-default' type='button' data-original-title='Request Impl' onclick=\"loadImplementFeature('"+rowData.pd_id+"');\"><i class='fa fa-search-plus'></i></button>";
		         				jQuery("#planting_declare").jqGrid('setRowData',cl,{draw:pa});
	           				}
	           				jQuery("#planting_declare").jqGrid('setRowData',cl,{row_id:i+1});
	           			}
                   },
                   afterSaveCell: function (rowid, name, val, iRow, iCol) {
                   },
                   oneditfunc: function() {
                       alert ("edited"); 
                   },
//                    onComplete: function(data, response) {
//                        get_csrf_token();
//                        alert(csrf_token);
//                  	},
                   onSelectRow: function(id){
               	       editable = jQuery('#planting_declare').jqGrid ('getCell', id, 'edit');
                	   if (id && id !== lastSel) {
                		   if(editable==''){
	                           $("#planting_declare").jqGrid('restoreRow', lastSel); 
	                           $("#planting_declare").jqGrid('saveRow', id);
	                           $("#planting_declare").editRow(id, true);
                		   }
                       } else {
                    	   if(editable==''){
                    		   $("#planting_declare").jqGrid('saveRow', lastSel);
	                    	   $("#planting_declare").jqGrid('restoreRow', id); 
	                    	   
	                    	   $("#planting_declare").editRow(id, true);
                    	   }
                       }
                	   lastSel = id;
                	   var rowData = jQuery(this).getRowData(id); 
                	    var temp= rowData['edit'];//replace name with you column
//                 	    alert(lastSel);
                   }
                   
               });
        	$("#planting_declare").jqGrid('navGrid','#planting_declare_pager',
                	{edit: false, add:false, del:false, view:false,search:false, refresh:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});

        	var oplVal='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
        	var stat=$("#actPlantStat").val();
 			if(oplVal=='R' &&  stat=='APR'){
             $("#planting_declare").navButtonAdd('#planting_declare_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.add"/>", 
                	   buttonicon:"ui-icon-plus", 
                	   id:"add_button",
                	   onClickButton: function(){
//                 		   $("#planting_declare").jqGrid('saveRow', rowId);
//                 		   rowId++;
//                 		   var parameters =
//                            {
//                                rowID: rowId,
//                                initdata: {
//                                },
//                                position: "last",
//                                useDefValues: true,
//                                useFormatter: false,
//                                addRowParams: { extraparam: {} }
//                            };
                		   addRow();
                       $("#planting_declare").jqGrid('addRow', parameters);
                       $("#planting_declare").jqGrid('setGridParam', {editable: true});    	   
                	   }, 
                	   position:"last"
                }).navButtonAdd('#planting_declare_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.save"/>", 
            	   buttonicon:"ui-icon-disk", 
            	   onClickButton: function(){ 
            		   var selr = jQuery('#planting_declare').jqGrid('getGridParam','selrow'); 
            		   $("#planting_declare").jqGrid('saveRow', selr);
            	   }, 
            	   position:"last"
            	})          
              	.navButtonAdd('#planting_declare_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.delete"/>", 
                	   buttonicon:"ui-icon-trash",
                	   id:"delete_button", 
                	   onClickButton: function(){
                		   var selr = jQuery('#planting_declare').jqGrid('getGridParam','selrow'); 
                		   editable = jQuery('#planting_declare').jqGrid ('getCell', selr, 'edit');
                		   if(selr && editable==''){
                		   		$('#planting_declare').jqGrid('delRowData', selr);
                		   }
                	   }, 
                	   position:"last"
                	});
 				}  
 			
        	});
        $(window).resize(function () {
        	// when the browser size changes so does the grid
            $("#planting_declare").jqGrid('setGridWidth', $('#jqGrid_firedetails_container').width(), false);
        });

        $(window).bind('resize', function() {
        	//trick - make small
        	$('#planting_declare').setGridWidth(100);
        	
        	var width = $('#jqGrid_firedetails_container').width();
            // Set grid width to .jqGrid_order_item_container and them go responsive
            $("#planting_declare").jqGrid('setGridWidth', width, false);
        });            
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_firedetails_container">
				<table id="planting_declare" class="scroll"></table> 
				<input id="actPlantStat" name="actPlantStat"
				value="<s:property value='planting.activityStatus.status.getDOMKEY()'/>"
				type="hidden">
				<div id="planting_declare_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
