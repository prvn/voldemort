<%@ include file="/WEB-INF/views/include.jsp"%>
<head>
<script type="text/javascript" src=<c:url value="/resources/js/jquery-1.3.2.min.js"/>></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cluster").live('change', function(){
		getClusterTypes();
		$("#fdomain").hide();
    	$("#clusterTypes").hide();
    	$("#clusterTypes").slideDown("fast");
    });
	$("#type").live('change', function(){
    	$("#fdomain").slideDown("fast");
    });
});
</script>
</head>
<div id="wrap">
	<div id="main_container">
		<div class="middle_banner">
			<div class="featured_slider">
				<!-- begin: sliding featured banner -->
				<div id="featured_display" class="jcarousel-container">
					<!-- <div class="invertedshiftdown">
						<ul>
							<li><a href="jClusterRebalancer">Cluster Transitions</a></li>
							<li><a href="vshardsRebalance">VShards Rebalance</a></li>
						</ul>
						<br style="clear: both;" />
					</div> -->
					<br />
<%-- 					<div id="nodes" style="width: 150px; margin: 0 auto; align-text: center;">
						<c:forEach items="${cluster.getNodes()}" var="node">
							<div id="'TextBoxDiv'+<c:out value="${node.getId()}" />" style="text-align: center;" class="frame">
								<input type="radio" name="delete"/>
								<input type="text" name="node" id="node" value='<c:out value="${node.getHost()}" />' style="text-align: center;" >
								<!-- <font style="font-family: courier" size="2" color="#151B8D"></font><br /> -->
							</div>
						</c:forEach>
						<div id='TextBoxesGroup'></div>
						<br/>
						<input type="image" src='<c:url value="/resources/images/addNode.png"/>' id='addNode' width="40" height="40" />
						<input type="image" src='<c:url value="/resources/images/deleteNode.png"/>' id='removeNode' width="40" height="40" />
					</div>
					<div id="domains" style="width: 400px; margin: 0 auto; align-text: center;">
						<label>Number of domains:</label><input type="text" name="domains" id="domains" value="" />
					</div> --%>
					<div id="stylized" class="myform">
						<form:form id="form" name="form" method="post" modelAttribute="clusterRebalancer" action="/vshards-web-ui/jClusterRebalancer" enctype="multipart/form-data">
							<fieldset>
							<h1>JCluster Rebalancer</h1>
							<label>Cluster<span class="small">Choose cluster</span></label>
							<form:select id="cluster" name="cluster" path="cluster">
									<form:option value="">Choose Cluster</form:option>
									<c:forEach items="${config.getClusters().keySet()}" var="cl">
										<form:option value="${cl}"><c:out value="${cl}" /></form:option>
									</c:forEach>
								</form:select>
							<div style="display: none;" id="clusterTypes">
								<div id="cTypes">
									<!-- The cluster types radiobuttons will be attached here dynamically based on cluster -->
								</div>
								<script type="text/javascript">
									function getClusterTypes()
									{
										$.getJSON('/vshards-web-ui/voldemort/' + form.elements['cluster'].value,
										{
											ajax : 'true'
										},function(data) {
											html ='';
											var len = data.length;
											for ( var i=0; i<len; i++) {
												html += '<label>'+data[i]+'</label> <input type="radio" id="type" name="type" path="type" value="'+data[i]+'" />';
											}
											$('#cTypes').html(html);
										});
									}
								</script>
							</div>
							<div style="display: none;" id="fdomain">
								<label>Failure Domain <span class="small">Failure domain XML file with new hosts</span></label>
								<form:input type="file" path="file" id="file" />
								<input style="margin-left: 150px; width: 140px; height: 30px;" class="button" type="submit" value="Generate Transitions" />
								<div class="spacer"></div>
							</div>
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
