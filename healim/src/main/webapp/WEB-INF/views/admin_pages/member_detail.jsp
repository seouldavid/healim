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
th, td {
	text-align: center;
}

.table1 td{
	height: 40px;
}
.table2 td {
	height: 80px;
}
</style>
</head>

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
						<h2>회원 권한 수정 페이지</h2>
					</div>
				</div>
				<div class="searchsection">
					<div></div>
					<div class="searchbox"></div>
				</div>
				<!-- 테이블 박스 -->
				<div class="tablebox">
					<form action="/setMemberAuthUpdate" method="post">
						<section>
							<div class="tableData">
								<table>
									<thead>
										<tr>
											<th>아이디</th>
											<th>닉네임</th>
											<th>휴대폰 인증 여부</th>
											<th>보유 게시물 수</th>
											<th>총 댓글 수</th>
											<th>신고횟수</th>
										</tr>
									</thead>
									<tbody class="table1">
									<tr>
										<td>${mvo.mber_id}</td>
										<td>${mvo.mber_nm}님</td>
										<td>${mvo.phone_chk}</td>
										<td>${mvo.post_cnt}개</td>
										<td>${mvo.reply_cnt}개</td>
										<td>${mvo.violation_count}회</td>
									</tr>
									</tbody>
									</table>
									<table id="list" style="margin-top: 80px;">
									<thead>
									<tr>
											<th>메일수신 여부</th>
											<th>광고 차단 여부</th>
											<th>회원 상태</th>
											<th>권한</th>
											<th>연락처</th>
											<th>가입일 일시</th>
											<th>최근접속 일시</th>
											<th>관리</th>
									</tr>
									</thead>
									<tbody class="table2">
									<tr>
										<!-- 메일 수신 여부 -->
										<td><select name="email_status">
												<option value="Y"
													${mvo.email_status == 'Y' ? 'selected' : ''}>수신</option>
												<option value="N"
													${mvo.email_status == 'N' ? 'selected' : ''}>차단</option>
										</select></td>

										<!-- 광고 차단 여부 -->
										<td><select name="adv_status">
												<option value="Y" ${mvo.adv_status == 'Y' ? 'selected' : ''}>차단</option>
												<option value="N" ${mvo.adv_status == 'N' ? 'selected' : ''}>허용</option>
										</select></td>

										<!-- 회원 상태 -->
										<td><select name="mber_status">
												<option value="active"
													${mvo.mber_status == 'active' ? 'selected' : ''}>활성</option>
												<option value="suspended"
													${mvo.mber_status == 'suspended' ? 'selected' : ''}>정지</option>
												<option value="dormant"
													${mvo.mber_status == 'dormant' ? 'selected' : ''}>휴면</option>
										</select></td>

										<!-- 권한 -->
										<td><select name="mber_auth">
												<option value="1" ${mvo.mber_auth == '1' ? 'selected' : ''}>읽기</option>
												<option value="2" ${mvo.mber_auth == '2' ? 'selected' : ''}>읽기
													및 쓰기</option>
										</select></td>
										<td>${mvo.mbtlnum}</td>
										<td>${mvo.login_dt}</td>
										<td>${mvo.sbscrb_de}</td>
										<td style="text-align: center;">
										<input type="hidden" name="mber_id" value="${mvo.mber_id}"> 
										<input type="submit" value="저장" style="margin: 5px;"> 
										<input type="reset" value="취소" style="margin: 5px;"></td>
									</tr>
									</tbody>
							</table>	
							</div>
							<div class="buttons" style=" text-align: right; padding-top: 20px; padding-right: 20px;">
								<input type="button" value="회원 정보 삭제" onclick="delete_member(this.form)" style="height: 30px; display: inline-block;">
							</div>
							<div class="buttons"
								style="text-align: center; padding-top: 30px; padding-right: 25px; ">
								<a href="/member_list" style="text-decoration: none;">
    							<input type="button" value="회원 목록" style="width: 100px; height: 30px;">
								</a>
							</div>
						</section>
					</form>
				</div>
			</div>
		</div>

		<!--푸터 --------------------------------------------------------------------------- -->
		<div class="footer"></div>
	</div>
	<script type="text/javascript">
	function delete_member(f) {
		const mber_id = f.mber_id.value; // 폼에서 mber_id 값을 가져옵니다.
		if (confirm("정말" + mber_id + "님을 삭제 하시겠습니까?")) {
			f.action = "/delete_member"; // 삭제할 경로 설정
			f.submit(); // 폼 제출
		} else {
			alert("삭제가 취소되었습니다."); // 취소 메시지
		}
	}
	</script>

</body>
</html>