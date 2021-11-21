<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head></head>
<body>    		    
<div id="container">
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-desktop fa-fw "></i> 
			<s:text name="adm.domain.view"/>
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
			<!-- START widget-employee-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-employee-grid" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2><s:text name="adm.domain.grid"/></h2>
				</header>
				
				<div id="domain_grid_content">
					<jsp:include page="domain_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-employee-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<!-- START widget-role-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-employee-form" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2><s:text name="adm.domain.data"/></h2>
				</header>
				
				<div id="editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, editoptions: { multiple: false, value: eval('(' + catList + ')') }, ">
					<jsp:include page="domain_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-role-form -->
		
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
