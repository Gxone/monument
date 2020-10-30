<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<div class="wrapper">
        <div class="header"><%@include file="common/header.jsp"%></div>
        <div class="nav">
            <ul>
                <li>Board</li>
            </ul>
        </div>
        <div class="contents">
        <table>
        <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
        </tr>
        <c:forEach var="list" items="${list}" varStatus="status">
        <tr>
        	<td>
        		<a href="board/${list.idx}">${list.idx}</a>
        	</td>
        	<td>
        		<a href="board/${list.idx}">${list.title}</a>
        	</td>
        	<td>
        		<a href="board/${list.idx}"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.createAt}"/></a>
        	</td>
        </tr>
        </c:forEach> 

        </table>
        </div>
        <div class="footer"><%@include file="common/footer.jsp"%></div>
    </div>
</body>
</html>