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
        var harv_dec_selected_grid;
        $(document).ready(function () {
    		var harv_dec_selected_grid = $("#harv_dec_selected_grid"); 
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
        	harv_dec_selected_grid.jqGrid({ 
            	   url:"",
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
          			rownumbers: true,
                   colNames:['hd_id',
                             'harv_act_id',
                             'transport_done',
                             '<s:text name='frm.harvest.planning.im.tech.volume'/>(m<sup>3</sup>)',
                             '<s:text name='frm.harvest.planning.im.fire.volume'/>(m<sup>3</sup>)', 
                             '<s:text name='frm.harvest.planning.pl.pulp.volume'/>(m<sup>3</sup>)', 
                             '<s:text name='frm.harvest.planning.im.date'/>', 
             	        	 '<s:text name="planting.stand.plan.created.date"/>',
               	        	 '<s:text name="planting.stand.plan.created.by"/>',
               	        	 'editable'	
                           ],
    	       	   colModel:[
    					{name:'hd_id',index:'hd_id', width:'100%', hidden:true},	
    					{name:'harv_act_id',index:'harv_act_id', width:'100%', hidden:true},
    					{name:'transport_done',index:'transport_done', width:'100%', hidden:true},
    	       	   		{name:'im_tech_volume_dec',index:'im_tech_volume_dec',align:"center", width:'100%'},
    	       	   		{name:'im_fire_volume_dec',index :'im_fire_volume_dec',align:"center", width:'100%', align:"right"},
    	       	   		{name:'im_pulp_volume_dec',index:'im_pulp_volume_dec',align:"center", width:'100%', align:"right"},		
    	       	   		{name:'im_date_dec',index:'im_date_dec',align:"center",
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
        	       	   		 , width:'100%', editable:false},		
    	       	   		{name:'im_created_date_dec',index:'im_created_date_dec',align:"center", width:'100%', align:"right"},		
    	       	   		{name:'created_by_dec',index:'im_created_by_dec',align:"center", width:'100%', align:"right"},
    	       	   		{name:'edit',index:'edit',align:"center", width:'100%', align:"right" , hidden:true}		
    	       	   	],
    	       	   pager: "#harv_dec_selected_grid_pager",
//                    rowNum:10,
//            	   	   rowList:[10,20,30],
                   viewrecords: true,
                   sortname: "hd_id",
                   sortorder: "asc",
                   width: 'auto',
                   height: '100%',
                   autowidth: true,
           		   shrinkToFit: false,
           		   gridview: true,
                   headertitles: true,
                   loadonce: true,
                   rowsubmit: 'clientArray',
                   cellsubmit : 'clientArray',
                   cmTemplate: {sortable:false},
                   editurl: 'clientArray',                           
                   add:true,
                   keys : true, 
                   caption:"<s:text name="frm.harvest.transport"/>",
                   ajaxGridOptions: { contentType: "application/json"}
                   
               });
        	$("#harv_dec_selected_grid").jqGrid('navGrid','#harv_dec_selected_grid_pager',
                	{edit: false, add:false, del:false, view:false,search:false, refresh:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});

        	});
        $("#harv_dec_selected_grid").navButtonAdd('#harv_dec_selected_grid_pager',{
      	   caption:"", 
      	   title:"<s:text name="label.button.save"/>", 
      	   buttonicon:"ui-icon-disk", 
      	   onClickButton: function(){ 
      		 var selectedVals=[];
      		        var ids = $("#harv_dec_selected_grid").jqGrid('getDataIDs');
		               for (var i=0, il=ids.length; i < il; i++) {
 		                  var  val = $("#harv_dec_selected_grid").jqGrid('getCell', ids[i], 'hd_id');
  		                   selectedVals.push(val);
 		               }
			   		var link = "HarvImplTrans.popup.do?harvToTransIds="+selectedVals.join(",");
			   		openDialogForm('transport_form_content_popup',link,"<s:text name="frm.harvest.transport"/>",800,420);
      	   }, 
      	   position:"last"
      	}); 

        $(window).resize(function () {
        	// when the browser size changes so does the grid
            $("#harv_dec_selected_grid").jqGrid('setGridWidth', $('#jqGrid_firedetails_container').width(), false);
        });

        $(window).bind('resize', function() {
        	//trick - make small
        	$('#harv_dec_selected_grid').setGridWidth(100);
        	
        	var width = $('#jqGrid_firedetails_container').width();
            // Set grid width to .jqGrid_order_item_container and them go responsive
            $("#harv_dec_selected_grid").jqGrid('setGridWidth', width, false);
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
				<table id="harv_dec_selected_grid" class="scroll"></table> 
				<div id="harv_dec_selected_grid_pager" class="scroll" style="text-align:center;"></div>
		</div>

		<!-- end widget div -->

 </body>   
			
</html>	
