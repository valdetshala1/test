<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
</style>
        <script type="text/javascript">
        $(document).ready(function () {
        	jQuery("#inspection_grid").jqGrid({
        	   	url:'FrmGrid.inspection.do',	
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
        	        	   	'<s:text name="inspection.region.name"/>', 
        	        	   	'<s:text name="inspection.cadastralMunicipality.name"/>', 
        	        	   	'<s:text name="frm.inspection.inspectionNo"/>',
        	        	   	'<s:text name="inspection.date"/>',
        	        	   	'<s:text name="inspection.officeInCharge"/>',
        	        	   	'<s:text name="inspection.contactPerson"/>',
        	        	   	'<s:text name="inspection.inspActionType"/>',
        	        	   	'<s:text name="inspection.quantityConcerned"/>',
        	        	   	'<s:text name="inspection.unitsMetric"/>',
        	        	   	'<s:text name="inspection.narrativeReport"/>',
        	        	   	'<s:text name="hum.employee.label.comment"/>',
        	        	   	'<s:text name="inspection.created.by"/>',
        	        	   	'<s:text name="inspection.created.date"/>'
        	        	   	], 
        	   	colModel:[
					{name:'id',index:'id',hidden:true, width:'100%'},	   	
        	   		{name:'region_name',index:'region_name', width:'100%'},
        	   		{name:'inspection_no',index:'inspection_no', width:'100%'},
        	   		{name:'mun_name',index:'mun_name', width:'100%'},
        	   		{name:'inspection_date',index :'inspection_date', width:'100%' },
        	   		{name:'office_in_charge',index:'office_in_charge', width:'100%'},		
        	   		{name:'contact_person',index:'contact_person', width:'100%'},
        	   		{name:'type_action',index :'type_action', width:'100%'},
        	   		{name:'quantity_concerned',index:'quantity_concerned', width:'100%',align:"center"},		
        	   		{name:'unit_metric',index:'unit_metric', width:'100%'},
        	   		{name:'narrative_report',index:'narrative_report', width:'100%'},	
        	   		{name:'notes',index:'notes', width:'100%'},
        	   		{name:'created_by',index:'created_by', width:'100%'},
        	   		{name:'created_date',index:'created_date', width:'100%', align:"center"},	
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#inspection_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: true,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>', 
        		ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery(this).getRowData(iRow); 
    				var link = "Inspection.form.do?inspectionId=" + rowData.id;
    				loadURL(link, $("#inspection_form_content")); 				
   				} ,
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FrmGrid.inspectionDoc.do?inspection_id="+jQuery("#inspection_grid").getRowData(row_id).id,
    		          datatype: "json",
    		          colNames: ['Id',
    		    		          '<s:text name="doc.name"/>', 
    		    		          '<s:text name="planting.stand.plan.created.date"/>',
    		    		          '<s:text name="hrm.skill.label.attachment"/>',
    		    		        ],
    		          colModel: [
    		            {name:"id",index:"id",width:'100%',hidden:true},
    		            {name:"doc_name",index:"doc_name",width:'300%',align:"left"},
    		            {name:"created_date",index:"created_date",width:'100%',align:"center"},
    		            {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'}
    		          ],
    		       	  pager: '',
    		          height: 'auto',
    		          width: 'auto',
    		          rowNum:10,
    	        	  rowList:[10,20,30],
    		      	  viewrecords: true,
    		          sortname: 'id',
    		          sortorder: "asc",
 	   		       		gridComplete: function(){
	 	   		       		var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
	 		   				for(var i=0;i < ids.length;i++){
	 		   					var docId=jQuery("#"+subgrid_table_id).getRowData(ids[i]).id;
	 		   					var url="InspectionDoc.do?docId="+docId;
	 		   					be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
	 		   				}
 	   					}
    		       });
    		   } 

        	});
              	
        	$("#inspection_grid")
           	.navGrid('#inspection_grid_pager',{edit:false,add:false,del:false,search:false})
           	.navButtonAdd('#inspection_grid_pager',{
           	   caption:"", 
           	   title:"<s:text name="label.button.edit"/>", 
           	   buttonicon:"ui-icon-pencil", 
           	   onClickButton: function(){ 
           			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
           			if(iRow){
        				var rowData = jQuery(this).getRowData(iRow); 
        				var link = "Inspection.form.do?inspectionId=" + rowData.id;
        				loadURL(link, $("#inspection_form_content"));
           			}else{
           	   			alert("<s:text name="global.please.select.row"/>"); 
           	   		}   
           	   }, 
           	   position:"last"
           	})
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_insp_container').width();
            $('#inspection_grid').setGridWidth(width);
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
			<input type="hidden" id="location" value="inspection_grid">
			<div id="jqGrid_insp_container">
				<table id="inspection_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="inspection_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
