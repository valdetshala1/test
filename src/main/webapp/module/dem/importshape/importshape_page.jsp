<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>


</head>
<body>    		    
<div id="container">
<!-- widget grid -->
<section id="widget-grid" class="">

	<!-- row	 -->
	<div class="row">
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-fiskos-import-form-id" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
								<header>
									<div class="widget-toolbar import-type"> 
												<div class="form-horizontal form-group ">
													<label class="col-md-2 control-label">*<s:text name="dem.import.type"/></label>
														<div class="col-md-10">
															<label class="radio radio-inline">
																<input type="radio" class="radio-element" id="compstand" name="radio-4" onclick="getImportType('C');" value=""><s:text name="dem.comp.stand.radio"/>
															</label>
															<label class="radio radio-inline">
																<input type="radio" class="radio-element"  id="plots" name="radio-4" onclick="getImportType('P');"value=""><s:text name="dem.plots.radio"/> 
															</label>
															<label class="radio radio-inline">
																<input type="radio" class="radio-element"  id="lines" name="radio-4" onclick="getImportType('L');" value=""><s:text name="dem.lines.radio"/>  
															</label>
															<label class="radio radio-inline">
																<input type="radio" class="radio-element" id="biodiversity" name="radio-4" onclick="getImportType('B');" value=""><s:text name="dem.biodiversity.radio"/>  
															</label>
														</div>
												</div>
									</div>
								</header>
		
				<div id="shape_import_form_content_page">
					<jsp:include page="importshape_form.jsp"></jsp:include>
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
<%-- 					<jsp:include page="test.jsp"></jsp:include> --%>
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
	function getImportType(type){
		var url="";
		if(type==='C'){
			url="ImportShape.form.do";
		}else if(type==='P'){
			url="ImportPlot.page.do";
		}else if(type==='L'){
			url="ImportLine.form.do";
		}else if(type==='B'){
			url="ImportBiodiv.form.do";
		}
		
		if(url!==''){
			$.ajax({
				type : "GET",
				url : url,
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) {
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) {
					$("#shape_import_form_content_page").html(jqXHR.responseText);
				},
				complete : function(jqXHR, textStatus) {
				}
			});
		}
			return false;
		
	}
	$(document).ready(function() {
		$("#compstand").prop('checked',true);
	});
</script>

</div>
</body>
</html>
