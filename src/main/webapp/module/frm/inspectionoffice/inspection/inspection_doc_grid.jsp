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
        $(document).ready(function () {
        	jQuery("#inspaction_doc_grid").jqGrid({
        	   	url:'FrmGrid.inspectionDoc.do?inspection_id='+$("#inspId").val(),	
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
        		shrinkToFit: true,
        		gridview: true,
                headertitles: true,
                viewrecords: true,
                rownumbers: true,
        	   colNames: ['Id',
        	        	   '<s:text name="doc.name"/>', 
        	        	   '<s:text name="bid.grid.created.date"/>', 
        	        	   '<s:text name="hrm.skill.label.attachment"/>' 
        	        	 ],
        	   colModel: [
      		            {name:"id",index:"id",width:'100%',hidden:true},
      		            {name:"doc_name",index:"doc_name",width:'300%',align:"left"},
      		            {name:"created_date",index:"created_date",width:'100%',align:"center"},
      		            {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'}
      		          ],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#inspaction_doc_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>' ,
// 		       		gridComplete: function(){
//  	   		       		var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
//  		   				for(var i=0;i < ids.length;i++){
//  		   					var docId=jQuery("#"+subgrid_table_id).getRowData(ids[i]).id;
//  		   					var url="InspectionDoc.do?docId="+docId;
//  		   					be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
//  		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
//  		   				}
// 	   				}
		       	gridComplete: function(){
 	   		       		var ids = jQuery("#inspaction_doc_grid").jqGrid('getDataIDs');
 		   				for(var i=0;i < ids.length;i++){
 		   					var docId=jQuery("#inspaction_doc_grid").getRowData(ids[i]).id;
 		   					var url="InspectionDoc.do?docId="+docId;
 		   					be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
 		   					jQuery("#inspaction_doc_grid").jqGrid('setRowData',ids[i],{generate:be});
 		   				}
	   			}	

        	});
              	
        	jQuery("#inspaction_doc_grid").jqGrid('navGrid','#inspaction_doc_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        });

        $(window).bind('resize', function() {
            var width = $('#jqGrid_financial_input_container').width();
            $('#inspaction_doc_grid').setGridWidth(width);
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
		<input id="inspId" name="inspId"  value="<s:property value='inspection.id'/>" type="hidden">
			<div id="jqGrid_financial_input_container">
				<table id="inspaction_doc_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="inspaction_doc_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
