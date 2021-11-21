<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache_session.jsp"%>
<html>
<head>
</head>
<body>
    		    
		<input id="annualplanId" name="annualplanId" value="<s:property value='annualplan.id'/>" type="hidden">
		<input id="munId" name="munId" value="<s:property value='annualplan.cadastralMunicipality.id'/>" type="hidden">
		<input id="year" name="year" value="<s:property value='annualplan.year'/>" type="hidden">
		<input id="centralplan" name="centralplan" value="<s:property value='centralplan'/>"  type="hidden" >
		<s:if test="centralplan">
			<input id="aptitle" name="aptitle" type="hidden" value="<s:text name='annual.plan.un.submited.activities.Seedling'/> - <s:property value='annualplan.year'/>">
		</s:if>
		<s:else>
			<input id="aptitle" name="aptitle" type="hidden" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>">
		</s:else>
		<input id="aptitle" name="aptitle" type="hidden" value="<s:property value='annualplan.cadastralMunicipality.name'/> - <s:property value='annualplan.year'/>">
		<input id="status" name="status" type="hidden" value="<s:property value='annualplan.annualPlanningStatus.status'/> - <s:date name='annualplan.createdDate' format='dd.MM.YYYY'/>">
		<input id="planStatus" name="planStatus" type="hidden" value="<s:property value='annualplan.annualPlanningStatus.status'/>">
		<input id="regionId" name="regionId" value="<s:property value='annualplan.cadastralMunicipality.region.id'/>" type="hidden">
		
		<!-- start tabs definition -->
		<ul class="nav nav-tabs" role="tablist" id="annualboard">
		<s:if test="centralplan">
			<li class="active"><a href="SeedActivity.page.do" role="tab" data-target="#seed_plan" data-toggle="boardajax"><i class="fa fa-leaf"></i> <s:text name="annual.plan.seedling"/></a></li>
		</s:if>
		<s:else>
		  <li class="active"><a href="Harvest.page.do" role="tab" data-target="#harvest_plan" data-toggle="boardajax"><i class="fa fa-truck"></i> <s:text name="annual.plan.harvest"/></a></li>
		  <li><a href="Silviculture.page.do" role="tab" data-target="#sivicult_plan" data-toggle="boardajax"><i class="fa fa-ambulance"></i> <s:text name="annual.plan.silviculture"/></a></li>
		  <li><a href="Planting.page.do" role="tab" data-target="#planting_plan" data-toggle="boardajax"><i class="fa fa-tree"></i> <s:text name="annual.plan.planting"/></a></li>
		  <li><a href="Infrastructure.page.do" data-target="#infra_plan" data-toggle="boardajax"><i class="fa  fa-road"></i> <s:text name="annual.plan.infrastructure"/></a></li>
		  
		  <li><a href="Protection.page.do" role="tab" data-target="#protection_plan" data-toggle="boardajax"><i class="fa fa-leaf"></i> <s:text name="annual.plan.protection"/></a></li>
		  <li class="dropdown" style="display: block;">
			<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:{};">More <span class="caret"></span></a>
			<ul class="dropdown-menu">
				  <li><a href="PrivateActivity.page.do?annualplanId=<s:property value='annualplan.id'/>" role="tab" data-target="#private_plan" data-toggle="boardajax"><i class="fa fa-leaf"></i> <s:text name="frm.private.planning"/></a></li>
				  <li><a href="PrivateRequest.page.do?annualplanId=<s:property value='annualplan.id'/>" role="tab" data-target="#private_request_plan" data-toggle="boardajax"><i class="fa fa-leaf"></i> <s:text name="annual.plan.private.request"/></a></li>
			</ul>
		  </li>
		  </s:else> 
		</ul>
		<!-- end tabs definition -->
		
		<!-- start tab content -->
		<div class="tab-content">									
			<s:if test="centralplan">
				<div  class="tab-pane active" id="seed_plan">
					<jsp:include page="seedling/seedactivity_page.jsp"></jsp:include>
				</div>
			</s:if>
			<s:else>
				<div class="tab-pane active" id="harvest_plan">
					<jsp:include page="harvest/harvest_page.jsp"></jsp:include>
				</div>
				
				<div class="tab-pane" id="sivicult_plan">
				</div>
	
				<div class="tab-pane" id="planting_plan">
				</div>
				
				<div class="tab-pane" id="infra_plan">
				</div>
			
				<div class="tab-pane" id="protection_plan">
				</div>
				
				<div class="tab-pane" id="private_plan">
				</div>
					
				<div class="tab-pane" id="private_request_plan">
				</div>	
			</s:else>							
		</div>
		<!-- end tab content -->

	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	var geoserver_url = "<%=session.getAttribute("geoserver_url")%>";
	var geoserver_url_wfs = "<%=session.getAttribute("geoserver_url_wfs")%>";
	var gisserver_url = "<%=session.getAttribute("gisserver_url")%>";
		
	function generateFRMAttachment(id){
		var url="FRMActivityDoc.do?docId="+id;
		window.location.href=url;
   	};

   	function getFileData(myFile){
   	    var file = myFile.files[0];  
   	    var filename = file.name;
   	    var fileExt = filename.split('.').pop();
   	    $("#doc\\.docName").val(filename);
   	    $("#doc\\.docType").val('.'+fileExt);
   	}

	function handleResize(){
		$("#annualboard > li").show();
		$("#annualboard .dropdown").hide();
		$("#annualboard .dropdown-menu li").hide();
		 
		var width = $("#annualboard").width();
		var tmpWidth = 0;
		var moreWidth = 80;
		$("#annualboard > li").each(function(){
			tmpWidth += $(this).width();
			if (tmpWidth+moreWidth > width){
				$(this).hide();
				$("#annualboard > .dropdown").show();
				$("#annualboard .dropdown-menu li a[href='"+$(this).find('a').attr('href')+"']").parent().show();
			}
			return;
		});
	}
	
	//handleResize();
	//$(window).resize(handleResize);    	
   	var windowWidth;
	var windowHeight;
	$(document).ready(function() {
		
		$(document).click(function(){
			$("#annualboard > .dropdown .dropdown-menu").hide();
		});
		//http://jsfiddle.net/mmfansler/2eTSL/
		$("#label-annualplan-title").show();
		$("#label-annualplan-status").show();
		$("#annualplan-title").html($("#aptitle").val());
		$("#annualplan-status").html($("#status").val());
		
		$(".dropdown-toggle").on("click",function(){
			$("#annualboard > .dropdown .dropdown-menu").show();
		});
		$('[data-toggle="boardajax"]').click(function(e) {
		    var $this = $(this),
		        loadurl = $this.attr('href'),
		        targ = $this.attr('data-target');
	
		    $.get(loadurl, function(data) {
		        $(targ).html(data);
		    });
		    
		    $this.tab('show');
		    $("#annualboard > .dropdown .dropdown-menu").hide();
		    return false;
		});
		
		windowWidth = $(window).width();
		windowHeight = $(window).height();
		
		$(window).bind('resize', function() {
			windowWidth = $(window).width();
			windowHeight = $(window).height();
        });
	});	
	
</script>

</body>
</html>
