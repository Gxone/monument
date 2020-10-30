<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
    <div class="wrapper">
        <div class="header"><%@include file="common/header.jsp"%></div>
        <div class="contents">
            <div class="nav">
                <ul>
                    <li>Index</li>
                </ul>
            </div>
            <a href="${pageContext.request.contextPath}/organization">organization</a>
        </div>
        <div class="footer"><%@include file="common/footer.jsp"%></div>
    </div>
</body>

</html>