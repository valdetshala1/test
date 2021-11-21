<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<div>
	<!-- widget content -->
	<div id="transport_form_content" class="widget-body">
	<form id="transport_form" class="smart-form" action="HarvImplTransSave.do" accept-charset="utf8" method="post">
	<input id="harvToTransIds" name="harvToTransIds" value="<s:property value='harvToTransIds'/>" type="hidden" >
	<input id="harvImplTransport.person" name="harvImplTransport.person" value="<s:property value='harvImplTransport.person'/>" type="hidden" >
	<input id="harvImplTransport.createdDate" name="harvImplTransport.createdDate" value="<s:property value='harvImplTransport.createdDate'/>" type="hidden" >
	<input id="harvImplTransport.id" name="harvImplTransport.id" value="<s:property value='harvImplTransport.id'/>" type="hidden" >
	<fieldset>
	   <div class="row">
			<section class="col col-4">
					<label class="input">*<s:text name="frm.harvest.transport.date"/>:
					<s:if test="fieldErrors.get('harvImplTransport.transDate')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" type="text" id="harvImplTransport.transDate" name="harvImplTransport.transDate" />
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('harvImplTransport.transDate')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text"  id="harvImplTransport.transDate" name="harvImplTransport.transDate" value="<s:property value='harvImplTransport.transDate'/>"/>
						</div>
					</s:else>
					</label>
			</section>
		</div>
		<s:if test="fieldErrors.get('tFile')!=null">
			<div class="form-group has-error">
			      <label class="col-md-2 control-label">*<s:text name="tender.request.attachment"/>:</label>
			 	  <div class="col-md-10">
			      	<input class="form-control input-xs-g" id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileDataTrans(this);">
			       	<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('tFile')"/> </span>
			      </div>         
		     </div>
		</s:if>
		<s:else>
			<div class="form-group">
				<label class="col-md-3 control-label"><s:text name="tender.request.attachment"/>:</label>
				<div class="col-md-10">
					<input class="form-control input-xs-g" id="file" name="file" type="file" class="btn btn-default btn-file" onchange="getFileDataTrans(this);">							
				</div>
			</div>
		</s:else>
		<!-- END attachment -->
				
		<input id="harvImplTransport.docName" name="harvImplTransport.docName" value="<s:property value='harvImplTransport.docName'/>" type="hidden">
		<input id="harvImplTransport.docType" name="harvImplTransport.docType" value="<s:property value='harvImplTransport.docType'/>" type="hidden">
		
		<div class="row">
		<section class="col col-10">
			<label class="input"><s:text name="hum.employee.label.comment"/>:
			<s:if test="fieldErrors.get('harvImplTransport.remark')!=null">
				<div class="form-group has-error">
					<textarea id="harvImplTransport.remark" name="harvImplTransport.remark" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"></textarea>
					<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityStatus.remarks')"/> </span>
				</div>
			</s:if>
			<s:else>
				<div class="form-group">
					<textarea id="harvImplTransport.remark" name="harvImplTransport.remark" class="form-control" placeholder="<s:text name="hum.employee.label.comment"/>"><s:property value='harvImplTransport.remark'/></textarea>
				</div>
			</s:else>
			</label>
		</section>
		</div>
			</fieldset>
		<footer class="form-actions act-popup-footer" >
					<button id="save" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				<button id="cancelBtn" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
					</button>
		</footer>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
function getFileDataTrans(myFile){
	    var file = myFile.files[0];  
	    var filename = file.name;
	    var fileExt = filename.split('.').pop();
	    $("#harvImplTransport\\.docName").val(filename);
	    $("#harvImplTransport\\.docType").val('.'+fileExt);
	};
	$(document).ready(function() {

		$('#harvImplTransport\\.transDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});
		
	    $("#save").on('click', function() {
	    	$(':button').prop('disabled','disabled');
			$('#transport_form').submit();
			return false;
		});

		$("#cancelBtn").on('click', function () {
			$("#transport_form_content_popup").dialog('close');
			return false;        
		});
		
	    (function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#transport_form").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#transport_form").html(jqXHR.responseText);
					
					var errors_exits = jqXHR.getResponseHeader("errors_exits");
					var message = jqXHR.getResponseHeader("message");
					
					if (errors_exits == "true") {
						var text='<s:text name="small.box.content"/>';
						if(message){
							text=message;
						}
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : text,
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					} else {
						jQuery("#harvest_declare").trigger("reloadGrid");
						alert("Okk");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}
					$(':button').prop('disabled',false);	    	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();
			
	});

	
</script>