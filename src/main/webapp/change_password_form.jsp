<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="module/base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en-us">
	<head>
<%-- 	<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script> --%>
		<script type="text/javascript">
	        $(document).ready(function () {
	        	$("#change-pwd-form [name='pwdold']").focus();
	        	var validator = $( "#change-pwd-form" ).validate({
	        		  rules: {
	        			  pwdold: {
	        			      required: 'This is a req field',
	        			      minlength: 6
	        			    },
        			    pwdnew: {
	        			      required: true,
	        			      minlength: 6
	        			    },
	        			pwdnewrepeat: {
	        			      required: true,
	          			      minlength: 6
	        			    }
			        			      
	        			  }
	        			});
    			$("#cancelPwd").on('click', function(){
    				$("#passwordChange").dialog('close');
        		});
	        	
	        	$("#changePwd").on('click',function(){
	        		if($('#change-pwd-form').valid()){
	    				$(":button").prop('disabled','disabled');
	    				$('#change-pwd-form').submit();
	        		}
		        });
	        	(function() {
	    			$('form').ajaxForm({
	    				beforeSerialize: function($form, options) {         
	    				},
	    			    beforeSend: function() {
	    			    	//$('#ajaxBusyB').show();
	    			    },
	    				error : function(response, status, err){
	    					$("#passwordChange").html(response);
	    					alert("error:" + errorThrown + ", status:" + status);
	    				},	    
	    			    success : function(data, status, jqXHR) {
	    					$("#passwordChange").html(jqXHR.responseText);
	    					var errors_exits = jqXHR.getResponseHeader("errors_exits");
	    					if (errors_exits == "true") {
	    						$.smallBox({
	    							title : '<s:text name="small.box.on.save.title.failed"/>',
	    							content : '<s:text name="small.box.content"/>',
	    							color : "#C79121",
	    							timeout: 5000,
	    							icon : "fa fa-shield fadeInLeft animated",
	    							number : "2"
	    						});
	    					} else {
	    						$("#passwordChange").dialog('close');
	    						$.smallBox({
	    							title : '<s:text name="small.box.on.save.title.success"/>',
	    							content : '<s:text name="small.box.content"/>',
	    							color : "#739E73",
	    							timeout: 5000,
	    							icon : "fa fa-check",
	    							number : "1"
	    						});
	    					}	    	
	    			    },	    
	    				complete: function(xhr) {
	    					//$('#ajaxBusyB').hide();
	    				}
	    			});
	    			$(":button").prop('disabled',false);				
	    		})();
	        });
		</script>
</head>
<!-- widget div-->
<body>
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
<!-- 	<div class="col-xs-12 col-sm-12 col-md-5 col-lg-4"> -->
<!-- 						<div class="well no-padding"> -->
							<form action="PwdChange.do" id="change-pwd-form" class="smart-form client-form" method="post">
								<input type="hidden" name="language" value="<s:property value="language"/>"> 							
									<fieldset>
										<section>
											<s:if test="fieldErrors.get('pwdold') != null">
											<label class="label state-error"><s:text name="login.form.old.password" /></label>
											<label class="input state-error"> <i class="icon-append fa fa-lock"></i>
												<input type="password"  name="pwdold" id="pwdold" placeholder="<s:text name="login.tooltip.old.password" />">
												<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('pwdold')"/> </span>
											</label>
											</s:if>
											<s:else>
											<label class="label"><s:text name="login.form.old.password" /></label>
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdold" id="pwdold" value='<s:property value="pwdold"/>'>
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i>&nbsp;<s:text name="login.tooltip.old.password" /></b></label>
											</s:else>
										</section>
										<section>
											<s:if test="fieldErrors.get('pwdnew') != null">
											<label class="label state-error"><s:text name="login.form.new.password" /></label>
											<label class="input state-error"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdnew" id="pwdnew" placeholder="<s:text name="login.tooltip.new.password" />">
												<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('pwdnew')"/> </span>
											</label>
											</s:if>
											<s:else>
											<label class="label"><s:text name="login.form.new.password" /></label>
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdnew" id="pwdnew" value='<s:property value="pwdnew"/>'>
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i><s:text name="login.tooltip.new.password" /></b> </label>
											</s:else>											
										</section>
										<section>
											<s:if test="fieldErrors.get('pwdnewrepeat') != null">
											<label class="label state-error"><s:text name="login.form.retype.new.password" /></label>
											<label class="input state-error"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdnewrepeat" id="pwdnewrepeat" placeholder="<s:text name="login.tooltip.retype.new.password" />">
												<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('pwdnewrepeat')"/> </span>
											</label>
											</s:if>
											<s:else>
											<label class="label"><s:text name="login.form.retype.new.password" /></label>
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="pwdnewrepeat" id="pwdnewrepeat" value='<s:property value="pwdnewrepeat"/>'>
												<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i><s:text name="login.tooltip.retype.new.password" /></b> </label>
											</s:else>		
										</section>
										
									</fieldset>
									
									<footer>
										<button type="submit" id="changePwd" class="btn btn-primary">
											<s:text name="login.form.button.save.sign" />
										</button>
										<button type="button" id="cancelPwd" class="btn btn-default">
											<s:text name="label.button.cancel" />
										</button>
									</footer>
										
		
							</form>

<!-- 						</div> -->
						
<!-- 					</div> -->
	<!-- end widget content -->
</div>
<!-- end widget div -->


</body>
</html>
