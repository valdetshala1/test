<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
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
	$(document).ready(function() {
          var grid = $("#activitydomain_treegrid");
          grid.jqGrid({
	        url: 'FrmGrid.activityDomainTree.do',
	        datatype: 'json',
	        mtype: 'GET',
	        colNames:['id', 
	      	        'parent_id',
	      	        '<s:text name="adm.organisation.label.name"/>', 
	      	     	'<s:text name="finance.type.label.name.en"/>', 
	      	    	'<s:text name="finance.type.label.name.sr"/>', 
	      	        '<s:text name="adm.organisation.label.code"/>'
	      	        ], 
	        colModel:[ 
				{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
				{name:'parent_id',index:'parent_id', width: 100, sortable:false, hidden:true, key:true},
	            {name:'name_al',index:'name_al', width: 200,align:'left', sortable:false, search:true}, 
	            {name:'name_en',index:'name_en', width: 150,align:'center', sortable:false, search:true}, 
	            {name:'name_sr',index:'name_sr', width: 150,align:'center', sortable:false, search:true},
	            {name:'code',index:'code', width: 50, align:'center', sortable:false, search:false}
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
              sortname: 'name_al',	
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
              ExpandColumn: 'name_al',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#activitydomain_treegrid_pager",
              caption: "Activity Domain", 
              toppager:true,
              viewrecords: true,
              ExpandColClick: true,
              scrollrows: true,
              shrinkToFit: false,	
              loadComplete: function (data) {
		    	 $("#activitydomain_treegrid").jqGrid('setGridParam', { sortname: 'name_al', sortorder: 'asc' });
		    	 $("#activitydomain_treegrid").trigger("reloadGrid");
              },
              onSelectRow: function(id, iRow){
              },
              ondblClickRow: function(id, iRow, iCol, e) {
 			}        		              
                   				              
          });
			
          grid.navGrid('#activitydomain_treegrid_pager',{edit:false,add:false,del:false,search:false})
			.navButtonAdd('#activitydomain_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="label.button.edit"/>", 
			   buttonicon:"ui-icon-pencil", 
			   onClickButton: function(){
   	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
 	   			if(iRow){
 	  				var rowData = jQuery(this).getRowData(iRow); 
 	  				$("#activitydomain_form_content").show();
 					var link = "ActivityDomain.form.do?activityDomainId=" + rowData.id;
 	 				loadURL(link, $("#actdomain_form_content"));
 	   			}else{
 	   	   			alert("<s:text name="global.please.select.row"/>");
 	   	   		}  					
			   }, 
			   position:"last",
			   cursor: "pointer"
			})   	
			.navButtonAdd('#activitydomain_treegrid_pager',{
			   caption:"", 
			   title:"<s:text name="adm.organisation.expand.collapse.all"/>", 
			   buttonicon: "ui-icon-triangle-2-n-s",
			   onClickButton: function(){ 
					$("#activitydomain_treegrid").find(".treeclick").trigger('click');   
			   }, 
			   position:"last",
			   cursor: "pointer"
			});
          $("#searchterm").change(function() {
              var str = $("#searchterm").val();
              if (str) {
                  var re = new RegExp(str,"i");
                  var r = $("#activitydomain_treegrid").find("tr td:first-child");
                  
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       //var localRowData = grid.jqGrid("getLocalRow", rowId);
                       var rowData = $("#activitydomain_treegrid").getRowData(rowId);
                        
                       if(!jQuery.isEmptyObject(rowData)){
	                       if(re.test(rowData.orga_name)){
	                            //ensure to show all parents of matched nodes
	                       		console.log("Match:" + rowData.orga_name + ", Id: " + rowData.id);
	                       		while (rowData !== null && rowData.parent_id !== "") {
	                       			$($("#" + rowData.parent_id), "#activitydomain_treegrid").show();
	                                rowData = $("#activitydomain_treegrid").getRowData(rowData.parent_id);
	                       		}
	                       		
	                       }else{
	                           $($("#" + rowId), "#activitydomain_treegrid").hide();
	                       }
                       }
                  });
              }else{
            	  var r = $("#activitydomain_treegrid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       $($("#" + rowId), "#activitydomain_treegrid").show(); 
                  });                 
              }
          });
          
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_activitydomain_treegrid_container').width();
		$('#activitydomain_treegrid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_activitydomain_treegrid_container">
			<div style="clear:left;">
				<table id="activitydomain_treegrid" class="scroll" cellpadding="0" cellspacing="0"></table>
				<div id="activitydomain_treegrid_pager" class="scroll" style="text-align: center;"></div>
			</div>
		</div>
	</div>
	<!-- end widget div -->

</body>

</html>
