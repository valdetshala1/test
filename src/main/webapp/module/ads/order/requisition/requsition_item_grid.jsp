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
//<![CDATA[
/*global $ */
/*jslint devel: true, browser: true, unparam: true */
 
function processResponse(jqXHR) {
	var ret = false;
	$("#item_grid_errors").html(jqXHR.responseText);
	//alert(jqXHR.getAllResponseHeaders());
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
		$("#preq_item_grid").trigger("reloadGrid");
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
    var edit = "<input style='...' type='button' value='E' onclick=\"jQuery('#preq_item_grid').editRow('" + options.rowId + "');\"  />",
    save = "<input style='...' type='button' value='S' onclick=\"jQuery('#preq_item_grid').saveRow('" + options.rowId + "');\"  />",
    restore = "<input style='...' type='button' value='R' onclick=\"jQuery('#preq_item_grid').restoreRow('" + options.rowId + "');\" />";
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
		        /*if(processed){
			        if(processed[0] !== true) {
			            $.jgrid.info_dialog($.jgrid.errors.errcap, processed[1], $.jgrid.edit.bClose);
			        }
			        return processed[0];
		    	}*/
		    	return processed;
		    }, 
		    afterrestorefunc: function(id) {
		    	editingRowId = undefined;
		    }, 
		    oneditfunc: function (id) { editingRowId = id; },
		    bottominfo: 'Fields marked with an (*) are required', 
		    keys: true
	};	
	
	var poItemEditParams = $.extend(true, {}, editParams, {url: 'PReqItemSave.do'});
   
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
			
            rdata["requisition_id"] = $("#requisition\\.id").val();
            rdata["isnewrow"] = 'Y';
            return oldAddRowData.call(this, rowid, rdata, pos, src);
        }
    });

    getColumnIndexByName = function(grid,columnName) {
        var cm = $grid.jqGrid('getGridParam','colModel'), i=0,l=cm.length;
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
        
    $grid = $("#preq_item_grid").jqGrid({
        url: 'OrderMgmtGrid.requisitionItem.do?requisition_id=' + $("#requisition\\.id").val(),
        data: {requisition_id: $("#requisition\\.id").val()}, 
        datatype: 'json',
        mtype: 'GET',
        colNames: ['Id','isactive', 'requisition_id', '<s:text name="annual.plan.status.code"/>', 'status', '<s:text name="order.item.name"/>', 
                   '<s:text name="requisition.unit.of.issue.code"/>', '<s:text name="order.item.number"/>','<s:text name="order.item.number"/>', '<s:text name="order.item.unit.price"/>', 
                   '<s:text name="animal.quantity"/>', '<s:text name="order.item.unit.price.amount"/>', '<s:text name="order.item.uom"/>', 'uom_id',
                   '<s:text name="order.item.desc"/>', '<s:text name="requisition.item.need.by.date"/>', '<s:text name="dp.received.date"/>', 
                   '<s:text name="requisition.item.accept.date"/>', '<s:text name="requisition.text.msg"/>', 'isnewrow'
                   ], 
        colModel: [
            { name: 'id', index: 'Id', width: '100%', hidden: true, editable: false, align: 'left' },
            { name: 'isactive', index: 'isactive', width: '100%', hidden: true, formatter:"checkbox",editable: true, align: 'left' },
            { name: 'requisition_id', index: 'requisition_id', width: '100%', hidden: true, editable: true, align: 'left' },
           /* {name:'action',index:'action',sortable:false,hidden: true, formatter: displayButtons},*/
            { name: 'status_code', index: 'status_code', width: '100%', editable: true, align: 'left', formatter: displayIcons, edittype: 'select', 
            	 editoptions: {
                     value: {
                         'OP': '<img src="img/status/status_op.png"/> Open',
                         'AP': '<img src="img/status/status_ap.png"/> Approve',
                         'RE': '<img src="img/status/status_re.png"/> Reject',
                         'CA': '<img src="img/status/status_ca.png"/> Cancel',
                     }
            	 }
            },
            { name: 'status', index: 'status', width: '100%', editable: false,hidden:true},
            { name: 'item_name', index: 'item_name', width: '100%', editable: true, align: 'left' },
            { name: 'unit_of_issue_code', index: 'unit_of_issue_code', width: '100%', editable: true, editoptions:{maxlength:5}, align: 'left' },
            { name: 'itemNumber', index: 'itemNumber', width: '100%', editable: false, align: 'left'},
            { name: 'item_number', index: 'item_number', width: '100%', editable: true, hidden:true, align: 'left',},
            { name: 'unit_price', index: 'unit_price', width: '100%', editable: true, align: 'left',editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
            { name: 'quantity', index: 'quantity', width: '100%', editable: true, align: 'left',editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
            { name: 'unit_price_amount', index: 'unit_price_amount', width: '100%', editable: false, align: 'left',editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
            { name: 'uom', index: 'uom', width: '200%', align: 'left', editable: true,
        		editoptions:{ 
            		//http://www.ok-soft-gmbh.com/jqGrid/editwithdependendselects2.htm
            		//http://www.ok-soft-gmbh.com/jqGrid/CellEditAfterSaveCellProblem1.htm
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
                                //return item.uomsymbol + ", " + item.name + ", " + item.description;
                            	return item.name+ " (" + item.uomsymbol + ")"; 
                            },
                            formatSelection: function(item){
                            	//var localRowData = $(this).jqGrid('getLocalRow', rowid);
                                var ids = $grid.jqGrid('getDataIDs');
                                for (var i = 0; i < ids.length + 1; i++) {
                                	$('#' + ids[i] + '_uom_id').val(item.id);
                                	//$grid.setCell(ids[i], 'uom_id', item.id);
                                	//$grid.jqGrid('setColProp', 'uom_id', {editable:true, value: item.id});
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
            { name: 'uom_id', index: 'uom_id', width: '100%', hidden: true, editable: true, align: 'left'},
            { name: 'item_desc', index: 'item_desc', width: '100%', editable: true, align: 'left'},
            { name: 'need_by_date', index: 'need_by_date', width: '100%', align: 'left', editable: true, 
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
            { name: 'received_date', index: 'received_date', width: '100%', hidden: true, editable: true, align: 'left'},
            { name: 'accept_date', index: 'accept_date', width: '100%', hidden: true, editable: true, align: 'left'},
            { name: 'textmsg', index: 'textmsg', width: '100%', editable: true, align: 'left'},
            { name: 'isnewrow', index: 'isnewrow', width: '100%', hidden: true, align: 'left'}
        ],
        onSelectRow: function (id) {
            if (id && id !== lastsel2) {
            	$('#preq_item_grid').jqGrid('restoreRow',lastsel2);
            	$('#preq_item_grid').jqGrid('editRow',id,true);                
                lastsel2 = id;
            }
        },
        pager: '#preq_item_grid_pager',
        rowNum: 10,
        rowList: [10, 20, 50],
        sortname: 'id',
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
        editurl: "PReqItemSave.do",
        onCellSelect: function (rowid, iCol, aData) {
            if (rowid && rowid !== lastsel2) {
                if (lastsel2){
                    $('#preq_item_grid').jqGrid('restoreRow', lastsel2);
                }
                lastsel2 = rowid;
                //$('#' + rowid + '_uom_id').val('1');
            }

            if(rowid){
				var rowData = $("#preq_item_grid").getRowData(rowid);
				var reqStatus=$("#requisition\\.requisitionStatus\\.statusCode").val();		
				if(rowData.status!=='OP'){
					if(rowData.status_code==='AP' && reqStatus==='AP'){
						$("#receipt").removeClass('ui-state-disabled');
					}else{
						$("#receipt").addClass('ui-state-disabled');
					}
					$("#modify_item").addClass('ui-state-disabled');
					$("#ricancel").addClass('ui-state-disabled');
					
					if(reqStatus==='NEW'){
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
					if(reqStatus==='NEW'){
						$("#save_item").removeClass('ui-state-disabled');
						$("#add_item").removeClass('ui-state-disabled');
					}else{
						$("#save_item").addClass('ui-state-disabled');
						$("#add_item").addClass('ui-state-disabled');
					}
	   	   		}
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

    $("#preq_item_grid").jqGrid('navGrid', '#preq_item_grid_pager', 
   	{ search: true, add: false, edit: false, del: false, editParams: poItemEditParams }
    );

    //$grid.jqGrid('inlineNav', '#preq_item_grid_pager', {addParams: {position: "last"}});
    
    $("#preq_item_grid").jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true, defaultSearch: "cn" });

    //$("#preq_item_grid").jqGrid('gridResize', { minWidth: 350, maxWidth: 1024, minHeight: 80, maxHeight: 800 });

    /*$("#preq_item_grid").jqGrid('navButtonAdd', '#preq_item_grid_pager', {
        caption: "Reorder Columns",
        title: "Reorder Columns",
        onClickButton: function () {
            $("#preq_item_grid").jqGrid('columnChooser');
        }
    });*/

    $("#preq_item_grid").jqGrid('navButtonAdd', '#preq_item_grid_pager', {
        caption: "Modifiy", buttonicon: "ui-icon-pencil",
        id:"modify_item",
        onClickButton: function () {
            if(lastsel2){
            	$('#preq_item_grid').jqGrid('editRow', lastsel2, poItemEditParams);
            	$("#ricancel").removeClass('ui-state-disabled');
            }
            /*
            var ids = $('#preq_item_grid').jqGrid('getDataIDs');
            for (var i = 0; i < ids.length + 1; i++) {
                //$('#preq_item_grid').jqGrid('editRow', ids[i], true);
                $('#preq_item_grid').jqGrid('editRow', ids[i], poItemEditParams);
            }
            */
        }
    });

    $("#preq_item_grid").jqGrid('navButtonAdd', '#preq_item_grid_pager', {
        caption: "Cancel",
        id: "ricancel",
        disabled: true,
        buttonicon: "ui-icon-cancel",
        onClickButton: function () {

        	if(lastsel2){
            	$("#preq_item_grid").restoreRow(lastsel2);
            	$("#ricancel").addClass('ui-state-disabled');
        	}

            var ids = $('#preq_item_grid').jqGrid('getDataIDs');
            for (var i = 0; i < ids.length + 1; i++) {
            	//rdata["isnewrow"] = 'Y';
            	//var rowData = jQuery('#preq_item_grid').jqGrid ('getRowData', ids[i]);
            	var isnewrow = jQuery('#preq_item_grid').jqGrid ('getCell', ids[i], 'isnewrow');
            	if(isnewrow === 'Y'){
            		$('#preq_item_grid').jqGrid('delRowData',ids[i]);
            		$("#ricancel").addClass('ui-state-disabled');
            	}else if (ids[i]){
            		$("#preq_item_grid").restoreRow(ids[i]);
            		$("#ricancel").addClass('ui-state-disabled');
                }
            }        	
        }
    }); 

    $("#ricancel").addClass('ui-state-disabled');
    
    $("#preq_item_grid").jqGrid('navButtonAdd', '#preq_item_grid_pager', {
        caption: "Save", buttonicon: "ui-icon-disk",id:"save_item",
        onClickButton: function () {
            var ids = $('#preq_item_grid').jqGrid('getDataIDs');
            for (var i = 0; i < ids.length + 1; i++) {
                /*	
               	var rowData = jQuery('#preq_item_grid').jqGrid ('getRowData', ids[i]);
            	var isnewrow = jQuery('#preq_item_grid').jqGrid ('getCell', ids[i], 'isnewrow');
            	if(isnewrow === 'Y'){
            		rowData["isnewrow"] = "";
            	}  
            	*/          	
            	//alert(isnewrow + ", " + rowData["isnewrow"]);                
            	$('#preq_item_grid').jqGrid('saveRow', ids[i], poItemEditParams);
            }
        }
    });

    $("#preq_item_grid").jqGrid('navButtonAdd', '#preq_item_grid_pager', {
        caption: "Add",
        id:"add_item",
        buttonicon: "ui-icon-plus",
        onClickButton: function () {
             $("#preq_item_grid").jqGrid('addRowData', "",{});
             $("#preq_item_grid").jqGrid('editRow', "", true);
             $("#ricancel").removeClass('ui-state-disabled');
        }
    });
    if($("#requisition\\.requisitionStatus\\.statusCode").val()!=='NEW'){
    	$("#add_item").addClass('ui-state-disabled');
    }

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
        
        i=getColumnIndexByName($grid,'unit_price_amount'); // nth-child need 1-based index so we use (i+1) below
        $("tbody > tr.jqgrow > td:nth-child("+(i+1)+")", $grid[0]).each(function() {
            totalAmount += Number(getTextFromCell(this));
        });

        i=getColumnIndexByName($grid,'quantity');
        $("tbody > tr.jqgrow > td:nth-child("+(i+1)+")", $grid[0]).each(function() {
        	totalQuantity += Number(getTextFromCell(this));
        });

        i=getColumnIndexByName($grid,'unit_price');
        $("tbody > tr.jqgrow > td:nth-child("+(i+1)+")", $grid[0]).each(function() {
        	totalUnitPrice += Number(getTextFromCell(this));
        });        

        $grid.jqGrid('footerData','set',{item_number:'TOTAL', unit_price:totalUnitPrice ,quantity:totalQuantity, unit_price_amount:totalAmount});
    };    

});    

var lastSelection;
function editRow(id){
	if(id && id !== lastSelection){
		var grid = $("#preq_item_grid");
		grid.restoreRpw(lastSelection);
		grid.editRow(id, true);
		lastSelection = id;
	}
}

$(window).resize(function () {
	// when the browser size changes so does the grid
    $("#preq_item_grid").jqGrid('setGridWidth', $('#jqGrid_preq_item_container').width(), false);
});

$(window).bind('resize', function() {
	//trick - make small
	$('#preq_item_grid').setGridWidth(100);
	
	var width = $('#jqGrid_preq_item_container').width();
    // Set grid width to .jqGrid_order_item_container and them go responsive
    $("#preq_item_grid").jqGrid('setGridWidth', width, false);
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
<div style="margin-bottom: 1.0em;" id="req_item_container">

	<div id="jqGrid_preq_item_container">
		<table id="preq_item_grid" class="scroll" cellpadding="0" cellspacing="0"></table> 
		<div id="preq_item_grid_pager" class="scroll" style="text-align:center;"></div>
	</div>

</div>
<!-- end widget div -->

</body>   
			
</html>	