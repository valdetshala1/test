<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../../base/nocache.jsp"%>

<!-- widget div-->
<div>
	<!-- widget content -->
	<div  id="seed_inventory_content">
		<form id="seed_inventory_form" class="form-horizontal" action="SeedInventorySave.do" accept-charset="utf8" method="post">
			<fieldset>
				<legend><s:text name="seed.inv"/></legend>
				<input id="seedlingInventory.id" name="seedlingInventory.id" value="<s:property value='seedlingInventory.id'/>" type="hidden">
				<input id="seedActivity.id" name="seedActivity.id" value="<s:property value='seedActivity.id'/>" type="hidden">
				<input id="seedlingInventory.seedActivity.id" name="seedlingInventory.seedActivity.id" value="<s:property value='seedlingInventory.seedActivity.id'/>" type="hidden">
				<input id="seedFromFrIns" name="seedFromFrIns" value="<s:property value='seedFromFrIns'/>" type="hidden">
				<input id="seedFromAnother" name="seedFromAnother" value="<s:property value='seedFromAnother'/>" type="hidden">
				<input id="seedlingInventory.personByChangedBy.id" name="seedlingInventory.personByChangedBy.id" value="<s:property value='seedlingInventory.personByChangedBy.id'/>" type="hidden">
				<input id="seedlingInventory.personByCreatedBy.id" name="seedlingInventory.personByCreatedBy.id" value="<s:property value='seedlingInventory.personByCreatedBy.id'/>" type="hidden">
				<input id="seedlingInventory.createdDate" name="seedlingInventory.createdDate" value="<s:property value='seedlingInventory.createdDate'/>" type="hidden">
				<input id="seedlingInventory.changedDate" name="seedlingInventory.changedDate" value="<s:property value='seedlingInventory.changedDate'/>" type="hidden">
				
				<input id="language" value="<s:property value='locale.language'/>" type="hidden">
				<s:if test="fieldErrors.get('seedlingInventory.form')!=null">
					<div class="form-group has-error">
					<label class="col-md-2 control-label"></label>
						<div class="col-md-10">
							<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="checkForm" id="fromFrIns" value="fromFrIns"/>
									<span><span class='fa fa-building'></span> <s:text name="forest.institute.menu"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="checkForm" id="fromAnother" value="fromAnother"/>
									<span><span class='fa fa-building'></span> <s:text name="seed.inv.another"/></span>
								</label>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedlingInventory.form')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
					<label class="col-md-2 control-label"></label>
							<div class="col-md-10">
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="checkForm" id="fromFrIns" value="fromFrIns"/>
									<span><span class='fa fa-building'></span> <s:text name="forest.institute.menu"/></span>
								</label>
								<label class="radio radio-inline"> <input type="radio"
									class="radiobox" name="checkForm" id="fromAnother" value="fromAnother"/>
									<span><span class='fa fa-asterisk'></span> <s:text name="seed.inv.another"/></span>
								</label>
							</div>
					</div>
				</s:else>

				<div class="form-group" id="seed_activity_div">
						<label class="col-md-2 control-label">*<s:text name="seed.inv.seed.activity"/></label>
						<div class="col-md-10">
								<jsp:include page="seed_activity_inv_grid.jsp"></jsp:include>
						</div>									
				</div>
				
				<div id="seed_actv_field">
				<!-- START seedActivity.treeSpecies -->
				<s:if test="fieldErrors.get('seedlingInventory.treeSpecies')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.tree.species"/></label>
						<div class="col-md-10">
							<input id="seedlingInventory.treeSpecies.name" name="seedlingInventory.treeSpecies.name" class="form-control" placeholder="<s:text name="annu.seedling.label.tree.species"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedlingInventory.treeSpecies')"/> </span>
							<input id="seedlingInventory.treeSpecies.id" name="seedlingInventory.treeSpecies.id" value="<s:property value='seedlingInventory.treeSpecies.id'/>" type="hidden">
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.tree.species"/></label>
						<div class="col-md-10">
							<input id="seedlingInventory.treeSpecies.name" name="seedlingInventory.treeSpecies.name" value="<s:property value='seedlingInventory.treeSpecies.name'/>" class="form-control" placeholder="<s:text name="annu.seedling.label.tree.species"/>" type="text">
							<input id="seedlingInventory.treeSpecies.id" name="seedlingInventory.treeSpecies.id" value="<s:property value='seedlingInventory.treeSpecies.id'/>" type="hidden">
						</div>									
					</div>
				</s:else>
			<!-- END seedlingInventory.treeSpecies -->
			<!-- START seedlingInventory.prodType -->
				<s:if test="fieldErrors.get('seedlingInventory.prodType')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.prod.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="seedlingInventory.prodType"
								name="seedlingInventory.prodType">
								<s:iterator value="prodTypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedlingInventory.prodType')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="annu.seedling.label.prod.type"/></label>
						<div class="col-md-10">
							<select class="form-control" id="seedlingInventory.prodType"
								name="seedlingInventory.prodType">
								<s:iterator value="prodTypeList" var="la">
									<option value="<s:property value="#la.getDOMVALUE()" />">
										<s:if test="%{locale.language=='al'}">
											<s:property value="#la.getDOMTEXT()" />
										</s:if>
										<s:elseif test="%{locale.language=='sr'}">
											<s:property value="#la.getDOMTEXT_SR()" />
										</s:elseif>
										<s:else>
											<s:property value="#la.getDOMTEXT_EN()" />
										</s:else>
									</option>
								</s:iterator>
							</select>
						</div>									
					</div>
				</s:else>
				<!-- END seedlingInventory.prodType -->
				
				<!-- START seedActivity.age -->
				<s:if test="fieldErrors.get('seedlingInventory.age')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="report.forest.fire.label.age"/></label>
						<div class="col-md-10">
							<input readonly id="seedlingInventory.age" name="seedlingInventory.age" class="form-control" placeholder="<s:text name="report.forest.fire.label.age"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedActivity.age')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="report.forest.fire.label.age"/></label>
						<div class="col-md-10">
							<input readonly id="seedlingInventory.age" name="seedlingInventory.age" value="<s:property value='seedlingInventory.age'/>" class="form-control" placeholder="<s:text name="report.forest.fire.label.age"/>" type="text">
						</div>									
					</div>
				</s:else>
			<!-- END seedActivity.age -->
			<!-- START seedlingInventory.seedYear -->
				<s:if test="fieldErrors.get('seedlingInventory.seedYear')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="annu.felling.label.year"/></label>
						<div class="col-md-10">
							<input id="seedlingInventory.seedYear" name="seedlingInventory.seedYear" class="form-control" placeholder="<s:text name="annu.felling.label.year"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedlingInventory.seedYear')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="annu.felling.label.year"/></label>
						<div class="col-md-10">
							<input id="seedlingInventory.seedYear" name="seedlingInventory.seedYear" value="<s:property value='seedlingInventory.seedYear'/>" class="form-control" placeholder="<s:text name="annu.felling.label.year"/>" type="text">
						</div>									
					</div>
				</s:else>
			<!-- END seedlingInventory.seedYear -->			
			</div>
			
			<div id="stock_price">
				<!-- START seedlingInventory.stock -->
				<s:if test="fieldErrors.get('seedlingInventory.stock')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label">*<s:text name="seed.inv.stock"/></label>
						<div class="col-md-10">
							<input data="numberLong" id="seedlingInventory.stock" name="seedlingInventory.stock" class="form-control" placeholder="<s:text name="seed.inv.stock"/>" type="text">
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedlingInventory.stock')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label">*<s:text name="seed.inv.stock"/>:</label>
						<div class="col-md-10">
							<input data="numberLong" id="seedlingInventory.stock" name="seedlingInventory.stock" value="<s:property value='seedlingInventory.stock'/>" class="form-control" placeholder="<s:text name="seed.inv.stock"/>" type="text">
						</div>									
					</div>
				</s:else>
				<!-- END seedlingInventory.stock -->
				<!-- START seedlingInventory.price -->
				<s:if test="fieldErrors.get('seedlingInventory.price')!=null">
					<div class="form-group has-error">
						<label class="col-md-2 control-label"><s:text name="seed.inv.price"/>:</label>
						<div class="col-md-10">
							<input type='text' data="number" id="seedlingInventory.price" name="seedlingInventory.price "   class="form-control" placeholder="<s:text name="seed.inv.price"/>" > 
							<span class="help-block"><i class="fa fa-warning"></i> <s:property value="fieldErrors.get('seedlingInventory.price')"/> </span>
						</div>					
					</div>
				</s:if>
				<s:else>
					<div class="form-group">
						<label class="col-md-2 control-label"><s:text name="seed.inv.price"/>:</label>
						<div class="col-md-10">
		                    <input type='text' data="number" id="seedlingInventory.price" name="seedlingInventory.price" value="<s:property value='seedlingInventory.price'/>"  class="form-control" placeholder="<s:text name="seed.inv.price"/>" />
						</div>									
					</div>
				</s:else>
				<!-- END seedlingInventory.price -->
				</div>
			</fieldset>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-12">
						<button id="cancelSeedInv" class="btn btn-default" type="button">
							<s:text name="label.button.cancel"></s:text>
						</button>
						
						<button id="saveSeedInv" class="btn btn-primary" type="submit">
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
	$(document).ready(function() {
		if($("#seedlingInventory\\.id").val()){
			var hasRight='<s:property value="hasRightToEdit()"/>';
			if(hasRight=="false"){
				$("#saveSeedInv").hide();
				$(":submit").prop('disabled','disabled');
			}
		}
		$("#seedlingInventory\\.seedYear").mask("9999");
		$("input[data='number']").autoNumeric('init', {aDec: '.', aSep: ',', vMax:"99999999.99",mDec: '2'});
		$("input[data='numberLong']").autoNumeric('init', {aDec: '.', aSep: ',', mDec: '0',vMax:"999999999"});
		$("#stock_price").hide();
		$("#seed_actv_field").hide();
	 	$("#seed_activity_div").hide();
		
		if($("#seedFromFrIns").val()=='true'){
			$("#fromFrIns").attr('checked', 'checked');
			 	$("#seed_actv_field").hide();
		     	$("#seed_activity_div").show();
		     	$("#stock_price").hide();
		     	$("#seedFromAnother").val('false');
		     	$("#seedFromFrIns").val('true');
		     	if($("#seedlingInventory\\.id").val()){
		     		$("#seed_activity_div").hide();
		     		$("#stock_price").show();
		     		$("#seed_actv_field").show();
		     		$("#seedlingInventory\\.treeSpecies\\.name").attr('readonly',true);
		     		$("#seedlingInventory\\.prodType").attr('disabled','disabled');
		     		$("#seedlingInventory\\.age").attr('readonly',true);
		     		$("#fromAnother").attr('disabled','disabled');
			     	}
			
			}else if($("#seedFromAnother").val()=='true'){
				$("#fromAnother").attr('checked', 'checked');
				$("#seed_actv_field").show();
		    	$("#seed_activity_div").hide();
		    	$("#stock_price").show();
		    	$("#seedFromAnother").val('true');
		    	$("#seedFromFrIns").val('false');
		    	if($("#seedlingInventory\\.id").val()){
		    			$("#fromFrIns").attr('disabled','disabled');
			    	}
		    	
				}
		$("#seed_inventory_form input[name='checkForm']").click(function(){
		    if($('input:radio[name=checkForm]:checked').val() == "fromFrIns"){
			    $("#seed_actv_field").hide();
		     	$("#seed_activity_div").show();
		     	$("#stock_price").hide();
		     	$("#seedFromAnother").val('false');
		     	$("#seedFromFrIns").val('true');
		    }
		    if($('input:radio[name=checkForm]:checked').val() == "fromAnother"){
		    	$("#seed_actv_field").show();
		    	$("#seed_activity_div").hide();
		    	$("#stock_price").show();
		    	$("#seedFromAnother").val('true');
		    	$("#seedFromFrIns").val('false');
		    	
		    }
		});
		$('#seedlingInventory\\.prodType').val('<s:property value="seedlingInventory.prodType.DOMVALUE"/>');
		$("#seedlingInventory\\.treeSpecies\\.name").select2({
		    placeholder: "",
		    minimumInputLength: 0,
		    ajax: {
		        url: "Input.treeSpecies.do",
		        dataType: 'json',
		        quietMillis: 250,
		        data: function (term, page) {
		        if(term == "") term = " ";   
		        return {
		        	featureClass: "P",
					style: "full",
					maxRows: 12,            
		        	orgtype: "D",
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
		    	$("#seedlingInventory\\.treeSpecies\\.id").val(item.id);
		    	$("#seedlingInventory\\.treeSpecies\\.name").val(item.name);
		        return item.name;
		    },
		    allowClear: true,
		    escapeMarkup: function (m) { return m; }
		}); 

		if($("#language").val()=='en'){
			$("#seedlingInventory\\.treeSpecies\\.name").select2("data", {id: "<s:property value='seedlingInventory.treeSpecies.id'/>", name: "<s:property value="seedlingInventory.treeSpecies.nameEn"/>"});		
		}else if($("#language").val()=='al'){
			$("#seedlingInventory\\.treeSpecies\\.name").select2("data", {id: "<s:property value='seedlingInventory.treeSpecies.id'/>", name: "<s:property value="seedlingInventory.treeSpecies.nameAl"/>"});		
		}else if($("#language").val()=='sr'){
			$("#seedlingInventory\\.treeSpecies\\.name").select2("data", {id: "<s:property value='seedlingInventory.treeSpecies.id'/>", name: "<s:property value="seedlingInventory.treeSpecies.nameSr"/>"});		
		}

		
		$("#cancelSeedInv").on('click', function() {
			$.ajax({
				type : "GET",
				url : "SeedInventory.form.do?seedActivityId="+$("#seedActId").val(),
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#seed_inventory_content").html(jqXHR.responseText);
					$.smallBox({
						title : '<s:text name="small.box.on.cancel.title"/>',
						content : '<s:text name="small.box.content"/>',
						color : "#C46A69",
						//timeout: 6000,
						icon : "fa fa-warning shake animated",
						number : "3",
						timeout : 5000
					});
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});
	

		$("#saveSeedInv").on('click', function() {
			$(':button').prop('disabled','disabled');
			$("#seedlingInventory\\.prodType").attr('disabled',false);
			$('#seed_inventory_form').submit();
			return false;
		});
		$("#seed_inventory_form").submit(function() {
			var this_form = $(this);

			$.ajax({
				data : this_form.serialize(), // get the form data
				type : this_form.attr('method'), // GET or POST
				url : this_form.attr('action'), // the file to call
				async : false,
				beforeSend : function(jqXHR, settings) {
				},
				error : function(errorThrown, status, jqXHR) { // on error..
					alert("error:" + errorThrown + ", status:" + status);
				},
				success : function(data, status, jqXHR) { // on success..
					$("#seed_inventory_content").html(jqXHR.responseText);
					var errors = jqXHR.getResponseHeader("errors_exits");
					if(!errors){
						jQuery("#seed_inventory_grid").trigger("reloadGrid");
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.success"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#739E73",
							timeout: 5000,
							icon : "fa fa-check",
							number : "1"
						});									
					}else{
// 						if(){
// 							$("#stock_price").show();

// 							}
							
						$.smallBox({
							title : '<s:text name="small.box.on.save.title.failed"/>',
							content : '<s:text name="small.box.content"/>',
							color : "#C79121",
							timeout: 5000,
							icon : "fa fa-shield fadeInLeft animated",
							number : "2"
						});
					}
					$(':button').prop('disabled',false);
				},
				complete : function(jqXHR, textStatus) {
				}
			});
			return false;
		});

	});

	
</script>