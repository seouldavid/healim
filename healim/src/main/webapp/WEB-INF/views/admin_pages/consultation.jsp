<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation_list</title>
    <link href="/resources/css/admin.css" rel="stylesheet" />
</head>
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
    <div class="top2">
        <div class="top2text">
            <h2>상담내역 관리</h2>
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
           <li onclick="location.href='/admin_board';">전체</li>
          <li onclick="location.href='/notice_list';">공지사항</li>
          <li onclick="location.href='/questions_list';">문의사항</li>
          <li style="background-color: lightgray;" onclick="location.href='/consultation_list';">상담내역</li>
          <li onclick="location.href='/freeboard_list';">자유게시판</li>
          <li onclick="location.href='/issue_list';">신고 게시물</li>
        </ul>

        <!-- 테이블 표 -->
        
	        <table>
	          <thead>
	            <tr>
	              <th style="width: 15%">그룹</th>
	              <th style="width: 15%">작성자</th>
	              <th>제목</th>
	              <th style="width: 15%">생성일시</th>
	              <th style="width: 8%">답변여부</th>
	              <th style="width: 15%">부가기능</th>
	            </tr>
	          </thead>
	          <tbody style="text-align: center;">
	          <c:choose>
	         	<c:when test="${empty consultation_list}">
		         	<tr>
						<td colspan="5">:: 상담 내역이 존재하지 않습니다 ::</td>
					</tr>
	          	</c:when>
	          	<c:otherwise>
	          		<c:forEach var="k" items="${consultation_list}" varStatus="c">
	          		<tr>
	          		<td>상담내역</td>
	          		<td>${k.mber_nm}</td>
	          		<td><a href="/consultation_detail?idx=${k.wr_id }&cPage=${paging.nowPage}">${k.wr_subject}</a></td>
					<td>${k.crt_dt}</td>
					<td>${k.admin_answer}</td>
					<td>
						<input type="button" value="답변" onclick="counselor_write(${k.wr_id}, ${paging.nowPage}, '${k.admin_answer}')">
						<input type="button" value="수정" onclick="counselor_update(${k.wr_id}, ${paging.nowPage})">
						<input type="button" value="삭제" onclick="counselor_delete(${k.wr_id}, ${paging.nowPage})">
					</td>
	          		</tr>
	          		</c:forEach>
	          	</c:otherwise>
	          </c:choose>
	          </tbody>
	          <tfoot>
				<tr>
					<td colspan="6">
						<ol class="paging">
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
									<li class="disable">이전</li>
								</c:when>
								<c:otherwise>
									<li><a href="/consultation_list?cPage=${paging.beginBlock - paging.pagePerBlock }">이전</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 페이지번호 -->
							<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock }" step="1" var="k">
								<c:choose>
									<c:when test="${k == paging.nowPage }">
										<li class="now">${k }</li>
									</c:when>
								    <c:otherwise>
								    		<li><a href="/consultation_list?cPage=${k}">${k }</a></li>
								    </c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 다음 버튼 -->
							<c:choose>
								<c:when test="${paging.endBlock >= paging.totalPage }">
									<li class="disable">다음</li>
								</c:when>
								<c:otherwise>
									<li><a href="/consultation_list?cPage=${paging.beginBlock + paging.pagePerBlock }">다음</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</tfoot>
	        </table>
      </section>

            </div>
        </div>



    </div>



<!--푸터 --------------------------------------------------------------------------- -->


    <div class="footer"></div>

    </div>
    <script type="text/javascript">
		function counselor_write(wr_id, cPage, admin_answer) {
			console.log(admin_answer);
			if (admin_answer === 'Y') {
				alert("이미 답변 완료한 글입니다.");
			} else {
				location.href = "/consultation_select_one?wr_id=" + wr_id + "&cPage=" + cPage;
			}
		}
		function counselor_update(wr_id, cPage) {
			location.href = "/consultation_update?wr_id=" + wr_id + "&cPage=" + cPage;
		}
		function counselor_delete(wr_id, cPage) {
			if (confirm('정말 이 게시글을 삭제하시겠습니까?')) {
			location.href = "/consultation_delete?wr_id=" + wr_id + "&cPage=" + cPage;
		    }
		}
	</script>
    
</body>
</html>