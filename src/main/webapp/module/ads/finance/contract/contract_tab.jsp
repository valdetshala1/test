<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="felling_tab_content"
	class="well well-light well-sm no-margin no-padding">
	<div class="row">
	<input id="contractId" name="contractId" value="<s:property value='contract.id'/>" type="hidden">
		
		<div class="col-sm-12">

			<div class="padding-10">

				<ul class="nav nav-tabs tabs-pull-left">
					<li class="active"><a href="Contract.form.do?contractId=<s:property value='contract.id'/>" data-target="#contractTab" data-toggle="tab"><s:text name="finance.contract.contract"/></a>
					</li>
					<s:if test="contractId!=null">
					<li><a href="Payment.page.do" data-target="#payPeriod" data-toggle="tab"><s:text name="finance.contract.payment.period"/></a></li>
					</s:if>
				</ul>
				<div class="tab-content padding-top-10">
					<!-- start felling form tab -->
					<div class="tab-pane fade in active" id="contractTab">
						<div id="contract_form_content">
							<jsp:include page="contract_form.jsp"></jsp:include>
						</div>
					</div>
					
					<s:if test="contractId!=null">
						<!-- start felling tab -->
						<div class="tab-pane fade" id="payPeriod">
<!-- 							<div id="paymentperiod_grid_content"> -->
<%-- 								<jsp:include page="paymentperiod/paymentperiod_grid.jsp"></jsp:include> --%>
<!-- 							</div> -->
<!-- 							<div id="paymentperiod_form_content"> -->
<%-- 								<jsp:include page="paymentperiod/paymentperiod_form.jsp"></jsp:include> --%>
<!-- 							</div> -->
						</div>
					</s:if>
					
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
