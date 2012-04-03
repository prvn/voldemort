<%@ include file="/WEB-INF/views/include.jsp"%>
<div id="wrap">
	<div id="main_container">
		<div class="middle_banner">
			<div class="featured_slider">
				<!-- begin: sliding featured banner -->
				<div id="featured_display" class="jcarousel-container">
					<br />
					<div id="stylized" class="myform">
						<form:form id="form" name="form" method="post" modelAttribute="store" action="addStore/s3">
							<h1>S3 Bucket Creation</h1>
							<label>Name <span class="small">Name of bucket</span></label><form:input type="text" path="name" id="name" />
							<input style="margin-left: 150px; width: 125px; height: 30px;" class="button" type="submit" value="Add Bucket" />
							<div class="spacer"></div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>