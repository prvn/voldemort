<%@ include file="/WEB-INF/views/include.jsp"%>
<div id="wrap">
	<div id="main_container">
		<div class="middle_banner">
			<div class="featured_slider">
				<!-- begin: sliding featured banner -->
				<div id="featured_display" class="jcarousel-container">
					<br />
					<div id="featured_info_display">
						<br />
 						<h3 style="text-align: center;">
							<font style="font-family: courier" size="5" color="#151B8D">Cluster Health Check</font>
						</h3>
						<br>
						<div id="vertmenu"> 
							<ul>
								<li><a href="#" tabindex="1">Add Namespace</a></li>
							</ul>
						</div>
						<%-- <c:forEach items="${implementations.keySet()}" var="impl">
							<c:if test="${impl == 'voldemort'}">
								<div id="implementation" style="text-align: center;" class="frame">
									<a href="/vshards-web-ui/addStore/vshards" style="text-decoration: none;"><input class="impl-button" type="button" value="VShards"></a>
								</div>
							</c:if>
							<c:if test="${impl == 's3'}">
							<div id="implementation" style="text-align: center;" class="frame">
									<a href="/vshards-web-ui/addStore/s3" style="text-decoration: none;"><input class="impl-button" type="button" value="Amazon S3"></a>
								</div>
							</c:if>
							<c:if test="${impl == 'simpledb'}">
							<div id="implementation" style="text-align: center;" class="frame">
									<a href="/vshards-web-ui/addStore/simpledb" style="text-decoration: none;"><input class="impl-button" type="button" value="Amazon Simple DB"></a>
								</div>
							</c:if>
						</c:forEach> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
