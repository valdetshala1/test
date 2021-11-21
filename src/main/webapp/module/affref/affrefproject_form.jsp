<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../base/nocache.jsp"%>
	
<!-- widget div-->
<div>
	<!-- widget content -->
	<div class="widget-body">
		<form id="affrefproject_form" class="form-horizontal" action="AffRefProjectsSave.do" accept-charset="utf8" method="post">
			<div  id="referenceDiv" class="alert alert-new fade in">			
				<i id="statusIcon" class="fa-fw fa  fa-stack-overflow"></i>
				<s:text name="aff.reff.reference.project"/> : <s:property value='ref.name'/>
			</div>
			<fieldset>
				<legend><s:text name="afforestation.reforistation.project.legend"/></legend>
				<input id="affRefProjects.id" name="affRefProjects.id" value="<s:property value='affRefProjects.id'/>" type="hidden">	
				<input id="affRefProjects.createdTime" name="affRefProjects.createdTime" value="<s:property value='affRefProjects.createdTime'/>" type="hidden">	
				<input id="affRefProjects.person.id" name="affRefProjects.person.id" value="<s:property value='affRefProjects.person.id'/>" type="hidden">	
				<input id="parentId" name="parentId" value="<s:property value='parentId'/>" type="hidden">	
				<input id="ref.name" name="ref.name" value="<s:property value='ref.name'/>" type="hidden">	
				<input id="affRefProjects.affRefProjects.id" name="affRefProjects.affRefProjects.id" value="<s:property value='affRefProjects.affRefProjects.id'/>" type="hidden">	
				
				<!-- START affRefProjects.nameEn -->
				<s:if test="fieldErrors.get('affRefProjects.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="aff.reff.project.name"/></label>
						<div class="col-md-10">
							<input  id="affRefProjects.name" name="affRefProjects.name" class="form-control" placeholder="<s:text name="aff.reff.project.name"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('affRefProjects.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="aff.reff.project.name"/></label>
						<div class="col-md-10">
							<input  id="affRefProjects.name" name="affRefProjects.name" value="<s:property value='affRefProjects.name'/>" class="form-control" placeholder="<s:text name="aff.reff.project.name"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END affRefProjects.nameEn -->
				
				<!-- START affRefProjects.dataFrom -->
				<s:if test="fieldErrors.get('affRefProjects.dataFrom')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="aff.reff.project.data.form"/></label>
						<div class="col-md-10">
							<input  id="affRefProjects.dataFrom" name="affRefProjects.dataFrom" class="form-control" placeholder="<s:text name="aff.reff.project.data.from"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('affRefProjects.dataFrom')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="aff.reff.project.data.form"/></label>
						<div class="col-md-10">
							<input  id="affRefProjects.dataFrom" name="affRefProjects.dataFrom" value="<s:property value='affRefProjects.dataFrom'/>" class="form-control" placeholder="<s:text name="aff.reff.project.data.form"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END affRefProjects.dataFrom -->
				<!-- START decision.note -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name="adm.person.label.address.notes"/></label>
					<div class="col-md-10">
						<textarea id="affRefProjects.remarks" name="affRefProjects.remarks" class="form-control"><s:property value="affRefProjects.remarks"/></textarea>
					</div>
				</div>	
			<!-- END decision.note -->
			<!-- START attachments -->
			<input type="hidden" id="docNames" name="docNames" value="<s:property value="docNames"/>">
			<input type="hidden" id="docExts" name="docExts" value="<s:property value="docExts"/>">
			<div class="form-group">
				<label class="col-md-2 control-label"><s:text name="tender.request.attachment"/></label>
				<div class="col-md-10">
					<input id="file" name="file" type="file" class="btn btn-default btn-file" multiple onchange="getFileDatas(this);">
				</div>
			</div>	
			<!-- END attachments -->
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
	function getFileDatas(myFile){
	// 	alert(myFile.files.length);
		var names="";
		var exts="";
		for(var i=0;i<myFile.files.length;i++){
		    var file = myFile.files[i];  
		    var filename = file.name;
		    names+=";"+filename;
		    var fileExt = filename.split('.').pop();
		    exts+=";"+fileExt;
		}
		$("#docNames").val(names);
		$("#docExts").val(exts);
	}
	$(document).ready(function () {
		$("#referenceDiv").hide();
		$("#affRefProjects\\.affRefProjects\\.id").val($("#parentId").val());
		if($("#parentId").val()){
   			$('.alert-new').css({"border-color":"#484C4F"});
   			$('.alert-new').css({"color":"#fff"});
   			$('.alert-new').css({"background-color":"#CFD1D3"});
   			$('.alert').css({"color":"#484C4F"});
			$("#referenceDiv").show();
 		
			}else{
			$("#referenceDiv").hide();
			}
		
		$("#cancelTT").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "AffRefProjects.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" +   errorThrown + ", status:" + status);
				},  
				success : function(data, status, jqXHR) { // on success..
					$("#affrefproject_form_content").html(jqXHR.responseText);
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
			$('#affrefproject_form').submit();
// 			$(':button').prop('disabled',true);	    	
			return false;        
		});
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					$("#affrefproject_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#affrefproject_form_content").html(jqXHR.responseText);
					
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
						jQuery("#affref_project_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
					}
// 					$(':button').prop('disabled',false);	    	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();
			
	});            
</script>