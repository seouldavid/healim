<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내가 쓴 글</title>
<link rel="stylesheet" href="style.css">


<style>

/* 기존 스타일 유지 */
.logo {
	font-size: 60px;
	color: #333;
	text-decoration: none;
	text-align: center; /* 가운데 정렬 */
	margin-bottom: 30px;
	margin-top: 50px; /* 상단 여백 추가 */
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family:; /* 모든 글자에 Dongle 폰트 적용 */
	background-color: #fdfdfd;
	font-size: 25px; /* 기본 글씨 크기를 px 단위로 설정 */
}

.container {
	width: 80%; /* 두 페이지에 동일한 너비 설정 */
	max-width: 800px; /* 최대 너비를 설정하여 큰 화면에서는 제한 */
	margin: 20px auto; /* 중앙 정렬을 위해 자동 여백 */
	padding: 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.content {
	width: 100%; /* 컨테이너 안에서 100%를 차지하게 설정 */
	font-size: 25px;
}

@media ( max-width : 800px) {
	.content {
		width: 90%; /* 화면 크기가 작아지면 너비를 줄임 */
		padding: 20px;
	}
}

.content h2 {
	font-size: 40px;
	margin-bottom: 20px;
	text-align: center;
}

.posts {
	list-style: none;
}

.posts li {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	justify-content: space-between;
}

.posts li a {
	text-decoration: none;
	font-size: 25px;
}

.status {
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 14px;
}

.pending {
	background-color: #E2E2F1;
	color: #7E7E7E;
}

.answered {
	background-color: #E2EBFF;
	color: #007BFF;
}

.title {
	flex: 1;
	font-size: 18px;
	color: black;
	margin-left: 15px;
}

.date {
	color: #7E7E7E;
	font-size: 14px;
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

@media ( max-width : 1200px) {
	body {
		font-size: 14px; /* 화면 크기가 작아질 때 기본 글씨 크기 */
	}
	.logo a {
		font-size: 20px; /* 작은 화면에서 로고 글씨 크기 */
	}
	.header {
		font-size: 20px; /* 작은 화면에서 헤더 크기 */
	}
	.facility-item img {
		width: 50px; /* 작은 화면에서 이미지 크기 */
	}
	.facility-details h3 {
		font-size: 18px; /* 작은 화면에서 제목 크기 */
	}
	.facility-details p {
		font-size: 14px; /* 작은 화면에서 날짜 크기 */
	}
}

.write-button {
	display: inline-block;
	padding: 10px 20px;
	font-size: 18px;
	color: white;
	background-color: #007BFF; /* 버튼 배경색 */
	border: none;
	border-radius: 5px;
	text-decoration: none;
	text-align: right;
	margin-top: 10px; /* 상단 여백 추가 */
	float: right; /* 오른쪽으로 정렬 */
}

.write-button:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
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
	margin-top: 35px;
}

.disable {
	color: silver;
}

.pagination {
	display: flex;
	justify-content: center;
	list-style: none;
	gap: 20px;
}

.now {
	border: 1px solid black;
	background: black;
	color: white;
	font-weight: bold;
}

ol {
	padding-left: 0 px;
}

ol li:hover {
	border: 1px solid #474747;
	background: #474747;
	color: white;
	font-weight: bold;
}

li {
	border: 1px solid white;
	padding: 0px 12px;
	border-radius: 50%;
}
span{
font-size: 15px;
}

</style>
</head>
<body>

	<!-- 로고를 메인 컨테이너 밖으로 이동 -->
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

	<div class="container">
		<main class="content">
			<h2>내가 쓴 글</h2>
			<c:forEach var="k" items="${mvo_list}">
			<ul class="posts">
				<li>
				<c:choose>
				<c:when test="${k.wr_subject == null}">
				
				<a href="/hospitalConsultDetail?id=1" class="title"><span>(댓글)${k.wr_content}</span>
						</a> 
				</c:when>
				<c:when test="${k.parent_id == null}">
				<a href="/hospitalConsultDetail?id=1" class="title">[게시글]${k.wr_subject}
						</a> 
				</c:when>
				<c:otherwise>
				<a href="/hospitalConsultDetail?id=1" class="title">[답글]${k.wr_subject}
						</a> 
				</c:otherwise>
				</c:choose>
				
						
						<span class="date">${k.crt_dt}</span></li>
				<hr>
			</ul>
			</c:forEach>
			
			<ol class="pagination">
			<c:choose>
				<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
					<li class="disable">이전으로</li>
				</c:when>
				<c:otherwise>
					<li><a
						href="/myPost?cPage=${paging.beginBlock - paging.pagePerBlock}">이전으로</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}"
				step="1" var="k">

				<%-- 현재페이지 (링크X)와 현재 페이지가 아닌 것을 구분하자. --%>
				<c:if test="${k == paging.nowPage }">
					<li class="now">${k}</li>
				</c:if>
				<c:if test="${k != paging.nowPage }">
					<li><a href="/myPost?cPage=${k}">${k}</a></li>
				</c:if>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.endBlock >= paging.totalPage }">
					<li class="disable">다음으로</li>
				</c:when>
				<c:otherwise>
					<li><a
						href="/myPost?cPage=${paging.beginBlock + paging.pagePerBlock}">다음으로</a></li>
				</c:otherwise>
			</c:choose>

		</ol>
			<div style="text-align: right;">
				<!-- 오른쪽 정렬을 위한 div 추가 -->

				<!-- 글쓰기 버튼 추가 -->
			</div>
		</main>
	</div>



</body>
</html>