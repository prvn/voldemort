<%@ include file="/WEB-INF/views/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>VShards Web Administration</title>
<link rel="stylesheet" type="text/css" href=<c:url value="/resources/css/style.css"/> media="screen" />
<script type="text/javascript" src=<c:url value="/resources/js/jquery.core.js"/>></script>
<script type="text/javascript" src=<c:url value="/resources/js/jquery.superfish.js"/>></script>
<script type="text/javascript" src=<c:url value="/resources/js/jquery.jcarousel.pack.js"/>></script>
<script type="text/javascript" src=<c:url value="/resources/js/jquery.easing.js"/>></script>
<script type="text/javascript" src=<c:url value="/resources/js/jquery.scripts.js"/>></script>
</head>
<body class="back">
	<div>
			<div style="height: 90px;"><tiles:insertAttribute name="header" /></div>
			<div style="height: 658px;"><tiles:insertAttribute name="body" /></div>
			<div style="height: 65px"><tiles:insertAttribute name="footer" /></div>
	</div>
</body>
</html>