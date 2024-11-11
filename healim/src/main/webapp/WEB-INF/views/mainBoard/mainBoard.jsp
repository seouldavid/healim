<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 페이지</title>

<style type="text/css">
body {
	background-color: #e7f1ff;
}

.topper {
	position: fixed;
	top: 0px;
	left: 44%;
	justify-content: center;
}

.topper img {
	width: 300px;
	height: auto;
	display: inline-block;
	margin-top: 10px;
}
/* 네비게이션과 브라우저 넓이 설정 */
.content {
	width: 80%;
	margin: 150px auto 0 auto; /* 로고와 겹치지 않도록 상단 여백 추가 */
	padding: 20px;
	box-sizing: border-box;
	background: white;
	border-radius: 20px;
	display: flex;
	flex-wrap: wrap;
	gap: 20px; /* 박스 간격 */
	justify-content: space-between; /* 간격 균등 배치 */
}

/* 게시판 스타일 */
.board-section {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.board-box {
	width: 48%; /* 2줄 배치를 위한 width 설정 */
	padding: 10px;
	border-radius: 8px;
	box-sizing: border-box;
}

.board-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 18px;
	margin-bottom: 10px;
}

.board-header img {
	width: 40px;
	height: 20px;
	border-radius: 8px;
}

.board-content {
	list-style-type: none;
	border: 5px solid lightgray;
	padding: 20px;
	border-radius: 8px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between; /* 간격 균등 배치 */
}



.board-header span {
	font-weight: bold;
	margin: 8px;
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
/* 모든 링크 상태에 대한 스타일 지정 */
a, a:visited, a:hover, a:active {
	text-decoration: none; /* 밑줄 제거 */
	color: black; /* 링크 색상을 검정으로 고정 */
}
</style>

<!--  ㅇ<!-- 글쓰기 페이지로 이동하는 함수 
    <script>
        function openWritePage(boardType) {
            location.href = '/writePage?boardType=' + boardType; // 글쓰기 페이지로 이동
        }
    </script> -->
</head>
<body>
	<div class="topper">
		<h1>
			<a href="/home"><img src="/resources/img/main.png"></a>
		</h1>
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


	<div class="content">
		<!-- 공지사항, 질문과 답변, 병원 소식, 자유게시판 섹션 -->

		<div class="board-box">
			<div class="board-header">
				<a href="/boardListAll?bbs_id=NOTI"><span>공지사항</span></a>
			</div>
			<div class="board-content" onclick="location.href='/boardListAll?bbs_id=NOTI'">
				<c:forEach var="k" items="${list1}">
					${k.wr_subject}
					<br>
				</c:forEach>
			</div>
		</div>


		<div class="board-box">
			<div class="board-header">
				<a href="/boardListAll?bbs_id=INQU"><span>문의사항</span></a> <a
					href="/boardOneListWrite?bbs_id=INQU"> <img
					src="/resources/img/greenplus.jpg" alt="추가 버튼">
				</a>
			</div>
			<div class="board-content" onclick="location.href='/boardListAll?bbs_id=INQU'">
				<c:forEach var="k" items="${list2}">
					${k.wr_subject}
					<br>
				</c:forEach>
			</div>
		</div>


		<div class="board-box">
			<div class="board-header">
				<a href="/boardListAll?bbs_id=CONS"><span>상담내역</span></a> <a
					href="/boardOneListWrite?bbs_id=CONS"> <img
					src="/resources/img/greenplus.jpg" alt="추가 버튼">
				</a>
			</div>
			<div class="board-content"  onclick="location.href='/boardListAll?bbs_id=CONS'">
				<c:forEach var="k" items="${list3}">
					${k.wr_subject}
					<br>
				</c:forEach>
			</div>
		</div>


		<div class="board-box">
			<div class="board-header">
				<a href="/boardListAll?bbs_id=FREE"><span>자유 게시판</span></a> <a
					href="/boardOneListWrite?bbs_id=FREE"> <img
					src="/resources/img/greenplus.jpg" alt="추가 버튼">
				</a>
			</div>
			<div class="board-content"  onclick="location.href='/boardListAll?bbs_id=FREE'">
				<c:forEach var="k" items="${list4}">
					${k.wr_subject}
					<br>
				</c:forEach>
			</div>
		</div>
	</div>


</body>
</html>