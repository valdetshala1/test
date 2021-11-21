<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<div>
	<div class="widget-body" id="tourist_zone_geoms_form_content">
		<form id="tourist_zone_geoms_form" class="form-horizontal" action="TouristZoneGeomsSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<input id="touristZoneGeoms.id" name="touristZoneGeoms.id" value="<s:property value='touristZoneGeoms.id'/>" type="hidden">
				<input id="touristZoneGeoms.createdDate" name="touristZoneGeoms.createdDate" value="<s:property value='touristZoneGeoms.createdDate'/>" type="hidden">
				<input id="touristZoneGeoms.employee.id" name="touristZoneGeoms.employee.id" value="<s:property value='touristZoneGeoms.employee.id'/>" type="hidden">
				<input id="geometry" name="geometry" value="<s:property value='touristZoneGeoms.theGeom'/>" type="hidden">
				
				<!-- START touristZoneGeoms.dhpetLocation -->
				<div id="person">
				<s:if test="fieldErrors.get('touristZoneGeoms.dhpetLocation')!=null">
						<div class="form-group has-error">
							<label class="col-md-2 control-label">*<s:text name='dhpet.animal.capacity.label.habitat.location'/>:</label>
							<div class="col-md-10">
								<input id="touristZoneGeoms.dhpetLocation.habitatLocation" name="touristZoneGeoms.dhpetLocation.habitatLocation" class="form-control" placeholder="<s:text name='touristZoneGeoms.dhpetLocation.habitatLocation'/>" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('leaseRequest.dhpetLocation')"/> </span>
								<input id="touristZoneGeoms.dhpetLocation.id" name="touristZoneGeoms.dhpetLocation.id" value="<s:property value='touristZoneGeoms.dhpetLocation.id'/>" type="hidden">
							</div>					
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<label class="col-md-2 control-label">*<s:text name='dhpet.animal.capacity.label.habitat.location'/>:</label>
							<div class="col-md-10">
								<input id="touristZoneGeoms.dhpetLocation.habitatLocation" name="touristZoneGeoms.dhpetLocation.habitatLocation" class="form-control" value="<s:property value='touristZoneGeoms.dhpetLocation.habitatLocation'/>" type="text">
								<input id="touristZoneGeoms.dhpetLocation.id" name="touristZoneGeoms.dhpetLocation.id" value="<s:property value='touristZoneGeoms.dhpetLocation.id'/>" type="hidden">
							</div>									
						</div>
					</s:else>
				</div>
				<!-- END touristZoneGeoms.dhpetLocation -->
				
				
				<!-- START touristZoneGeoms.zoneType -->
				<s:if test="fieldErrors.get('touristZoneGeoms.zoneType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.tourist.zone.geoms.zonetype"/>:</label>
						<div class="col-md-10">
							<select class="form-control" name="touristZoneGeoms.zoneType" id="touristZoneGeoms.zoneType" >
								<option></option>
								<s:iterator value="zoneTypes" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#el.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#el.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#el.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>	
							</select>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('touristZoneGeoms.zoneType')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.tourist.zone.geoms.zonetype"/>:</label>
						<div class="col-md-10">
							<select class="form-control"  name="touristZoneGeoms.zoneType" id="touristZoneGeoms.zoneType" >
								<option></option>
								<s:iterator value="zoneTypes" var="el">
									<option value="<s:property value="#el.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#el.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#el.getDOMTEXT_SR()"/>
										</s:elseif>
										<s:else>
											<s:property value="#el.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>	
							</select>
						</div>
					</div>
				</s:else>
				<!-- END touristZoneGeoms.zoneType -->
			
				<!-- START touristZoneGeoms.area -->
				<s:if test="fieldErrors.get('touristZoneGeoms.area')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.animal.capacity.label.area" /> :</label>
						<div class="col-md-10">
							<input id="touristZoneGeoms.area" name="touristZoneGeoms.area"
								class="form-control"
								type="text"> <span class="help-block"><i
								class="fa fa-warning"></i> <s:property
									value="fieldErrors.get('touristZoneGeoms.area')" /> </span>
						</div>
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.animal.capacity.label.area" /> :</label>
						<div class="col-md-10">
							<input id="touristZoneGeoms.area" name="touristZoneGeoms.area"
								value="<s:property value='touristZoneGeoms.area'/>"
								class="form-control"
								type="text">
						</div>
					</div>
				</s:else>
				<!-- END touristZoneGeoms.area -->
			
				<!-- start note -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="mer.execution.note"/>:</label>
						<div class="col-md-10">
							<textarea id="touristZoneGeoms.note" name="touristZoneGeoms.note" class="form-control" placeholder="Default Text Field"><s:property value='touristZoneGeoms.note'/></textarea>
						</div>
					</div>
				<!-- end note -->
				
			</fieldset>
			<div id="request_buttons">
				<footer class="form-actions" id="leaseRequest-button">
					<button id="cancelTouristZoneGeom" class="btn btn-default" type="button">
						<s:text name="label.button.cancel"></s:text>
					</button>
					<button id="saveTouristZoneGeom" class="btn btn-primary" type="submit">
						<i class="fa fa-save"></i>
						<s:text name="label.button.save"></s:text>
					</button>
				</footer>
			</div>
			
		</form>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#touristZoneGeoms\\.zoneType').val('<s:property value="touristZoneGeoms.zoneType.DOMVALUE"/>');
		
		$("#cancelTouristZoneGeom").on('click', function() {
			loadURL("TouristZoneGeoms.form.do",$("#tourist_zone_geoms_form_content"));
			return false;
		});
		
		$("#saveTouristZoneGeom").on('click', function() {
			$('#tourist_zone_geoms_form').submit();
			return false;
		});
		
		(function() {
			$('form').ajaxForm({
				beforeSerialize: function($form, options) {         
				},
			    beforeSend: function() {
			    },
				error : function(response, status, err){
					alert("error:" + errorThrown + ", status:" + status);
				},	    
			    success : function(data, status, jqXHR) {
					$("#tourist_zone_geoms_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(errors){
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.failed'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});						
					}else{
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});	
						jQuery("#tourist_zone_geoms_grid").trigger("reloadGrid");
					} 	
			    },	    
				complete: function(xhr) {
				}
			});				
		})();

		$("#touristZoneGeoms\\.employee\\.firstName").select2({
		    placeholder: "Search for a repository",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.employee.do",
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
		    	$("#touristZoneGeoms\\.employee\\.firstName").val(item.name);
		    	$("#touristZoneGeoms\\.employee\\.id").val(item.id);
		        return item.name;
		    },
		    allowClear: true,
		    dropdownCssClass: "bigdrop",
		    escapeMarkup: function (m) { return m; }
		}); 

		$("#touristZoneGeoms\\.employee\\.firstName").select2("data", {id: "<s:property value='leaseRequest.personByPersonId.id'/>", name: "<s:property value='leaseRequest.personByPersonId.firstName'/>"});

		$("#touristZoneGeoms\\.dhpetLocation\\.habitatLocation").select2({
		    placeholder: "Search for a repository",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.dhpetLocation.do",
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
		    	$("#touristZoneGeoms\\.dhpetLocation\\.habitatLocation").val(item.name);
		    	$("#touristZoneGeoms\\.dhpetLocation\\.id").val(item.id);
		        return item.name;
		    },
		    allowClear: true,
		    dropdownCssClass: "bigdrop",
		    escapeMarkup: function (m) { return m; }
		}); 

		$("#touristZoneGeoms\\.dhpetLocation\\.habitatLocation").select2("data", {id: "<s:property value='touristZoneGeoms.dhpetLocation.id'/>", name: "<s:property value='touristZoneGeoms.dhpetLocation.habitatLocation'/>"});
				

	});

</script>
</html>