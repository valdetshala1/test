<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../base/nocache.jsp"%>
<script type="text/javascript">
	pageSetUp();

	// PAGE RELATED SCRIPTS

	// pagefunction
	
	var pagefunction = function() {
		
		// summernote
		$('.summernote').summernote({
			height : 180,
			focus : false,
			tabsize : 2
		});

		$('.summernoteEn').summernote({
			height : 180,
			focus : false,
			tabsize : 2
		});

		$('.summernoteSr').summernote({
			height : 180,
			focus : false,
			tabsize : 2
		});
		
		$(".note-codable").remove();
		$('button[data-event="codeview"]').hide();
		// markdown
		$("#mymarkdown").markdown({
			autofocus:false,
			savable:true
		});
		
	};
	
	var pagedestroy = function(){
		$(".summernote").summernote( 'destroy' );
		$(".summernoteEn").summernote( 'destroy' );
		$(".summernoteSr").summernote( 'destroy' );
		$("#mymarkdown").markdown( 'destroy' );
		$(".note-codable").remove();
		if (debugState){
			root.console.log("✔ Summernote and Markdown editors destroyed");
		} 

	};
	loadScript("js/plugin/summernote/summernote.min.js", function(){
		loadScript("js/plugin/markdown/markdown.min.js", function(){
			loadScript("js/plugin/markdown/to-markdown.min.js", function(){
				loadScript("js/plugin/markdown/bootstrap-markdown.min.js", pagefunction);
			});
		});
	});

	function checkFileType(myFile){
   	    var file = myFile.files[0];  
   	    var filename = file.name;
   	    var fileExt = filename.split('.').pop();
   	   	//Check if file is image. jpeg, jpg, png, gif are only allowed images in this app. 
   	    if(fileExt!="jpeg" && fileExt!="jpg" && fileExt!="png" && fileExt!="gif"){
			$("#file").val(null);
			alert("Please choose a .jpeg, .jpg, .png or .gif photo ");
   	   	}
   	}
   	
	$(document).ready(function () {
		$('#publishing\\.publishedDate').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
	    			
		});

		Ladda.bind('#save');
		$("#save").on('click', function () {              
			$("#publishing\\.htmlCode").val($('.summernote').code());
			$("#publishing\\.htmlCodeEn").val($('.summernoteEn').code());
			$("#publishing\\.htmlCodeSr").val($('.summernoteSr').code());
			$("#pub_form :button").prop('disabled','disabled');
			$('#pub_form').submit();
			return false;        
		});

		var isImportant=$('#publishing\\.important').val();
		
		$('#publishing\\.important').on('change',function(event){
			$('#publishing\\.important').val($('#publishing\\.important')[0].checked ? "true" : "false" );
		});
		
		if(isImportant=="true"){
			$("#publishing\\.important").prop('checked',true);
		}else{
			$("#publishing\\.important").prop('checked',false);
		}

		var isPublished=$('#publishing\\.published').val();
		
		$('#publishing\\.published').on('change',function(event){
			$('#publishing\\.published').val($('#publishing\\.published')[0].checked ? "true" : "false" );
		});
		
		if(isPublished=="true"){
			$("#publishing\\.published").prop('checked',true);
		}else{
			$("#publishing\\.published").prop('checked',false);
		}

		if($("#publishing\\.htmlCode").val()){
			 $('.summernote').code($("#publishing\\.htmlCode").val());
			}

		if($("#publishing\\.htmlCodeEn").val()){
			 $('.summernoteEn').code($("#publishing\\.htmlCodeEn").val());
			}
		
		if($("#publishing\\.htmlCodeSr").val()){
			 $('.summernoteSr').code($("#publishing\\.htmlCodeSr").val());
			}
		
		$("#cancel").on('click', function() {
			$.ajax({
				type : "GET",
				url : "Publish.form.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#pub_form_content").html(jqXHR.responseText);
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
// 		$('.summernote').code();
// 		$("#test").append($("#publishing\\.htmlCode").val());

		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    	//$('#ajaxBusyB').show();
			    },
				error : function(response, status, err){
					$("#pub_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#pub_form_content").html(jqXHR.responseText);
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
	 					jQuery("#publish_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});
						$("#pub_form_content").html(jqXHR.responseText);
					}		
			    },	    
				complete: function(xhr) {
					//$('#ajaxBusyB').hide();
				}
			});		
			$("#pub_form :button").prop('disabled',false);
		})();	

	});
    </script>
    
				<div>
					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->
					</div>
					<!-- end widget edit box -->
					<!-- widget content -->
<!-- 					<div class="widget-body no-padding"> -->
				  <form id="pub_form" class="form-horizontal" action="PublishSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
					<input type="hidden" id="publishing.id" name="publishing.id" value="<s:property value="publishing.id"/>" />
					<input type="hidden" id="publishing.person.id" name="publishing.person.id" value="<s:property value="publishing.person.id"/>" />
					<input type="hidden" id="publishing.createdDate" name="publishing.createdDate" value="<s:property value="publishing.createdDate"/>" />
					<br>
					<fieldset>
						<div class="form-group">
						<!-- START publishing.publishedDate -->
						<s:if test="fieldErrors.get('publishing.publishedDate')!=null">
							<div class="has-error">
								<label class="col-md-2 control-label">*<s:text name='pub.publishing.publishedDate.label'/></label>
								<div class="col-md-2">
									<input id="publishing.publishedDate" name="publishing.publishedDate" class="form-control" placeholder="<s:text name='pub.publishing.publishedDate.label'/>" type="text">
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('publishing.publishedDate')"/> </span>
								</div>					
							</div>
						</s:if>
						<s:else>
	<!-- 						<div class="form-group"> -->
								<label class="col-md-2 control-label">*<s:text name='pub.publishing.publishedDate.label'/></label>
								<div class="col-md-2">
									<input id="publishing.publishedDate" name="publishing.publishedDate" value="<s:property value='publishing.publishedDate'/>" class="form-control" placeholder="<s:text name='pub.publishing.publishedDate.label'/>" type="text">
								</div>									
						</s:else>
						<!-- END publishing.publishedDate -->
						<!-- START publishing.published -->
								<label class="col-md-2 control-label"><s:text name='pub.publishing.important.label'/></label>
								<div class="col-md-1">
									<input id="publishing.important" name="publishing.important"  value="<s:property value='publishing.important'/>" type="checkbox">
								</div>
								<label class="col-md-2 control-label"><s:text name='pub.publishing.published.label'/></label>
								<div class="col-md-1">
									<input id="publishing.published" name="publishing.published"  value="<s:property value='publishing.published'/>" type="checkbox">
								</div>
						</div>
						<!-- END publishing.publishedt -->
						<!-- START publishing.photo -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="adm.person.label.photo"/></label>
						<div class="col-md-10">
							<input class="btn btn-default btn-file" id="file" name="file" title="Please select photo file" onchange="checkFileType(this);" type="file" accept="image/*">
							<p class="help-block">
							</p>
						</div>
					</div>
				<!-- END publishing.photo -->
					
					</fieldset>
					<fieldset>
					<legend></legend>
					<!-- START publishing.title -->
					<s:if test="fieldErrors.get('publishing.title')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='pub.publishing.title.label'/></label>
							<div class="col-md-8">
								<input maxlength="100" id="publishing.title" name="publishing.title" class="form-control" placeholder="<s:text name='pub.publishing.title.label'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('publishing.title')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='pub.publishing.title.label'/></label>
							<div class="col-md-8">
								<input maxlength="100" id="publishing.title" name="publishing.title" value="<s:property value='publishing.title'/>" class="form-control" placeholder="<s:text name='pub.publishing.title.label'/>" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END publishing.title -->
					<s:if test="fieldErrors.get('publishing.htmlCode')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='pub.publishing.editor.label'/></label>
								<div class="col-md-10">
								<div class="summernote" id="summernote" >
								</div>
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('publishing.htmlCode')"/> </span>
								<input id="publishing.htmlCode" name="publishing.htmlCode" value="<s:property value='publishing.htmlCode'/>" class="form-control"  type="hidden">
							  </div>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='pub.publishing.editor.label'/></label>
								<div class="col-md-10">
								<div class="summernote" id="summernote" >
								</div>
								<input id="publishing.htmlCode" name="publishing.htmlCode" value="<s:property value='publishing.htmlCode'/>" class="form-control"  type="hidden">								
						</div>
						</div>
					</s:else>
					</fieldset>
					<fieldset>
					<legend></legend>
					<!-- START publishing.title -->
					<s:if test="fieldErrors.get('publishing.titleEn')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name='pub.publishing.titleEn.label'/></label>
							<div class="col-md-8">
								<input maxlength="100" id="publishing.titleEn" name="publishing.titleEn" class="form-control" placeholder="<s:text name='pub.publishing.titleEn.label'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('publishing.titleEn')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name='pub.publishing.titleEn.label'/></label>
							<div class="col-md-8">
								<input maxlength="100" id="publishing.titleEn" name="publishing.titleEn" value="<s:property value='publishing.titleEn'/>" class="form-control" placeholder="<s:text name='pub.publishing.titleEn.label'/>" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END publishing.title -->
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name='pub.publishing.editorEn.label'/></label>
								<div class="col-md-10">
								<div class="summernoteEn" id="summernoteEn" >
								</div>
									<input id="publishing.htmlCodeEn" name="publishing.htmlCodeEn" value="<s:property value='publishing.htmlCodeEn'/>" class="form-control"  type="hidden">
							</div>
						</div>
					</fieldset>
					<fieldset>
					<legend></legend>		
				<!-- START publishing.titleEn -->
					<s:if test="fieldErrors.get('publishing.titleSr')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label"><s:text name='pub.publishing.titleSr.label'/></label>
							<div class="col-md-8">
								<input maxlength="100" id="publishing.titleSr" name="publishing.titleSr" class="form-control" placeholder="<s:text name='pub.publishing.titleSr.label'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('publishing.titleSr')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name='pub.publishing.titleSr.label'/></label>
							<div class="col-md-8">
								<input maxlength="100" id="publishing.titleSr" name="publishing.titleSr" value="<s:property value='publishing.titleSr'/>" class="form-control" placeholder="<s:text name='pub.publishing.titleSr.label'/>" type="text">
							</div>									
						</div>
					</s:else>
					<!-- END publishing.title -->
						<div class="form-group">
							<label class="col-md-2 control-label"><s:text name='pub.publishing.editorSr.label'/></label>
								<div class="col-md-10">
								<div class="summernoteSr" id="summernoteSr" >
								</div>
									<input id="publishing.htmlCodeSr" name="publishing.htmlCodeSr" value="<s:property value='publishing.htmlCodeSr'/>" class="form-control"  type="hidden">
							</div>
						</div>
					</fieldset>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-12">
									<button id="cancel" class="btn btn-default" type="button">
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
<!-- 					</div> -->
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
