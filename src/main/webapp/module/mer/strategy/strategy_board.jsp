<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>
    		    
		<input id="strategyId" name="strategyId" value="<s:property value='strategy.id'/>" type="hidden">
		
		<!-- start tabs definition -->
		<ul class="nav nav-tabs" role="tablist" id="strategyboard">
		  <li class="active"><a href="MerStrategy.form.do?strategyId=<s:property value='strategy.id'/>" role="tab" data-target="#strategy_tab" data-toggle="boardajax"> <s:text name="mer.strategy.menu"/> </a></li>
		  <s:if test="strategyId!=null">
		  	<li><a href="RespInstitution.page.do" role="tab" data-target="#respinstitution_tab" data-toggle="boardajax"> <s:text name="mer.resp.institution.menu"/> </a></li>
		  </s:if>
		  <s:if test="strategyId!=null">
		  	<li><a href="RefSubProject.page.do" role="tab" data-target="#refsubproject_tab" data-toggle="boardajax"> <s:text name="mer.ref.sub.project"/> </a></li>
		  </s:if>
		</ul>
		<!-- end tabs definition -->
		
		<!-- start tab content -->
		<div class="tab-content">									
			<div class="tab-pane active" id="strategy_tab">
				<jsp:include page="strategy_form.jsp"></jsp:include>
			</div>
			
			<div class="tab-pane" id="respinstitution_tab">
			</div>
			
			<div class="tab-pane" id="refsubproject_tab">
			</div>
		</div>
		<!-- end tab content -->

	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
	
   	function getFileData(myFile){
   	    var file = myFile.files[0];  
   	    var filename = file.name;
   	    var fileExt = filename.split('.').pop();
   	    $("#doc\\.docName").val(filename);
   	    $("#doc\\.docType").val('.'+fileExt);
   	}
	function handleResize(){
		$("#strategyboard > li").show();
		$("#strategyboard .dropdown").hide();
		$("#strategyboard .dropdown-menu li").hide();
		 
		var width = $("#strategyboard").width();
		var tmpWidth = 0;
		var moreWidth = 80;
		$("#strategyboard > li").each(function(){
			tmpWidth += $(this).width();
			if (tmpWidth+moreWidth > width){
				$(this).hide();
				$("#strategyboard > .dropdown").show();
				$("#strategyboard .dropdown-menu li a[href='"+$(this).find('a').attr('href')+"']").parent().show();
			}
			return;
		});
	}
	
	//handleResize();
	//$(window).resize(handleResize);    	
   	
	$(document).ready(function() {
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
