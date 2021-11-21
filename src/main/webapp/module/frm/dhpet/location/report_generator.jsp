<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body" id="report_generator_content">
	<input type="hidden" id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>">
			<div id="report_generator" class="form-horizontal">
				<div class="form-group">
						<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label class="radio radio-inline"> 
								</label>
								<label id="cent" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="centralReport" value="centralReport"/>
									<span><s:text name='report.type.central.legend'/></span>
								</label>
								<label id="reg" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="regionalReport" value="regionalReport"/>
									<span><s:text name='report.type.regional.legend'/></span>
								</label>
								<label id="mun" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="municipalityReport" value="municipalityReport"/>
									<span><s:text name='bidder.cadastral.municipality'/></span>
								</label>
								<label id="loc" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="locationReport" value="locationReport"/>
									<span><s:text name='hunt.location'/></span>
								</label>
								<label id="det" class="radio radio-inline"> <input type="radio"
									class="radiobox" name="reportType" id="detailReport" value="detailReport"/>
									<span><s:text name='hunt.detail'/></span>
								</label>
							</div>
				</div>
				<hr>
				<!-- START report.type -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='annu.seedling.label.activity'/>:</label>
						<div class="col-md-10">
							<select class="form-control" id="activityName"
								name="activityName">
								<option></option>
								<s:iterator value="tableList" var="st">
									<option value="<s:property value="#st[0]"/>">
									<s:if test="%{locale.language=='en'}">
										<s:property value="#st[1]"/>
									</s:if>
									<s:elseif test="%{locale.language=='al'}">
										<s:property value="#st[2]"/>
									</s:elseif><s:else>
										<s:property value="#st[3]"/>
									</s:else>
									</option>
								</s:iterator>
							</select>
					
						</div>									
					</div>
				<!-- END report.year -->
				<div id="wildanimals">
				<!-- START animal.dhpetWildAnimals -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="animal.animal"/></label>
						<div class="col-md-10">
							<input id="animalName" name="animalName" value="<s:property value='animalName'/>" class="form-control" type="text">
							<input id="animalId" name="animalId" value="<s:property value='animalId'/>" class="form-control" type="hidden">
						</div>									
					</div>
				</div>
				<!-- END animal.dhpetWildAnimals -->
				<!-- START report.year -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='report.wood.production.label.year'/>:</label>
						<div class="col-md-10">
							<input id="planYear" name="planYear" class="form-control" placeholder="<s:text name='report.wood.production.label.year'/>" type="text">
						</div>									
					</div>
				<!-- END report.year -->
				<div id="regionR">
				<!-- START report.month -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="select-1"><s:text name='frm.compartment.region.name'/>:</label>
						<div class="col-md-10">
							<input id="region" class="form-control" placeholder="<s:text name='frm.compartment.region.name'/>" type="text">
							<input id="planRegionId" name="planRegionId" type="hidden">
						</div>
					</div>
				<!-- END report.month -->
				</div>
				<div id="municipalityR">
				<!-- START report.month2 -->
					<div class="form-group">	
						<label class="col-md-2 control-label"><s:text name='bidder.cadastral.municipality'/>:</label>
						<div class="col-md-10">
							<input id="municipality" class="form-control" placeholder="<s:text name='bidder.cadastral.municipality'/>" type="text">
							<input id="municipalityId" type="hidden">
						</div>
					</div>	
				<!-- END report.month2 -->
				</div>
				<div id="locationR">
				<!-- START report.month2 -->
					<div class="form-group">	
						<label class="col-md-2 control-label"><s:text name='hunt.location'/>:</label>
						<div class="col-md-10">
							<input id="location" class="form-control" placeholder="<s:text name='hunt.location'/>" type="text">
							<input id="locationId" type="hidden">
						</div>
					</div>	
				<!-- END report.month2 -->
				</div>
				
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelR" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="generator" class="btn btn-primary" type="submit">
							<i class="fa fa-print"></i>
							<s:text name='label.button.generate.report'/>
						</button>
					</div>
				</div>
			</div>
			
			</div>
</div>
<script type="text/javascript">

$(document).ready(function() {
	$("#det").hide();
	$("#activityName").change(function() {
		  if($("#activityName").val()=='animallocation' || $("#activityName").val()=='huntedanimals'){
				$("#wildanimals").hide();
					if( $("#activityName").val()=='huntedanimals'){
						$("#det").show();
						}else{
							$("#det").hide();
							}
			  }else{
				  $("#wildanimals").show();
				  $("#det").hide();
				  }
		});
	$("#animalName").select2({
	    placeholder: "",
	    minimumInputLength: 0,
	    ajax: {
	        url: "Input.dbpetAnimal.do",
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
	    	$("#animalId").val(item.id);
	    	$("#animalName").val(item.name);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	});
	$("#location").select2({
	    placeholder: "",
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
	    	$("#locationId").val(item.id);
	    	$("#location").val(item.name);
	        return item.name;
	    },
	    allowClear: true,
	    escapeMarkup: function (m) { return m; }
	});
	  $("#municipalityR").hide();  
	  $("#locationR").hide();  
	  $("#regionR").hide();
	  $("#planYear").mask("9999");
	  $("#report_generator input[name='reportType']").click(function(){
		 if($('input:radio[name=reportType]:checked').val() == "municipalityReport"){
				  $("#municipalityR").show();  
				  $("#regionR").hide(); 
				  $("#planRegionId").val(null);
				  $("#region").val("");
				  $("#locationR").hide(); 
				  $("#locationId").val(null);
				  $("#location").select2("data", {id:'',name:""});
		    }
	    if($('input:radio[name=reportType]:checked').val() == "regionalReport"){
			  $("#municipalityR").hide();  
			  $("#municipalityId").val(null);
			  $("#municipality").val("");
			  $("#regionR").show();
			  $("#locationR").hide(); 
			  $("#locationId").val(null);
			  $("#location").select2("data", {id:'',name:""});
	    }
	    if($('input:radio[name=reportType]:checked').val() == "centralReport"){
			  $("#municipalityR").hide();  
			  $("#regionR").hide();
			  $("#municipalityId").val(null);
			  $("#region").val("");
			  $("#municipality").val("");
			  $("#planRegionId").val("");
			  $("#locationR").hide(); 
			  $("#locationId").val(null);
			  $("#location").select2("data", {id:'',name:""});
	    }
	    if($('input:radio[name=reportType]:checked').val() == "locationReport"){
			  $("#municipalityR").hide();  
			  $("#regionR").hide();
			  $("#municipalityId").val(null);
			  $("#region").val("");
			  $("#municipality").val("");
			  $("#planRegionId").val("");
			  $("#locationR").show(); 
	    }
	    if($('input:radio[name=reportType]:checked').val() == "detailReport"){
			  $("#municipalityR").hide();  
			  $("#regionR").hide();
			  $("#municipalityId").val(null);
			  $("#region").val("");
			  $("#municipality").val("");
			  $("#planRegionId").val("");
			  $("#locationR").show(); 
	    }
	    
	});
	$("#region").autocomplete({
		source: function( request, response ) {
			$.ajax({
				url: "Input.region.do",
				dataType: "json",
				data: {
					featureClass: "P",
					style: "full",
					maxRows: 12,
					minLength: 1,
					name_startsWith: request.term
				},
				success: function( data ) {
					response( $.map( data, function(item) {
						return {
							label: item.name, 
							value: item.name,
							id: item.id 
						};
					}));
				}
			});
		},
		maxRows: 12,
		minLength: 2,
		change: function(event, ui) {
		},
		select: function( event, ui ) {
			$( "#planRegionId" ).val( ui.item.id);
		},
		focus: function(event, ui) {
		}
	});	
	$("#municipality").autocomplete({
		source: function( request, response ) {
			$.ajax({
				url: "Input.municipality.do?",
				dataType: "json",
				data: {
					featureClass: "P",
					style: "full",
					maxRows: 12,
					minLength: 1,
					name_startsWith: request.term
				},
				success: function( data ) {
					response( $.map( data, function(item) {
						return {
							label: item.name, 
							value: item.name,
							id: item.id 
						};
					}));
				}
			});
		},
		maxRows: 12,
		minLength: 2,
		change: function(event, ui) {
		},
		select: function( event, ui ) {
			$( "#municipalityId" ).val( ui.item.id);
		},
		focus: function(event, ui) {
		}
	});
	$("#cancelR").on('click', function(){
		$("#report_generator_content").dialog("close");
	});
    
	$("#generator").on('click', function () {
		var activityName='';
		var animalIsnecesary=$('#animalId').is(":empty")&&($("#activityName").val()=='animallocation' || $("#activityName").val()=='huntedanimals');
		if($("#activityName").val() && $("#planYear").val() ){
			activityName=$("#activityName").val().toLowerCase();
			var parameters = "p_mun_id="+$("#municipalityId").val()+"&p_year="+$("#planYear").val()+"&p_region_id="+$("#planRegionId").val()+"&p_location_id="+$("#locationId").val()+"&p_animal_id="+$("#animalId").val()+"&p_user="+$("#user").val()+"&p_location="+$("#location").val();
			var link="frm/dhpet/"+activityName;
			if($("#municipalityId").val()){
				openBirtViewer(link+"/municipality_report.rptdesign", parameters);
			}else if($("#planRegionId").val()){
				openBirtViewer(link+"/regional_report.rptdesign", parameters);
			}else if($("#locationId").val()){
				if($('input:radio[name=reportType]:checked').val() == "locationReport"){
					openBirtViewer(link+"/location_report.rptdesign", parameters);
					}else{
					openBirtViewer(link+"/detail_report.rptdesign", parameters);
						}
			}
			else if($('input:radio[name=reportType]:checked').val() == "centralReport"){
				openBirtViewer(link+"/central_report.rptdesign", parameters);
				}
			else{
				alert("<s:text name="form.input.alert.empty"/>"); 
			}
		}else{
			alert("<s:text name="form.input.alert.select"/>"); 
		}
			
	});

});


			
</script>