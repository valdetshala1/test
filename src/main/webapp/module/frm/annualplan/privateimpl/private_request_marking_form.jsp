<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="private_request_impl_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->
	
	<!-- widget content -->
	<div class="widget-body">
	<form id="private_request_marking_form" class="smart-form" action="PrivateRequestImplSave.do" accept-charset="utf8" method="post">
		<div id="marking_content">
		<input id="privateRequestImpl.id" name="privateRequestImpl.id" value="<s:property value='privateRequestImpl.id'/>" type="hidden">
		<input id="privateRequest.id" name="privateRequest.id" value="<s:property value='privateRequest.id'/>" type="hidden">
		
		<fieldset class="no-padding">
		<div id="row">
				<!-- START privateRequest.markingTool -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.marking.tool'/>: <s:if
							test="fieldErrors.get('privateRequest.markingTool')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.markingTool" name="privateRequest.markingTool" class="form-control" placeholder="<s:text name='frm.private.request.marking.tool'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateRequest.markingTool')"/> </span>
										
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.markingTool" name="privateRequest.markingTool" class="form-control" value="<s:property value='privateRequest.markingTool'/>" placeholder="<s:text name='frm.private.request.marking.tool'/>" type="text">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.markingTool -->		
				<!-- START privateRequest.markingDate -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.marking.date'/>: <s:if
							test="fieldErrors.get('privateRequest.markingDate')!=null">
							<div class="form-group has-error">
							<input id="privateRequest.markingDate" name="privateRequest.markingDate" class="form-control"  placeholder="<s:text name='frm.private.request.marking.date'/>" > 
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateRequest.markingDate')" /> </span>	
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input type='text' id="privateRequest.markingDate" name="privateRequest.markingDate" value="<s:property value='privateRequest.markingDate'/>"  class="form-control" placeholder="<s:text name='frm.private.request.marking.date'/>" />
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.markingDate -->	
					
				<!-- START privateRequest.receiverPerson -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.receiver.person'/>: <s:if
							test="fieldErrors.get('privateRequest.receiverPerson')!=null">
							<div class="form-group has-error">
								<input id="privateRequest.receiverPerson" name="privateRequest.receiverPerson" class="form-control" placeholder="<s:text name='frm.private.request.receiver.person'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateRequest.receiverPerson')"/> </span>
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.receiverPerson" name="privateRequest.receiverPerson" class="form-control" value="<s:property value='privateRequest.receiverPerson'/>" placeholder="<s:text name='frm.private.request.receiver.person'/>" type="text">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.receiverPerson -->	
				<!-- START privateRequest.authPerson -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.authorize.person'/>: <s:if
							test="fieldErrors.get('privateRequest.authPerson')!=null">
							<div class="form-group has-error">
									<input id="privateRequest.authPerson.firstName" name="privateRequest.authPerson.firstName" class="form-control" placeholder="<s:text name='frm.private.request.authorize.person'/>"  type="text">
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('privateRequest.authPerson')"/> </span>
									<input id="privateRequest.authPerson.id" name="privateRequest.authPerson.id" value="<s:property value='privateRequest.authPerson.id'/>" type="hidden">
							</div>
						</s:if> <s:else>
							<div class="form-group">
								<input id="privateRequest.authPerson.firstName" name="privateRequest.authPerson.firstName" class="form-control" placeholder="<s:text name='frm.private.request.authorize.person'/>" value="<s:property value='privateRequest.authPerson.firstName'/>" type="text">
								<input id="privateRequest.authPerson.id" name="privateRequest.authPerson.id" value="<s:property value='privateRequest.authPerson.id'/>" type="hidden">
							</div>
						</s:else>
					</label>
				</section>
				<!-- END privateRequest.authPerson -->	
			</div>
			</fieldset>
			<footer class="form-actions">
				<s:if test="terrainDone.getDOMVALUE()==privateRequest.activityStatus.status.getDOMVALUE() && user.getOrganisation().getOperLevelVal()=='R' ">
					<button id="controlButton" class="btn btn-default" type="button"><s:text name='frm.private.request.control'/>
					</button>
				</s:if>
				<s:elseif test="userIsForestOwner() || transport.getDOMVALUE()==privateRequest.activityStatus.status.getDOMVALUE() || approved.getDOMVALUE()==privateRequest.activityStatus.status.getDOMVALUE() || rejected.getDOMVALUE()==privateRequest.activityStatus.status.getDOMVALUE() || user.getOrganisation().getOperLevelVal()=='C' || user.getOrganisation().getOperLevelVal()=='M'">
				
				</s:elseif>
				<s:else>
					<button id="saveMark" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
					<button id="cancelMark" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>  
		 			</button>
				</s:else>
				
					
			</footer>
			
<s:if test="hasActionErrors() || hasFieldErrors()">
	<fieldset>
		<legend><s:text name='frm.private.request.validations'/></legend>
		<table class="errors">
			<s:iterator value="actionErrors">
				<tr>
					<td colspan="5"><span class="ui-icon ui-icon-alert"
						style="float: left; margin-right: .3em;"></span> <strong><s:text
								name="label.action.alert" />:</strong> <s:property escape="false" /></td>
				</tr>
			</s:iterator>
			<s:iterator value="fieldErrors">
				<tr>
					<td colspan="5"><span class="ui-icon ui-icon-alert"
						style="float: left; margin-right: .3em;"></span> <strong><s:text
								name="label.action.alert" />:</strong> <s:property escape="false" /></td>
				</tr>
			</s:iterator>
		</table>
	</fieldset>
</s:if>
		</div>	
		</form>
		
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function() {
		$('#privateRequest\\.markingDate').datetimepicker({
			timepicker:false,
			format:'m.d.Y', 
			mask:false,
			formatDate:'mm.dd.YYYY'});

	    $("#privateRequest\\.authPerson\\.firstName").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.employee.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        if(term == "") term = " ";   
		        return {
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
	        formatResult: formatResult,
	        formatSelection: function(item) {
	        	$("#privateRequest\\.authPerson\\.id").val(item.id);
	        	$("#privateRequest\\.authPerson\\.firstName").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        escapeMarkup: function (m) { return m; }
	    });    
	    $("#privateRequest\\.authPerson\\.firstName").select2("data", {id: "<s:property value='privateRequest.authPerson.id'/>", name: "<s:property value='privateRequest.authPerson.firstName'/> <s:property value='privateRequest.authPerson.lastName'/>"});

		$("#privateRequest\\.authPerson\\.firstName").combobox_ajax({
	        source: function(request, response) {
	            $.ajax({
	            	type:"post",
	                url: "Input.employee.do",
	                dataType: "json",
	                data: {
						featureClass: "P",
						style: "full",
						maxRows: 12,
						name_startsWith: request.term
					},
					success: function( data ) {
						response( $.map( data, function(item ) {
							return {
								label: item.name,
	                            value: item.name,
	                            id: item.id
							};
						}));
					},
	                maxRows: 100,
	        		minLength: 0   
	            });
	        },
	        select: function(event, ui) {
	            $( "#privateRequest\\.authPerson\\.id" ).val( ui.item.id);
	        }           
	    });

		$("#controlButton").on('click', function() {
				openDialogForm('private_request_control_form_content',"PrivateRequest.control.do?privateRequestId="+$("#privateRequest\\.id").val(),"<s:text name="privateRequest.control"/>",600,400);
			return false;
		});

		
		$("#cancelMark").on('click', function() {
			var link = "PrivateRequest.page.do?annualplanId=" + $("#annualplan\\.id").val();
			$.ajax({
				type : "GET",
				url : link,
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#annualplan_pvt_req_content").html(jqXHR.responseText);
// 					jQuery("#private_request_impl_grid").jqGrid('clearGridData');
    				$("#saveMark").show();
    	            $("#saveMark").prop('disabled',false);
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
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
		$("#saveMark").on('click', function() {
// 			if(saved=='false'){
// 				alert("Please save data in grid first");
// 			}else{
			$(':button').prop('disabled','disabled'); 
				var selr = jQuery('#private_request_impl_grid').jqGrid('getGridParam','selrow'); 
     		    $("#private_request_impl_grid").jqGrid('saveRow', selr);
				$('#private_request_marking_form').submit();
// 			}
			return false;
		});
		$("#private_request_marking_form").submit(function() {
			var this_form = $(this);
			
			var pvtReqImplArray = $("#private_request_impl_grid").jqGrid('getRowData');
        	var jsonText = JSON.stringify(pvtReqImplArray);
			$('<input>').attr({
				type : 'hidden',
				name : "jsonPrivateRequestImpl",
				value : jsonText
			}).appendTo(this_form);	
			
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#private_request_impl_form_content").html(jqXHR.responseText);
					jQuery("#private_request_grid").trigger("reloadGrid");
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
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
					$(':button').prop('disabled',false); 
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});

	});

	
</script>