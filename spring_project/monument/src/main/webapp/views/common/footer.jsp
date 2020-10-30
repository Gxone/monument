<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
</head>
<body>
	<div class="footer">
		<div class="add_right">
			<ul class="sns_list">
				<li>
					<a href="https://www.facebook.com/LifeSemantics/"target="_blank"> 
						<img src="${pageContext.request.contextPath}/images/bull_facebook.png" alt="facebook">
					</a>
				</li>
				<li>
					<a href="https://blog.naver.com/lifesemantic" target="_blank">
						<img src="${pageContext.request.contextPath}/images/bull_blog.png" alt="naver blog">
					</a>
				</li>
				<li>
					<a href="http://www.hl7korea.or.kr/" target="_blank">
						<img src="${pageContext.request.contextPath}/images/bull_hl7.png" alt="hl7 Korea">
					</a>
				</li>
			</ul>
			<ul class="lang_list">
				<li>
					<a href="#none" id="langKor" onclick="changeLang('ko')" class="active">KOR | </a>
				</li>
				<li>
					<a href="#none" id="langEng" onclick="changeLang('en')">ENG</a>
				</li>
			</ul>
		</div>
		<div class="footer_common">
			<ul class="list01">
				<li>
					<a href="https://lifesemantics.kr/terms" target="_blank">이용약관</a> <span>|</span>
				</li>
				<li>
					<a class="txt_bold" href="https://lifesemantics.kr/privacy" target="_blank">개인정보처리방침</a> <span>|</span> 
				</li>
				<li>
					<a href="http://www.ftc.go.kr/www/bizCommList.do?key=232" target="_blank">사업자정보확인</a>
				</li>
			</ul>
			<div class="txt_company">
				<ul>
					<li>대표이사 : 송승재</li>
					<li>사업자등록번호 : 120-87-88602</li>
					<li>통신판매업신고번호 : 2013-서울강남-01316</li>
				</ul>
				<ul>
					<li>대표번호 : 1661-2858</li>
					<li>팩스 : 02-2038-2858</li>
					<li>이메일 : info@lifesemantics.kr</li>
				</ul>
				<ul>
					<li class="txt_address">주소 : 서울 강남구 강남대로 636, 두원빌딩 5층 (신사동)</li>
					<li>개인정보관리 책임자 : 남세진</li>
				</ul>
			</div>
			<p class="txt_reserved">
				<strong>LifeSemantics © 2018</strong>All rights reserved.
			</p>
		</div>
	</div>

</body>
</html>