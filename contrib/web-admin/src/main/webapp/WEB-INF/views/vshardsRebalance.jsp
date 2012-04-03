<%@ include file="/WEB-INF/views/include.jsp"%>
<head>
<script type="text/javascript" src=<c:url value="/resources/js/jquery-1.3.2.min.js"/>></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cluster").live('change', function(){
		getClusterTypes();
		$("#run").hide();
    	$("#clusterTypes").hide();
    	$("#clusterTypes").slideDown("fast");
    });
	$("#type").live('change', function(){
    	$("#run").slideDown("fast");
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
					<div id="stylized" class="myform">
						<form:form id="form" name="form" method="post" modelAttribute="rebalance" action="/vshards-web-ui/vshardsRebalance">
						<fieldset>
							<h1>VShards Rebalancer</h1>
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
							<div style="display: none;" id="run">
								<label>Transitions <span class="small">Number of transitions to run at once</span></label><form:input type="text" path="transitions" id="transitions" value="1"/>
								<input style="margin-left: 150px; width: 125px; height: 30px;" class="button" type="submit" value="Rebalance" />
								<a href="vshardsRebalance/showPlan"><input style="text-decoration: none; margin-left: 150px; width: 125px; height: 30px;" class="button" type="submit" value="Show Plan" /></a>
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
