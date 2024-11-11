<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>요금 계산기</title>
<style>

body{
	background-color: #e7f1ff;
}
.topper {
	position: fixed;
	top : 0px;
	left : 44%;
	justify-content: center;
}

.topper img {
	width: 300px;
	height: auto;
	display: inline-block;
	margin-top: 10px;
}
  
body {
	width: 70%;
	font-family: 'Arial', sans-serif;
	margin: 20px auto;
	padding: 0;
	box-sizing: border-box;
}

.container {
	display: flex;
	justify-content: flex-start; /* 왼쪽 정렬 */
	max-width: 1000px;
	margin: auto;
	padding: 50px;
	background-color: #f9f9f9;
	overflow: hidden;
	border-radius: 30px;
}

.feature {
	flex: 1;
	margin-right: 20px;
}

.feature h2 {
	font-size: 1.5em;
	margin-bottom: 10px;
}

.feature select, .feature input[type="submit"] {
	padding: 10px;
	font-size: 1em;
	margin-bottom: 10px;
}

.result {
	flex: 1;
	margin-left: 20px;
	padding: 20px;
	min-height: 150px; /* 최소 높이 설정 */
	height: 300px; /* 고정된 높이 설정 */
	transition: all 0.3s ease;
	display: flex;
	flex-direction: column; /* 세로 방향으로 쌓이도록 설정 */
	justify-content: flex-start; /* 위에서부터 쌓이도록 설정 */
}

.result h2 {
	font-size: 1.5em;
	margin-bottom: 10px;
}

.result p {
	font-size: 1.1em;
	margin: 5px 0;
}

.result p.exceeded {
	color: red;
}

.hi {
	text-align: center;
}

/* 플로팅 네비게이션 스타일 */
.floating-nav {
	position: fixed;
	top: 50%;
	left: 20px;
	transform: translateY(-50%);
	width: 80px;
	background-color: #fff;
	border-radius: 15px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 10px;
	text-align: center;
	opacity: 0.8;
}

.floating-nav ul {
	list-style-type: none;
	padding: 0;
}

.floating-nav li {
	margin: 30px 0;
	text-align: center;
}

.floating-nav img {
	width: 40px;
	height: 40px;
	display: block;
	margin: 0 auto 10px;
}

.floating-nav a {
	text-decoration: none;
	color: #000;
	font-size: 14px;
	display: block;
	text-align: center;
}

.floating-nav a:hover {
	text-decoration: underline;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function calculate() {
		const grade = $('select[name="grade"]').val();
		const careTime = $('select[name="careTime"]').val();
		const days = $('select[name="days"]').val();
		const extraRate = $('select[name="extraRate"]').val();

		$.ajax({
			type : 'POST',
			url : '/calculate',
			data : {
				grade : grade,
				careTime : careTime,
				days : days,
				extraRate : extraRate
			},
			success : function(response) {
				$('#result').html(response);
			}
		});
	}

	$(document).ready(function() {
		$('select, input').on('change keyup', calculate);
	});
</script>
</head>
<body>
	<div class="topper">
		<h1>
			<a href="/home"><img src="/resources/img/main.png"></a>
		</h1>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<h1 class="hi">장기요양 예상요금 계산</h1>
	<br>

	<nav class="floating-nav">
		<ul>
			<li><img src="/resources/img/hom4.jpg" alt="홈 이미지"> <a
				href="/home">홈</a></li>
			<li><img src="/resources/img/sangdam.jpg" alt="상담 사례 이미지">
				<a href="/consult_main">상담<br>사례
			</a></li>
			<li><img src="/resources/img/sisul.jpg" alt="시설 찾기 이미지"> <a
				href="/region_selected">시설<br>찾기
			</a></li>
			<li><img src="/resources/img/my.jpg" alt="마이 페이지 이미지"> <a
				href="/myPage">마이<br>페이지
			</a></li>
		</ul>
	</nav>
	<div class="container">
		<!-- 요금 계산 폼 -->
		<form id="calculatorForm" class="feature">
			<div>
				<h2>등급 선택</h2>
				<select name="grade" required>
					<option value="">선택...</option>
					<option value="1">1등급(2,069,900원)</option>
					<option value="2">2등급(1,869,600원)</option>
					<option value="3">3등급(1,455,800원)</option>
					<option value="4">4등급(1,341,800원)</option>
					<option value="5">5등급(1,151,600원)</option>
				</select>
			</div>

			<div>
				<h2>돌봄 시간 선택</h2>
				<select name="careTime" required>
					<option value="">선택...</option>
					<option value="66770">4시간 (66,770원)</option>
					<option value="60530">3시간 30분 (60,530원)</option>
					<option value="54320">3시간 (54,320원)</option>
					<option value="48250">2시간 30분 (48,250원)</option>
					<option value="41380">2시간 (41,380원)</option>
					<option value="32510">1시간 30분 (32,510원)</option>
					<option value="24120">1시간 (24,120원)</option>
					<option value="16630">30분 (16,630원)</option>
				</select>
			</div>

			<div>
				<h2>이용 일수 선택</h2>
				<select name="days" required>
					<option value="">선택...</option>
					<%
					for (int i = 1; i <= 31; i++) {
					%>
					<option value="<%=i%>"><%=i%>일
					</option>
					<%
					}
					%>
				</select>
			</div>

			<div>
				<h2>가산 선택</h2>
				<select name="extraRate" required>
					<option value="0">기본(0%)</option>
					<option value="30">심야, 휴일(30%)</option>
					<option value="50">유급휴일(50%)</option>
				</select>
			</div>
		</form>

		<!-- 계산 결과 -->
		<div class="result" id="result">
			<h2>계산 결과</h2>
			<!-- 이 영역에 AJAX를 통해 결과가 표시됨 -->
		</div>
	</div>


</body>
</html>
