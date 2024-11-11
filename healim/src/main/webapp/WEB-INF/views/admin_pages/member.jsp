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
</head>

<body>
	<!-- 다른 페이지 내용 -->
	<c:if test="${not empty error}">
		<script type="text/javascript">
			alert("${error}");
		</script>
	</c:if>
	<c:if test="${not empty delete}">
		<script type="text/javascript">
			alert("${delete}");
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
						<h2>회원 관리</h2>
					</div>
				</div>
				<div class="searchsection">
					<div></div>
					<div class="searchbox"></div>
				</div>
				<!-- 테이블 박스 -->
				<div class="tablebox">
						<section>
							<div class="tableData">
								<table id="list">
									<thead>
										<tr>
											<th rowspan="2"><input type="checkbox" name="all_member"
												onclick="toggleAll(this)"></th>
											<th>아이디</th>
											<th rowspan="2">본인확인</th>
											<th>게시물 수</th>
											<th rowspan="2">신고횟수</th>
											<th>메일수신</th>
											<th>상태</th>
											<th rowspan="2">연락처</th>
											<th>최근접속</th>
											<th rowspan="2">관리</th>
										</tr>
										<tr>
											<th>닉네임</th>
											<th>댓글 수</th>
											<th>광고 차단</th>
											<th>권한</th>
											<th>가입일</th>
										</tr>
									</thead>
									<tbody id="tbody"></tbody>
								</table>
							</div>
							<div class="buttons" style="padding-top: 10px; padding-left: 10px;">
								<button class="select_all_delete">선택삭제</button>
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
	
	// 전체 선택 체크박스 기능
	function toggleAll(source) {
	    const checkboxes = document.querySelectorAll("input[name='member_select']");
	    checkboxes.forEach((checkbox) => {
	        checkbox.checked = source.checked;
	    });
	}
	
	// 하위 체크박스 선택 해제 시 전체 선택 체크박스 상태 업데이트
	$(document).on('change', "input[name='member_select']", function() {
	    const allChecked = $("input[name='member_select']").length === $("input[name='member_select']:checked").length;
	    $("input[name='all_member']").prop('checked', allChecked);
	});
	
	
	// ajax를 이용해서 DB정보 가져오기
 	function getMemberAuthList() {
		$.ajax({
			url : "/member_auth_list",
			method : "post",
			dataType : "xml",
			success : function(data) {  
				console.log(data);
				let tbody = "";
				$(data).find("member").each(function(i, obj){
					console.log($(this).find("active").text()); /* 0 */
					if ($(this).find("active").text() == 0) {
					
						tbody += "<tr>";
						tbody += "<td rowspan='2' style='text-align: center;'><input type='checkbox' name='member_select' id='member_select' value='" + $(this).find("mber_id").text()+ "'></td>";
						tbody += "<td>" + $(this).find("mber_id").text() + "</td>";
						tbody += "<td rowspan='2'>" + $(this).find("phone_chk").text() + "</td>";
						tbody += "<td>" + $(this).find("post_cnt").text() + "</td>";
						tbody += "<td rowspan='2'>" + $(this).find("violation_count").text() + "</td>";
						tbody += "<td>" + $(this).find("email_status").text() + "</td>";
						tbody += "<td>" + $(this).find("mber_status").text() + "</td>";
						tbody += "<td rowspan='2'>" + $(this).find("mbtlnum").text() + "</td>";
						tbody += "<td>" + $(this).find("login_dt").text() + "</td>";
						tbody += "<td rowspan='2'style='text-align: center;'><input type='button' value='수정' id='member_detail' style='margin: 5px;' onclick='location.href=\"/member_detail?mber_id=" + $(this).find("mber_id").text() + "\";'><input type='button' value='삭제' id='member_del' style='margin: 5px;' name='" + $(this).find("mber_id").text()+ "'></td>";
						tbody += "</tr>";
						tbody += "<tr>";
						tbody += "<td>" + $(this).find("mber_nm").text() + "</td>";
						tbody += "<td>" + $(this).find("reply_cnt").text() + "</td>";
						tbody += "<td>" + $(this).find("adv_status").text() + "</td>";
						tbody += "<td>" + $(this).find("mber_auth").text() + "</td>";
						tbody += "<td>" + $(this).find("sbscrb_de").text() + "</td>";
						tbody += "</tr><tr><td colspan='10' style='padding: 0px; height: 1px; background-color: lightgray;'></td></tr>";
					}else {
						tbody += "<tr><td  colspan='10' style='text-align: center; color: red;'>:: " + $(this).find("mber_id").text() + "님은 삭제된 회원 입니다 ::</td></tr>";
						tbody += "</tr><tr><td colspan='10' style='padding: 0px; height: 1px; background-color: lightgray;'></td></tr>";
					}
				});
				$("#tbody").append(tbody);
			},
			error : function(xhr, status, error) {
		        console.error("Error: " + error); // 오류 메시지 출력
		        console.error("Status: " + status); // 상태 메시지 출력
		        console.error("Response: " + xhr.responseText); // 응답 본문 출력
		    }
			/*  onclick="location.href='/member_detail?mber_id=' + $(this).find("mber_id").text()" */
		});
	}
	getMemberAuthList(); 
		
	// 삭제버튼 누르면 회원 삭제
/* 	$("#list").on("click", "#member_del", function() {
		if (confirm("정말 삭제 하시겠습니까?")) {
		$.ajax({
			url : "/member_delete",
			data : "mber_id=" + $(this).attr("name"),
			method : "post",
			dataType : "text",
			success : function (data) {
				if (data == '0') {
					alert("삭제 실패")
				}else if (data == '1') {
					$("#tbody").empty();
					getMemberAuthList();
				}
			},
			error : function () {
				alert("읽기실패");
			}
		});
		}else {
			alert("삭제가 취소 되었습니다.");
		}
	});
	 */
	 
	// 삭제버튼 누르면 회원 삭제
	 $("#list").on("click", "#member_del", function() {
	         const mber_id = $(this).attr("name");
	     if (confirm("정말" + mber_id + "님을 삭제 하시겠습니까?")) {
	         
	         // 서버에 mber_id 값을 전달하면서 이동
	         window.location.href = "/delete_member?mber_id=" + mber_id;
	     } else {
	         alert("삭제가 취소 되었습니다.");
	     }
	 });
	 
	// '선택삭제' 버튼 클릭 시 이벤트
	$(".select_all_delete").click(function() {
	    // 체크된 체크박스의 값을 배열로 수집
	    let selectedIds = [];
	    $("input[name='member_select']:checked").each(function() {
	        selectedIds.push($(this).val());
	    });

	    // 선택된 회원이 없는 경우 경고 메시지 표시
	    if (selectedIds.length === 0) {
	        alert("삭제할 회원을 선택해주세요.");
	        return;
	    }

	    // 삭제 확인
	    if (confirm("선택한 회원을 정말 삭제하시겠습니까?")) {
	        $.ajax({
	            url: "/member_delete_multiple",
	            method: "POST",
	            data: JSON.stringify(selectedIds),
	            contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            success: function(data) {
	                if (data.success) {
	                    alert("선택한 회원이 삭제되었습니다.");
	                    $("#tbody").empty();
	                    getMemberAuthList(); // 테이블 갱신
	                } else {
	                    alert("삭제에 실패했습니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	                alert("삭제 중 오류가 발생했습니다.");
	                console.error("Error:", error);
	                console.error("Status:", status);
	                console.error("Response:", xhr.responseText);
	            }
	        });
	    }
	});
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>