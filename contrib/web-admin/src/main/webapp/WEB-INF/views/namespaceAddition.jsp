<%@ include file="/WEB-INF/views/include.jsp"%>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
    
    $("#cluster").change(function(){
    	if ($(this).val() == "s3" || $(this).val() == "simpledb" || $(this).val() == "redis") {
    		$("#voldemort").hide();
    		$("#other").slideDown("fast");
    	} else {
    		getClusterTypes();
    		$("#voldemort").slideDown("fast");
    		$("#clusterTypes").slideDown("fast");
    		$("#remote").hide();
            $("#view").hide();
            $("#rep").hide();
            $("#other").hide();
    	}
    });
    
    $("#type").live('change', function(){
    	var type = $(this).val();
        if ($(this).val()) {
	    	getSites(type);
            $("#remote").slideDown("fast");
            $("#view").slideDown("fast");
            $("#rep").slideDown("fast");
            $("#other").slideDown("fast");
        } else {
            $("#remote").slideUp("fast");
            $("#view").slideUp("fast");
            $("#rep").slideUp("fast");
            $("#other").slideUp("fast");
        }
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
					<br />
					<div id="stylized" class="myform">
						<form:form id="form" name="form" method="post" modelAttribute="namespaceStore" action="/vshards-web-ui/store/add">
							<h2 style="font-weight: bold; text-align: center;">Namespace Addition</h2>
							<fieldset>
								<!-- Add another for loop under select if any other implementation has a cluster, currently its only Voldemort -->
								<label for="voldemort" >Cluster<span class="small">Choose cluster</span></label>
								<form:select id="cluster" name="cluster" path="cluster">
									<form:option value="">Choose Cluster</form:option>
									<c:forEach items="${implementations.get('voldemort').getClusters().keySet()}" var="cl">
										<form:option value="${cl}"><c:out value="${cl}" /></form:option>
									</c:forEach>
									<form:option value="${implementations.get('s3').getCluster()}">S3</form:option>
									<form:option value="${implementations.get('simpledb').getCluster()}">Simple DB</form:option>
									<form:option value="${implementations.get('redis').getCluster()}">Redis</form:option>
								</form:select>
								<div style="display: none;" id="voldemort">
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
										<div style="display: none;" id="remote">
											<label style="width: 360px; text-align: center;">Remote Sites <span style="width: 360px; text-align: center;" class="small">Available Remote Sites</span></label>
											<div id="remotes">
												<!-- The remote sites checkboxes will be attached here dynamically based on cluster and its type -->
											</div>	
											<script type="text/javascript">
												function getSites(type)
												{
													$.getJSON('/vshards-web-ui/voldemort/' + form.elements['cluster'].value + '/' + type,
																	{
																		ajax : 'true'
																	},function(data) {
																		html ='';
																		var len = data.length;
																		for ( var i=0; i<len; i++) {
																		html += '<label>'+data[i]+'</label> <input type="checkbox" id="remoteSites" name="remoteSites" path="remoteSites" value="'+data[i]+'" />';
																		}
																		$('#remotes').html(html);
																	});
												}
											</script>
										</div>
										<div style="display: none;" id="rep">
											<label>Replication<span class="small">1/1/1 if adding namespace to distributor</span></label>
											<form:select name="replication" path="replication">
												<form:option value="3">3/2/2</form:option>
												<form:option value="1">1/1/1</form:option>
											</form:select>
										</div>
<%-- 										<div style="display: none;" id="view">
											<label>Multisite View Name <span class="small">Name of view (if any)</span></label>
											<form:input type="text" path="view" id="view" />
										</div> --%>
<!--										<div style="display: none;" id="name">
											<label>Namespace <span class="small">Name of namespace</span></label>
											<form:input type="text" path="name" id="name" />
										</div>
 											<input style="margin-left: 150px; width: 125px; height: 30px;" class="button" type="submit" value="Add Store" />
											<div class="spacer"></div> -->
								</div>
								<div style="display: none;" id="other">
									<div id="other_name">
										<label>Namespace <span class="small">Name of namespace</span></label>
										<form:input type="text" path="name" id="name" />
									</div>
									<input style="margin-left: 150px; width: 125px; height: 30px;" class="button" type="submit" value="Add Store" />
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
