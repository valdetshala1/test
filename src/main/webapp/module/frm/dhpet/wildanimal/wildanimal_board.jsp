<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<html>
<head>
</head>
<body>
		<input id="dhpetWildAnimalId" name="dhpetWildAnimalId" value="<s:property value='dhpetWildAnimals.id'/>" type="hidden">
		<!-- start tabs definition -->
		<ul class="nav nav-tabs" role="tablist" id="wildanimals">
		  <li class="active"><a href="WildAnimal.form.do?dhpetWildAnimalId=<s:property value='dhpetWildAnimals.id'/>" role="tab" data-target="#wildanimal_form_content" data-toggle="boardajax"><i class="fa fa-compass"></i><s:text name="dhpet.wildAnimals"/></a></li>
		  <s:if test="dhpetWildAnimalId!=null">
		  	<li><a href="AnimalRequest.page.do" role="tab" data-target="#animal_request_form_content" data-toggle="boardajax"><i class="fa fa-bullseye "></i> <s:text name="dhpet.animal.request"/> </a></li>
		  </s:if>
		</ul>
		<!-- end tabs definition -->
		<!-- start tab content -->
		<div class="tab-content">									
				<div class="tab-pane active" id="wildanimal_form_content">
					<jsp:include page="wildanimal_form.jsp"></jsp:include>
				</div>
				<div class="tab-pane " id="animal_request_form_content">
				</div>
		</div>
		<!-- end tab content -->
</body>
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();

	function handleResize(){
		$("#wildanimals > li").show();
		$("#wildanimals .dropdown").hide();
		$("#wildanimals .dropdown-menu li").hide();
		 
		var width = $("#wildanimals").width();
		var tmpWidth = 0;
		var moreWidth = 80;
		$("#wildanimals > li").each(function(){
			tmpWidth += $(this).width();
			if (tmpWidth+moreWidth > width){
				$(this).hide();
				$("#wildanimals > .dropdown").show();
				$("#wildanimals .dropdown-menu li a[href='"+$(this).find('a').attr('href')+"']").parent().show();
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
