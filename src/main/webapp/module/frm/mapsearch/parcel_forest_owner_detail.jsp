<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>
<html>
<head>

</head>
<body>    		    
<div id="container">
<br/>

<!-- widget grid -->
<section id="widget-grid" class="">
	<div  class="smart-form">
	<!-- row -->
	<div class="row">
	
	<section class="col col-4">
		<label class="input">X:
		   <input id="cordx" name="cordx" value="<s:property value='cordx'/>" type="text">
		</label>
	</section>
	<section class="col col-4">
		<label class="input">Y:
		   <input id="cordy" name="cordy" value="<s:property value='cordy'/>" type="text">
		</label>
	</section>
	<section class="col col-4">
		<label class="input">Lloji i projeksionit:
		 <select id="pointProjection">
			  <option value="900916">KosovaRef: 900916</option>
		      <option value="4326"> Gjeografike: 4326</option>
	    </select>
	    </label>
	</section>
	</div>
	<div class="row">
	<section class="col col-10">
		<label class="input">
		 	<button id="detailBtn1" type="button" class="btn btn-primary btn-lg btn-block" style=" height: 32px; margin-top: 15px;padding-top: 5px;padding-bottom: 5px;">
					<s:text name='frm.private.request.detail.btn'/>
			</button>
		</label>
	</section>
	</div>
	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<!-- START widget-employee-form -->
			<!-- data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" -->
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-fire-grid-" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
		
				<table id="user" class="table table-bordered table-striped" style="clear: both">
							<tbody>
								<tr>
									<td style="width:65%;"><s:text name='frm.private.request.cadastral.zone'/> No.</td>
									<td style="width:35%" ><a  id="cadzone" data-type="text" data-pk="1" data-original-title=""></a></td>								
								</tr>
								<tr>
									<td><s:text name='frm.private.request.cadastral.zone'/></td>
									<td><a  id="cad_zona_name_a" data-type="text" data-pk="1" data-original-title=""><div id="cad_zona_name"></div></a></td>								
								</tr>
								<tr>
									<td><s:text name='frm.private.request.parcel.no'/></td>
									<td><a  id="parcelNum" data-type="text" data-pk="1" data-original-title=""><div id="parcelnr"></div></a></td>								
								</tr>
								<tr>
									<td><s:text name='frm.private.request.subparcel.no'/></td>
									<td><a  id="subparcelNum" data-type="text" data-pk="1" data-original-title=""><div id="subparcelnr"></div></a></td>								
								</tr>
								<tr>
									<td><s:text name='frm.private.request.place.name'/></td>
									<td><a  id="placename" data-type="text" data-pk="1" data-original-title=""></a></td>								
								</tr>
								<tr>
									<td><s:text name='frm.private.request.parcel.detail.culture'/></td>
									<td><a  id="culturename" data-type="text" data-pk="1" data-original-title=""></a></td>								
								</tr>
								<tr>
									<td><s:text name='dhpet.animal.capacity.label.area'/> (m2)</td>
									<td><a  id="area" data-type="text" data-pk="1" data-original-title=""></a></td>								
								</tr>
								<tr>
									<td><s:text name='frm.private.request.parcel.detail.class'/></td>
									<td><a  id="clas" data-type="text" data-pk="1" data-original-title=""> </a></td>								
								</tr>
								<tr>
									<td><s:text name='frm.map.search.persStat'/></td>
									<td><a  id="pers_stat" data-type="text" data-pk="1" data-original-title=""> </a></td>								
								</tr>
								<tr>
									<td><s:text name='frm.map.search.partsn'/></td>
									<td><a  id="partsnview" data-type="text" data-pk="1" data-original-title=""> </a></td>								
								</tr>
							</tbody>
						</table>
			</div>
			<!-- END widget-employee-form -->
		
		</article>
		<!-- END NEW WIDGET -->
	
	</div>
	<!-- end row -->
</section>
<!-- end widget grid -->
	    
<script type="text/javascript">
	// DO NOT REMOVE : GLOBAL FUNCTIONS!
// 	pageSetUp();
	$(document).ready(function () {
// 		$( "p:last" ).html("cad Zone" );

		 $("#detailBtn1").on('click',function(){
			 $.ajax({
					type : "GET", // GET or POST
					url : "FrmGrid.parcelDetails.do?cordx="+$("#cordx").val()+"&cordy="+$("#cordy").val()+"&pointProjection="+$("#pointProjection").val(), // the file to call
					async : false,
					beforeSend:function(jqXHR, settings) {
					},
					error : function(errorThrown, status, jqXHR) { // on error..
			//				alert("error:" + errorThrown + ", status:" + status);
					},
					dataType: "json",
				    data: {
						featureClass: "P",
						style: "full",
					},
					success : function(data, status, jqXHR) { // on success..
						if(!jQuery.isEmptyObject(data)){
							
							for(var i=0;i<data.length;i++){
			//						pvtApr.push([j,data[i].number_of_requests]);
								$("#cadzone").text(data[i].cadzone);
								$("#cad_zona_name").text(data[i].cad_zona_name);
								$("#parcelNum").text(data[i].parcelnr);
								$("#subparcelNum").text(data[i].subparcelnr);
								$("#culturename").text(data[i].culturename);
								$("#clas").text(data[i].clas);
								$("#area").text(data[i].area);
								$("#pers_stat").text(data[i].pers_stat);
								$("#placename").text(data[i].placename);
								$("#partsnview").text(data[i].partsn);
								loadParcelFeature(data[i].cadparcelid)
							} 
						}
						
					},
					
					
					complete:function(jqXHR, textStatus){
					}
				});
		 });
		
});
</script>

</div>
</body>
</html>
