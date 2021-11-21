<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<jsp:include page="../../base/validation.jsp"></jsp:include>
<div id="layergis_form_content">
<form id="layergis_form" class="smart-form" action="LayerGisSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
	<input id="layergis.id" name="layergis.id" value="<s:property value='layergis.id'/>"  type="hidden">
	<input id="layergis.layersGis.id" name="layergis.layersGis.id" value="<s:property value='layergis.layersGis.id'/>" type="hidden">
	<input id="ref.nameAl" name="ref.nameAl" value="<s:property value='ref.nameAl'/>" type="hidden">
	<input id="parentId" name="parentId" value="<s:property value='parentId'/>" type="hidden">	
	
	
		<fieldset class="no-padding">
		<legend><s:text name="activity.domain.menu"/></legend>
		<div  id="referenceDiv" class="alert alert-new fade in">			
			<i id="statusIcon" class="fa-fw fa  fa-stack-overflow"></i>
			<s:text name="layer.reference.to"/> : <s:property value='layer_name'/>
		</div>
		<div class="row">
				<section class="col col-4">
					<label class="input">*<s:text name="layergis.store"/>:
					<s:if test="fieldErrors.get('layergis.store')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="layergis.store" name="layergis.store"   type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('layergis.store')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="layergis.store" name="layergis.store" value="<s:property value='layergis.store'/>" >
						</div>
					</s:else>
					</label>
				</section>
				 <section class="col col-6">
					<label class="input">*<s:text name="url"/>:
					<s:if test="fieldErrors.get('layergis.url')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="layergis.url" name="layergis.url"  placeholder="nameAl" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('layergis.url')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="layergis.url" name="layergis.url" value="<s:property value='layergis.url'/>" placeholder="nameAl">
						</div>
					</s:else>
					</label>
				</section>
				<section class="col col-2">
					<label class="input input-xs-g"><s:text name="layergis.serviceType"/>:
						<select class="form-control input-xs-g" id="layergis.serviceType" name="layergis.serviceType">
								<option value=""></option>
								<option value="wms">wms</option>
								<option value="wfs">wfs</option>
						</select>
					</label>
				</section>
	
				
				</div>
			<div class="row">
				<section class="col col-6">
					<label class="input">*<s:text name="layergis.featurens"/>:
					<s:if test="fieldErrors.get('layergis.featurens')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="layergis.featurens" name="layergis.featurens"   type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('layergis.featurens')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="layergis.featurens" name="layergis.featurens" value="<s:property value='layergis.featurens'/>" >
						</div>
					</s:else>
					</label>
				</section>
				<section class="col col-4">
					<label class="input">*<s:text name="layergis.featureTypeLayer"/>:
					<s:if test="fieldErrors.get('layergis.featureTypeLayer')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="layergis.featureTypeLayer" name="layergis.featureTypeLayer"   type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('layergis.featureTypeLayer')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="layergis.featureTypeLayer" name="layergis.featureTypeLayer" value="<s:property value='layergis.featureTypeLayer'/>" >
						</div>
					</s:else>
					</label>
				</section>
				
			</div>
		<div class="row">
			<section class="col col-3">
				<div class="form-group">
						<div class="col-md-10">
							&nbsp  &nbsp &nbsp<label class="checkbox-inline">
								<input id="layergis.isBaseLayer" name="layergis.isBaseLayer" value="false" type="checkbox" >
								<s:text name="layergis.isBaseLayer"/></label>
						</div>
						<br></br>
						<div class="col-md-10">
							&nbsp  &nbsp &nbsp<label class="checkbox-inline">
								<input id="layergis.tiled" name="layergis.tiled" value="false" type="checkbox">
								<s:text name="layergis.tiled"/></label>
							
						</div>
						<br></br>
						<div class="col-md-10">
							&nbsp  &nbsp &nbsp<label class="checkbox-inline">
								<input id="layergis.transparent" name="layergis.transparent" value="false" type="checkbox">
								<s:text name="layergis.transparent"/></label>
							
						</div>
						<br></br>
						<div class="col-md-10">
							&nbsp  &nbsp &nbsp<label class="checkbox-inline">
								<input id="layergis.visibility" name="layergis.visibility" value="false" type="checkbox">
								<s:text name="layergis.visibility"/></label>
						</div>
				</div>
			</section>
			<section class="col col-8">
			<div class="row">
				<section class="col col-6">
					<label class="input">*<s:text name="layergis.minScale"/>:
					<s:if test="fieldErrors.get('layergis.minScale')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="layergis.minScale" name="layergis.minScale" data="number"  type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('layergis.minScale')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="layergis.minScale" name="layergis.minScale" data="number" value="<s:property value='layergis.minScale'/>" >
						</div>
					</s:else>
					</label>
				</section> 
				<section class="col col-6">
					<label class="input">*<s:text name="layergis.srsName"/>:
							<div class="form-group">
							    <select id="layergis.srsName" name="layergis.srsName" style="width: 290px; height: 23px;">
									  <option value=""></option>
									  <option value="EPSG:900916">KosovaRef: 900916</option>
								      <option value="EPSG:4326">WGS: 4326</option>
								      <option value="EPSG:900913">GoogleMap: 900913</option>
							    </select>
						    </div>
					</label>
				</section>
				</div>
				<div class="row">
				<section class="col col-6">
					<label class="input">*<s:text name="layergis.outputformat"/>:
					<s:if test="fieldErrors.get('layergis.outputformat')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" id="layergis.outputformat" name="layergis.outputformat"   type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('layergis.outputformat')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" id="layergis.outputformat" name="layergis.outputformat" value="<s:property value='layergis.outputformat'/>" >
						</div>
					</s:else>
					</label>
				</section>
				<section class="col col-6">
					<label class="input">*<s:text name="layergis.tilesize"/>:
					<s:if test="fieldErrors.get('layergis.tilesize')!=null">
						<div class="form-group has-error">
							<input class="form-control input-xs-g" data="number" id="layergis.tilesize" name="layergis.tilesize"   type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('layergis.tilesize')"/> </span>
						</div>
					</s:if>
					<s:else>
						<div class="form-group">
							<input class="form-control input-xs-g" type="text" data="number" id="layergis.tilesize" name="layergis.tilesize" value="<s:property value='layergis.tilesize'/>" >
						</div>
					</s:else>
					</label>
					
					
				</section>
			</div>
			<div class="row">
						
					<section class="col col-6">
						<label class="input">*<s:text name="layergis.module"/>:
						  	<div class="form-group">
								<select multiple="multiple" id="layergis.module" name="layergis.module">
							      <option value='COMP'><s:text name="annu.appprivate.label.compartment"/></option>
							      <option value='HRV'><s:text name="annual.plan.harvest"/></option>
							      <option value='SRCH'><s:text name="frm.search.in.map.menu"/></option>
							      <option value='PRRQ'>PRRQ</option>
							      <option value='SLV'><s:text name="annual.plan.silviculture"/></option>
							      <option value='PLV'>PLV</option>
							      <option value='PROT'>PROT</option>
							      <option value='SEED'><s:text name="annual.plan.seedling"/></option>
							      <option value='HNTM'>HNTM</option>
							      <option value='TRZM'>TRZM</option>
							      <option value='RPFM'>RPFM</option>
							      <option value='TRZM'>TRZM</option>
   							      <option value='DTRM'>DTRM</option>
   							      <option value='DASH'>DASH</option>
   							      <option value='RLLM'><s:text name="frm.lease.menu"/></option>
							    </select>
						    </div>
						</label>
					</section>
					<section class="col col-6">
					<label class="input">*Sort:
						<s:if test="fieldErrors.get('layergis.sort')!=null">
							<div class="form-group has-error">
								<input class="form-control input-xs-g" data="number" id="layergis.sort" name="layergis.sort"   type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('layergis.sort')"/> </span>
							</div>
						</s:if>
						<s:else>
							<div class="form-group">
								<input class="form-control input-xs-g" data="number" type="text" id="layergis.sort" name="layergis.sort" value="<s:property value='layergis.sort'/>" >
							</div>
						</s:else>
					</label>
					</section>
			</div>
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
	$('#layergis\\.isBaseLayer').val(false);
	$('#layergis\\.tiled').val(false);
	$('#layergis\\.transparent').val(false);
	$('#layergis\\.visibility').val(false);
	
	$('#layergis\\.isBaseLayer').on('change',function(){
	   $(this).is(':checked') ?  $(this).val(true) :  $(this).val(false); 
	});
	$('#layergis\\.tiled').on('change',function(){
		   $(this).is(':checked') ?  $(this).val(true) :  $(this).val(false); 
		});
	$('#layergis\\.transparent').on('change',function(){
		   $(this).is(':checked') ?  $(this).val(true) :  $(this).val(false); 
		});
	$('#layergis\\.visibility').on('change',function(){
		   $(this).is(':checked') ?  $(this).val(true) :  $(this).val(false); 
		});
	 $('#layergis\\.module').multiselect({
			filterBehavior: 'both',
			buttonContainer: '<div class="btn-group" />',
			numberDisplayed:2,
			enableFiltering: true,
			includeSelectAllDivider: true,
			selectAllValue: 'multiselect-all',
			maxHeight: 200,
		 });
	 
	 
	$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
	$("#referenceDiv").hide();
	if($("#parentId").val()){
		$('.alert-new').css({"border-color":"#484C4F"});
		$('.alert-new').css({"color":"#fff"});
		$('.alert-new').css({"background-color":"#CFD1D3"});
		$('.alert').css({"color":"#484C4F"});
		$("#referenceDiv").show();
		
	}
	
	if(!$("#activityDomain\\.id").val()){
		$("#activitydomain_form_content").hide();
		}
	
	$("#cancel").on('click', function () {                    
		$("#layersform_content").dialog("close");
		return false;
	});
	
	$("#save").on('click', function () {                    
		$('#layergis_form').submit();
		return false;        
	});
	
	(function() {
		$('form').ajaxForm({
			beforeSerialize: function($form, options) {         
			},
		    beforeSend: function() {
		    },
			error : function(response, status, err){
				$("#layergis_form_content").html(response);
				alert("error:" + errorThrown + ", status:" + status);
			},	    
		    success : function(data, status, jqXHR) {
				$("#layergis_form_content").html(jqXHR.responseText);
				
				var errors_exits = jqXHR.getResponseHeader("errors_exits");
				if(!errors_exits){
					jQuery("#layers_grid").trigger("reloadGrid");
					$.smallBox({
						title : '<s:text name="small.box.on.save.title.success"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#739E73",
						timeout: 5000,
						icon : "fa fa-check",
						number : "1"
					});		
					$("#layersform_content").dialog("close");
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
			}
		});
	})();

	
});
</script>