<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="private_request_detail_form_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="private_request_detail_form" class="smart-form" action="PrivateRequestControlSave.do" accept-charset="utf8" method="post">
			<div class='row'>
			<!-- START cadzone -->
			<section class="col col-3">
				<label class="input-gl"> <s:text name='frm.private.request.cadastral.zone'/>:
					   <input id="cadzone" name="cadzone" value="<s:property value='parcelDetail.cadzone'/>" type="text">
				</label>
			</section>
			<!-- END cadzone -->
			<!-- START cadzone -->
			<section class="col col-3">
				<label class="input-gl"> <s:text name='frm.private.request.parcel.no'/>:
					   <input id="parcelnr" name="parcelnr" value="<s:property value='parcelDetail.parcelnr'/>"   type="text">
				</label>
			</section>
			<!-- END cadzone -->	
			<!-- START subparcelnr -->
			<section class="col col-3">
				<label class="input-gl"> <s:text name='frm.private.request.subparcel.no'/>:
					   <input id="subparcelnr" name="subparcelnr" value="<s:property value='parcelDetail.subparcelnr'/>" type="text">
				</label>
			</section>
			<!-- END subparcelnr -->
		
			<!-- START cadzone -->
			<section class="col col-3">
				<label class="input-gl"><s:text name='frm.private.request.place.name'/>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <input id="placename" name="placename"  value="<s:property value='parcelDetail.placename'/>"  type="text">
				</label>
			</section>
			<!-- END cadzone -->
			</div>
		    <div class='row'>
			<!-- START culturename -->
			<section class="col col-3">
				<label class="input-gl"><s:text name='frm.private.request.parcel.detail.culture'/>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <input id="culturename" name="culturename" value="<s:property value='parcelDetail.culturename'/>"   type="text">
				</label>
			</section>
			<!-- END culturename -->
			<!-- START area -->
			<section class="col col-3">
				<label class="input-gl"><s:text name='dhpet.animal.capacity.label.area'/> (m2):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <input id="area" name="area" value="<s:property value='parcelDetail.area'/>"  type="text">
				</label>
			</section>
			<!-- END area -->	
			<!-- START cadzone -->
			<section class="col col-3">
				<label class="input-gl"><s:text name='frm.private.request.parcel.detail.class'/>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <input id="clas" name="clas"  value="<s:property value='parcelDetail.clas'/>"   type="text">
				</label>
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
		$('#private_request_detail_form input').attr('readonly', 'readonly');
	});            
</script>