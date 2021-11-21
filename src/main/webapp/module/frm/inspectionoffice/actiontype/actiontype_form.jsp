<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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

		<form id="actiontype_form" class="form-horizontal" action="ActionTypeSave.do" accept-charset="utf8" method="post">
			
			<fieldset>
				<legend><s:text name="action.type.legend"/></legend>
				<input id="actionType.id" name="actionType.id" value="<s:property value='actionType.id'/>" type="hidden">	

				
				<!-- START actionType.nameAl -->
				<s:if test="fieldErrors.get('actionType.nameAl')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.al"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="actionType.nameAl" name="actionType.nameAl" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.al"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('actionType.nameAl')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.al"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="actionType.nameAl" name="actionType.nameAl" value="<s:property value='actionType.nameAl'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.al"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END actionType.nameAl -->
				
				<!-- START actionType.nameEn -->
				<s:if test="fieldErrors.get('actionType.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.en"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="actionType.nameEn" name="actionType.nameEn" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.en"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('actionType.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.en"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="actionType.nameEn" name="actionType.nameEn" value="<s:property value='actionType.nameEn'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.en"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END actionType.nameEn -->
				
				<!-- START actionType.nameSr -->
				<s:if test="fieldErrors.get('actionType.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="dhpet.wild.animal.label.name.sr"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="actionType.nameSr" name="actionType.nameSr" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.sr"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('actionType.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dhpet.wild.animal.label.name.sr"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="actionType.nameSr" name="actionType.nameSr" value="<s:property value='actionType.nameSr'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.sr"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END actionType.nameSr -->
				
				<!-- START actionType.description -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="finance.type.label.description"/></label>
						<div class="col-md-10">
							<textarea id="actionType.description" name="actionType.description"class="form-control" placeholder="<s:text name="finance.type.label.description"/>"><s:property value='actionType.description'/></textarea> 
						</div>									
					</div>
				<!-- END actionType.description -->
				
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelTT" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveTT" class="btn btn-primary" type="submit">
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
	$(document).ready(function () {
		$("input[data='number']").autoNumeric('init', {
			aDec: '.', 
			aSep: ',', 
			mDec: '2'
		});

		$("#cancelTT").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "ActionType.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#actiontype_form_content").html(jqXHR.responseText);
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
		$("#saveTT").on('click', function () {                    
			$('#actiontype_form').submit();
			return false;        
		});
		$("#actiontype_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form .serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#actiontype_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#actiontype_grid").trigger("reloadGrid");
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
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});
			
	});            
</script>