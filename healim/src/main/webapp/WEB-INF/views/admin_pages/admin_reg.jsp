<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="/resources/css/admin.css" rel="stylesheet" />
</head>



<body>
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
							src="/resources/img/admin_img/button-0.svg" alt="메인페이지 " /></a></li>
					<li><a href="/member"><img class="nav_img"
							src="/resources/img/admin_img/button-1.svg" alt="회원관리" /></a></li>
					<li><a href="/admin_boatd"><img class="nav_img"
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
						<h2>관리자 수정 페이지</h2>
					</div>


				</div>
				<div class="searchsection">
					<!-- 검색창  /  빈 div 건드리지 마시오 -->
					<div></div>
					<div class="searchbox">
						<input type="search"> <input type="submit" value="검색">
					</div>
				</div>
				<!-- 테이블 박스 -->
				<div class="tablebox">
					<section>
						<form action="/admin_detail_ok" method="post">
							<table class="">
								<thead>
									<tr class="headrow">
										<th class="firsthead">구분</th>
										<th>내 용</th>
									</tr>
								</thead>
								<tbody>


									<tr>
										<td>비밀번호</td>
										<td><input type="text" name="admin_pw"
											value="${avo.admin_pw}"></td>
									</tr>
									<tr>
										<td>권한레벨</td>
										<td colspan="3"><select name="authority_level" id="level"
											value="${avo.authority_level}">
												<option value="super">슈퍼관리자</option>
												<option value="normal">일반관리자</option>
										</select></td>
									</tr>
									<c:if test="${avo.chat_auth == 'x'}">
									<tr>
										<td>채팅 관리</td>
										<td><input class="check" type="checkbox" name="chat_auth" value="o" >
											활성화</td>
									</tr>
									</c:if>
									<c:if test="${avo.chat_auth == 'o'}">
									<tr>
										<td>채팅 관리</td>
										<td><input type="checkbox" name="chat_auth" value="o" checked>
											활성화</td>
									</tr>
									</c:if>
									<c:if test="${avo.popup_auth == 'x'}">
									<tr>
										<td>팝업 관리</td>
										<td><input type="checkbox" name="popup_auth" value="o" >
											활성화</td>
									</tr>
									</c:if>
									<c:if test="${avo.popup_auth == 'o'}">
									<tr>
										<td>팝업 관리</td>
										<td><input type="checkbox" name="popup_auth" value="o" checked>
											활성화</td>
									</tr>
									</c:if>
									<c:if test="${avo.board_auth == 'x'}">
									<tr>
										<td>게시판 관리</td>
										<td><input type="checkbox" name="board_auth" value="o" >
											활성화</td>
									</tr>
									</c:if>
									<c:if test="${avo.board_auth == 'o'}">
									<tr>
										<td>게시판 관리</td>
										<td><input type="checkbox" name="board_auth" value="o" checked>
											활성화</td>
									</tr>
									</c:if>
									
									<tr>
										<td>상태</td>
										<td><input type="text" name="status"
											value="${avo.status}"></td>
									</tr>
									<tr>
										<td colspan="3"><input type="hidden" name="admin_id"
											value="${avo.admin_id}"><input type="submit"
											value="등록">
											<button id="button1" type="reset"
												onclick="location.href='/index'">취소</button></td>
									</tr>



								</tbody>
							</table>
						</form>

					</section>

				</div>
			</div>



		</div>



		<!--푸터 --------------------------------------------------------------------------- -->


		<div class="footer"></div>

	</div>



</body>
</html>