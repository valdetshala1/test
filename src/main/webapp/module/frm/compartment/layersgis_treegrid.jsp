<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid {
	width: 100% !important;
}
</style>
<script type="text/javascript">
	$("#legendDialog").dialog({
		autoOpen : false,
		modal : true,
		width:'500px',
		title : "<div class='widget-header'><h4><i class='icon-ok'></i> Legend</h4></div>",
		buttons : [{
			html : "Cancel",
			"class" : "btn btn-default",
			click : function() {
				$(this).dialog("close");
			}
		}]
	});


	function handleClick(element,cb) {
	  var ly=map.getLayersByName(''+cb);
	    for(var i=0;i<ly.length;i++){
		    if(!element.checked){
		    	ly[i].setVisibility(0);
		    	ly[i].redraw(true);
	    	  }else{
	    			ly[i].setVisibility(1);
	    	    	ly[i].redraw(true);
		    	}
		    }
	}

	function openLegendPopup(url){
		$( "#legendContent" ).html( "<img src=\""+url+"\" alt=\"\" >");
		
		$('#legendDialog').dialog('open');
	}
	
	$(document).ready(function() {
          var grid = $("#layers_grid");
          grid.jqGrid({
	        url: 'FrmGrid.layerGisTree2.do',
	        datatype: 'json',
	        mtype: 'GET',
	        colNames:['id', 
		      	       '<s:text name="hrm.skill.grid.name"/>',
		      	       '','',
		      	       'Shfaq ne harte','Legend',
		      	       'Legjenda'
	      	        ], 
	        colModel:[ 
				{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
	            {name:'store',index:'store', width: 300, sortable:false},
				{name:'in_map',index:'in_map', width: 100, sortable:false, hidden:true, key:true},
				{name:'legendUrl',index:'legendUrl', width: 80, sortable:false, hidden:true, key:true},
	            {name:'visibility',index:'visibility', width: 100, align:'center', sortable:false, editable:true, edittype:'checkbox', editoptions: { value:"True:False" }, 
	            	formatter: function (cellvalue, options, rowObject) {
	            		if(rowObject['in_map'] == true){
	                		if(cellvalue == true){
		            			return "<input type='checkbox' class='locked' checked='checked' onclick=\"handleClick(this,'" + rowObject['store'] +"');\"  name='op_locked_" + rowObject['id'] + "' title='op_locked_" + rowObject['id'] + "'>";
	                		}else{
		            			return "<input type='checkbox' class='locked'  onclick=\"handleClick(this,'" + rowObject['store'] +"');\"  name='op_locked_" + rowObject['id'] + "' title='op_locked_" + rowObject['id'] + "'>";
	                    	}
		            	}else{
	            			return "";
	                	}
	            	}, formatoptions: {disabled : false}},
        	   	{name : 'act', index:'act', sortable:false, search:false, width:'70%' },
	            	
        	   	{name:'storeName',index:'storeName', width:'100%',align:"center", hidden:true,
            	   		formatter: function (cellvalue, options, rowObject) {
                	   		var url=rowObject.legendUrl;
	                	   		if(rowObject['in_map'] == true){
		  	        				return '<a href="'+url+'" target="_blank"><span style="color:blue"><u>' +rowObject.store +  '</u></span></a>';
	                	   		}else{return "";}
		  	             	}
   	             }
	            						            
	        ],
		     jsonReader : { 
		        	rows: "rows", 
		            page: "page", 
		            total: "total", 
		            records: "records", 
		            repeatitems: false, 
		            id: "id"
		     },
              sortname: 'store',	
              treeGrid: true,
  	          loadonce: true,
	          ignoreCase: true,              
              multiselect: false,
              loadui: "disable",
              treeGridModel: 'adjacency',
              treedatatype: 'json',
              ExpandColumn: 'store',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#layers_grid_pager",
              toppager:true,
              caption: "Layers",
			  gridComplete: function(){
        			var ids = jQuery("#layers_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        				var rowData=jQuery("#layers_grid").getRowData(cl);
        				var butt="";
        				js = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"openLegendPopup('"+rowData.legendUrl+"');\"><i class='fa  fa-cog'></i></button>";
        				
    					jQuery("#layers_grid").jqGrid('setRowData',ids[i],{act:"   "+js});
        			}	
        		},
              loadComplete: function (data) {
		    	 $("#layers_grid").jqGrid('setGridParam', { sortname: 'store', sortorder: 'asc' });
		    	 $("#layers_grid").trigger("reloadGrid");
              }
                   				              
          });

          grid.navGrid('#layers_grid_pager',{edit:false,add:false,del:false,search:false,refresh:true});

    
    	grid.navButtonAdd('#layers_grid_pager',{
			   	   caption:"", 
			   	   title:"<s:text name="label.button.edit"/>", 
			   	   buttonicon:"	ui-icon-plusthick",
				   	onClickButton: function(){
		      				 var myGrid = $('#layers_grid');
		      				 var iRow = myGrid.jqGrid ('getGridParam', 'selrow');
			      				var link='';
				 		   			if(iRow){
				 		   				var rowData = jQuery("#layers_grid").getRowData(iRow); 
				 		   			    link = "Compartment.layersform.do?parentId="+rowData.id;
				 		   			}else{
				 		   				link = "Compartment.layersform.do";
				   						}
				 		   	openDialogForm('layersform_content',link,'<s:text name="layergis.form.title"/>',900,600);
	      		   	   }, 
			   	   position:"last"
		});
          
          var checkboxFix = [];
          $("#layers_grid td[aria-describedby='read'] input").each(function () {
	          		alert($(this).attr('checked'));
                  checkboxFix.push($(this).attr('checked'));
          });		


//           $("#searchterm").keyup(function() {
              
//               var str = $("#searchterm").val();
              
//               if (str) {
//                   var re = new RegExp(str,"i");
//                   var r = $("#layers_grid").find("tr td:first-child");
//                   r.each(function (index, instance) {
//                        var _td = $(instance);
                       
//                        var rowId = _td.text();
// //                        
// 					if(rowId){
//                        var rowData = $("#layers_grid").getRowData(rowId); 
//                        if(rowData){
// 	                       if(re.test(rowData.name)){
// 	                            //ensure to show all parents of matched nodes
// 	                       		while (rowData !== null && rowData.parent !== "") {
// 	                       			$($("#" + rowData.parent), "#layers_grid").show();
// 	                                rowData = $("#layers_grid").getRowData(rowData.parent);
// 	                       		}
// 	                       }else{
// 	                           $($("#" + rowId), "#layers_grid").hide();
// 	                       }
//                        }
//                   }
//                   });
//               }else{
//             	  var r = $("#layers_grid").find("tr td:first-child");
//                   r.each(function (index, instance) {
//                        var _td = $(instance);
//                        var rowId = _td.text();
//                        $($("#" + rowId), "#layers_grid").show(); 
//                   });                 
//               }
//           });         
				          		          
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_layergis_container').width();
		$('#layers_grid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
			<div style="margin-bottom: 1.0em;">
		<div id="jqGrid_layergis_container">
			<div id="mysearch"></div>
			<table id="layers_grid" class="scroll" cellpadding="0" cellspacing="0"></table>
			<div id="layers_grid_pager" class="scroll" style="text-align: center;"></div>
			
		</div>

	</div>
	<!-- end widget div -->
	<div id="legendDialog" title="Legend">
		<div id="legendContent">
		</div>
	</div>

</body>

</html>
