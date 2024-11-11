<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<title>최근 본 요양시설</title>
<style>
body {
	font-family:; /* 모든 글자에 Dongle 폰트 적용 */
	background-color: #fdfdfd;
	margin: 0;
	padding: 0;
	font-size: 16px; /* 기본 글씨 크기를 px 단위로 설정 */
}

.logo {
	display: flex;
	justify-content: center; /* 가로 방향 중앙 정렬 */
	margin-bottom: 20px; /* 로고와 헤더 간격 */
}

a {
	text-decoration: none;
	color: inherit; /* 기본 텍스트 색상을 유지 */
	text-align: center;
	font-size: 60px; /* 기본 링크 크기 */
}

a:visited {
	color: inherit; /* 방문 후에도 색상 유지 */
}

a:hover, a:active {
	color: inherit; /* 마우스를 올리거나 활성화 상태일 때도 색상 유지 */
}

.container {
	width: 90%;
	max-width: 800px; /* 최대 너비를 줄여서 반응형 디자인 개선 */
	margin: 20px auto;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.header {
	text-align: center;
	font-size: 40px; /* 기본 헤더 크기 */
	font-weight: bold;
	margin-bottom: 20px;
}

.facility-item {
	display: flex;
	align-items: center;
	border-bottom: 1px solid #ddd;
	padding: 15px 0;
	cursor: pointer;
}

.facility-item:last-child {
	border-bottom: none;
}

.facility-item img {
	width: 100px; /* 이미지 크기 조정 */
	height: auto; /* 비율 유지 */
	border-radius: 10px;
	margin-right: 15px;
}

.facility-details {
	flex-grow: 1;
}

.facility-details h3 {
	margin: 0;
	font-size: 30px; /* 기본 제목 크기 */
}

.facility-details p {
	margin: 5px 0 0;
	color: gray;
	text-align: right;
	font-size: 16px; /* 기본 날짜 크기 */
}

.facility-itemheart {
	cursor: pointer;
	width: 15px; /* 하트 이미지 너비 */
	height: 15px; /* 하트 이미지 높이 */
	margin-left: 10px;
}

/* 사이드바 스타일 */
.sidebar {
	position: fixed;
	left: 0;
	top: 0;
	width: 200px;
	height: 100%;
	background-color: #ceeafb; /* 배경색과 동일하게 */
	color: black;
	display: flex;
	flex-direction: column;
	justify-content: center; /* 세로 가운데 정렬 */
	align-items: center; /* 가로 가운데 정렬 */
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
	font-weight: bold;
}

.sidebar a {
	display: block;
	color: #000000;
	padding: 10px 20px;
	text-decoration: none;
	font-size: 25px; /* 글자 크기 줄임 */
	text-align: center;
}

.sidebar a:hover {
	background-color: #9cd2ec; /* 호버시 배경색 변경 */
	border-radius: 5px;
}

.topper {
	position: fixed;
	top: 0px;
	left: 50%;
	transform: translateX(-50%);
	justify-content: center;
	z-index: 10; /* 다른 요소 위로 배치 */
}

.topper img {
	width: 300px;
	height: auto;
	display: inline-block;
	margin-top: 0px;
}
</style>
</head>
<body>

	<div class="sidebar">
		<a href="/myPage">계정 정보</a> <a href="/zzim">찜한 목록</a> <a
			href="/recent">최근 본 요양시설</a> <a href="/inq">문의내역</a> <a
			href="/myPost">내가 쓴 글</a>
	</div>

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
	<div class="container">

		<div class="header">최근 본 요양시설</div>

		<!-- 요양시설 목록 -->
		<!-- <div class="facility-item" onclick="location.href='/hospitalDetail'">
			<img src="resources/img/5.jpg" alt="오케이요양병원">
			<div class="facility-details">
				<h3>오케이요양병원</h3>
				<p>서울 구로구 중앙로 64 고척프라자 가동 4층, 나동 3,4층</p> -->

		<c:forEach var="facility" items="${recentlyViewedList}">
			<div class="facility-item"
				onclick="location.href='/hospitalDetail?h_id=${facility.h_id}'">
				<img src="resources/img/qqqq.png" alt="${facility.h_id}">
				<div class="facility-details">
					<h3>${facility.h_name}</h3>
					<!-- 병원 아이디 출력 -->
					<p>${facility.grade}</p>
					<!-- 최근 본 날짜 출력 -->
				</div>
			</div>
		</c:forEach>
	</div>


	<script>
		function toggleHeart(heart) {
			heart.classList.toggle('active');
			if (heart.classList.contains('active')) {
				heart.src = 'resources/img/heart2.jpg'; // 찜한 상태 이미지
			} else {
				heart.src = 'resources/img/heart11.jpg'; // 찜하지 않은 상태 이미지
			}
		}
	</script>
</body>
</html>