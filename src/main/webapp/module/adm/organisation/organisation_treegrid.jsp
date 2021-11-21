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
		if(cellvalue == 'C'){
			return "<i class='fa fa-university'></i> <span style='color:blue;'>" + cellvalue + "</span>";
		}else if(cellvalue == 'R'){
			return "<i class='fa fa-sitemap'></i> <span style='color:green;'>" + cellvalue + "</span>";
		}else if(cellvalue == 'M'){
			return "<i class='fa fa-home'></i> <span style='color:#61210B;'>" + cellvalue + "</span>";
		}else{
			return cellvalue;
		}
	}

	$(document).ready(function() {
          var grid = $("#org_treegrid");
          grid.jqGrid({
            //economiccodeTree, organisationTree
	        url: 'AdmGrid.organisationTree.do',
	        datatype: 'json',
	        mtype: 'GET',
	        colNames:['id', 
	      	        '<s:text name="adm.organisation.label.name"/>', 
	      	     	'<s:text name="finance.type.label.name.en"/>', 
	      	    	'<s:text name="finance.type.label.name.sr"/>', 
	      	        '<s:text name="adm.organisation.label.code"/>', 
	      	        '<s:text name="adm.organisation.label.operation.level"/>', 
	      	        '<s:text name="adm.organisation.label.operation.type"/>', 
	      	        '<s:text name="adm.organisation.label.operation.category"/>', 
	      	        '<s:text name="annual.plan.municipality"/>', 
	      	        '<s:text name="frm.private.plan.start.cmpgn.date"/>', 
	      	        '<s:text name="frm.private.plan.end.cmpgn.date"/>', 
	      	        '<s:text name="adm.person.grid.party.type"/>', 
	      	        '<s:text name="adm.organisation.parent.id"/>',
	      	      	'<s:text name="law.suit.label.active"/>' 
	      	        ], 
	        colModel:[ 
				{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
	            {name:'orga_name',index:'orga_name', width: 200,align:'left', sortable:false, search:true}, 
	            {name:'orga_name_en',index:'orga_name_en', width: 150,align:'center', sortable:false, search:true}, 
	            {name:'orga_name_sr',index:'orga_name_sr', width: 150,align:'center', sortable:false, search:true}, 
	            {name:'code',index:'code', width: 50, align:'center', sortable:false, search:false},
	            {name:'op_level',index:'op_level', width: 50, align:'center', sortable:false, search:false, formatter: customFormatter},
	            {name:'orga_type',index:'orga_type', width: 30, align:'center', sortable:false, search:false},
	            {name:'orga_category',index:'orga_category', width: 30, align:'center', sortable:false, search:false},
	            {name:'municipality',index:'municipality', width: 100, align:'center', sortable:false, search:false},
	            {name:'start_date',index:'start_date', hidden:true, width: 50, align:'center', sortable:false, search:false},
	            {name:'end_date',index:'end_date', hidden:true, width: 50, align:'center', sortable:false, search:false},
	            {name:'party_type',index:'party_type', hidden:true, width: 50, align:'center', sortable:false, search:false},
	            {name:'parent_id',index:'parent_id', hidden:true, width: 50, align:'center', sortable:false, search:false},
	            {name:'active',index:'active', width: 50, align:'center', sortable:false,search:false,formatter:"checkbox"}
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
              sortname: 'orga_name',	
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
              ExpandColumn: 'orga_name',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#org_treegrid_pager",
              caption: "<s:text name="adm.organisation.legend.organisation.tree"/>", 
              toppager:true,
              viewrecords: true,
              ExpandColClick: true,
              scrollrows: true,
              loadComplete: function (data) {
		    	 $("#org_treegrid").jqGrid('setGridParam', { sortname: 'orga_name', sortorder: 'asc' });
		    	 $("#org_treegrid").trigger("reloadGrid");
              },
              onSelectRow: function(id, iRow){
              },
              ondblClickRow: function(id, iRow, iCol, e) {
  				var rowData = jQuery(this).getRowData(id); 
				var link = "Organisation.form.do?organisationId=" + rowData.id;
 				loadURL(link, $("#organisation_form_content"));
 			}        		              
                   				              
          });
			
          grid.navGrid('#org_treegrid_pager',{edit:false,add:false,del:false,search:false})
			.navButtonAdd('#org_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="label.button.edit"/>", 
			   buttonicon:"ui-icon-pencil", 
			   onClickButton: function(){
   	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
 	   			if(iRow){
 	  				var rowData = jQuery(this).getRowData(iRow); 
 					var link = "Organisation.form.do?organisationId=" + rowData.id;
 	 				loadURL(link, $("#organisation_form_content"));
 	   			}else{
 	   	   			alert("<s:text name="global.please.select.row"/>");
 	   	   		}  					
			   }, 
			   position:"last",
			   cursor: "pointer"
			})
			.navButtonAdd('#org_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="adm.organisation.expand.collapse.all"/>", 
			   buttonicon: "ui-icon-triangle-2-n-s",
			   onClickButton: function(){ 
					$("#org_treegrid").find(".treeclick").trigger('click');   
			   }, 
			   position:"last",
			   cursor: "pointer"
			})           	
// 			.navButtonAdd('#org_treegrid_pager',{
// 			   caption:"",
// 			   title:"Delete",  
// 			   buttonicon:"ui-icon-trash", 
// 			   onClickButton: function(){ 
// 			   }, 
// 			   position:"last",
// 			   cursor: "pointer"
// 			});          

          /*
          jQuery("#org_treegrid").jqGrid('navGrid','#org_treegrid_pager',{edit:false,add:false,del:false,search:false,refresh:true,
              beforeRefresh:function(){saveExpandedNodes([],true);}, cloneToTop:true});
          jQuery("#org_treegrid").jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true, enableClear: false, groupOp:'AND', defaultSearch:'cn'});
          
          grid.jqGrid('navButtonAdd', "#org_treegrid_pager", 
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
                  var r = $("#org_treegrid").find("tr td:first-child");
                  
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       
                       //var localRowData = grid.jqGrid("getLocalRow", rowId);
                       var rowData = $("#org_treegrid").getRowData(rowId);
                        
                       if(!jQuery.isEmptyObject(rowData)){
	                       if(re.test(rowData.orga_name)){
	                            //ensure to show all parents of matched nodes
	                       		console.log("Match:" + rowData.orga_name + ", Id: " + rowData.id);
	                       		while (rowData !== null && rowData.parent_id !== "") {
	                       			$($("#" + rowData.parent_id), "#org_treegrid").show();
	                                rowData = $("#org_treegrid").getRowData(rowData.parent_id);
	                       		}
	                       		
	                       }else{
	                           $($("#" + rowId), "#org_treegrid").hide();
	                       }
                       }
                  });
              }else{
            	  var r = $("#org_treegrid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       $($("#" + rowId), "#org_treegrid").show(); 
                  });                 
              }
          });
          
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_org_treegrid_container').width();
		$('#org_treegrid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_org_treegrid_container">
			<div style="clear:left;">
				<table id="org_treegrid" class="scroll" cellpadding="0" cellspacing="0"></table>
				<div id="org_treegrid_pager" class="scroll" style="text-align: center;"></div>
			</div>
		</div>
		
	</div>
	<!-- end widget div -->

</body>

</html>
