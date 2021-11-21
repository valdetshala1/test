<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
<script type="text/javascript" src="js/plugin/tokenize/jquery.tokenize.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/tokenize/jquery.tokenize.css">
</head>
<body>    		    
<div id="container">
<br/>

<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-appprivate-grid-->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-decision-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="decision.legend.decision.input.data.grid"/></h2>
				</header>
				
				<div id="decision_grid_content">
					<jsp:include page="decision_list.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-appprivate-grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row	 -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-decision-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="decision.legend.decision.data"/></h2>
				</header>
				
				<div id="decision_form_content">
					<jsp:include page="decision_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-appprivate-form -->
		
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
