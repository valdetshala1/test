<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<jsp:include page="../../../base/validation.jsp"></jsp:include>
<div id="actdomain_form_content">
<form id="actdomain_form" class="smart-form" action="ActivityDomainSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
	<input id="activityDomain.type" name="activityDomain.type" value="<s:property value='activityDomain.type'/>"  type="hidden">
	<input id="activityDomain.id" name="activityDomain.id" value="<s:property value='activityDomain.id'/>"  type="hidden">
	<input id="activityDomain.activityDomain.id" name="activityDomain.activityDomain.id" value="<s:property value='activityDomain.activityDomain.id'/>" type="hidden">
	<input id="activityDomain.sort" name="activityDomain.sort" value="<s:property value='activityDomain.sort'/>"  type="hidden">
	<input id="ref.nameAl" name="ref.nameAl" value="<s:property value='ref.nameAl'/>" type="hidden">
	<input id="parentId" name="parentId" value="<s:property value='parentId'/>" type="hidden">	
		<fieldset class="no-padding">
		<legend><s:text name="activity.domain.menu"/></legend>
		<div  id="referenceDiv" class="alert alert-new fade in">			
			<i id="statusIcon" class="fa-fw fa  fa-stack-overflow"></i>
			<s:text name="activity.reference.to"/> : <s:property value='ref.nameAl'/>
		</div>
		<div class="row">
			  <section class="col col-3">
					<label class="input">*<s:text name="audit.keycode"/>:
					<s:if test="fieldErrors.get('activityDomain.code')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="activityDomain.code" name="activityDomain.code"   placeholder="Code" type="text" >
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityDomain.code')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="activityDomain.code" name="activityDomain.code"   value="<s:property value='activityDomain.code'/>" placeholder="Code">
						</div>
					</s:else>
					</label>
				</section>
				 <section class="col col-3">
					<label class="input">*<s:text name="audit.nameAl"/>:
					<s:if test="fieldErrors.get('activityDomain.nameAl')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="activityDomain.nameAl" name="activityDomain.nameAl"  placeholder="nameAl" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityDomain.nameAl')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="activityDomain.nameAl" name="activityDomain.nameAl" value="<s:property value='activityDomain.nameAl'/>" placeholder="nameAl">
						</div>
					</s:else>
					</label>
				</section>
				<section class="col col-3">
					<label class="input">*<s:text name="audit.nameEn"/>:
					<s:if test="fieldErrors.get('activityDomain.nameEn')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="activityDomain.nameEn" name="activityDomain.nameEn"  placeholder="nameEn" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityDomain.nameEn')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="activityDomain.nameEn" name="activityDomain.nameEn" value="<s:property value='activityDomain.nameEn'/>" placeholder="nameEn">
						</div>
					</s:else>
					</label>
				</section>
				<section class="col col-3">
					<label class="input">*<s:text name="audit.nameSr"/>:
					<s:if test="fieldErrors.get('activityDomain.nameSr')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="activityDomain.nameSr" name="activityDomain.nameSr"  placeholder="nameSr" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('activityDomain.nameEn')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="activityDomain.nameEn" name="activityDomain.nameSr" value="<s:property value='activityDomain.nameSr'/>" placeholder="nameSr">
						</div>
					</s:else>
					</label>
				</section>
		</div>
		<div class="row">
				<footer class="form-actions act-popup-footer" >
				<button id="save" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
				</button>
				<button id="cancel" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
		</footer>
		
		</div>
		</fieldset>
</form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("#activityDomain\\.code").attr('maxlength','5');
	var prId="<s:property value='parentId'/>";
	var sort="<s:property value='activityDomain.sort'/>";
	$("#activityDomain\\.activityDomain\\.id").val(prId);
	if(prId){
		$('.alert-new').css({"border-color":"#484C4F"});
		$('.alert-new').css({"color":"#fff"});
		$('.alert-new').css({"background-color":"#CFD1D3"});
		$('.alert').css({"color":"#484C4F"});
		$("#referenceDiv").show();
	
	}else{
		$("#referenceDiv").hide();
	}
	
	if($("#activityDomain\\.id").val()){
		if(sort!='0'){
			$("#activityDomain\\.code").prop('disabled', true);
			}
		}

// 	if(!$("#activityDomain\\.id").val()){
// 		$("#activitydomain_form_content").hide();
// 		}
	
	$("#cancel").on('click', function () {                    
		$.ajax({
			type : "GET",
			url : "ActivityDomain.form.do",
			async : false,
			beforeSend : function(jqXHR, settings) {
			},
			error : function(errorThrown, status, jqXHR) { // on error..
				alert("error:" + errorThrown + ", status:" + status);
			},
			success : function(data, status, jqXHR) { // on success..
				$("#actdomain_form_content").html(jqXHR.responseText);
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
	
	$("#save").on('click', function () {                    
		$('#actdomain_form').submit();
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
				$("#actdomain_form_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
				$("#actdomain_form_content").html(jqXHR.responseText);
				
				var errors_exits = jqXHR.getResponseHeader("errors_exits");
				if(!errors_exits){
					jQuery("#activitydomain_treegrid").trigger("reloadGrid");
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
// 		$("#actdomain_form :button").prop('disabled',false);				
	})();

	
});
</script>