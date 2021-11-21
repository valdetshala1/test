<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!-- widget div-->
<div id="evaluation_content">

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->
	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="bid_evaluation_form" class="form-horizontal" action="BidEvaluationSave.do" accept-charset="utf8" method="post">
			<div id="evaluation_content">
				<input id="bid.id" name="bid.id" value="<s:property value='bid.id'/>" type="hidden">
				<input id="bid.selected" name="bid.selected" value="<s:property value='bid.selected'/>" type="hidden">
				<input type="hidden" id="bid.prcmtTenderRequest.id" name="bid.prcmtTenderRequest.id" value="<s:property value='bid.prcmtTenderRequest.id' />">
		
				<!-- START bid.comment  -->
				<s:if test="fieldErrors.get('bid.comment')!=null">
					<div class="form-group has-error">
					      <label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>: </label>
					 	  <div class="col-md-10">
					      		<textarea id="bid.note" name="bid.note" class="form-control" placeholder="Default Text Field"></textarea>
					    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('bid.comment')"/> </span>
					      </div>         
				     </div>
				</s:if>
				<s:else>
					 <div class="form-group">
					      <label class="col-md-2 control-label"><s:text name='tender.request.analyse.comment'/>:</label>
					 	  <div class="col-md-10">
					      		<textarea id="bid.note" name="bid.note" class="form-control" placeholder="Default Text Field"><s:property value='bid.note'/></textarea>
					      </div>         
				     </div>
				</s:else>
				<!-- END bid.comment-->	
				<s:if test="fieldErrors.get('selected')!=null">
						<div class="form-group has-error">
						    		<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('selected')"/> </span>
					     </div>
				</s:if>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelEvaluation" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="selected" class="btn btn-primary" type="submit">
							<s:text name="button.selected"/>
						</button>
						<button id="unselected" class="btn btn-danger" type="button">
							<s:text name="button.unselected"/>
						</button>
					</div>
				</div>
			</div>
			
			</div>	
		</form>
	</div>
	<!-- end widget content -->
</div>
<!-- end widget div -->


<script type="text/javascript">
	$(document).ready(function () {
		$("#cancelEvaluation").on('click', function () {                    
			$("#evaluation_content").dialog('close');
			return false;        
		});

		if($("#hidePopupButtons").val()=='true'){
			$("#selected").hide();
			$("#selected").attr('disabled','disabled');
			$("#unselected").hide();
			$("#unselected").attr('disabled','disabled');
		}
			
		$("#selected").on('click', function () {
			$('#bid\\.selected').val("true");
			$('#bid_evaluation_form').submit();
			return false;        
		});

		$("#unselected").on('click', function () { 
			$('#bid\\.selected').val("false");
			$('#bid_evaluation_form').submit();
			return false;        
		});
		
		$("#bid_evaluation_form").submit(function() {
			var this_form = $(this);
			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#evaluation_content").html(jqXHR.responseText);
					
					var errors = jqXHR.getResponseHeader("errors_exist");
					if(!errors){
						$("#rb_sel").prop('checked','true');
						getTenderRequestByStatus("SEL");

						$("#evaluation_content").dialog('close');
						jQuery("#bid_grid").trigger('reloadGrid');
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}
				},
				complete:function(jqXHR, textStatus){
				}
			});
			return false;
		});
	});            
</script>