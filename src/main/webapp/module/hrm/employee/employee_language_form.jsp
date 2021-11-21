<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<%-- <script type="text/javascript" src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script> --%>
<!-- <link rel="stylesheet" type="text/css" media="screen" href="js/plugin/ajaxwidget/ui.combobox-custom.css">	 -->
<s:set id="lang" name="lang"><s:property value="locale.language"/></s:set>
<!-- widget div-->
<div id="employee_language_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<input id="lang" name="lang" value="locale.language" type="hidden">
		<form id="employee_language_form" class="form-horizontal" action="EmployeeLanguageSave.do" accept-charset="utf8" method="post">
			<input type="hidden" id="employeeLanguage.id"
				name="employeeLanguage.id"
				value="<s:property value="employeeLanguage.id"/>" />
			<fieldset>
				<!-- START employeeLanguage.employee.id -->
				<input id="employeeLanguage.employee.id" name="employeeLanguage.employee.id" value="<s:property value='employeeLanguage.employee.id'/>" type="hidden">
				<!-- END employeeLanguage.employee.id -->
				<!-- START employeeLanguage.language.id -->
				<s:if test="fieldErrors.get('employeeLanguage.language.id')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.language"/></label>
						<div class="col-md-10">
							<input id="languageName" name="languageName" class="form-control"
								placeholder="Default Text Field" type="text"><span class="help-block"><i class="fa fa-warning"></i> 
								<s:property value="fieldErrors.get('employeeLanguage.language.id')" />
								 </span> 
								 <input id="employeeLanguage.language.id" name="employeeLanguage.language.id" value="<s:property value='employeeLanguage.language.id'/>"
								type="hidden">
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.language"/></label>
						<div class="col-md-10">
								
								<s:if test="%{#lang=='al'}">
									<input id="languageName" name="languageName" class="form-control"
									placeholder="<s:text name="hum.employee.label.language"/>" type="text" 
									value="<s:property value='employeeLanguage.language.name'/>">
								</s:if>
									
								<s:elseif test="%{#lang=='sr'}">
									<input id="languageName" name="languageName" class="form-control"
									placeholder="<s:text name="hum.employee.label.language"/>" type="text" 
									value="<s:property value='employeeLanguage.language.nameSr'/>">
								</s:elseif>
								
								<s:else>
									<input id="languageName" name="languageName" class="form-control"
									placeholder="<s:text name="hum.employee.label.language"/>" type="text" 
									value="<s:property value='employeeLanguage.language.nameEn'/>">
								</s:else>
								
								<input
								id="employeeLanguage.language.id"
								name="employeeLanguage.language.id"
								value="<s:property value='employeeLanguage.language.id'/>"
								type="hidden">
						</div>
					</div>
				</s:else>
				<!-- END employeeLanguage.language.id -->
				<!-- START employeeLanguage.reading -->
				<s:if test="fieldErrors.get('employeeLanguage.reading')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.reading"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employeeLanguage.reading" name="employeeLanguage.reading">
								<s:iterator value="languageLevelList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{#lang=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i>
								<s:property value="fieldErrors.get('employeeLanguage.reading')"/>
							</span> 
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="hum.employee.label.reading"/></label>
					<div class="col-md-10">
						<select class="form-control" id="employeeLanguage.reading" name="employeeLanguage.reading">
							<s:iterator value="languageLevelList" var="la">
								<option value="<s:property value="#la.getDOMVALUE()" />">
									<s:if test="%{#lang=='al'}">
										<s:property value="#la.getDOMTEXT()" />
									</s:if>
									<s:elseif test="%{#lang=='sr'}">
										<s:property value="#la.getDOMTEXT_SR()" />
									</s:elseif>
									<s:else>
										<s:property value="#la.getDOMTEXT_EN()" />
									</s:else>
								</option>
							</s:iterator>
						</select>
					</div>
				</div>
				</s:else>
				<!-- END employeeLanguage.reading -->
				<!-- START employeeLanguage.speaking -->
				<s:if test="fieldErrors.get('employeeLanguage.speaking')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.speaking"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employeeLanguage.speaking" name="employeeLanguage.speaking" >
								<s:iterator value="languageLevelList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{#lang=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i>
							<s:property value="fieldErrors.get('employeeLanguage.speaking')"/>
							</span>
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="hum.employee.label.speaking"/></label>
					<div class="col-md-10">
						<select class="form-control" id="employeeLanguage.speaking" name="employeeLanguage.speaking" >
							<s:iterator value="languageLevelList" var="la">
								<option value="<s:property value="#la.getDOMVALUE()" />">
									<s:if test="%{#lang=='al'}">
										<s:property value="#la.getDOMTEXT()" />
									</s:if>
									<s:elseif test="%{#lang=='sr'}">
										<s:property value="#la.getDOMTEXT_SR()" />
									</s:elseif>
									<s:else>
										<s:property value="#la.getDOMTEXT_EN()" />
									</s:else>
								</option>
							</s:iterator>
						</select>
					</div>
				</div>
				</s:else>
				<!-- END employeeLanguage.speking -->
				<!-- START employeeLanguage.writing -->
				<s:if test="fieldErrors.get('employeeLanguage.writing')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.writing"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employeeLanguage.writing" name="employeeLanguage.writing">
								<s:iterator value="languageLevelList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{#lang=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i>
							<s:property value="fieldErrors.get('employeeLanguage.writing')"/>
							</span>
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="hum.employee.label.writing"/></label>
					<div class="col-md-10">
						<select class="form-control" id="employeeLanguage.writing" name="employeeLanguage.writing">
							<s:iterator value="languageLevelList" var="la">
								<option value="<s:property value="#la.getDOMVALUE()" />">
									<s:if test="%{#lang=='al'}">
										<s:property value="#la.getDOMTEXT()" />
									</s:if>
									<s:elseif test="%{#lang=='sr'}">
										<s:property value="#la.getDOMTEXT_SR()" />
									</s:elseif>
									<s:else>
										<s:property value="#la.getDOMTEXT_EN()" />
									</s:else>
								</option>
							</s:iterator>
						</select>
					</div>
				</div>
				</s:else>
				<!-- END employeeLanguage.writing -->
				<!-- START employeeLanguage.understanding -->
				<s:if test="fieldErrors.get('employeeLanguage.understanding')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label" for="select-1">*<s:text name="hum.employee.label.understanding"/></label>
						<div class="col-md-10">
							<select class="form-control" id="employeeLanguage.understanding" name="employeeLanguage.understanding">
								<s:iterator value="languageLevelList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{#lang=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{#lang=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i>
							<s:property value="fieldErrors.get('employeeLanguage.understanding')"/>
							</span>
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="form-group">
					<label class="col-md-2 control-label">*<s:text name="hum.employee.label.understanding"/></label>
					<div class="col-md-10">
						<select class="form-control" id="employeeLanguage.understanding" name="employeeLanguage.understanding">
							<s:iterator value="languageLevelList" var="la">
								<option value="<s:property value="#la.getDOMVALUE()" />">
									<s:if test="%{#lang=='al'}">
										<s:property value="#la.getDOMTEXT()" />
									</s:if>
									<s:elseif test="%{#lang=='sr'}">
										<s:property value="#la.getDOMTEXT_SR()" />
									</s:elseif>
									<s:else>
										<s:property value="#la.getDOMTEXT_EN()" />
									</s:else>
								</option>
							</s:iterator>
						</select>
					</div>
				</div>
				</s:else>
				<!-- END employeeLanguage.understanding -->

			</fieldset>
			<footer class="form-actions">
				<button id="cancelLanguage1" class="btn btn-default" type="button">
					<s:text name="label.button.cancel"></s:text>
				</button>
				<button id="saveLanguage1" class="btn btn-primary ladda-button" type="submit" data-style="expand-right" data-color="green" data-size="medium" data-spinner-size="25" data-spinner-color="#ff0000">
					<i class="fa fa-save"></i>
					<s:text name="label.button.save"></s:text>
				</button>
			</footer>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget -->
<script type="text/javascript">
// 		function editLanguageButton(objButton){
// 				var link = "EmployeeLanguage.form.do?employeeLanguageId=" + objButton.value;
// 				openDialogForm('employee_language_form_content',link,"<s:text name="employee.language"/>",800,450);
// 				return false;
// 		};
	$(document).ready(function () {
		
		
		$("#languageName").select2({
		    placeholder: "", 
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.language.do",
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
		    	$("#employeeLanguage\\.language\\.id").val(item.id);
		    	$("#languageName").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		var langName=$("#languageName").val();
		$("#languageName").select2("data", {id: "<s:property value='employeeLanguage.language.id'/>", name: langName});

		$("#employeeLanguage\\.employee\\.id").val($("#employeeId").val());
		$('#employeeLanguage\\.speaking').val('<s:property value="employeeLanguage.speaking.DOMVALUE"/>');
		$('#employeeLanguage\\.reading').val('<s:property value="employeeLanguage.reading.DOMVALUE"/>');
		$('#employeeLanguage\\.writing').val('<s:property value="employeeLanguage.writing.DOMVALUE"/>');
		$('#employeeLanguage\\.understanding').val('<s:property value="employeeLanguage.understanding.DOMVALUE"/>');

		$("#cancelLanguage1").on('click', function(){
			$("#employee_language_form_content").dialog('close');
		});
		
// 		$("#saveLanguage1").on('click', function(){
// 			$('#employee_language_form').submit();
// 			});

		$("#employee_language_form_content").on('remove',function(){
			$("#addLanguageButton").prop('disabled',false);
		});	
		Ladda.bind('#saveLanguage1');
		$("#employee_language_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#employee_language_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					
					if(!errors){
						var link = "Employee.language.do?employeeId=" + $("#employeeId").val();
						loadURL(link, $("#languageTab"));
						$("#employee_language_form_content").dialog("close");										
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});								
					}  
					else{
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
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});


		
	});            
</script>
