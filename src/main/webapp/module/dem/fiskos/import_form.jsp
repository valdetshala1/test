<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
<style>
    .btn-file {
    position: relative;
    overflow: hidden;
    }
    .btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
    }
    
</style>
</head>
<body> 

		<form id="fiskos_import_form" class="form-horizontal" action="FiskosImport.do" accept-charset="utf8" method="post"  enctype="multipart/form-data">
				<input id="regionId" name="regionId" type="hidden"/>
				<input id="managementUnitId" name="managementUnitId" type="hidden"/>
				
				<!-- START regionName -->
				<s:if test="fieldErrors.get('regionName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='frm.compartment.region.name'/>
						</label>
						<div class="col-md-10">
							<input id="regionName" name="regionName" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('regionName')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='frm.compartment.region.name'/></label>
						<div class="col-md-10">
							<input id="regionName" name="regionName" value="<s:property value='regionName'/>" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END regionName -->
				
				<!-- START mangementUnit -->
				<s:if test="fieldErrors.get('managementUnitName')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='frm.protection.management.unit'/>
						</label>
						<div class="col-md-10">
							<input id="managementUnitName" name="managementUnitName" class="form-control" placeholder="<s:text name='frm.protection.management.unit'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('managementUnitName')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='frm.protection.management.unit'/></label>
						<div class="col-md-10">
							<input id="managementUnitName" name="managementUnitName" value="<s:property value='managementUnitName'/>" class="form-control" placeholder="<s:text name='frm.protection.management.unit'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END mangementUnit -->			
				<!-- START datefrom -->
				<div class="form-group">
				<s:if test="fieldErrors.get('datefrom')!=null">
					<div class="has-error">
						<label class="control-label col-sm-2">*<s:text name="dem.fiskos.valid.form"/></label>
				          <div class="col-md-4">
							<div class="input-group date">
								<input type='text' id="datefrom" name="datefrom" value="<s:property value='datefrom'/>" data-date-format="dd.MM.YYYY" class="form-control" placeholder="Date from" type="date"/>
	                    		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							</div>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('datefrom')"/> </span>					
						</div>
					</div>
				</s:if>
				<s:else>
			          <label class="control-label col-sm-2">*<s:text name="dem.fiskos.valid.form"/></label>
			          <div class="col-md-4">
						<div class="input-group date">
	                    	<input type='text' id="datefrom" name="datefrom" value="<s:property value='datefrom'/>" data-date-format="dd.MM.YYYY" class="form-control" placeholder="Date from" type="date"/>
	                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                	</div>
			          </div>
		     	 </s:else>
		     	 <!-- END datefrom -->	

				<!-- START datefrom -->
				<s:if test="fieldErrors.get('dateto')!=null">
					<div class="has-error">
						<label class="control-label col-sm-2">*<s:text name="fin.contactor.to"/></label>
				          <div class="col-md-4">
							<div class="input-group date">
								<input type='text' id="dateto" name="dateto" value="<s:property value='dateto'/>" data-date-format="dd.MM.YYYY" class="form-control" placeholder="Date to" type="date"/>
	                    		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							</div>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dateto')"/> </span>					
						</div>
					</div>
				</s:if>
				<s:else>
		          <label class="control-label col-sm-2">*<s:text name="fin.contactor.to"/></label>
		          <div class="col-md-4">
					<div class="input-group date">
                    	<input type='text' id="dateto" name="dateto" value="<s:property value='dateto'/>" data-date-format="dd.MM.YYYY" class="form-control" placeholder="Date to" type="date"/>
                    	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                	</div>
		          </div>
		          </s:else>
		          <!-- END datefrom -->
		      </div>				
				
				<!-- START file -->
				<s:if test="fieldErrors.get('fileUpload')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/>
						</label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="fileUpload" name="fileUpload" title="Please select FISKOS excel file" type="file">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('fileUpload')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name='dem.fiskos.import.file'/></label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="fileUpload" name="fileUpload" title="Please select FISKOS excel file" type="file">
						</div>									
					</div>
				</s:else>
				<!-- END file -->					
				
				<!-- START note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name='leave.ent.label.note'/></label>
					<div class="col-md-10">
						<textarea id="note" name="note" class="form-control" style="text-align:left!important;float: left; margin: 0 10px 0 0;overflow: hidden;" placeholder="Enter a short synopsis"><s:property value="domain.description"/></textarea>
					</div>
				</div>
				<!-- END note -->
			
				<div class="form-actions">
					<div class="row">
						<div class="col-md-12">
							<button id="cancel" class="btn btn-default" type="submit">
								<s:text name="label.button.cancel"></s:text>
							</button>
							<button id="save" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
								<i class="fa fa-save"></i>
								<s:text name="label.button.save"></s:text>
							</button>
							
						</div>
					</div>
				</div>

		</form>
		
				<s:if test="hasActionErrors() || hasFieldErrors()">
				<fieldset>
					<legend><s:text name="frm.private.request.validations"/></legend>
					<table class="errors"> 
					<s:iterator value="actionErrors">
					<tr>
					<td colspan="5">
						<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
						<strong><s:text name="label.action.alert"/>:</strong>  <s:property escape="false"/>
					</td>
					</tr>
					</s:iterator>
					<s:iterator value="fieldErrors">
					<tr>
					<td colspan="5">
						<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
						<strong><s:text name="label.action.alert"/>:</strong>  <s:property escape="false"/>
					</td>
					</tr>
					</s:iterator>				
					</table>	
				</fieldset>
				</s:if>		
<script type="text/javascript">
$(document).ready(function() {

	
	$('#datefrom').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		onShow:function( ct ){
		   this.setOptions({
		    maxDate: $('#dateto').val()?$('#dateto').val():false
		   });
		},		
		timepicker: false,
	});	

	$('#dateto').datetimepicker({
		lang: 'al',
		format: 'd.m.Y',
		mask: false,
		formatDate:'d.m.Y',
		onShow:function( ct ){
		   this.setOptions({
		    minDate: $('#datefrom').val()?$('#datefrom').val():false
		   });
		},		
		timepicker: false,
    			
	});	
		
	$("#regionName").select2({
	    placeholder: "<s:text name="placeholder.enter.reg.name"/>",
	    minimumInputLength: 0,
	    ajax: {
	        url: "Input.region.do",
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
	    	$("#regionId").val(item.id);
	    	$("#regionName").val(item.name);
	    	$("#managementUnitName").select2("data", {id: "", name: ""});
	    	$("#managementUnitName").prop("disabled", false);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	});

	$("#regionName").select2("data", {id: $("#regionId").val(), name: $("#regionName").val()});
	
	
	$("#managementUnitName").select2({
	    placeholder: "<s:text name="dem.fiskos.enter.man.unit"/>",
	    minimumInputLength: 0,
	    ajax: {
	        url: "Input.managementUnit.do",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	name_startsWith: term,
		        	regionId: $("#regionId").val(),
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
	    	$("#managementUnitId").val(item.id);
	    	$("#managementUnitName").val(item.name);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	});

	$("#managementUnitName").select2("data", {id: $("#managementUnitId").val(), name: $("#managementUnitName").val()});
	
	$("#managementUnitName").on("select2-selecting", function(e) {
		//alert("select2:open");
	});

	$("#managementUnitName").on("select2-open", function(e) {
		var rid = $("#regionId").val();
		if(rid == ""){
			alert("<s:text name="dem.fiskos.pls.select.reg"/>");
			$("#managementUnitName").prop("disabled", true);
		}
	});	
			
	
		Ladda.bind('#save');	
		$("#save").on('click', function() {
			$('#fiskos_import_form').submit();
			return false;
		});
		
		
		$("#cancel").on('click', function() {
			
			$.ajax({
				type : "GET",
				url : "Fiskos.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#fiskos_import_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : "<s:text name="small.box.on.cancel.title"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C46A69",
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 3000
					});
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			
			return false;
		});

		$('form').ajaxForm({
		    beforeSend: function() {
		    	$('#ajaxBusyB').show();
		    },
			error : function(response, status, err){
				$("#grant_dialog").html(response);
			},	    
		    success : function(data, status, jqXHR) {
				$("#fiskos_import_form_content").html(jqXHR.responseText);
				//jQuery("#person_grid").trigger("reloadGrid");
				var errors = jqXHR.getResponseHeader("errors_exits");
				if(!errors){
					$.smallBox({
						title : "<s:text name="small.box.on.save.title.success"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#739E73",
						timeout: 5000,
						icon : "fa fa-check",
						number : "1"
					});									
				}else{
					$.smallBox({
						title : "<s:text name="small.box.on.save.title.failed"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C79121",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				}					    	
		    },	    
			complete: function(xhr) {
				 $("#fiskos_import_grid").trigger("reloadGrid");
				$('#ajaxBusyB').hide();
			}
		});			
		
});
</script>		
   		    
</body>
</html>