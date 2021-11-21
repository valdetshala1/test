<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/module/base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        function displayDocumentIcons(cellvalue, options,rowData, rowObject){
        	var icon = "";
        	if(rowData.doc_type){
        		icon='<img src="img/filetypes/32px/' + rowData.doc_type + '.png"/>';
        	}  
            return icon;
        }    	
        $(document).ready(function () {
        	var opl='<s:property value="user.getOperationalLevelVal()"/>'; 
        	var in_grid=jQuery("#salary_grid");
        	in_grid.jqGrid({
        	   	url:'FinGrid.employeesalary.do',	
        	   	mtype: 'POST',
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
        	        	   	'<s:text name="hrml.employee.salary.basicsalary"/>',
        	        	   	'<s:text name="hrml.employee.salary.grosssalary"/>',
        	        	   	'<s:text name="hrml.employee.salary.payperiod"/>',
        	        	   	'<s:text name="hrml.employee.salary.autopay"/>',
        	        	   	'<s:text name="hrml.employee.salary.adjustment.createdBy"/>',
        	        	   	'<s:text name="hrml.employee.salary.adjustment.createdDate"/>',
        	        	   	
                	   	],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'status_icon',index:'status_icon',hidden:true,sortable:false, width:'100%',search:false},
        	   		{name:'employee.person.firstName',index:'per.first_name', width:'100%', align:"center",sortable:true,search:true},
        	   		{name:'employee.person.lastName',index:'per.last_name', width:'100%', align:"center",sortable:true,search:true},
        	   		{name:'employee.person.birthdate',index:'employee.person.birthdate', width:'100%', align:"center",sortable:false,search:false},
        	   		{name:'basicsalary',index:'basicsalary', width:'100%', align:"center",sortable:false,search:false,
        	   			formatter:'currency', formatoptions:{prefix:'',suffix:' €',thousandsSeparator:','}
            	   		},
        	   		{name:'grosssalary',index:'grosssalary', width:'100%', align:"center",sortable:false,search:false,
        	   			formatter:'currency', formatoptions:{prefix:'',suffix:' €',thousandsSeparator:','}
            	   	},	
        	   		{name:'payperiod',index:'payperiod', width:'100%', align:"center",sortable:false,search:false},
        	   		{name:'autopay',index:'autopay', width:'100%', align:"center",sortable:false,search:false}, //formatter:"checkbox"
        	   		{name:'createdBy',index:'createdBy', width:'100%', align:"center",sortable:false,search:false},
        	   		{name:'createdDate',index:'createdDate', width:'100%', align:"center",sortable:false,search:false}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#salary_grid_pager',
        	   	sortname: 'i.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selRow = jQuery(this).jqGrid('getGridParam','selrow');
     	   			if(selRow){
	    				var rowData = jQuery(this).getRowData(selRow); 
	    				var link = "Salary.form.do?salaryId=" + rowData.id;
	 					loadURL(link, $("#salary_form_content"));
     	   			}
   				},
   				onSelectRow: function() { 
   					var iRow = jQuery(this).jqGrid('getGridParam','selrow');
     	   			if(iRow){
     					var rowData = jQuery(this).getRowData(iRow);
     					if((rowData.status=='RE' || rowData.status=='CV') || (rowData.status=='CR' && opl!='R') || (rowData.status=='RV' && opl=='R')){
							$("#fin_status").addClass("ui-state-disabled");
         				} else{
         					$("#fin_status").removeClass("ui-state-disabled");
             			}
     	   			}
   				},
   				subGrid: false,

    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id, pager_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       pager_id = "p_"+subgrid_table_id;
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FinGrid.financialInputStatus.do?finInput_id="+in_grid.getRowData(row_id).id,
    		          datatype: "json",
    		          colNames: [ 'Id',
    		                      '<s:text name="annual.plan.status"/>',
    		    		          '<s:text name="mer.execution.note"/>',
    		    		          '',
    		    		          '<s:text name="doc.name"/>',
    		    		          '<s:text name="doc.type"/>',
    		    		          '<s:text name="bid.grid.created.date"/>',
    		    		          '<s:text name="bid.grid.created.by"/>'
	    		   	  ],
    		          colModel: [
    		            {name:"id",index:"id",width:'100%',hidden:true},
    		            {name:"status",index:"status",width:'150%',align:"center"},
    		            {name:"note",index:"note",sortable:false,width:'200%',align:"center"},
    		            {name: "icon", index:"icon", sortable:false,width:'50%', align:"center",
    		                formatter: displayDocumentIcons 
    		            },
     		            {name:"doc_name",index:"doc_name",width:'100%',align:'left',
    		           	 formatter: function (cellvalue, options, rowObject) {
    		           			return '<a href="FinInputDoc.do?docId=' + rowObject.id + '" target="_blank"><span style="color:blue"><u>' + cellvalue +  '</u></span></a>';
    		                }
    		            },
    		            {name:"doc_type",index:"doc_type",width:'100%',align:"center"},           
    		            {name:"create_date",index:"create_date",width:'100%',align:"center"},
    		            {name:"created_by",index:"created_by",width:'100%',align:"center"}
    		          ],
    		       	  pager: pager_id,
    		          height: 'auto',
    		          width: 'auto',
    		          rowNum:10,
    	        	  rowList:[10,20,30],
    		      	  viewrecords: true,
    		          sortname: 's.id',
    		          sortorder: "asc",
 	   		       		gridComplete: function(){
 	   					},
	 	   				onSelectRow: function(ids) { 
	 	   					jQuery("#salary_grid").resetSelection();
	 	   				}
    		       });
    		       jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,search:false,add:false,del:false});
    		   }        		

        	});
        	jQuery("#salary_grid").jqGrid('filterToolbar',{searchOperators : true});
              	
        	jQuery("#salary_grid").jqGrid('navGrid','#salary_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#salary_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#salary_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
        	    				var link = "Salary.form.do?salaryId=" + rowData.id;
        	 					loadURL(link, $("#salary_form_content"));             					
             	   			}else{
             	   	   			alert("<s:text name="global.please.select.row"/>"); 
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
             	   	.navButtonAdd('#salary_grid_pager',{
	             	   caption:"<s:text name='sub.menu.reports'/>",
	              	   title:"<s:text name='sub.menu.reports'/>", 
        		   	   buttonicon: "ui-icon-print",
        		   	   id:"print_button", 
        		   	   onClickButton: function(){ 
            		   	   $("#print_button").addClass("ui-state-disabled");
        			   		var link = "Payroll.reportPopup";
        			   		openDialogForm('financialReportGen',link,'<s:text name="label.button.generate.report"/>',800,420);
        		   	   }, 
        		   	   position:"last"
        	   		});
        	   		
             	
             	if(opl!='M'){  	
        			jQuery("#salary_grid").navButtonAdd('#salary_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="attendanceRecord.change.status"/>',
             	   	   buttonicon:"ui-icon-shuffle", 
             	   	   id:"fin_status",
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					//var link = "FinInput.statusPopup.do?finInputId=" + rowData.id;
             					//openDialogForm('fininput_status_form_content',link,"",750,550);
             	   			}else{
             	   	   			alert("<s:text name="global.please.select.row"/>"); 
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	});
             	}	
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_salary_container').width();
            $('#salary_grid').setGridWidth(width);
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

			<div id="jqGrid_salary_container">
				<table id="salary_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="salary_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
