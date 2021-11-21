<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
	
<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">

		<form id="treespecies_form" class="form-horizontal" action="TreeSpeciesSave.do" accept-charset="utf8" method="post">
			
			<fieldset>
				<legend><s:text name="annu.seedling.label.tree.species"/></legend>
				<input id="treespecies.id" name="treespecies.id" value="<s:property value='treespecies.id'/>" type="hidden">	
				
				<!-- START treespecies.code -->
				<s:if test="fieldErrors.get('treespecies.code')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.code"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="treespecies.code" name="treespecies.code" class="form-control" placeholder="<s:text name="leave.type.label.code"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treespecies.code')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="leave.type.label.code"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="treespecies.code" name="treespecies.code" value="<s:property value='treespecies.code'/>" class="form-control" placeholder="<s:text name="leave.type.label.code"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END treespecies.code -->
				
				<!-- START treespecies.nameEn -->
				<s:if test="fieldErrors.get('treespecies.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.en"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="treespecies.nameEn" name="treespecies.nameEn" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.en"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treespecies.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.en"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="treespecies.nameEn" name="treespecies.nameEn" value="<s:property value='treespecies.nameEn'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.en"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END treespecies.nameEn -->
				
				<!-- START treespecies.nameAl -->
				<s:if test="fieldErrors.get('treespecies.nameAl')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.al"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="treespecies.nameAl" name="treespecies.nameAl" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.al"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treespecies.nameAl')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.al"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="treespecies.nameAl" name="treespecies.nameAl" value="<s:property value='treespecies.nameAl'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.al"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END treespecies.nameAl -->
				
				
				<!-- START treespecies.nameSr -->
				<s:if test="fieldErrors.get('treespecies.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.sr"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="treespecies.nameSr" name="treespecies.nameSr" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.sr"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treespecies.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.sr"/></label>
						<div class="col-md-10">
							<input maxlength="3" id="treespecies.nameSr" name="treespecies.nameSr" value="<s:property value='treespecies.nameSr'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.sr"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END treespecies.nameSr -->
			
				<!-- START treespecies.nameLa -->
				<s:if test="fieldErrors.get('treespecies.nameLa')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.la"/></label>
						<div class="col-md-10">
							<input maxlength="20" id="treespecies.nameLa" name="treespecies.nameLa" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.la"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treespecies.nameLa')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.la"/></label>
						<div class="col-md-10">
							<input maxlength="20" id="treespecies.nameLa" name="treespecies.nameLa" value="<s:property value='treespecies.nameLa'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.la"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END treespecies.nameLa -->
				
				<!-- START treespecies.speciesGroup -->
					<s:if test="fieldErrors.get('treespecies.speciesGroup')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="tree.species.group.label"/></label>
						<div class="col-md-10">
						<select class="form-control" id="treespecies.speciesGroup" name="treespecies.speciesGroup">
									<s:iterator value="treeSpeciesGroupList" var="el">
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
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treespecies.speciesGroup')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="tree.species.group.label"/></label>
						<div class="col-md-10">
							<select class="form-control" id="treespecies.speciesGroup" name="treespecies.speciesGroup">
								<s:iterator value="treeSpeciesGroupList" var="el">
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
				<!-- END treespecies.speciesGroup -->
				
				<!-- START treespecies.speciesBonitet -->
					<s:if test="fieldErrors.get('treespecies.speciesBonitet')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="tree.species.bonitet.label"/></label>
						<div class="col-md-10">
							<input id="treespecies.speciesBonitet" name="treespecies.speciesBonitet" class="form-control" placeholder="<s:text name="tree.species.bonitet.label"/>" type="text" data="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treespecies.speciesBonitet')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="tree.species.bonitet.label"/></label>
						<div class="col-md-10">
							<input id="treespecies.speciesBonitet" name="treespecies.speciesBonitet" value="<s:property value='treespecies.speciesBonitet'/>" class="form-control" placeholder="<s:text name="tree.species.bonitet.label"/>" type="text" data="number">
						</div>									
					</div>
				</s:else>
				<!-- END treespecies.speciesBonitet -->
				
				<!-- START treespecies.maxDiameter -->
					<s:if test="fieldErrors.get('treespecies.maxDiameter')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="tree.species.max.diam.label"/></label>
						<div class="col-md-10">
							<input id="treespecies.maxDiameter" name="treespecies.maxDiameter" class="form-control" placeholder="<s:text name="tree.species.max.diam.label"/>" type="text" data="number">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('treespecies.maxDiameter')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="tree.species.max.diam.label"/></label>
						<div class="col-md-10">
							<input id="treespecies.maxDiameter" name="treespecies.maxDiameter" value="<s:property value='treespecies.maxDiameter'/>" class="form-control" placeholder="<s:text name="tree.species.max.diam.label"/>" type="text" data="number">
						</div>									
					</div>
				</s:else>
				<!-- END treespecies.maxDiameter -->
				
			</fieldset>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelTT" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveTT" class="btn btn-primary" type="submit">
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
		$("input[data='number']").autoNumeric('init', {
			aDec: '.', 
			aSep: ',', 
			mDec: '2'
		});
		$("#treespecies\\.code").autoNumeric('init', {
			aDec: '.', 
			aSep: ',', 
			mDec: '0'
		});

		$('#treespecies\\.speciesGroup').val('<s:property value="treespecies.speciesGroup.DOMVALUE"/>');
		
		$("#cancelTT").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "TreeSpecies.form.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#treespecies_form_content").html(jqXHR.responseText);
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
				complete:function(jqXHR, textStatus){
				}
			});			
			return false;        
		});
		$("#saveTT").on('click', function () {                    
			$('#treespecies_form').submit();
			return false;        
		});
		$("#treespecies_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form .serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#treespecies_form_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exists");
					if(!errors){
						jQuery("#treespecies_grid").trigger("reloadGrid");
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
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});
			
	});            
</script>