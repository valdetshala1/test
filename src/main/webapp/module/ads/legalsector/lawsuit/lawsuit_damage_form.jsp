<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<%-- <script type="text/javascript" --%>
<%-- 	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script> --%>
<!-- <link rel="stylesheet" type="text/css" media="screen" -->
<!-- 	href="js/plugin/ajaxwidget/ui.combobox-custom.css"> -->

<!-- widget div-->
<div>
	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->
	<!-- widget content -->
	<div class="widget-body">

		<form id="lawsuit_damage_form" class="form-horizontal" accept-charset="utf8">
			<fieldset>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="report.damage.label.wood.type"/></label>
						<div class="col-md-10">
							<input id="woodType" name="woodType" class="form-control" placeholder="<s:text name="report.damage.label.wood.type"/>" type="text">
						</div>
				</div>
			<fieldset>
			</fieldset>
				<legend><s:text name="ads.legalsector.damage.timber"/></legend>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.number"/></label>
						<div class="col-md-10">
							<input id="timberNumber" name="timberNumber" class="form-control" placeholder="<s:text name="law.suit.label.number"/>"
								type="text">
						</div>
				</div>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.diameter.stump"/></label>
						<div class="col-md-10">
							<input id="timberDiameterStump" name="timberDiameterStump" class="form-control" placeholder="<s:text name="law.suit.label.diameter.stump"/>" type="text">
						</div>
				</div>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.diameter.13"/></label>
						<div class="col-md-10">
							<input id="timberDiameter13" name="timberDiameter13" class="form-control" placeholder="<s:text name="law.suit.label.diameter.13"/>" type="text">
						</div>
				</div>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label..leight"/></label>
						<div class="col-md-10">
							<input id="timberHeight" name="timberHeight" class="form-control" placeholder="<s:text name="law.suit.label..leight"/>" type="text">
						</div>
				</div>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.volume.damage"/></label>
						<div class="col-md-10">
							<input id="volumeDamage" name="volumeDamage" class="form-control" placeholder="<s:text name="law.suit.label.volume.damage"/>" type="text">
						</div>
				</div>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.volume.price"/></label>
						<div class="col-md-10">
							<input id="volumeUnitPrice" name="volumeUnitPrice" class="form-control" placeholder="<s:text name="law.suit.label.volume.price"/>" type="text">
						</div>
				</div>
				<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="law.suit.label.damage.euro"/></label>
						<div class="col-md-10">
							<input id="damageEuro" name="damageEuro" class="form-control" placeholder="<s:text name="law.suit.label.damage.euro"/>" type="text">
						</div>
				</div>
			</fieldset>
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget -->
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>