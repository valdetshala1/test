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
        initDateEdit = function (elem) {
            $(elem).datepicker({
                dateFormat: "dd-M-yy",
                autoSize: true,
                changeYear: true,
                changeMonth: true,
                showButtonPanel: true,
                showWeek: true
            });
        },
        initDateSearch = function (elem) {
            var $self = $(this);
            setTimeout(function () {
                $(elem).datepicker({
                    dateFormat: "dd-M-yy",
                    autoSize: true,
                    changeYear: true,
                    changeMonth: true,
                    showWeek: true,
                    showButtonPanel: true,
                    onSelect: function () {
                        if (this.id.substr(0, 3) === "gs_") {
                            // call triggerToolbar only in case of searching toolbar
                            setTimeout(function () {
                                $self[0].triggerToolbar();
                            }, 100);
                        }
                    }
                });
            }, 100);
        },
        numberTemplate = {formatter: "number", align: "right", sorttype: "number",
            editrules: {number: true, required: true},
            searchoptions: { sopt: ["eq", "ne", "lt", "le", "gt", "ge", "nu", "nn", "in", "ni"] }};

        $(document).ready(function () {
        	$grid = jQuery("#user_grid").jqGrid({
        	   	url:'AdmGrid.user.do',	
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
                toppager: true,
                ignoreCase: true,
                
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id', 
        	        	   	'',
        	        	   	'<s:text name="adm.user.label.username"/>', 
        	        	   	'<s:text name="adm.user.label.roles"/>',
        	        	   	'<s:text name="adm.user.grid.birthdate"/>',
        	        	   	'<s:text name="adm.user.grid.gender"/>',
        	        	   	'<s:text name="adm.user.grid.personal_id"/>',
        	        	   	'<s:text name="adm.user.grid.email"/>',
        	        	   	'<s:text name="adm.user.grid.phone"/>',
        	        	   	'<s:text name="adm.user.grid.mobile"/>',
        	        	   	'<s:text name="adm.user.grid.created"/>',
        	        	   	'<s:text name="dp.doc.category.isactive"/>'
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'50%',search:false}, 
        	   		{name:'username',index:'username', width:'200%', resizable:true, search:true},
        	   		{name:'role',index:'role', width:'200%', search:false},
        	   		{name:'birthdate',index:'birthdate', width:'100%', align:"center", search:false},
        	   		{name:'gender',index:'gender', width:'50%', align:"center", search:false},
        	   		{name:'personal_id',index:'personal_id', width:'100%', align:"center", search:false},
        	   		{name:'email',index:'email', width:'150%', search:false},
        	   		{name:'phone',index:'phone', width:'120%', align:"center", search:false},
        	   		{name:'mobile',index:'mobile', width:'120%', align:"center", search:false},
        	   		{name:'created',index:'created', width:'100%', align:"center", search:false},
        	   		{name:'active',index:'active', width:'100%', align:"center", formatter:'checkbox', search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#user_grid_pager',
        	 	gridComplete: function(){
        			var ids = jQuery("#user_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('User','#user_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#user_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "User.form.do?userId=" + rowData.id;
 					loadURL(link, $("#user_form_content"));
   				}        		

        	});

        	jQuery("#user_grid").jqGrid('navGrid','#user_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true, search:false},
        			{}, {},{},{multipleSearch:true, recreateFilter:true});
			
        	jQuery("#user_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#user_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	
                	.navButtonAdd('#user_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "User.form.do?userId=" + rowData.id;
             					loadURL(link, $("#user_form_content"));
             	   			}else{
             	   	   			alert("<s:text name="tender.request.alarm"/>");
             	   	   		}   
             	   	   }, 
             	   	   position:"last",
             	   	   cursor: "pointer"
             	   	});
        $(window).bind('resize', function() {
            var width = $('#jqGrid_user_container').width();
            $('#user_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }
        });
    </script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_user_container">
				<table id="user_grid" class="scroll"></table> 
				<div id="user_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
