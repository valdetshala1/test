<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<script type="text/javascript"
	src="js/plugin/ajaxwidget/jquery.combo.custom1.0.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="js/plugin/ajaxwidget/ui.combobox-custom.css">

<!-- widget div-->
<div>

	<!-- widget edit box -->
	<div class="jarviswidget-editbox">
		<!-- This area used as dropdown edit box -->

	</div>
	<!-- end widget edit box -->

	<!-- widget content -->
	<div class="widget-body">
		<form id="wildanimal_form" class="form-horizontal" action="WildAnimalSave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="dhpet.wild.animal.legend.data"/></legend>
				<input id="dhpetWildAnimals.id" name="dhpetWildAnimals.id" value="<s:property value='dhpetWildAnimals.id'/>" type="hidden">
				<input id="dhpetWildAnimals.employee.id" name="dhpetWildAnimals.employee.id" value="<s:property value='dhpetWildAnimals.employee.id'/>" type="hidden">
				<input id="dhpetWildAnimals.createdDate" name="dhpetWildAnimals.createdDate" value="<s:property value='dhpetWildAnimals.createdDate'/>" type="hidden">
				
				<!-- START dhpetWildAnimals.nameAl -->
				<s:if test="fieldErrors.get('dhpetWildAnimals.nameAl')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.al"/></label>
						<div class="col-md-10">  
							<input maxlength="50" id="dhpetWildAnimals.nameAl" name="dhpetWildAnimals.nameAl" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.al"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetWildAnimals.nameAl')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.al"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="dhpetWildAnimals.nameAl" name="dhpetWildAnimals.nameAl" value="<s:property value='dhpetWildAnimals.nameAl'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.al"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END dhpetWildAnimals.nameAl -->
				<!-- START dhpetWildAnimals.nameEn -->
				<s:if test="fieldErrors.get('dhpetWildAnimals.nameEn')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.en"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="dhpetWildAnimals.nameEn" name="dhpetWildAnimals.nameEn" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.en"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetWildAnimals.nameEn')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.en"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="dhpetWildAnimals.nameEn" name="dhpetWildAnimals.nameEn" value="<s:property value='dhpetWildAnimals.nameEn'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.en"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END dhpetWildAnimals.nameEn -->
				
				<!-- START dhpetWildAnimals.nameSr -->
				<s:if test="fieldErrors.get('dhpetWildAnimals.nameSr')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.sr"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="dhpetWildAnimals.nameSr" name="dhpetWildAnimals.nameSr" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.sr"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetWildAnimals.nameSr')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="dhpet.wild.animal.label.name.sr"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="dhpetWildAnimals.nameSr" name="dhpetWildAnimals.nameSr" value="<s:property value='dhpetWildAnimals.nameSr'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.sr"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END dhpetWildAnimals.nameSr -->
				<!-- START dhpetWildAnimals.nameLa -->
				<s:if test="fieldErrors.get('dhpetWildAnimals.nameLa')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="dhpet.wild.animal.label.name.la"/></label>
						<div class="col-md-10">
							<input  maxlength="50" id="dhpetWildAnimals.nameLa" name="dhpetWildAnimals.nameLa" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.la"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetWildAnimals.nameLa')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dhpet.wild.animal.label.name.la"/></label>
						<div class="col-md-10">
							<input maxlength="50" id="dhpetWildAnimals.nameLa" name="dhpetWildAnimals.nameLa" value="<s:property value='dhpetWildAnimals.nameLa'/>" class="form-control" placeholder="<s:text name="dhpet.wild.animal.label.name.la"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END dhpetWildAnimals.nameLa -->
			</fieldset>
			<fieldset>
				<legend><s:text name="dhpet.wild.animal.hunt.seasone"/></legend>
				<div class="form-group ">
					<!-- START dhpetWildAnimals.huntSeasoneStart -->
					<s:if test="fieldErrors.get('dhpetWildAnimals.huntSeasoneStart')!=null">
						<div class="has-error">
							<label class="col-sm-2 control-label"><s:text name='dhpet.wild.animal.hunt.seasone.date.start'/></label>
							<div class="col-md-4">
								<input id="dhpetWildAnimals.huntSeasoneStart" name="dhpetWildAnimals.huntSeasoneStart" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetWildAnimals.huntSeasoneStart')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<label class="col-sm-2 control-label"><s:text name='dhpet.wild.animal.hunt.seasone.date.start'/></label>
						<div class="col-md-4">
							<input  id="dhpetWildAnimals.huntSeasoneStart" name="dhpetWildAnimals.huntSeasoneStart" value="<s:property value='dhpetWildAnimals.huntSeasoneStart'/>" class="form-control" type="text">
						</div>									
					</s:else>
					<!-- END dhpetWildAnimals.huntSeasoneStart-->
			
					<!-- START dhpetWildAnimals.huntSeasoneEnd -->
					<s:if test="fieldErrors.get('dhpetWildAnimals.huntSeasoneEnd')!=null">
						<div class=" has-error">
							<label class="col-sm-2 control-label"><s:text name='dhpet.wild.animal.hunt.seasone.date.end'/></label>
							<div class="col-md-4">
								<input id="dhpetWildAnimals.huntSeasoneEnd" name="dhpetWildAnimals.huntSeasoneEnd" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetWildAnimals.huntSeasoneEnd')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<label class="col-sm-2 control-label"><s:text name='dhpet.wild.animal.hunt.seasone.date.end'/></label>
						<div class="col-md-4">
							<input id="dhpetWildAnimals.huntSeasoneEnd" name="dhpetWildAnimals.huntSeasoneEnd" value="<s:property value='dhpetWildAnimals.huntSeasoneEnd'/>" class="form-control" type="text">
						</div>									
					</s:else>
					<!-- END dhpetWildAnimals.huntSeasoneEnd-->
				</div>
			</fieldset>
			<fieldset>
				<legend><s:text name="dhpet.wild.animal.forbideen.seasone"/></legend>
				<div class="form-group ">
					<!-- START dhpetWildAnimals.huntForbiddenSeasoneStart -->
					<s:if test="fieldErrors.get('dhpetWildAnimals.huntForbiddenSeasoneStart')!=null">
						<div class="has-error">
							<label class="col-sm-2 control-label"><s:text name='dhpet.wild.animal.hunt.seasone.date.start'/></label>
							<div class="col-md-4">
								<input id="dhpetWildAnimals.huntForbiddenSeasoneStart" name="dhpetWildAnimals.huntForbiddenSeasoneStart" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetWildAnimals.huntForbiddenSeasoneStart')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<label class="col-sm-2 control-label"><s:text name='dhpet.wild.animal.hunt.seasone.date.start'/></label>
						<div class="col-md-4">
							<input  id="dhpetWildAnimals.huntForbiddenSeasoneStart" name="dhpetWildAnimals.huntForbiddenSeasoneStart" value="<s:property value='dhpetWildAnimals.huntForbiddenSeasoneStart'/>" class="form-control" type="text">
						</div>									
					</s:else>
					<!-- END dhpetWildAnimals.huntForbiddenSeasoneStart -->

					<!-- START dhpetWildAnimals.huntForbiddenSeasoneEnd-->
					<s:if test="fieldErrors.get('dhpetWildAnimals.huntForbiddenSeasoneEnd')!=null">
						<div class=" has-error">
							<label class="col-sm-2 control-label"><s:text name='dhpet.wild.animal.hunt.seasone.date.end'/></label>
							<div class="col-md-4">
								<input id="dhpetWildAnimals.huntForbiddenSeasoneEnd" name="dhpetWildAnimals.huntForbiddenSeasoneEnd" class="form-control" type="text">
								<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('dhpetWildAnimals.huntForbiddenSeasoneEnd')"/> </span>
							</div>					
						</div>
					</s:if>
					<s:else>
						<label class="col-sm-2 control-label"><s:text name='dhpet.wild.animal.hunt.seasone.date.end'/></label>
						<div class="col-md-4">
							<input id="dhpetWildAnimals.huntForbiddenSeasoneEnd" name="dhpetWildAnimals.huntForbiddenSeasoneEnd" value="<s:property value='dhpetWildAnimals.huntForbiddenSeasoneEnd'/>" class="form-control" type="text">
						</div>									
					</s:else>
					<!-- END dhpetWildAnimals.huntForbiddenSeasoneEnd -->
				</div>
				<!-- START dhpetWildAnimals.comments -->
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="dhpet.location.label.comments"/></label>
						<div class="col-md-10">
							<textarea id="dhpetWildAnimals.note" name="dhpetWildAnimals.note"class="form-control" placeholder="<s:text name="dhpet.location.label.comments"/>"><s:property value='dhpetWildAnimals.note'/></textarea> 
						</div>									
					</div>
				<!-- END dhpetWildAnimals.comments -->
		</fieldset>
		<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelWA" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						<button id="saveWA" class="btn btn-primary" type="submit">
							<i class="fa fa-save"></i>
							<s:text name="label.button.save"></s:text>
						</button>
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
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0'});
// 		$('#dhpetWildAnimals\\.huntSeasoneStart').datetimepicker({
// 			lang: '<s:property value="#lang"/>',
// 			format: 'd.m',
// 			mask: false,
// 			formatDate:'d.m',
// 			timepicker: false,
	    			
// 		});
		$('#dhpetWildAnimals\\.huntSeasoneStart').datepicker({
			lang: '<s:property value="#lang"/>',
	        changeMonth: true,
	        showButtonPanel: true,
	        dateFormat: 'dd.mm'
	    });
		$('#dhpetWildAnimals\\.huntSeasoneEnd').datepicker({
			lang: '<s:property value="#lang"/>',
	        changeMonth: true,
	        showButtonPanel: true,
	        dateFormat: 'dd.mm',
			onShow:function( ct ){
				   this.setOptions({
				    minDate: $('#dhpetWildAnimals\\.huntSeasoneStart').val()?$('#dhpetWildAnimals\\.huntSeasoneStart').val():false
				   });
				},	
	    });
		$('#dhpetWildAnimals\\.huntForbiddenSeasoneStart').datepicker({
			lang: '<s:property value="#lang"/>',
	        changeMonth: true,
	        showButtonPanel: true,
	        dateFormat: 'dd.mm'
	    });
		$('#dhpetWildAnimals\\.huntForbiddenSeasoneEnd').datepicker({
			lang: '<s:property value="#lang"/>',
	        changeMonth: true,
	        showButtonPanel: true,
	        dateFormat: 'dd.mm'
	    });
		
		$("#dhpetWildAnimals\\.dhpetLocation\\.habitatLocation").select2({
		    placeholder: "",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.dhpetLocation.do",
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
		    	$("#dhpetWildAnimals\\.dhpetLocation\\.id").val(item.id);
		    	$("#dhpetWildAnimals\\.dhpetLocation\\.habitatLocation").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		});

		if($("#dhpetWildAnimals\\.dhpetLocation\\.id").val()){
			$("#dhpetWildAnimals\\.dhpetLocation\\.habitatLocation").select2("data", {id: "<s:property value='dhpetWildAnimals.dhpetLocation.id'/>", name: "<s:property value="dhpetWildAnimals.dhpetLocation.habitatLocation"/>"});
		}

		$("#cancelWA").on('click', function () {                    
			$.ajax({
				type : "GET",
				url : "WildAnimal.board.do", 
				async : false,
				beforeSend:function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#wildanimal_board_content").html(jqXHR.responseText);
					//alert after cancel action
					$.smallBox({
						title : "Ju keni anuluar ruajtjen e Dokumentit",
						content : "Ky mesazh do te largohet pas 5 sekondave!",
						color : "#C46A69",
						//timeout: 6000,
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete:function(jqXHR, textStatus){
				}
			});			
			return false;        
		});
				
		$("#saveWA").on('click', function () {                    
			$('#wildanimal_form').submit();
			return false;        
		});
		$("#wildanimal_form").submit(function() {
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
					$("#wildanimal_form_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exists");
					if(!errors){
						jQuery("#wildanimal_grid").trigger("reloadGrid");
						$.smallBox({
							title : "Dokumenti eshte ruajtur me sukses",
							content : "Ky mesazh do te largohet pas 5 sekondave!",
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
						$.smallBox({
							title : "Dokumenti nuk mund te ruhet. Ju lutem korrigjoni gabimet! ",
							content : "Ky mesazh do te largohet pas 5 sekondave!",
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}
				},
				complete:function(jqXHR, textStatus){
					//$('#ajaxBusyFarmer').hide();
				}
			});
			return false;
		});
			    	
	});            
</script>