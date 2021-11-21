<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<div>
	<div class="widget-body">
		<form id="request_form" class="form-horizontal" action="RequestSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="leaseRequest.id" name="leaseRequest.id" value="<s:property value='leaseRequest.id'/>" type="hidden">
			    <input id="periodType" name="periodType" value="<s:property value='periodType'/>" type="hidden">
				<input id="periodPrice" name="periodPrice" value="<s:property value='periodPrice'/>" type="hidden">
			
				<input id="geometry" name="geometry" value="<s:property value='geometry'/>" type="hidden">
				
				<div class="form-group">
			   		<label class="col-md-2 control-label">*<s:text name='frm.private.request.requester'/>:</label>
			        <div class="col-md-10">
			      	
						<label class="radio radio-inline" id="domButton">
							<input type="radio" class="radiobox" name="requester" id="c" value='C' /> 
							<span>Kompani</span>
						</label>
					
						 <label class="radio radio-inline" id="impButton"> 
						 	<input type="radio" class="radiobox" name="requester" id="p" value="P"  />
							<span>Person</span>
						</label>
						
					</div>
			     </div>
			     
			     
				<!-- START leaseRequest.personByPersonId -->
				<div id="person">
				<s:if test="fieldErrors.get('leaseRequest.personByPersonId.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='law.suit.grid.person'/>:</label>
							<div class="col-md-10">
								<input id="leaseRequest.personByPersonId.firstName" name="leaseRequest.personByPersonId.firstName" class="form-control" placeholder="<s:text name='placeholder.enter.mun.firstName'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaseRequest.personByPersonId.id')"/> </span>
								<input id="leaseRequest.personByPersonId.id" name="leaseRequest.personByPersonId.id" value="<s:property value='leaseRequest.personByPersonId.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='law.suit.grid.person'/>:</label>
							<div class="col-md-10">
								<input id="leaseRequest.personByPersonId.firstName" name="leaseRequest.personByPersonId.firstName" class="form-control" value="<s:property value='leaseRequest.personByPersonId.firstName'/>" type="text">
								<input id="leaseRequest.personByPersonId.id" name="leaseRequest.personByPersonId.id" value="<s:property value='leaseRequest.personByPersonId.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				</div>
				<!-- END leaseRequest.personByPersonId -->
				
				<!-- START leaseRequest.contractor -->
				<div id="company">
				<s:if test="fieldErrors.get('leaseRequest.contractor.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='fal.request.company.input'/>:</label>
							<div class="col-md-10">
								<input id="leaseRequest.contractor.comopanyName" name="leaseRequest.contractor.comopanyName" class="form-control" placeholder="<s:text name='placeholder.enter.mun.firstName'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaseRequest.contractor.id')"/> </span>
								<input id="leaseRequest.contractor.id" name="leaseRequest.contractor.id" value="<s:property value='leaseRequest.contractor.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='fal.request.company.input'/>:</label>
							<div class="col-md-10">
								<input id="leaseRequest.contractor.comopanyName" name="leaseRequest.contractor.comopanyName" class="form-control" value="<s:property value='leaseRequest.contractor.comopanyName'/>" type="text">
								<input id="leaseRequest.contractor.id" name="leaseRequest.contractor.id" value="<s:property value='leaseRequest.contractor.id'/>" type="hidden">
							</div>									
						</div>
				</s:else>
				</div>
				<!-- END leaseRequest.contractor -->
				
				
				<!-- START leaseRequest.startLease -->
				<s:if test="fieldErrors.get('leaseRequest.startLease')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.start.date'/>:</label>
							<div class="col-md-10">
								<input type="text" class="form-control input-xs-g" id="leaseRequest.startLease" name="leaseRequest.startLease" >
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaseRequest.startLease')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.start.date'/>:</label>
							<div class="col-md-10">
								<input type="text" class="form-control input-xs-g" id="leaseRequest.startLease" name="leaseRequest.startLease" value="<s:property value='leaseRequest.startLease'/>" >
							</div>									
						</div>
				</s:else>
				<!-- END leaseRequest.startLease -->
				
				<!-- START leaseRequest.endLease -->
				<s:if test="fieldErrors.get('leaseRequest.endLease')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.end.date'/>:</label>
							<div class="col-md-10">
								<input type="text" class="form-control input-xs-g" id="leaseRequest.startLease" name="leaseRequest.endLease" >
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaseRequest.endLease')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='hrm.skill.label.end.date'/>:</label>
							<div class="col-md-10">
								<input type="text" class="form-control input-xs-g" id="leaseRequest.endLease" name="leaseRequest.endLease" value="<s:property value='leaseRequest.endLease'/>" >
							</div>									
						</div>
				</s:else>
				<!-- END leaseRequest.contractor -->
				 
				<!-- START leaseRequest.requestType -->
				<div id="person">
				<s:if test="fieldErrors.get('leaseRequest.requestType.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='fal.request.requesttype.form'/>:</label>
							<div class="col-md-10">
								<input id="requestType" name="requestType" class="form-control" placeholder="<s:text name='requestType'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaseRequest.requestType.id')"/> </span>
								<input id="leaseRequest.requestType.id" name="leaseRequest.requestType.id" value="<s:property value='leaseRequest.requestType.id'/>" type="hidden">
								<input id="leaseRequest.requestType.nameEn" name="leaseRequest.requestType.nameEn" value="<s:property value='leaseRequest.requestType.nameEn'/>" type="hidden">
								<input id="leaseRequest.requestType.nameAl" name="leaseRequest.requestType.nameAl" value="<s:property value='leaseRequest.requestType.nameAl'/>" type="hidden">
								<input id="leaseRequest.requestType.nameSr" name="leaseRequest.requestType.nameSr" value="<s:property value='leaseRequest.requestType.nameSr'/>" type="hidden">
							
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='fal.request.requesttype.form'/>:</label>
							<div class="col-md-10">
								<input id="leaseRequest.requestType.id" name="leaseRequest.requestType.id" value="<s:property value='leaseRequest.requestType.id'/>" type="hidden">
								<input id="requestType" name="requestType" class="form-control" value="<s:property value='requestType'/>" type="text">
								<input id="leaseRequest.requestType.nameEn" name="leaseRequest.requestType.nameEn" value="<s:property value='leaseRequest.requestType.nameEn'/>" type="hidden">
								<input id="leaseRequest.requestType.nameAl" name="leaseRequest.requestType.nameAl" value="<s:property value='leaseRequest.requestType.nameAl'/>" type="hidden">
								<input id="leaseRequest.requestType.nameSr" name="leaseRequest.requestType.nameSr" value="<s:property value='leaseRequest.requestType.nameSr'/>" type="hidden">
							
							</div>									
						</div>
					</s:else>
				</div>
				
				<div class="alert alert-info fade in">
				<strong><div id="destination_text"></div></strong> 
			   </div>
				<!-- END leaseRequest.requestType -->
				<div class="row">
					<article class="col-sm-12 col-md-12 col-lg-6">
						<!-- END leaseRequest.price -->
						<s:if test="fieldErrors.get('leaseRequest.price')!=null">
								<div class="form-group has-error">
									<label class="col-md-4 control-label">*<s:text name='finance.contract.cost'/>:</label>
									<div class="col-md-8">
										<input id="leaseRequest.price" name="leaseRequest.price" class="form-control" type="text"  readonly="readonly">
										<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaseRequest.price')"/> </span>
									</div>					
								</div>
							</s:if>
							<s:else>
								<div class="form-group">
									<label class="col-md-4 control-label">*<s:text name='finance.contract.cost'/>:</label>
									<div class="col-md-8">
										<input id="leaseRequest.price" name="leaseRequest.price" class="form-control" value="<s:property value='leaseRequest.price'/>" type="text"  readonly="readonly">
									</div>									
								</div>
							</s:else>
						<!-- END leaseRequest.price -->
					</article>
					<article class="col-sm-12 col-md-12 col-lg-6">
						<!-- END leaseRequest.area -->
						<s:if test="fieldErrors.get('leaseRequest.area')!=null">
							<div class="form-group has-error">
								<label class="col-md-4 control-label">*<s:text name='annu.mgmt.unit.label.area.ha'/>:</label>
								<div class="col-md-8">
									<input id="leaseRequest.area" name="leaseRequest.area" class="form-control" type="text"  readonly="readonly">
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaseRequest.area')"/> </span>
								</div>					
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<label class="col-md-4 control-label">*<s:text name='annu.mgmt.unit.label.area.ha'/>:</label>
								<div class="col-md-8">
									<input id="leaseRequest.area" name="leaseRequest.area" class="form-control" value="<s:property value='leaseRequest.area'/>" type="text"  readonly="readonly">
								</div>									
							</div>
						</s:else>
						<!-- END leaseRequest.area -->
					</article>
				</div>
				<!-- START attachment -->
				<input type="hidden" id="docNames" name="docNames" value="<s:property value="docNames"/>">
				<input type="hidden" id="docExts" name="docExts" value="<s:property value="docExts"/>">
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name='law.suit.label.attachement'/>:</label>
					<div class="col-md-10">
						<input id="file" name="file" type="file" class="btn btn-default btn-file" multiple onchange="getFileData(this);">
					</div>									
				</div>
				<!-- END attachment -->
				
				<!-- widget div-->
				<div style="margin-bottom: 1.0em;">
					<div id="jqGrid_requestcoord_container">
						<table id="request_coord_grid" class="scroll"></table> 
						<div id="request_coord_grid_pager" class="scroll" style="text-align:center;"></div>
					</div>
					<s:if test="fieldErrors.get('coords')!=null">
						<div class="form-group has-error">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('coords')"/> </span>
						</div>
					</s:if>
				</div>
				<!-- end widget div -->
			</fieldset>
			<div id="approve_reject_butt" style="margin-left: 18%;">
					<button id="approveRequest" class="btn btn-default" type="submit" style="background: rgb(152, 167, 230) none repeat scroll 0% 0%;">
						Aprovo
					</button>
					<button id="rejectRequest" class="btn btn-default" type="button" style="background: rgb(233, 109, 109) none repeat scroll 0% 0%;">
						Refuzo
					</button>
			</div>
			<div id="request_buttons">
				<footer class="form-actions" id="leaseRequest-button">
					<button id="cancelRequest" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
					<button id="saveRequest" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				</footer>
			</div>
			
		</form>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reqId").val($("#leaseRequest\\.id").val());
		var status='<s:property value="leaseRequest.requestStatus.status.DOMKEY"/>';
		if($("#leaseRequest\\.id").val()){
        		$("#saveRequest").hide();
        		if(status=='NEW'){
        			$("#approve_reject_butt").show();
        		}else{
        			$("#approve_reject_butt").hide();
            		}
			}else{
				$("#saveRequest").show();
        		$("#approve_reject_butt").hide();
				}
		$("#approveRequest").on('click', function() {
			var link="Request.appRejPopup.do?requestId="+$("#leaseRequest\\.id").val()+"&approvedRejected=approved";
			openDialogForm('app_rej_popup_content',link,'Aprovo!',500,300);
			return false;
		});
		
		$("#rejectRequest").on('click', function() {
			var link="Request.appRejPopup.do?requestId="+$("#leaseRequest\\.id").val()+"&approvedRejected=rejected";
			openDialogForm('app_rej_popup_content',link,'Refuzo!',500,300);
			return false;
		});
		//appRejPopup
		$("#cancelRequest").on('click', function() {
			loadURL("Request.form.do",$("#request_form_content"));
			return false;
		});
		
		$("#saveRequest").on('click', function() {
			var selr = jQuery('#request_coord_grid').jqGrid('getGridParam','selrow'); 
 		   	$("#request_coord_grid").jqGrid('saveRow', selr);
 		   	
			var thisForm = $("#request_form");
			var reqArray = $("#request_coord_grid").jqGrid('getRowData');
			var jsonText = JSON.stringify(reqArray);
			$('<input>').attr({
				type : 'hidden',
				name : "jsonDetails",
				value : jsonText
			}).appendTo(thisForm);

			$('#request_form').submit();
			return false;
		});
		
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#request_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(errors){
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});						
					}else{
						jQuery("#request_grid").trigger("reloadGrid");
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
					} 	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();
		
		if($("#leaseRequest\\.personByPersonId\\.id").val()){
			jQuery("#p").attr('checked', true);
			$("#company").hide();
			$("#person").show();
			}else if($("#leaseRequest\\.contractor\\.id").val()){
				jQuery("#c").attr('checked', true);
				$("#company").show();
				$("#person").hide();
				}else if(!$("#leaseRequest\\.id").val()){
					jQuery("#p").attr('checked', true);
					$("#company").hide();
					$("#person").show();
				}

		if($("#requester").val()=="C"){
			jQuery("#c").attr('checked', true);
			$("#company").show();
			$("#person").hide();
		}else if($("#requester").val()=="P"){
			jQuery("#p").attr('checked', true);
			$("#company").hide();
			$("#person").show();
			}
		
		$("#c").on('click',function(event){
			$("#company").show();
			$("#person").hide();
			$("#leaseRequest\\.personByPersonId\\.firstName").select2("data", {id: null, name: ""});
			});
		
		$("#p").on('click', function(event){
			$("#company").hide();
			$("#person").show();
			$("#leaseRequest\\.personByPersonId\\.comopanyName").select2("data", {id: null, name: ""});
			});
		
		$("#leaseRequest\\.personByPersonId\\.firstName").select2({
		    placeholder: "Search for a repository",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.person.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12, 
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
		    formatResult: formatResult,
		    formatSelection: function(item) {
		    	$("#leaseRequest\\.personByPersonId\\.firstName").val(item.name);
		    	$("#leaseRequest\\.personByPersonId\\.id").val(item.id);
		        return item.name;
		    },
		    allowClear: true,
		    dropdownCssClass: "bigdrop",
		    escapeMarkup: function (m) { return m; }
		}); 

		$("#leaseRequest\\.personByPersonId\\.firstName").select2("data", {id: "<s:property value='leaseRequest.personByPersonId.id'/>", name: "<s:property value='leaseRequest.personByPersonId.firstName'/>"});

		$("#leaseRequest\\.contractor\\.comopanyName").select2({
		    placeholder: "Search for a repository",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.contractor.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12, 
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
		    formatResult: formatResult,
		    formatSelection: function(item) {
		    	$("#leaseRequest\\.contractor\\.comopanyName").val(item.name);
		    	$("#leaseRequest\\.contractor\\.id").val(item.id);
		        return item.name;
		    },
		    allowClear: true,
		    dropdownCssClass: "bigdrop",
		    escapeMarkup: function (m) { return m; }
		}); 

		$("#leaseRequest\\.contractor\\.comopanyName").select2("data", {id: "<s:property value='leaseRequest.contractor.id'/>", name: "<s:property value='leaseRequest.contractor.comopanyName'/>"});
		var destination_text='';
	
		$("#requestType").select2({
		    placeholder: "Search for a repository",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.requestType.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12, 
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
		    formatResult: formatResult,
		    formatSelection: function(item) {
		    	$("#requestType").val(item.name);
		    	$("#leaseRequest\\.requestType\\.nameAl").val(item.name);
		    	$("#leaseRequest\\.requestType\\.nameEn").val(item.name);
		    	$("#leaseRequest\\.requestType\\.nameSr").val(item.name);
		    	$("#leaseRequest\\.requestType\\.id").val(item.id);
			    	if(item.price){
				    	$("#periodType").val(item.period_type);
				    	$("#periodPrice").val(item.price);
			    	}
		    	if($("#leaseRequest\\.area").val())
			    	calcPrice($('#leaseRequest\\.startLease').val(), $('#leaseRequest\\.endLease').val(), $("#leaseRequest\\.requestType\\.id").val(),$("#leaseRequest\\.area").val());
		    	if($("#periodPrice").val())
		    		destination_text='<s:text name='frm.lease.request.requester.price.per.hectar'/>: '+$("#periodPrice").val()+' euro'+' per '+$("#periodType").val();
				if($("#leaseRequest\\.requestType\\.id").val())
		    		$("#destination_text").text(destination_text);
			   return item.name;
		    },
		    allowClear: true,
		    dropdownCssClass: "bigdrop",
		    escapeMarkup: function (m) { return m; }
		}); 
		var lang='<s:property value="locale.language"/>';
		if(lang=='al'){
			$("#requestType").select2("data", {id: "<s:property value='leaseRequest.requestType.id'/>", name: "<s:property value='leaseRequest.requestType.nameAl'/>"});
			
			}else if(lang=='sr')
			$("#requestType").select2("data", {id: "<s:property value='leaseRequest.requestType.id'/>", name: "<s:property value='leaseRequest.requestType.nameSr'/>"});
		else
			$("#requestType").select2("data", {id: "<s:property value='leaseRequest.requestType.id'/>", name: "<s:property value='leaseRequest.requestType.nameEn'/>"});

		if($("#leaseRequest\\.requestType\\.id").val()){
    		destination_text='<s:text name='frm.lease.request.requester.price.per.hectar'/>: '+$("#periodPrice").val()+' euro'+' per '+$("#periodType").val();
	    	$("#destination_text").text(destination_text);
	    	
	    }
		
		$('#leaseRequest\\.startLease').datetimepicker({
			lang: 'al',
			format: 'm.d.Y',
			mask: false,
			formatDate:'m.d.Y',
			timepicker: false,
			sideBySide: false,
		});
		
		$('#leaseRequest\\.endLease').datetimepicker({
			lang: 'al',
			format: 'm.d.Y',
			mask: false,
			formatDate:'m.d.Y',
			timepicker: false,
			sideBySide: false,
		});
    	$( "#leaseRequest\\.startLease" ).change(function() {
          calcPrice($('#leaseRequest\\.startLease').val(), $('#leaseRequest\\.endLease').val(), $("#leaseRequest\\.requestType\\.id").val(),$("#leaseRequest\\.area").val());
  		});
    	
    	$( "#leaseRequest\\.endLease" ).change(function() {
        	calcPrice($('#leaseRequest\\.startLease').val(), $('#leaseRequest\\.endLease').val(), $("#leaseRequest\\.requestType\\.id").val(),$("#leaseRequest\\.area").val());
    	});

		 function isNumber(element){
	        	$(element).keyup(function(){
	                var val1 = element.value;
	                var num = new Number(val1);
	                if(isNaN(num))
	                {this.value="";alert("Please enter a valid number");}
	            });	
	        }
	        var request_coord_grid;
	        var rowId = 0;
	       
	        $(document).ready(function () {
	            var lastSel = 0;
//	     		var rowId = 0;
	    		var request_coord_grid = $("#request_coord_grid"); 
	        	request_coord_grid.jqGrid({ 
	            	   url:'FalGrid.requestCoord.do?requestId='+$("#leaseRequest\\.id").val(),	
	                   datatype: "json",
	              	 	jsonReader : {
	     			      root:"rows",
	     			      page: "page",
	     			      total: "total",
	     			      records: "records",
	     			      repeatitems: false,
	     			     id: "0"
	          			},
	          		   rownumbers: true,
	                   colNames:[
	                             '',
	                             'Kordinata E &nbsp&nbsp&nbsp&nbsp',
	                             'Kordinata N &nbsp&nbsp&nbsp&nbsp',
	                             'kordiana zzzz', 
	               	        	 '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'
	                           ],
	    	       	   colModel:[
	    					{name:'draw',index:'draw', width:'50%'},	
	    	       	   		{name:'x',index:'x',align:"center", width:'190%', editable:true ,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	    	       	   		{name:'y',index:'y',align:"center", width:'200%', editable:true ,editoptions:{size: 15, maxlengh: 10, dataInit: function(element) {isNumber(element);}}},
	    	       	   		{name:'z',index:'z',align:"center", width:'120%', hidden:true},		
	    	       	   		{name:'space',index:'space',align:"center", width:'100%', align:"right" ,hidden:true }
	    	    	       	 ], 
	    	       	   pager: "#request_coord_grid_pager",
//	                    rowNum:10,
//	            	   	   rowList:[10,20,30],
	                   viewrecords: true,
	                   sortname: "f.id",
	                   sortorder: "asc",
	                   width: '100%',
	                   height: '100%',
	                   autowidth: true,
	           		   shrinkToFit: false,
	           		   gridview: true,
	                   headertitles: true,
	                   loadonce: true,
	                   rowEdit: true,   
	                   rowsubmit: 'clientArray',
	                   cellsubmit : 'clientArray',
	                   cmTemplate: {sortable:false},
	                   editurl: 'clientArray',                           
	                   add:true,
	                   keys : true, 
	                   caption:"<s:text name="frm.harvest.impl.declare"/>",
	                   ajaxGridOptions: { contentType: "application/json"},
	                   serializeGridData: function (data) {
	                   },
	                   gridComplete: function () {
	                	   	rowId = $("#request_coord_grid").getRowData().length;
	                	   	
	                	   	var ids = jQuery("#request_coord_grid").jqGrid('getDataIDs');
	           				for(var i=0;i < ids.length;i++){
		           				var cl = ids[i];
		           				var rowData=jQuery("#request_coord_grid").jqGrid('getRowData',cl);
		           				if(rowData.pd_id){
			         				var pa = "<button class='btn btn-xs btn-default' type='button' data-original-title='Request Impl' onclick=\"loadImplementFeature('"+rowData.pd_id+"');\"><i class='fa fa-search-plus'></i></button>";
			         				jQuery("#request_coord_grid").jqGrid('setRowData',cl,{draw:pa});
		           				}
		           				jQuery("#request_coord_grid").jqGrid('setRowData',cl,{row_id:i+1});
		           			}
	                   },
	                   afterSaveCell: function (rowid, name, val, iRow, iCol) {
	                   },
	                   oneditfunc: function() {
	                       alert ("edited"); 
	                   },
//	                    onComplete: function(data, response) {
//	                        get_csrf_token();
//	                        alert(csrf_token);
//	                  	},
	                   onSelectRow: function(id){
	               	       editable = jQuery('#request_coord_grid').jqGrid ('getCell', id, 'edit');
	                	   if (id && id !== lastSel) {
	                		   if(editable==''){
		                           $("#request_coord_grid").jqGrid('restoreRow', lastSel); 
		                           $("#request_coord_grid").jqGrid('saveRow', id);
		                           $("#request_coord_grid").editRow(id, true);
	                		   }
	                       } else {
	                    	   if(editable==''){
		                    	   $("#request_coord_grid").jqGrid('restoreRow', lastSel); 
		                    	   $("#request_coord_grid").jqGrid('saveRow', id);
		                    	   $("#request_coord_grid").editRow(id, true);
	                    	   }
	                       }
	                	   lastSel = id;
	                	   var rowData = jQuery(this).getRowData(id); 
	                	    var temp= rowData['edit'];//replace name with you column
	                   }
	                   
	               });
	        	$("#request_coord_grid").jqGrid('navGrid','#request_coord_grid_pager',
	                	{edit: false, add:false, del:false, view:false,search:false, refresh:false},
	        			{}, {},{},{multipleSearch:true,recreateFilter:true});
	        	if(!$("#leaseRequest\\.id").val()){
	             $("#request_coord_grid").navButtonAdd('#request_coord_grid_pager',{
	                	   caption:"", 
	                	   title:"<s:text name="label.button.add"/>", 
	                	   buttonicon:"ui-icon-plus", 
	                	   id:"add_button",
	                	   onClickButton: function(){
		                	   var x='';
		                	   var y='';
		                	   if(rowId!=0){
		                		   $("#request_coord_grid").jqGrid('saveRow', rowId);
		                		   x=jQuery('#request_coord_grid').jqGrid ('getCell', rowId, 'x');
		                		   y=jQuery('#request_coord_grid').jqGrid ('getCell', rowId, 'y');
		                		   addPoint(x,y);
		                		  }
		                	   if(rowId==0 || (x!='' && y!='')){
		                		   $("#request_coord_grid").jqGrid('saveRow', rowId);
		                		      rowId++;
		                		      var parameters =
		                		         {
		                		             rowID: rowId,
		                		             initdata: {
		                		             },
		                		             position: "last",
		                		             useDefValues: true,
		                		             useFormatter: false,
		                		             addRowParams: { extraparam: {} }
		                		         };
		                		       $("#request_coord_grid").jqGrid('addRow', parameters);
		                		       $("#request_coord_grid").jqGrid('setGridParam', {editable: true}); 
		                		  }
	                	   }, 
	                	   position:"last"
	                }).navButtonAdd('#request_coord_grid_pager',{
	            	   caption:"", 
	            	   title:"<s:text name="label.button.save"/>", 
	            	   buttonicon:"ui-icon-disk", 
	            	   onClickButton: function(){ 
	            		   var selr = jQuery('#request_coord_grid').jqGrid('getGridParam','selrow'); 
	            		   $("#request_coord_grid").jqGrid('saveRow', selr);
	            		   var rowData = jQuery(this).getRowData(selr); 
	            		   addPoint(rowData.x,rowData.y);
	            	   }, 
	            	   position:"last"
	            	})          
	              	.navButtonAdd('#request_coord_grid_pager',{
	                	   caption:"", 
	                	   title:"<s:text name="label.button.delete"/>", 
	                	   buttonicon:"ui-icon-trash",
	                	   id:"delete_button", 
	                	   onClickButton: function(){
	                		   var selr = jQuery('#request_coord_grid').jqGrid('getGridParam','selrow'); 
	                		   if(selr){
	                		   		$('#request_coord_grid').jqGrid('delRowData', selr);
	                		   }
	                	   }, 
	                	   position:"last"
	                	});
	        	}
	        	});
	        $(window).resize(function () {
	        	// when the browser size changes so does the grid
	            $("#request_coord_grid").jqGrid('setGridWidth', $('#jqGrid_requestcoord_container').width(), false);
	        });

	        $(window).bind('resize', function() {
	        	//trick - make small
	        	$('#request_coord_grid').setGridWidth(100);
	        	
	        	var width = $('#jqGrid_requestcoord_container').width();
	            // Set grid width to .jqGrid_order_item_container and them go responsive
	            $("#request_coord_grid").jqGrid('setGridWidth', width, false);
	        });   
	});
	
	function calcPrice(startDate, endDate, destination,area){
		var link = "";
    	if(startDate && endDate && destination && area)
    		link = "Input.calcLeasePrice.do?startDate="+startDate+"&endDate="+endDate+"&destination="+destination+"&area="+$("#leaseRequest\\.area").val();

    	if(link){
				$.ajax({
					type : "GET", // GET or POST
					url : link, // the file to call
					async : false,
					beforeSend:function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
						alert("error:" + errorThrown + ", status:" + status);
					},
					dataType: "json",
                data: {
					featureClass: "P",
					style: "full",
					maxRows: 12,
				},
					success : function(data, status, jqXHR) { // on success..
						$("#leaseRequest\\.price").val(data.price);
						$("#leaseRequest\\.price").html(jqXHR.responseText);
					},
					complete:function(jqXHR, textStatus){
					}
				}); 
    	}
	}

	function addPoint(x,y){
		var point = new OpenLayers.Feature.Vector(
			    new OpenLayers.Geometry.Point(x, y));
		var wkt_obj = wkt.write(point);
		var pointFeature = wkt.read(wkt_obj);
		pointFeature.geometry.transform(
				   new OpenLayers.Projection("EPSG:900916"),
			       new OpenLayers.Projection("EPSG:900913")
				   ); 
		vectorLayer.addFeatures(pointFeature);
		map.zoomToExtent(vectorLayer.getDataExtent(),false);	
	}

	function getFileData(myFile){
		var names="";
		var exts="";
		for(var i=0;i<myFile.files.length;i++){
		    var file = myFile.files[i];  
		    var filename = file.name;
		    names+=";"+filename;
		    var fileExt = filename.split('.').pop();
		    exts+=";."+fileExt;
		}
		$("#docNames").val(names);
		$("#docExts").val(exts);
	}
</script>
</html>