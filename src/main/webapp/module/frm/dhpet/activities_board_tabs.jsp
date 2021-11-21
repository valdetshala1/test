<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache_session.jsp"%>
<html>
<head>
</head>
<body>
		<div>
	    <input id="w_animal_location_id" name="w_animal_location_id" value="<s:property value='w_animal_location_id'/>" type="hidden" >
	  	<input id="w_animal_id" name="w_animal_id" value="<s:property value='wanimal.id'/>" type="hidden" >
	    <div class="widget-body">
			<h6 class="alert alert-info"> 
				<i class="fa fa-krw"></i>  <s:if test="%{locale.language=='al'}"><s:property value='wanimal.nameAl'/>
				</s:if><s:elseif test="%{locale.language=='sr'}">
					<s:property value='wanimal.nameSr'/>
				</s:elseif>
				<s:else>
					<s:property value='wanimal.nameEn'/> 
				</s:else>
			 </h6>
		</div>
		<div id="tabs">
		<!-- start tabs definition -->
		<ul class="nav nav-tabs" role="tablist" id="annualboard">
			<li class="active"><a href="AnimalLocation.page.do" role="tab" data-target="#location_animal" data-toggle="boardajax" id="0"><i class="fa fa-bullseye"></i> <s:text name="dhpet.animals"/> </a></li>
		 <s:if test="w_animal_location_id!=null">
		 	<li><a href="DhpetAnimalLocationDetail.page.do" role="tab" data-target="#animal_Loc_detail" data-toggle="boardajax" id="4"><i class="fa fa-foursquare"></i> <s:text name="dhpet.animal.detail"/> </a></li>
		 	<li><a href="HuntGroundEval.page.do" role="tab" data-target="#hunt_ground_eval" data-toggle="boardajax" id="1"><i class="fa fa-foursquare"></i> <s:text name="dhpet.hunting.ground.evaluation"/> </a></li>
		 	<li><a href="AnimalCapacity.page.do" role="tab" data-target="#animal_capacity" data-toggle="boardajax" id="2"><i class="fa fa-table"></i> <s:text name="dhpet.animal.capacity.menu"/></a></li>
		 </s:if>
		 	<li><a href="HuntedAnimal.page.do" role="tab" data-target="#hunted_animals" data-toggle="boardajax" id="3"><i class="fa fa-arrow-circle-o-right"></i> <s:text name="hunt.animals.legend.menu"/></a></li>
		</ul>
		<!-- end tabs definition -->
		      
		<!-- start tab content -->
		<div class="tab-content">									
				<div class="tab-pane active" id="location_animal">
					<jsp:include page="location/animal/animal_page.jsp"></jsp:include>
				</div>
			  <s:if test="w_animal_location_id!=null">
				<div class="tab-pane" id="animal_Loc_detail">
				</div>
				
				<div class="tab-pane" id="hunt_ground_eval">
				</div>
	
				<div class="tab-pane" id="animal_capacity">
				</div>
			  </s:if>
				<div class="tab-pane" id="hunted_animals">
				</div>
		</div>
		<!-- end tab content -->
	    </div>
	    </div>
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!

	$(document).ready(function() {
		$(".dropdown-toggle").on("click",function(){
			$("#annualboard > .dropdown .dropdown-menu").show();
		});
		
		$('[data-toggle="boardajax"]').click(function(e) {
		    var $this = $(this),
		        loadurl = $this.attr('href'),
		        targ = $this.attr('data-target');
		    	activeTab=$this.attr('id');
		    	
		    $.get(loadurl, function(data) {
		        $(targ).html(data);
		    });
		    
		    $this.tab('show');
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
