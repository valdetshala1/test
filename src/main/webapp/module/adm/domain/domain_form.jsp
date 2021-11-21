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
		<form id="domain_form" class="form-horizontal" action="DomainSave.do" accept-charset="utf8" method="post" enctype="multipart/form-data">
			
			<fieldset>
				<legend><s:text name="adm.domain.data"/></legend>
				
				<!-- START domain.name -->
				<s:if test="fieldErrors.get('domain.name')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='hrm.skill.grid.name'/></label>
						<div class="col-md-10">
							<input id="domain.name" name="domain.name" class="form-control" placeholder="<s:text name='hrm.skill.grid.name'/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('domain.name')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='hrm.skill.grid.name'/></label>
						<div class="col-md-10">
							<input id="domain.name" name="domain.name" value="<s:property value='domain.name'/>" class="form-control" placeholder="<s:text name='hrm.skill.grid.name'/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END domain.name -->
				
				<!-- START domain.isSingular -->
				<s:if test="fieldErrors.get('domain.isSingular')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name='adm.domain.importance'/></label>
						<div class="col-md-10">
							<input id="domain.isSingular" name="domain.isSingular" class="form-control" placeholder="<s:text name='adm.domain.importance'/>" type="checkbox">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('domain.isSingular')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name='adm.domain.singular'/></label>
						<div class="col-md-10">
							<input id="domain.isSingular" name="domain.isSingular" class="form-control" placeholder="<s:text name='adm.domain.importance'/>" type="checkbox">
						</div>									
					</div>
				</s:else>
				<!-- END domain.isSingular -->
				
				<!-- START domain.description -->
				<div class="form-group">
					<label class="col-md-2 control-label"><s:text name='finance.type.label.description'/></label>
					<div class="col-md-10"><!-- width:510px;max-height:200px;overflow-y:auto; -->
						<textarea id="domain.description" name="domain.description" class="form-control" style="text-align:left!important;float: left; margin: 0 10px 0 0;overflow: hidden;" placeholder="Enter a short synopsis"><s:property value="domain.description"/></textarea>
					</div>
				</div>
				<!-- END domain.description -->
			
			</fieldset>

			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancel" class="btn btn-default" type="submit">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="save" class="btn btn-primary" type="submit">
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
	
