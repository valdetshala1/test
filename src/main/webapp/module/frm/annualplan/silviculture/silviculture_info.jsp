<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache_session.jsp"%>

<html>
<head>
<style>
.headInfo{
	font-size: 13px; 
	font-weight: bold; 
	color: white;
	background-color: #416859
}
.bodyInfo{
	font-size: 10px; 
	font-weight: bold; 
	background-color: #b2c8bf
}
.buttonInfo{
	background-color: #273C34;
	width:100%;
	color: #ffffff;
	box-shadow: 3px 1px 1px #888888
}
.buttonInfoDiv{
	margin-right: 25%;
	margin-left: 25%;
}
</style>
</head>
<body>    		    
<div id="container">
	<div class="widget-body">
			<h3><s:text name="annual.plan.un.submited.activities.Silviculture"/> Info</h3>
			<s:if test="slvAct!= null">
			<table border="1" cellpadding="0" > 
				<tr>
					<td style="font-size: 10px;" colspan="4"><div class="infocontent10">
						<table border="1" width="400px">
							<th class="headInfo">
								<div class="infocontent10">
								<s:text name="frm.stand.compartment"/>	/  <s:text name="frm.stand.stand"/>: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<b><s:property value="slvAct[0].stand.compartment.compNr"/> / <s:property value="slvAct[0].stand.standNr"/></b>
								</div>
							</th>
						</table>
						</div>
					</td>
				</tr>
				<tr>
					<table border="1" cellpadding="0" > 
						<tr>
							<td style="font-size: 10px;" colspan="4">
								<div class="infocontent10">
										<table border="1" width="400px">
												<tr> 
													<th class="bodyInfo" style="width: 94px;"><div class="infocontent10b"><s:text name="frm.stand.treatment.name.label"></s:text></div></th>
													<th class="bodyInfo"><div class="infocontent10b"><s:text name="frm.silviculture.plan.area"></s:text></div></th>
													<th class="bodyInfo"><div class="infocontent10b"><s:text name="frm.silviculture.impl.area"></s:text></div></th>
												</tr>
												<s:iterator value="slvAct" var="a">
													<tr>
														<td class="bodyInfo">
															<div class="infocontent10b">
																<s:if test="%{locale.language=='al'}"><s:property value="#a.getActivity().getActivityDomain().getNameAl()" /></s:if>
																<s:elseif test="%{locale.language=='sr'}"><s:property value="#a.getActivity().getActivityDomain().getNameSr()" /></s:elseif>
																<s:else><s:property value="#a.getActivity().getActivityDomain().getNameEn()" /></s:else>
															</div>
														</td>
														<td class="bodyInfo"><div class="infocontent10b"><s:property value="#a.getPlArea()" /></div></td>
														<td class="bodyInfo"><div class="infocontent10b"><s:property value="#a.getImArea()" /></div></td>
													</tr>
											   </s:iterator>
									 	</table>
								 </div>
							 </td>
						  </tr>
					</table>
				</tr>
   			</table>  
		</s:if>
		<s:else>
			no results
		</s:else>	
			
			
			
			
			
			
			
	</div>
					<!-- end widget content -->
</div>
</body>



</html>