<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>

</head>
<body>    		    
<div id="container">
<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	<input type="hidden" id="lawSuitId" name="lawSuitId" value="<s:property value="lawSuitId"/>" />
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-lawsuitstatus-form -->
			<!-- data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-lawsuitstatus-grid" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="law.suit.legend.law.suit.data.grid"/></h2>
				</header>
				
				<div id="lawsuitstatus_grid_content">
					<jsp:include page="lawsuitstatus_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-lawsuitstatus-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<!-- START widget-lawsuitstatus-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-lawsuitstatus-form" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="law.suit.legend.law.suit.data"/></h2>
				</header>
				
				<div id="lawsuitstatus_form_content">
					<jsp:include page="lawsuitstatus_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-lawsuitstatus-form -->
		
		 </article>
		 <!-- END NEW WIDGET -->		
			
	</div>
	<!-- end row -->	
		
	
</section>
<!-- end widget grid -->
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	$(document).ready(function(){
		$("#law_suit_status_content").on('remove', function(){
			$("#suit_status").removeClass("ui-state-disabled");
		});
		
	});
</script>

</div>
</body>
</html>
