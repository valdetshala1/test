function formatResult(item) {
	var markup = '<div class="row-fluid">' + '<div class="span10">'
				+ '<div class="row-fluid">'
				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
				+ item.name + '</div>' + '</div>';
	
	markup += '</div></div>';
	return markup;
}  

function showHistory(tableName, grid, rowId){
	var rowData=jQuery(grid).getRowData(rowId);
	var id=rowData.id;
	if(tableName==='PrivateActivity'){
		id=rowId;
	}
	var link = "Audit.auditData.do?entity_name="+tableName+"&entity_id=" +id;
	openDialogForm("auditPopup", link, "<s:text name='audit.title'/> !",900,500);	
}

function showAuditGeom(tableName, grid, rowId){
	var rowData=jQuery(grid).getRowData(rowId);
	var id= rowData.id;
	if(tableName==='Activity' || tableName==='ManagementUnitPeriod' || tableName==='PrivateActivity' ){
		id=rowId;
	}
	var link = "Audit.auditDataGeom.do?entity_name="+tableName+"&entity_id=" +id;
	openDialogForm("auditPopup", link, "<s:text name='audit.title'/> !",1000,600);	
}

function formatPerson(item) {
	var markup = '<div class="row-fluid">' + '<div class="span10">'
			+ '<div class="row-fluid">'
			+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
			+ item.firstName + " " + item.lastName + ", " + item.birthdate + '</div>'
			+ '</div>';

	if (item.address) {
		markup += '<div style="width: 100%; border: 1px coral solid; border-style: outset; margin: 0px 0px; padding: 2px 2px 2px 2px;">';
		markup += '<div><i class="fa fa-home"></i> ' + item.address.street + " " + item.address.homeNr + '</div>';
		markup += '<div>' + item.address.zipCode + " " + item.address.place + ", " + item.address.country +'</div>';
		markup += '<div><i class="fa fa-envelope-o"></i> ' + item.address.email + '</div>';
		markup += '<div><i class="fa fa-phone"></i> ' + item.address.phone + '</div>';
		markup += '<div><i class="fa fa-mobile"></i> ' + item.address.mobile + '</div>';
		markup += '</div>';
		
	}
	markup += '</div></div>';
	return markup;
}

function cellNullFormatter(cellValue, opts, rowObject) {
	if(cellValue == 'null' || cellValue===undefined){
		return "";
	}else{
		return cellValue;
	}
}

function amountFormatter(cellValue, opts, rowObject) {
	if(cellValue == 'null' || cellValue===undefined){
		return "";
	}else{
		return cellValue;
	}
}

function cellPercent(cellValue, opts, rowObject) {
	if(cellValue == 'null' || cellValue===undefined || cellValue == ''){
		return "";
	}else{	
		var cval = (cellValue*100);
		cval = (Math.round(cval * 100) / 100);		
		var showValue = cval + " &#37;";
		return showValue;
	}	
}

function f_percentage ( cellValue, options, rowObject ){
	if(cellValue == 'null' || cellValue===undefined || cellValue == ''){
		return "";
	}else{	
		var cval = (cellValue*100);
		cval = (Math.round(cval * 100) / 100);
		var showValue = cval + " %";
		return showValue;
	}
}

function percentage_revers ( cellValue, options, rowObject ){
	if(cellValue == 'null' || cellValue===undefined || cellValue == ''){
		return "";
	}else{	
		var cval = (Math.round(cellValue) / 100);
		var showValue = cval + " %";
		return showValue;
	}
}

function openBirtViewer(reportName, parameters){
	//var link = "frameset?__report="+reportName+"&__parameterpage=false&__title=KFIS Report Viewer&"+parameters;
	//var link = "run?__report="+reportName+"&__parameterpage=false&__title=KFIS Report Viewer&"+parameters;
	//var link = "preview?__report="+reportName+"&__parameterpage=false&__format=pdf&__title=KFIS Report Viewer&"+parameters;
	var link = "run?__report="+reportName+"&__parameterpage=false&__format=pdf&__title=KFIS Report Viewer&"+parameters;
	var win = window.open(link, '_blank');
	if(win){
	    win.focus();
	}else{
	    alert('Please allow popups for this site');
	}	
}
function createJsonForParams(parameters){
	var params=parameters.split("&");
	var jsonParmatext = '[';
	for (var i = 0; i < params.length; i++) {
			var param=params[i].split("=");
			if(param.length==2){
				jsonParmatext+='{ "param_name":"'+param[0]+'", "param_val":"'+param[1]+'" },';	
				}
		}
		if(params.length>0){
			jsonParmatext = jsonParmatext.substring(0, jsonParmatext.length - 1);
		}
		jsonParmatext+=']';
		return jsonParmatext;
}

function generateBIRTDoc(url){
//parse and delegation / call to 
//	window.location.href=url;
}

function generateJasperDoc(url){
	window.location.href=url;
}

function getFormattedDate(date) {
	  var year = date.getFullYear();
	  var month = (1 + date.getMonth()).toString();
	  month = month.length > 1 ? month : '0' + month;
	  var day = date.getDate().toString();
	  day = day.length > 1 ? day : '0' + day;
	  return year + '/' + month + '/' + day;
}

function openDialogForm(id, url, title, width, height){
	if(width=='undefined' || width==null){width = 530;}
	if(height=='undefined' || height==null){height = 600;}

	//dialog options
	var dialogOptions = {
		"title" : title,
		"width" : width,
		"height" : height,
		"modal" : true,
		"resizable" : true,
		"draggable" : true,
		"close" : function(){ $(this).remove(); }
	};
	
	// dialog-extend options, darkgreen, transparent
	var dialogExtendOptions = {
		"close" : false,
		"maximize" : true,
		"minimize" : true,
		"dblclick" : 'maximize',
		"titlebar" : "transparent"
	};
	
	$.ajax({
	   url: url,
	   cache: false,
	   beforeSend:function(jqXHR, settings) {
			//$('#ajaxBusy').show();
	   },	   
	   success: function(data){
			var dia = $("<div  id='tmp' />").dialog(dialogOptions).dialogExtend(dialogExtendOptions);
			$(dia).attr('id',  id);
			var number = 1 + Math.floor(Math.random() * 6);
			$(dia).attr('mytabid',  number);
			$('#tmp').attr('value', id);
			dia.html(data);
	   },
		complete:function(jqXHR, textStatus){
			//$('#ajaxBusy').hide();   
		}
	});
}

function openDialogForm2(id, url, title, width, height){
	//dialog options
	var dialogOptions = {
		"title" : "dialog@" + new Date().getTime(),
		"width" : 400,
		"height" : 300,
		"modal" : false,
		"resizable" : true,
		"close" : function(){ $(this).remove(); }
	};
	
	// dialog-extend options
	var dialogExtendOptions = {
		"close" : false,
		"maximize" : true,
		"minimize" : true,
		"dblclick" : 'maximize',
		"titlebar" : "transparent"
		/*

		"icons" : {
			  "close" : "ui-icon-circle-close",
			  "maximize" : "ui-icon-circle-plus",
			  "minimize" : "ui-icon-circle-minus",
			  "collapse" : "ui-icon-triangle-1-s",
			  "restore" : "ui-icon-bullet"
		}
		*/
	/*,
		"load" : function(evt, dlg){ alert(evt.type); }, // event
		"beforeCollapse" : function(evt, dlg){ alert(evt.type); }, // event
		"beforeMaximize" : function(evt, dlg){ alert(evt.type); }, // event
		"beforeMinimize" : function(evt, dlg){ alert(evt.type); }, // event
		"beforeRestore" : function(evt, dlg){ alert(evt.type); }, // event
		"collapse" : function(evt, dlg){ alert(evt.type); }, // event
		"maximize" : function(evt, dlg){ alert(evt.type); }, // event
		"minimize" : function(evt, dlg){ alert(evt.type); }, // event
		"restore" : function(evt, dlg){ alert(evt.type); } // event	
		*/
	};
	
	$("<div />").dialog(dialogOptions).dialogExtend(dialogExtendOptions);
}

function openDialogForm3(id, url, title, width, height){
	if(width=='undefined' || width==null){width = 530;}
	if(height=='undefined' || height==null){height = 600;}
	alert("ok");		
	$.ajax({
	   url: url,
	   cache: false,
	   beforeSend:function(jqXHR, settings) {
			//$('#ajaxBusy').show();
	   },	   
	   success: function(data){
			var dia = $('<div style="display:none" id="tmp"></div>').appendTo('body');
			$(dia).attr('id',  id);
			$('#tmp').attr('value', id);
			dia.html(data);
			//$(dia).find("span.ui-dialog-title").append(title);
			// open the dialog             
			dia.dialog({                 
				// add a close listener to prevent adding multiple divs to the document                 
				close: function(event, ui) {                     
					// remove div with all data and events                     
					dia.remove();                 
				},    
				autoOpen : true,
				resizable : true,
				title: title,
				width: width,	
				height: height,
				modal: true             
			});
	   },
		complete:function(jqXHR, textStatus){
			//$('#ajaxBusy').hide();   
		}
	});
}

//$.jgrid.formatter.integer.thousandsSeparator = '.';
//$.jgrid.formatter.integer.defaulValue=0;
//
//$.jgrid.formatter.number.thousandsSeparator = '.';
//$.jgrid.formatter.number.defaulValue=0.0;
//
//$.jgrid.formatter.currency.thousandsSeparator = '.';    
//$.jgrid.formatter.currency.decimalPlaces=2;
//$.jgrid.formatter.currency.defaulValue=0.00;

$.fn.fmatter.currency = function (cellval, opts) {
	if (typeof (cellval) === "undefined" || cellval == null || cellval == 'null') {
    	return '';
    }
    var op = $.extend({},opts.currency);
    if (typeof opts.colModel.formatoptions != "undefined") {
    	op = $.extend({},op,opts.colModel.formatoptions);
    }
    if(cellval == '') {
    	return op.defaultValue;
    }
    return $.fmatter.util.NumberFormat(cellval, op);
};

$.fn.fmatter.number = function (cellval, opts) {
	if (typeof (cellval) === "undefined" || cellval == null || cellval == 'null') {
    	return '';
    }		
	var op = $.extend({},opts.number);
	if(opts.colModel !== undefined && !$.fmatter.isUndefined(opts.colModel.formatoptions)) {
		op = $.extend({},op,opts.colModel.formatoptions);
	}
	if($.fmatter.isEmpty(cellval)) {
		return op.defaultValue;
	}
	return $.fmatter.util.NumberFormat(cellval,op);
};

$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
    _title: function(title) {
        if (!this.options.title ) {
            title.html("&#160;");
        } else {
            title.html(this.options.title);
        }
    }
}));

modifySearchingFilter = function (separator) {
    var i, l, rules, rule, parts, j, group, str,
        filters = $.parseJSON(this.p.postData.filters);
    alert(filters);
    if (filters && typeof filters.rules !== 'undefined' && filters.rules.length > 0) {
        rules = filters.rules;
        for (i = 0; i < rules.length; i++) {
            rule = rules[i];
            if (rule.op === 'cn') {
                // make modifications only for the 'contains' operation
                parts = rule.data.split(separator);
                if (parts.length > 1) {
                    if (typeof filters.groups === 'undefined') {
                        filters.groups = [];
                    }
                    group = {
                        groupOp: 'OR',
                        groups: [],
                        rules: []
                    };
                    filters.groups.push(group);
                    for (j = 0, l = parts.length; j < l; j++) {
                        str = parts[j];
                        if (str) {
                            // skip empty '', which exist in case of two separaters of once
                            group.rules.push({
                                data: parts[j],
                                op: rule.op,
                                field: rule.field
                            });
                        }
                    }
                    rules.splice(i, 1);
                    i--; // to skip i++
                }
            }
        }
        this.p.postData.filters = JSON.stringify(filters);
    }
};

function generateAttachment(url){
//	window.target='_blank';
//	window.location.href=url;
	window.open(url,'_blank');
};

String.prototype.replaceAll = function(search, replace){
    //if replace is null, return original string otherwise it will
    //replace search string with 'undefined'.
    if(!replace) 
        return this;

    return this.replace(new RegExp('[' + search + ']', 'g'), replace);
};

function printLayers(map,vectorLayer){
    var layers="";
	for(var i=0;i<map.layers.length;i++){   
    	if(map.layers[i].name!='OpenStreetMap' && map.layers[i].url && map.layers[i].visibility){
        	var layersAttr="";
        	var formatAttr="";
    		$.each(map.layers[i].params, function( index, value ) {
      		  if(index=='LAYERS')
      			layersAttr=value;
    			
      		  if(index=='FORMAT')
      			formatAttr=value;
      		});
    		layers +='{'+
    		'"baseURL" : "'+map.layers[i].url+'",'+
    		'"opacity" : 1,'+
    		'"singleTile" : false,'+
    		'"type" : "WMS",'+
    		'"layers" : ["'+layersAttr+'"],'+
    		'"format" : "'+formatAttr+'",'+
    		'"styles" : [""],'+
    		'"customParams" : {}'+
    		'},';
        }
	}
	layers += vectorLayers(vectorLayer);
	return layers;
  }


function printLayersName(map,vectorLayer){
	 var layers="";
		for(var i=0;i<map.layers.length;i++){ 
			if(map.layers[i].name!='OpenStreetMap' && map.layers[i].url && map.layers[i].visibility){
				var layersAttr="";
	        	var formatAttr="";
				$.each(map.layers[i].params, function( index, value ) {
		      		  if(index=='LAYERS'){
		      			layersAttr=value.split(":")[1]; 
		      			layers=layers+layersAttr+',';
		      		  }
		      	});
			}
		}
		return layers.substring(0,layers.length - 1);
}


function vectorLayers(vectorLayer){
    var vecFeat=vectorLayer.features;
    var vector="";
 	var candidates = OpenLayers.Array.filter(vecFeat, function(feature) {
        return true;
    });
    var candidate;
    if(candidates.length!=0){
    	vector += '{"type" : "Vector",'+
		'"styles" : {'+
			'"1" : {'+
				'"strokeColor" : "red",'+
				'"fillColor" : "red",'+
				'"fillOpacity" : 0.7,'+
				'"strokeWidth" : 2,'+
				'"pointRadius" : 12'+
			'}'+
		'},'+
		'"styleProperty" : "_gx_style",'+
		'"geoJson" : {'+
			'"type" : "FeatureCollection",'+
			'"features" : [';
	    }
    for (var i=0, ii=candidates.length; i<ii; ++i) {
        candidate = candidates[i];
        candidate.geometry.transform(
  			   new OpenLayers.Projection("EPSG:900913"),
  		       new OpenLayers.Projection("EPSG:900916")
  			   ); 
        var candidate_obj = wkt.write(candidate);
        var res = candidate_obj.split("((");

        var polygonCoords =(res[1]).split("))");
        var repl = "["+polygonCoords[0].replaceAll(",", "],[")+"]"; 
        repl = repl.replaceAll(" ", ","); 
		var geometry_type=res[0].substring(0,1)+(res[0].substring(1,res[0].length)).toLowerCase();
        vector +='{'+
			'"type" : "Feature",'+
			'"id" : "vectorFeature'+i+'",'+
			'"properties" : {'+
				'"_gx_style" : 1'+
			'},'+
			'"geometry" : {'+
				'"type" : "'+geometry_type+'",'+
				'"coordinates" : [['+repl+']]	'+
			'}'+
			'},';
        candidate.geometry.transform(
	  			   new OpenLayers.Projection("EPSG:900916"),
	  		       new OpenLayers.Projection("EPSG:900913")
	  			   ); 
    }
    if(candidates.length!=0){
		vector += ']},'+
			'"name" : "vector",'+
			'"opacity" : 1'+
			'}';
    }
    return vector;
}

function getCentre(map){
    var centreMap=map.getCenter();
	var lonLat = centreMap.transform(
			   new OpenLayers.Projection("EPSG:900913"),
		       new OpenLayers.Projection("EPSG:900916")
			   ); 
 	return lonLat;
   }

function generateAlfrescoDoc(url){
	window.location.href=url;
	}

function docGenDec(docUid,doc_name){
	$.ajax({
		data : "", 
		type : 'POST', // GET or POST
		url : 'AlfrescoConnValidate.do', 
		async : false,
		beforeSend : function(jqXHR, settings) {
		},
		error : function(errorThrown, status, jqXHR) { // on error..
			alert("error:" + errorThrown + ", status:" + status + ", jqXHR: " + jqXHR.response);
		},
		success : function(data, status, jqXHR) { // on success..
				var errors = jqXHR.getResponseHeader("errors_exits");
				var errors_alf = jqXHR.getResponseHeader("alfrescoError");
				if(errors_alf){
					$.smallBox({
						title : "Diçka shkoi jo mirë!!!",
						content : "Keni problem me serverin e Alfresco-s! Ju lutem kontaktoni shërbimin e IT-së që t'ju zgjidh problemin!!",
						color : "#c26565",
						timeout: 7000,
						icon : "fa fa-times-circle text-default error-icon-shadow",
						number : "2"
					});
				}else{
					var url="AlfrescoDocDownload.do?docUid="+docUid+"&name="+doc_name;
					generateAlfrescoDoc(url);
				}		 			
		},
		complete : function(jqXHR, textStatus) {
		}
	});	
}

function docsList(table_name,grid_name,entity_id){
	var link='AlfrescoDocs.docs_page.do?tabelName='+table_name+'&entityId='+entity_id;
	openDialogForm('docs_content',link,"Documents",'850','600');
}

function getFilesDataAlf(myFile){
	// 	alert(myFile.files.length);
		var names="";
		var exts="";
		for(var i=0;i<myFile.files.length;i++){
		    var file = myFile.files[i];  
		    var filename = file.name;
		    names+=""+filename;
		    var fileExt = filename.split('.').pop();
		    exts+=""+fileExt;
		}
		$("#docNameAlf").val(names);
		$("#docTypeAlf").val(exts);
	}


function exportShape(cqlFltName,cqlFltValue,layerName,layerFormat,layerFormatName){
	var url="ExportLayerSave.do?cqlFltName="+cqlFltName+"&cqlFltValue="+cqlFltValue+"&layerName="+layerName+"&layerFormat="+layerFormat+"&layerFormatName="+layerFormatName;
	window.open(url,' ');
}


function downloadDoc(action, json){
	 
	$("#generateReport").prop("disabled", true);
	var xhr = new XMLHttpRequest();
	xhr.open("POST", action, true);
	//xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.responseType = "blob";
	xhr.onload = function () {
	    if (this.status === 200) {

			var filename = '', disposition = xhr.getResponseHeader('Content-Disposition');
			
			if (disposition && disposition.indexOf('attachment') !== -1) {
			   var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/
			     , matches = filenameRegex.exec(disposition)
			
			   if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '')
			 }
   		  		    
	    	var file = window.URL.createObjectURL(this.response);
            var a = document.createElement("a");
            a.href = file;
            a.download = filename || "Document";
            document.body.appendChild(a);
            a.click();
            
            window.onfocus = function () {                     
              //document.body.removeChild(a)
            }
            
            $("#generateReport").prop("disabled", false);
	    }
	};
	
	//xhr.send(JSON.stringify(data));
	xhr.send(json);
}



function QueryStringToJSON() {            
    var pairs = location.search.slice(1).split('&');
    
    var result = {};
    pairs.forEach(function(pair) {
        pair = pair.split('=');
        result[pair[0]] = decodeURIComponent(pair[1] || '');
    });

    return JSON.parse(JSON.stringify(result));
}

function getJsonFromUrl(url) {
	var query = url.split('?')[1];
	  
	var result = {};
	query.split("&").forEach(function(part) {
	    var item = part.split("=");
	    result[item[0]] = decodeURIComponent(item[1]);
	});

	return JSON.parse(JSON.stringify(result));
}
