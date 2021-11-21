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
						jQuery('#domain_grid').jqGrid({
					        url: "AdmGrid.rbacDomains.do",
					        datatype: 'json',
					        mtype: 'GET',
					        jsonReader : { 
					        	rows: "rows", 
					            page: "page", 
					            total: "total", 
					            records: "records", 
					            repeatitems: false, 
					            cell: "", 
					            id: "id"
					        },
					        colNames:['ID',
								        '<s:text name="hrm.skill.grid.name"/>', 
								        '<s:text name="finance.type.label.description"/>', 
								        '<s:text name="adm.domain.singular"/>' 
								      ], 
					        colModel:[ 
								{name:'id',index:'id', width: 180, sorttype: "int",hidden:true},
					            {name:'name',index:'name', width: 180, sorttype: "string"}, 
					            {name:'description',index:'description',width: 180, sorttype: "string"}, 
					            {name:'is_singular',index:'is_singular', width: 180, sorttype: "string"}, 
					        ],
						    gridview: true,
						    sortname: 'id',
						    loadonce: false,
						    treeGridModel: 'adjacency',
						    treedatatype: 'json',
						    height: 'auto',
						    pager : "#domain_grid_pager",
						    caption: ""
						    
					        
					    });
						$("#domain_grid")
			           	.navGrid('#domain_grid_pager',{edit:false,add:false,del:false,search:false})
			           	.navButtonAdd('#domain_grid_pager',{
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
			           	.navButtonAdd('#domain_grid_pager',{
			           	   caption:"",
			           	   title:"<s:text name="label.button.delete"/>",  
			           	   buttonicon:"ui-icon-trash", 
			           	   onClickButton: function(){ 
			           	      alert("<s:text name="alarm.deleting.row"/>");
			           	   }, 
			           	   position:"last"
			           	});
					});
	
	$(window).bind('resize', function() {
		var width = $('#jqGrid_rbacdomain_container').width();
		$('#domain_grid').setGridWidth(width);
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

		<div id="jqGrid_rbacdomain_container">
			
			<table id="domain_grid" class="scroll" cellpadding="0" cellspacing="0"></table>
			
			<div id="domain_grid_pager" class="scroll"
				style="text-align: center;">
			</div>
			
		</div>

	</div>
	<!-- end widget div -->


</body>

</html>
