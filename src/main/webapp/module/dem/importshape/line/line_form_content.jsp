<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<style>
.input .greetings{
/*   width: 33%; */
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  }
</style>
<div>
	<!-- widget content -->
	<div class="widget-body">
		<form id="line_content_form" class="smart-form" action="RoadSaveAction.do" accept-charset="utf8" method="post">
				<legend>Rrugtë pyjore</legend>
					<input type="hidden" id="geometry"  name="geometry" value="<s:property value='linetemp.theGeom'/>">
					<input type="hidden" id="linetemp.id" name="linetemp.id"  value="<s:property value='linetemp.id'/>">
				<div class="row">
					<s:if test="fieldErrors.get('road.cadastralMunicipality.id')!=null">
						<div class="form-group has-error">
							<section class="col col-10">
								<label   class="input">*<s:text name='annual.plan.municipality'/>:
									<input id="road.cadastralMunicipality.name" name="road.cadastralMunicipality.name" class="form-control" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
									<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('road.cadastralMunicipality.id')"/> </span>
									<input id="road.cadastralMunicipality.id" name="road.cadastralMunicipality.id" value="<s:property value='road.cadastralMunicipality.id'/>" type="hidden">
								</label>
							</section>
						</div>.
						
					</s:if>
					<s:else>
						<section class="col col-10">
								<label class="input">*<s:text name='annual.plan.municipality'/>:
									<input id="road.cadastralMunicipality.name" name="road.cadastralMunicipality.name" class="form-control" placeholder="<s:text name='placeholder.enter.mun.name'/>" type="text">
									<input id="road.cadastralMunicipality.id" name="road.cadastralMunicipality.id" value="<s:property value='road.cadastralMunicipality.id'/>" type="hidden">
								</label>
						</section>
					</s:else>
					</div>
					<div class="row">
						<section class="col col-6">
							<label class="input"> <s:text name='frm.infrastructure.planning.road.name'/>:
								<input  class="form-control input-xs-g" type="text" id="road.roadName" name="road.roadName" value="<s:property value='road.roadName'/>"  >
							</label>
						</section>
						<section class="col col-6">
							<label class="input"><s:text name='frm.stand.access.type'/>:
								<input  class="form-control input-xs-g" type="text" id="road.accessType" name="road.accessType" value="<s:property value='road.accessType'/>"  >
							</label>
						</section>
					</div>
					<div class="row">
					<!-- START stand.littercov -->
						<section class="col col-6">
							<label class="input"><s:text name='frm.line.quality.cl'/> :
								<input  class="form-control input-xs-g" type="text" id="linetemp.qualityCl" name="linetemp.qualityCl" value="<s:property value='linetemp.qualityCl'/>"  >
							</label>
						</section>
					<!-- END stand.littercov -->
		
					<!-- START linetemp.maintenanc-->
						<section class="col col-6">
						<label class="input"> <s:text name='frm.line.maintenance'/> :
								<input class="form-control input-xs-g" type="text" id="linetemp.maintenanc" name="linetemp.maintenanc" value="<s:property value='linetemp.maintenanc'/>"  >
							</label>
						</section>
					<!-- END linetemp.maintenanc -->
				</div>
				<div class="row">
					<!-- START stand.mngmClass -->
						<section class="col col-12">
							<label class="input"> *Ltheme:
								<s:if test="fieldErrors.get('linetemp.mngmClass')!=null">
									<div class="has-error">
										<select class="form-control has-error" id="linetemp.ltheme12" name="linetemp.ltheme12">
											<s:iterator value="roadTypeList" var="el">
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
										<span class="help-block has-error"><i class="fa fa-warning  has-error"></i> <s:property value="fieldErrors.get('stand.mngmClass')"/> </span>
									</div>
								</s:if>
								<s:else>
									<select class="form-control" id="linetemp.ltheme12" name="linetemp.ltheme12">
										<s:iterator value="roadTypeList" var="el">
											<option value="<s:property value="#el.getDOMKEY()" />">
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
								</s:else>
							</label>
						</section>
					<!-- END stand.mngmClass -->
				</div>
				<div class="row">
					<!-- START stand.remarks -->
					<section>
							<label class="input"> <s:text name="frm.stand.remarks"/>:</label>
							<div class="col-md-8">
								<textarea id="linetemp.comment" name="linetemp.comment" class="form-control"><s:property value='linetemp.comment'/></textarea>
							</div>
					</section>
					<!-- END stand.remarks -->
				</div>
			<footer class="form-actions" id="stand-button">
						<button id="cancelLine" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveLine" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
					
			</footer>
		</form>
	</div>
	<!-- end widget content -->
<!-- end widget div -->

<script type="text/javascript">
	$(document).ready(function() {
// 		$('#linetemp\\.ltheme12').val('<s:property value="mngmclassName"/>');
		$('#linetemp\\.ltheme12').val('<s:property value="linetemp.ltheme12"/>');

		$("#cancelLine").on('click', function() {
			$.ajax({
				type : "GET",
				url : "ImportLine.form_content.do",
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#linetemp_form_content").html(jqXHR.responseText);
					$.smallBox({
						title : "<s:text name="small.box.on.cancel.title"/>", 
						content : "<s:text name="small.box.content"/>", 
						color : "#C46A69",
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 3000
					});
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			
			return false;
		});

		$("#road\\.cadastralMunicipality\\.name").select2({
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
	        	$("#road\\.cadastralMunicipality\\.id").val(item.id);
	        	$("#road\\.cadastralMunicipality\\.name").val(item.name);
	            return item.name;
	        },
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 

	    $("#road\\.cadastralMunicipality\\.name").select2("data", {id: "<s:property value='road.cadastralMunicipality.id'/>", name: "<s:property value='road.cadastralMunicipality.name'/>"});
		
		$("#saveLine").on('click', function() {
			var ctrl_split = map.getControlsBy("id", "split")[0];
			if (ctrl_split.active) {
				alert("Butoni per ndarje eshte aktiv!");
			}else{
				$('#line_content_form').submit();
			}
			return false;
		});
		$("#line_content_form").submit(function() {
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
					$("#linetemp_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exits");
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
						jQuery("#line_grid").trigger("reloadGrid");
						jQuery("#road_grid").trigger("reloadGrid");
						$.smallBox({
							title : "<s:text name='small.box.on.save.title.success'/>",
							content : "<s:text name='small.box.content'/>",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
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