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
			<s:text name="hrm.leave.legend.leave.view"/>
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
			<!-- START widget-leave-grid -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-leave-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="hrm.leave.legend.leave.data.grid"/></h2>
				</header>
				
				<div id="leave_grid_content">
					<jsp:include page="leave_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-leave-grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		
		<!-- START NEW WIDGET -->
		<article class="col-sm-12 col-md-12 col-lg-6">
		
			<!-- START widget-leave-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-leave-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="hrm.leave.legend.leave.data"/></h2>
				</header>
				
				<div id="leave_form_content">
					<jsp:include page="leave_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-leave-form -->
		
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
