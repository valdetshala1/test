<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.unchecked{ background-color:red !important; }
ui-grid{ width:100% !important; }
.checkbox-grid li {
    display: block;
    float: right;
    width: 20%;
}
</style>
        <script type="text/javascript">

        function editRequest(grid, rowId){
        	var rowData=jQuery("#request_grid").getRowData(rowId);
        	var link = "Request.form.do?requestId=" + rowData.id;
        	loadURL(link,$("#request_form_content"));
        	loadRequestFeature(rowData.id);
        }
        var count=5;
        $("#count").val(count);
        $("#disconectedStatus").val(true);
        $("#completedStatus").val(true);
        $("#rejectedStatus").val(true);
        $("#approvedStatus").val(true);
        $("#newStatus").val(true);
        var link ;
        $(document).ready(function () {
            link = 'FalGrid.requests.do?count='+$("#count").val()+"&disconected="+$("#disconectedStatus").val()
            +"&completed="+$("#completedStatus").val()+"&rejected="+$("#rejectedStatus").val()+"&approved="+$("#approvedStatus").val()+"&newStat="+$("#newStatus").val();
        	jQuery("#request_grid").jqGrid({
        	   	url:link,	
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
        	   	colNames:['ID', 
       	        	   	'',
       	        	   	'',
       	        	 	'<s:text name="official.travel.status"/>',
       	        	   	'<s:text name="fal.request.requester"/>',
       	        	   	'<s:text name="finance.payment.start.date"/>',
       	        	   	'<s:text name="hrm.skill.label.end.date"/>'
        	   		],       	   	
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        	   		{name:'act',index:'act', width:'75%',search:false},
        	   		{name:'status_icon',index:'status_icon', hidden:true,width:'30%',align:"right"},
        	   		{name:'status',index:'status', width:'100%',align:"center",search:false},
        	   		{name:'requester',index:'requester', width:'100%',align:"center",search:true},
        	   		{name:'start_lease',index:'start_lease', width:'100%',align:"right",search:false},
        	   		{name:'end_lease',index:'end_lease', width:'100%',align:"right",search:false}
        	   		],
        	   	rowNum: 10,
        	   	rowList:[10,20,30],
        	    sortname: 'id',
				gridComplete: function(){
        			var ids = jQuery("#request_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
							au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showAuditGeom('Request','#request_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					pa = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"editRequest('#request_grid', '"+cl+"');\"><i class='fa fa-pencil'></i></button>";
        					jQuery("#request_grid").jqGrid('setRowData',ids[i],{act:pa+au});
        			}	
        		},
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiboxonly:true,
        		loadComplete: function (){
        			var rowIDs = jQuery("#request_grid").getDataIDs(); 
        		      for (var i=0;i<rowIDs.length;i=i+1){ 
        		        rowData=jQuery("#request_grid").getRowData(rowIDs[i]);
        		        var trElement = jQuery("#"+ rowIDs[i],jQuery('#request_grid'));
        		        if (rowData.status == 'UCH') { 
        		            trElement.removeClass('ui-widget-content');
        		            trElement.addClass('unchecked');
        		        }
        		      }
        		},
        		caption: "",
        		loadtext:'<s:text name="grid.loading.text"/>',
        		subGrid: true,
        		pager: '#fal_request_grid_pager',
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
    		          url:"FalGrid.requestDoc.do?request_id="+jQuery("#request_grid").getRowData(row_id).id,
    		          datatype: "json",
    		          colNames: ['Id',
    		                      '',
    		       	        	  '<s:text name="official.travel.status"/>',
    		    		          '<s:text name="doc.name"/>', 
    		    		          '<s:text name="planting.stand.plan.created.date"/>',
    		    		          '<s:text name="planting.stand.plan.created.by"/>'
    		    		        ],
    		          colModel: [
    		            {name:"id",index:"id",width:'100%',hidden:true},
    		            {name:'status_icon',index:'status_icon', hidden:true,width:'30%',align:"right"},
            	   		{name:'status',index:'status', width:'100%',align:"center",search:false},
    		            {name:"doc_name",index:"doc_name",width:'100%'},
    		            {name:"created_date",index:"created_date",width:'100%',align:"center"},
    		            {name:"changed_by",index:"changed_by",width:'100%',align:"center"}
    		            
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
	 		   					var url="RequestDocGenerator.do?docId="+docId;
	 		   					be = "<button class='btn btn-xs btn-default' data-original-title='Attachment' onclick=\"generateAttachment('"+url+"');\"><i class='fa fa-paperclip'></i></button>";
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
	 		   				}
 	   					}
    		       });
    		   }         		

        	});
        	var grid=jQuery("#request_grid");
        	jQuery("#request_grid").jqGrid('navGrid','#fal_request_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:false,search:false});
        	grid.navButtonAdd('#fal_request_grid_pager',{
                	   caption:"",//"<s:text name="label.button.report"/>",
          		   	   ///title:"<s:text name="label.button.report.generator"/>", 
          		   	   buttonicon: "ui-icon-print",
    			   	   onClickButton: function(){ 
	    			   		var link="Request.statusReport.do";
	    		        	openDialogForm('request_report_content',link,"<s:text name='frm.managementunitperiod.name'/>",600,400);  
    			   	   }, 
    			   	   position:"last"
    			   	});
		   	
        jQuery("#request_grid").jqGrid('filterToolbar',{searchOperators : true});

        $(window).bind('resize', function() {
            var width = $('#jqgrid_request_container').width();
            $('#request_grid').setGridWidth(width);
        });
                
        /* Remove jquery-ui styles from jqgrid */
        function removeJqgridUiStyles(){
            $(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
            $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
            $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
            $(".ui-jqgrid-pager").removeClass("ui-state-default");
        }   
        
      
        });     
        
        function OnChangeCheckbox (checkbox) {
            if (checkbox.checked) {
                count++;
                $("#"+checkbox.id).val(true);
                $("#count").val(count);
                var link = 'FalGrid.requests.do?count='+$("#count").val()+"&disconected="+$("#disconectedStatus").val()
                +"&completed="+$("#completedStatus").val()+"&rejected="+$("#rejectedStatus").val()+"&approved="+$("#approvedStatus").val()+"&newStat="+$("#newStatus").val();
                jQuery("#request_grid").jqGrid('setGridParam',{url:link, datatype:"json"}).trigger('reloadGrid');
            }
            else {
            	count--;
            	$("#"+checkbox.id).val(false);
            	$("#count").val(count);
           	    var link = 'FalGrid.requests.do?count='+$("#count").val()+"&disconected="+$("#disconectedStatus").val()
                  +"&completed="+$("#completedStatus").val()+"&rejected="+$("#rejectedStatus").val()+"&approved="+$("#approvedStatus").val()+"&newStat="+$("#newStatus").val();
           	 	jQuery("#request_grid").jqGrid('setGridParam',{url:link, datatype:"json"}).trigger('reloadGrid');
            }
        }
    </script>
    
</head>
<body>
		<fieldset>
			<ul class="checkbox-grid">
			    <li><input type="checkbox" checked="checked" name="disconectedStatus" id="disconectedStatus"  onclick="OnChangeCheckbox (this)"/><label for="disconectedStatus"> <s:text name="fal.request.requeststatus.disconnected"/></label></li>
			    <li><input type="checkbox" checked="checked" name="completedStatus" id="completedStatus"  onclick="OnChangeCheckbox (this)"/><label for="completedStatus"> <s:text name="fal.request.requeststatus.completed"/></label></li>
			    <li><input type="checkbox" checked="checked" name="rejectedStatus" id="rejectedStatus" onclick="OnChangeCheckbox (this)"/><label for="rejectedStatus"> <s:text name="fal.request.requeststatus.rejected"/></label></li>
			    <li><input type="checkbox" checked="checked" name="approvedStatus" id="approvedStatus"  onclick="OnChangeCheckbox (this)"/><label for="approvedStatus"> <s:text name="fal.request.requeststatus.approved"/></label></li>
			    <li><input type="checkbox" checked="checked" name="newStatus" id="newStatus" onclick="OnChangeCheckbox (this)"/> <label for="newStatus"> <s:text name="fal.request.requeststatus.new"/> </label></li>
			</ul>
			<input id="count" name="count" type="hidden" value='<s:property value="count"/>'>
		</fieldset>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqgrid_request_container">
				<table id="request_grid" class="scroll"></table> 
				<div id="fal_request_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
		</div>
		<!-- end widget div -->
		
 </body>  
</html>	
