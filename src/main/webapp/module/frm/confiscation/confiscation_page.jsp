<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
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
			<!-- START widget-employee-form -->
			<!-- data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-fire-grid-" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>

				</header>
				<div>
					<div class="widget-body-toolbar">
						<div class="row">
							<div class="col-xs-9 col-sm-5 col-md-5 col-lg-5" style="padding-left: 20%;">
								<label class="radio radio-inline" style=" margin-top: 0px;"> <input type="radio"
									class="radiobox" name="confiscationTypeR" id="forConf" value="CO"/>
									<span><s:text name="frm.confiscation.for.confiscation"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="confiscationTypeR" id="forSa" value="SA"/>
									<span><s:text name="frm.confiscation.for.sale"/></span>
								</label>
	
							</div>
							<div class="col-xs-3 col-sm-7 col-md-7 col-lg-7 text-right">
								<div class="">
									<label class="col-md-2 control-label">*<s:text name="frm.confiscaation.date"/>:</label>
									<div class="col-md-4">
										<input id="confiscationDateStart" name="confiscationDateStart" class="form-control" type="text">
									</div>	
									<div class="col-md-4">
										<input id="confiscationDateEnd" name="confiscationDateEnd"  class="form-control" type="text">
									</div>								
								</div>
								</div>
						</div>
				</div>
				</div>
				<div id="confiscation_grid_content">
					<jsp:include page="confiscation_grid.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-employee-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
		
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12 ">
		
			<!-- START widget-employee-form -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-fire-form-" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="confiscation.report.type.view"/></h2>
				</header>
				
				<div id="confiscation_form_content">
					<jsp:include page="confiscation_form.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-employee-form -->
		
		 </article>
		 <!-- END NEW WIDGET -->		
			
	</div>
	<!-- end row -->	
		
	
</section>
<!-- end widget grid -->
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	function triggerRefresh() {
	    var confiscation_grid=$('#confiscation_grid');
	    var urlData = 'FrmGrid.confiscationReport.do';
	    var wsParams={confType: $("input[name='confiscationTypeR']:checked").val(), startDate: $("#confiscationDateStart").val() , endDate:$("#confiscationDateEnd").val()};
	    var gridParam = { url: urlData, datatype: "json", postData: wsParams, page: 1};                        
	    confiscation_grid.jqGrid('setGridParam', gridParam).trigger("reloadGrid");
	};
	
	function startDateIsGreaterThanEndDate(){
		var compare=$.datepicker.formatDate("dd.mm.yy", new Date($("#confiscationDateStart").val())) < $.datepicker.formatDate("dd.mm.yy", new Date($("#confiscationDateEnd").val()));
// 		alert("Compare"+compare);
		return compare;
	};
	
	$(document).ready(function () {
	    $('#confiscationDateStart').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
	    $('#confiscationDateEnd').datetimepicker({
			lang: 'al',
			format: 'd.m.Y',
			mask: false,
			formatDate:'d.m.Y',
			timepicker: false,
		});
	    $("#forConf").attr('checked', 'checked');
	    $("input[name='confiscationTypeR']").change(function(){
			triggerRefresh();
	    });

	    $("#confiscationDateStart").change(function(){
	    	  var rezCompare=true;
		    if($("#confiscationDateEnd").val() && $("#confiscationDateStart").val()){
			   rezCompare=startDateIsGreaterThanEndDate();
			    if(rezCompare==true){
			    	triggerRefresh();
				  }else{
					$('#confiscationDateStart').val('');
					alert("End date have to be greater than start date");
				  }
			 }else{
				 triggerRefresh();
			 }
	    });
	    $("#confiscationDateEnd").change(function(){
	    	var rezCompare=true;
		    if($("#confiscationDateEnd").val() && $("#confiscationDateStart").val()){
			    rezCompare=startDateIsGreaterThanEndDate();
			    if(rezCompare==true){
			    	triggerRefresh();
				  }else{
					$('#confiscationDateEnd').val('');
					
					alert("End date have to be greater than start date");
				  }
		    	
			 }else{
				 triggerRefresh();
			 }
	    });
	
	});
	
</script>

</div>
</body>
</html>
