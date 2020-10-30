<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/editor.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-2.0.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/showdown/1.6.0/showdown.min.js"></script>
<script
	src="https://rawgithub.com/makerj/misc/master/tistory-markdown-plugin.js"></script>

<script>
	// 마크다운 js
	function run() {
		var text = document.getElementById('targetTxt').value, target = document
				.getElementById('targetDiv'), converter = new showdown.Converter(), html = converter
				.makeHtml(text);
		target.innerHTML = html;
	}
	
	var a = 0;
	// 슬라이드 메뉴
	$(document).ready(function() {
		$('#slideUp').click(function() {
			var effect = 'slide';
			
			if (a == 0) {
 				$('#wrapper_slide1').width('300px'); 
 				$('#ch2').width('180px'); 
				$('#side_menu').attr('style', 'visibility: visible'); 
				a = 1;
			} else if(a == 1) {
				/* $('#wrapper_slide2').width('0px'); */
				$("#wrapper_slide2").attr("width", "0");

				
	/* 			$('#wrapper_slide1').width('96px'); */ 
				$("#wrapper_slide1").width('96px');
 				$('#side_menu').width('860px');  
				$('#side_menu').attr('style', 'visibility: hidden');
				a = 0;
			} 
		$('#ch2').width('170px'); 
			$('#wrapper_slide2').width('660px');
 
			//슬라이드 
/* 			$('#side_menu').attr('style', 'visibility: visible');
 			$('#wrapper_slide1').toggle(effect, {direction : "left"}, 1000);  */

 			

 			
			
		});
	});

	// 드래그 크기 조절
	var startpos, diffpos = 0
	var range = 50;
	var isEnable = false;

	function on_mouse_down(e) {
		startpos = event.clientX + diffpos;
		isEnable = true;
	}

	function on_mouse_up(e) {
		isEnable = false;
		return false;
	}

	function on_mouse_move(e) {
		if (isEnable) {
			pos = event.clientX;
			diffpos = startpos - pos;
			var width = window.innerWidth / 2;

			if (pos <= width) {
				document.getElementById("ch1").style.width = 380 - diffpos
						+ "px";
				document.getElementById("ch2").style.width = 380 + diffpos
						+ "px";
			} else {
				document.getElementById("ch1").style.width = 380 - diffpos
						+ "px";
				document.getElementById("ch2").style.width = 380 + diffpos
						+ "px";
			}
		}
	}

	function init() {
		document.getElementById("hr").onmousedown = on_mouse_down;
		document.onmouseup = on_mouse_up;
		document.onmousemove = on_mouse_move;
	}
</script>
</head>

<body onload="init()">
	<div class="wrapper">
		<div class="header">
			<%@include file="common/header.jsp"%>
		</div>
		<div class="nav">
			<ul>
				<li>MarkDown Editor</li>
			</ul>
		</div>

		<div class="contents">

			<label for="editorTitle">제목</label> <input type="text" path="title"
				id="editorTitle" name="title" /> <br> <br>


				<div class="section_editor">
			<div id="wrapper_slide2">
				<div class="btn_side1">
					<ul>
						<li><button id="slideUp">btn</button></li>
						<li><button>btn</button></li>
						<li><button>btn</button></li>
					</ul>
				</div>

				<div class="editor_wrapper">
					<div id="ch1">
						<textarea path="content" id="targetTxt" onkeyup="run()"
							ondrop="drop(event)" ondragover="allowDrop(event)"
							ondragstart="drag(event)"></textarea>
					</div>

					<div id="hr"></div>
					<div id="ch2">
						<div id="targetDiv" ondragover="allowDrop(event)"
							ondrop="drop(event)" ondragstart="drag(event)"></div>
					</div>
				</div>
			</div>
			<form:form action="/register" method="post"
				modelAttribute="markDownTableDto" id="editorForm">
				<div id="wrapper_slide1">
					<div class="btn_side2" id="side2">
						<ul>

							<li><button type="submit">submit</button></li>

							<li><button>btn</button></li>
							<li><button>btn</button></li>
						</ul>
					</div>

					<div id="side_menu"></div>


				</div>
			</form:form>
		</div>
</div>
		<div class="footer">
			<%@include file="common/footer.jsp"%>
		</div>
	</div>

</body>

</html>