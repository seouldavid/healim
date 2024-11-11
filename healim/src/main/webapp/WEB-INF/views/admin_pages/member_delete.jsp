<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="/resources/css/admin.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
table {
	width: 500px;
}

th, td {
	text-align: center;
}

.table1 td {
	height: 40px;
}

.table2 td {
	height: 80px;
}
</style>
</head>
<script type="text/javascript">
	<c:if test="${pwdchk == 'fail'}">
	alert("비밀번호 틀림");
	</c:if>
</script>
<body>
	<!-- 다른 페이지 내용 -->
	<c:if test="${not empty error}">
		<script type="text/javascript">
			alert("${error}");
		</script>
	</c:if>
	<c:if test="${not empty update}">
		<script type="text/javascript">
			alert("${update}");
		</script>
	</c:if>


	<!-- 다른 페이지 내용 -->

	<!--탑1 --------------------------------------------------------------------------- -->
	<div class="page">
		<div class="top1">
			<div>
				<img class="bt_header" href="#"
					src="/resources/img/admin_img/logo.png" alt="header" />
			</div>
			<div class="administrator">ADMINISTRATOR</div>
			<div class="gohome">
				<div></div>
				<div class="house">
					<a href="/home"> <img class="houseimg"
						src="/resources/img/admin_img/check_img.svg">
						<button class="homepagebutton" style="cursor: pointer;">홈페이지</button>
					</a>
				</div>
				<div class="logoutbox">
					<a href="/login"> <img class="houseimg"
						src="/resources/img/admin_img/right-from-bracket-solid.svg">
						<button class="logoutbutton" style="cursor: pointer;">로그아웃</button>
					</a>
				</div>
			</div>
		</div>

		<!--탑2 --------------------------------------------------------------------------- -->
		<div class="main">
			<!-- 네비게이션--------------------------------------------------------------------------- -->
			<div class="nav">
				<ul class="nav_button">
					<li><a href="/index"><img class="nav_img"
							src="/resources/img/admin_img/button-0.svg" alt="메인페이지" /></a></li>
					<li><a href="/member"><img class="nav_img"
							src="/resources/img/admin_img/button-1.svg" alt="회원관리" /></a></li>
					<li><a href="/admin_board"><img class="nav_img"
							src="/resources/img/admin_img/button-2.svg" alt="게시판 관리" /></a></li>
					<li><a href="/hospital_info"><img class="nav_img"
							src="/resources/img/admin_img/button-3.svg" alt="병원정보수정" /></a></li>
					<li><a href="/admin"><img class="nav_img"
							src="/resources/img/admin_img/button-4.svg" alt="관리자관리" /></a></li>
				</ul>
			</div>
			<!-- 메인 테이블--------------------------------------------------------------------------- -->
			<div class="content">
				<div class="top2">
					<div class="top2text">
						<h2></h2>
					</div>
				</div>
				<div class="searchsection">
					<div></div>
					<div class="searchbox"></div>
				</div>
				<!-- 테이블 박스 -->
				<div class="tablebox">
					<div align="center">
						<form method="post">
							<table summary="회원 삭제">
								<caption>
									<h2>회원 삭제</h2>
									<br>
								</caption>
								<tbody>
									<tr>
										<th>:: 삭제 사유를 선택해 주세요 ::</th>
									</tr>
									<tr>
										<td align="left"><select name="member_delete_reason" required>
												<option value="" disabled selected>선택하세요</option>
												<option value="사용자의 삭제 요청">사용자의 삭제 요청</option>
												<option value="경고누적">경고누적</option>
												<option value="악성유저">악성유저</option>
										</select></td>
									</tr>
									<tr>
										<td><input type="hidden" name="mber_id"
											value="${mber_id}"> <input type="button" value="삭제"
											onclick="member_delete_ok(this.form)"> <input
											type="reset" value="취소" /> <input type="button" value="목록"
											onclick="member_list_go(this.form)"></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>

			<!--푸터 --------------------------------------------------------------------------- -->
			<div class="footer"></div>
		</div>
		<script type="text/javascript">
			function member_delete_ok(f) {
				f.action = "/member_delete_ok";
				f.submit();
			}

			function member_list_go(f) {
				f.action = "/member_list";
				f.submit();
			}
		</script>
</body>
</html>