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
		<form id="location_form" class="form-horizontal form-content-gl" action="LocationSave.do" accept-charset="utf8" method="post">
			<fieldset>	
				<legend class="legend-gl"><s:text name="frm.dhpet.location.legend.location.hunting.data"/></legend>
				<input id="dhpetLocation.id" name="dhpetLocation.id" value="<s:property value='dhpetLocation.id'/>" type="hidden">
				<input id="dhpetLocation.employee.id" name="dhpetLocation.employee.id" value="<s:property value='dhpetLocation.employee.id'/>" type="hidden">
				<input id="dhpetLocation.createdDate" name="dhpetLocation.createdDate" value="<s:property value='dhpetLocation.createdDate'/>" type="hidden">
				<input id="geometry" name="geometry" value="<s:property value='dhpetLocation.theGeom'/>" type="hidden" >

				<!-- START dhpetLocation.area -->
				<s:if test="fieldErrors.get('dhpetLocation.area')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label dhpet-label">*<s:text name='frm.dhpet.location.total.area.label'/>:</label>
						<div class="col-md-8">
							<input id="dhpetLocation.area" name="dhpetLocation.area"  value="<s:property value='dhpetLocation.area'/>" class="form-control input-gl" placeholder="<s:text name="dhpet.location.label.geometry"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetLocation.area')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label dhpet-label">*<s:text name='frm.dhpet.location.total.area.label'/>:</label>
						<div class="col-md-8">
							<input id="dhpetLocation.area" name="dhpetLocation.area"  value="<s:property value='dhpetLocation.area'/>" class="form-control input-gl" placeholder="<s:text name="dhpet.location.label.geometry"/>" type="text">
						</div>									
					</div>
				</s:else>
			    <!-- END dhpetLocation.area -->
			<!-- END cadastralMunicipality -->
				   <s:if test="fieldErrors.get('dhpetLocation.cadastralMunicipality.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label dhpet-label">*<s:text name='annual.plan.municipality'/>:</label>
							<div class="col-md-8">
								<input id="dhpetLocation.cadastralMunicipality.name" name="dhpetLocation.cadastralMunicipality.name" class="form-control input-dropdown-gl" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetLocation.cadastralMunicipality.id')"/> </span>
								<input id="dhpetLocation.cadastralMunicipality.id" name="dhpetLocation.cadastralMunicipality.id" value="<s:property value='dhpetLocation.cadastralMunicipality.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label dhpet-label">*<s:text name='annual.plan.municipality'/>:</label>
							<div class="col-md-8">
								<input id="dhpetLocation.cadastralMunicipality.name" name="dhpetLocation.cadastralMunicipality.name" class="form-control input-dropdown-gl" value="<s:property value='dhpetLocation.cadastralMunicipality.name'/>" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
								<input id="dhpetLocation.cadastralMunicipality.id" name="dhpetLocation.cadastralMunicipality.id" value="<s:property value='dhpetLocation.cadastralMunicipality.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				<!-- END cadastralMunicipality -->
			   <!-- START dhpetLocation.habitatLocation -->
				<s:if test="fieldErrors.get('dhpetLocation.habitatLocation')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label dhpet-label">*<s:text name="dhpet.location.label.habitat.location"/>:</label>
						<div class="col-md-8">
							<input maxlength="50" id="dhpetLocation.habitatLocation" name="dhpetLocation.habitatLocation" class="form-control input-gl" placeholder="<s:text name="frm.dhpet.animal.capacity.habitat.location.label"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetLocation.habitatLocation')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label dhpet-label">*<s:text name="frm.dhpet.animal.capacity.habitat.location.label"/>:</label>
						<div class="col-md-8">
							<input maxlength="50" id="dhpetLocation.habitatLocation" name="dhpetLocation.habitatLocation" value="<s:property value='dhpetLocation.habitatLocation'/>" class="form-control input-gl" placeholder="<s:text name="frm.dhpet.animal.capacity.habitat.location.label"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END dhpetLocation.habitatLocation -->
				<!-- START dhpetLocation.huntingAreaType -->
				<s:if test="fieldErrors.get('dhpetLocation.huntingAreaType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label dhpet-label">*<s:text name="frm.dhpet.location.hunting.area.type"/>:</label>
						<div class="col-md-8">
							<select  class="form-control input-gl input-dropdown-gl" id="dhpetLocation.huntingAreaType"
								name="dhpetLocation.huntingAreaType">
								<option value=""> </option>
								<s:iterator value="huntingareatypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" /> 
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" /> 
										</s:else>
									</option>
								</s:iterator>
							</select><span
								class="help-block"><i class="fa fa-warning"></i> <s:property
								value="fieldErrors.get('dhpetLocation.huntingAreaType')" /> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label dhpet-label">*<s:text name="frm.dhpet.location.hunting.area.type"/>:</label>
						<div class="col-md-8">
							<select class="form-control input-gl input-dropdown-gl" id="dhpetLocation.huntingAreaType"
								name="dhpetLocation.huntingAreaType">
								<option value=""> </option>
								<s:iterator value="huntingareatypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
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
				<!-- END animalsRequest.huntingAreaType -->
				<!-- END person -->
				   <s:if test="fieldErrors.get('dhpetLocation.person.id')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label dhpet-label">*<s:text name='frm.dhpet.location.hunter.superintendby'/>:</label>
							<div class="col-md-8">
								<input id="dhpetLocation.person.firstName" name="dhpetLocation.person.firstName" class="form-control input-dropdown-gl" placeholder="<s:text name='frm.dhpet.location.hunter.superintendby'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetLocation.person.id')"/> </span>
								<input id="dhpetLocation.person.id" name="dhpetLocation.person.id" value="<s:property value='dhpetLocation.person.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label dhpet-label">*<s:text name='frm.dhpet.location.hunter.superintendby'/>:</label>
							<div class="col-md-8">
								<input id="dhpetLocation.person.firstName" name="dhpetLocation.person.firstName" class="form-control input-dropdown-gl" value="<s:property value='dhpetLocation.person.firstName'/> <s:property value='dhpetLocation.person.lastName'/>" placeholder="<s:text name='frm.dhpet.location.hunter.superintendby'/>" type="text">
								<input id="dhpetLocation.person.id" name="dhpetLocation.person.id" value="<s:property value='dhpetLocation.person.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				<!-- END person -->
				</fieldset>
				<!-- START dhpetLocation.location_land_type-->
					<div class="form-group">
						<div class="col-md-12-gl">
							<jsp:include page="location_land_type_grid.jsp"></jsp:include>
						</div>									
					</div>
				<!-- END dhpetLocation.location_land_type -->
				 <fieldset>	
				<!-- START dhpetLocation.comments -->
					<div class="form-group">
						<label class="col-md-2 control-label dhpet-label"><s:text name="dhpet.location.label.comments"/>:</label>
						<div class="col-md-8">
							<textarea id="dhpetLocation.comments" name="dhpetLocation.comments"class="form-control" placeholder="<s:text name="dhpet.location.label.comments"/>"><s:property value='dhpetLocation.comments'/></textarea> 
						</div>									
					</div>
				<!-- END dhpetLocation.comments -->
			
		</fieldset>
		<div class="form-actions footer-gl">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelLo" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveLo" class="btn btn-primary" type="submit">
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
		$('#dhpetLocation\\.huntingAreaType').val('<s:property value="dhpetLocation.huntingAreaType.DOMVALUE"/>');
	    $("#dhpetLocation\\.cadastralMunicipality\\.name").select2({
	        placeholder: "Search for a repository",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.municipality.do",
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
	        	$("#dhpetLocation\\.cadastralMunicipality\\.id").val(item.id);
	        	$("#dhpetLocation\\.cadastralMunicipality\\.name").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 
	    
	    if($("#dhpetLocation\\.cadastralMunicipality\\.id").val()){
	    	var name=characterReplace("<s:property value='dhpetLocation.cadastralMunicipality.name'/>");
	    	
	    	$("#dhpetLocation\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='dhpetLocation.cadastralMunicipality.id'/>", name: name});
// 	    	alert($("#dhpetLocation\\.cadastralMunicipality\\.name").val()+";forma");
	    	
		}

	    $("#dhpetLocation\\.person\\.firstName").select2({
	        placeholder: "Search for a repository",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.person.do",
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
	        	$("#dhpetLocation\\.person\\.id").val(item.id);
	        	$("#dhpetLocation\\.person\\.firstName").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    });
	    var isHuntingOwner="<s:property value='isHuntingOwnerUser()'/>";
	    if($("#dhpetLocation\\.person\\.id").val()){
	    	var personName=characterReplace("<s:property value='dhpetLocation.person.firstName'/> <s:property value='dhpetLocation.person.lastName'/>");
	    	$("#dhpetLocation\\.person\\.firstName").select2("data", {id: "<s:property value='dhpetLocation.person.id'/>", name: personName});

		 	if(isHuntingOwner=='true'){
		    	$("#dhpetLocation\\.person\\.firstName").prop('readonly',true);
			}
		}
		if(isHuntingOwner=='true' && !$("#dhpetLocation\\.person\\.id").val()){
			var huntingOwnerName=characterReplace("<s:property value='huntingOwner.firstName'/> <s:property value='huntingOwner.lastName'/>");
	    	$("#dhpetLocation\\.person\\.firstName").select2("data", {id: "<s:property value='huntingOwner.id'/>", name: huntingOwnerName});
	    	$("#dhpetLocation\\.person\\.firstName").prop('readonly',true);
		}

		$("#cancelLo").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "Location.map_page.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#location_map_page").html(jqXHR.responseText);
					//alert after cancel action
					$.smallBox({
						title : "<s:text name="small.box.on.cancel.title"/>",
						content : "<s:text name="small.box.content"/>",
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
		$("#dhpetLocation\\.area").prop('disabled', true);
				
		$("#saveLo").on('click', function () {
			$("#dhpetLocation\\.area").prop('disabled', false);   
 		    var selr = jQuery('#location_land_type').jqGrid('getGridParam','selrow'); 
		    $("#location_land_type").jqGrid('saveRow', selr);
			var landType = $("#location_land_type").jqGrid('getRowData');
			var jsonText = JSON.stringify(landType);
			var this_form =$("#location_form");
			$('<input>').attr({
				type : 'hidden',
				name : "jsonLocationLandType",
				value : jsonText
			}).appendTo(this_form);
			
			$('#location_form').submit();
			return false;        
		});

		
		$("#location_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
					$("#dhpetLocation\\.area").prop('disabled', true);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#location_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
					$("#dhpetLocation\\.area").prop('disabled', true);
					if(!errors){
						jQuery("#location_grid").trigger("reloadGrid");
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
				complete:function(jqXHR, textStatus){
					//$('#ajaxBusyFarmer').hide();
				}
				
			});
			return false;
		});
			    	
	});            
</script>