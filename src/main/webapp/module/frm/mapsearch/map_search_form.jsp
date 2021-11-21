<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div id="map_search_form_content">
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">
		<form id="map_search_form" class="smart-form"  accept-charset="utf8" >
		<input id="parcelDetailId" name="parcelDetailId" value="<s:property value='parcelDetailId'/>" type="hidden"></input>
		<input id="cadparcelid" name="cadparcelid" value="<s:property value='cadparcelid'/>" type="hidden"></input>
		<input id="cadastralZoneId" name="cadastralZoneId" value="<s:property value='cadastralZoneId'/>" type="hidden">
		<div class="row">
				<!-- START privateRequest.cadastralZone.id -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.cadastral.zone'/>: 
						<div class="form-group">
								<input id="cadastralZoneName"
									name="cadastralZoneName"
									value="<s:property value='cadastralZoneName'/>"
									placeholder="<s:text name='frm.private.request.cadastral.zone'/>"
									type="text"> 
						</div>
					</label>
				</section>
				<!-- END privateRequest.cadastralZone.id -->
				<!-- START privateRequest.parcelNo -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.parcel.no'/>:
							<div class="form-group">
								<input id="parcelnr"
									name="parcelnr" class="form-control"
									value="<s:property value='parcelnr'/>"
									placeholder="<s:text name='frm.private.request.parcel.no'/>" type="text">
							</div>
					</label>
				</section>
			  <!-- END privateRequest.parcelnr -->
			  <!-- START privateRequest.subparcelnr -->
				<section class="col col-3">
					<label class="input">*<s:text name='frm.private.request.subparcel.no'/>: 
							<div class="form-group">
								<input id="subparcelnr"
									name="subparcelnr" class="form-control"
									value="<s:property value='subparcelnr'/>"
							 		placeholder="<s:text name='frm.private.request.parcel.no'/>" type="text">
							
							</div>
					</label>
				</section>
			<!-- END privateRequest.subparcelnr -->
				<section class="col col-1">
					<label class="input">
					 	<button id="detailBtn" type="button" class="btn btn-primary btn-" style=" height: 32px; margin-top: 15px;padding-top: 5px;padding-bottom: 5px;">
								<s:text name='adm.organisation.search.of.tree'/>
						</button>
					</label>
					</section>
					<section class="col col-1">
					<label class="input">
					 	<button id="cancelBtn" type="button" class="btn btn-default" style=" height: 32px; margin-top: 15px;padding-top: 5px;padding-bottom: 5px;">
								<s:text name='label.button.cancel'/>
						</button>
					</label>
				</section>
				</div>
				
			<div class='row' id="owner_search">
				<!-- START cadzone -->
				<section class="col col-3">
					<div class="form-group">
						<label class="input"> <s:text name='frm.map.search.persStat'/>:
							   <input id="persStat" name="persStat" value="<s:property value='persStat'/>" type="text">
						</label>
					</div>
				</section>
				<!-- END cadzone -->
				<!-- START cadzone -->
				<section class="col col-3">
					<div class="form-group">
						<label class="input"> <s:text name='frm.map.search.partsn'/>:
							   <input id="partsn" name="partsn" value="<s:property value='partsn'/>" type="text">
						</label>
					</div>
				</section>
				<!-- END cadzone -->
			 </div>
			 	
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {
// 		$('#map_search_form input').attr('readonly', 'readonly');
		$("#owner_search").hide();
		$("#cadastralZoneName").select2({
		    minimumInputLength: 1,
		    ajax: {
		        url: "Input.cadZone.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",   
						maxRows: 12,            
			        	name_startsWith: term
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
		    formatResult: function(item) {
		    	var markup = '<div class="row-fluid">' + '<div class="span10">'
				+ '<div class="row-fluid">'
				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
				+ item.name + '</div>' + '</div>';
				markup += '</div></div>';
				return markup;
		    },
		    formatSelection: function(item) {  	
				  $("#cadastralZoneName").val(item.name);
		    	$("#cadastralZoneId").val(item.cadId);
		    	$("#parcelnr").val("");
		    	$("#subparcelnr").val("");
		    	$("#cadparcelid").val("");
		    	$("#owner_search").hide();
		    	vectorLayer.destroyFeatures();
		    	$("#parcelnr").attr('disabled',false); 
	        return item.name;
		    },
		    escapeMarkup: function (m) { return m; }
		}); 
		
		$("#parcelnr").attr('disabled',true); 
		$("#subparcelnr").attr('disabled',true); 
		$("#parcelnr").select2({
		    placeholder: "<s:text name='frm.private.request.parcel.no'/>",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.parcelId.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",   
						maxRows: 12,            
			        	name_startsWith: term,
			        	cadZone_id:$("#cadastralZoneId").val()	
			        };
		        },
		        results: function (data, page) { 
		        	return { results: data 
			        	};
		        },
		        cache: true
		    },
		    initSelection: function(element, callback) {
		    },
		    dropdownAutoWidth: false,
		    formatResult: function(item) {
		    	var markup = '<div class="row-fluid">' + '<div class="span10">'
				+ '<div class="row-fluid">'
				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
				+ item.parcelnr + '</div>' + '</div>';
				markup += '</div></div>';
				return markup;
		    },
		    formatSelection: function(item) {
// 		    	$("#privateRequest\\.parcelDetail\\.id").val(item.id);
		    	$("#parcelnr").val(item.parcelnr);
		    	$("#subparcelnr").val("");
		    	vectorLayer.destroyFeatures();
		    	$("#owner_search").hide();
		    	$("#cadparcelid").val("");
		    	$("#subparcelnr").attr('disabled',false);
			    return item.parcelnr;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		$("#subparcelnr").select2({
		    placeholder: "<s:text name='frm.private.request.parcel.no'/>",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.parcelId.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
			        return {
			        	featureClass: "P",
						style: "full",
						maxRows: 12,            
			        	name_startsWith: term,
			        	cadZone_id:$("#cadastralZoneId").val(),
			        	parcel_id:$("#parcelnr").val()
					    };
		        },
		        results: function (data, page) { 
		        	return { results: data 
			        	};
		        },
		        cache: true
		    },
		    initSelection: function(element, callback) {
		    },
		    dropdownAutoWidth: false,
		    formatResult: function(item) {
		    	var markup = '<div class="row-fluid">' + '<div class="span10">'
				+ '<div class="row-fluid">'
				+ '<div class="span6"><i class="fa fa-chevron-circle-right"></i> '
				+ item.subparcelnr + '</div>' + '</div>';
				markup += '</div></div>';
				return markup;
		    },
		    formatSelection: function(item) {
		    	$("#parcelDetailId").val(item.id);
		    	$("#cadParcId").val(item.cadparcelid);
		    	$("#subparcelnr").val(item.subparcelnr);
		    	$("#cadparcelid").val(item.cadparcelid);
		    	$("#persStat").val(item.persStat);
		    	$("#partsn").val(item.partsn);
		    	$("#cadparcelid").val();
				if($("#cadastralZoneId").val() && $("#parcelnr").val() && $("#subparcelnr").val()){
					$('#detailBtn').prop('disabled',false);
					}
				 return item.subparcelnr;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 
		 $("#detailBtn").on('click',function(){
			 loadParcelFeature($("#cadparcelid").val());
			 $("#owner_search").show();
				 	$("#persStat").attr('disabled',true);
			    	$("#partsn").attr('disabled',true);
			    	$("#parcelnr").attr('disabled',true); 
					$("#subparcelnr").attr('disabled',true); 
					$("#cadastralZoneName").attr('disabled',true); 
					
		 });

		 $("#cancelBtn").on('click',function(){
					$("#owner_search").hide();
				 	$("#persStat").attr('disabled',false);
			    	$("#partsn").attr('disabled',false);
			    	$("#parcelnr").attr('disabled',false); 
					$("#subparcelnr").attr('disabled',false); 
					vectorLayer.destroyFeatures();
					$("#cadastralZoneName").attr('disabled',false); 
		 });
		 
		
	});            
</script>