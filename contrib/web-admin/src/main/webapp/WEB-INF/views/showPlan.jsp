<%@ include file="/WEB-INF/views/include.jsp"%>
<div id="wrap">
	<div id="main_container">
		<div class="middle_banner">
			<div class="featured_slider">
				<div id="featured_display" class="jcarousel-container">
					<div id="featured_info_display">
						<br />
						<h3 style="text-align: center;">
							<font style="font-family: courier" size="5" color="#151B8D">Rebalance Plan</font>
						</h3>
						<br>
						<div id="table-holder" style="position: absolute;">
							<div id="row">
								<div id="column">
									<p style="text-align: center;"><font style="font-weight: bold;" size="3">Transition ID</font></p>
								</div>
								<div id="column">
									<p style="text-align: center;"><font style="font-weight: bold;" size="3">Status</font></p>
								</div>
								<div id="column">
									<p style="text-align: center;"><font style="font-weight: bold;" size="3">Start Time</font></p>
								</div>
								<div id="column">
									<p style="text-align: center;"><font style="font-weight: bold;" size="3">End Time</font></p>
								</div>
							</div>
							<c:forEach items="${rebalanceStatus.getTransitions()}" var="transition">
								<div id="row">
									<div id="column">
										<p style="text-align: center;"><a href="#"><font style="font-weight: bold; text-align: center;" size="2"><c:out value="${transition}" /></font></a></p>
									</div>
									<div id="column">
										<c:if test='${rebalanceStatus.getRebalanceMetadata().get(transition).getState().name().toString() == "not_started"}'>
											<p style="text-align: center;"><font style="font-family: courier" size="2" color="#CD0000">NOT STARTED</font></p>
										</c:if>
										<c:if test='${rebalanceStatus.getRebalanceMetadata().get(transition).getState().name().toString() == "started"}'>
											<p style="text-align: center;"><font style="font-family: courier" size="2" color="#458B00">RUNNING</font></p>
										</c:if>
										<c:if test='${rebalanceStatus.getRebalanceMetadata().get(transition).getState().name().toString() == "completed"}'>
											<p style="text-align: center;"><font style="font-family: courier" size="2" color="#458B00">FINISHED</font></p>
										</c:if>
										<c:if test='${rebalanceStatus.getRebalanceMetadata().get(transition).getState().name().toString() == "failed"}'>
											<p style="text-align: center;"><font style="font-family: courier" size="2" color="#CD0000">FAILED</font></p>
										</c:if>
									</div>
									<div id="column">
										<p style="text-align: center;"><font style="font-weight: bold;" size="2"><c:out value="${rebalanceStatus.getRebalanceMetadata().get(transition).getStartTime()}" /></font></p>
									</div>
									<div id="column">
										<p style="text-align: center;"><font style="font-weight: bold;" size="2"><c:out value="${rebalanceStatus.getRebalanceMetadata().get(transition).getEndTime()}" /></font></p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>