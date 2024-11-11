<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Board List</title>
    <link href="/resources/css/admin.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
    table tfoot ol.paging {
        list-style: none;
        text-align: center; /* 가운데 정렬 */
        padding: 0;
    }

    table tfoot ol.paging li {
        display: inline-block; /* inline-block으로 변경하여 중앙 배치 */
        margin-right: 8px;
    }

    table tfoot ol.paging li a {
        display: block;
        padding: 3px 7px;
        border: 1px solid #959D90;
        color: #223030;
        font-weight: bold;
        text-decoration: none;
    }

    table tfoot ol.paging li a:hover {
        background: #959D90;
        color: white;
        font-weight: bold;
    }

    .disable {
        padding: 3px 7px;
        border: 1px solid silver;
        color: silver;
    }

    .now {
        padding: 3px 7px;
        border: 1px solid #223030;
        background: #223030;
        color: white;
        font-weight: bold;
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
    <!--탑1 --------------------------------------------------------------------------- -->
    <div class="page">
    <div class="top1">
        <div><img class="bt_header" href="#" src="/resources/img/admin_img/logo.png" alt="header" /></div>        
        <div class="administrator">ADMINISTRATOR</div>
        <div class="gohome">
	        <div></div>
	        <div class="house"> 
		        <a href="/home">
			        <img class="houseimg" src="/resources/img/admin_img/check_img.svg">
			        <button class="homepagebutton"  style="cursor: pointer;">홈페이지</button>
		        </a>
	        </div>
	        <div class="logoutbox">
		        <a href="/login">
			        <img class="houseimg" src="/resources/img/admin_img/right-from-bracket-solid.svg">
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
                <li><a href="/index"><img class="nav_img" src="/resources/img/admin_img/button-0.svg"
                      alt="메인페이지 " /></a></li>
                <li><a href="/member"><img class="nav_img" src="/resources/img/admin_img/button-1.svg"
                      alt="회원관리" /></a></li>
                <li><a href="/admin_board"><img class="nav_img" src="/resources/img/admin_img/button-2.svg"
                      alt="게시판 관리" /></a></li>
                <li><a href="/hospital_info"><img class="nav_img" src="/resources/img/admin_img/button-3.svg"
                      alt="병원정보수정" /></a></li>
                <li><a href="/admin"><img class="nav_img" src="/resources/img/admin_img/button-4.svg"
                      alt="관리자관리" /></a></li>
             </ul>

        </div>
<!-- 메인 테이블--------------------------------------------------------------------------- -->
<div class="content">
        <!-- 타이틀 -->
    <div class="top2">
        <div class="top2text">
            <h2>게시판 관리 </h2>
        </div>   
    </div>
            <div class="searchsection">
                <!-- 검색창  /  빈 div 건드리지 마시오 -->
                <div></div>
                <div class="searchbox">
                    <input type="search">
                    <input type="submit" value="검색">
                </div>           
            </div>
            <!-- 테이블 박스 -->
            <div class="tablebox">
                <section style="margin-bottom: 80px">
        <!-- 탭 메뉴 -->
        <ul class="menu">
          <li style="background-color: lightgray;" onclick="location.href='/admin_board';">전체</li>
          <li onclick="location.href='/notice_list';">공지사항</li>
          <li onclick="location.href='/questions_list';">문의사항</li>
          <li onclick="location.href='/consultation_list';">상담내역</li>
          <li onclick="location.href='/freeboard_list';">자유게시판</li>
          <li onclick="location.href='/issue_list';">신고 게시물</li>
        </ul>
        <!-- 테이블 표 -->
        <table style="text-align: center;">
          <thead>
            <tr>
              <th style="width: 15%">그룹</th>
              <th style="width: 15%">작성자</th>
              <th>제목</th>
              <th style="width: 25%">생성일시</th>
            </tr>
          </thead>
          <tbody id="boardListContainer">
          
          </tbody>
          <tfoot >
				<tr>
					<td colspan="6" id="pagingContainer">
						
					</td>
				</tr>
			</tfoot>
        </table>
      </section>

      <section>
        <h2 style="margin: 5px">숨겨진 게시물 내역</h2>
        <table style="text-align: center;">
          <thead>
            <tr>
              
              <th colspan="2" style="width: 15%">그룹</th>
              <th style="width: 15%">작성자</th>
              <th>제목</th>
              <th style="width: 25%">삭제일시</th>
            </tr>
          </thead>
          <tbody id="boardSleepListContainer">
          </tbody>
          <tfoot>
				<tr>
					<td colspan="6" id="pagingSleepContainer">
						
					</td>
				</tr>
			</tfoot>
        </table>
        <div class="button_wrap">
          <button class="blue_bt" style="margin-top: 15px; height: 30px; width: 100px;" id="deleteSelectedBtn">선택복구</button>
        </div>
      </section>
            </div>
        </div>
    </div>
<!--푸터 --------------------------------------------------------------------------- -->
    <div class="footer"></div>
    </div>
<script type="text/javascript">
$(document).ready(function() {
    // 일반 게시판 목록 로딩 함수
    function loadBoardList(page) {
        $.ajax({
            url: "/admin_board_list",
            method: "GET",
            data: { cPage: page },
            success: function(response) {
                console.log(response);
                if (response.adminBoardList && Array.isArray(response.adminBoardList)) {
                    let boardListHtml = "";
                    response.adminBoardList.forEach(function(admin_board) {
                        let boardName = "";
                        switch (admin_board.bbs_id) {
                            case "CONS":
                                boardName = "상담내역";
                                break;
                            case "FREE":
                                boardName = "자유게시판";
                                break;
                            case "INQU":
                                boardName = "문의사항";
                                break;
                            case "NOTI":
                                boardName = "공지사항";
                                break;
                        }
                        boardListHtml += 
                            "<tr>" +
                                "<td>" + boardName + "</td>" +
                                "<td>" + admin_board.mber_nm + "</td>" +
                                "<td>" + admin_board.wr_subject + "</td>" +
                                "<td>" + admin_board.crt_dt + "</td>" +
                            "</tr>";
                    });
                    $("#boardListContainer").html(boardListHtml);
                } else {
                    $("#boardListContainer").html("<tr><td colspan='4'>데이터가 없습니다</td></tr>");
                }

                // 페이징 처리
                let paging = "<ol class='paging'>";
                if (response.paging.beginBlock > response.paging.pagePerBlock) {
                    paging += "<li><a href='#' class='page-link' data-page='" + (response.paging.beginBlock - response.paging.pagePerBlock) + "'>이전</a></li>";
                } else {
                    paging += "<li class='disable'><span>이전</span></li>";
                }
                for (let k = response.paging.beginBlock; k <= response.paging.endBlock; k++) {
                    if (k == response.paging.nowPage) {
                        paging += "<li class='now'><span>" + k + "</span></li>";
                    } else {
                        paging += "<li><a href='#' class='page-link' data-page='" + k + "'>" + k + "</a></li>";
                    }
                }
                if (response.paging.endBlock < response.paging.totalPage) {
                    paging += "<li><a href='#' class='page-link' data-page='" + (response.paging.beginBlock + response.paging.pagePerBlock) + "'>다음</a></li>";
                } else {
                    paging += "<li class='disable'><span>다음</span></li>";
                }
                paging += "</ol>";
                $("#pagingContainer").html(paging);

                $(".page-link").on("click", function(event) {
                    event.preventDefault();
                    const page = $(this).data("page");
                    loadBoardList(page);
                });
            },
            error: function() {
                alert("데이터 로딩 실패");
            }
        });
    }

    // 숨겨진 게시판 목록 로딩 함수
    function loadBoardSleepList(page) {
        $.ajax({
            url: "/admin_board_sleep_list",
            method: "GET",
            data: { cPage: page },
            success: function(response) {
                console.log(response);
                if (response.adminBoardSleepList && Array.isArray(response.adminBoardSleepList)) {
                    let boardSleepListHtml = "";
                    response.adminBoardSleepList.forEach(function(admin_board_sleep) {
                        let boardSleepName = "";
                        console.log(admin_board_sleep.bbs_id);
                        switch (admin_board_sleep.bbs_id) {
                            case "CONS":
                                boardSleepName = "상담내역";
                                break;
                            case "FREE":
                                boardSleepName = "자유게시판";
                                break;
                            case "INQU":
                                boardSleepName = "문의사항";
                                break;
                            case "NOTI":
                                boardSleepName = "공지사항";
                                break;
                        }
                        boardSleepListHtml += 
                        	"<tr data-id='" + admin_board_sleep.wr_id + "'>" + // 게시물 ID 추가
                            	"<td><input type='checkbox' class='delete-checkbox'></td>" +
                                "<td>" + boardSleepName + "</td>" +
                                "<td>" + admin_board_sleep.mber_nm + "</td>" +
                                "<td>" + admin_board_sleep.wr_subject + "</td>" +
                                "<td>" + admin_board_sleep.upd_dt + "</td>" +
                            "</tr>";
                    });
                    $("#boardSleepListContainer").html(boardSleepListHtml);
                } else {
                    $("#boardSleepListContainer").html("<tr><td colspan='4'>데이터가 없습니다</td></tr>");
                }

                let pagingSleep = "<ol class='paging'>";
                if (response.paging.beginBlock > response.paging.pagePerBlock) {
                    pagingSleep += "<li><a href='#' class='pageSleep-link' data-page='" + (response.paging.beginBlock - response.paging.pagePerBlock) + "'>이전</a></li>";
                } else {
                    pagingSleep += "<li class='disable'><span>이전</span></li>";
                }
                for (let k = response.paging.beginBlock; k <= response.paging.endBlock; k++) {
                    if (k == response.paging.nowPage) {
                        pagingSleep += "<li class='now'><span>" + k + "</span></li>";
                    } else {
                        pagingSleep += "<li><a href='#' class='pageSleep-link' data-page='" + k + "'>" + k + "</a></li>";
                    }
                }
                if (response.paging.endBlock < response.paging.totalPage) {
                    pagingSleep += "<li><a href='#' class='pageSleep-link' data-page='" + (response.paging.beginBlock + response.paging.pagePerBlock) + "'>다음</a></li>";
                } else {
                    pagingSleep += "<li class='disable'><span>다음</span></li>";
                }
                pagingSleep += "</ol>";
                $("#pagingSleepContainer").html(pagingSleep);

                $(".pageSleep-link").on("click", function(event) {
                    event.preventDefault();
                    const pageSleep = $(this).data("page");
                    loadBoardSleepList(pageSleep);
                });
            },
            error: function() {
                alert("데이터 로딩 실패");
            }
        });
    }

    // 페이지 로드 시 첫 번째 페이지 로딩
    loadBoardList(1);
    loadBoardSleepList(1);
    
 // 선택 삭제 버튼 이벤트
    $("#deleteSelectedBtn").on("click", function() {
        const selectedIds = [];

        // 선택된 체크박스의 wr_id 값 가져오기
        $(".delete-checkbox:checked").each(function() {
            const wr_id = $(this).closest("tr").data("id"); // tr의 data-id 속성에서 wr_id 추출
            selectedIds.push(wr_id);
        });

        if (selectedIds.length === 0) {
            alert("선택된 게시물이 없습니다.");
            return;
        }

        // 복구 요청
        $.ajax({
            url: "/admin_board_sleep_wake", // 복구를 처리할 URL
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({ wr_id: selectedIds }), // 선택된 ID 배열 전송
            success: function(response) {
                if (response.success) {
                    alert("복구가 완료되었습니다.");
                    loadBoardSleepList(1); // 목록 새로고침
                } else {
                    alert("복구 실패");
                }
            },
            error: function() {
                alert("복구 실패");
            }
        });
    });
    
});
</script>
</body>
</html>