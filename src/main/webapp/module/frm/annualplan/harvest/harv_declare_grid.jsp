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
        
    	function generateTransportDoc(id){
    		var url="TransportDoc.do?docId="+id;
    		window.location.href=url;
       	};

        var selRows=[];
		function addRowToSel(id){
			$("#harv_dec_selected_grid").jqGrid('saveRow', id);
			var rowData = jQuery("#harvest_declare").getRowData(id); 
			var addToSel=true;
			for(var i=0; i<selRows.length;i++){
				if(rowData.hd_id==selRows[i]){
					addToSel=false;
					break;
				}
			}
			if(addToSel){
				selRows.push(rowData.hd_id);
				   var parameters =
			        {
			            rowID: id,
			            initdata: {
			            	hd_id: rowData.hd_id,
			            	harv_act_id: rowData.harv_act_id,
			            	im_tech_volume_dec: rowData.im_tech_volume_dec,
			            	im_fire_volume_dec: rowData.im_fire_volume_dec,
			            	im_pulp_volume_dec: rowData.im_pulp_volume_dec,
			            	im_date_dec: rowData.im_date_dec,
			            	im_created_date_dec: rowData.im_created_date_dec,
			            	created_by_dec: rowData.created_by_dec
			            },
			            position: "last",
			            useDefValues: true,
			            useFormatter: false,
			            addRowParams: { extraparam: {} }
			        };
			    $("#harv_dec_selected_grid").jqGrid('addRow', parameters);
			    $("#harv_dec_selected_grid").jqGrid('setGridParam', {editable: true}); 
			}
		}
        function toTransport(id){
        	addRowToSel(id);
        }
      
        $(document).ready(function () {
            var lastSel = 0;
    		var rowId = 0;
    		var harvest_declare = $("#harvest_declare"); 
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
        	harvest_declare.jqGrid({ 
            	   url:'FrmGrid.harvImplDeclare.do?harv_activity_id='+$("#standharvest\\.id").val(),	
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
                             'encryptedText',
                             'hd_trans_id',
                             'act',
                             'Transporti',
                             'harv_act_id',
                             '<s:text name='frm.harvest.planning.im.tech.volume'/> (m<sup>3</sup>)',
                             '<s:text name='frm.harvest.planning.im.fire.volume'/>(m<sup>3</sup>)', 
                             '<s:text name='frm.harvest.planning.pl.pulp.volume'/>(m<sup>3</sup>)', 
                             '<s:text name='frm.harvest.planning.im.date'/>', 
             	        	 '<s:text name="planting.stand.plan.created.date"/>',
               	        	 '<s:text name="planting.stand.plan.created.by"/>',
               	        	 'editable',
		    		         '<s:text name="hrm.skill.label.attachment"/>'
                           ],
    	       	   colModel:[
    					{name:'hd_id',index:'hd_id', width:'100%', hidden:true, editable:true},	
    					{name:'encryptedText',index:'encryptedText', width:'100%', hidden:true, editable:true},	
    					{name:'hd_trans_id',index:'hd_trans_id', width:'100%', hidden:true, editable:true},	
    					{name:'act',index:'act', width:'50%',search:false},
    					{name:'transport_done',index:'transport_done', width:'100%', hidden:false},
    					{name:'harv_act_id',index:'harv_act_id', width:'100%', hidden:true, editable:false},
    	       	   		{name:'im_tech_volume_dec',index:'im_tech_volume_dec',align:"center", width:'100%', editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'im_fire_volume_dec',index :'im_fire_volume_dec',align:"center", width:'100%', align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
    	       	   		{name:'im_pulp_volume_dec',index:'im_pulp_volume_dec',align:"center", width:'100%', align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},		
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
        	       	   		 , width:'100%', editable:true},		
    	       	   		{name:'im_created_date_dec',index:'im_created_date_dec',align:"center", width:'100%', align:"right"},		
    	       	   		{name:'created_by_dec',index:'im_created_by_dec',align:"center", width:'100%', align:"right"},
    	       	   		{name:'edit',index:'edit',align:"center", width:'100%', align:"right" , hidden:true},		
    		            {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'}
        	       	   	],
    	       	   pager: "#harvest_declare_pager",
//                 rowNum:10,
//            	   rowList:[10,20,30],
                   viewrecords: true,
                   sortname: "f.id",
                   sortorder: "asc",
                   width: 'auto',
                   height: '100%',
                   autowidth: true,
           		   shrinkToFit: false,
           		   gridview: true,
                   headertitles: true,
                   loadonce: true,
                   rowEdit: true,  
                   multiselect: false, 
                   rowsubmit: 'clientArray',
                   cellsubmit : 'clientArray',
                   cmTemplate: {sortable:false},
                   editurl: 'clientArray',                           
                   add:true,
                   keys : true, 
                   caption:"<s:text name="frm.harvest.impl.declare"/>",
                   ajaxGridOptions: { contentType: "application/json"},
                   serializeGridData: function (data) {

                   },
                   gridComplete: function () {
           			var ids = jQuery("#harvest_declare").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        				var buttons;
        				    var harvId=jQuery("#harvest_declare").getRowData(cl).hd_id;
        				    var act_button="";    
        				    if(harvId){
	        					pa = "<button type='button'  data-original-title='To transport]' onclick=\"toTransport("+cl+");\"><i class='fa fa-truck'></i></button>";
	        					act_button+=pa;
	        					var docId=jQuery("#harvest_declare").getRowData(cl).hd_trans_id;
	        					if(docId!=""){
	 		   						be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"docsList('"+jQuery("#harvest_declare").getRowData(cl).encryptedText+"','#harvest_declare', '"+docId+"');\"><i class='fa fa-paperclip'></i></button>";
	 		   				     	act_button+=be;
	        					}
        				    }
        				    jQuery("#harvest_declare").jqGrid('setRowData',ids[i],{act:act_button});
        			}	
                   },
                   afterSaveCell: function (rowid, name, val, iRow, iCol) {
                   },
                   oneditfunc: function() {
                       alert ("edited"); 
                   },
                   onSelectRow: function(id){
                	   editable = jQuery('#harvest_declare').jqGrid ('getCell', id, 'edit');
                	   if (id && id !== lastSel) {
                		   if(editable==''){
                           $("#harvest_declare").jqGrid('restoreRow', lastSel); 
                           $("#harvest_declare").jqGrid('saveRow', id);
                           $("#harvest_declare").editRow(id, true);
                		   }
                       } else {
                    	   if(editable==''){
                    	   $("#harvest_declare").jqGrid('saveRow', lastSel); 
                    	   $("#harvest_declare").jqGrid('restoreRow', id); 
                     	   $("#harvest_declare").editRow(id, true);
                    	   }
                       }
                	   lastSel = id;
                   }
                   
               });
        	$("#harvest_declare").jqGrid('navGrid','#harvest_declare_pager',
                	{edit: false, add:false, del:false, view:false,search:false, refresh:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});

        	  var oplVal='<s:property value="user.getOrganisation().getOperLevelVal()"/>';

 			if(oplVal=='M'){
             $("#harvest_declare").navButtonAdd('#harvest_declare_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.add"/>", 
                	   buttonicon:"ui-icon-plus", 
                	   id:"add_button",
                	   onClickButton: function(){
                		   $("#harvest_declare").jqGrid('saveRow', rowId);
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

                       $("#harvest_declare").jqGrid('addRow', parameters);
                                       	   
                		   
                	   }, 
                	   position:"last"
                }).navButtonAdd('#harvest_declare_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.save"/>", 
            	   buttonicon:"ui-icon-disk", 
            	   onClickButton: function(){ 
            		   var selr = jQuery('#harvest_declare').jqGrid('getGridParam','selrow'); 
            		   $("#harvest_declare").jqGrid('saveRow', selr);
            	   }, 
            	   position:"last"
            	})          
              	.navButtonAdd('#harvest_declare_pager',{
                	   caption:"", 
                	   title:"<s:text name="label.button.delete"/>", 
                	   buttonicon:"ui-icon-trash",
                	   id:"delete_button", 
                	   onClickButton: function(){
                		   var selr = jQuery('#harvest_declare').jqGrid('getGridParam','selrow'); 
                		   editable = jQuery('#harvest_declare').jqGrid ('getCell', selr, 'edit');
                		   if(selr && editable==''){
                		   		$('#harvest_declare').jqGrid('delRowData', selr);
                		   }
                	   }, 
                	   position:"last"
                	});
 				}  
        	});
        $(window).resize(function () {
        	// when the browser size changes so does the grid
            $("#harvest_declare").jqGrid('setGridWidth', $('#jqGrid_firedetails_container').width(), false);
        });

        $(window).bind('resize', function() {
        	//trick - make small
        	$('#harvest_declare').setGridWidth(100);
        	
        	var width = $('#jqGrid_firedetails_container').width();
            // Set grid width to .jqGrid_order_item_container and them go responsive
            $("#harvest_declare").jqGrid('setGridWidth', width, false);
        });            
             
//         /* Remove jquery-ui styles from jqgrid */
//         function removeJqgridUiStyles(){
//             $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
//             $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
//             $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
//             $(".ui-jqgrid-pager").removeClass("ui-state-default");
//         };
    </script>
    
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_firedetails_container">
				<table id="harvest_declare" class="scroll"></table> 
				<div id="harvest_declare_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
