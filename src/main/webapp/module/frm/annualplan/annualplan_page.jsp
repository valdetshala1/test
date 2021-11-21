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
			<s:text name="annual.plan.view"/>
		</h1>
	</div>
	
</div>

<!-- widget grid -->
<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
		
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-compartment-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="annual.plan.grid"/></h2>
				</header>
				
				<div id="annualplan_grid_content">
					<jsp:include page="annualplan_grid.jsp"></jsp:include>
				</div>
				
			</div>
		
		</article>
		<!-- END NEW WIDGET -->
	</div>
	<!-- end row -->
	
	<!-- row start -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-annualplan-page" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-dashboard"></i></span>
					<h2><s:text name='annual.plan.board'/></h2>

					<div class="widget-toolbar pull-right no-border" id="label-annualplan-status" style="display: none;">
						<div class="label label-success" style="width: 100%;">
							<span id="annualplan-status"></span>&nbsp;<i class="fa fa-check"></i>
						</div>							
					</div>
										
			    	<div class="widget-toolbar pull-right no-border" id="label-annualplan-title" style="display: none;">
			    		<div class="label label-success" style="width: 100%;">
						<span id="annualplan-title"></span>
						</div>
					</div>

					
				</header>

				<div id="annualplan_content">
					<s:if test="annualplanId!=null">
						<jsp:include page="annualplan_board.jsp"></jsp:include>
					</s:if>
				</div>
			</div>
		
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
