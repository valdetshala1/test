<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<h1>ERROR</h1>
<s:actionerror/>
<p><s:property value="%{exception.message}"/></p><hr/>
<h2>Technical Details</h2>
<p>
<font style="font-size: 14px; color:black">    
<s:property value="%{exceptionStack}"/>
</font>
</p>

</body>
</html>
