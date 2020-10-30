<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


</head>

<body>
	<div class="wrapper">
		<div class="header"><%@include file="common/header.jsp"%></div>
		<div class="nav">
			<ul>
				<li>상세페이지</li>
			</ul>
		</div>
		<div class="contents">
			<h2>${result.title}</h2>
			<fmt:formatDate pattern="yyyy-MM-dd" value="${result.createAt}" />
			<br>
			<p>${result.content}</p>
			<button class="returnList" onclick="document.location.href='/board'">목록으로</button>
		</div>
		<div class="footer"><%@include file="common/footer.jsp"%></div>
	</div>
</body>

</html>