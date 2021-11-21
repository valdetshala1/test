<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="js/plugin/jqgrid/grid.addons.js"></script>	
<script type="text/javascript" src="js/plugin/tokenize/jquery.tokenize.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/tokenize/jquery.tokenize.css">

<style type="text/css">
ui-grid {
	width: 100% !important;
}


th.ui-th-column div{
white-space:normal !important;
height:auto !important;
padding-top:2px;
padding-bottom:2px;
}
.ui-jqgrid .ui-jqgrid-sortable {cursor:default;}
.tokenize-sample { width: 100%; min-height: 50px;}

</style>
<script type="text/javascript">

	$(document).ready(function() {
          var grid = $("#layers_treegrid");
          grid.jqGrid({
	        url: 'FrmGrid.layerGisTree.do',
	        datatype: 'json',
	        mtype: 'GET',
	        colNames:['id', 
	        	       '',
	      	         'Layers Name'
	      	        ], 
	        colModel:[ 
				{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
	            {name:'parent_id',index:'parent_id', hidden:true, width: 50, align:'center', sortable:false, search:false},
	            {name:'store',index:'store', width: '200%',align:'left', sortable:false}
	             
	        ],
		     jsonReader : { 
		        	rows: "rows", 
		            page: "page", 
		            total: "total", 
		            records: "records", 
		            repeatitems: false, 
		            sub_grid : {
						repeatitems : false
					},		            
		            id: "id"
		     },
		     treeReader : {
		    	 level_field : 'level',
		    	 parent_id_field : 'parent_id'
		     },
		     /*treeReader : {
					level_field : 'tree_level',
					parent_id_field : 'tree_parent',
					leaf_field : 'tree_leaf',
					expanded_field : 'tree_expanded',
					loaded : 'tree_loaded',
					icon_field : 'tree_icon'
			},*/		     
              sortname: 'store',	
              treeGrid: true,
              gridview: false,
  	          loadonce: false,
	          ignoreCase: true, 
			  headertitles : true,
			  hoverrows : false,
			  viewsortcols : [ false, 'vertical', true ],
				rowNum : 10,
				rowList : [ 10, 20, 30 ],	                       
              loadui: "disable",
              treeGridModel: 'adjacency',
              treedatatype: 'json',
              ExpandColumn: 'store',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#layers_treegrid_pager",
              caption: "Layers", 
              toppager:true,
              viewrecords: true,
              ExpandColClick: true,
              scrollrows: true,
              loadComplete: function (data) {
		    	 $("#layers_treegrid").jqGrid('setGridParam', { sortname: 'store', sortorder: 'asc' });
		    	 $("#layers_treegrid").trigger("reloadGrid");
              },
              onSelectRow: function(id, iRow){
              },
              ondblClickRow: function(id, iRow, iCol, e) {
//   				var rowData = jQuery(this).getRowData(id); 
// 				var link = "Organisation.form.do?organisationId=" + rowData.id;
//  				loadURL(link, $("#organisation_form_content"));
 			}        		              
                   				              
          });
			
          grid.navGrid('#layers_treegrid_pager',{edit:false,add:false,del:false,search:false})
			.navButtonAdd('#layers_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="label.button.edit"/>", 
			   buttonicon:"ui-icon-pencil", 
			   onClickButton: function(){
   	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
 	   			if(iRow){
//  	  				var rowData = jQuery(this).getRowData(iRow); 
//  					var link = "Organisation.form.do?organisationId=" + rowData.id;
//  	 				loadURL(link, $("#organisation_form_content"));
 	   			}else{
 	   	   			alert("<s:text name="global.please.select.row"/>");
 	   	   		}  					
			   }, 
			   position:"last",
			   cursor: "pointer"
			})
			.navButtonAdd('#layers_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="adm.organisation.expand.collapse.all"/>", 
			   buttonicon: "ui-icon-triangle-2-n-s",
			   onClickButton: function(){ 
					$("#layers_treegrid").find(".treeclick").trigger('click');   
			   }, 
			   position:"last",
			   cursor: "pointer"
			})           	
// 			.navButtonAdd('#layers_treegrid_pager',{
// 			   caption:"",
// 			   title:"Delete",  
// 			   buttonicon:"ui-icon-trash", 
// 			   onClickButton: function(){ 
// 			   }, 
// 			   position:"last",
// 			   cursor: "pointer"
// 			});          

          /*
          jQuery("#layers_treegrid").jqGrid('navGrid','#layers_treegrid_pager',{edit:false,add:false,del:false,search:false,refresh:true,
              beforeRefresh:function(){saveExpandedNodes([],true);}, cloneToTop:true});
          jQuery("#layers_treegrid").jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true, enableClear: false, groupOp:'AND', defaultSearch:'cn'});
          
          grid.jqGrid('navButtonAdd', "#layers_treegrid_pager", 
            {
        	  caption: "", title: "Search", buttonicon: "ui-icon-search",
        	  onClickButton: function () {
        	      grid.searchGrid({
        	          closeOnEscape: true,
        	          searchOnEnter: true,
        	          width:500,
        	          closeAfterSearch: true,
        	          sopt: ['eq','ne','lt','gt','cn','nc','bw','ew'],
        	          onSearch: function(){
        	              rowName = $('#fbox_grid .columns select'); //search field
        	              operator = $('#fbox_grid .selectopts');    //search option
        	              needle = $('#fbox_grid .data input');      //search argument
        	              console.log(rowName + "," + operator + ", " + operator);
        	          }  
        	      });
        	  }
            }
    	  );
    	  */

          $("#searchterm").change(function() {
              var str = $("#searchterm").val();
              if (str) {
                  var re = new RegExp(str,"i");
                  var r = $("#layers_treegrid").find("tr td:first-child");
                  
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       
                       //var localRowData = grid.jqGrid("getLocalRow", rowId);
                       var rowData = $("#layers_treegrid").getRowData(rowId);
                        
                       if(!jQuery.isEmptyObject(rowData)){
	                       if(re.test(rowData.orga_name)){
	                            //ensure to show all parents of matched nodes
	                       		console.log("Match:" + rowData.store + ", Id: " + rowData.id);
	                       		while (rowData !== null && rowData.parent_id !== "") {
	                       			$($("#" + rowData.parent_id), "#layers_treegrid").show();
	                                rowData = $("#layers_treegrid").getRowData(rowData.parent_id);
	                       		}
	                       		
	                       }else{
	                           $($("#" + rowId), "#layers_treegrid").hide();
	                       }
                       }
                  });
              }else{
            	  var r = $("#layers_treegrid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       $($("#" + rowId), "#layers_treegrid").show(); 
                  });                 
              }
          });
          
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_layers_treegrid_container').width();
		$('#layers_treegrid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_layers_treegrid_container">
			<div style="clear:left;">
				<table id="layers_treegrid" class="scroll" cellpadding="0" cellspacing="0"></table>
				<div id="layers_treegrid_pager" class="scroll" style="text-align: center;"></div>
			</div>
		</div>
	</div>
	<!-- end widget div -->

</body>

</html>
