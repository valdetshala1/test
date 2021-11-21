<%@ page language="java" contentType="text/html; charset=UTF-8"
	isErrorPage="true" pageEncoding="UTF-8"%>

<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
.panel {
background: #ff8e00;
height: 500px;
overflow: scroll;
width: 100%;
border: 1px solid #000;
padding: 5px;
} 
</style>
</head>
<body>
<div>
	<div class="widget-body">
	<div id="perror" class="panel">
		<h1>The application has malfunctioned.</h1>
		<p>  Please contact technical support with the following information:</p> 
		
		<table width="100%" border="1">
		<tr valign="top">
			<td width="40%"><b>Exception Name:</b></td>
			<td>${exception}</td>
		</tr>
		<tr valign="top">
			<td><b>URI:</b></td>
			<td>${pageContext.errorData.requestURI}</td>
		</tr>
		<tr valign="top">
			<td><b>Status code:</b></td>
			<td>${response.statusCode}</td>
		</tr>
		
		<tr valign="top">
			<td><b>Server:</b></td>
			<td><%=application.getServerInfo()%></td>
		</tr>	
		<tr valign="top">
			<td><b>Servlet Specification:</b></td>
			<td><%=application.getMajorVersion()%>.<%=application.getMinorVersion()%></td>
		</tr>
		<tr valign="top">
			<td><b>JSP version:</b></td>
			<td><%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion()%></td>
		</tr>
		<tr valign="top">
			<td><b>Java Version:</b></td>
			<td><%=System.getProperty("java.version")%></td>
		</tr>				
				
		<tr valign="top">
			<td><b>Exception Details:</b></td>
			<td>
			<s:iterator value="exception.stackTrace" var="trace">
			<p>${trace}</p>
			</s:iterator>
			</td>
		</tr>
		</table>
		</div>
	</div>
</div>
</body>
</html>
