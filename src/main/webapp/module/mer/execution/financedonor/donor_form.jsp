<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="donor_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">
		<form id="donor_form" class="form-horizontal" action="FinDonorSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			<input type="hidden" id="donor.id" name="donor.id" value="<s:property value="donor.id"/>" />
			
			<input type="hidden" id="donor.person.id" name="donor.person.id" value="<s:property value="donor.person.id"/>" />
			<input type="hidden" id="donor.createdDate" name="donor.createdDate" value="<s:property value="donor.createdDate"/>" />
			
			<input type="hidden" id="language" name="locale.language" value="<s:property value="locale.language"/>" />
			
			<fieldset>
				<legend><s:text name='mer.fin.donor.data'/></legend>
				<!-- START donor.merStrategy -->
					<input id="donor.merStrategy.id" name="donor.merStrategy.id" value="<s:property value="donor.merStrategy.id"/>" class="form-control" type="hidden">
				<!-- END donor.merStrategy -->
				
				<!-- START donor.organisation -->
				<s:if test="fieldErrors.get('donor.organisation')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.fin.donor.donor'/></label>
						<div class="col-md-10">
							<input id="donor.organisation.orgaName" name="donor.organisation.orgaName" class="form-control" type="text">
							<input id="donor.organisation.id" name="donor.organisation.id" class="form-control" type="hidden">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('donor.organisation')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.fin.donor.donor'/></label>
						<div class="col-md-10">
							<input id="donor.organisation.orgaName" name="donor.organisation.orgaName" value="<s:property value="donor.organisation.orgaName"/>" class="form-control" type="text">
							<input id="donor.organisation.id" name="donor.organisation.id" class="form-control" value="<s:property value='donor.organisation.id'/>" type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END donor.organisation -->
				<!-- START donor.donationYear -->
				<s:if test="fieldErrors.get('donor.donationYear')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.fin.donor.donationYear'/></label>
						<div class="col-md-10">
							<input id="donor.donationYear" name="donor.donationYear" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('donor.donationYear')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.fin.donor.donationYear'/></label>
						<div class="col-md-10">
							<input id="donor.donationYear" name="donor.donationYear" value="<s:property value="donor.donationYear"/>" class="form-control" type="text">
						</div>
					</div>
				</s:else>
				<!-- END donor.donationYear -->
				<!-- START donor.amount -->
				<s:if test="fieldErrors.get('donor.amount')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='mer.fin.donor.amount'/></label>
						<div class="col-md-10">
							<input id="donor.amount" name="donor.amount" class="form-control" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('donor.amount')"/> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='mer.fin.donor.amount'/></label>
						<div class="col-md-10">
							<input id="donor.amount" name="donor.amount" value="<s:property value="donor.amount"/>" class="form-control" type="text">
						</div>
					</div>
				</s:else>
				<!-- END donor.amount -->
				<!-- START donor.note -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="hum.employee.label.notes"/></label>
						<div class="col-md-10">
							<textarea id="donor.note" name="donor.note" class="form-control"><s:property value="donor.note"/></textarea>
						</div>									
					</div>
				<!-- END donor.note -->
				
		<!-- end widget div -->
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelFD" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveFD" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					</div>
				</div>
			</div>
		</fieldset>
		</form>

	</div>
	<!-- end widget content -->

</div>
<!-- end widget div -->
	
<script type="text/javascript">
$(document).ready(function () {
	$("#donor\\.merStrategy\\.id").val($("#stratId").val());
	
	$("#donor\\.amount").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '2'});
	$("#donor\\.donationYear").mask("9999");
	
	$("#donor\\.organisation\\.orgaName").select2({
	    placeholder: "", 
	    minimumInputLength: 1,
	    ajax: {
	        url: "Input.organisation.do",
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
	    	$("#donor\\.organisation\\.id").val(item.id);
	    	$("#donor\\.organisation\\.orgaName").val(item.name);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	}); 
	
	$("#donor\\.organisation\\.orgaName").select2("data", {id: "<s:property value='donor.organisation.id'/>", name: "<s:property value='donor.organisation.orgaName'/>"});

	Ladda.bind('#saveFD');
	$("#saveFD").on('click', function () {
		$("#donor_form :button").prop('disabled','disabled');
		$('#donor_form').submit();
		return false;        
	});
	
	$("#cancelFD").on('click', function() {
		$.ajax({
			type : "GET",
			url : "FinDonor.form.do",
			async : false,
			beforeSend : function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			success : function(data, status, jqXHR) { // on success..
				$("#donor_form_content").html(jqXHR.responseText);
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

	(function() {
		$('form').ajaxForm({
			beforeSerialize: function($form, options) {         
			},
		    beforeSend: function() {
		    	//$('#ajaxBusyB').show();
		    },
			error : function(response, status, err){
				$("#donor_form_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
		    	$("#donor_form_content").html(jqXHR.responseText);
				var errors_exits = jqXHR.getResponseHeader("errors_exits");
				if (errors_exits == "true") {
					$.smallBox({
						title : '<s:text name="small.box.on.save.title.failed"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C79121",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				} else {
					jQuery("#donor_grid").trigger("reloadGrid");
					$.smallBox({
						title : '<s:text name="small.box.on.save.title.success"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#739E73",
						timeout: 5000,
						icon : "fa fa-check",
						number : "1"
					});
					//$("#farmer_expander").html(jqXHR.responseText);
				}		
		    },	    
			complete: function(xhr) {
				//$('#ajaxBusyB').hide();
			}
		});		
		$("#donor_form :button").prop('disabled',false);
	})();		
});
	
</script>