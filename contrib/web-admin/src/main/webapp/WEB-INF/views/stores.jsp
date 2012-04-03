<%@ include file="/WEB-INF/views/include.jsp"%>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function hideData() {
		$('div.data').hide();
	}
	
	$(window).load(function() {
		$('div.frame a.hide').click(function(e) {
			e.preventDefault();
			$(this).next('div.data').slideToggle();
		});
	});
	
	$(document).ready(function() {
		$("#report tr:odd").addClass("odd");
		$("#report tr:not(.odd)").hide();
		$("#report tr:first-child").show();

		$("#report tr.odd").click(function() {
			$(this).next("tr").toggle();
			$(this).find(".arrow").toggleClass("up");
		});
		//$("#report").jExpand();
	});
</script>
</head>
<div id="wrap">
	<div id="main_container">
		<div class="middle_banner">
			<div class="featured_slider">
				<div id="featured_display" class="jcarousel-container">
					<div id="featured_info_display">
						<br />
						<h3 style="text-align: center;">
							<font style="font-family: courier" size="5" color="#151B8D">Namespace
								Information</font>
						</h3>
						<br>
						<div id="implementation" style="text-align: center;">
							<table id="report" style="margin: 0 auto;">
								<tr>
									<th>Namespace</th>
									<th>Cluster</th>
									<th>Cluster Type</th>
									<th>Implementation</th>
									<th></th>
								</tr>
								<!-- Loop for implementations -->
								<c:forEach items="${implementations.keySet()}" var="impl">
									<c:if test="${impl == 'voldemort'}">
										<!-- Loop for voldemort clusters -->
										<c:forEach items="${implementations.get('voldemort').getClusters().keySet()}" var="cluster">
											<!-- persistence cluster -->
											<c:forEach items="${implementations.get('voldemort').getStores().get(cluster).getPersistenceStores()}" var="store">
												<tr>
													<td><c:out value="${store.getName()}" /></td>
													<td><c:out value="${cluster}" /></td>
													<td>Persistence</td>
													<td>Voldemort</td>
													<td><div class="arrow"></div></td>
												</tr>
												<tr>
													<td colspan="5">
														<!-- print current store information -->
														<div class="table-holder">
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Name</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getName()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Replication</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getReplicationFactor()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Preferred Reads</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getPreferredReads()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Preferred Writes</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getPreferredWrites()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Routing Strategy</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getRoutingStrategyType()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Remote Sites</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getProperties().get(\"remote.clusters\")}" /></font>
																	</p>
																</div>
															</div>
														</div>
													</td>
												</tr>
											</c:forEach>
											
											<!-- distributor cluster -->
											<c:forEach items="${implementations.get('voldemort').getStores().get(cluster).getDistributorStores()}" var="store">
												<tr>
													<td><c:out value="${store.getName()}" /></td>
													<td><c:out value="${cluster}" /></td>
													<td>Distributor</td>
													<td>Voldemort</td>
													<td><div class="arrow"></div></td>
												</tr>
												<tr>
													<td colspan="5">
														<!-- print current store information -->
														<div class="table-holder">
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Name</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getName()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Replication</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getReplicationFactor()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Preferred Reads</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getPreferredReads()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Preferred Writes</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getPreferredWrites()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Routing Strategy</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getRoutingStrategyType()}" /></font>
																	</p>
																</div>
															</div>
															<div class="row" style="border: 0px;">
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D">Remote Sites</font>
																	</p>
																</div>
																<div class="column" style="border: 0px;">
																	<p>
																		<font style="font-family: courier" size="2"
																			color="#151B8D"> : <c:out
																				value="${store.getProperties().get(\"remote.clusters\")}" /></font>
																	</p>
																</div>
															</div>
														</div>
													</td>
												</tr>
											</c:forEach>
											
											
										</c:forEach>
									</c:if>
									<c:if test="${impl == 's3'}">
										<!-- Loop through S3 buckets -->
										<c:forEach items="${implementations.get('s3').getBuckets()}"
											var="bucket">
											<tr>
												<td><c:out value="${bucket.getName()}" /></td>
												<td><c:out value="${cluster}" /></td>
												<td></td>
												<td>S3</td>
												<td><div class="arrow"></div></td>
											</tr>
											<tr>
												<td colspan="5">
													<div class="table-holder">
														<div class="row" style="border: 0px;">
															<div class="column" style="border: 0px;">
																<p>
																	<font style="font-family: courier" size="2"
																		color="#151B8D">Name</font>
																</p>
															</div>
															<div class="column" style="border: 0px;">
																<p>
																	<font style="font-family: courier" size="2"
																		color="#151B8D"> : <c:out
																			value="${bucket.getName()}" /></font>
																</p>
															</div>
														</div>
														<div class="row" style="border: 0px;">
															<div class="column" style="border: 0px;">
																<p>
																	<font style="font-family: courier" size="2"
																		color="#151B8D">Creation Date</font>
																</p>
															</div>
															<div class="column" style="border: 0px;">
																<p>
																	<font style="font-family: courier" size="2"
																		color="#151B8D"> : <c:out
																			value="${bucket.getCreationDate()}" /></font>
																</p>
															</div>
														</div>
														<div class="row" style="border: 0px;">
															<div class="column" style="border: 0px;">
																<p>
																	<font style="font-family: courier" size="2"
																		color="#151B8D">Owner</font>
																</p>
															</div>
															<div class="column" style="border: 0px;">
																<p>
																	<font style="font-family: courier" size="2"
																		color="#151B8D"> : <c:out
																			value="${bucket.getOwner().getDisplayName()}" /></font>
																</p>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${impl == 'simpledb'}">
										<!-- Loop through S3 buckets -->
										<c:forEach
											items="${implementations.get('simpledb').getDomains()}"
											var="domain">
											<tr>
												<td><c:out value="${domain}" /></td>
												<td><c:out value="${cluster}" /></td>
												<td></td>
												<td>Simple DB</td>
												<td><div class="arrow"></div></td>
											</tr>
											<tr>
												<td colspan="5">
													<div class="table-holder">
														<div class="row" style="border: 0px;">
															<div class="column" style="border: 0px;">
																<p>
																	<font style="font-family: courier" size="2"
																		color="#151B8D">Name</font>
																</p>
															</div>
															<div class="column" style="border: 0px;">
																<p>
																	<font style="font-family: courier" size="2"
																		color="#151B8D"> : <c:out value="${domain}" /></font>
																</p>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</c:forEach>
							</table>
						</div>
						<%-- 						<c:forEach items="${implementations.keySet()}" var="impl">
							<c:if test="${impl == 'voldemort'}">
								<div id="implementation" style="text-align: center;" class="frame">
									<a href="#" class="hide"><input class="impl-button" type="button" value="VShards"></a>
									<div class="data">
										<c:forEach items="${implementations.get('voldemort').getClusters().keySet()}" var="cluster">
											<br/>
											<a href="#" class="hide"><img src="<c:url value="/resources/images/cluster_icon.jpg"/>" width="25" height="25" /><input class="server-button" type="button" value='<c:out value="${cluster}" />'></a>
												<div class="data">
													<c:forEach items="${implementations.get('voldemort').getStores().get(cluster)}" var="store">
														<div id="store" style="text-align: center;" class="frame">
															<a href="#" class="hide"><img src="<c:url value="/resources/images/namespace.png"/>" width="25" height="25" /><input class="button" type="button" value='<c:out value="${store.getName()}" />'></a>
															<div class="data">
																<div id="table-holder" style="border: 0px; margin: auto;">
																	<div id="row" style="border: 0px;">
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">Name</font></p>
																		</div>
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${store.getName()}" /></font></p>
																		</div>
																	</div>
																	<div id="row" style="border: 0px;">
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">Replication</font></p>
																		</div>
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${store.getReplicationFactor()}" /></font></p>
																		</div>
																	</div>
																	<div id="row" style="border: 0px;">
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">Preferred Reads</font></p>
																		</div>
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${store.getPreferredReads()}" /></font></p>
																		</div>
																	</div>
																	<div id="row" style="border: 0px;">
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">Preferred Writes</font></p>
																		</div>
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${store.getPreferredWrites()}" /></font></p>
																		</div>
																	</div>
																	<div id="row" style="border: 0px;">
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">Routing Strategy</font></p>
																		</div>
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${store.getRoutingStrategyType()}" /></font></p>
																		</div>
																	</div>
																	<div id="row" style="border: 0px;">
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">Remote Sites</font></p>
																		</div>
																		<div id="column" style="border: 0px;">
																			<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${store.getProperties().get(\"remote.clusters\")}" /></font></p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>  
										</c:forEach>
									</div>
								</div>
							</c:if>
							<c:if test="${impl == 's3'}">
								<div id="implementation" style="text-align: center;" class="frame">
									<a href="#" class="hide"><input class="impl-button" type="button" value="Amazon S3"></a>
									<div class="data">
										<c:forEach items="${implementations.get('s3').getBuckets()}" var="bucket">
											<br/>
											<a href="#" class="hide"><input class="button" type="button" value='<c:out value="${bucket.getName()}" />'></a>
												<div class="data">
													<div id="table-holder" style="border: 0px; margin: auto;">
														<div id="row" style="border: 0px;">
															<div id="column" style="border: 0px;">
																<p><font style="font-family: courier" size="2" color="#151B8D">Name</font></p>
															</div>
															<div id="column" style="border: 0px;">
																<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${bucket.getName()}" /></font></p>
															</div>
														</div>
														<div id="row" style="border: 0px;">
															<div id="column" style="border: 0px;">
																<p><font style="font-family: courier" size="2" color="#151B8D">Creation Date</font></p>
															</div>
															<div id="column" style="border: 0px;">
																<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${bucket.getCreationDate()}" /></font></p>
															</div>
														</div>
														<div id="row" style="border: 0px;">
															<div id="column" style="border: 0px;">
																<p><font style="font-family: courier" size="2" color="#151B8D">Owner</font></p>
															</div>
															<div id="column" style="border: 0px;">
																<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${bucket.getOwner().getDisplayName()}" /></font></p>
															</div>
														</div>
													</div>
												</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<c:if test="${impl == 'simpledb'}">
								<div id="implementation" style="text-align: center;" class="frame">
									<a href="#" class="hide"><input class="impl-button" type="button" value="Amazon Simple DB"></a>
									<div class="data">
										<c:forEach items="${implementations.get('simpledb').getDomains()}" var="domain">
											<br/>
											<a href="#" class="hide"><input class="button" type="button" value='<c:out value="${domain}" />'></a>
												<div class="data">
													<div id="table-holder" style="border: 0px; margin: auto;">
														<div id="row" style="border: 0px;">
															<div id="column" style="border: 0px;">
																<p><font style="font-family: courier" size="2" color="#151B8D">Name</font></p>
															</div>
															<div id="column" style="border: 0px;">
																<p><font style="font-family: courier" size="2" color="#151B8D">  :  <c:out value="${domain}" /></font></p>
															</div>
														</div>
													</div>
												</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<c:if test="${impl == 'redis'}">
								<div id="implementation" style="text-align: center;" class="frame">
									<a href="#" class="hide"><input class="impl-button" type="button" value="Redis"></a>
								</div>
							</c:if>
						</c:forEach> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	//call after page load
	window.onload = hideData;
</script>