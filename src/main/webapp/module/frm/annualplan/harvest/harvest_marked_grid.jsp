<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">

ui-grid{ width:100% !important; }
.ui-th-column-header{text-align: center;}

</style>
<script type="text/javascript">
		function isNumber(element){
			$(element).keyup(function(){
		        var val1 = element.value;
		        var num = new Number(val1);
		        if(isNaN(num))
		        {this.value="";alert("Please enter a valid number");}
		    });	
		};

        $(document).ready(function () {
        	var lastSel = 0;
			var rowId = 0; 
			grid=jQuery("#harvest_marked");
			jQuery("#harvest_marked").jqGrid({
        	   	url:'FrmGrid.harvestMarked.do',	
        		datatype: "json",
        		postData: {harv_id: $("#standharvest\\.id").val()},
        		jsonReader : {
   			      root:"rows",
   			      page: "page",
   			      total: "total",
   			      records: "records",
   			      repeatitems: false,
   			      id: "0"
        		},
        		height: '100%',
        		width: 'auto',
        		autowidth: true,
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:[ 'Id',
        	        	   	'<s:text name="frm.private.request.id"/>', 
        	        	   	'<s:text name="frm.private.request.actual.status"/>', 
        	        	   	'<s:text name="frm.private.request.is.new"/>', 
        	        	   	'<s:text name="ann.plan.tree.species.ID"/>', 
        	        	   	'<s:text name="annu.seedling.label.tree.species"/>', 
        	        	   	'<s:text name="law.suit.label.diameter.13"/>', 
        	        	   	'<s:text name="law.suit.label..leight"/>', 
        	        	   	'<s:text name="frm.private.request.tech.volume"/>', 
        	        	   	'<s:text name="frm.private.request.fire.volume"/>', 
        	        	   	'<s:text name="frm.private.pulp.volume"/>', 
        	        	   	'<s:text name="frm.private.request.pulp.volume"/>', 
        	        	   	'<s:text name="frm.stand.remarks"/>', 
        	        	   	'<s:text name="bid.grid.created.date"/>', 
        	        	   	'<s:text name="bid.grid.created.by"/>' 
        	        	  ],
        	   	colModel:[
        	   		{name:'idM',index:'idM',hidden:true, width:'50%', editable:false},
        	   		{name:'harv_id',index:'harv_id',hidden:true, width:'50%', editable:false},
        	   		{name:'actual_status',index:'actual_status',hidden:true, width:'50%', editable:false},
        	   		{name:'isnew',index:'isnew',hidden:true, width:'50%', editable:false},
        	   		{name:'tree_species_id',index:'tree_species_id',hidden:true, width:'50%'},
        	   		{name:'tree_species',index:'tree_species', width:'50%',align:"right", search:false, editable:true,sortable : true,
            	   		editoptions: {size:10,maxlength:30, dataInit:function(el){
          						$(el).autocomplete({
        					        source: function(request, response) {
        					            $.ajax({
        					            	type:"get",
        					                url: "Input.treeSpecies.do",
        					                dataType: "json",
        					                data: {
        										featureClass: "P",
        										style: "full",
        										maxRows: 12,
        										name_startsWith: request.term,
        										
        									},
        									success: function( data ) {
        										response( $.map( data, function(item ) {
        											return {
        												label: item.name,
        					                            value: item.name,
        					                            id: item.id
        											};
        										}));
        									},
        					                maxRows: 100,
        					        		minLength: 0   
        					            });
        					        },
        					        select: function(event, ui) {
												var ts= ui.item.id;
												$('#harvest_marked').jqGrid("setCell", rowId , 'tree_species_id', ts);
        					        }  
        					    });
                	   		}
	
            	   		} },
        	   		{name:'diameter_1_3',index:'diameter_1_3', width:'50%',align:"right", search:false, editable:true,  formatter: 'number', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
        	   		{name:'height',index:'height', width:'50%',align:"right", search:false, editable:true , formatter: 'number', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
        	   		{name:'tech_volume',index:'tech_volume', width:'50%',align:"center", search:false, editable:true, formatter: 'number', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
        	   		{name:'fire_volume',index:'fire_volume', width:'50%',align:"center", search:false, editable:true,  formatter: 'number', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
        	   		{name:'pulp_volume',index:'pulp_volume', width:'50%',align:"center", search:false, editable:true,  formatter: 'number', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
        	   		{name:'volume_total',index:'volume_total', width:'50%',align:"center", search:false, editable:false,   formatter: 'number', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
        	   		{name:'remarks',index:'remarks', width:'50%', search:false, editable:true},
        	   		{name:'created_date',index:'created_date', width:'50%',align:"center", search:false,  editable:false},
        	   		{name:'created_by',index:'created_by', width:'50%', search:false,  editable:false}
        	   		],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#harvest_marked_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		caption: "<s:text name="frm.private.request.marking.data"/>", 
	               loadonce: true,
	               rowEdit: true,   
	               rowsubmit: 'clientArray',
	               cellsubmit : 'clientArray',
	               editurl: 'clientArray',                           
	               pager: "#harvest_marked_pager",
	               loadtext:'<s:text name="grid.loading.text"/>', 
	               add:true,
	               keys : true, 
	               ajaxGridOptions: { contentType: "application/json"},
    			ondblClickRow: function(id, iRow, iCol, e) {

					
   				},
                gridComplete: function () {
//              	   rowId=$("#harvest_marked").getRowData().length;
//              	   alert(rowId);
                },
   		      onSelectRow: function(id){
   		    	if(harv_workstage=="M" && userLevel=="R"){
	           	   if (id && id !== lastSel) {
	                      $("#harvest_marked").jqGrid('restoreRow', lastSel); 
	                      $("#harvest_marked").jqGrid('saveRow', id);
	                      $("#harvest_marked").editRow(id, true);
	                  } else {
	                      $("#harvest_marked").jqGrid('restoreRow', lastSel); 
	               	  	  $("#harvest_marked").editRow(id, true);
	                  }
	           	lastSel = id;
              }
   		      }
        	}).navGrid('#harvest_marked_pager',{edit:false,add:false,del:false,search:false});

        	
            grid.jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                ]});  
                 	
        	var userLevel='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
            grid.jqGrid('filterToolbar',{searchOperators : true});
              	
            grid.jqGrid('navGrid','#harvest_marked_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
			var harv_workstage=$("#standharvest\\.workStage").val();
//             var rowDataReqImpl=$("#harvest_marked").jqGrid('getGridParam', 'records');
//             alert(rowDataReqImpl);
// 				if(harv_workstage=="M" && userLevel=="R"){
	        	grid.navButtonAdd('#harvest_marked_pager',{
		            	   caption:"", 
		            	   title:"<s:text name="label.button.add"/>",  
		            	   buttonicon:"ui-icon-plus", 
		            	   onClickButton: function(){ 
		            		   $("#harvest_marked").jqGrid('saveRow', rowId);
		            		   rowId++;
		            		   var parameters =
		                       {
		                           rowID: rowId,
		                           initdata: {
		                               id: rowId,
		                        	   isnew:"true"
		                               //IdField: $('#IdField').val(),
		                               //Description: $('#IdField option:selected').text()
		                           },
		                           position: "last",
		                           useDefValues: true,
		                           useFormatter: false,
		                           addRowParams: { extraparam: {} }
		                       };
		                   $("#harvest_marked").jqGrid('addRow', parameters);
		            	   }, 
		            	   position:"last",
		            }).navButtonAdd('#harvest_marked_pager',{
		            	   caption:"", 
		            	   title:"<s:text name="label.button.save"/>", 
		            	   buttonicon:"ui-icon-disk", 
		            	   onClickButton: function(){ 
		            		   var selr = jQuery('#harvest_marked').jqGrid('getGridParam','selrow'); 
		            		   $("#harvest_marked").jqGrid('saveRow', selr);
		            		   var tech_volume=jQuery('#harvest_marked').jqGrid ('getCell', rowId, 'tech_volume');
		            		   var fire_volume=jQuery('#harvest_marked').jqGrid ('getCell', rowId, 'fire_volume');
		            		   var pulp_volume=jQuery('#harvest_marked').jqGrid ('getCell', rowId, 'pulp_volume');
		            		   var volume_total=parseFloat(tech_volume)+parseFloat(fire_volume)+parseFloat(pulp_volume);
		            		   jQuery('#harvest_marked').jqGrid('setCell', rowId, 'volume_total', volume_total);
		            	   },
		            	   position:"last",
		            	})
		          	.navButtonAdd('#harvest_marked_pager',{
		            	   caption:"", 
		            	   title:"<s:text name="label.button.delete"/>", 
		            	   buttonicon:"ui-icon-trash", 
		            	   onClickButton: function(){ 
		            		   var selr = jQuery('#harvest_marked').jqGrid('getGridParam','selrow'); 
			            	  $('#harvest_marked').jqGrid('delRowData', selr);
		            	   }, 
		            	   position:"last",
		            	});
		            	grid.navButtonAdd('#harvest_marked_pager',{
						   	   caption:"",
						   	   title:"<s:text name="label.button.report.generator"/>", 
						   	   buttonicon: "ui-icon-print",
						   	   onClickButton: function(){
						   			var stand_box="";
						   			var point_nr="";
								    	$.ajax({
											type : "GET", // GET or POST
											url : "FrmGrid.standBox.do?standId="+$("#stand\\.standId").val()+"&actId="+$("#activity\\.id").val(), // the file to call
											async : false,
											beforeSend:function(jqXHR, settings) {
											},
											error : function(errorThrown, status, jqXHR) { // on error..
	//					 						alert("error:" + errorThrown + ", status:" + status);
											},
											dataType: "json",
									        data: {
												featureClass: "P",
												style: "full",
											},
											success : function(data, status, jqXHR) { // on success..
												stand_box=data.stand_box;
												point_nr=data.point_nr;
											},
											complete:function(jqXHR, textStatus){
											}
										});
									var limit=0;
									if(point_nr!=""){
										limit=parseInt(point_nr/3);
										}
									var offset1=parseInt(limit);
									var offset2=parseInt(offset1+limit);
								   	var link="\\frm\\annualplan\\harvest\\marking_report.rptdesign";
									var parameters="p_harv="+$("#standharvest\\.id").val()+"&p_box="+stand_box+"&p_act_id="+$("#activity\\.id").val()+"&p_stand_id="+$("#stand\\.standId").val()+"&p_limit="+limit+"&p_offset1="+offset1+"&p_offset2="+offset2;	
									var doc_name="Fletedamkosje";
									var	url="BirtReportGen.do?jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
									//generateBIRTDoc(url);
									parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
									downloadDoc("BirtReportGen.do", parameters);
// 								   	openBirtViewer(link, parameters);
						   	   }, 
						   	   position:"last",
						   	  
					   	});
// 				}
        $(window).bind('resize', function() {
            var width = $('#jqGrid_hrvMarked_container').width();
            $('#harvest_marked').setGridWidth(width);
        });
                
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_hrvMarked_container">
				<table id="harvest_marked" class="scroll"></table> 
				<div id="harvest_marked_pager" class="scroll" style="text-align:center;"></div>
			</div>
<%-- 			<input id="compId" value="<s:property value='compId'/>" type="hidden"> --%>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
