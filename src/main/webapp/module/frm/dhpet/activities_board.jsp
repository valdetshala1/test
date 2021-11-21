<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache_session.jsp"%>
<html>
<head>
</head>
<body>
    	<!-- START annualplanName -->
		<s:if test="fieldErrors.get('annualplanId')!=null">
			<div class="form-group has-error">
				<label class="col-md-2 control-label">*<s:text name='annual.plan.year'/>
				</label>
				<div class="col-md-8">
					<input id="annualplanName" name="annualplanName" class="form-control" type="text">
					<input id="annualplanId" name="annualplanId" class="form-control" type="hidden">
					<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('annualplanId')"/> </span>
				</div>	
				<div class="col-md-3">
				</div>				
			</div>
		</s:if>
		<s:else>
			<div class="form-group">
			<div class="row">
				<label class="col-md-2 control-label">*<s:text name='annual.plan.year'/></label>
				<div class="col-md-6">
					<input id="annualplanName" name="annualplanName" value="<s:property value='annualplanName'/>" class="form-control" type="text">
					<input id="annualplanId" name="annualplanId" value="<s:property value='annualplanId'/>"class="form-control" type="hidden" >
				</div>	
				<div class="col-md-2">
						<button id="generator" class="btn btn-primary" type="submit">
							<i class="fa fa-print"></i>
							<s:text name='label.button.generate.report'/>
						</button>
				</div>									
			</div>
			</div>
			<hr/>
		</s:else>
		<!-- END annualplanName -->
		<hr/>

		<div id="activities_board_tabs">
			<jsp:include page="activities_board_tabs.jsp"></jsp:include>
	    </div>

</body>
</html>



