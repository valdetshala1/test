<%@ page language="java" contentType="text/html; charset=charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="../WEB-INF/tlds/birt.tld" prefix="birt"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>KFIS - BIRT</title>
</head>
<body>
 	
<script type="text/javascript">
var report_name = "<s:property value='%{parameterMap.__document}'/>";
var link = "frameset?__report=" + report_name + "&__parameterpage=false&p_year=2014";
window.location.href = link;
</script>	
 	
</body>
</html>