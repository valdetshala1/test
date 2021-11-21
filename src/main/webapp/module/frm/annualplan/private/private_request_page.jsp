<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>    		    
<div id="container">
<input id="apId" name="apId" value="<s:property value='annualplan.id'/>" type="hidden">
<input id="campaignIsOpen" name="campaignIsOpen" value="<s:property value='campaignIsOpen'/>" type="hidden">
<input id="userIsForestOwner" name="userIsForestOwner" value="<s:property value='userIsForestOwner'/>" type="hidden">
<input id="pvtActivityDontExist" name="pvtActivityDontExist" value="<s:property value='pvtActivityDontExist'/>" type="hidden">

<input id="privateActivity.startCmpgnDate" name="privateActivity.startCmpgnDate" value="<s:property value='privateActivity.startCmpgnDate'/>" type="hidden">
<input id="privateActivity.endCmpgnDate" name="privateActivity.endCmpgnDate" value="<s:property value='privateActivity.endCmpgnDate'/>" type="hidden">

<div id="page">
<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<div class="jarviswidget" id="widget-id-private_request-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				
				<div id="private_request_grid_content">
					<jsp:include page="private_request_grid.jsp"></jsp:include>				
				</div>
			
			</div>
		<input id="prvReqId" value="<s:property value='prvReqId'/>" type="hidden">
		<input id="annualplan.id" name="annualplan.id" value="<s:property value='annualplan.id'/>" type="hidden">
		</article>
		<!-- END NEW WIDGET -->
	</div>
	

</section>	
<!-- end widget grid -->
</div>
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	 $(document).ready(function () {
			if($("#pvtActivityDontExist").val()=='true'){
				$("#page").hide();
				$("#label-activitypvt-start").hide();
				alert("<s:text name="frm.private.request.activity.dont.exist.for.this.plan"/>");
				}else{
					$("#page").show();
					$("#label-activitypvt-start").show();
					$("#pvtactivity-start").html("<s:text name="frm.private.request.plan.campaign.period"/>: "+$("#privateActivity\\.startCmpgnDate").val()+" - "+$("#privateActivity\\.endCmpgnDate").val());
					}
		 });
</script>

</div>
</body>
</html>
