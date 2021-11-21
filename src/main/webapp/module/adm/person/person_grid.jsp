<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	jQuery("#person_grid").jqGrid({
        	   	url:'AdmGrid.persons.do',	
        	   	mtype: 'GET',
        		datatype: "json",
        		jsonReader : {
   			      root:"rows",
   			      page: "page",
   			      total: "total",
   			      records: "records",
   			      repeatitems: false,
   			      id: "0"
        		},
        		height: '100%',
        		width: '100%',
        		autowidth: true,
        		shrinkToFit: false,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
        	        	   	'',
        	        	   	'<s:text name="label.person.firstname"/>', 
        	        	   	'<s:text name="label.person.lastname"/>', 
        	        	   	'<s:text name="label.person.birthdate"/>',
        	        	   	'<s:text name="label.person.gender"/>',
        	        	   	'<s:text name="hum.employee.label.personal.id"/>',
        	        	   	'<s:text name="dp.doc.category.isactive"/>',
        	        	   	'<s:text name="adm.person.grid.party.type"/>',
        	        	   	'<s:text name="hum.employee.label.degree"/>',
        	        	   	'<s:text name="hum.employee.label.notes"/>',
        	        	   	'<s:text name="adm.person.party.id"/>'], 
        	   	colModel:[
					{name:'id',index:'id',hidden:true, width:'100%'},	
					{name:'act',index:'act', width:'50%',search:false},   	
        	   		{name:'first_name',index:'first_name', width:'150%',search:true},
        	   		{name:'last_name',index:'last_name', width:'150%',search:true},
        	   		{name:'birthdate',index :'birthdate', width:'100%', align:"center",search:false},
        	   		{name:'gender',index:'gender', width:'100%', align:"center",search:false},		
        	   		{name:'personal_id',index:'personal_id', width:'100%',align:"center",search:false},
        	   		{name:'active',index:'active', width:'100%',align:"center",sortable:false,search:false,formatter:"checkbox"},
        	   		{name:'party_type',index :'party_type', width:'100%',search:false,hidden:true},
        	   		{name:'degree',index:'degree', width:'100%',hidden:true,search:false},		
        	   		{name:'notes',index:'notes', width:'300%',search:false,sortable:false},
        	   		{name:'party_id',index:'party_id', width:'100%',align:"center",hidden:true,search:false}	
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#person_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#person_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Person','#person_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#person_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'p.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
        		ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Person.form.do?personId=" + rowData.id+"&parentPersonId="+rowData.party_id;
    				loadURL(link, $("#person_form_content")); 				
   				} 

        	});
              	
        	$("#person_grid")
           	.navGrid('#person_grid_pager',{edit:false,add:false,del:false,search:false})
           	.jqGrid('filterToolbar',{searchOperators : true})
           	.navButtonAdd('#person_grid_pager',{
           	   caption:"", 
           	   title:"<s:text name="label.button.edit"/>", 
           	   buttonicon:"ui-icon-pencil", 
           	   onClickButton: function(){ 
           			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
           			if(iRow){
        				var rowData = jQuery(this).getRowData(iRow); 
        				var link = "Person.form.do?personId=" + rowData.id+"&parentPersonId="+rowData.party_id;
        				loadURL(link, $("#person_form_content"));
           			}else{
           	   			alert("<s:text name="global.please.select.row"/>"); 
           	   		}   
           	   }, 
           	   position:"last"
           	});
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_pers_container').width();
            $('#person_grid').setGridWidth(width);
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
			<input type="hidden" id="location" value="person_grid">
			<div id="jqGrid_pers_container">
				<table id="person_grid" class="scroll"></table> 
				<div id="person_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
