<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
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
        	var in_grid=jQuery("#financial_input_grid");
        	in_grid.jqGrid({
        	   	url:'FinGrid.financialInput2.do?type=IN',	
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
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id',
        	        	   	'',
        	        	   	'<s:text name="fin.input.allocated"/>',
        	        	   	'<s:text name="fin.input.allocated.date"/>',
        	        	   	'<s:text name="annu.felling.label.year"/>', 
        	        	   	'MonthKey',
        	        	   	'<s:text name="report.wood.production.label.month"/>', 
        	        	   	'<s:text name="finance.input.label.input.type"/>', 
        	        	   	'<s:text name="bidder.cadastral.municipality"/>',
        	        	   	'<s:text name="finance.input.label.value"/>',
        	        	   	'<s:text name="finance.payment.created.by"/>', 
        	        	   	'<s:text name="finance.payment.created.time"/>',
        	        	   	''],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'status_icon',index:'status_icon',hidden:false,sortable:false, width:'100%',search:false},
        	   		{name:'allocated',index:'allocated', width:'100%', align:"center",sortable:false,formatter:"checkbox",search:false},
        	   		{name:'allocated_date',index:'allocated_date', width:'100%', align:"center",sortable:false,search:false},
        	   		{name:'year',index:'i.year', width:'100%', align:"center",searchoptions:{sopt:['eq']}, sortable:true,search:true},
        	   		{name:'monthKey',index:'monthKey',hidden:true, width:'100%'},
        	   		{name:'month',index:'i.month', width:'100%', sortable:true,search:true,stype:'select',
            	   		 searchoptions:{sopt:['eq'], value: ':;JA:JA;FE:FE;MR:MR;AP:AP;MJ:MJ;JN:JN;JL:JL;AG:AG;SE:SE;OC:OC;NO:NO;DE:DE'}},
        	   		{name:'financial_type',index:'financial_type', width:'200%', align:"left",search:false},
        	   		{name:'municipality',index:'municipality', width:'150%', align:"left",search:false},
           	        {name:'cumulative_value',index:'cumulative_value',width:'100%', align:'center', search:false, 
               	        formatter:'currency', formatoptions:{prefix:'',suffix:' €',thousandsSeparator:','}},
        	   		{name:'created_by',index:'created_by', width:'150%', align:"left",search:false},
        	   		{name:'created_time',index:'created_time', width:'100%',align:"center",search:false},
        	   		{name:'status',index:'status', width:'100%',align:"center",search:false,hidden:true}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#financial_input_grid_pager',
        	   	sortname: '',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selRow = jQuery(this).jqGrid('getGridParam','selrow');
     	   			if(selRow){
	    				var rowData = jQuery(this).getRowData(selRow); 
	    				var link = "FinInput.form.do?finInputId=" + rowData.id;
	 					loadURL(link, $("#financial_input_form_content"));
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
   				subGrid: true,
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
	 	   					jQuery("#financial_input_grid").resetSelection();
	 	   				}
    		       });
    		       jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,search:false,add:false,del:false});
    		   }        		

        	});
        	
        	jQuery("#financial_input_grid").jqGrid('filterToolbar',{searchOperators : true});
        	jQuery("#financial_input_grid").jqGrid('navGrid','#financial_input_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});

        	jQuery("#financial_input_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#financial_input_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="label.button.edit"/>',
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "FinInput.form.do?finInputId=" + rowData.id;
             					loadURL(link, $("#financial_input_form_content"));
             	   			}else{
             	   	   			alert("<s:text name="global.please.select.row"/>"); 
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
             	   	.navButtonAdd('#financial_input_grid_pager',{
	             	   caption:"<s:text name='sub.menu.reports'/>",
	              	   title:"<s:text name='sub.menu.reports'/>", 
        		   	   buttonicon: "ui-icon-print",
        		   	   id:"print_button", 
        		   	   onClickButton: function(){ 
            		   	   $("#print_button").addClass("ui-state-disabled");
        			   		var link = "FinInput.reportPopup.do";
        			   		openDialogForm('financialReportGen',link,'<s:text name="label.button.generate.report"/>',800,420);
        		   	   }, 
        		   	   position:"last"
        	   		});
             	
             	if(opl!='M'){  	
        			jQuery("#financial_input_grid").navButtonAdd('#financial_input_grid_pager',{
             	   	   caption:"", 
             	   	   title:'<s:text name="attendanceRecord.change.status"/>',
             	   	   buttonicon:"ui-icon-shuffle", 
             	   	   id:"fin_status",
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "FinInput.statusPopup.do?finInputId=" + rowData.id;
             					openDialogForm('fininput_status_form_content',link,"",750,550);
             	   			}else{
             	   	   			alert("<s:text name="global.please.select.row"/>"); 
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	});
             	}	
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_financial_input_container').width();
            $('#financial_input_grid').setGridWidth(width);
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

			<div id="jqGrid_financial_input_container">
				<table id="financial_input_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="financial_input_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
