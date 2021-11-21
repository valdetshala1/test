<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head></head>
<body>    		    
<div id="container">
<br>

<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
	
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-employee-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-object-grid" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-shield"></i></span>
					<h2><s:text name="adm.object.tree.grid"/></h2>
					
					<div class="widget-toolbar">
	                    <div class="icon-addon addon-sm">
	                        <input type="text" id="searchterm" name="searchterm" placeholder="<s:text name="adm.organisation.search.of.tree"/>" class="form-control">
	                        <label for="searchterm" class="glyphicon glyphicon-search" rel="tooltip" title="<s:text name="adm.organisation.search.of.tree"/>"></label>
	                    </div>	 
			    	</div>
			    						
				</header>
				
				<div id="object_grid_content">
					<jsp:include page="object_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-employee-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
<!-- 	<div class="row"> -->
<!-- 		<!-- START NEW WIDGET --> 
<!-- 		<article class="col-sm-12"> -->
		
<!-- 			<!-- START widget-role-form --> 
<!-- 			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-employee-form" data-widget-deletebutton="false"> -->
<!-- 				<header> -->
<%-- 					<span class="widget-icon"> <i class="fa fa-shield"></i></span> --%>
<!-- 					<h2>Object Data</h2> -->
<!-- 				</header> -->
				
<!-- 				<div id="object_form_content"> -->
<%-- 					<jsp:include page="object_form.jsp"></jsp:include> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<!-- END widget-role-form --> 
		
<!-- 		 </article> -->
<!-- 		 <!-- END NEW WIDGET -->		 
			
<!-- 	</div> -->
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
