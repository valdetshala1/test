<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">

ui-grid{ width:100% !important; }
.ui-th-column-header{text-align: center;}

</style>
<script type="text/javascript">
        function reqImp(grid, rowId){
        	var rowData=jQuery("#private_request_grid").getRowData(rowId);
	   				$("#markingDiv").show();
//   	   	   			jQuery("#private_request_impl_grid").jqGrid('setGridParam',{url:"FrmGrid.privateRequestImpl.do?pvtReq_id="+rowData.id, datatype:"json"}).trigger('reloadGrid'); 
  	   	   			
  	   	   			var link = "PrivateRequestImpl.grid.do?privateRequestId=" +rowData.id;
					loadURL(link, $("#private_request_impl_grid_content"));
					
    				var urlImpl = "PrivateRequestImpl.marking.do?privateRequestId=" + rowData.id;
        				$.ajax({
    					type : "GET",
    					url : urlImpl,
    					async : false,
    					beforeSend : function(jqXHR, settings) {
    					},
    					error : function(errorThrown, status, jqXHR) { // on error..
    						alert("error:" + errorThrown + ", status:" + status);
    					},
    					success : function(data, status, jqXHR) { // on success..
    						$("#private_request_impl_form_content").html(jqXHR.responseText);
    						$("#saveMark").show();
    	                    $("#saveMark").prop('disabled',false);
    					},
    					complete : function(jqXHR, textStatus) {
    					}
    				});
					$("#hideReqForm").val(true);
        				
  	    			var url = "PrivateRequest.form.do?privateRequestId=" + rowData.id + "&annualplanId=" + $("#apId").val();
    				$.ajax({
    					type : "GET",
    					url : url,
    					async : false,
    					beforeSend : function(jqXHR, settings) {
    					},
    					error : function(errorThrown, status, jqXHR) { // on error..
    						alert("error:" + errorThrown + ", status:" + status);
    					},
    					success : function(data, status, jqXHR) { // on success..
    						$("#private_request_form_content").html(jqXHR.responseText);
    					},
    					complete : function(jqXHR, textStatus) {
    					}
    				});
        	
        }
        
        function reqPay(grid, rowId){
        	var rowData=jQuery("#private_request_grid").getRowData(rowId);
    		openDialogForm('private_request_payment_form_content',"PrivateRequest.paymentPopup.do?privateRequestId="+rowData.id,"<s:text name="privateRequest.pay"/>",600,400);
        }
        
        function reqTrans(grid, rowId){
        	var rowData=jQuery("#private_request_grid").getRowData(rowId);
    		openDialogForm('private_request_transport_form_content',"PrivateRequest.transportPopup.do?privateRequestId="+rowData.id,"<s:text name="privateRequest.trans"/>",600,400);
        }
        function generatePrivateRequestDoc(id,subgrid_name){
            var gridName='#'+subgrid_name+'';
        	var rowData = jQuery(gridName).jqGrid().getRowData(id);
        	
    		$.ajax({
    			type : "GET", 
    			url : "PrivateReqDoc.do?attachmentId="+rowData.id, 
    			contentType: "text/html;charset=utf8",
    			async : false,
    			beforeSend:function(jqXHR, settings) {
    			},
    			error : function(errorThrown, status, jqXHR) {
    				alert("error:" + errorThrown + ", status:" + status);
    			},
    			success : function(data, status, jqXHR) { 
    				var errors_exist = jqXHR.getResponseHeader("errors_exist");
					if (errors_exist == "true") {
						$.smallBox({
							title : '<s:text name="tender.request.document.failed"/>',
							content :'<s:text name="tender.request.no.document.exists"/>' ,
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					} else {
						$.smallBox({
							title : '<s:text name="tender.request.document.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}	    	
    			},
    			complete:function(jqXHR, textStatus){
    			}
    		}); 
    	};
    	
        $(document).ready(function () {
        	$("#saveMark").hide();
            $("#saveMark").prop('disabled','disabled');
            var actualUser='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
            setHeaderWidth = function () {
                var $self = $(this),
                    colModel = $self.jqGrid("getGridParam", "colModel"),
                    cmByName = {},
                    ths = this.grid.headers,
                    cm,
                    i,
                    l = colModel.length;

                for(i = 0; i < l; i++) {
                    cm = colModel[i];
                    cmByName[cm.name] = $(ths[i].el).outerWidth();
                }
                $("#h1").width(cmByName.amount + cmByName.tax + cmByName.total - 1);
                $("#h2").width(cmByName.closed + cmByName.ship_via - 1);
                //$("#h2").width($("#h0").width() - $("#h1").outerWidth());
            };

//             $.jgrid.formatter.integer.thousandsSeparator = ',';
//             $.jgrid.formatter.number.thousandsSeparator = ',';
//             $.jgrid.formatter.currency.thousandsSeparator = ',';

         
        	grid = jQuery("#private_request_grid").jqGrid({
        	   	url:'FrmGrid.privateRequest.do',
        	   	postData:{annualplanId:$("#apId").val(),isRequester:$("#userIsForestOwner").val()
            	   	},	
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
        	   	colNames:[ 'Id',
        	        	   	'<s:text name="planting.stand.legend.implementation"/>',
        	        	   	'<s:text name="frm.protection.planning.status"/>', 
        	        	   	'<s:text name="frm.private.request.activity"/>',
        	        	   	'activity_id',
        	        	   	'<s:text name="frm.private.request.request.no"/>',
        	        	   	'<s:text name="annual.plan.status.id"/>',
        	        	   	'<s:text name="annual.plan.status"/>', 
        	        	   	'<s:text name="annu.seedling.label.work.stage"/>',
        	        	   	'<s:text name="frm.private.request.date"/>',
        	        	   	'<s:text name="frm.private.request.person"/>',
        	        	   	'<s:text name="ann.plan.person.country"/>', 
        	        	   	'<s:text name="ann.plan.person.street"/>', 
        	        	   	'<s:text name="ann.plan.person.home.nr"/>', 
        	        	   	'<s:text name="frm.private.request.cadastral.zone"/>',
        	        	   	'<s:text name="frm.private.request.parcel.no"/>',
        	        	   	'<s:text name="frm.private.request.parcel.area"/>',
        	        	   	'<s:text name="frm.private.request.place.name"/>',
        	        	   	'<s:text name="frm.private.request.cad.cert.no"/>',
        	        	   	
        	        	   	'<s:text name="frm.private.request.pl.tech.volume"/>',
        	        	   	'<s:text name="frm.private.request.pl.fire.volume"/>',
        	        	   	'<s:text name="planting.stand.plan.created.date"/>',
        	        	   	'<s:text name="planting.stand.plan.created.by"/>',
        	        	   	
        	        	   	'<s:text name="privateRequest.alwTechVolume.label"/>',
        	        	   	'<s:text name="privateRequest.alwFireVolume.label"/>',
        	        	   	
        	        	   '<s:text name="frm.private.request.marking.tool"/>',
        	        	   '<s:text name="frm.private.request.receiver.person"/>',
        	        	   '<s:text name="frm.private.request.marking.data"/>',
        	        	   '<s:text name="frm.private.request.authorize.person"/>',
        	        	   
        	        	   '<s:text name="frm.private.request.app.tech.volume"/>',
        	        	   '<s:text name="frm.private.request.app.fire.volume"/>',
        	        	   '<s:text name="planting.stand.plan.created.date"/>',
        	        	   '<s:text name="planting.stand.plan.created.by"/>',
        	        	   
        	        	   '<s:text name="frm.private.request.payment"/>',
        	        	   '<s:text name="ann.plan.person.street.payment.value"/>',
        	        	   '<s:text name="privateRequest.transport"/>' 
        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id',hidden:true, width:'50%'},
        			{name : 'act', index:'act', sortable:false, search:false,width:'90%' },
        	   		{name:'status_icon',index:'status_icon', width:'100%', sortable:true, align:"left", editable:false, search:true, stype:'select', 
    					searchoptions:{sopt:['eq','ne'], value: ':;NEW:New;COMPLETED:Completed;SELECTED:Selected;TERRAIN:Terrain;APPROVED:Approved;PAYMENT_REQUEST:Payment Request;PAYMENBT:Payment;REJECTED_INCOMPLETE:Rejected for Incomplete;REJECTED_NOT_APPROVED:Rejected for not approval;REJECTED_PAYMENT_REQUEST:Rejected for Payment Request'}, frozen:true},
        	   		{name:'activity',index:'activity', width:'100%', sorttype:'string', searchoptions:{sopt:['eq','bw','bn','cn','nc','ew','en']}},
        	   		{name:'activity_id',index:'activity_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'request_no',index:'request_no',  width:'100%',align:"center"},
        	   		{name:'status_id',index:'status_id', hidden:true, width:'100%',align:"right"},
        	   		{name:'status',index:'status', hidden:true, width:'100%',align:"right"},
        	   		{name:'work_stage',index:'work_stage', width:'50%',align:"center", search:false},
        	   		{name:'request_date',index:'request_date', width:'50%',align:"center", search:false},
        	   		{name:'person',index:'person', width:'50%', search:false},
        	   		{name:'person_country',index:'person_country', width:'50%', search:false},
        	   		{name:'person_street',index:'person_street', width:'50%', search:false},
        	   		{name:'person_home_nr',index:'person_home_nr', width:'50%',align:"center", search:false},
        	   		{name:'cad_zone_id',index:'cad_zone_id', width:'50%', search:false},
        	   		{name:'parcel_no',index:'parcel_no', width:'50%',align:"center", search:false},
        	   		{name:'parcel_area',index:'parcel_area', width:'50%',align:"center", search:false},
        	   		{name:'place_name',index:'place_name', width:'50%', search:false},
        	   		{name:'cad_cert_no',index:'cad_cert_no', width:'50%', search:false},

        	   		{name:'pl_tech_volume',index:'pl_tech_volume', width:'50%',align:"center", search:false},
        	   		{name:'pl_fire_volume',index:'pl_fire_volume', width:'50%',align:"center", search:false},
        	   		{name:'pl_created_date',index:'pl_created_date', width:'50%',align:"center", search:false},
        	   		{name:'pl_created_by',index:'pl_created_by', width:'50%', search:false},

        	   		{name:'alw_tech_volume',index:'alw_tech_volume', width:'50%',align:"center", search:false},
        	   		{name:'alw_fire_volume',index:'alw_fire_volume', width:'50%',align:"center", search:false},

        	   		{name:'marking_tool',index:'marking_tool', width:'50%', search:false},
        	   		{name:'receiver_person',index:'receiver_person', width:'50%', search:false},
        	   		{name:'marking_date',index:'marking_date', width:'50%',align:"center", search:false},
        	   		{name:'auth_person_id',index:'auth_person_id', width:'50%', search:false},
        	   		
        	   		{name:'ap_tech_volume',index:'ap_tech_volume', width:'50%',align:"center", search:false},
        	   		{name:'ap_fire_volume',index:'ap_fire_volume', width:'50%',align:"center", search:false},
        	   		{name:'ap_created_date',index:'ap_created_date', width:'50%',align:"center", search:false},
        	   		{name:'ap_created_by',index:'ap_created_by', width:'50%', search:false},
        	   		
        	   		{name:'payment',index:'payment', width:'50%',align:"center", formatter:"checkbox", search:false},
        	   		{name:'payment_value',index:'payment_value', width:'50%',align:"center", search:false},

        	   		{name:'transport_doc',index:'transport_doc', width:'50%',align:"center",formatter:"checkbox", search:false}
        	   		
        	   		
        	   		],
        	   	rowNum:10,	
        	   	rowList:[10,20,30],
        	   	pager: '#private_request_grid_pager',
        	   	sortname: 'id',
        	    viewrecords: true,
        	    sortorder: "desc",
        		multiselect: false,
        		caption: "<s:text name="frm.private.request.request"/>", 
        		loadtext:'<s:text name="grid.loading.text"/>', 
        		gridComplete: function(){
        			var ids = jQuery("#private_request_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        				var rowData = jQuery("#private_request_grid").getRowData(cl); 
        				de = "<button class='btn btn-xs btn-default' data-original-title='Request Impl' onclick=\"reqImp('#private_request_grid', '"+cl+"');\"><i class='fa  fa-tree'></i></button>";
        				rp = "<button class='btn btn-xs btn-default' data-original-title='Payment' onclick=\"reqPay('#private_request_grid', '"+cl+"');\"><i class='fa  fa-dollar'></i></button>";
        				tr = "<button class='btn btn-xs btn-default' data-original-title='Transport' onclick=\"reqTrans('#private_request_grid', '"+cl+"');\"><i class='fa  fa-truck'></i></button>";
						aud_data = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('PrivateRequest','#private_request_grid', '"+ids[i]+"');\"><i class='fa fa-history'></i></button>";
        				var pvtStatusNew=$("#pvtStatusNew").val();
							var approvedStatus=$("#approvedStatus").val();
							var transportStatus=$("#transportStatus").val();
							var acUser='<s:property value="user.getOrganisation().getOperLevelVal()"/>';
							if(rowData.status!=pvtStatusNew){
								 if((rowData.status==approvedStatus || rowData.status==transportStatus) && acUser=='M'){
									 		jQuery("#private_request_grid").jqGrid('setRowData',ids[i],{act:aud_data+de+rp+tr});
										}else{
											jQuery("#private_request_grid").jqGrid('setRowData',ids[i],{act:aud_data+de});
											}
								}else{
									jQuery("#private_request_grid").jqGrid('setRowData',ids[i],{act:aud_data});
								}
							
        			}	
        			$("#permission").hide();
               	 	$("#request").hide();
           			$("#marking").hide();
           			$("#markingDiv").hide();

           			if(acUser=='R'){
           				$("#markingDiv").show();

               			}else{
               				$("#markingDiv").hide();

                   			}
                    

                    $("#rejectDecision1").hide();
                    $("#rejRequest").hide();
        		},
    			ondblClickRow: function(id, iRow, iCol, e) {
    				var rowData = jQuery("#private_request_grid").getRowData(iRow); 
    				$("#hideReqForm").val("");
    				var url = "PrivateRequest.form.do?privateRequestId=" + rowData.id + "&annualplanId=" + $("#apId").val();
    				$("#markingDiv").hide();
    				$.ajax({
    					type : "GET",
    					url : url,
    					async : false,
    					beforeSend : function(jqXHR, settings) {
    					},
    					error : function(errorThrown, status, jqXHR) { // on error..
    						alert("error:" + errorThrown + ", status:" + status);
    					},
    					success : function(data, status, jqXHR) { // on success..
    						$("#private_request_form_content").html(jqXHR.responseText);
    					},
    					complete : function(jqXHR, textStatus) {
    					}
    				});
					
   				},
   				onSelectRow: function(ids) { 
   				    var rowData = jQuery("#private_request_grid").getRowData(ids);
     	          		 if(rowData.status==$("#pvtStatusNew").val()&& actualUser=='M') { 
     	          			    $("#request").show();
	     	          			$("#marking").hide();
	     	          			$("#permission").hide();
	     	          			$("#rejectDecision1").hide();
	     	          			$("#rejRequest").show();
	     	          			
         	          		 } else if(rowData.status==$("#submittedStatus").val() && actualUser=='M' ){
      	          			    $("#request").show();
	     	          			$("#marking").hide();
	     	          			$("#permission").hide();
	     	          			$("#rejectDecision1").hide();
	     	          			  $("#rejRequest").hide();
             	          		 }
     	          		 else if(rowData.status==$("#submittedStatus").val() && actualUser=='R' ) { 
         	          			$("#marking").show();
         	          			$("#permission").hide();
             	          	 	$("#request").hide();
             	          	 	$("#rejectDecision1").hide();
             	          	  	$("#rejRequest").hide();
             	          		 }else if(rowData.status==$("#approvedStatus").val() && actualUser=='M') {
             	          		$("#permission").show();
             	          	 	$("#request").hide();
	     	          			$("#marking").hide();
	     	          			$("#rejectDecision1").hide();
	     	          		 	 $("#rejRequest").hide();
             	          		 }else if(rowData.status==$("#rejectedStatus").val() && actualUser=='M') {
             	          			$("#permission").hide();
                 	          	 	$("#request").hide();
    	     	          			$("#marking").hide();
    	     	          			$("#rejectDecision1").show();
    	     	          		  	$("#rejRequest").hide();	
                 	          		 }else{
             	          			$("#permission").hide();
                 	          	 	$("#request").hide();
    	     	          			$("#marking").hide();
    	     	          			$("#rejectDecision1").hide();
    	     	          		  $("#rejRequest").hide();
                 	          		 }

   	   				},
   	   		    beforeSelectRow: function (rowid) {
   	   		     
   	   	        if ($(this).jqGrid("getGridParam", "selrow") === rowid) {
		   	   	      $("#permission").hide();
		         	 	$("#request").hide();
		     			$("#marking").hide();
		     			$("#rejectDecision1").hide();
   	   	            $(this).jqGrid("resetSelection");
   	   	        } else {
   	   	            return true;
   	   	        }
   	   	    },		     		
   				subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		       var subgrid_table_id;
    		       subgrid_table_id = subgrid_id+"_t";
    		       jQuery("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table>");
    		       jQuery("#"+subgrid_table_id).jqGrid({
     		          url:"FrmGrid.activityStatus.do?activity_id="+jQuery("#private_request_grid").getRowData(row_id).activity_id,
    		          datatype: "json",
    		          colNames: ['Id',
	    		          '<s:text name="law.suit.label.status"/>',
	    		          '<s:text name="bid.grid.created.by"/>',
	    		          '<s:text name="bid.grid.created.date"/>',
	    		          '<s:text name="annual.plan.status.remarks"/>',
	    		          '<s:text name="hrm.skill.label.attachment"/>',
	    		          'encryptedText'
	    		          ],
			          colModel: [
			            {name:"id",index:"id",width:'100%',hidden:true},
			            {name:"status",index:"status",width:'300%',align:"left"},
			            {name:"created_by",index:"created_by",width:'100%',align:"center"},
			            {name:"created_date",index:"created_date",width:'100%',align:"center"},
			            {name:"remarks",index:"remarks",width:'100%',align:"center"},
			            {name: "generate", index: "generate",sortable:false, align:"center",search:false, width:'100%'},
				  		{name:"encryptedText",index:"encryptedText",width:'200%',hidden:true}
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
	 		        			var rowData = jQuery("#"+subgrid_table_id).getRowData(ids[i]); //rowData.encryptedText
	 							be = "<button class='btn btn-xs btn-default' data-original-title='Documents' title='<s:text name="audit.title"/>' onclick=\"docsList('"+rowData.encryptedText+"','#decision_grid', '"+rowData.id+"');\"><i class='fa fa-folder'></i></button>";	
	 		   					jQuery("#"+subgrid_table_id).jqGrid('setRowData',ids[i],{generate:be});
	 		   				}
	   					},
    		       });
    		   } 
        	});
        	
            grid.jqGrid('setGroupHeaders', {
                useColSpanStyle: true,
                groupHeaders: [
                    {startColumnName: 'activity', numberOfColumns: 13, titleText: '<em><s:text name="frm.private.request.activity"/></em>'},
                    {startColumnName: 'pl_tech_volume', numberOfColumns: 4, titleText: '<em><s:text name="frm.private.request.planning"/></em>'},
                    {startColumnName: 'alw_tech_volume', numberOfColumns: 2, titleText: '<em><s:text name="privateRequest.alw.value"/></em>'},
                    {startColumnName: 'marking_tool', numberOfColumns: 4, titleText: '<em><s:text name="frm.private.request.marking"/></em>'},
                    {startColumnName: 'ap_tech_volume', numberOfColumns: 4, titleText: '<em><s:text name="frm.private.request.approved"/></em>'},
                    {startColumnName: 'payment', numberOfColumns: 2, titleText: '<em><s:text name="frm.private.request.payment"/></em>'},
                    {startColumnName: 'transport_doc', numberOfColumns: 1, titleText: '<em>Transport</em>'}
                    
                ]});  
                 	 
            grid.jqGrid('filterToolbar',{searchOperators : true});
            	
            grid.jqGrid('navGrid','#private_request_grid_pager',
                	{edit: false, add:false, del:false, refresh:true, view:true},
        			{}, {},{},{multipleSearch:true,recreateFilter:true})
        			.navButtonAdd('#private_request_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="label.button.edit"/>", 
		   	   buttonicon:"ui-icon-pencil", 
		   	   onClickButton: function(){ 
		   		$("#markingDiv").hide();
		   		$("#hideReqForm").val("");
		   		var iRow = grid.jqGrid('getGridParam','selrow');
	   			if(iRow){
	   				var rowData = jQuery("#private_request_grid").getRowData(iRow); 
	   				var url = "PrivateRequest.form.do?privateRequestId=" + rowData.id + "&annualplanId=" + $("#apId").val();
    				$.ajax({
    					type : "GET",
    					url : url,
    					async : false,
    					beforeSend : function(jqXHR, settings) {
    					},
    					error : function(errorThrown, status, jqXHR) { // on error..
    						alert("error:" + errorThrown + ", status:" + status);
    					},
    					success : function(data, status, jqXHR) { // on success..
    						$("#private_request_form_content").html(jqXHR.responseText);
    					},
    					complete : function(jqXHR, textStatus) {
    					}
    				});
					
	   			}else{
	   	   			alert("<s:text name="global.please.select.row"/>"); 
	   	   		}  
			   		
		   	   }, 
		   	   position:"last"
		   	});
            if( (actualUser=='M' || $("#userIsForestOwner").val()=='true') && $("#campaignIsOpen").val()=='true' ){	
		   	grid.navButtonAdd('#private_request_grid_pager',{
			   	   caption:"", 
			   	   title:"<s:text name="frm.private.request.new.request"/>", 
			   	   buttonicon:"ui-icon-circle-plus", 
			   	   onClickButton: function(){ 
			   		$("#hideReqForm").val("");
			   		$.ajax({
						type : "GET",
						url : "PrivateRequest.form.do?annualplanId="+$("#apId").val(), 
						async : false,
						beforeSend:function(jqXHR, settings) {
						},
						error : function(errorThrown, status, jqXHR) { // on error..
							alert("error:" + errorThrown + ", status:" + status);
						},
						success : function(data, status, jqXHR) { // on success..
							$("#private_request_form_content").html(jqXHR.responseText);
							$("#markingDiv").hide();
							
							

						},
						complete:function(jqXHR, textStatus){
						}
					});
			   	   }, 
			   	   position:"last"
			   	});
            }
            if(actualUser=='M'){
            	jQuery("#private_request_grid").navButtonAdd('#private_request_grid_pager',{
     		   	   caption:"",
     		   	   id:"submitButton",
     		   	   title:"Submit",  
     		   	   buttonicon: "ui-icon-transferthick-e-w", 
     		   	   onClickButton: function(){ 
     		   		var iRow = jQuery("#private_request_grid").jqGrid('getGridParam','selrow');
     					if(iRow){
     						var rowData = jQuery("#private_request_grid").getRowData(iRow); 
     						var s=rowData.status;
     						if(s=='NEW'){
     							var link = "PrivateRequest.submitPopup.do?privateRequestId="+rowData.id ;
     							openDialogForm('private_request_submit_content',link,"<s:text name="privateRequest.submit"/>",800,420);
     							
     						}else{
     							alert("<s:text name='annual.plan.no.status.change.stage'/>");
     							}
     					}else{
     			   			alert("<s:text name="global.please.select.row"/>");
     			   		} 
     		   		
     		   	   }, 
     		   	   position:"last"
     		   	});
            }
           grid.navButtonAdd('#private_request_grid_pager',{
			   	   caption:"", 
			   	   title:"<s:text name="item.status.reject"/>", 
			   	   id:"rejRequest",
			   	   buttonicon:"ui-icon-cancel", 
			   	   onClickButton: function(){ 
			   		var iRow = grid.jqGrid('getGridParam','selrow');
				   			if(iRow){
						   		   var rowData = jQuery("#private_request_grid").getRowData(iRow); 
									openDialogForm('private_request_control_form_content',"PrivateRequest.control.do?rejectReqPopup=true&privateRequestId="+rowData.id,"Arsyeto refuzimin e kerkeses",600,400);
				   			}else{
	 					   	   	alert("<s:text name="frm.global.please.select.row"/>"); 
	 					   	}
// 							$.SmartMessageBox({
// 		     					title : "<s:text name="annual.plan.activity.status.change.title"/>",
// 		     					content : "<s:text name="annual.plan.activity.status.change.content"/>",
// 		     					buttons : '[<s:text name="rbac.permission.button.no"/>][<s:text name="rbac.permission.button.yes"/>]',
// 		     					icon : "fa fa-bell"
		     					
// 		     				}, function(ButtonPressed) {
// 		     					if (ButtonPressed === "<s:text name="rbac.permission.button.yes"/>") {
// 		     						var iRow = grid.jqGrid('getGridParam','selrow');
// 		     			   			if(iRow){
// 		     			   				var rowData = jQuery("#private_request_grid").getRowData(iRow); 
// 			     			   			$.ajax({
// 		     			   					type : "GET",
// 		     			   					url : "PrivateRequestControlSave.do?annualplanId="+$("#apId").val()+"&privateRequest.id="+rowData.id+"&activityStatus.status="+$("#rejectedStatus").val(), 
// 		     			   					async : false,
// 		     			   					beforeSend:function(jqXHR, settings) {
// 		     			   					},
// 		     			   					error : function(errorThrown, status, jqXHR) { // on error..
// 		     			   						alert("error:" + errorThrown + ", status:" + status);
// 		     			   					},
// 		     			   					success : function(data, status, jqXHR) { // on success..
// 		     			   						//alert after cancel action
// 		     			   						jQuery("#private_request_grid").trigger("reloadGrid");
// 	//		     			   						$.smallBox({
// 	//		     			   							title : '<s:text name="small.box.on.cancel.title"/>',
// 	//		     			   							content : '<s:text name="small.box.content"/>',
// 	//		     			   							color : "#C46A69",
// 	//		     			   							//timeout: 6000,
// 	//		     			   							icon : "fa fa-warning shake animated",
// 	//		     			   							number : "3",
// 	//		     			   							timeout : 5000
// 	//		     			   						});
	
			     			   					
// 		     			   					},
// 		     			   					complete:function(jqXHR, textStatus){
// 		     			   					}
// 		     			   				});

// 		     			   			}else{
// 		     					   	   	alert("<s:text name="frm.global.please.select.row"/>"); 
// 		     					   	}
// 			     				}//EOF IF ButtonPressed
// 		     				});
			   	   }, 
			   	   position:"last"
			   	});
          	 grid.navButtonAdd('#private_request_grid_pager',{
		   	   caption:"", 
		   	   title:"<s:text name="frm.private.request.print.request"/>", 
		   	   id:"request",
		   	   buttonicon:"ui-icon-print", 
		   	   onClickButton: function(){ 
	     						var iRow = grid.jqGrid('getGridParam','selrow');
	     			   			if(iRow){
	     			   				var rowData = jQuery("#private_request_grid").getRowData(iRow); 
	     							var parameters = "p_private_id="+rowData.id;	
		     						//openBirtViewer("frm/annualplan/private/private_request_report.rptdesign", parameters);
	     							var doc_name="Kerkesa_per_prerjen_e_pyjeve_private";
	     							var link="\\frm\\annualplan\\private\\private_request_report.rptdesign";
	     							var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
	     							//generateBIRTDoc(url);
	     							parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
	     							downloadDoc("BirtReportGen.do", parameters);
	     			   			}else{
	     					   	   	alert("<s:text name="frm.global.please.select.row"/>");
	     					   	}
		   	   }, 
		   	   position:"last"
		   	});
            grid.navButtonAdd('#private_request_grid_pager',{
					   	   caption:"", 
					   	   title:"<s:text name="frm.private.request.reject.decision"/>", 
					   	   id:"rejectDecision1",
					   	   buttonicon:"ui-icon-closethick", 
					   	   onClickButton: function(){ 
				     						var iRow = grid.jqGrid('getGridParam','selrow');
				     			   			if(iRow){
				     			   				var rowData = jQuery("#private_request_grid").getRowData(iRow); 
				     			   			var parameters = "p_private_id="+rowData.id;	
				     						//openBirtViewer("frm/annualplan/private/reject_decision.rptdesign", parameters);
			     							var doc_name="Refuzimi_i_kerkeses_per_prerjen_e_pyjeve_private";
			     							var link="\\frm\\annualplan\\private\\reject_decision.rptdesign";
			     							var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
			     							//generateBIRTDoc(url);
			     							parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
			     							downloadDoc("BirtReportGen.do", parameters);
				     			   			}else{
				     					   	   	alert("<s:text name="frm.global.please.select.row"/>"); 
				     					   	}
					   	   }, 
					   	   position:"last"
					   	}).navButtonAdd('#private_request_grid_pager',{
					   	   caption:"", 
					   	   title:"<s:text name="frm.private.request.approval.decision"/>", 
					   	   id:"permission",
					   	   buttonicon:"ui-icon-check", 
					   	   onClickButton: function(){ 
				     						var iRow = grid.jqGrid('getGridParam','selrow');
				     			   			if(iRow){
				     			   				var rowData = jQuery("#private_request_grid").getRowData(iRow); 
				     							var parameters = "p_private_id="+rowData.id;	
					     						//openBirtViewer("frm/annualplan/private/permission_report.rptdesign", parameters);
				     							var doc_name="leja_per_prerjen_e_pyjeve_private";
				     							var link="\\frm\\annualplan\\private\\permission_report.rptdesign";
				     							var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
				     							//generateBIRTDoc(url);
				     							parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
				     							downloadDoc("BirtReportGen.do", parameters);
				     			   			}else{
				     					   	   	alert("<s:text name="frm.global.please.select.row"/>");
				     					   	}
					   	   }, 
					   	   position:"last"
					   	}).navButtonAdd('#private_request_grid_pager',{
						   	   caption:"<s:text name="frm.private.request.print.marking"/>", 
						   	   title:"<s:text name="frm.private.request.print.marking"/>", 
						   	   id:"marking",
						   	   buttonicon:"ui-icon-suitcase", 
						   	   onClickButton: function(){ 
						   						var iRow = grid.jqGrid('getGridParam','selrow');
					     			   			if(iRow){
					     			   				var rowData = jQuery("#private_request_grid").getRowData(iRow); 
					     							var parameters = "p_pvt_req_id="+rowData.id;	
						     						//openBirtViewer("frm/annualplan/private/marking_report.rptdesign", parameters);
					     							var doc_name="damkosja_per_prerjen_e_pyjeve_private";
					     							var link="\\frm\\annualplan\\private\\marking_report.rptdesign";
					     							var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
					     							//generateBIRTDoc(url);
					     							parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format=pdf";
					     							downloadDoc("BirtReportGen.do", parameters);
					     			   			}else{
					     					   	   	alert("<s:text name="frm.global.please.select.row"/>");
					     					   	}
						   	   }, 
						   	   position:"last"
						   	});	

			
      
        $(window).bind('resize', function() {
            var width = $('#jqGrid_prvReq_container').width();
            $('#private_request_grid').setGridWidth(width);
        });
    });     
</script>
    
</head>
<body>
		<!-- widget div-->
		<div style="margin-bottom: 1.0em;">
			<div id="jqGrid_prvReq_container">
				<table id="private_request_grid" class="scroll"></table> 
				<div id="private_request_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>
			<hr>
			<div id="private_request_form_content">
				<jsp:include page="private_request_form.jsp"></jsp:include>		
			</div>
			<hr>
			<div id="markingDiv">
				<legend><s:text name="frm.private.request.marking.data"/></legend>
						<div id="private_request_impl_grid_content">
							<jsp:include page="../privateimpl/private_request_impl_grid.jsp"></jsp:include>				
						</div>
				<div id="private_request_impl_form_content">
					<jsp:include page="../privateimpl/private_request_marking_form.jsp"></jsp:include>				
				</div>
			</div>
			<input id="hideReqForm" value='<s:property value="hideReqForm"/>' type="hidden">
			<input id="pvtStatusNew" value='<s:property value="statusNew.getDOMVALUE()"/>' type="hidden">
			<input id="approvedStatus" value='<s:property value="approved.getDOMVALUE()"/>' type="hidden">
			<input id="rejectedStatus" value='<s:property value="rejected.getDOMVALUE()"/>' type="hidden">
			<input id="submittedStatus" value='<s:property value="submitted.getDOMVALUE()"/>' type="hidden">
			<input id="transportStatus" value='<s:property value="transport.getDOMVALUE()"/>' type="hidden">
		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
