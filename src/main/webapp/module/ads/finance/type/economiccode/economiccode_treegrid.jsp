<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
</style>
<script type="text/javascript">
	function customFormatter ( cellvalue, options, rowObject ){
		//console.log(rowObject);
		
		if(rowObject.level == '4'){
			return "<span style='color:blue;'>" + cellvalue + "</span>";
		}else{
			return cellvalue;
		}
	}

	$(document).ready(function() {
          var grid = $("#ec_treegrid");
          grid.jqGrid({
	        url: 'AdmGrid.financialTypeTree.do',
	        datatype: 'json',
	        mtype: 'GET',
	        colNames:['id', 
      	        '<s:text name="fin.economiccode.name"/>', 
      	        '<s:text name="fin.economiccode.code"/>', 
      	        '<s:text name="fin.economiccode.level"/>',
      	      	'<s:text name="fin.economiccode.type"/>',
      	      	'<s:text name="fin.economiccode.typeDesc"/>',
      	      	'<s:text name="fin.economiccode.allocation"/>',  
      	        '<s:text name="fin.economiccode.parent"/>',
      	      	'<s:text name="fin.economiccode.created.date"/>'
      	        ], 
        colModel:[ 
			{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
            {name:'name',index:'name', width: 200,align:'left', sortable:false, search:true, formatter: customFormatter}, 
            {name:'code',index:'code', width: 50, align:'center', sortable:false, search:false},
            {name:'level',index:'level', hidden:false, width: 50, align:'center', sortable:false, search:false},
            {name:'typeDesc',index:'typeDesc', hidden:false, width: 50, align:'center', sortable:false, search:false},
            {name:'type',index:'type', hidden:true, width: 50, align:'center', sortable:false, search:false},
            {name:'allocation',index:'allocation', width: 50, align:'center', sortable:false, search:false},
            {name:'parent_id',index:'parent_id', hidden:true, width: 50, align:'center', sortable:false, search:false},
            {name:'created_date',index:'created_date', hidden:false, width: 50, align:'center', sortable:false, search:false}
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
              sortname: 'name',	
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
              ExpandColumn: 'name',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#ec_treegrid_pager",
              caption: "<s:text name="fin.economiccode.tree"/>", 
              toppager:true,
              viewrecords: true,
              ExpandColClick: true,
              scrollrows: true,
              loadComplete: function (data) {
		    	 $("#ec_treegrid").jqGrid('setGridParam', { sortname: 'name', sortorder: 'asc' });
		    	 $("#ec_treegrid").trigger("reloadGrid");
              },
              onSelectRow: function(id, iRow){
              },
              ondblClickRow: function(id, iRow, iCol, e) {
  				var rowData = jQuery(this).getRowData(id); 
				var link = "FinType.form.do?financialTypeId=" + rowData.id;
 				loadURL(link, $("#financialtype_form_content"));
 			}        		              
                   				              
          });
			
          grid.navGrid('#ec_treegrid_pager',{edit:false,add:false,del:false,search:false})
			.navButtonAdd('#ec_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="label.button.edit"/>", 
			   buttonicon:"ui-icon-pencil", 
			   onClickButton: function(){
   	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
 	   			if(iRow){
 	  				var rowData = jQuery(this).getRowData(iRow); 
 					var link = "FinType.form.do?financialTypeId=" + rowData.id;
 	 				loadURL(link, $("#financialtype_form_content"));
 	   			}else{
 	   	   			alert("<s:text name="global.please.select.row"/>");
 	   	   		}  					
			   }, 
			   position:"last",
			   cursor: "pointer"
			})
			.navButtonAdd('#ec_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="adm.organisation.expand.collapse.all"/>", 
			   buttonicon: "ui-icon-triangle-2-n-s",
			   onClickButton: function(){ 
					$("#ec_treegrid").find(".treeclick").trigger('click');   
			   }, 
			   position:"last",
			   cursor: "pointer"
			})           	
// 			.navButtonAdd('#ec_treegrid_pager',{
// 			   caption:"",
// 			   title:"Delete",  
// 			   buttonicon:"ui-icon-trash", 
// 			   onClickButton: function(){ 
// 			   }, 
// 			   position:"last",
// 			   cursor: "pointer"
// 			});          

          /*
          jQuery("#ec_treegrid").jqGrid('navGrid','#ec_treegrid_pager',{edit:false,add:false,del:false,search:false,refresh:true,
              beforeRefresh:function(){saveExpandedNodes([],true);}, cloneToTop:true});
          jQuery("#ec_treegrid").jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true, enableClear: false, groupOp:'AND', defaultSearch:'cn'});
          
          grid.jqGrid('navButtonAdd', "#ec_treegrid_pager", 
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



    	  $("#searchterm").on("change paste keyup select", function() {
              //var str = $("#searchterm").val();
              var str = $(this).val();
              
              if (str) {
                  var re = new RegExp(str,"i");
                  var r = $("#ec_treegrid").find("tr td:first-child");
                  
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       
                       //var localRowData = grid.jqGrid("getLocalRow", rowId);
                       var rowData = $("#ec_treegrid").getRowData(rowId);
                        
                       if(!jQuery.isEmptyObject(rowData)){
	                       if(re.test(rowData.name) || re.test(rowData.code)){
	                            //ensure to show all parents of matched nodes
	                       		//console.log("Match:" + rowData.name + ", Id: " + rowData.id);
	                       		while (rowData !== null && rowData.parent_id !== "") {
	                       			$($("#" + rowData.parent_id), "#ec_treegrid").show();
	                                rowData = $("#ec_treegrid").getRowData(rowData.parent_id);
	                       		}
	                       		
	                       }else{
	                           $($("#" + rowId), "#ec_treegrid").hide();
	                       }
                       }
                       
                  });
              }else{
            	  var r = $("#ec_treegrid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       $($("#" + rowId), "#ec_treegrid").show(); 
                  });                 
              }
          });
          
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_ec_treegrid_container').width();
		$('#ec_treegrid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_ec_treegrid_container">
			<div style="clear:left;">
				<table id="ec_treegrid" class="scroll" cellpadding="0" cellspacing="0"></table>
				<div id="ec_treegrid_pager" class="scroll" style="text-align: center;"></div>
			</div>
		</div>
		
	</div>
	<!-- end widget div -->

</body>

</html>
