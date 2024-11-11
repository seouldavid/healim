<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 전체 게시물</title>
<style>
/* 전체 배경 설정 */
body {
	font-family: Arial, sans-serif;
	background-color: #f0f2f5;
	color: #333;
	margin: 0;
	padding: 0;
}

/* 메인 컨텐츠 스타일 */
.container {
	width: 80%;
	margin: 40px auto;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
	padding: 30px;
}

/* 제목 스타일 */
.container h2 {
	font-size: 24px;
	color: #333;
	margin-bottom: 20px;
	border-bottom: 2px solid #4285f4;
	padding-bottom: 10px;
}

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

/* 테이블 헤더 스타일 */
thead th {
	background-color: #4285f4;
	color: #fff;
	font-size: 18px;
	padding: 15px 10px;
	text-align: left;
}

/* 테이블 본문 스타일 */
tbody tr {
	border-bottom: 1px solid #ddd;
	transition: background-color 0.3s;
}

tbody tr:hover {
	background-color: #f5f7fa;
}

tbody td {
	padding: 15px 10px;
	font-size: 16px;
	color: #333;
	text-align: left;
}

/* 링크 스타일 */
.subjectItem {
	text-decoration: none;
	color: #333;
	font-weight: 500;
	transition: color 0.2s ease;
}

.subjectItem:hover {
	color: #0056b3;
}

/* 방문한 링크의 스타일 */
.subjectItem:visited {
	color: #333;
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

thead th:first-child, tbody td:first-child {
	text-align: left; /* 공지사항목록을 왼쪽 정렬 */
}

thead th:nth-child(2), thead th:nth-child(3), tbody td:nth-child(2),
	tbody td:nth-child(3) {
	text-align: right; /* 작성자와 등록일자를 오른쪽 정렬 */
}
/* 테이블 열 너비 설정 */
thead th:nth-child(1), tbody td:nth-child(1) {
	width: 70%;
	text-align: left;
}

thead th:nth-child(2), tbody td:nth-child(2) {
	width: 15%;
	text-align: right;
}

thead th:nth-child(3), tbody td:nth-child(3) {
	width: 15%;
	text-align: right;
}

thead th:nth-child(3) {
	width: 15%;
	text-align: center; /* 등록일자 제목을 왼쪽 정렬 */
	padding-left: 150px; /* 약간의 왼쪽 여백을 추가 */
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	padding-left: 0;
	list-style: none;
	border-radius: 0.35rem;
}

.page-link {
	position: relative;
	display: block;
	padding: 0.5rem 0.75rem;
	margin-left: -1px;
	line-height: 1.25;
	color: #959D90;
	background-color: #fff;
	border: 1px solid #dddfeb;
}

.page-link:hover {
	z-index: 2;
	color: #224abe;
	text-decoration: none;
	background-color: #eaecf4;
	border-color: #dddfeb;
}

.page-link:focus {
	z-index: 3;
	outline: 0;
	box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
}

.page-item:first-child .page-link {
	margin-left: 0;
	border-top-left-radius: 0.35rem;
	border-bottom-left-radius: 0.35rem;
}

.page-item:last-child .page-link {
	border-top-right-radius: 0.35rem;
	border-bottom-right-radius: 0.35rem;
}

.page-item.active .page-link {
	z-index: 3;
	color: #fff;
	background-color: #4e73df;
	border-color: #4e73df;
}

.page-item.disabled .page-link {
	color: #858796;
	pointer-events: none;
	cursor: auto;
	background-color: #fff;
	border-color: #dddfeb;
}

.pagination-lg .page-link {
	padding: 0.75rem 1.5rem;
	font-size: 1.25rem;
	line-height: 1.5;
}

.pagination-lg .page-item:first-child .page-link {
	border-top-left-radius: 0.3rem;
	border-bottom-left-radius: 0.3rem;
}

.pagination-lg .page-item:last-child .page-link {
	border-top-right-radius: 0.3rem;
	border-bottom-right-radius: 0.3rem;
}

.pagination-sm .page-link {
	padding: 0.25rem 0.5rem;
	font-size: 0.875rem;
	line-height: 1.5;
}

.pagination-sm .page-item:first-child .page-link {
	border-top-left-radius: 0.2rem;
	border-bottom-left-radius: 0.2rem;
}

.pagination-sm .page-item:last-child .page-link {
	border-top-right-radius: 0.2rem;
	border-bottom-right-radius: 0.2rem;
}

.buttons {
	display: flex;
	justify-content: space-between;
	height:30px;
}

#gray {
	color: gray;
}

  .search-container {
    background-color: #F7F7F7; 
    width: 30%;
    height: 55px;
    border: 1px solid #ddd;
    margin: 0 auto;
    display: flex;
    justify-content: center; 
    align-items: center; 
    }
    .search-form {
      height: 37px;
      display: flex;
    }
    .search-option {
      width: 100px;
      height: 100%;
      outline: none;
      margin-right: 5px;
      border: 1px solid #ccc;
      color: gray;
    }

    .search-option > option {
      text-align: center;
    }

    .search-input {
      color: gray;
      background-color: white;
      border: 1px solid #ccc;
      height: 70%;
      width: 300px;
      font-size: 15px;
      padding: 5px 7px;
    }
    .search-input::placeholder {
      color: gray;
    }

    .search-button {
      /* 메뉴바의 검색 버튼 아이콘  */
      width: 20%;
      height: 100%;
      background-color: rgb(22, 22, 22);
      color: rgb(209, 209, 209);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 15px;
      margin-left: 5px;
    }
    .search-button:hover {
      color: rgb(165, 165, 165);
    }
</style>
</head>
<body>
	<div class="container">
		<div class="logoheader" onclick="location.href='/home'">
			<img class="logoimg" src="/resources/img/main.png">
		</div>
		<div class="buttons">
			<input type="button" value="뒤로 가기"
				onclick="location.href='/mainBoard'">
				
				<!-- 검색버튼-->
				<div class="search-container">
					<form action="<c:url value="/boardListAll"/>" class="search-form"
						method="get">
						<select class="search-option" name="option">
							<option value="A"
								${pg.sc.option=='A' || pg.sc.option=='' ? "selected" : ""}>전체</option>
							 <option value="S" ${pg.sc.option=='S' ? "selected" : ""}>제목</option>
							<option value="W" ${pg.sc.option=='W' ? "selected" : ""}>작성자</option>
						</select> <input type="text" name="keyword" class="search-input"
							value="${pg.sc.keyword}" placeholder="검색어를 입력해주세요">
							<input type="hidden" name=bbs_id value=${bbs_id}>
						<input type="submit" class="search-button" value="검색">
					</form>                                  
				</div>
				
				
				
			<c:if test="${bbs_id !='NOTI'}">
				<input type="button" value="글쓰기"
					onclick="location.href='/boardOneListWrite?bbs_id=${bbs_id}'">
			</c:if>
		</div>
		<h2>${bbsName}</h2>
		<table>
			<thead>
				<tr>
					<th>${bbsName}목록:${totalCnt}건</th>
					<th>작성자</th>
					<th>등록일자</th>
				</tr>

			</thead>
			<tbody>
				<!-- boardList의 각 항목을 행으로 출력 -->
				<c:forEach var="k" items="${list}">
					<c:if test="${k.answer_at != 'Y' }">
						<!-- 댓글이 아닌경우에만 보이게 하기. -->
						<tr>
							<td><a
								href="/boardOneList?bbs_id=${k.bbs_id}&wr_id=${k.wr_id}"
								class="subjectItem"> <c:choose>
										<c:when test="${k.parent_id == null ||k.parent_id == ''}">
                ${k.wr_subject}
                  </c:when>
										<c:otherwise>
											<span id="gray"> ㄴ ${k.wr_subject}</span>
										</c:otherwise>
									</c:choose>
							</a></td>
							<td>${k.mber_nm}</td>
							<!-- 작성자 -->
							<td>${k.start_dt}</td>
							<!-- 등록일자 -->
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징기법 -->
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<!-- 이전 페이지 링크 -->
					<c:if test="${totalCnt!=null && totalCnt!=0}">
						<c:if test="${pg.showPrev}">
							<li class="page-item" id="pre"><a class="page-link"
								href="<c:url value='/boardListAll'/>${pg.sc.getQueryString(pg.beginPage-1)}&bbs_id=${sc.bbs_id}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<!-- 페이지 번호 링크 -->
						<c:forEach var="i" begin="${pg.beginPage}" end="${pg.endPage}">
							<li class="page-item ${pg.sc.page == i ? 'active' : ''}"><a
								class="page-link"
								href="<c:url value='/boardListAll'/>${pg.sc.getQueryString(i)}&bbs_id=${sc.bbs_id}">
									${i} </a></li>
						</c:forEach>

						<!-- 다음 페이지 링크 -->
						<c:if test="${pg.showNext}">
							<li class="page-item" id="next"><a class="page-link"
								href="<c:url value='/boardListAll'/>${pg.sc.getQueryString(pg.endPage + 1)}&bbs_id=${sc.bbs_id}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</c:if>
				</ul>
			</nav>
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
</body>
</html>
