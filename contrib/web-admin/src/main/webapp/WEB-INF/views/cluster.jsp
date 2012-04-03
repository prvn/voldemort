<%@ include file="/WEB-INF/views/include.jsp"%>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function hideData() {
		$('div.data').hide();
	}
	$(window).load(function() {
		$('div.frame').click(function(e) {
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
						<h3 style="text-align: center;">
							<font style="font-family: courier" size="5" color="#151B8D">Cluster
								Information</font>
						</h3>
						<br>
						<div id="implementation" style="text-align: center;">
							<table id="report" style="margin: 0 auto;">
								<tr>
									<th>Cluster</th>
									<th>Servers</th>
									<th>Implementation</th>
									<th></th>
								</tr>
								<!-- Loop for implementations -->
								<c:forEach items="${implementations.keySet()}" var="impl">
									<c:if test="${impl == 'voldemort'}">
										<!-- Loop for voldemort clusters -->
										<c:forEach
											items="${implementations.get('voldemort').getClusters().keySet()}"
											var="cluster">
											<tr>
												<td><font style="text-transform: uppercase;"><c:out
															value="${cluster}" /></font></td>
												<c:choose>
													<c:when
														test="${empty implementations.get('voldemort').getClusters().get(cluster).getDistributorCluster()}">
														<td><c:out
																value="${implementations.get('voldemort').getClusters().get(cluster).getPersistenceCluster().getNumberOfNodes()}" /></td>
													</c:when>
													<c:otherwise>
														<td><c:out
																value="${implementations.get('voldemort').getClusters().get(cluster).getPersistenceCluster().getNumberOfNodes() + implementations.get('voldemort').getClusters().get(cluster).getDistributorCluster().getNumberOfNodes()}" /></td>
													</c:otherwise>
												</c:choose>
												<td>Voldemort</td>
												<td><div class="arrow"></div></td>
											</tr>
											<tr>
												<td colspan="5">
													<!-- Loop for nodes in the persistence cluster -->
													<table id="report">
														<tr>
															<td></td>
															<td>Persistence</td>
															<td></td>
															<td><div class="arrow"></div></td>
														</tr>
														<tr>
															<td colspan="5">
																<c:forEach items="${implementations.get('voldemort').getClusters().get(cluster).getPersistenceCluster().getNodes()}" var="node">
																	<table id="report">
																		<tr>
																			<td></td>
																			<td><font size="2" color="#151B8D"><c:out
																						value="${node.getHost()}" /></font></td>
																			<td><div class="arrow"></div></td>
																		</tr>
																		<tr>
																			<td colspan="5">
																				<div class="table-holder">
																					<div class="row" style="border: 0px;">
																						<div class="column" style="border: 0px;">
																							<font size="2" color="#151B8D">ID</font>
																						</div>
																						<div class="column" style="border: 0px;">
																							<font size="2" color="#151B8D"> : <c:out
																									value="${node.getId()}" /></font>
																						</div>
																					</div>
																					<div class="row" style="border: 0px;">
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D">Port</font>
																							</p>
																						</div>
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D"> : <c:out
																										value="${node.getSocketPort()}" /></font>
																							</p>
																						</div>
																					</div>
																					<div class="row" style="border: 0px;">
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D">Partitions</font>
																							</p>
																						</div>
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D"> : <c:out
																										value="${node.getPartitionIds()}" /></font>
																							</p>
																						</div>
																					</div>
																					<div class="row" style="border: 0px;">
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D">Number of Partitions</font>
																							</p>
																						</div>
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D"> : <c:out
																										value="${node.getNumberOfPartitions()}" /></font>
																							</p>
																						</div>
																					</div>
																				</div>
																			</td>
																		</tr>
																	</table>
																</c:forEach></td>
														</tr>
													</table>
													
													<!-- Loop for nodes in the distributor cluster -->
													<c:if test="${not empty implementations.get('voldemort').getClusters().get(cluster).getDistributorCluster()}">
														<table id="report">
														<tr>
															<td></td>
															<td>Distributor</td>
															<td></td>
															<td><div class="arrow"></div></td>
														</tr>
														<tr>
															<td colspan="5">
																<c:forEach items="${implementations.get('voldemort').getClusters().get(cluster).getDistributorCluster().getNodes()}" var="node">
																	<table id="report">
																		<tr>
																			<td></td>
																			<td><font size="2" color="#151B8D"><c:out
																						value="${node.getHost()}" /></font></td>
																			<td><div class="arrow"></div></td>
																		</tr>
																		<tr>
																			<td colspan="5">
																				<div class="table-holder">
																					<div class="row" style="border: 0px;">
																						<div class="column" style="border: 0px;">
																							<font size="2" color="#151B8D">ID</font>
																						</div>
																						<div class="column" style="border: 0px;">
																							<font size="2" color="#151B8D"> : <c:out
																									value="${node.getId()}" /></font>
																						</div>
																					</div>
																					<div class="row" style="border: 0px;">
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D">Port</font>
																							</p>
																						</div>
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D"> : <c:out
																										value="${node.getSocketPort()}" /></font>
																							</p>
																						</div>
																					</div>
																					<div class="row" style="border: 0px;">
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D">Partitions</font>
																							</p>
																						</div>
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D"> : <c:out
																										value="${node.getPartitionIds()}" /></font>
																							</p>
																						</div>
																					</div>
																					<div class="row" style="border: 0px;">
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D">Number of Partitions</font>
																							</p>
																						</div>
																						<div class="column" style="border: 0px;">
																							<p>
																								<font style="font-family: courier" size="2"
																									color="#151B8D"> : <c:out
																										value="${node.getNumberOfPartitions()}" /></font>
																							</p>
																						</div>
																					</div>
																				</div>
																			</td>
																		</tr>
																	</table>
																</c:forEach></td>
														</tr>
													</table>
													</c:if>
													
													
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${impl == 'simpledb'}">
										<tr>
											<td>AWS</td>
											<td></td>
											<td>Amazon Simple DB</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="5">
											</td>
										</tr>
									</c:if>
									<c:if test="${impl == 's3'}">
										<tr>
											<td>AWS</td>
											<td></td>
											<td>Amazon S3</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="5">
											</td>
										</tr>
									</c:if>
									<c:if test="${impl == 'redis'}">
										<tr>
											<td></td>
											<td><c:out value="${implementations.get('redis').getServers().size()}" /></td>
											<td>Redis</td>
											<td><div class="arrow"></div></td>
										</tr>
										<tr>
											<td colspan="5">
												<c:forEach items="${implementations.get('redis').getServers()}" var="server">
													<table id="report">
														<tr>
															<td><font size="2" color="#151B8D"><c:out value="${server}" /></font></td>
														</tr>
														<tr>
															<td colspan="5"></td>
														</tr>
													</table>
												</c:forEach>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
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