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
		<form id="doctype_form" class="form-horizontal" action="DocTypeSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="dp.doc.type.data.form"/></legend>
				<input id="docType.id" name="docType.id" value="<s:property value='docType.id'/>" type="hidden">
				<input id="docType.personByCreatedby.id" name="docType.personByCreatedby.id" value="<s:property value='docType.personByCreatedby.id'/>" type="hidden">
				<input id="docType.personByUpdatedby.id" name="docType.personByUpdatedby.id" value="<s:property value='docType.personByUpdatedby.id'/>" type="hidden">
				<input id="docType.created" name="docType.created" value="<s:property value='docType.created'/>" type="hidden">
				<input id="docType.updated" name="docType.updated" value="<s:property value='docType.updated'/>" type="hidden">
				
				<!-- START docType.name -->
				<s:if test="fieldErrors.get('docType.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dp.doc.type.label.name"/></label>
							<div class="col-md-10">
								<input maxlength="60" id="docType.name" name="docType.name" class="form-control" placeholder="<s:text name="dp.doc.type.label.name"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.name')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="dp.doc.type.label.name"/></label>
						<div class="col-md-10">
						<input maxlength="60" id="docType.name" name="docType.name" class="form-control" value="<s:property value='docType.name'/>" placeholder="<s:text name="dp.doc.type.label.name"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END docType.name -->
				
				<!-- START docType.nameEn -->
				<s:if test="fieldErrors.get('docType.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dp.doc.type.label.nameEn"/></label>
							<div class="col-md-10">
								<input maxlength="60" id="docType.nameEn" name="docType.nameEn" class="form-control" placeholder="<s:text name="dp.doc.type.label.nameEn"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.nameEn')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="dp.doc.type.label.nameEn"/></label>
						<div class="col-md-10">
						<input maxlength="60" id="docType.nameEn" name="docType.nameEn" class="form-control" value="<s:property value='docType.nameEn'/>" placeholder="<s:text name="dp.doc.type.label.nameEn"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END docType.nameEn -->
				
				<!-- START docType.nameSr -->
				<s:if test="fieldErrors.get('docType.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="dp.doc.type.label.nameSr"/></label>
							<div class="col-md-10">
								<input maxlength="60" id="docType.nameSr" name="docType.nameSr" class="form-control" placeholder="<s:text name="dp.doc.type.label.nameSr"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.nameSr')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="dp.doc.type.label.nameSr"/></label>
						<div class="col-md-10">
						<input maxlength="60" id="docType.nameSr" name="docType.nameSr" class="form-control" value="<s:property value='docType.nameSr'/>" placeholder="<s:text name="dp.doc.type.label.nameSr"/>"/>
						</div>
					</div>
				</s:else>
				<!-- END docCategory.nameSr -->
				
				<!-- START docType.printname -->
<%-- 				<s:if test="fieldErrors.get('docType.printname')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label">*<s:text name="dp.doc.type.label.printname"/></label> --%>
<!-- 							<div class="col-md-10"> -->
<%-- 								<input maxlength="60" id="docType.printname" name="docType.printname" class="form-control" placeholder="<s:text name="dp.doc.type.label.printname"/>"/> --%>
<%-- 								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.printname')"/></span>  --%>
<!-- 							</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label" >*<s:text name="dp.doc.type.label.printname"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 						<input maxlength="60" id="docType.printname" name="docType.printname" class="form-control" value="<s:property value='docType.printname'/>" placeholder="<s:text name="dp.doc.type.label.printname"/>"/> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
<!-- 				END docType.printname -->
				
<!-- 				START docType.printnameEn -->
<%-- 				<s:if test="fieldErrors.get('docType.printnameEn')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label">*<s:text name="dp.doc.type.label.printnameEn"/></label> --%>
<!-- 							<div class="col-md-10"> -->
<%-- 								<input maxlength="60" id="docType.printnameEn" name="docType.printnameEn" class="form-control" placeholder="<s:text name="dp.doc.type.label.printnameEn"/>"/> --%>
<%-- 								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.printnameEn')"/></span>  --%>
<!-- 							</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label" >*<s:text name="dp.doc.type.label.printnameEn"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 						<input maxlength="60" id="docType.printnameEn" name="docType.printnameEn" class="form-control" value="<s:property value='docType.printnameEn'/>" placeholder="<s:text name="dp.doc.type.label.printnameEn"/>"/> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
<!-- 				END docType.nameEn -->
				
<!-- 				START docType.printnameSr -->
<%-- 				<s:if test="fieldErrors.get('docType.printnameSr')!=null"> --%>
<!-- 					<div class="form-group has-error"> -->
<%-- 						<label class="col-md-2 control-label"><s:text name="dp.doc.type.label.printnameSr"/></label> --%>
<!-- 							<div class="col-md-10"> -->
<%-- 								<input maxlength="60" id="docType.printnameSr" name="docType.printnameSr" class="form-control" placeholder="<s:text name="dp.doc.type.label.printnameSr"/>"/> --%>
<%-- 								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.printnameSr')"/></span>  --%>
<!-- 							</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
<%-- 				<s:else> --%>
<!-- 					<div class="form-group"> -->
<%-- 						<label class="col-md-2 control-label" ><s:text name="dp.doc.type.label.printnameSr"/></label> --%>
<!-- 						<div class="col-md-10"> -->
<%-- 						<input maxlength="60" id="docType.printnameSr" name="docType.printnameSr" class="form-control" value="<s:property value='docType.printnameSr'/>" placeholder="<s:text name="dp.doc.type.label.printnameSr"/>"/> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:else> --%>
<!-- 				END docCategory.nameSr -->
				
				<!-- START docType.docCategory -->
				<s:if test="fieldErrors.get('docType.docCategory.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dp.doc.category.label.name"/></label>
							<div class="col-md-10">
								<input id="docType.docCategory.name" name="docType.docCategory.name" class="form-control" placeholder="<s:text name="dp.doc.category.label.name"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.docCategory.id')"/></span> 
								<input type="hidden" id="docType.docCategory.id" name="docType.docCategory.id" value="<s:property value='docType.docCategory.id'/>"/>
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" >*<s:text name="dp.doc.category.label.name"/></label>
						<div class="col-md-10">
							<input id="docType.docCategory.name" name="docType.docCategory.name" class="form-control" value="<s:property value='docType.docCategory.name'/>" placeholder="<s:text name="dp.doc.category.label.name"/>"/>
							<input type="hidden" id="docType.docCategory.id" name="docType.docCategory.id" value="<s:property value='docType.docCategory.id'/>"/>
						</div>
					</div>
				</s:else>
				<!-- END docType.docCategory -->
				
				<!-- START docType.docbasetype -->
				<div class="form-group">
					<s:if test="fieldErrors.get('docType.docbasetype')!=null">
					<div class="has-error">
						<label class="col-md-2 control-label">*<s:text name="dp.doc.category.docbasetype"/></label>
							<div class="col-md-10">
								<input maxlength="60" id="docType.docbasetype" name="docType.docbasetype" class="form-control" placeholder="<s:text name="dp.doc.category.docbasetype"/>"/>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.docbasetype')"/></span> 
							</div>
					</div>
					</s:if>
					<s:else>
					<div>
						<label class="col-md-2 control-label" >*<s:text name="dp.doc.category.docbasetype"/></label>
						<div class="col-md-10">
						<input maxlength="60" id="docType.docbasetype" name="docType.docbasetype" class="form-control" value="<s:property value='docType.docbasetype'/>" placeholder="<s:text name="dp.doc.category.docbasetype"/>"/>
						</div>
					</div>
					</s:else>
				</div>
				<!-- END docType.docbasetype -->
				
		      <div class="form-group">
		      		
					<label class="control-label col-sm-2" ><s:text name="dp.doc.category.isactive"/></label>
					<div class="col-md-1">
					<input type="checkbox" id="docType.isactive" name="docType.isactive" value="<s:property value='docType.isactive'/>" placeholder="<s:text name="dp.doc.category.isactive"/>"/>
					</div>
		          
<%-- 		            <s:if test="fieldErrors.get('docType.issotrx')!=null"> --%>
<!-- 		            <div class="has-error"> -->
<%-- 						<label class="control-label col-sm-1" ><s:text name="dp.doc.type.issotrx"/></label> --%>
<!-- 						<div class="col-md-1"> -->
<%-- 						<input type="checkbox" id="docType.issotrx" name="docType.issotrx" value="<s:property value='docType.issotrx'/>" placeholder="<s:text name="dp.doc.type.issotrx"/>"/> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 					</s:if> --%>
<%-- 				    <s:else> --%>
<!-- 				    <div> -->
<%-- 						<label class="control-label col-sm-1" ><s:text name="dp.doc.type.issotrx"/></label> --%>
<!-- 						<div class="col-md-1"> -->
<%-- 						<input type="checkbox" id="docType.issotrx" name="docType.issotrx" value="<s:property value='docType.issotrx'/>" placeholder="<s:text name="dp.doc.type.issotrx"/>"/> --%>
<!-- 						</div> -->
<!-- 					</div>				     -->
<%-- 				    </s:else> --%>
		          
<%-- 					<label class="control-label col-sm-1" ><s:text name="dp.doc.type.isdocnocontrolled"/></label> --%>
<!-- 					<div class="col-md-1"> -->
<%-- 					<input type="checkbox" id="docType.isdocnocontrolled" name="docType.isdocnocontrolled" value="<s:property value='docType.isdocnocontrolled'/>" placeholder="<s:text name="dp.doc.type.isdocnocontrolled"/>"/> --%>
<!-- 					</div> -->
		      </div>				
				

				<!-- START docType.description -->
				<s:if test="fieldErrors.get('docType.description')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="dp.doc.category.description"/></label>
							<div class="col-md-10">
								<textarea maxlength="255" id="docType.description" name="docType.description" class="form-control" placeholder="<s:text name="dp.doc.category.description"/>"></textarea>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.description')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="dp.doc.category.description"/></label>
						<div class="col-md-10">
						<textarea maxlength="255" id="docType.description" name="docType.description" class="form-control"  placeholder="<s:text name="dp.doc.category.description"/>"><s:property value='docType.description'/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END docType.description -->
				
				<!-- START docType.documentnote -->
				<s:if test="fieldErrors.get('docType.documentnote')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="dp.doc.type.documentnote"/></label>
							<div class="col-md-10">
								<textarea maxlength="2000" id="docType.documentnote" name="docType.documentnote" class="form-control" placeholder="<s:text name="dp.doc.type.documentnote"/>"></textarea>
								<span class="help-block"><i class="fa fa-warning"></i><s:property value="fieldErrors.get('docType.documentnote')"/></span> 
							</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" ><s:text name="dp.doc.type.documentnote"/></label>
						<div class="col-md-10">
						<textarea maxlength="2000" id="docType.documentnote" name="docType.documentnote" class="form-control"  placeholder="<s:text name="dp.doc.type.documentnote"/>"><s:property value='docType.documentnote'/></textarea>
						</div>
					</div>
				</s:else>
				<!-- END docType.documentnote -->
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelDT" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveDT" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
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
		if($("#docType\\.isactive").val()=='Y'){
			$("#docType\\.isactive").prop('checked',true);
		}else{
			$("#docType\\.isactive").val('N');
		}

		$("#docType\\.isactive").on('change',function(){
			if($("#docType\\.isactive").is(":checked")){
				$("#docType\\.isactive").val('Y');
			}else{
				$("#docType\\.isactive").val('N');
			}
		});
		
		if($("#docType\\.isdocnocontrolled").val()=='Y'){
			$("#docType\\.isdocnocontrolled").prop('checked',true);
		}else{
			$("#docType\\.isdocnocontrolled").val('N');
		}

		$("#docType\\.isdocnocontrolled").on('change',function(){
			if($("#docType\\.isdocnocontrolled").is(":checked")){
				$("#docType\\.isdocnocontrolled").val('Y');
			}else{
				$("#docType\\.isdocnocontrolled").val('N');
			}
		});

		if($("#docType\\.issotrx").val()=='Y'){
			$("#docType\\.issotrx").prop('checked',true);
		}else{
			$("#docType\\.issotrx").val('N');
		}

		$("#docType\\.issotrx").on('change',function(){
			if($("#docType\\.issotrx").is(":checked")){
				$("#docType\\.issotrx").val('Y');
			}else{
				$("#docType\\.issotrx").val('N');
			}
		});

		$("#docType\\.docCategory\\.name").select2({
	        placeholder: "",
	        minimumInputLength: 0,
	        ajax: {
		        url: "DpInput.docCategory.do",
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
	        	$("#docType\\.docCategory\\.id").val(item.id);
	        	$("#docType\\.docCategory\\.name").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

	    $("#docType\\.docCategory\\.name").select2("data", {id: "<s:property value='docType.docCategory.id'/>", name: "<s:property value='docType.docCategory.name'/>"});

		
		$("#cancelDT").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "DpTypeMngmt.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#doctype_form_content").html(jqXHR.responseText);
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
		Ladda.bind('#saveDT');
		$("#saveDT").on('click', function() {
			$("#doctype_form :button").prop('disabled','disabled');
			$('#doctype_form').submit();
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
			    	$("#doctype_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						$("#doctype_grid").trigger("reloadGrid");
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
			$("#doctype_form :button").prop('disabled',false);				
		})();
	});            
</script>