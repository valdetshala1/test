<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>    		    
<div id="dpmngmt_page_content">
<br>
<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-grid-grid -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-dpmngmt-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="dpmngmt.legend.dp.data.grid"/></h2>
				</header>
				
				<div id="dp_grid_content">
					<jsp:include page="dp_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-grid-grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row	 -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-dpmngmt-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="dpmngmt.legend.dp.request"/></h2>
				</header>
				
				<div id="dp_content">
					<jsp:include page="dp_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-dpmngmt -->
		
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
