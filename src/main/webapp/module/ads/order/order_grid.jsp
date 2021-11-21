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
var iconAlert = '<span class="ui-state-error" style="border:0"><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span></span>';
var iconLupe = '<span class="ui-state-error" style="border:0"><span class="ui-icon ui-icon-search" style="float: left; margin-right: .3em;"></span></span>';

function displayIcons(cellvalue, options, rowObject){
	var icon = "";
	
    if(cellvalue){
    if(cellvalue=="OP" || cellvalue=="NEW"){
    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_op.png'/> <span style='text-transform: uppercase;'><s:text name='tender.request.button.new'/></span></span>";
    }else if(cellvalue=="AP"){
    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_ap.png'/> <span style='text-transform: uppercase;'><s:text name="tender.request.button.approved"/></span></span>";
    }else if(cellvalue=="RE"){
    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_re.png'/> <span style='text-transform: uppercase;'><s:text name="tender.request.button.rejected"/></span></span>";
    }else if(cellvalue=="CA"){
    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_ca.png'/> <span style='text-transform: uppercase;'><s:text name="tender.request.button.canceled"/></span></span>";
    }else if(cellvalue=="CL"){
    	icon = "<span style='padding-left: 5px;'><img src='img/status/status_cl.png'/> <span style='text-transform: uppercase;'><s:text name="fin.contactor.closed"/></span></span>";
    }else{
    	icon = cellvalue;//"<span style='padding-left: 5px;'><img src='img/status/status_" + cellvalue.toLowerCase() + ".png'/> " + cellvalue.toUpperCase() + "</span>";
    }
    }
   
    return icon;
}

$(document).ready(function () {
       	$order_grid = jQuery("#order_grid").jqGrid({
        	   	url:'OrderMgmtGrid.order.do',	
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
                ignoreCase: true,
                toppager: false,
                toolbar: [true, "both"],                
                viewrecords: true,
                rownumbers: true,
        	   	colNames:['Id',
        	   				'',
        	        	   	'<s:text name="bpartner.is.active"/>',
        	   	       		'<s:text name="annual.plan.status.code"/>',
        	   	       		'status',
        	   	       		'<s:text name="req.id"/>',
        	   	       		'<s:text name="annual.plan.status.id"/>',
        	   	       		'<s:text name="requisition.document.id"/>',
        	   	       		'<s:text name="order.po.no"/>',
        	   	       		'<s:text name="order.date"/>',
        	   	       		'<s:text name="order.completion"/>',
        	   	       		'<s:text name="requisition.is.bpartner"/>',
        	   	       		'<s:text name="requisition.bpartner.id"/>',
        	   	       		'<s:text name="bpartner.bussines.partner"/>',
        	   	       		'<s:text name="requisition.supplier.name"/>',
        	   	       		'<s:text name="requisition.supplier.contact"/>',
        	   	       		'<s:text name="requisition.supplier.phone"/>',
        	   	       		'<s:text name="requisition.supplier.address"/>',
        	   	       		'<s:text name="requisition.supplier.fax"/>',
        	   	       		'<s:text name="requisition.supplier.email"/>',
        	   	       		'<s:text name="requisition.supplier.site"/>',
        	   	       		'<s:text name="requisition.total.amount"/>',
//         	   	       		'currency_id','currency_symbol','payment_terms_code',
//         	   	       		'payment_terms_name','acquisition_type_code',
//         	   	       		'dept_contact_name','dept_contact_phone',
//         	   	       		'dept_contact_email','equipment_approver_name',
//         	   	       		'equipment_printed',
//         	   	       		'equipment_print_date','change_orders_count',
//         	   	       		'change_orders_date','order_original_amount',
//         	   	       		'order_initial_amount','dateordered',
//         	   	       		'datepromised','dateprinted','isdelivered',
//         	   	       		'isinvoiced','isprinted','isselected','isselfservice',
// 	        	   	       	'sendemail','bill_location_id','bill_user_id','pay_bpartner_id',
// 	            	   		'pay_location_id','amounttendered','amountrefunded','promotioncode',
// 	            	   		'paymentrule','invoicerule','deliveryrule','deliveryviarule',
// 	            	   		'totallines','grandtotal','deliverynotes','asset_id','quotation_id',
	        	   	       	'<s:text name="requisition.text.msg"/>',
	        		        '<s:text name="adm.user.grid.created"/>',
	        		        '<s:text name="bid.grid.created.by"/>',
	        		        '<s:text name="dp.doc.category.updated"/>',
	        		        '<s:text name="dp.doc.category.updated.by"/>'

        	        	 ],
        	   	colModel:[
        	   		{name:'id',index:'id', hidden: true, width:'50%'},
        	   		{name:'act',index:'act', width:'75%',search:false},
        	   		{name:'isactive',index:'isactive', width:'100%',formatter:"checkbox",align:'center',sortable:false,hidden:true},
        	   		{name:'status_code',index:'status_code', width:'100%',align:'center',formatter: displayIcons},
        	   		{name:'status',index:'status', width:'100%',align:'left',hidden:true},
        	   		{name:'requisition_id',index:'requisition_id', width:'50%',align:'center', hidden: true},
        	   		{name:'status_id',index:'status_id', width:'50%',align:'center', hidden: true},
        	   		{name:'document_id',index:'document_id', width:'50%',align:'center', hidden: true},
        	   		{name:'po_number',index:'po_number', width:'100%'},        	   		
        	   		{name:'order_date',index:'order_date', width:'100%'},
        	   		{name:'order_completation',index:'order_completation', width:'100%'},
        	   		{name:'is_bpartner',index:'is_bpartner',formatter:"checkbox",align:"center", width:'100%',hidden:true},
        	   		{name:'bpartner_id',index:'bpartner_id', width:'100%', hidden: true},
        	   		{name:'bpartner',index:'bpartner', width:'100%'},
        	   		{name:'supplier_name',index:'supplier_name', width:'100%', align:'center'},
        	   		{name:'supplier_contact',index:'supplier_contact', width:'100%', align:'center'},
        	   		{name:'supplier_phone',index:'supplier_phone', width:'100%'},
        	   		{name:'supplier_address',index:'supplier_address', width:'100%'},
        	   		{name:'supplier_fax',index:'supplier_fax', width:'100%'},
        	   		{name:'supplier_email',index:'supplier_email', width:'100%',align:'left'},
        	   		{name:'supplier_site',index:'supplier_site', width:'100%'},
        	   		{name:'grandtotal',index:'grandtotal', width:'100%',align:'center',hidden:true},
//         	   		{name:'currency_id',index:'currency_id', width:'100%',hidden:'true'},
//         	   		{name:'currency_symbol',index:'currency_symbol', width:'100%'},
//         	   		{name:'payment_terms_code',index:'payment_terms_code', width:'100%'},
//         	   		{name:'payment_terms_name',index:'crepayment_terms_nameatedby', width:'100%'},
//         	   		{name:'acquisition_type_code',index:'acquisition_type_code', width:'60%',align:'center'},
//         	   		{name:'dept_contact_name',index:'dept_contact_name', width:'100%'},
//         	   		{name:'dept_contact_phone',index:'dept_contact_phone', width:'100%'},
//         	   		{name:'dept_contact_email',index:'dept_contact_email', width:'100%'},
//         	   		{name:'equipment_approver_name',index:'equipment_approver_name', width:'100%', align:'center'},
//         	   		{name:'equipment_printed',index:'equipment_printed', width:'100%', align:'center'},
//         	   		{name:'equipment_print_date',index:'equipment_print_date', width:'100%'},
//         	   		{name:'change_orders_count',index:'change_orders_count', width:'100%'},
//         	   		{name:'change_orders_date',index:'change_orders_date', width:'100%'},
//         	   		{name:'order_original_amount',index:'order_original_amount', width:'100%'},
//         	   		{name:'order_initial_amount',index:'order_initial_amount', width:'100%',align:'center'},
//         	   		{name:'dateordered',index:'dateordered', width:'100%'},
//         	   		{name:'datepromised',index:'datepromised', width:'100%'},
//         	   		{name:'dateprinted',index:'dateprinted', width:'100%'},
//         	   		{name:'isdelivered',index:'isdelivered', width:'60%',align:'center'},
//         	   		{name:'isinvoiced',index:'isinvoiced', width:'100%'},
//         	   		{name:'isprinted',index:'isprinted', width:'100%'},
//         	   		{name:'isselected',index:'isselected', width:'100%'},
//         	   		{name:'isselfservice',index:'isselfservice', width:'100%'},
//         	   		{name:'sendemail',index:'sendemail', width:'100%'},
        	   		
//         	   		{name:'bill_location_id',index:'bill_location_id', width:'100%', align:'center'},
//         	   		{name:'bill_user_id',index:'bill_user_id', width:'100%', align:'center'},
//         	   		{name:'pay_bpartner_id',index:'pay_bpartner_id', width:'100%'},
//         	   		{name:'pay_location_id',index:'pay_location_id', width:'100%'},
//         	   		{name:'amounttendered',index:'amounttendered', width:'100%'},
//         	   		{name:'amountrefunded',index:'amountrefunded', width:'100%',align:'left'},
//         	   		{name:'promotioncode',index:'promotioncode', width:'100%'},
//         	   		{name:'paymentrule',index:'paymentrule', width:'100%',align:'center'},
//         	   		{name:'invoicerule',index:'invoicerule', width:'100%'},
//         	   		{name:'deliveryrule',index:'deliveryrule', width:'100%'},
//         	   		{name:'deliveryviarule',index:'deliveryviarule', width:'100%'},
//         	   		{name:'totallines',index:'totallines', width:'100%'},
//         	   		{name:'grandtotal',index:'grandtotal', width:'60%',align:'center'},
//         	   		{name:'deliverynotes',index:'deliverynotes', width:'100%'},
//         	   		{name:'asset_id',index:'asset_id', width:'100%'},
//         	   		{name:'quotation_id',index:'quotation_id', width:'100%'},
        	   		{name:'textmsg',index:'textmsg', width:'100%'},
        	   		{name:'created',index:'created', width:'100%'},
        	   		{name:'createdby',index:'createdby', width:'100%'},
        	   		{name:'updated',index:'updated', width:'60%',align:'center'},
        	   		{name:'updatedby',index:'updatedby', width:'100%'}
        	   		
        	   	],
        	   	rowNum:10,
        	   	rowList:[10,20,30],
        	   	pager: '#order_grid_pager',
        	   	gridComplete: function(){
        			var ids = jQuery("#order_grid").jqGrid('getDataIDs');
        			for(var i=0;i < ids.length;i++){
        				var cl = ids[i];
        					au = "<button class='btn btn-xs btn-default' data-original-title='Edit Row' title='<s:text name="audit.title"/>' onclick=\"showHistory('PurchaseOrder','#order_grid', '"+cl+"');\"><i class='fa fa-history'></i></button>";	
        					jQuery("#order_grid").jqGrid('setRowData',ids[i],{act:au});
        			}	
        		},
        	   	sortname: 'po_number',
        	    viewrecords: true,
        	    sortorder: 'asc',
        		multiselect: true,
        		multiboxonly: true,
        		caption: '',
        		subGrid: true,
    		    subGridRowExpanded: function(subgrid_id, row_id) {
    		    	showSubGrids(subgrid_id, row_id);
     		   },
       		   ondblClickRow: function(id, iRow, iCol, e) {
					var rowData = jQuery(this).getRowData(iRow); 
  					var link = "POrder.form.do?orderId=" + rowData.id;
  					loadURL(link, $("#order_content"));			
	  		   },
		  	   onSelectRow: function (rowid, iCol, aData) {
	    	   		if(rowid){
	   					var rowData = $order_grid.getRowData(rowid);
	   					if(rowData.status!="CL"){
							$("#print_order").addClass("ui-icon-print");
	       				}else{
	       					$("#print_order").removeClass("ui-state-disabled");
	           			}
	    	   		}
	  	       },      		         
      		     		
        	});

       	$order_grid.jqGrid('navGrid','#order_grid_pager',
            	{edit: false, add:false, del:false, refresh:true, view:false, cloneToTop: true,search:false},
    			{}, {},{},{multipleSearch:true,recreateFilter:true});  

       	$order_grid.jqGrid ('navButtonAdd', '#order_grid_toppager',
            	{ caption: "", buttonicon: "ui-icon-calculator", title: "choose columns", 
            	onClickButton: function() {
            		$order_grid.jqGrid('columnChooser');
            	}
        })
    	.navButtonAdd('#order_grid_toppager',{
  	   	   caption:"", 
  	   	   title:'<s:text name="label.button.edit"/>', 
  	   	   buttonicon:"ui-icon-pencil", 
  	   	   onClickButton: function(){ 
  	   			var iRow = $order_grid.jqGrid('getGridParam','selrow');
  	   			if(iRow){
  					var rowData = $order_grid.getRowData(iRow); 
  						var link = "POrder.form.do?orderId=" + rowData.id;
  	  					loadURL(link, $("#order_content"));
  	  					
  	   			}else{
  	   	   			alert("<s:text name="tender.request.alarm"/>");
  	   	   		}   
  	   	   }, 
  	   	   position:"last"
  	   	})
    	.navButtonAdd('#order_grid_pager',{ 
   	   	   caption:"", 
   	   	   title:'<s:text name="label.button.edit"/>', 
   	   	   buttonicon:"ui-icon-pencil", 
   	   	   onClickButton: function(){ 
   	   			var iRow = $order_grid.jqGrid('getGridParam','selrow');
   	   			if(iRow){
  					var rowData = $order_grid.getRowData(iRow); 
  					var link = "POrder.form.do?orderId=" + rowData.id;
  					loadURL(link, $("#order_content"));
   	   			}else{
   	   	   			alert("<s:text name="tender.request.alarm"/>");
   	   	   		}
   	   	   }, 
   	   	   position:"last"
   	   	})
   	   	.navButtonAdd('#order_grid_pager',{ 
   	   	   caption:"", 
   	   	   title:'<s:text name="label.button.report"/>', 
   	   	   buttonicon:"ui-icon-print",
   	   	   id:"print_order", 
   	   	   onClickButton: function(){ 
   	   			 var iRow = $order_grid.jqGrid('getGridParam','selrow');
   	   			
//   					var parameters = "p_order_id="+rowData.id;
  				//	openBirtViewer(link, parameters);
   	   			//}else{
   	   	   		//	alert("<s:text name="tender.request.alarm"/>");
   	   	   		//}
   	   	   		if(iRow){
   	   	   	    var rowData=$order_grid.getRowData(iRow);
   	   			var link = "POrder.reportGenerator.do?orderId="+rowData.id;
				openDialogForm('order_rep_generator',link,'Generate Reports',600,400);
				$("#tr_print").addClass("ui-state-disabled");
  				
			
				}else{
   	   	   			alert("<s:text name="tender.request.alarm"/>");
   	   	   		}	   	
   	   	   }, 
   	   	   position:"last"
   	   	});	   	        		     	
});

 $(window).bind('resize', function() {
     var width = $('#jqGrid_order_container').width();
     $('#order_grid').setGridWidth(width);
 });


 function showSubGrids(subgrid_id, row_id) {
	 var str = "<span style='color:blue;'>" + $order_grid.getRowData(row_id).po_number + "</span>";
	 showSubGrid_JQGrid2(subgrid_id, row_id, "<br><span style=''><b>&nbsp;Status of Order № " + str + "</b></span><br><br>", "jqgrid_status");
	 showSubGrid_JQGrid3(subgrid_id, row_id, "<br><span><b>&nbsp;Items of Order № " + str + "</b></span><br><br>", "jqgrid_attachs");
 }  

function showSubGrid_JQGrid2(subgrid_id, row_id, message, suffix) {
 var subgrid_table_id, pager_id, toppager_id;
 subgrid_table_id = subgrid_id+'_t';
 pager_id = 'p_'+ subgrid_table_id;
 toppager_id = subgrid_table_id + '_toppager';
 if (suffix) { subgrid_table_id += suffix; pager_id += suffix;  }
 if (message) jQuery('#'+subgrid_id).append(message);                        
 jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><div id='+pager_id+' class="scroll" style="text-align:center;"></div>');
 
 jQuery("#"+subgrid_table_id).jqGrid({
       url:"OrderMgmtGrid.orderStatus.do?order_id="+$order_grid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
                   '<s:text name="annual.plan.status.code"/>',
  		          '<s:text name="id"/>',
 		          '<s:text name="requisition.text.msg"/>',
 		          '<s:text name="adm.user.grid.created"/>',
 		          '<s:text name="bid.grid.created.by"/>',
 		          '<s:text name="dp.doc.category.updated"/>',
 		          '<s:text name="dp.doc.category.updated.by"/>'
 		],
       colModel: [
         {name:"id",index:"id",width:'100%',hidden:true},
         {name:"status_code",index:"status_code",width:'100%',align:"left", formatter: displayIcons},
         {name:"order_id",index:"order_id",width:'100%',hidden:true},
         {name:"textmsg",index:"textmsg",width:'100%',align:"center"},
         {name:"created",index:"created",width:'100%',align:"center"},
         {name:"createdby",index:"createdby",width:'100%',align:"center"},
         {name:"updated",index:"updated",width:'100%',align:"center"},
         {name:"updatedby",index:"updatedby",width:'100%',align:"center"}
       ],
       pager: pager_id,
       height: 'auto',
       width: 'auto',
       caption: '',
       rowNum:10,
 	   rowList:[10,20,30],
   	   viewrecords: true,
       sortname: 'status_code',
       sortorder: "asc",
       ondblClickRow: function(id, iRow, iCol, e){
	  },
	  onSelectRow: function(){
			jQuery("#dp_grid").resetSelection();
			  }
    }); 
}

function showSubGrid_JQGrid3(subgrid_id, row_id, message, suffix) {
 var subgrid_table_id, pager_id, toppager_id;

 subgrid_table_id = subgrid_id+'_t';
 pager_id = 'p_'+ subgrid_table_id;
 toppager_id = subgrid_table_id + '_toppager';
 if (suffix) { subgrid_table_id += suffix; pager_id += suffix;  }
 if (message) jQuery('#'+subgrid_id).append(message);                        
 jQuery('#'+subgrid_id).append('<table id=' + subgrid_table_id + ' class=scroll></table><div id=' + pager_id + ' class=scroll></div><div id='+pager_id+' class="scroll" style="text-align:center;"></div>');
 
  jQuery("#"+subgrid_table_id).jqGrid({
       url:"OrderMgmtGrid.orderItem.do?order_id="+$order_grid.getRowData(row_id).id,
       datatype: "json",
       colNames: ['Id',
                  '<s:text name="annual.plan.status.code"/>','status','<s:text name="bpartner.bussines.partner"/>',
     				'<s:text name="order.item.name"/>','<s:text name="order.item.number"/>','<s:text name="order.item.number"/>',
     				'<s:text name="order.item.desc"/>','<s:text name="order.item.unit.price"/>',
     				'<s:text name="order.item.qty.ordered"/>','<s:text name="order.item.unit.price.amount"/>',
     				'<s:text name="order.item.uom"/>','<s:text name="order.item.tax"/>','<s:text name="requisition.currency"/>','<s:text name="order.date.ordered"/>',
     				'<s:text name="order.date.promised"/>','<s:text name="order.item.date.delivered"/>','<s:text name="order.item.qty.reserved"/>',
     				'<s:text name="order.item.qty.delivered"/>','<s:text name="order.item.qty.rejected"/>','<s:text name="order.item.qty.stocked"/>','<s:text name="dp.shipper"/>',
     				'<s:text name="order.item.pricelist"/>','<s:text name="order.item.priceactual"/>','<s:text name="order.item.pricelimit"/>',
     				'<s:text name="order.item.line.net.amt"/>','<s:text name="order.item.discount"/>',
     				'<s:text name="order.item.freight.amt"/>','<s:text name="order.item.gross.unit.price"/>','<s:text name="order.item.line.gross.amt"/>',
     				'<s:text name="order.item.gross.pricelist"/>','<s:text name="finance.type.label.description"/>','isnewrow','isactive','order_id','bpartner_id','currency_id','uom_id','tax_id','bpartner_location_id',

 		],
       colModel: [
			{ name: 'id', index: 'id', width: '100%', hidden: true, editable: false, align: 'left' },
			{ name: 'status_code', index: 'status_code', width: '100%', editable: true, formatter: displayIcons, edittype: 'select',  align: 'left',
			  	 editoptions: {
				  	 
			           value: {
			             'OP': '<img src="img/status/status_op.png"/> <s:text name="item.status.open"/>',
			             'AP': '<img src="img/status/status_ap.png"/> <s:text name="item.status.approve"/>',
			             'RE': '<img src="img/status/status_re.png"/> <s:text name="item.status.reject"/>',
			             'CA': '<img src="img/status/status_ca.png"/> <s:text name="item.status.cancel"/>'
			           }
			  	 }
			},
			{ name: 'status', index: 'status', width: '100%', editable: false,hidden:true},
			{ name: 'bpartner', index: 'bpartner', width: '200%', align: 'left', editable: true,
				editoptions:{
			        dataInit:function(el){ 
			    	    $(el).select2({
			    			placeholder: '-- Select --',                	        
			    	        minimumInputLength: 0,
			    	        ajax: {
			    		        url: "OrderMgmtInput.busPartner.do",
			    		        dataType: 'json',
			    		        quietMillis: 250,
			    		        data: function (term, page) {
			    		        return {
			    		        	featureClass: "P",
			    					style: "full",
			    					maxRows: 12,            
			    		        	orgtype: "D",
			    		        	name_startsWith: term,
			    		        };
			    		        },
			    		        results: function (data, page) {
			    		        return { results: data };
			    		        },
			    		        cache: true
			    	        },
			    	        initSelection: function(element, callback) {
			    	        },
			    	        dropdownAutoWidth: false,
			                formatResult : function(item){
			                	return item.name+ " (" + item.name2 + ")"; 
			                },
			                formatSelection: function(item){
			                    var ids = $grid_oitem.jqGrid('getDataIDs');
			                    for (var i = 0; i < ids.length + 1; i++) {
			                    	$('#' + ids[i] + '_bpartner_id').val(item.id);
			                    }                                             	
			                    return item.name+ " (" + item.name2 + ")";
			                },	        
			    	        allowClear: true,
			    	        dropdownCssClass: "bigdrop",
			    	        escapeMarkup: function (m) { return m; }
			    	    });                			                        
			        }
				}
			},
			{ name: 'item_name', index: 'item_name', width: '100%', editable: true, align: 'left' },
			{ name: 'itemNumber', index: 'itemNumber', width: '100%', editable: false, align: 'left'},
			{ name: 'item_number', index: 'item_number', width: '100%', editable: true, hidden:true, align: 'left'},		
			{ name: 'item_desc', index: 'item_desc', width: '100%', editable: true, align: 'left'},
			{ name: 'unit_price', index: 'unit_price', width: '100%', editable: true, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'qtyordered', index: 'qtyordered', width: '100%', editable: true, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'line_total', index: 'line_total', width: '100%', editable: false, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'uom', index: 'uom', width: '200%', align: 'left'},
			{ name: 'tax', index: 'tax', width: '200%', align: 'left'},
			{ name: 'currency', index: 'currency', width: '200%', align: 'left'},
			{ name: 'dateordered', index: 'dateordered', width: '100%', align: 'left'},
			{ name: 'datepromised', index: 'datepromised', width: '100%', align: 'left'},		
			{ name: 'datedelivered', index: 'datedelivered', width: '100%', align: 'left'},
			
			{ name: 'qtyreserved', index: 'qtyreserved', width: '100%', editable: false, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'qtydelivered', index: 'qtydelivered', width: '100%', editable: false, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'qtyrejected', index: 'qtyrejected', width: '100%', editable: false, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			
			{ name: 'qtystocked', index: 'qtystocked', width: '100%', editable: false, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'shipper', index: 'shipper', width: '100%', editable: true, align: 'left',hidden:true},
			{ name: 'pricelist', index: 'pricelist', width: '100%', editable: true, align: 'left',hidden:true, editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'priceactual', index: 'priceactual', width: '100%', editable: true, align: 'left',hidden:true, editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'pricelimit', index: 'pricelimit', width: '100%', editable: true, align: 'left',hidden:true, editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'linenetamt', index: 'linenetamt', width: '100%', editable: true, align: 'left',hidden:true, editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'discount', index: 'discount', width: '100%', editable: true, align: 'left',hidden:true, editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'freightamt', index: 'freightamt', width: '100%', editable: true,hidden:true, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'gross_unit_price', index: 'gross_unit_price', width: '100%',hidden:true, editable: true, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'line_gross_amount', index: 'line_gross_amount', width: '100%',hidden:true, editable: true, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'grosspricelist', index: 'grosspricelist', width: '100%', editable: true,hidden:true, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
			{ name: 'description', index: 'description', width: '100%', editable: false,sortable:false},
			
			{ name: 'isnewrow', index: 'isnewrow', width: '100%', hidden: true, align: 'left'},
			{ name: 'isactive', index: 'isactive', width: '100%', hidden: true, editable: true, formatter:"checkbox",type:'text', align: 'left'},
			{ name: 'order_id', index: 'order_id', width: '100%', hidden: true, editable: true, stype:'number', align: 'left'},				
			{ name: 'bpartner_id', index: 'bpartner_id', width: '100%', hidden: true, editable: true, stype:'number', align: 'left'},
			{ name: 'currency_id', index: 'currency_id', width: '100%', hidden: true, editable: true, stype:'number', align: 'left'},
			{ name: 'uom_id', index: 'uom_id', width: '100%', hidden: true, editable: true, stype:'number', align: 'left'},
			{ name: 'tax_id', index: 'tax_id', width: '100%', hidden: true, editable: true, stype:'number', align: 'left'},
			{ name: 'bpartner_location_id', index: 'bpartner_location_id', hidden: true, width: '100%', editable: true, stype:'number', align: 'left'}	
       ],
       pager: pager_id,
       height: '100%',
       width: '100%',
       caption: '',
       rowNum:10,
 	   rowList:[10,20,30],
	   autowidth: false,
	   shrinkToFit: true,
	   gridview: true,
       headertitles: true,
       ignoreCase: true, 	   
   	   viewrecords: true,
       sortname: 'order_id',
       sortorder: "asc",
       ondblClickRow: function(id, iRow, iCol, e){
	  },
	  onSelectRow: function(){
			jQuery("#dp_grid").resetSelection();
	  }
    }); 
}

function imageFormat( cellvalue, options, rowObject ){
	return '<img src="img/filetypes/'+rowObject['doc_type']+'_type.png" width="30px" height="30px"/>';
}

function formatOperations(cellvalue, options, rowObject) {
    return "<a href='/exam/editQuestion.html?q_id=" + cellvalue +"'><u>Edit</u></a>  "+
	       "<a href='/exam/deleteQuestion.html?q_id=" + cellvalue +"'><u>Delete</u></a>";
}

function editLinkFmatter(cellvalue, options, rowObject) {
    return "<a href='" +
        $.param({
            documentId: rowObject["@id"],
            action: 'OpenDocument'
        }) + "' class='requestlink' target='_blank'>" + cellvalue + "</a>";
}

</script>
</head>
<body>
		<!-- widget div -->
		<div style="margin-bottom: 1.0em;">

			<div id="jqGrid_order_container">
				<table id="order_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
				<div id="order_grid_pager" class="scroll" style="text-align:center;"></div>
			</div>

		</div>
		<!-- end widget div -->

 </body>   
			
</html>	
