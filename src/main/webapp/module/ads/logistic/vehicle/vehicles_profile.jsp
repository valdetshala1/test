<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<%-- <script type="text/javascript" --%>
<%-- 	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script> --%>
<!-- <link rel="stylesheet" type="text/css" media="screen" -->
<!-- 	href="js/plugin/ajaxwidget/ui.combobox-custom.css"> -->

<!-- widget div-->
<div id="vehicles_profile_content"
	class="well well-light well-sm no-margin no-padding">
<input id=vehicle.id name="vehicle.id" value="<s:property value='vehicle.id'/>" type="hidden">
	<div class="row">
	<input id="vehicleId" name="vehicleId" value="<s:property value='vehicle.id'/>" type="hidden">
	<input id="vehicleOrganisation" name="vehicleOrganisation" value="<s:property value='vehicle.organisation.id'/>" type="hidden">
		<div class="col-sm-12">
			<div class="padding-10">
				<ul class="nav nav-tabs tabs-pull-left">
					<li class="active"><a href="Vehicles.form.do?vehicleId=<s:property value='vehicle.id'/>" data-target="#a1" data-toggle="tab"><s:text name="vehicles.legend.vehicle"/></a></li>
					<s:if test="vehicleId!=null">
						<li><a href="VehiclesRegister.page.do" data-target="#a2" data-toggle="tab"><s:text name="vehicles.legend.vehicle.register"/></a></li>
						<li><a href="VehiclesServiceMaintenance.page.do" data-target="#a3" data-toggle="tab"><s:text name="vehicles.legend.vehicle.service.maint"/></a></li>
						<li><a href="VehicleStaffAssign.page.do" data-target="#a4" data-toggle="tab"><s:text name="vehicles.legend.vehicle.staff.assign"/></a></li>
						<li><a href="FuelConsum.page.do" data-target="#a5" data-toggle="tab"><s:text name="vehicles.legend.vehicle.fuel.consum"/></a></li>
						<li><a href="Device.page.do?vehicleIdDev=<s:property value='vehicle.id'/>" data-target="#a6" data-toggle="tab"><s:text name="vehicles.legend.vehicle.device"/></a></li>
						<li><a href="Device.tracking.do?vehicleIdDev=<s:property value='vehicle.id'/>" data-target="#a7" data-toggle="tab"><s:text name="vehicles.legend.device.tracking"/></a></li>
					</s:if>
				</ul>
				<!-- start tabs-->
				<div class="tab-content padding-top-10">
					<!-- start vehicle form tab -->
					<div class="tab-pane fade in active" id="a1">
						<div id="vehicles_form_content">
							<jsp:include page="vehicles_form.jsp"></jsp:include>
						</div>
					</div>
					<!-- end vehicle form tab -->
					
						<!-- start vehicle register tab -->
							<div class="tab-pane fade" id="a2">
							</div>
						<!-- end vehicle register tab -->
						
						<!-- start vehicle service maintenance tab -->
							<div class="tab-pane fade" id="a3">
							</div>
						<!-- end vehicle service maintenance tab -->
						
						<!-- start vehicle staff assign tab -->
							<div class="tab-pane fade" id="a4">
							</div>
						<!-- end vehicle staff assign tab -->
						
						<!-- start fuel consum tab -->
							<div class="tab-pane fade" id="a5">
							</div>
						<!-- end fuel consum tab -->
						
						<!-- start device tab -->
							<div class="tab-pane fade" id="a6">
							</div>
						<!-- end device tab -->
						
						<!-- start tracking tab -->
							<div class="tab-pane fade" id="a7">
							</div>
						<!-- end tracking tab -->
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end widget div -->
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tab"]').click(function(e) {
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
