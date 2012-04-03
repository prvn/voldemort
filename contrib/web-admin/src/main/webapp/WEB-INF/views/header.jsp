<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Header</title>
</head>
<body>
	<div id="wrap">
		<div class="top_corner"></div>
		<div id="main_container">

			<div id="header">
				<div id="logo">
				<p><font style="font-family: courier; font-weight: bold;" size="10" color="#151B8D">VShards</font></p>
					<%-- <img src='<c:url value="/resources/images/vshards_logo_small.png"/>' width="300" height="80" /> --%>
				</div>

				<div id="menu">
					<ul>
						<li><a class="current" href="/vshards-web-ui/" title="VShards Web Home">Home</a></li>
						<li><a href="/vshards-web-ui/administration" title="Administration">Administration</a></li>
						<li><a href="/vshards-web-ui/cluster" title="VShards Cluster Information">Cluster</a></li>
						<li><a href="/vshards-web-ui/namespaces" title="VShards Namespace Information">Namespaces</a></li>
					</ul>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
