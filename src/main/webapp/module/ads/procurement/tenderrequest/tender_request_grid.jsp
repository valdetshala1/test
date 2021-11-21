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
        function getTenderRequestByStatus(status) {
        	$("#status").val(status);
			jQuery("#tender_request_grid").trigger("reloadGrid");

       }

        $(document).ready(function () {
        	jQuery("#tender_request_grid").jqGrid({
        	   	url:'ProGrid.tenderRequest.do?',	
        	   	mtype: 'GET',
        		datatype: "json",
        		postData: {
        			status: function() {
        	            // the code can by dynamic, read contain of some elements 
        	            // on the page use "if"s and so on and return the value which 
        	            // should be posted to the server
        	            return $("#status").val();
        	        }
        	    },
        		jsonReader : {
   			      root:"rows",
   			      page: "page",
   			      total: "total",
   			      records: "records",
   			      repeatitems: false,
   			   	  status:$("#status").val(),
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
        	        	    '<s:text name="tender.request.designation"/>', 
        	        	   	'<s:text name="tender.request.needs"/>',
        	        	   	'<s:text name="fin.input.financial.organisation"/>', 
        	        	   	'<s:text name="adm.organisation.legend.organisation.id"/>', 
        	        	   	'<s:text name="tender.request.annual.plan"/>', 
        	        	   	'<s:text name="tender.request.pprc.notification"/>'],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'100%'},
        	   		{name:'designation_of_request',index:'designation_of_request', width:'100%'},
        	   		{name:'declare_of_needs',index:'declare_of_needs', width:'100%'},
        	   		{name:'organisation',index:'organisation', width:'100%'},
        	   		{name:'organisation_id',index:'organisation_id', width:'100%',hidden:true},
        	   		{name:'annual_plan',index:'annual_plan', width:'100%', align:"center",formatter:'checkbox'},
        	   		{name:'pprc_notification',index:'pprc_notification', width:'100%', align:"center",formatter:'checkbox'}
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#tender_request_grid_pager',
        	   	sortname: 'r.id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "",
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var selectedRow = jQuery(this).jqGrid('getGridParam','selrow');
    				if(selectedRow){
	    				var rowData = jQuery(this).getRowData(selectedRow); 
	    				var link = "TenderRequest.tab.do?tenderRequestId=" + rowData.id;
	 					loadURL(link, $("#tender_request_tab_content"));
    				}else{alert('<s:text name="tender.request.alarm"/>');
    				}
   				},
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
        		    
    		       var subgrid_table_id,pager_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       pager_id = 'p_'+ subgrid_table_id;
    		       jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><br>');
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"ProGrid.tenderAttachments.do?tenderId="+jQuery("#tender_request_grid").getRowData(row_id).id,
    		          datatype: "json",
    		          colNames: ['Id','<s:text name="annual.plan.status"/>','<text value="doc.name"/>','<s:text name="hum.employee.label.comment"/>','<s:text name="employee.label"/>','<s:text name="bid.grid.created.date"/>','<s:text name="tender.request.attachment"/>'],
    		          colModel: [
    		            {name:"idattach",index:"idattach",width:'100%',hidden:true},
    		            {name:"prcmtTenderStatus",index:"prcmtTenderStatus",width:'100%'},
    		       		{name:"doc_name", index:"doc_name",width:'100%'},
    		            {name:"comment",index:"comment",width:'200%',align:"left"},
    		            {name:"createdBy",index:"createdBy",width:'100%',align:"center"},           
    		            {name:"createdDate",index:"createdDate",width:'100%',align:"center"},
    		            {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'}
    		          ],
    		       	  pager:  pager_id,
    		          height: 'auto',
    		          width: 'auto',
    		          rowNum:10,
    	        	  rowList:[10,20,30],
    		      	  viewrecords: true,
    		          sortname: 'idattach',
    		          sortorder: "asc",
 	   		       		gridComplete: function(){
	 	   		       		var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
	 		   				for(var i=0;i < ids.length;i++){
	 		   					var url="ProcDocument.do?tenderAttachmentId="+jQuery("#"+subgrid_table_id).jqGrid().getRowData(ids[i]).idattach;
	 		   					be = "<button class='btn btn-xs btn-default' data-original-title='Status' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
	 		   				}
 	   					}
    		       });
    		   }       		
        	});
        	jQuery("#tender_request_grid").jqGrid('navGrid','#tender_request_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false},
        			{}, {},{},{multipleSearch:true,recreateFilter:true});
        	jQuery("#tender_request_grid").jqGrid ('navButtonAdd', '#pager', 
                	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns",
                	onClickButton: function() {
                    	grid.jqGrid('columnChooser');
                	}})
                	.navButtonAdd('#tender_request_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="label.button.edit"/>", 
             	   	   buttonicon:"ui-icon-pencil", 
             	   	   onClickButton: function(){ 
             	   			var iRow = jQuery(this).jqGrid('getGridParam','selrow');
             	   			if(iRow){
             					var rowData = jQuery(this).getRowData(iRow); 
             					var link = "TenderRequest.tab.do?tenderRequestId=" + rowData.id;
             					loadURL(link, $("#tender_request_tab_content"));
             	   			}else{
             	   	   			alert('<s:text name="tender.request.alarm"/>');
             	   	   		}
             	   	   }, 
             	   	   position:"last"
             	   	})
             	   	.navButtonAdd('#tender_request_grid_pager',{
             	   	   caption:"", 
             	   	   title:"<s:text name="rbac.permission.grid.print"/>", 
             	   	   id:"tr_print",
             	   	   buttonicon:"ui-icon-print", 
             	   	   onClickButton: function(){
           					var link = "TenderRequest.reportGenerator.do?";
           					openDialogForm('tender_report_generator',link,'',600,400);
           					$("#tr_print").addClass("ui-state-disabled");
           					
             	   	   },
             	   	   position:"last"
             	   	});
        });

        
        $("#rb_all").prop('checked','true');
        if(!$("#status").val()){
        	getTenderRequestByStatus('');
            }
        
        $("#rb_all").on('click', function(){
        	getTenderRequestByStatus('');
			});
		
        $("#rb_new").on('click', function(){
        	getTenderRequestByStatus("NEW");
			});
        $("#rb_apr").on('click', function(){
        	getTenderRequestByStatus("APR");
            });
        $("#rb_rej").on('click', function(){
        	getTenderRequestByStatus("REJ");
            });
        $("#rb_tdo").on('click', function(){
        	getTenderRequestByStatus("TDO");
            });
        $("#rb_pub").on('click', function(){
        	getTenderRequestByStatus("PUB");
            });
        $("#rb_sel").on('click', function(){
        	getTenderRequestByStatus("SEL");
            });
        $("#rb_pen").on('click', function(){
        	getTenderRequestByStatus("PEN");
            });
        $("#rb_can").on('click', function(){
        	getTenderRequestByStatus("CAN");
            });
        $("#rb_rep").on('click', function(){
        	getTenderRequestByStatus("REP");
            });
        $("#rb_con").on('click', function(){
        	getTenderRequestByStatus("CON");
            });
        
        $(window).bind('resize', function() {
            var width = $('#jqGrid_tender_request_container').width();
            $('#tender_request_grid').setGridWidth(width);
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
		<fieldset>
		<input id="status" value="<s:property value="status"/>" type="hidden">
				<div class="form-group">
						<label class="radio radio-inline" style="display: none;"></label>
						<label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_new" />
							<span><s:text name="tender.request.button.new"/></span>
						</label>	
							
						<label class="radio radio-inline" id="reqButton">
							<input type="radio" class="radiobox" name="reqButton" id="rb_apr" />
							 <span><s:text name="tender.request.button.approved"/></span>
						</label>
					
						 <label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_rej" />
							<span><s:text name="tender.request.button.rejected"/></span>
						</label>
						
						<label class="radio radio-inline" id="reqButton">
							<input type="radio" class="radiobox" name="reqButton" id="rb_tdo" />
							 <span><s:text name="tender.request.button.tender.done"/></span>
						</label>
					
						<label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_pub" />
							<span><s:text name="tender.request.button.publish"/></span>
						</label>
						<label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_rep" />
							<span><s:text name="tender.request.button.grid.republish"/></span>
						</label>
						<label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_sel" />
							<span><s:text name="tender.request.button.selected"/></span>
						</label>
						<label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_pen" />
							<span><s:text name="tender.request.button.pending"/></span>
						</label>
						<label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_can" />
							<span><s:text name="tender.request.button.canceled"/></span>
						</label>
						<label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_con" />
							<span><s:text name="tender.request.button.contracted"/></span>
						</label>
						<label class="radio radio-inline" id="reqButton">
						 	<input type="radio" class="radiobox" name="reqButton" id="rb_all" />
							<span><s:text name="tender.request.button.all"/></span>
						</label>
			     </div>
		</fieldset>
			<div id="jqGrid_tender_request_container">
				<table id="tender_request_grid" class="scroll"></table> 
				<div id="tender_request_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
