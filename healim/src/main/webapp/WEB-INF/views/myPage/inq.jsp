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
	font-size: 30px; /* 기본 글씨 크기를 px 단위로 설정 */
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
	width: 100px; /* 기본 이미지 크기 */
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
	font-size: 20px; /* 기본 날짜 크기 */
}

.heart {
	cursor: pointer;
	width: 30px;
	height: 30px;
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

/* 미디어 쿼리 */
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

span {
	font-size: 15px;
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

	<div class="container">


		<div class="header">문의내역</div>
		<hr>
		<c:forEach var="k" items="${mvo_list}">
			<!-- 요양시설 목록 -->
			<div class="facility-item"
				onclick="location.href='boardOneList?subject=문의한제목';">
				<!-- subject를 직접부르는게 아닌, id값이 되야 할것!!! subject도 같이 불러와야하긴함   -->
				<img src="resources/img/7.jpg" alt="문의한 제목">
				<div class="facility-details">
					<h3>${k.wr_subject}</h3>
					<p>${k.crt_dt}</p>
				</div>
			</div>
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

	</div>
</body>
</html>