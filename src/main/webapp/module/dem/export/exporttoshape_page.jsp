<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
<style>
.form-actions{
	margin:0 !important;
}
</style>
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
										<input type="radio" class="radio-element" id="compstand" name="radio-4" onclick="getExportType('C');" value=""><s:text name="dem.comp.stand.radio"/>
									</label>
									<label class="radio radio-inline">
										<input type="radio" class="radio-element"  id="plots" name="radio-4" onclick="getExportType('P');"value=""><s:text name="dem.plots.radio"/> 
									</label>
<!-- 									<label class="radio radio-inline"> -->
<%-- 										<input type="radio" class="radio-element"  id="lines" name="radio-4" value=""><s:text name="dem.lines.radio"/> --%>
	<%-- 																		<input type="radio" class="radio-element"  id="lines" name="radio-4" onclick="getExportType('L');" value=""><s:text name="dem.lines.radio"/>   --%>
<!-- 									</label> -->
									<label class="radio radio-inline">
										<input type="radio" class="radio-element" id="biodiversity" name="radio-4" onclick="getExportType('B');" value=""><s:text name="dem.biodiversity.radio"/>  
									</label>
									<label class="radio radio-inline">
										<input type="radio" class="radio-element" id="layers" name="radio-4" onclick="getExportType('L');" value=""><s:text name="dem.fiskos.layers"/>  
									</label>
								</div>
						</div>
														
					</div>
				</header>
		
				<div id="shape_export_content_page">
					<jsp:include page="stand/export_page.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-assets -->
		
		</article>
		<!-- END NEW WIDGET -->
	</div>
	<!-- end row -->
</section>	
<!-- end widget grid -->
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	function getExportType(type){
		var url="";
		if(type==='C'){
			url="ExportStand.page.do";
		}else if(type==='P'){
			url="ExportPlot.page.do";
		}else if(type==='B'){
			url="ExportBiodiv.page.do";
		}else if(type=='L'){
			url="ExportLayer.page.do";
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
					$("#shape_export_content_page").html(jqXHR.responseText);
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
