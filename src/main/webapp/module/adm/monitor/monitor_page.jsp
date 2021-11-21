<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
</head>
<body>    		    
<div id="container">
<br>

	<!-- widget grid -->
	<section id="widget-grid" class="">
	<!-- row -->
	<div class="row">

	<!-- START NEW WIDGET -->
		<article class="col-sm-12">
			<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-admin-monitor" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i></span>
					<h2>Administrator Monitor</h2>
				</header>
				
				<div id="admin_monitor_content">
				<h2>Resource 'jdbc/kfis' connection test</h2>
				<s:if test="jndiConnected==true">
				JNDI Connected: <span style=" color: green; font-weight: bold;"><s:property value="jndiConnected"/></span> 
				(User Count Test: <span style=" color: green; font-weight: bold;"><s:property value="count"/></span>)
				</s:if>
				<s:else>
				JNDI Connected: <span style=" color: red; font-weight: bold;"><s:property value="jndiConnected"/></span> 
				(User Count Test: <span style=" color: red; font-weight: bold;"><s:property value="count"/></span>)				
				</s:else>
				<div>&nbsp;</div>
				<div>
				<span>(Please check Resource META-INF/context.xml of 'jdbc/kfis' for configuration in Tomcat server.xml)</span>
				</div>
				<div class="codeBox">
				<pre><code>&ltResource auth="Container" driverClassName="org.postgresql.Driver" global="jdbc/kfis" logAbandoned="true" maxActive="10" maxIdle="5" maxWait="-1" name="jdbc/kfis" password="secret" removeAbandoned="true" removeAbandonedTimeout="60" type="javax.sql.DataSource" url="jdbc:postgresql://127.0.0.1:5432/kfis20a" username="postgres"&gt;</code>
				</pre>
				</div>
				
				</div>
			</div>
		
		</article>
		<!-- END NEW WIDGET -->
		
	</div>
	<!-- end row -->
	</section>

</div>
</body>
