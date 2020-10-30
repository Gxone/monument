<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/treetable.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/treetable.js"></script>
</head>

<body>
	<div class="wrapper">
		<div class="header"><%@include file="common/header.jsp"%></div>
		<div class="nav">
			<ul>
				<li>Organization</li>
			</ul>
		</div>
		<div class="contents_wrapper">
			<div class="contents">
				<h3>Scope and Usage</h3>
				<p>This resource is an event resource from a FHIR workflow
					perspective.</p>
				<p>Observations are a central element in healthcare, used to
					support diagnosis, monitor progress, determine baselines and
					patterns and even capture demographic characteristics. Most
					observations are simple name/value pair assertions with some
					metadata, but some observations group other observations together
					logically, or even are multi-component observations. Note that the
					DiagnosticReport resource provides a clinical or workflow context
					for a set of observations and the Observation resource is
					referenced by DiagnosticReport to represent laboratory, imaging,
					and other clinical and diagnostic data to form a complete report.</p>
				<br>
				<!-- 탭 메뉴 -->
				<div id="container">
					<ul class="tab">
						<li class="current" data-tab="tab1"><a href="#">Structure</a>
						</li>
						<li data-tab="tab2"><a href="#">JSON</a></li>
					</ul>

					<div id="tab1" class="tabcontent current"></div>

					<div id="tab2" class="tabcontent">
						<pre id="jsonTab"></pre>
					</div>
				</div>
			</div>
			<div class="footer"><%@include file="common/footer.jsp"%></div>
		</div>
	</div>
</body>

</html>