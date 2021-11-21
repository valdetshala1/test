<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!-- widget div-->
<div id="assets_content"
	class="well well-light well-sm no-margin no-padding">

	<div class="row">
	<input id="assetId" name="assetId" value="<s:property value='asset.id'/>" type="hidden">
	<input id="assetOrganisation" name="assetOrganisation" value="<s:property value='asset.organisation.id'/>" type="hidden">
		<div class="col-sm-12">

			<div class="padding-10">

				<ul class="nav nav-tabs tabs-pull-left">
					<li class="active"><a href="Asset.form.do?assetId=<s:property value='asset.id'/>" data-target="#asstes_staffassign_page" data-toggle="boardajax" data-toggle="boardajax"><s:text name="assets.devaluation.assets.empty"/></a></li>
					<s:if test="assetId!=null">
						<li><a href="AssetsStaffAssign.page.do" data-target="#assets_staffassign_page" data-toggle="boardajax"><s:text name="asset.label.asset.assign"/></a></li>
					</s:if>
				</ul>
				<!-- start tabs-->
				<div class="tab-content padding-top-10">
					<!-- start asset form tab -->
					<div class="tab-pane active" id="asstes_staffassign_page">
						<div id="asset_form_content">
							<jsp:include page="asset_form.jsp"></jsp:include>
						</div>
					</div>
					<!-- end asset form tab -->
					<!-- start assetsstaffassign tab -->
					<div class="tab-pane" id="assets_staffassign_page">
					</div>
					<!-- end assetsstaffassign tab -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end widget div -->
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="boardajax"]').click(function(e) {
				
		    var $this = $(this),
		        loadurl = $this.attr('href'),
		        targ = $this.attr('data-target');
	
		    $.get(loadurl, function(data) {
		        $(targ).html(data);
		    });
	
		    $this.tab('show');
		    return false;
		});
	});
</script>
