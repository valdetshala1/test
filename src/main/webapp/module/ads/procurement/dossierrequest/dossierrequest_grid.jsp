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
            
        	jQuery("#dossierrequest_grid").jqGrid({
        	   	url:'ProGrid.dossierRequests.do?tenderId='+$("#tenderRequestId").val(),	
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
                //picture, name, title, Hier date, work email, work phone, contract type / Employment status
        	   	colNames:['Id', 
        	        	   	'',
        	        	   	'<s:text name='bid.grid.tender'/>', 
        	        	   	'<s:text name='tender.bidder'/>', 
        	        	   	'<s:text name='ads.procurement.dossierrequest.sent'/>',
        	        	   	'<s:text name='ads.procurement.dossierrequest.sent.date'/>', 
        	        	   	'<s:text name='tender.request.analyse.comment'/>',
        	        	   	'<s:text name='employee.label'/>',
        	        	   	'<s:text name='bid.grid.created.date'/>' 
        	        	  ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'act',index:'act', width:'20%',search:false},
        	   		{name:'proTenderRequest',index:'proTenderRequest', width:'100%'},
        	   		{name:'proTenderBidder',index:'proTenderBidder', width:'100%'},
        	   		{name:'sent',index:'sent', width:'100%',align:"center",formatter:"checkbox"},
        	   		{name:'sent_date',index:'sent_date', width:'100%',align:"center"},
        	   		{name:'note',index:'note', width:'100%',align:"left"},
        	   		{name:'createdBy',index:'party', width:'100%', align:"center"},
        	   		{name:'createdDate',index:'createdDate', width:'100%',align:"center"}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#dossierrequest_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#dossierrequest_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('PrcmtDossierRequest','#dossierrequest_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#dossierrequest_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	    sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
 					var iRow = jQuery(this).jqGrid('getGridParam','selrow');
        			if(iRow){
        				var rowData = jQuery(this).getRowData(iRow); 
        				var link = "DossierRequest.form.do?dossierRequestId=" + rowData.id;
     					loadURL(link, $("#dossierrequest_form_content"));
        			}
   				},
      			 subGrid: true,
        		    subGridRowExpanded: function(subgrid_id, row_id) {
        		       var subgrid_table_id,pager_id;
        		       subgrid_table_id = subgrid_id+"_t";
//         		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
					   pager_id = 'p_'+ subgrid_table_id;
        		       jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><br>');
        		       jQuery("#"+subgrid_table_id).jqGrid({
        		          url:"ProGrid.dossierQuestions.do?dossierId="+jQuery("#dossierrequest_grid").getRowData(row_id).id,
        		          datatype: "json",
        		          colNames: ['Id','DossierId','Question','Employee','Created Date'],
        		   		          		
        		          colModel: [
        		            {name:"idQuestion",index:"idQuestion",width:'100%',hidden:true},
        		            {name:"prcmtDossierRequest",index:"prcmtDossierRequest",width:'100%',hidden:true},
        		            {name:"question",index:"question",width:'500%',align:"left"},
        		            {name:"createdBy",index:"createdBy",width:'100%',align:"center"},           
        		            {name:"createdDate",index:"createdDate",width:'100%',align:"center"}
        		          ],
        		       	  pager: pager_id,
        		          height: 'auto',
        		          width: 'auto',
        		          rowNum:10,
        	        	   	rowList:[10,20,30],
        		      	  viewrecords: true,
        		          sortname: 'idQuestion',
        		          sortorder: "asc",
     	   		       		gridComplete: function(){
     	   					},
     	   					onSelectRow: function(){
     	   					jQuery("#dossierrequest_grid").resetSelection();
         	   				}
        		       });
        		   }        		

        	});
            	
        	jQuery("#dossierrequest_grid").jqGrid('navGrid','#dossierrequest_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#dossierrequest_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#dossierrequest_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name='label.button.edit'/>", 
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "DossierRequest.form.do?dossierRequestId=" + rowData.id;
             					loadURL(link, $("#dossierrequest_form_content"));
             	   			}else{
             	   	   			alert("<s:text name='global.please.select.row'/>"); 
             	   	   		}   
             	   	   }, 
             	   	   position:"last"
             	   	})
             	   	.navButtonAdd('#dossierrequest_grid_pager',{
             	   	   caption:"",
             	   	   title:"<s:text name='ads.procurement.dossierquestion'/>",  
             	   	   buttonicon:"ui-icon-comment", 
             	   	   onClickButton: function(){ 
             	   		var iRow = jQuery(this).jqGrid('getGridParam','selrow');
         	   			if(iRow){
         					var rowData = jQuery(this).getRowData(iRow); 
         					$("#dossierId").val(rowData.id);
         					var link = "DossierQuestion.form.do?";
         					openDialogForm('dossierquestion_form_content',link,"Dossier Question",600,350);
//          					loadURL(link, $("#questionDialog"));
//          					questionDialog.dialog('open');
         	   			}else{
         	   	   			alert("<s:text name='global.please.select.row'/>"); 
         	   	   		}
             	   	   }, 
             	   	   position:"last"
             	   	});
        });

        
        $(window).bind('resize', function() {
            var width = $('#jqGrid_dossierrequest_container').width();
            $('#dossierrequest_grid').setGridWidth(width);
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
			<div id="jqGrid_dossierrequest_container">
				<table id="dossierrequest_grid" class="scroll"></table> 
				<div id="dossierrequest_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
			<input id="dossierId" type="hidden">
<!-- 			<div id="questionDialog" title="Tender Dossier Question"> -->
<%-- 				<jsp:include page="../dossierquestion/dossierquestion_form.jsp"></jsp:include> --%>
<!-- 			</div> -->
		</div>
		<!-- end widget div -->

</body>   
			
</html>	
