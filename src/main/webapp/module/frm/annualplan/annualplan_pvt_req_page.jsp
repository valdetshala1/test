<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>    		    
<div id="container">
<div class="row">
<input id="annualplanId" name="annualplanId" value="<s:property value='annualplan.id'/>" type="hidden">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-desktop fa-fw "></i> 
		<s:text name="frm.private.request.view"/>
			<span>
			</span>
		</h1>
	</div>
	
</div>

<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-annualplan_pvt_req-grid -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-annualplan_pvt_req-grid"  data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="annual.plan.grid"/></h2>
				</header>
				
				<div id="annualplan_pvt_req_grid_content">
					<jsp:include page="annualplan_pvt_req_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-annualplan_pvt_req-grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<!-- START widget-annualplan_pvt_req-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-annualplanpvt-page" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-dashboard"></i></span>
					<h2><s:text name="annual.plan.private.request"/></h2>
					<div class="widget-toolbar pull-right no-border" id="label-activitypvt-start" style="display: none;">
						<div class="label label-success" style="width: 100%;">
							<span id="pvtactivity-start"></span>
						</div>							
					</div>
			    
					
				</header>
				
				<div id="annualplan_pvt_req_content">
					<s:if test="annualplanId!=null">
					<jsp:include page="private/private_request_page.jsp"></jsp:include>
					</s:if>
				</div>
			</div>
			<!-- END widget-annualplan_pvt_req-form -->
		
		 </article>
		 <!-- END NEW WIDGET -->		
			
	</div>
	<!-- end row -->	
		
	
</section>
<!-- end widget grid -->
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
</script>

</div>
</body>
</html>
