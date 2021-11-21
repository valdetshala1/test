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
</style>
<script type="text/javascript">
	$(document).ready(function() {
                
          var grid = $("#object_grid");

          grid.jqGrid({
	        url: 'AdmGrid.rbacObjectTree2.do',
	        datatype: 'json',
	        mtype: 'GET',
	        colNames:['id', 
		      	        '<s:text name="hrm.skill.grid.name"/>', 
		      	        '<s:text name="adm.organisation.label.code"/>', 
		      	        '<s:text name="adm.objects.locked"/>'
	      	        ], 
	        colModel:[ 
				{name:'id',index:'id', width: 100, sortable:false, hidden:true, key:true},
	            {name:'name',index:'name', width: 300, sortable:false}, 
	            {name:'code',index:'code', width: 50, align:'center', sortable:false},
	            
	            {name:'locked',index:'locked', width: 50, align:'center', sortable:false, editoptions: { value:"0:1" }, 
	            	formatter:"checkbox", formatoptions: {disabled : true}
	            },					            
	        ],
		     jsonReader : { 
		        	rows: "rows", 
		            page: "page", 
		            total: "total", 
		            records: "records", 
		            repeatitems: false, 
		            id: "id"
		     },
              sortname: 'name',	
              treeGrid: true,
  	          loadonce: true,
	          ignoreCase: true,              
              multiselect: false,
              loadui: "disable",
              treeGridModel: 'adjacency',
              treedatatype: 'json',
              ExpandColumn: 'name',
              treeIcons: {leaf:'ui-icon-document-b'},
              height: 'auto',
              pager : "#object_grid_pager",
              toppager:true,
              caption: "RBAC Object",
              loadComplete: function (data) {
		    	 $("#object_grid").jqGrid('setGridParam', { sortname: 'name', sortorder: 'asc' });
		    	 $("#object_grid").trigger("reloadGrid");
              }
                   				              
          });

          grid.navGrid('#object_grid_pager',{edit:false,add:false,del:false,search:false});

          var checkboxFix = [];
          $("#object_grid td[aria-describedby='read'] input").each(function () {
	          		alert($(this).attr('checked'));
                  checkboxFix.push($(this).attr('checked'));
          });		


          $("#searchterm").keyup(function() {
              
              var str = $("#searchterm").val();
              
              if (str) {
                  var re = new RegExp(str,"i");
                  var r = $("#object_grid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       
                       var rowId = _td.text();
//                        
					if(rowId){
                       var rowData = $("#object_grid").getRowData(rowId); 
                       if(rowData){
	                       if(re.test(rowData.name)){
	                            //ensure to show all parents of matched nodes
	                       		while (rowData !== null && rowData.parent !== "") {
	                       			$($("#" + rowData.parent), "#object_grid").show();
	                                rowData = $("#object_grid").getRowData(rowData.parent);
	                       		}
	                       }else{
	                           $($("#" + rowId), "#object_grid").hide();
	                       }
                       }
                  }
                  });
              }else{
            	  var r = $("#object_grid").find("tr td:first-child");
                  r.each(function (index, instance) {
                       var _td = $(instance);
                       var rowId = _td.text();
                       $($("#" + rowId), "#object_grid").show(); 
                  });                 
              }
          });         
				          		          
	});
	//EOF ready


	$(window).bind('resize', function() {
		var width = $('#jqGrid_rbacobject_container').width();
		$('#object_grid').setGridWidth(width);
	});

</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_rbacobject_container">
			<div id="mysearch"></div>
			<table id="object_grid" class="scroll" cellpadding="0" cellspacing="0"></table>
			<div id="object_grid_pager" class="scroll" style="text-align: center;"></div>
			
		</div>

	</div>
	<!-- end widget div -->

</body>

</html>
