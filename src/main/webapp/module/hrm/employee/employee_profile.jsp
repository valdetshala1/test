<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<!-- 	<br> -->
<!-- widget div-->
<div class="widget-body">
<div class="well">

		<input type="hidden" id="employeeId" name="employeeId" value="<s:property value="employee.id"/>"/>
							<div class="row">
							<!-- start Employee Profile -->
								<div class="col-sm-12">

									<div class="row">
										<br>
										<div class="col-sm-3 profile-pic">
											<img src="data:image/jpeg;base64,<s:property value='photo'/>" border="0" width="100" height="100"/>
											
											
										</div>
										<br/>
										<div class="col-sm-6">
											<h1><s:property value='employee.firstName'/> <span class="semi-bold"><s:property value='employee.lastName'/></span>
											<br>
												<small> 
													<s:if test="%{locale.language=='al'}">
														<s:property value="employee.jobTitle.getDOMTEXT()"/>
													</s:if>
													<s:elseif test="%{locale.language=='sr'}">
														<s:property value="employee.jobTitle.getDOMTEXT_SR()"/>
													</s:elseif>
													<s:else>
														<s:property value="employee.jobTitle.getDOMTEXT_EN()"/>
													</s:else>
												</small>
											 </h1>
													<br/><br/>
													
										</div>
										<div class="padding-10">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<h4><small><s:text name="label.person.birthdate"/></small></h4>
														</td>
														<td>
															<p class="text-muted">
																<span class="txt-color-darken"><s:property value='employee.birthdate'/></span>
															</p>
														</td>
													</tr>
													<tr>
														<td>
															<h4><small><s:text name="hum.employee.label.personal.id"/></small></h4>
														</td>
														<td>
															<p class="text-muted">
																<span class="txt-color-darken"><s:property value='employee.personalId'/> </span>
															</p>
														</td>														
													</tr>
													<tr>
														<td>
															<h4><small><s:text name="hum.employee.label.organisation"/></small></h4>
														</td>
														<td>
															<p class="text-muted">
																<span class="txt-color-darken"><s:property value='employee.organisation.orgaName'/> </span>
															</p>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

								</div>
							<!-- end Employee Profile -->
							</div>
							<!-- start row -->
							<div class="row">

								<div class="col-sm-12">

									<hr>

									<div class="padding-10">

										<ul class="nav nav-tabs tabs-pull-left">
											<li class="active">
												<a href="Employee.language.do?employeeId=<s:property value='employee.id'/>" role="tab" data-target="#languageTab" data-toggle="boardajax"><s:text name="hum.employee.label.languages"/></a>
											</li>
											<li >
												<a href="Employee.education.do?employeeId=<s:property value='employee.id'/>" role="tab" data-target="#educationTab" data-toggle="boardajax"><s:text name="hum.employee.label.educations"/></a>
											</li>
											<li>
												<a href="Employee.training.do?employeeId=<s:property value='employee.id'/>" role="tab" data-target="#trainingTab" data-toggle="boardajax"><s:text name="hum.employee.label.trainings"/></a>
											</li>
											<li>
												<a href="Employee.certification.do?employeeId=<s:property value='employee.id'/>" role="tab" data-target="#certificationTab" data-toggle="boardajax"><s:text name="hum.employee.label.certifications"/></a>
											</li>
											<li>
												<a href="Employee.document.do?employeeId=<s:property value='employee.id'/>" role="tab" data-target="#documentsTab" data-toggle="boardajax"><s:text name="hum.employee.label.documents"/></a>
											</li>
											<li>
												<a href="Employee.soscontact.do?employeeId=<s:property value='employee.id'/>" role="tab" data-target="#sosTab" data-toggle="boardajax"><s:text name="hum.employee.sos.contact"/></a>
											</li>
											<li>
												<a href="Employee.decisions.do?employeeId=<s:property value='employee.id'/>" role="tab" data-target="#decisionsTab" data-toggle="boardajax"><s:text name="adm.humman.resource.decision.menu"/></a>
											</li>
										</ul>
										<!-- start tabs-->
										<div class="tab-content padding-top-10">
										<!-- start language tab -->
											<div class="tab-pane fade in active" id="languageTab">
												<div id="employee_language_grid_content">
													<jsp:include page="employee_language_grid.jsp"></jsp:include>
												</div>
												
											</div>
									<!-- end language tab -->
									<!-- start education tab -->
									<div class="tab-pane fade" id="educationTab">
										
									</div>
									<!-- end education tab -->
									<!-- start training tab -->
									<div class="tab-pane fade" id="trainingTab">
				
									</div>
									<!-- end training tab -->
									<!-- start certification tab -->
									<div class="tab-pane fade" id="certificationTab">
											
									</div>
										
									<!-- end certification tab -->							
									<!-- start documents tab -->
									<div class="tab-pane fade" id="documentsTab">
												
									</div>
									<!-- end documents tab -->
									<!-- start sos tab -->
									<div class="tab-pane fade" id="sosTab">
											
									</div>
									<!-- end sos tab -->
									<!-- start decisionsTab -->
									<div class="tab-pane fade" id="decisionsTab">
<!-- 											<div id="employee_decisions_grid_content"> -->
<%-- 												<jsp:include page="employee_decisions_grid.jsp"></jsp:include> --%>
<!-- 											</div> -->
									</div>
									<!-- end decisionsTab -->
									</div>
								</div>
								<div class="form-actions">
							</div>
						</div>
								<!-- end row -->
		</div>
		</div>
	<!-- end widget div -->						
							

<script type="text/javascript">
function generateAttachment(obj){
	var url = "EmployeeSkillAttachment.do?attachmentId="+obj.value;
	window.open(url,"_blank"); 
}	
	$(document).ready(function () {
		$('[data-toggle="boardajax"]').click(function(e) {
		    var $this = $(this),
		        loadurl = $this.attr('href'),
		        targ = $this.attr('data-target'),
		        grid = $this.attr('grid');

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
	$('button').tooltip();
            
</script>
