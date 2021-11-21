<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>

</head>
<body>    		    
<div id="container">
<br>
<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-lawsuit-form -->
			<!-- data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-lawsuit-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="law.suit.label.law.suit.data.grid"/></h2>
				</header>
				
				<div id="lawsuit_grid_content">
					<jsp:include page="lawsuit_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-lawsuit-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<!-- START widget-lawsuit-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-lawsuit-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="law.suit.label.law.suit.data"/></h2>
				</header>
				
				<div id="lawsuit_form_content">
					<jsp:include page="lawsuit_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-lawsuit-form -->
		
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
