<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>

<!-- widget div-->
<div id="tender_request_tab_content"
	class="well well-light well-sm no-margin no-padding">

	<div class="row">
	<input id="tenderRequestId" name="tenderRequestId" value="<s:property value='tenderRequest.id'/>" type="hidden">
	<input id="showTabs" name="showTabs" value="<s:property value='showTabs'/>" type="hidden">
	<input id="hideButtons" name="hideButtons" value="<s:property value='hideButtons'/>" type="hidden">
	<input id="hidePopupButtons" name="hidePopupButtons" value="<s:property value='hidePopupButtons'/>" type="hidden">
	
		<div class="col-sm-12">


			<div class="padding-10">

				<ul class="nav nav-tabs tabs-pull-left">
					<li class="active"><a href="TenderRequest.form.do?tenderRequestId=<s:property value='tenderRequest.id'/>" role="tab" data-target="#tab1" data-toggle="boardajax"><s:text name="tender.request.form"/></a>
					</li>
					<s:if test="tenderRequestId!=null">
						<s:if test="showTabs==true">
							<li><a href="DossierRequest.page.do" role="tab" data-target="#tab3" data-toggle="boardajax"><s:text name="dossier.request"/></a></li>
							<li><a href="Bid.page.do" role="tab" data-target="#tab3" data-toggle="boardajax"><s:text name="tender.bids"/></a></li>
						</s:if>
					</s:if>
				</ul>
				<!-- start tabs-->
				<div class="tab-content padding-top-10">
					<!-- start asset form tab -->
					<div class="tab-pane fade in active" id="tab1">
						<div id="tenderrequest_form_content">
							<jsp:include page="tender_request_form.jsp"></jsp:include>
						</div>
					</div>
					<!-- end asset form tab -->
					<s:if test="tenderRequestId!=null">
						<s:if test="showTabs==true">
							<div class="tab-pane fade" id="tab3">
<!-- 								<div id="dossierrequest_grid_content"> -->
<%-- 									<jsp:include page="../dossierrequest/dossierrequest_grid.jsp"></jsp:include> --%>
<!-- 								</div> -->
<!-- 								<div id="dossierrequest_form_content"> -->
<%-- 									<jsp:include page="../dossierrequest/dossierrequest_form.jsp"></jsp:include> --%>
<!-- 								</div> -->
							</div>
							
							<div class="tab-pane fade" id="tab2">
<!-- 								<div id="bid_grid_content"> -->
<%-- 									<jsp:include page="../bid/bid_grid.jsp"></jsp:include> --%>
<!-- 								</div> -->
<!-- 								<div id="bid_form_content"> -->
<%-- 									<jsp:include page="../bid/bid_form.jsp"></jsp:include> --%>
<!-- 								</div> -->
							</div>
						</s:if>
					</s:if>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end widget div -->
<script type="text/javascript">
pageSetUp();


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
	});
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
	
	windowWidth = $(window).width();
	windowHeight = $(window).height();
	
	$(window).bind('resize', function() {
		windowWidth = $(window).width();
		windowHeight = $(window).height();
    });
});	
</script>
