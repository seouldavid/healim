<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 - 글 상세페이지 (boardOneList)</title>
<style>
/* 전체 배경 */
body {
	font-family: Arial, sans-serif;
	background-color: #f4f6f9;
	color: #333;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

/* 메인 컨텐츠 스타일 */
.container {
	width: 80%;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin: 40px auto;
}

/* 제목 스타일 */
.container h2 {
	font-size: 24px;
	color: #333;
	/* margin-bottom: 10px; */
	border-bottom: 2px solid #4285f4;
	/* padding-bottom: 10px; */
}

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
}

/* 테이블 헤더 */
thead th {
	background-color: #4285f4;
	color: #fff;
	font-size: 20px;
	padding: 15px;
	text-align: left;
}

/* 테이블 본문 */
tbody tr {
	transition: background-color 0.3s;
}

tbody {
	padding: 15px 20px;
	font-size: 16px;
	color: #333;
	line-height: 1.6;
	text-align: center;
}

/* 본문 내용 스타일 */
.content {
	margin-top: 10px;
	padding: 10px;
	font-size: 16px;
	color: #444;
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

.username h2 {
	text-align: right;
	border: none;
	color: #6f6d6d;
}

div.username {
	margin: 0;
	padding: 0;
}

span {
	font-size: large;
	color: gray;
}

form {
	text-align: center;
}
</style>
</head>
<script type="text/javascript">
	<c:if test="${passwordchk == 'fail'}">
	alert("비밀번호 틀림");
	</c:if>
</script>
<body>

	<div class="container">
		<div class="logoheader" onclick="location.href='/home'">
			<img class="logoimg" src="/resources/img/main.png">
		</div>

		<!-- 제목 -->
		<form method="post" enctype="multipart/form-data"
			action="/comment_deleteOk">
			<h2>댓글 삭제 : "${mvo.wr_subject}"</h2>

		

			<table>

				<tbody>
					<label>비밀번호 : </label>
					<input type="password" name="passwordInput">

					<!-- 로그인 아이디 실제 변수명 쓰기(일치할때만 나옴). 평소엔 안뜨는게 정상 -->
					<input type="hidden" name="wr_id" value="${mvo.wr_id}">
					<input type="hidden" name="parent_id" value="${mvo.parent_id}">
					<input type="hidden" name="bbs_id" value="${mvo.bbs_id}">
					<input type="hidden" name="mber_id" value="${mvo.mber_id}">
					<input type="hidden" name="mber_nm" value="${mvo.mber_nm}">
					<input type="hidden" name="password" value="${mvo.password}">
					<input type="submit" value="삭제">
					<input type="button" value="취소" onclick="location.href='/boardOneList?wr_id=${mvo.parent_id}&bbs_id=${mvo.bbs_id}'">
					<%-- </c:if> --%>

				</tbody>
			</table>

		</form>
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

</body>
</html>
