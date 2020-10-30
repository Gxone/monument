<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
</head>

<body>
	<h1>
		<a href="${pageContext.request.contextPath}/"> 
			<img src="${pageContext.request.contextPath}/images/logo.png">
		</a>
	</h1>
	<div class="navbar">
		<ul>
			<li><a class="menu" href="${pageContext.request.contextPath}/index">Home</a></li>
			<li><a class="menu" href="${pageContext.request.contextPath}/organization">Organization</a></li>
			<li><a class="menu" href="${pageContext.request.contextPath}/editor">Editor</a></li>
			<li><a class="menu" href="${pageContext.request.contextPath}/board">Board</a></li>
		</ul>
	</div>
</body>

</html>