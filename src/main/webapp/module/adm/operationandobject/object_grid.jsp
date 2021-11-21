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
	$(document)
			.ready(function() {
				alert($("#permissionId").val());
				          var grid = $("#object_grid");
				          grid.jqGrid({
					        url: 'AdmGrid.rbacObjectTree.do?permissionId='+$("#permissionId").val(),
					        datatype: 'json',
					        mtype: 'GET',
					        colNames:['id', 
								        '<s:text name="leave.type.label.name"/>', 
								        '<s:text name="rbac.permission.grid.code"/>', 
								        '<s:text name="adm.objects.locked"/>'
								     ], 
					        colModel:[ 
								{name:'id',index:'id', width: 180, sorttype: "integer", hidden:false, key:true},
					            {name:'name',index:'name', width: 180, sorttype: "string"}, 
					            {name:'code',index:'code',width: 180, sorttype: "string"},
					            {name:'locked',index:'locked',width: 180, sorttype: "string"}
					        ],
					        
						        jsonReader : { 
						        	rows: "rows", 
						            page: "page", 
						            total: "total", 
						            records: "records", 
						            repeatitems: false, 
						            id: "id"
						        },
				              gridview: true,
				              sortname: 'name',	
				              treeGrid: true,
				              loadonce: false,
				              loadui: "disable",
				              treeGridModel: 'adjacency',
				              treedatatype: 'json',
				              ExpandColumn: 'name',
				              treeIcons: {leaf:'ui-icon-document-b'},
				              height: 'auto',
				              pager : "#object_grid_pager",
				              caption: "",
				              loadComplete: function (data) {
							    	 $("#object_grid").jqGrid('setGridParam', { sortname: 'name', sortorder: 'asc' });
							    	   $("#object_grid").trigger("reloadGrid");
					
				                    }				              
				          });

				          grid
				           	.navGrid('#object_grid_pager',{edit:false,add:false,del:false,search:false})
				           	.navButtonAdd('#object_grid_pager',{
				           	   caption:"", 
				           	   title:"<s:text name="label.button.edit"/>", 
				           	   buttonicon:"ui-icon-pencil", 
				           	   onClickButton: function(){ 
									var iRow = jQuery(this).jqGrid('getGridParam','selrow');
									if(iRow){
										var rowData = jQuery(this).getRowData(iRow); 
										var link = "Domain.form.do?domainId=" + rowData.id;
										loadURL(link, $("#domain_form_content"));
									}else{
										alert("<s:text name="global.please.select.row"/>");
									}   
				           	   }, 
				           	   position:"last"
				           	})
			});

	
	$(window).bind('resize', function() {
		var width = $('#jqGrid_rbacobject_container').width();
		$('#object_grid').setGridWidth(width);
	});

	/* Remove jquery-ui styles from jqgrid */
	 function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }
</script>

</head>
<body>
	<!-- widget div-->
	<div style="margin-bottom: 1.0em;">

		<div id="jqGrid_rbacobject_container">
			
			<table id="object_grid" class="scroll" cellpadding="0" cellspacing="0"></table>
			<div id="object_grid_pager" class="scroll"
				style="text-align: center;">
			</div>
			
		</div>

	</div>
	<!-- end widget div -->


</body>

</html>
