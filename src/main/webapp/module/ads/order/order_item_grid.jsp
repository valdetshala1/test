<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
ui-grid{ width:100% !important; }
input.ui-pg-input {width: auto; padding: 0px; margin: 0px; line-height: 14px}
select.ui-pg-selbox {width: auto; padding: 0px; margin: 0px; line-height: 18px}
</style>
<script type="text/javascript">
//<![CDATA[
/*global $ */
/*jslint devel: true, browser: true, unparam: true */
 
function processResponse(jqXHR) {
	var ret = false;
	$("#item_grid_errors").html(jqXHR.responseText);
	var errors = jqXHR.getResponseHeader("errors_exist");	
	if(errors == 'true'){
		$.smallBox({
			title : '<s:text name="small.box.on.save.title.failed"/>',
			content : '<s:text name="small.box.content"/>',
			color : "#C79121",
			timeout: 3000,
			icon : "fa fa-shield fadeInLeft animated",
			number : "2"
		});
		ret = false;
	}else{
		$("#order_item_grid").trigger("reloadGrid");
		$.smallBox({
			title : '<s:text name="small.box.on.save.title.success"/>',
			content : '<s:text name="small.box.content"/>',
			color : "#739E73",
			timeout: 3000,
			icon : "fa fa-check",
			number : "1"
		});		
		$("#ricancel").addClass('ui-state-disabled');	
		ret = true;
	}	
	return ret;
}

function displayButtons(cellvalue, options, rowObject){
    var edit = "<input style='...' type='button' value='E' onclick=\"jQuery('#order_item_grid').editRow('" + options.rowId + "');\"  />",
    save = "<input style='...' type='button' value='S' onclick=\"jQuery('#order_item_grid').saveRow('" + options.rowId + "');\"  />",
    restore = "<input style='...' type='button' value='R' onclick=\"jQuery('#order_item_grid').restoreRow('" + options.rowId + "');\" />";
    return edit+save+restore;
}

function isNumber(element){
	$(element).keyup(function(){
        var val1 = element.value;
        var num = new Number(val1);
        if(isNaN(num))
        {this.value="";alert("Please enter a valid number");}
    });	
}

$(function () {
	var lastsel2 = null;
	var editParams = {
		    afterSubmit: processResponse, 
		    successfunc: function(response) {
		        var processed = processResponse(response);
		    	return processed;
		    }, 
		    afterrestorefunc: function(id) {
		    	editingRowId = undefined;
		    }, 
		    oneditfunc: function (id) { editingRowId = id;},
		    bottominfo: 'Fields marked with an (*) are required', 
		    keys: true
	};	
	
	var poItemEditParams = $.extend(true, {}, editParams, {url: 'POrderItemSave.do'});
   
    var oldAddRowData = $.fn.jqGrid.addRowData;
    $.jgrid.extend({
        addRowData: function (rowid, rdata, pos, src) {
            if (pos === 'afterSelected' || pos === 'beforeSelected') {
                if (typeof src === 'undefined' && this[0].p.selrow !== null) {
                    src = this[0].p.selrow;
                    pos = (pos === "afterSelected") ? 'after' : 'before';
                } else {
                    pos = (pos === "afterSelected") ? 'last' : 'first';
                }
            }
			
            rdata["order_id"] = $("#order\\.id").val();
            rdata["isnewrow"] = 'Y';
            return oldAddRowData.call(this, rowid, rdata, pos, src);
        }
    });

    getColumnIndexByName = function(grid,columnName) {
        var cm = $grid_oitem.jqGrid('getGridParam','colModel'), i=0,l=cm.length;
        for (; i<l; i+=1) {
            if (cm[i].name===columnName) {
                return i; // return the index
            }
        }
        return -1;
    };
        
    hideDelIcon = function(rowid) {
        setTimeout(function() {
            $("tr#"+$.jgrid.jqID(rowid)+ " div.ui-inline-del").hide();
        },50);
    };
        
    $grid_oitem = $("#order_item_grid").jqGrid({
    	url: 'OrderMgmtGrid.orderItem.do?order_id=' + $("#order\\.id").val(),
    	data: {order_id: $("#order\\.id").val()}, 
        datatype: 'json',
        contentType: "application/json; charset=utf-8",
        mtype: 'GET',
        beforeRequest: function() {
            responsive_jqgrid($("#order_item_grid"));
        },        
        colNames: [
   				'id',
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
				{ name: 'item_desc', index: 'item_desc', width: '100%', editable: true, align: 'left',sortable:false},
				{ name: 'unit_price', index: 'unit_price', width: '100%', editable: true, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
				{ name: 'qtyordered', index: 'qtyordered', width: '100%', editable: true, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
				{ name: 'line_total', index: 'line_total', width: '100%', editable: false, align: 'left', editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
				{ name: 'uom', index: 'uom', width: '200%', align: 'left', editable: true,
					editoptions:{
				        dataInit:function(el){ 
				    	    $(el).select2({
				    			placeholder: '-- Select --',                	        
				    	        minimumInputLength: 0,
				    	        ajax: {
				    		        url: "OrderMgmtInput.uom.do",
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
				                	return item.name+ " (" + item.uomsymbol + ")"; 
				                },
				                formatSelection: function(item){
				                    var ids = $grid_oitem.jqGrid('getDataIDs');
				                    for (var i = 0; i < ids.length + 1; i++) {
				                    	$('#' + ids[i] + '_uom_id').val(item.id);
				                    }                                             	
				                    return item.name+ " (" + item.uomsymbol + ")";
				                },	        
				    	        allowClear: true,
				    	        dropdownCssClass: "bigdrop",
				    	        escapeMarkup: function (m) { return m; }
				    	    });                			                        
				        }
					}
				},
				{ name: 'tax', index: 'tax', width: '200%', align: 'left', editable: true,
					editoptions:{
				        dataInit:function(el){ 
				    	    $(el).select2({
				    			placeholder: '-- Select --',                	        
				    	        minimumInputLength: 0,
				    	        ajax: {
				    		        url: "OrderMgmtInput.tax.do",
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
				                	return item.name; 
				                },
				                formatSelection: function(item){
				                    var ids = $grid_oitem.jqGrid('getDataIDs');
				                    for (var i = 0; i < ids.length + 1; i++) {
				                    	$('#' + ids[i] + '_tax_id').val(item.id);
				                    }                                             	
				                    return item.name;
				                },	        
				    	        allowClear: true,
				    	        dropdownCssClass: "bigdrop",
				    	        escapeMarkup: function (m) { return m; }
				    	    });                			                        
				        }
					}
				},
				{ name: 'currency', index: 'currency', width: '200%', align: 'left', editable: true,
					editoptions:{
				        dataInit:function(el){ 
				    	    $(el).select2({
				    			placeholder: '-- Select --',                	        
				    	        minimumInputLength: 0,
				    	        ajax: {
				    		        url: "OrderMgmtInput.currency.do",
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
				                	return item.description+ " (" + item.cursymbol + ")"; 
				                },
				                formatSelection: function(item){
				                    var ids = $grid_oitem.jqGrid('getDataIDs');
				                    for (var i = 0; i < ids.length + 1; i++) {
				                    	$('#' + ids[i] + '_currency_id').val(item.id);
				                    }                                             	
				                    return item.description+ " (" + item.cursymbol + ")";
				                },	        
				    	        allowClear: true,
				    	        dropdownCssClass: "bigdrop",
				    	        escapeMarkup: function (m) { return m; }
				    	    });                			                        
				        }
					}
				},
				{ name: 'dateordered', index: 'dateordered', width: '100%', align: 'left', editable: true, 
					editoptions:{ 
					size:20, 
				    dataInit:function(el){ 
						$(el).datetimepicker({
							lang: 'al',
							format: 'd.m.Y',
							mask: false,
							formatDate:'d.m.Y',
							timepicker: false,
						});	                        
				    }, 
				    defaultValue: function(){ 
				      var currentTime = new Date(); 
				      var month = parseInt(currentTime.getMonth() + 1); 
				      month = month <= 9 ? "0"+month : month; 
				      var day = currentTime.getDate(); 
				      day = day <= 9 ? "0"+day : day; 
				      var year = currentTime.getFullYear();
				      return day+"."+month + "."+year; 
				    } 
				  }                 
				},
				{ name: 'datepromised', index: 'datepromised', width: '100%', align: 'left', editable: true, 
					editoptions:{ 
					size:20, 
				    dataInit:function(el){ 
						$(el).datetimepicker({
							lang: 'al',
							format: 'd.m.Y',
							mask: false,
							formatDate:'d.m.Y',
							timepicker: false,
						});	                        
				    }, 
				    defaultValue: function(){ 
				      var currentTime = new Date(); 
				      var month = parseInt(currentTime.getMonth() + 1); 
				      month = month <= 9 ? "0"+month : month; 
				      var day = currentTime.getDate(); 
				      day = day <= 9 ? "0"+day : day; 
				      var year = currentTime.getFullYear();
				      return day+"."+month + "."+year; 
				    } 
				  }                 
				},		
				{ name: 'datedelivered', index: 'datedelivered', width: '100%', align: 'left', editable: false, 
					editoptions:{ 
					size:20, 
				    dataInit:function(el){ 
						$(el).datetimepicker({
							lang: 'al',
							format: 'd.m.Y',
							mask: false,
							formatDate:'d.m.Y',
							timepicker: false,
						});	                        
				    }, 
				    defaultValue: function(){ 
				      var currentTime = new Date(); 
				      var month = parseInt(currentTime.getMonth() + 1); 
				      month = month <= 9 ? "0"+month : month; 
				      var day = currentTime.getDate(); 
				      day = day <= 9 ? "0"+day : day; 
				      var year = currentTime.getFullYear();
				      return day+"."+month + "."+year; 
				    } 
				  }                 
				},
				
				
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
        onSelectRow: function (id,selected) {
            if (id && id !== lastsel2) {
            	$('#order_item_grid').jqGrid('restoreRow',lastsel2);
            	$('#order_item_grid').jqGrid('editRow',id,true);                
                lastsel2 = id;
            }

            if(id){
				var rowData = $("#order_item_grid").getRowData(id);
				if(rowData.status!=='OP'){
					if(rowData.status==='AP' && $("#order\\.purchaseOrderStatus\\.statusCode").val()==='AP'){
						$("#receipt").removeClass('ui-state-disabled');
					}else{
						$("#receipt").addClass('ui-state-disabled');
					}
					$("#modify_item").addClass('ui-state-disabled');
					$("#ricancel").addClass('ui-state-disabled');
					
					if($("#order\\.purchaseOrderStatus\\.statusCode").val()==='NEW'){
						$("#add_item").removeClass('ui-state-disabled');
						$("#save_item").removeClass('ui-state-disabled');
					}else{
						$("#add_item").addClass('ui-state-disabled');
						$("#save_item").addClass('ui-state-disabled');
					}
				}else{
					$("#receipt").addClass('ui-state-disabled');
	   				$("#modify_item").removeClass('ui-state-disabled');
					
					$("#ricancel").removeClass('ui-state-disabled');
					if($("#order\\.purchaseOrderStatus\\.statusCode").val()==='NEW'){
						$("#save_item").removeClass('ui-state-disabled');
						$("#add_item").removeClass('ui-state-disabled');
					}else{
						$("#save_item").addClass('ui-state-disabled');
						$("#add_item").addClass('ui-state-disabled');
					}
	   	   		}
   			}
        },
        pager: '#order_item_grid_pager',
        rowNum: 10,
        rowList: [10, 20, 50],
        sortname: 'i.id',
        sortorder: 'asc',
        viewrecords: true,
        rownumbers: true,
        caption: '', 
        loadonce: false,
        ignoreCase: true,
        multiselect: false,
        height: '100%',
		width: '100%',
		autowidth: true,
		shrinkToFit: false,
        footerrow: true,
        /*serializeRowData: function (postData) { return JSON.stringify({data: JSON.stringify(postData)}); },
        serializeRowData: function(postData) {
        	console.log(JSON.stringify(postData));
        	 //return JSON.stringify(postData);
       	 	return postData;
        },        
        serializeEditData: function (postData) {
        	console.log(JSON.stringify(postData));
        	//return JSON.stringify(postData);
        	return postData;
    	},       
    	*/
        onCellSelect: function (rowid, iCol, aData) {
            if (rowid && rowid !== lastsel2) {
                if (lastsel2){
                    $('#order_item_grid').jqGrid('restoreRow', lastsel2);
                }
                lastsel2 = rowid;
            }
        },
        gridComplete: function () {
            calculateTotal();
        },
        afterSaveCell: function (rowid, name, val, iRow, iCol) {
            calculateTotal();
            $("#ricancel").addClass('ui-state-disabled');
        }                
    });

    $("#order_item_grid").jqGrid('navGrid', '#order_item_grid_pager', 
   	{ search: false, add: false, edit: false, del: false, editParams: poItemEditParams }
    );

    //$("#order_item_grid").jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true, defaultSearch: "cn" });

    $("#order_item_grid").jqGrid('navButtonAdd', '#order_item_grid_pager', {
        caption: "<s:text name='label.button.edit'/>",id:"modify_item", buttonicon: "ui-icon-pencil",
        onClickButton: function () {
            if(lastsel2){
            	$('#order_item_grid').jqGrid('editRow', lastsel2, poItemEditParams);
            	$("#ricancel").removeClass('ui-state-disabled');
            }
            /*
            var ids = $('#order_item_grid').jqGrid('getDataIDs');
            for (var i = 0; i < ids.length + 1; i++) {
                //$('#order_item_grid').jqGrid('editRow', ids[i], true);
                $('#order_item_grid').jqGrid('editRow', ids[i], poItemEditParams);
            }
            */
        }
    });

    $("#order_item_grid").jqGrid('navButtonAdd', '#order_item_grid_pager', {
        caption: "<s:text name='label.button.cancel'/>",
        id: "ricancel",
        disabled: true,
        buttonicon: "ui-icon-cancel",
        onClickButton: function () {

        	if(lastsel2){
            	$("#order_item_grid").restoreRow(lastsel2);
            	$("#ricancel").addClass('ui-state-disabled');
        	}

        	var ids = $('#order_item_grid').jqGrid('getDataIDs');
            for (var i = 0; i < ids.length + 1; i++) {
            	//rdata["isnewrow"] = 'Y';
            	//var rowData = jQuery('#preq_item_grid').jqGrid ('getRowData', ids[i]);
            	var isnewrow = jQuery('#order_item_grid').jqGrid ('getCell', ids[i], 'isnewrow');
            	if(isnewrow === 'Y'){
            		$('#order_item_grid').jqGrid('delRowData',ids[i]);
            		$("#ricancel").addClass('ui-state-disabled');
            	}else if (ids[i]){
            		$("#order_item_grid").restoreRow(ids[i]);
            		$("#ricancel").addClass('ui-state-disabled');
                }
            }       
        }
    }); 

    $("#ricancel").addClass('ui-state-disabled');

    $("#order_item_grid").jqGrid('navButtonAdd', '#order_item_grid_pager', {
        caption: "<s:text name='label.button.save'/>", buttonicon: "ui-icon-disk", id:"save_item",
        onClickButton: function () {
            var ids = $('#order_item_grid').jqGrid('getDataIDs');
            if(0<ids.length){
				for (var i = 0; i < ids.length+1; i++) {
				  $("#order_item_grid").jqGrid('saveRow', ids[i], poItemEditParams);
				}
            }
        }
    });

    $("#order_item_grid").jqGrid('navButtonAdd', '#order_item_grid_pager', {
        caption: "<s:text name='label.button.add'/>",
        id:"add_item",
        buttonicon: "ui-icon-plus",
        onClickButton: function () {
             $("#order_item_grid").jqGrid('addRowData', "",{});
             $("#order_item_grid").jqGrid('editRow', "", true);
             $("#ricancel").removeClass('ui-state-disabled');
        }
    });

    if($("#order\\.purchaseOrderStatus\\.statusCode").val()!=='NEW'){
    	$("#add_item").addClass('ui-state-disabled');
    }
    
    $("#order_item_grid").jqGrid('navButtonAdd', '#order_item_grid_pager', {
        caption: "<s:text name='label.button.receipt'/>",id:"receipt",
        buttonicon: "ui-icon-cart",
        onClickButton: function () {
        	var iRow = $("#order_item_grid").jqGrid('getGridParam','selrow');
	   			if(iRow){
					var rowData = $("#order_item_grid").getRowData(iRow); 
					var link = "POrder.itemReceipt.do?";
					$("#itemId").val(rowData.id);
					$("#itemName").val(rowData.item_name);
					$("#itemQtyOrdered").val(rowData.qtyordered);
					openDialogForm('item_receipt_content',link,"Material Receipt",800,650);
	   			}else{
	   	   			alert("<s:text name="tender.request.alarm"/>");
	   	   		}   
        }
    });
    $("#receipt").addClass('ui-state-disabled');
    
    getColumnIndexByName = function(grid,columnName) {
        var cm = grid.jqGrid('getGridParam','colModel');
        for (var i=0,l=cm.length; i<l; i++) {
            if (cm[i].name===columnName) {
                return i; // return the index
            }
        }
        return -1;
    };

    getTextFromCell = function(cellNode) {
        return cellNode.childNodes[0].nodeName === "INPUT"?
               cellNode.childNodes[0].value:
               cellNode.textContent || cellNode.innerText;
    };
    
    calculateTotal = function() {
        var totalAmount = 0, totalQuantity = 0, totalUnitPrice = 0;
        
        i=getColumnIndexByName($grid_oitem,'unit_price_amount'); // nth-child need 1-based index so we use (i+1) below
        $("tbody > tr.jqgrow > td:nth-child("+(i+1)+")", $grid_oitem[0]).each(function() {
            totalAmount += Number(getTextFromCell(this));
        });

        i=getColumnIndexByName($grid_oitem,'quantity');
        $("tbody > tr.jqgrow > td:nth-child("+(i+1)+")", $grid_oitem[0]).each(function() {
        	totalQuantity += Number(getTextFromCell(this));
        });

        i=getColumnIndexByName($grid_oitem,'unit_price');
        $("tbody > tr.jqgrow > td:nth-child("+(i+1)+")", $grid_oitem[0]).each(function() {
        	totalUnitPrice += Number(getTextFromCell(this));
        });        

        $grid_oitem.jqGrid('footerData','set',{item_number:'TOTAL', unit_price:totalUnitPrice ,quantity:totalQuantity, unit_price_amount:totalAmount});
    };    

});    

var lastSelection;
function editRow(id){
	if(id && id !== lastSelection){
		var grid = $("#order_item_grid");
		grid.restoreRpw(lastSelection);
		grid.editRow(id, true);
		lastSelection = id;
	}
}

$(window).resize(function () {
	// when the browser size changes so does the grid
    $("#order_item_grid").jqGrid('setGridWidth', $('#jqGrid_order_item_container').width(), false);
});

$(window).bind('resize', function() {
	//trick - make small
	$('#order_item_grid').setGridWidth(100);
	
	var width = $('#jqGrid_order_item_container').width();
    // Set grid width to .jqGrid_order_item_container and them go responsive
    $("#order_item_grid").jqGrid('setGridWidth', width, false);
});


function responsive_jqgrid(jqgrid) {
    jqgrid.find('.ui-jqgrid').addClass('clear-margin span12').css('width', '');
    jqgrid.find('.ui-jqgrid-view').addClass('clear-margin span12').css('width', '');
    jqgrid.find('.ui-jqgrid-view > div').eq(1).addClass('clear-margin span12').css('width', '').css('min-height', '0');
    jqgrid.find('.ui-jqgrid-view > div').eq(2).addClass('clear-margin span12').css('width', '').css('min-height', '0');
    jqgrid.find('.ui-jqgrid-sdiv').addClass('clear-margin span12').css('width', '');
    jqgrid.find('.ui-jqgrid-pager').addClass('clear-margin span12').css('width', '');
}

//]]>
</script>
</head>
<body>
<!-- widget div -->
<div style="margin-bottom: 1.0em;" id="order_item_container">

	<div id="jqGrid_order_item_container">
		<table id="order_item_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
		<div id="order_item_grid_pager" class="scroll" style="text-align:center;"></div>
	</div>
	<input type="hidden" id="itemId">
	<input type="hidden" id="itemName">
	<input type="hidden" id="itemQtyOrdered">
</div>
<!-- end widget div -->

</body>   
			
</html>	