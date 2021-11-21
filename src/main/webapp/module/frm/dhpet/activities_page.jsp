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
	<!-- row -->
	<div class="row">
		<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-maintofmong-grid-->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-wildanimal-form" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2><s:text name="annual.plan.grid.activities.caption"/></h2>
				</header>
				<div id="wildanimal_board_content">
					<jsp:include page="activities_board.jsp"></jsp:include>
				</div>
			</div>
			<!-- END widget-wildanimal-plan-grid -->
		
		</article>
		<!-- END NEW WIDGET -->
	</div>
	<!-- end row -->
		
</section>	
<!-- end widget grid -->
	    
	<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
	pageSetUp();
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
	


    //start page with compTab and standTab disabled
   	function getFileData(myFile){
   	    var file = myFile.files[0];  
   	    var filename = file.name;
   	    var fileExt = filename.split('.').pop();
   	    $("#doc\\.docName").val(filename);
   	    $("#doc\\.docType").val('.'+fileExt);
   	}

   	var windowWidth;
	var windowHeight;
	function reloadTab(id){
		if(id){	
			var ids=id.toString();	
			if(ids=="0"){
				jQuery("#animallocation_grid").jqGrid('setGridParam', {url:"DhpetGrid.animalLocation.do?annualplanId="+$("#annualplanId").val()});
				jQuery("#animallocation_grid").trigger('reloadGrid');	
			}else if(ids=="1"){
				jQuery("#huntgroundeval_grid").jqGrid('setGridParam', {url:"DhpetGrid.dhpetHuntGroundEvalGrid.do?annualplanId="+$("#annualplanId").val()});
				jQuery("#huntgroundeval_grid").trigger('reloadGrid');	
			}else if(ids=="2"){
				jQuery("#animalcapacity_grid").jqGrid('setGridParam', {url:"DhpetGrid.animalCapacityGrid.do?annualplanId="+$("#annualplanId").val()});
				jQuery("#animalcapacity_grid").trigger('reloadGrid');	
			}else if(ids=="3"){
				jQuery("#huntedanimal_grid").jqGrid('setGridParam', {url:"DhpetGrid.huntedAnimal.do?annualplanId="+$("#annualplanId").val()});
				jQuery("#huntedanimal_grid").trigger('reloadGrid');	
			}
		}
	    return false;
	};
	$(document).ready(function() {
		//http://jsfiddle.net/mmfansler/2eTSL/
		
		$("#generator").click(function(){
			var link="\\frm\\dhpet\\activities\\impl_plan_hunting.rptdesign";
			if($("#annualplanId").val()){
			var parameters='p_user=Testt&annu_plan_id='+$("#annualplanId").val();
			var	url="BirtReportGen.do?genQrCode=true&jsonObj="+createJsonForParams(parameters)+"&report_path="+link+"&doc_name=Aktivitetet_ne_vendgjueti&doc_format=pdf";
			//generateBIRTDoc(url);
			parameters=parameters+"&report_path="+link+"&doc_name="+doc_name+"&doc_format="+doc_format;
			downloadDoc("BirtReportGen.do", parameters);
			}else{
				alert('Ju lutem selektoni planin vjetor!!');
			}
		});
	
		$("#label-annualplan-title").show();
		$("#label-annualplan-status").show();
		$("#annualplan-title").html($("#aptitle").val());
		$("#annualplan-status").html($("#status").val());
		var activeTab="0";
		$("#annualplanName").select2({
	        placeholder: "<s:text name="frm.dhpet.activities.search.for.repository"/>",
	        minimumInputLength: 0,
	        ajax: {
		        url: "Input.dhpetAnnualPlan.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12, 
		        	name_startsWith: term,
		        };
		        },
		        results: function (data, page) {
		        return { results: data };
		        },
		        cache: true
	        },
	        initSelection: function(element, callback) {
	        },
	        dropdownAutoWidth: false,
	        formatResult: formatResult,
	        formatSelection: function(item) {
		    	$("#annualplanId").val(item.id);
		    	$("#animal\\.dhpetAnnualPlan\\.id").val(item.id);
		    	$("#hunt\\.dhpetAnnualPlan\\.id").val(item.id);
		    	$("#annualplanName").val(item.name);
		    	reloadTab(activeTab);
	            return item.name;
	        },
	        allowClear: true,
	        dropdownCssClass: "bigdrop",
	        escapeMarkup: function (m) { return m; }
	    }); 


	});	
	
</script>

</div>
</body>
</html>
