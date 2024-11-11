<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<h2>관리자 관리</h2>
					</div>


				</div>
				<div class="searchsection">
					<!-- 검색창  /  빈 div 건드리지 마시오 -->
					<div></div>
					<div class="searchbox">
						<!-- <input type="search">
                    <input type="submit" value="검색"> -->
					</div>
				</div>
				<!-- 테이블 박스 -->
				<div class="tablebox">

					<section>
						<div class="tableData">
							<table class="">
								<thead>
									<tr>
										<th><input type="checkbox" name="allmember"></th>
										<th>아이디</th>
										<th>비밀번호</th>
										<th>채팅관리</th>
										<th>팝업관리</th>
										<th>게시판관리</th>
										<th>관리자 권한레벨</th>
										<th>상태</th>
										<th>최근접속</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>

									<!-- 	<tr>
												<td><input type="checkbox" name="member"></td>
												<td >adminId1</td>
												<td></td>
												<td><input type="checkbox" ></td>
												<td><input type="checkbox" ></td>
												<td><input type="checkbox" ></td>
												<td><select name="level" id="level">
														<option value="1">슈퍼관리자</option>
														<option value="2">일반관리자</option>
												</select></td>
												<td>정상</td>
												<td></td>
												<td></td>
												<td></td>
												<td><button type="reset">삭제</button></td>
											</tr> -->
									<c:forEach var="k" items="${list}">
										<tr>
											<td><input type="checkbox" name="member"></td>
											<td>${k.admin_id}</td>
											<td>${k.admin_pw}</td>
											<!-- 권한 체크박스 추가 -->
											<td><input type="checkbox" name="chat_manage" value="o"
												<c:if test="${k.chat_auth == 'o'}">checked</c:if> disabled></td>
											<td><input type="checkbox" name="popup_manage" value="o"
												<c:if test="${k.popup_auth == 'o'}">checked</c:if> disabled></td>
											<td><input type="checkbox" name="board_manage" value="o"
												<c:if test="${k.board_auth == 'o'}">checked</c:if> disabled></td>
											<td>${k.authority_level}</td>
											<td>${k.status}</td>
											<td>${k.last_visit}</td>
											<!-- 관리 버튼 -->
											<td><a href="/admin_delete?admin_id=${k.admin_id}"
												style="text-decoration: none;">
													<button type="submit" style="margin-right: 10px;">삭제</button>
											</a> <a href="/admin_reg?admin_id=${k.admin_id}"
												style="text-decoration: none;">
													<button type="submit">수정</button>
											</a></td>
										</tr>
									</c:forEach>





								</tbody>

							</table>
						</div>
					</section>


					<div class="buttons">
						<button class="addmember"
							onclick="parent.location.href='/admin_create'">관리자 생성</button>
						
					</div>


				</div>
			</div>



		</div>



		<!--푸터 --------------------------------------------------------------------------- -->


		<div class="footer"></div>

	</div>



</body>
</html>