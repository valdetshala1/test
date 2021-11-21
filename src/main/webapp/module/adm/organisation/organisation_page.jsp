<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
<script type="text/javascript" src="js/plugin/jqgrid/grid.addons.js"></script>	
<script type="text/javascript" src="js/plugin/tokenize/jquery.tokenize.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugin/tokenize/jquery.tokenize.css">

<style>

.tokenize-sample { width: 100%; min-height: 50px;}


</style> 	
</head>
<body>    		    
<div id="container">
<br>
<!-- widget grid -->
<section id="widget-grid" class="">
	
	<!-- row -->
	<div class="row">
		
		<!-- START NEW WIDGET -->
		<article class="col-sm-12 col-md-12 col-lg-6">
		
			<!-- START widget-leave-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-orga-form"  data-widget-fullscreenbutton="true" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="adm.organisation.legend.organisation.data"/></h2>
				</header>
				
				<div id="organisation_form_content">
					<jsp:include page="organisation_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-leave-form -->
		
		 </article>
		 <!-- END NEW WIDGET -->		
		 
		<!-- START NEW WIDGET -->
		<article class="col-sm-12 col-md-12 col-lg-6">
		
			<!-- START widget-leave-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-orga-tree" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="adm.organisation.legend.organisation.tree"/></h2>
					
					<div class="widget-toolbar">
	                    <div class="icon-addon addon-sm">
	                        <input type="text" id="searchterm" name="searchterm" placeholder="<s:text name="adm.organisation.search.of.tree"/>" class="form-control">
	                        <label for="searchterm" class="glyphicon glyphicon-search" rel="tooltip" title="<s:text name="adm.organisation.search.of.tree"/>"></label>
	                    </div>	 
			    	</div>
				    									
				</header>
				
				<div id="organisation_tree_content">
					<jsp:include page="organisation_treegrid.jsp"></jsp:include>
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
