<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>


</head>
<body>    		    
<div id="container">
<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
		<h1 class="page-title txt-color-blueDark"><i class="fa fa-desktop fa-fw "></i> 
			<span><s:text name="dem.fiskos.data.import"/></span>
		</h1>
	</div>
</div>

<!-- widget grid -->
<section id="widget-grid" class="">

	<!-- row	 -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12 col-md-12 col-lg-6">
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-fiskos-import-form-id" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-sign-in"></i></span>
					<h2><s:text name="dem.fiskos.import.wizard"/></h2>
				</header>
				
				<div id="fiskos_import_form_content">
					<jsp:include page="import_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-assets -->
		
		</article>
		<!-- END NEW WIDGET -->
	</div>
	<!-- end row -->
	

	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-import-grid-->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-fiskos-import-grid-id" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i></span>
					<h2><s:text name="dem.fiskos.data"/></h2>
				</header>
				
				<div id="import_grid">
					<jsp:include page="import_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-import-grid -->
		
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
