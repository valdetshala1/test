<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <script type="text/javascript">
   $(document).ready(function () {
   	jQuery("#employee_grid").jqGrid({
   	   	url:'HrmGrid.employee.do?q=2',	
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
   	      	        '<s:text name="dp.doc.category.isactive"/>', 
   	      	   		'<s:text name="hum.employee.grid.location"/>',
   	      	   		'<s:text name="hum.employee.label.job.title"/>', 
   	      	        '<s:text name="hum.employee.label.ethnicity"/>',
   	      	   		'<s:text name="hum.employee.label.persWithLmtAbilities"/>',
   	      	   		'<s:text name="label.employee.number"/>', 
   	      	   		'<s:text name="hum.employee.grid.from.date"/>', 
   	        	   	'<s:text name="hum.employee.label.contract.type"/> Type', 
   	        	   	'<s:text name="hum.employee.label.personal.id"/>',
   	        	   	'<s:text name="hum.employee.label.notes"/>',
	        	   	'<s:text name="report.thinning.grid.label.created.by"/>',
	        	   	'<s:text name="report.damage.grid.label.created.date"/>'
   	        	   	],
   	   	colModel:[
   	   		{name:'id',index:'id', hidden:true, width:'100%',search:false},
   	   		{name:'act',index:'act', width:'20%',search:false},
   	   		{name:'first_name',index:'p.first_name', width:'100%',search:true},
   	   		{name:'last_name',index:'p.last_name', width:'100%',search:true},
   	   		{name:'birthdate',index:'p.birthdate', width:'100%', align:"center",search:true},
   	   		{name:'gender',index:'gender', width:'100%', align:"center",search:false},
   	   		{name:'active',index:'active', width:'100%',align:"center",sortable:false,search:false,formatter:"checkbox"},
   	   		{name:'location',index:'location', width:'100%', align:"left",search:false},				
   	   		{name:'job_title',index:'job_title', width:'100%', align:"center",search:false},	
   	   		{name:'ethnicity',index:'ethnicity', width:'100%', align:"center",search:false},
   	   		{name:'persWithLmtAbilities',index:'persWithLmtAbilities', width:'100%',align:"center",sortable:false,search:false,formatter:"checkbox"},
   	   		{name:'ssn_num',index:'ssn_num', width:'100%', align:"center",search:false},
   	   		{name:'from_date',index:'from_date', width:'100%', align:"center",search:false,hidden:true},
   	   		{name:'conctract_type',index:'conctract_type', width:'100%', align:"center",search:false},
   	   		{name:'personal_id',index:'p.personal_id', width:'100%',align:"center",search:true},		
   	   		{name:'note',index:'note', width:'100%', sortable:false,search:false},
   	   		{name:'created_by',index:'created_by', width:'100%', sortable:false,search:false},
   	   		{name:'created_date',index:'created_date', width:'100%', sortable:false,search:false},
   	   	
   	   				
   	   	],
   	   	rowNum:10,
   	   	rowList:[10,20,30],
   	   	pager: '#employee_grid_pager',
   		gridComplete: function(){
			var ids = jQuery("#employee_grid").jqGrid('getDataIDs');
			for(var i=0;i < ids.length;i++){
				var cl = ids[i];
					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('Employee','#employee_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
					jQuery("#employee_grid").jqGrid('setRowData',ids[i],{act:au});
			}	
		},
        sortname: 'e.id',
        sortorder: "desc",
        sorttype: "text",
        scrolloffset: 0,
        sortable: true,
   	    viewrecords: true,
   	 	multiboxonly: true,
   		multiselect: false,
   		caption: "",
   		loadtext:'<s:text name="grid.loading.text"/>',
   		loadComplete: function(data){
        },
		ondblClickRow: function(id, iRow, iCol, e) {
			var rowData = jQuery(this).getRowData(iRow); 
			var link = "Employee.form.do?employeeId=" + rowData.id;
			var linkProfile = "Employee.profile.do?employeeId=" + rowData.id;
			
			loadURL(link, $("#employee_form_content"));
			loadURL(linkProfile, $("#employee_profile_content"));
			$("#employee_profile_content").show();
		}        		
   	});

   	$("#employee_grid")
   	.navGrid('#employee_grid_pager',{edit:false,add:false,del:false,search:false})
   	.jqGrid('filterToolbar',{searchOperators : true})
   	.navButtonAdd('#employee_grid_pager',{
   	   caption:"", 
   	   title:"<s:text name="label.button.edit"/>", 
   	   buttonicon:"ui-icon-pencil", 
   	   onClickButton: function(){ 
   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
   			if(iRow){
				var rowData = jQuery(this).getRowData(iRow); 
				var link = "Employee.form.do?employeeId=" + rowData.id;
				var linkProfile = "Employee.profile.do?employeeId=" + rowData.id;
				loadURL(link, $("#employee_form_content"));
				loadURL(linkProfile, $("#employee_profile_content")); 
				$("#employee_profile_content").show(); 	  
   			}else{
   	   			alert("<s:text name="global.please.select.row"/>");
   	   		}   
   	   }, 
   	   position:"last"
   	})
   	.navButtonAdd('#employee_grid_pager',{
   	   caption:"",
   	   title:"<s:text name="report.grid.caption"/>",  
   	   buttonicon:"ui-icon-print",
   	   id:'print_button',
   	   onClickButton: function(){
   	   	  $("#print_button").addClass("ui-state-disabled");
   	      var link="Employee.employeeListReport.do";
   	      openDialogForm("employee_list_report_generator",link,"<s:text name="label.employee.list"/>",500,300);
   	   }, 
   	   position:"last"
   	});

   });


	       
   $(window).bind('resize', function() {
      var width = $('#jqGrid_emp_container').width();
      $("#employee_grid").jqGrid('setGridWidth',width);
   });
           
   /* Remove jquery-ui styles from jqgrid */
   function removeJqgridUiStyles(){
       /*
       $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
       $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
       $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
       $(".ui-jqgrid-pager").removeClass("ui-state-default");
       */
   }        
</script>
    
</head>
<body>
		<!-- widget div -->
		<div style="margin-bottom: 1.0em;">
			
			<div id="jqGrid_emp_container">
				
				<table id="employee_grid" class="scroll"></table>
				<div id="employee_grid_pager"></div>
	
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
