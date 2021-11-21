<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../../base/nocache.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css"></style>
</head>
<body>

		<div class="table-responsive" style="padding-top: 0px;">
		<p class="alert alert-info">
			Objects with operations
		</p>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<!-- <th>Id</th> -->
					<th>Name</th>
					<th>Code</th>
					<th>Locked</th>
					<th>Parent</th>
					<th>Operations</th>
				</tr>
			</thead>
			<tbody>
			<s:iterator value="rbacObjectList">
				<tr>
					<!-- <td><s:property value="id"/></td> -->
					<td><s:property value="name"/></td>
					<td><s:property value="code"/></td>
					<td><s:property value="locked"/></td>
					<td><s:property value="parentId"/></td>
					<td>
					<s:iterator value="rbacOperationList">
					<s:property value="name"/>&nbsp;
					</s:iterator>
					</td>
					<!-- 
					<td><table>
					<s:iterator value="rbacOperationList">
					<tr>
						<td><s:property value="name"/></td>
					</tr>
					</s:iterator>
					</table>
					</td>
					 -->	
					
				</tr>
			</s:iterator>	
			</tbody>
		</table>
		</div>


<script type="text/javascript">
	
	/* DO NOT REMOVE : GLOBAL FUNCTIONS!
	 *
	 * pageSetUp(); WILL CALL THE FOLLOWING FUNCTIONS
	 *
	 * // activate tooltips
	 * $("[rel=tooltip]").tooltip();
	 *
	 * // activate popovers
	 * $("[rel=popover]").popover();
	 *
	 * // activate popovers with hover states
	 * $("[rel=popover-hover]").popover({ trigger: "hover" });
	 *
	 * // activate inline charts
	 * runAllCharts();
	 *
	 * // setup widgets
	 * setup_widgets_desktop();
	 *
	 * // run form elements
	 * runAllForms();
	 *
	 ********************************
	 *
	 * pageSetUp() is needed whenever you load a page.
	 * It initializes and checks for all basic elements of the page
	 * and makes rendering easier.
	 *
	 */

	pageSetUp();
	
	// PAGE RELATED SCRIPTS

	// pagefunction
	
	var pagefunction = function() {
		
			
	};
	
	// end pagefunction
	
	// run pagefunction on load

	pagefunction();


</script>

</body>
</html>