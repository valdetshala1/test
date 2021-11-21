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
		<form id="doccategory_form" class="form-horizontal" action="DocCategorySave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="dp.doc.category.data.form"/></legend>
				<input id="docCategory.id" name="docCategory.id" value="<s:property value='docCategory.id'/>" type="hidden">
				<input id="docCategory.personByCreatedby.id" name="docCategory.personByCreatedby.id" value="<s:property value='docCategory.personByCreatedby.id'/>" type="hidden">
				<input id="docCategory.personByUpdatedby.id" name="docCategory.personByUpdatedby.id" value="<s:property value='docCategory.personByUpdatedby.id'/>" type="hidden">
				<input id="docCategory.created" name="docCategory.created" value="<s:property value='docCategory.created'/>" type="hidden">
				<input id="docCategory.updated" name="docCategory.updated" value="<s:property value='docCategory.updated'/>" type="hidden">
				
				<!-- START docCategory.name -->
				<s:if test="fieldErrors.get('docCategory.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dp.doc.category.label.name"/></label>
							<div class="col-md-10">
								<input maxlength="60" id="docCategory.name" name="docCategory.name" class="form-control" placeholder="<s:text name="dp.doc.category.label.name"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docCategory.name')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="dp.doc.category.label.name"/></label>
						<div class="col-md-10">
						<input maxlength="60" id="docCategory.name" name="docCategory.name" class="form-control" value="<s:property value='docCategory.name'/>" placeholder="<s:text name="dp.doc.category.label.name"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END docCategory.name -->
				
				<!-- START docCategory.nameEn -->
				<s:if test="fieldErrors.get('docCategory.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dp.doc.category.label.nameEn"/></label>
							<div class="col-md-10">
								<input maxlength="60" id="docCategory.nameEn" name="docCategory.nameEn" class="form-control" placeholder="<s:text name="dp.doc.category.label.nameEn"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docCategory.nameEn')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="dp.doc.category.label.nameEn"/></label>
						<div class="col-md-10">
						<input maxlength="60" id="docCategory.nameEn" name="docCategory.nameEn" class="form-control" value="<s:property value='docCategory.nameEn'/>" placeholder="<s:text name="dp.doc.category.label.nameEn"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END docCategory.nameEn -->
				
				<!-- START docCategory.nameSr -->
				<s:if test="fieldErrors.get('docCategory.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="dp.doc.category.label.nameSr"/></label>
							<div class="col-md-10">
								<input maxlength="60" id="docCategory.nameSr" name="docCategory.nameSr" class="form-control" placeholder="<s:text name="dp.doc.category.label.nameSr"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docCategory.nameSr')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="dp.doc.category.label.nameSr"/></label>
						<div class="col-md-10">
						<input maxlength="60" id="docCategory.nameSr" name="docCategory.nameSr" class="form-control" value="<s:property value='docCategory.nameSr'/>" placeholder="<s:text name="dp.doc.category.label.nameSr"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END docCategory.nameSr -->
				
				<!-- START docCategory.categorytype -->
				<s:if test="fieldErrors.get('docCategory.categorytype')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dp.doc.category.categorytype"/></label>
							<div class="col-md-10">
								<input maxlength="60" id="docCategory.categorytype" name="docCategory.categorytype" class="form-control" placeholder="<s:text name="dp.doc.category.categorytype"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docCategory.categorytype')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="dp.doc.category.categorytype"/></label>
						<div class="col-md-10">
						<input maxlength="60" id="docCategory.categorytype" name="docCategory.categorytype" class="form-control" value="<s:property value='docCategory.categorytype'/>" placeholder="<s:text name="dp.doc.category.categorytype"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END docCategory.categorytype -->
				
				<!-- START docCategory.docbasetype -->
<%-- 				<s:if test="fieldErrors.get('docCategory.docbasetype')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="dp.doc.category.docbasetype"/></label> --%>
<!-- 							<div class="col-md-10"> -->
<%-- 								<input maxlength="60" id="docCategory.docbasetype" name="docCategory.docbasetype" class="form-control" placeholder="<s:text name="dp.doc.category.docbasetype"/>"/> --%>
<%-- 								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docCategory.docbasetype')"/></span>  --%>
<!-- 							</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label" ><s:text name="dp.doc.category.docbasetype"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 						<input maxlength="60" id="docCategory.docbasetype" name="docCategory.docbasetype" class="form-control" value="<s:property value='docCategory.docbasetype'/>" placeholder="<s:text name="dp.doc.category.docbasetype"/>"/> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
				<!-- END docCategory.docbasetype -->
				
				
				<div class="form-group">
					<!-- START docCategory.isactive -->
					<s:if test="fieldErrors.get('docCategory.isactive')!=null">
						<div class="has-error">
								<label class="control-label col-sm-2"><s:text name="dp.doc.category.isactive"/></label>
								<div class="col-md-2">
									<input type="checkbox" id="docCategory.isactive" name="docCategory.isactive"placeholder="<s:text name="dp.doc.category.isactive"/>"/>
									<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docCategory.isactive')"/></span> 
								</div>
						</div>
					</s:if>
					<s:else>
						<div>
							<label class="control-label col-sm-2" ><s:text name="dp.doc.category.isactive"/></label>
							<div class="col-md-2">
							<input type="checkbox" id="docCategory.isactive" name="docCategory.isactive" value="<s:property value='docCategory.isactive'/>" placeholder="<s:text name="dp.doc.category.isactive"/>"/>
							</div>
						</div>
					</s:else>
					<!-- END docCategory.isactive -->
					
					<!-- START docCategory.isdefault -->
<%-- 					<s:if test="fieldErrors.get('docCategory.isdefault')!=null"> --%>
<!-- 						<div class="has-error"> -->
<%-- 							<label class="control-label col-sm-1"><s:text name="dp.doc.category.isdefault"/></label> --%>
<!-- 								<div class="col-md-1"> -->
<%-- 									<input type="checkbox" id="docCategory.isdefault" name="docCategory.isdefault" placeholder="<s:text name="dp.doc.category.isdefault"/>"/> --%>
<%-- 									<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docCategory.isdefault')"/></span>  --%>
<!-- 								</div> -->
<!-- 						</div> -->
<%-- 					</s:if> --%>
<%-- 					<s:else> --%>
<!-- 						<div> -->
<%-- 							<label class="control-label col-sm-1" ><s:text name="dp.doc.category.isdefault"/></label> --%>
<!-- 							<div class="col-md-1"> -->
<%-- 							<input type="checkbox" id="docCategory.isdefault" name="docCategory.isdefault" value="<s:property value='docCategory.isdefault'/>" placeholder="<s:text name="dp.doc.category.isdefault"/>"/> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</s:else> --%>
					<!-- END docCategory.isdefault -->					
				</div>
				
				

				
				<!-- START docCategory.description -->
				<s:if test="fieldErrors.get('docCategory.description')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="dp.doc.category.description"/></label>
							<div class="col-md-10">
								<textarea maxlength="255" id="docCategory.description" name="docCategory.description" class="form-control" placeholder="<s:text name="dp.doc.category.description"/>"></textarea>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docCategory.description')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="dp.doc.category.description"/></label>
						<div class="col-md-10">
						<textarea maxlength="255" id="docCategory.description" name="docCategory.description" class="form-control"  placeholder="<s:text name="dp.doc.category.description"/>"><s:property value='docCategory.description'/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END docCategory.description -->
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelDC" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveDC" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		if($("#docCategory\\.isactive").val()=='Y'){
			$("#docCategory\\.isactive").prop('checked',true);
		}else{
			$("#docCategory\\.isactive").val('N');
		}

		$("#docCategory\\.isactive").on('change',function(){
			if($("#docCategory\\.isactive").is(":checked")){
				$("#docCategory\\.isactive").val('Y');
			}else{
				$("#docCategory\\.isactive").val('N');
			}
		});
		
		if($("#docCategory\\.isdefault").val()=='Y'){
			$("#docCategory\\.isdefault").prop('checked',true);
		}else{
			$("#docCategory\\.isdefault").val('N');
		}

		$("#docCategory\\.isdefault").on('change',function(){
			if($("#docCategory\\.isdefault").is(":checked")){
				$("#docCategory\\.isdefault").val('Y');
			}else{
				$("#docCategory\\.isdefault").val('N');
			}
		});
		
		$("#cancelDC").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "DpCatMngmt.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#doccategory_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						timeout: 5000,
						icon : "fa fa-shield fadeInLeft animated",
						number : "2"
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;        
		});
		Ladda.bind('#saveDC');
		$("#saveDC").on('click', function() {
			$("#doccategory_form :button").prop('disabled','disabled');
			$('#doccategory_form').submit();
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
					$("#doccategory_form_content").html(response);
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
			    	$("#doccategory_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						$("#doccategory_grid").trigger("reloadGrid");
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
			$("#doccategory_form :button").prop('disabled',false);				
		})();		
			    	
	});            
</script>