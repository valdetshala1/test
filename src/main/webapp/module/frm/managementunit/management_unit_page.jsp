<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../base/nocache.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="robots" content="index, follow" />
</head>	
<body>
		<div>
			<jsp:include page="management_unit_grid.jsp" />
		</div>
		
		<div style="padding-top: 5px;">

				<div class="jarviswidget jarviswidget-color-blueLight" id="widget-id-variety" data-widget-deletebutton="false">
					<header>
						<span class="widget-icon"> <i class="fa fa-glass"></i></span>
						<h2>Management unit</h2>
					</header>
					
					<div>
					
						<div id="vineyard_variety_expander">
							<jsp:include page="management_unit_form.jsp" />
						</div>
						
					</div>
				</div>			

		</div>		
	
</body>
</html>