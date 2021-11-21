<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>


<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="leaveentitlement_form" class="form-horizontal"
			action="LeaveEntitlementSave.do" accept-charset="utf8" method="post">
		
			<fieldset>
				<legend><s:text name="leaveEntitlement.employee.legend.leave.entitlement.data"/></legend>
				<input id="leaveEntitlement.id" name="leaveEntitlement.id"
					value="<s:property value='leaveEntitlement.id'/>" type="hidden">
			
			<!-- START leaveEntitlement.employee -->
			<div id="employe">
				<s:if test="fieldErrors.get('leaveEntitlement.employee.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="employee.name.placeholder"/></label>
						<div class="col-md-10">
							<input id="leaveEntitlement.employee.firstName" name="leaveEntitlement.employee.firstName" class="form-control" placeholder="<s:text name='employee.name.placeholder'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaveEntitlement.employee.id')"/> </span>
							<input id="leaveEntitlement.employee.id" name="leaveEntitlement.employee.id" value="<s:property value='leaveEntitlement.employee.id'/>" type="hidden">
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.employee"/></label>
						<div class="col-md-10">
							<input id="leaveEntitlement.employee.firstName" name="leaveEntitlement.employee.firstName" value="<s:property value='leaveEntitlement.employee.firstName'/>" class="form-control" placeholder="<s:text name='employee.name.placeholder'/>" type="text">
							<input id="leaveEntitlement.employee.id" name="leaveEntitlement.employee.id" value="<s:property value='leaveEntitlement.employee.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
				</div>
				<!-- END leaveEntitlement.employee -->
				
				<!-- Start organisationList -->
				<div id="organisationList">
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.organisation"/></label>
						<div class="col-md-10">
							<input id="organisation.name" name="organisation.name" value="<s:property value='organisation.name'/>" class="form-control" placeholder="<s:text name='organisation.name.placeholder'/>" type="text">
							<input id="organisation" name="organisation" value="<s:property value='organisation'/>" type="hidden">
						</div>									
					</div>
				</div>
				<!-- END organisationListList -->
				<!-- START organisation -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.organisation"/>?</label>
						<div class="col-md-10">
							<input id="check" name="check" type="checkbox">
						</div>
					</div>
				<!-- END leaveEntitlement.noOfDays -->
				<!-- END leaveEntitlement.leaveType -->
				<s:if test="fieldErrors.get('leaveEntitlement.leaveType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="leaveEntitlement.leaveType.id">*<s:text name="leave.ent.label.leave.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="leaveEntitlement.leaveType.id" name="leaveEntitlement.leaveType.id">
								<s:iterator value="leaveTypeListLE">
									<s:if test="%{id==leaveEntitlement.leaveType.id}">
										<option selected="selected" value="<s:property value="id"/>">
											<s:if test="%{locale.language=='al'}">
												<s:property value="name"/>
											</s:if>
											<s:elseif test="%{locale.language=='sr'}">
												<s:property value="nameSr"/>
											</s:elseif>
											<s:else>
												<s:property value="nameEn"/>
											</s:else>
										</option>
										</s:if>
										<s:else>
										<option value="<s:property value="id"/>"><s:property value="name"/></option>
										</s:else>
								</s:iterator>
							</select>
						 <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('leaveEntitlement.leaveType')" /> </span>
						</div>
					</div>
				</s:if>
				<div class="form-group">
					<label class="col-md-2 control-label"
						for="leaveEntitlement.leaveType.id">*<s:text name="leave.ent.label.leave.type"/></label>
					<div class="col-md-10">
						<select class="form-control" id="leaveEntitlement.leaveType.id"
							name="leaveEntitlement.leaveType.id">
							<s:iterator value="leaveTypeListLE">
								<s:if test="%{id==leaveEntitlement.leaveType.id}">
									<option selected="selected" value="<s:property value="id"/>">
										<s:if test="%{locale.language=='al'}">
											<s:property value="name"/>
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="nameSr"/>
										</s:elseif>
										<s:else>
											<s:property value="nameEn"/>
										</s:else>
									</option>
									</s:if>
									<s:else>
									<option value="<s:property value="id"/>">
									<s:if test="%{locale.language=='al'}">
										<s:property value="name"/>
									</s:if>
									<s:elseif test="%{locale.language=='sr'}">
										<s:property value="nameSr"/>
									</s:elseif>
									<s:else>
										<s:property value="nameEn"/>
									</s:else>
									</option>
									</s:else>
							</s:iterator>
						</select>
					</div>
				</div>
				<!-- END leaveEntitlement.leaveType -->
				
				<!-- START leaveEntitlement.noOfDays -->
				<s:if test="fieldErrors.get('leaveEntitlement.noOfDays')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.number.of.days"/></label>
						<div class="col-md-10">
							<input data="number" id="leaveEntitlement.noOfDays"
								name="leaveEntitlement.noOfDays" class="form-control"
								type="text" placeholder="<s:text name="leave.ent.label.number.of.days"/>"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('leaveEntitlement.noOfDays')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.number.of.days"/></label>
						<div class="col-md-10">
							<input data="number" id="leaveEntitlement.noOfDays"
								name="leaveEntitlement.noOfDays"
								value="<s:property value='leaveEntitlement.noOfDays'/>"
								class="form-control" 
								type="text" placeholder="<s:text name="leave.ent.label.number.of.days"/>">
						</div>
					</div>
				</s:else>
				<!-- END leaveEntitlement.noOfDays -->

				<!-- START leaveEntitlement.fromDate -->
				<s:if test="fieldErrors.get('leaveEntitlement.fromDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.grid.from.date"/></label>
						<div class="col-md-10">
							<input id="leaveEntitlement.fromDate"
								name="leaveEntitlement.fromDate" class="form-control"
								type="text" placeholder="dd.mm.yy"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('leaveEntitlement.fromDate')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="hum.employee.grid.from.date"/></label>
						<div class="col-md-10">
							<input id="leaveEntitlement.fromDate"
								name="leaveEntitlement.fromDate"
								value="<s:property value='leaveEntitlement.fromDate'/>"
								class="form-control" 
								type="text" placeholder="dd.mm.yy">
						</div>
					</div>
				</s:else>
				<!-- END leaveEntitlement.fromDate -->
				
				<!-- START leaveEntitlement.toDate -->
				<s:if test="fieldErrors.get('leaveEntitlement.toDate')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.to.date"/></label>
						<div class="col-md-10">
							<input id="leaveEntitlement.toDate"
								name="leaveEntitlement.toDate" class="form-control"
								 type="text" placeholder="dd.mm.yy"> <span
								class="help-block"><i class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('leaveEntitlement.toDate')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.ent.label.to.date"/></label>
						<div class="col-md-10">
							<input id="leaveEntitlement.toDate"
								name="leaveEntitlement.toDate"
								value="<s:property value='leaveEntitlement.toDate'/>"
								class="form-control" 
								type="text" placeholder="dd.mm.yy">
						</div>
					</div>
				</s:else>
				<!-- END leaveEntitlement.toDate -->
				
				<!-- START leaveEntitlement.note -->
				<s:if test="fieldErrors.get('leaveEntitlement.note')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="leave.ent.label.note"/></label>
						<div class="col-md-10">
							<input id="leaveEntitlement.note" name="leaveEntitlement.note"
								class="form-control" placeholder="<s:text name="leave.ent.label.note"/>"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('leaveEntitlement.note')" /></span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="leave.ent.label.note"/></label>
						<div class="col-md-10">
							<textarea id="leaveEntitlement.note" name="leaveEntitlement.note"
								class="form-control" placeholder="<s:text name="leave.ent.label.note"/>"></textarea>
						</div>
					</div>
				</s:else>
				<!-- END leaveEntitlement.note -->
				<input type="hidden" id="leaveEntitlement.daysUsed" name="leaveEntitlement.daysUsed" value="<s:property value='leaveEntitlement.daysUsed'/>">
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelLE" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveLE"  class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
	$(document).ready(function() {
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
		$('#leaveEntitlement\\.fromDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
		$('#leaveEntitlement\\.toDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			onShow:function( ct ){
				this.setOptions({
					minDate: $('#leaveEntitlement\\.fromDate').val()?$('#leaveEntitlement\\.fromDate').val():false
				});
			},
			timepicker: false,
		});

		/*	var oneDay = 24*60*60*1000;
		var noDays=$('#leaveEntitlement\\.noOfDays').val();
		var differenceDate= Math.round(Math.abs(($('#leaveEntitlement\\.toDate').val() - $('#leaveEntitlement\\.fromDate').val())/(oneDay)));
		//var differenceDate=$('#leaveEntitlement\\.toDate').val()-$('#leaveEntitlement\\.fromDate').val();
		if(noDays>differenceDate){
			alert("gabim nr i diteve "+differenceDate);
			}*/
		
		
		$('#leaveEntitlement\\.fromDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			onShow:function( ct ){
				this.setOptions({
					minDate: 0
				});
			},
			timepicker: false,
		});

		$("#leaveEntitlement\\.employee\\.firstName").select2({
		    placeholder: "Enter activity",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.employee.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        if(term == "") term = " ";   
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
		    	$("#leaveEntitlement\\.employee\\.id").val(item.id);
		    	$("#leaveEntitlement\\.employee\\.firstName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		if($("#leaveEntitlement\\.employee\\.id").val()){
			$("#leaveEntitlement\\.employee\\.firstName").select2("data", {id: "<s:property value='leaveEntitlement.employee.id'/>", name: "<s:property value="leaveEntitlement.employee.firstName"/>"+" "+"<s:property value="leaveEntitlement.employee.lastName"/>"});
		}

		$("#organisation\\.name").select2({
		    placeholder: "Enter activity",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.organisation.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        if(term == "") term = " ";   
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	name_startsWith: term
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
		    	$("#organisation").val(item.id);
		    	$("#organisation\\.name").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#organisation\\.name").select2("data", {id: "<s:property value='organisation'/>", name: "<s:property value="organisation.name"/>"});
		$("#organisationList").hide();
		  var c=false;
		  $(check).on('change',function(event){
		 	c=(!c);
			if(c==true){
				 $("#employe").hide();
				 $( "#leaveEntitlement\\.employee\\.id" ).val(null);
				 $( "#leaveEntitlement\\.employee\\.firstName" ).select2("data", {id: null, name: null});
				$("#organisationList").show();
				 }
			else {	
					$("#employe").show();
					$("#organisationList").hide();
					$("#organisation").val(null);
					$("#organisation\\.name").select2("data", {id: null, name: null});
				}
		  });
		$("#cancelLE").on('click', function() {
			$.ajax({
				type : "GET",
				url : "LeaveEntitlement.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#leaveentitlement_form_content").html(jqXHR.responseText);
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
		Ladda.bind('#saveLE');
		$("#saveLE").on('click', function() {
			$("#leaveentitlement_form :button").prop('disabled','disabled');
			$('#leaveentitlement_form').submit();
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
					$("#leaveentitlement_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
				success : function(data, status, jqXHR) { // on success..
					$("#leaveentitlement_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#leaveentitlement_grid").trigger("reloadGrid");
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
			$("#leaveentitlement_form :button").prop('disabled',false);				
		})();

	});

	
</script>