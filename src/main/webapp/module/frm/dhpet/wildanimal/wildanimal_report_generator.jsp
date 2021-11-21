<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget content -->
	<div class="widget-body" id="report_generator_content">
			<div id="report_generator" class="form-horizontal">
			<input id="user" name="user" value="<s:property value="user.person.firstName"/> <s:property value="user.person.lastName"/>" type="hidden">

		<div class="form-group">
							<label class="col-md-2 control-label"></label>
							
								<div id="report_type_buttons" class="col-md-10">
									<label class="radio radio-inline"> 
									</label>
									
									<label id="wilda" class="radio radio-inline"> 
									<input type="radio" class="radiobox" name="reportType" id="wildaReport" value="wildaReport" checked="checked"/>
										<span><s:text name="dhpet.wild.animals.reporttype.name.label"/></span>
									</label>
									
									<label id="rforwilda" class="radio radio-inline"> 
									<input type="radio" class="radiobox" name="reportType" id="rforwildaReport" value="rforwildaReport"/>
										<span><s:text name='dhpet.wild.animals.reporttype.request.name.label'/></span>
									</label>
									
								</div>
			</div>


	<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelR" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="generator" class="btn btn-primary" type="submit">
							<i class="fa fa-print"></i>
							<s:text name='label.button.generate.report'/>
						</button>
					</div>
				</div>
			</div>

  </div>

</div>

<script type="text/javascript">

$(document).ready(function() {
	
	
$("#report_generator input[name='reportType']").click(function(){
    
    if($('input:radio[name=reportType]:checked').val() == "rforwildaReport"){
		  
		  if($("#activityName").val().toUpperCase()=='HARVEST'){
		  	$("#details").show("");
		  }
		
		 
    }
    if($('input:radio[name=reportType]:checked').val() == "wildaReport"){
		   
		  if($("#activityName").val().toUpperCase()=='HARVEST'){
		  	$("#details").show();
		  }

    
    }

});

$("#generator").on('click', function () {

	var radioValue=$("input[name=reportType]:checked").val();

	var b=$("input[name=reportType]:checked").val();
	
	if(radioValue)
	 alert('Keni zgjedhur:'+b);
});


$("#report_generator_content").on('remove', function(){
	$("#annu_report_button").removeClass("ui-state-disabled");

});


$("#cancelR").on('click', function(){
	$("#report_generator_content").dialog("close");
});


});

</script>
</body>
</html>