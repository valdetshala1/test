<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>
		<input id="stratId" name="stratId" value="<s:property value='stratId'/>" type="hidden">
		<input id="startPlanPeriod" name="startPlanPeriod" value="<s:property value='startPlanPeriod'/>" type="hidden">
		<input id="endPlanPeriod" name="endPlanPeriod" value="<s:property value='endPlanPeriod'/>" type="hidden">
		<!-- start tabs definition -->
		<ul class="nav nav-tabs" role="tablist" id="executiontabs">
		 <li class="active"><a href="Execution.page.do" role="tab" data-target="#execution_tab_content" data-toggle="boardajax"><i class="fa fa-filter"></i> <s:text name="mer.execution.tab"/></a></li>
		 <li><a href="PerfIndicator.page.do" role="tab" data-target="#indicator_perf_tab_content" data-toggle="boardajax"><i class="fa fa-share"></i> <s:text name="mer.performance.indicator.tab"/></a></li>
		<li><a href="StratIndicator.page.do" role="tab" data-target="#indicator_strat_tab_content" data-toggle="boardajax"><i class="fa fa-share-square"></i> <s:text name="mer.strategy.indicator.tab"/></a></li>
		<li><a href="FinDonor.page.do" role="tab" data-target="#fin_donor_tab_content" data-toggle="boardajax"><i class="fa fa-share-square"></i> <s:text name="mer.fin.donor.tab"/></a></li>
		</ul>
		<!-- end tabs definition -->
		<!-- start tab content -->
		<div class="tab-content">									
				<div class="tab-pane active" id="execution_tab_content">
					<jsp:include page="execution_page.jsp"></jsp:include>
				</div>
				<div class="tab-pane" id="indicator_perf_tab_content">
				</div>
				<div class="tab-pane" id="indicator_strat_tab_content">
				</div>
				<div class="tab-pane" id="fin_donor_tab_content">
				</div>
		</div>
		<!-- end tab content -->

	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();

	function handleResize(){
		$("#executiontabs > li").show();
		$("#executiontabs .dropdown").hide();
		$("#executiontabs .dropdown-menu li").hide();
		 
		var width = $("#executiontabs").width();
		var tmpWidth = 0;
		var moreWidth = 80;
		$("#executiontabs > li").each(function(){
			tmpWidth += $(this).width();
			if (tmpWidth+moreWidth > width){
				$(this).hide();
				$("#executiontabs > .dropdown").show();
				$("#executiontabs .dropdown-menu li a[href='"+$(this).find('a').attr('href')+"']").parent().show();
			}
			return;
		});
	}
	
	//handleResize();
	//$(window).resize(handleResize);    	
   	
	$(document).ready(function() {
		//http://jsfiddle.net/mmfansler/2eTSL/
		
		$('[data-toggle="boardajax"]').click(function(e) {
			
		    var $this = $(this),
		        loadurl = $this.attr('href'),
		        targ = $this.attr('data-target');
	
		    $.get(loadurl, function(data) {
		        $(targ).html(data);
		    });
	
		    $this.tab('show');
		    return false;
		});

		
	});	
	
</script>

</body>
</html>
