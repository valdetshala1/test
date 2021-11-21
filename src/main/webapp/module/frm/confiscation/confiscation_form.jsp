<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<jsp:include page="../../base/validation.jsp"></jsp:include>	
<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="confiscation_form" class="form-horizontal" action="ConfiscationSave.do" accept-charset="utf8" method="post">
			<input id="confiscation.id" name="confiscation.id" value="<s:property value='confiscation.id'/>" type="hidden">
			<input id="confiscation.employee.id" name="confiscation.employee.id" value="<s:property value='confiscation.employee.id'/>" type="hidden">
			<input id="confiscation.createdDate" name="confiscation.createdDate" value="<s:property value='confiscation.createdDate'/>" type="hidden">	
			<input id="confiscation.type"  value="<s:property value='confiscation.type'/>" type="hidden">	
			<legend><s:text name="confiscation.report.type.view"/></legend>
			
			<div class="form-group">
				<s:if test="fieldErrors.get('confiscation.type')!=null">
					<div class="has-error">
						<div class="col-md-10" style=" padding-left:20%;">
							<label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="confType" id="forConfiscation" value="CO"/>
								<span><s:text name="frm.confiscation.for.confiscation"/></span>
							</label>
							<label class="radio radio-inline"> <input type="radio"
								class="radiobox" name="confType" id="forSale" value="SA"/>
								<span><s:text name="frm.confiscation.for.sale"/></span>
							</label>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('confiscation.type')"/> </span>
						</div>
					</div>		
				</s:if>
				<s:else>
					<div class="col-md-10" style="padding-left: 20%;">
						<label class="radio radio-inline"> <input type="radio"
							class="radiobox" name="confType" id="forConfiscation" value="CO"/>
							<span><s:text name="frm.confiscation.for.confiscation"/></span>
						</label>
						<label class="radio radio-inline"> <input type="radio"
							class="radiobox" name="confType" id="forSale" value="SO"/>
							<span><s:text name="frm.confiscation.for.sale"/></span>
						</label>
					</div>
				</s:else>

			</div>
			
			<div class="form-group">
					<!-- START confiscation.cadastralMunicipality -->
					<s:if test="fieldErrors.get('confiscation.cadastralMunicipality')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="frm.inspection.cadastralMunicipality.name"/>:</label>
							<div class="col-md-4">
								<input  id="confiscation.cadastralMunicipality.name" name="confiscation.cadastralMunicipality.name" class="form-control" type="text">
								<input  id="confiscation.cadastralMunicipality.id" name="confiscation.cadastralMunicipality.id" type="hidden">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('confiscation.cadastralMunicipality')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="frm.inspection.cadastralMunicipality.name"/>:</label>
							<div class="col-md-4">
								<input id="confiscation.cadastralMunicipality.name" name="confiscation.cadastralMunicipality.name" value="<s:property value='confiscation.cadastralMunicipality.name'/>" class="form-control" type="text">
								<input  id="confiscation.cadastralMunicipality.id" name="confiscation.cadastralMunicipality.id" value="<s:property value='confiscation.cadastralMunicipality.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
					<!-- END confiscation.cadastralMunicipality -->
			</div>
				
			<div class="form-group">
					<!-- START confiscation.confiscationDate -->
					<s:if test="fieldErrors.get('confiscation.confiscationDate')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="frm.confiscaation.date"/>:</label>
							<div class="col-md-4">
								<input  id="confiscation.confiscationDate" name="confiscation.confiscationDate" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('confiscation.confiscationDate')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="">
							<label class="col-md-2 control-label">*<s:text name="frm.confiscaation.date"/>:</label>
							<div class="col-md-4">
								<input id="confiscation.confiscationDate" name="confiscation.confiscationDate" value="<s:property value='confiscation.confiscationDate'/>" class="form-control" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END confiscation.confiscationDate-->
			</div>
							
			<div class="row">
					<div class="form-group">
					<s:if test="fieldErrors.get('confiscation.confiscationDetail')!=null">
						<div class="has-error">
							<label class="col-md-2 control-label">*<s:text name="frm.confiscation.details"/>:</label>
						    <div id="jqGrid_confiscationDetail_container" class="col-md-6">
						    	<table id="confiscation_detail" class="scroll" cellpadding="0" cellspacing="0"></table> 
								<div id="confiscation_pager" class="scroll" style="text-align:center;"></div>
						    </div>
						   <span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('confiscation.confiscationDetail')"/> </span>
					    </div>
					</s:if>
					<s:else>
							<label class="col-md-2 control-label">*<s:text name="frm.confiscation.details"/>:</label>
						    <div id="jqGrid_confiscationDetail_container" class="col-md-6">
						    	<table id="confiscation_detail" class="scroll" cellpadding="0" cellspacing="0"></table> 
								<div id="confiscation_pager" class="scroll" style="text-align:center;"></div>
						    </div>
					
					</s:else>
				 	</div>
				</div>
				<div class="row">
				  <!-- START confiscation.remarks -->
					<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/>:</label>
			 	  	<div class="col-md-4">
			      		<textarea id="confiscation.remarks" name="confiscation.remarks" class="form-control" ><s:property value='confiscation.remarks'/></textarea>
			      	</div> 
				  <!-- END fire.comment -->
				</div>
				<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFR" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFR" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>
		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
		
<script type="text/javascript">
	function isNumber(element){
		$(element).keyup(function(){
	        var val1 = element.value;
	        var num = new Number(val1);
	        if(isNaN(num))
	        {this.value="";alert("Please enter a valid number");}
	    });	
	}
	$(document).ready(function () {
		
		if($("#confiscation\\.type").val()=='CO'){
			$("#forConfiscation").attr('checked', 'checked');
		}else if($("#confiscation\\.type").val()=='SA'){
			$("#forSale").attr('checked', 'checked');
		}	
		
	    $('#confiscation\\.confiscationDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});
		$("#confiscation\\.cadastralMunicipality\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.municipality.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	name_startsWith: term,
		        	//region_id: $("#fire\\.region\\.id").val(), 
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
            formatResult : formatResult,
            formatSelection: function(item){
                if(item.id){
	            	$("#confiscation\\.cadastralMunicipality\\.id").val(item.id);
	            	$("#confiscation\\.cadastralMunicipality\\.name").val(item.name);
                }
	            return item.name;
	        },	        
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 
	    if("<s:property value='confiscation.cadastralMunicipality.id'/>"){
			var mun_name=$("#confiscation\\.cadastralMunicipality\\.name").val();
			$("#confiscation\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='confiscation.cadastralMunicipality.id'/>", name:mun_name});
	    }

		var lastSel = 0;
		var rowId = 0;
	    var confiscation_detail = $("#confiscation_detail");
        confiscation_detail.jqGrid({
        	   url:'FrmGrid.confiscationDetail.do?confiscationId='+$("#confiscation\\.id").val(),	
               datatype: "json",
          	 	jsonReader : {
 			      root:"rows",
 			      page: "page",
 			      total: "total",
 			      records: "records",
 			      repeatitems: false,
 			      id: "0"
      			},
               colNames:['confiscation_id',
                         'confiscation_detail_id',
                         '<s:text name="annu.seedling.label.tree.species"/>',
                         '<s:text name="annu.seedling.label.tree.species"/>  (LA)',
                         'tree_species_id', 
                         '<s:text name="frm.harvest.planning.pl.tech.volume"/>',
                         '<s:text name="frm.harvest.planning.pl.fire.volume"/>',
                         '<s:text name="frm.private.request.pulp.volume"/>',
                         '<s:text name="law.suit.label.is.new"/>'],
	       	   colModel:[
// 					{name:'id',index:'id', width:'100%', hidden:false, editable:false},	
					{name:'confiscation_id',index:'confiscation_id', width:'100%', hidden:true, editable:false},
					{name:'confiscation_detail_id',index:'confiscation_detail_id', width:'100%', hidden:true, editable:false},
					{name: 'tree_species', index: 'tree_species', width: '100%', align: 'left', editable: true,
						editoptions:{
					        dataInit:function(el){ 
					    	    $(el).select2({
					    			placeholder: '-- Select --',                	        
					    	        minimumInputLength: 0,
					    	        ajax: {
					    		        url: "Input.treeSpecies.do",
					    		        dataType: 'json',
					    		        quietMillis: 150,
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
					                    var ids = confiscation_detail.jqGrid('getDataIDs');
					                    for (var i = 0; i < ids.length + 1; i++) {
					                    	$('#' + ids[i] + '_tree_species_id').val(item.id);
					                    	$('#' + ids[i] + '_tree_species_la').val(item.name_la);
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
					{name: 'tree_species_la', index: 'tree_species_la', width: '100%', align: 'left', editable: true, editoptions: { readonly: "readonly" }},
	       	   		{name:'tree_species_id',index:'tree_species_id', width:'100%', editable:true,hidden:true},
	       	   		{name:'tree_tech_volume',index:'tree_tech_volume', width:'100%', editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	       	   		{name:'tree_fire_volume',index :'tree_fire_volume', width:'100%', align:"right", editable:true,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	       	   		{name:'total_volume',index :'total_volume', width:'100%', align:"right", editable:true,editoptions: { readonly: "readonly" }},
	       	  	 	{name:'isnew',index:'isnew', width:'100%', hidden:true, editable:false},
	       	   	],
               sortname: "id",
               rowNum:10,
       	   	   rowList:[10,20,30],
               viewrecords: true,
               sortorder: "asc",
               width: '100%',
               height: '100%',
               autowidth: true,
       		   shrinkToFit: true,
       		   gridview: true,
               headertitles: true,
               loadonce: true,
               rowEdit: true,   
               rowsubmit: 'clientArray',
               cellsubmit : 'clientArray',
               cmTemplate: {sortable:false},
               editurl: 'clientArray',                           
               pager: "#confiscation_pager",
               loadtext:'Loading, please wait',
               add:true,
               keys : true, 
               ajaxGridOptions: { contentType: "application/json"},
               serializeGridData: function (data) {
                   //alert($.toJSON(data));
//                    return JSON.stringify(damageArray);
                   //return $.toJSON(data);
               },
               loadBeforeSend: function (xhr, settings) {
                   if(!$("#confiscation\\.id").val()){
	            	   this.p.loadBeforeSend = null; //remove event handler
	            	   return false; // dont send load data request
                   }
            	},
               gridComplete: function () {
               },
               afterSaveCell: function (rowid, name, val, iRow, iCol) {
               },
               oneditfunc: function() {
               },
               onSelectRow: function(id){
                  
            	   if (id && id !== lastSel) {
                       $("#confiscation_detail").jqGrid('restoreRow', lastSel); 
                       $("#confiscation_detail").jqGrid('saveRow', id);
                       $("#confiscation_detail").editRow(id, true);
                   } else {
                	   $("#confiscation_detail").jqGrid('restoreRow', lastSel); 
                	   $("#confiscation_detail").editRow(id, true);
                   }
            	   lastSel = id;
      
               }
               
           }).navGrid('#confiscation_pager',{edit:false,add:false,del:false,search:false})
          	.navButtonAdd('#confiscation_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.add"/>", 
            	   buttonicon:"ui-icon-plus", 
            	   onClickButton: function(){ 
            		   $("#confiscation_detail").jqGrid('saveRow', rowId);
            		   rowId++;
            		   var parameters =
                       {
                           rowID: rowId,
                           initdata: {
                               id: rowId,
                        	   woodType: "",
                        	   timberNumber: "",
                        	   lawsuit_id:"",
                        	   isnew:"true"
                               //IdField: $('#IdField').val(),
                               //Description: $('#IdField option:selected').text()
                           },
                           position: "last",
                           useDefValues: true,
                           useFormatter: false,
                           addRowParams: { extraparam: {} }
                       };

                   $("#confiscation_detail").jqGrid('addRow', parameters);
            	   }, 
            	   position:"last"
            })           
          	.navButtonAdd('#confiscation_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.save"/>", 
            	   buttonicon:"ui-icon-disk", 
            	   onClickButton: function(){ 
            		   var selr = jQuery('#confiscation_detail').jqGrid('getGridParam','selrow'); 
            		   $("#confiscation_detail").jqGrid('saveRow', selr);
            		   var tech_volume=jQuery('#confiscation_detail').jqGrid ('getCell', rowId, 'tree_tech_volume');
            		   var fire_volume=jQuery('#confiscation_detail').jqGrid ('getCell', rowId, 'tree_fire_volume');
            		   if(tech_volume=='')
            			   tech_volume=0;
        			   if(fire_volume==''){
        				   fire_volume=0;
            			   }
        				 
    				   
            		   var volume_total=parseFloat(tech_volume)+parseFloat(fire_volume);
            		   jQuery('#confiscation_detail').jqGrid('setCell', rowId, 'total_volume', volume_total);
            		   $("#confiscation_detail").jqGrid('saveRow', selr);
            	   }, 
            	   position:"last"
            	})
          	.navButtonAdd('#confiscation_pager',{
            	   caption:"", 
            	   title:"<s:text name="label.button.delete"/>", 
            	   buttonicon:"ui-icon-trash", 
            	   onClickButton: function(){ 
            		   var selr = jQuery('#confiscation_detail').jqGrid('getGridParam','selrow'); 
            		   if(selr){
            		   		$('#confiscation_detail').jqGrid('delRowData', selr);
            		   }
            	   }, 
            	   position:"last"
            	});            	
        $("#confiscation_detail").jqGrid('navGrid','#confiscation_pager',{},{width:1000});
        // $("#confiscation_detail").jqGrid('editGridRow',"new",{height:280,reloadAfterSubmit:false});
	        $(window).bind('resize', function() {
	            var width = $('#jqGrid_confiscationDetail_container').width();
	            $('#confiscation_detail').setGridWidth(width);
	     });
		$("#cancelFR").on('click', function () {
			$.ajax({
				type : "GET",
				url : "Confiscation.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#confiscation_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						//timeout: 6000,
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});			
			return false;        
		});
		$("#saveFR").on('click', function () {
			var this_form =$("#confiscation_form");
			var ids = $('#confiscation_detail').jqGrid('getDataIDs');
			for (var i = 0; i < ids.length+1; i++) {
			  $("#confiscation_detail").jqGrid('saveRow', ids[i]);
			}
			var confiscationArray = $("#confiscation_detail").jqGrid('getRowData');
			var jsonText = JSON.stringify(confiscationArray);
			$('<input>').attr({
				type : 'hidden',
				name : "jsonConfDetail",
				value : jsonText
			}).appendTo(this_form);	
			$("#confiscation_form :button").prop('disabled','disabled');
			$('#confiscation_form').submit();
			return false;
		});
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					$("#confiscation_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#confiscation_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#confiscation_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}	    	
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});				
			$("#confiscation_form :button").prop('disabled',false);	
		})();
	});            
</script>