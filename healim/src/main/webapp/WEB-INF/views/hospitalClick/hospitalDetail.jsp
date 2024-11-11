<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Healim 병원</title>

<style type="text/css">

/* 네비게이션 스타일 */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    background-color: white;
}

body {
    width: 80%; /* 원하는 너비 설정 */
    margin: 0 auto; /* 좌우 여백 중앙 정렬 */
    background-color: white; /* 본문 배경색 */
   
}

.hospitalDetailContent {
    width: 100%;
    margin: 0 auto;
  
}

/* 탭 스타일 */
.tabs {
	display: flex;
	justify-content: space-around;
	border-bottom: 1px solid #ddd; /* 탭 아래 구분선 */
	margin-bottom: 20px;
}

.tabs button {
	background-color: transparent; /* 배경색 없음 */
	border: none;
	outline: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	color: #555;
	transition: color 0.3s ease;
}

.tabs button:hover {
	color: #007bff; /* 호버 시 파란색 */
}

.tabs button.active {
	color: #007bff; /* 선택된 탭 파란색 */
	border-bottom: 3px solid #007bff; /* 선택된 탭 밑줄 */
}

#tabContent {
	padding-top: 20px;
	font-size: 1.1em;
	line-height: 1.6;
	color: #555;
}

.hospitalDetailContent img {
	width: 30%; /* 이미지가 화면의 50% 차지 */
	display: block; /* 블록 요소로 변경 */
	margin: 0 auto; /* 중앙 정렬 */
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
.logoimg {
   width: 300px; /* 로고 크기를 150px로 지정 */
    display: block;
    margin: 10px auto; /* 이미지 중앙 정렬 및 위쪽 여백 */
}
</style>
</head>
<body>
	<c:if test="${not empty errorMessage}">
			<script>
				alert("${errorMessage}");
			</script>
	</c:if>

	<div class="logoheader"  onclick="location.href='/home'">
		<img class="logoimg" src="/resources/img/main.png">
	</div>
	<div class="hospitalDetailContent">
		<!-- <img alt="" src="/resources/img/level.png"> -->
		
		<div class="tabs">
			<button class="active" onclick="loadTab('/hospitalIntro', this)">병원소개</button>
			<button onclick="loadTab('/hospitalGuide', this)">진료안내</button>
			<button onclick="loadTab('/hospitalConsult', this)">상담사례</button>
			<button onclick="loadTab('/hospitalReview', this)">후기</button>
		</div>

		<div id="tabContent">
			<!-- 병원소개가 기본적으로 로드됨 -->
		</div>
	</div>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- jQuery 추가 -->

	<script>
		// 페이지 로드 시 병원소개 탭을 기본적으로 불러옴
		$(document).ready(function() {
			loadTab('/hospitalIntro', $('.tabs button.active'));
		});

		function loadTab(url, element) {
			$.ajax({
				url : url, // 요청 보낼 URL
				type : 'GET', // 요청 방식 (GET)
				success : function(response) {
					// 서버 응답을 tabContent에 삽입
					$('#tabContent').html(response);

					// 모든 탭에서 active 클래스 제거
					$('.tabs button').removeClass('active');

					// 클릭된 탭에 active 클래스 추가 
					$(element).addClass('active');
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error('AJAX Error: ' + status + ' - ' + error);
				}
			});
		}
	</script>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>

</html>
