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

tbody td {
	padding: 15px 20px;
	font-size: 16px;
	color: #333;
	line-height: 1.6;
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
.comment{
  display: flex;
    flex-direction: column;
    padding-left: 0;
    width: 100%;
    text-align: left;
    margin: 0;
}
</style>
</head>

<body>

	<div class="container">
		<div class="logoheader" onclick="location.href='/home'">
			<img class="logoimg" src="/resources/img/main.png">
		</div>

		<!-- 제목 -->
		<form method="post" enctype="multipart/form-data" action="">
			<input type="button" value="뒤로 가기" onclick="boardListAll(this.form)">
			<h2>${mvo.wr_subject}</h2>

			<table>
				<thead>
					<tr>
						<th>지적 재산권 침해 또는 위반 게시물은 사전 통보 없이 삭제될 수 있습니다.</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!-- 작성자 정보 -->
							<div class="username">
								<h2>
									<span>작성자 :</span> ${mvo.mber_nm}
								</h2>
								<h2>
									<span>작성일자 :</span> ${mvo.crt_dt}  <!-- onelist에선 시간 정확히 보이게 하자 -->
								</h2>
								<h2>
									<span>조회수 :</span> ${mvo.rdcnt}
								</h2>
							</div> <!-- 본문 내용 -->
							<div class="content">
								<!-- Summernote 내용 표시 -->
								<div>
									<c:out value="${mvo.wr_content}" escapeXml="false" />
								</div>

								<!-- 첨부파일 섹션 -->
								<div class="attachments">
									<h3>첨부파일:</h3>
									<c:if test="${not empty mvo.atch_file_id}">
										<ul>
											<li><a
												href="/boardDownloadFile?atch_file_id=${mvo.atch_file_id}">
													<img src="resources/upload/${mvo.atch_file_id}"
													style="width: 80px">
											</a>${mvo.atch_file_id} <!-- 파일명을 표시합니다 --></li>
										</ul>
									</c:if>
								</div>
							</div> <!-- 수정/삭제 버튼 --> <%-- <c:if test="${mvo.mber_id == sessionUser}"> --%>
							<!-- 로그인 아이디 실제 변수명 쓰기(일치할때만 나옴). 평소엔 안뜨는게 정상 --> 
							<input type="hidden" name="wr_id" value="${mvo.wr_id}"> 
							<input type="hidden" name="bbs_id" value="${mvo.bbs_id}"> 
							<input type="hidden" name="mber_id" value="${mvo.mber_id}">  
							<input type="hidden" name="mber_nm" value="${mvo.mber_nm}"> 
							<input type="hidden" name="password" value="${mvo.password}"> 
							<c:if test="${mvo.bbs_id !='NOTI'}">
								<c:if test="${mvo.parent_id ==NULL}">
								<input type="button" value="답글" onclick="boardOneListWrite2()">
								</c:if>
								<input type="button" value="신고" onclick="boardOneListIssue(this.form)">
								<c:if test="${sessionUserId==mvo.mber_id}">
								<input type="button" value="수정" onclick="boardOneListUpdate(this.form)">
								<input type="button" value="삭제" onclick="boardOneListDelete(this.form)">
								</c:if>
							</c:if> <%-- </c:if> --%>
						</td>
					</tr>
				</tbody>
			</table>

		</form>

		<br>
		<div class="comment">
			<%-- 댓글 입력 창 --%>
			<div style="padding: 10px; width: 100%; margin-left: 0px;">
				<form action="/comment_insert" method="post">
					<fieldset style="border: none">
						<p>
							이름 : ${mber_nm} <!-- 임시값 -->
						</p>
						<p>
							
							<textarea rows="3" cols="300" name="wr_content" style="width: 100%; " required></textarea>
							<%-- 댓글 저장시 어떤 원글의 댓글인지 저장해야 한다. --%>
							<input type="hidden" name="mber_id" value="${sessionUserId}"> <!-- 임시값. 댓글도 똒같은 postid 변수 쓴다.(같은 게시물로 침) 단. 원글이 아닌,  현재 로그인된사람기준. -->
							<%-- <input type="hidden" name="mber_nm" value="NAME전하윤${sessionUser.user_name}">  username은  세션에 저장안한다 --%>
							<%-- <input type="hidden" name="password" value="1111${sessionUser.user_password}"> 비밀번호는 세션에 저장하지않음 --%>
							<input type="hidden" name="bbs_id" value="${mvo.bbs_id}"> 	<!-- 게시판은 bbsid 리다이렉트용으로 쏴줘야함 -->
							<input type="hidden" name="parent_id" value="${mvo.wr_id}"> <!-- 원글의 mvo.wr_id는 parent id -->
							<input type="hidden" name="answer_at" value="Y"> <!-- 원글의 mvo.wr_id는 parent id -->
							<input type="submit" value="댓글저장">
					</fieldset>
				</form>
			</div>

			<%-- 댓글 출력 창 --%>
			<div style="display: table; margin: 0 auto;">
				<c:forEach var="k" items="${list}">
				<c:if test="${k.wr_active =='0'||k.sort_ordr =='0'}">
					<div
						style="border: 1px solid #cc00cc; width: 580px; margin: 5px; padding: 5px;">
						<form action="/comment_delete" method="post">
							<p>이름 : ${k.mber_nm}</p>
							<p>내용 :
							<pre>${k.wr_content}</pre>
							</p>
							<p>날짜 : ${k.crt_dt}</p>
							<%-- 실제는 로그인 성공후  관리자이거나 글쓴 본인 경우만 삭제가능--%>
							<input type="submit" value="댓글삭제">
							<%-- 컨틀로러가서 DB 삭제후 다시 이곳으로 와야 한다.(나중에 ajax로 변경하자)  --%>
							<input type="hidden" name="mber_id" value="${k.mber_id}"> 
							<input type="hidden" name="parent_id" value="${k.parent_id}"> 
							<input type="hidden" name="bbs_id" value="${k.bbs_id}"> 
							<input type="hidden" name="wr_id" value="${k.wr_id}"> 
							<input type="hidden" name="password" value="${k.password}">  
							
						</form>
					</div>
					</c:if>
				</c:forEach>
			</div>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
		function boardOneListUpdate(f) {
			f.action = "/boardOneListUpdate";
			f.submit();
		}
		function boardOneListDelete(f) {
			f.action = "/boardOneListDelete";
			f.submit();
		}
		function boardListAll(f) {
			var bbsId = "${mvo.bbs_id}"; // JSP 변수를 JavaScript 변수에 할당
			console.log("bbs아이디출력하기" + bbsId); // 콘솔에 출력
			f.action = "/boardListAll";
			f.submit();
		}
		function boardOneListWrite2() {
			var bbsId = "${mvo.bbs_id}";
			var parentId = "${mvo.wr_id}";
			  window.location.href = "/boardOneListWrite2?bbs_id=" + bbsId + "&parent_id=" + parentId;
			
		}
		function boardOneListIssue(f) {
			var bbsId = "${mvo.bbs_id}";
			var wr_id = "${mvo.wr_id}";
			var sessionUserId = "${sessionUserId}";
			  window.location.href = "/boardOneListIssue?bbs_id=" + bbsId + "&wr_id=" + wr_id+ "&sessionUserId=" + sessionUserId;
			
		}
	</script>
</body>
</html>
