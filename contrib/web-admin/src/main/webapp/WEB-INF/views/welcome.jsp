<%@ include file="/WEB-INF/views/include.jsp"%>
<div id="wrap">
	<div id="main_container">
		<div class="middle_banner">
			<div class="featured_slider">
				<!-- begin: sliding featured banner -->
				<div id="featured_border" class="jcarousel-container">
					<div id="featured_wrapper" class="jcarousel-clip">
						<ul id="featured_images" class="jcarousel-list">
							<li><img src=<c:url value="/resources/images/vshards_arch.jpg"/> width="965" height="635" alt="" /></li>
							<li><img src=<c:url value="/resources/images/nokia-world.jpg"/> width="965" height="635" alt="" /></li>
							<li><img src=<c:url value="/resources/images/vshards_multisite.png"/> width="965" height="635" alt="" /></li>
							<li><img src=<c:url value="/resources/images/dataos-arch.png"/> width="965" height="635" alt="" /></li>
						</ul>
					</div>
					<div id="featured_positioner_desc" class="jcarousel-container">
						<div id="featured_wrapper_desc" class="jcarousel-clip">
							<ul id="featured_desc" class="jcarousel-list">
								<li>
									<div>
										<p style="font-weight: bold;">
										VShards creates a sharding solution to provide a massively scalable, persistent storage solution. 
										The work is being referred to as "virtual shards", meaning a large number of data shards that are spread across a smaller number of physical machines. 
										VShards focuses on delivering a highly scalable, highly available, persistent key-value storage platform.
										<br/>
										</p>
									</div>
								</li>
								<li>
									<div>
										<p style="font-weight: bold;">
									 	This is NOKIA world 2011 !!!
									 	<br/>
									 	<br/>
									 	<br/>
										</p>
									</div>
								</li>
								<li>
									<div>
										<p style="font-weight: bold;">
									 	VShards provides a multisite'd data replication between different data centers located in different geographical locations.
									 	<br/>
									 	<br/>
									 	<br/>
										</p>
									</div>
								</li>
								<li>
									<div>
										<p style="font-weight: bold;">
									 	DataOS architecture
									 	<br/>
									 	<br/>
									 	<br/>
										</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<ul id="featured_buttons" class="clear_fix">
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
					</ul>
				</div>
				<!-- end: sliding featured banner -->
			</div>

		</div>
	</div>
</div>