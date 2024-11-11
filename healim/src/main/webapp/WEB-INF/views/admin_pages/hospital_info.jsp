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
<!-- Custom styles for this page -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style type="text/css">

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
	border: 1px solid #959D90;
}

.page-link:hover {
	z-index: 2;
	color: #224abe;
	text-decoration: none;
	background-color: #eaecf4;
	border-color:  #959D90; /*  #dddfeb; */
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
	background-color: #959D90;  /*클릭시 색    #4e73df */
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
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: "Noto Sans KR", sans-serif;
    }

    a {
      text-decoration: none;
      color: black;
    }
    button,
    input {
      border: none;
      outline: none;
    }

    .board-container {
      width: 60%;
      height: 1200px;
      margin: 0 auto;
      /* border: 1px solid black; */
    }
    .search-container {
    background-color: #F7F7F7; 
    width: 50%;
    height: 55px;
    border: 1px solid #ddd;
    margin: 10px auto 30px; 
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
      height: 100%;
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
    }
    .search-button:hover {
      color: rgb(165, 165, 165);
    }
    
    .btn-write {
    background-color: rgb(236, 236, 236); 
    border: none; 
    color: black; 
    padding: 6px 12px; 
    font-size: 16px; 
    cursor: pointer; 
    border-radius: 5px; 
    margin-left: 30px; 
    }
    
    .btn-write:hover {
    text-decoration: underline; 
    }
    .btn-action {
    background-color: rgb(236, 236, 236); 
    border: none; 
    color: black; 
    padding: 6px 12px; 
    font-size: 16px; 
    cursor: pointer; 
    border-radius: 5px; 
    margin-right: 10px; 
    transition: background-color 0.3s; 
    }

    .btn-action:hover {
    background-color: rgb(220, 220, 220); 
    text-decoration: underline; 
    }
    .td-center{
    text-align: center;
    }
</style>
<script type="text/javascript">

  <c:if test="${savechk == 'S'}">
 	 alert("저장 되었습니다.");
  </c:if>
  <c:if test="${deletechk == 'S'}">
 	 alert("삭제 되었습니다.");
  </c:if>
</script>    
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
						<h2>병원 정보 통합 수정</h2>
					</div>


				</div>
				<div class="search-container">
					<form action="<c:url value="/hospital_info"/>" class="search-form"
						method="get">
						<select class="search-option" name="option">
							<option value="A"
								${pg.sc.option=='A' || pg.sc.option=='' ? "selected" : ""}>전체</option>
							<option value="N" ${pg.sc.option=='N' ? "selected" : ""}>병원명</option>
							<option value="C" ${pg.sc.option=='C' ? "selected" : ""}>시/군명</option>
						</select> <input type="text" name="keyword" class="search-input"
							type="text" value="${pg.sc.keyword}" placeholder="검색어를 입력해주세요"> &nbsp;
						<input type="submit" class="search-button" value="검색"> &nbsp;&nbsp;&nbsp;
						<input type="reset" class="search-button" value="초기화" onClick="init_list()">
					</form>                                  
					<button id="writeBtn" class="btn-write" onclick="hospital_reg()">
                            <i class="fa fa-pencil"></i> 신규 등록
                    </button>
				</div>
				<!-- 테이블 박스 -->
				<div class="tablebox">
					<section style="margin-bottom: 80px">

						 <form  method="post">
							<h2>요양병원 관리</h2>
							<c:if test="${totalCnt!=null && totalCnt!=0}">
								<div style="float:right"> <h3>총 검색 건수 : ${totalCnt} 건</h3> </div>
							</c:if>
							<table>
								<thead>
									<tr>
										<th>순번</th>
										<th>그룹</th>
										<th>병원명</th>
										<th>주소</th>
										<th>등급</th>
										<th>첨부파일수</th>
										<th>작성자</th>
										<th>부가기능</th>
									</tr>
								</thead>
								<tbody>
								    <c:choose>
										<c:when test="${totalCnt == 0 }">
											<tr>
												<td colspan="8"><h3 align="center">검색 조건과 일치 하는 데이터가 없습니다.</h3></td>
											</tr>
										</c:when>								    
								    	<c:otherwise>
								    		<c:forEach var="k" items="${list}" varStatus="s">
												<c:choose>
													<c:when test="${empty list}">
														<tr>
															<td colspan="8"><h3>데이터가 없습니다.</h3></td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<td class="td-center">${pg.totalCnt - ((pg.sc.page -1) * pg.sc.pageSize + s.index)}</td>
															<td><c:if test="${k.h_type == 'N'}">요양원</c:if>
															    <c:if test="${k.h_type == 'H'}">요양병원</c:if> 
															</td>
															<td><a href="/hospital_edit${pg.sc.queryString}&h_id=${k.h_id}">${k.h_name}</a></td>
															<td>${k.addr}</td>
															<td class="td-center">${k.grade}</td>
															<td class="td-center">${k.file_cnt}</td>
															<td class="td-center">${k.crt_by}</td>
															<td>
															    <button type="button" id="saveBtn" class="btn-write" onClick="location.href ='/hospital_edit${pg.sc.queryString}&h_id=${k.h_id}'"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정</button>
		                        		                        <button type="button" id="deleteBtn" class="btn-write" onClick="delete_ok(${k.h_id})"><i class="fa fa-trash "></i>삭제</button>
												              	 
															</td>	
														</tr>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
								    </c:choose>
								</tbody>
							</table>
						</form>
						<div>
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<c:if test="${totalCnt!=null && totalCnt!=0}">
									   <c:if test="${pg.showPrev}">
											<li class="page-item" id="pre"><a
												class="page-link"
												href="<c:url value="/hospital_info${pg.sc.getQueryString(pg.beginPage-1)}"/>"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										</c:if>
										<c:forEach var="i" begin="${pg.beginPage}" end="${pg.endPage}">
											<li class="page-item ${pg.sc.page==i? 'active':''}"><a
												class="page-link"
												href="<c:url value="/hospital_info${pg.sc.getQueryString(i)}"/>">
													${i}</a></li>
										</c:forEach>
                                        <c:if test="${pg.showNext}"> 
											<li class="page-item" id="next"><a
												class="page-link"
												href="<c:url value="/hospital_info${pg.sc.getQueryString(pg.endPage+1)}"/>"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
									</c:if>
								</ul>
							</nav>
						</div>
					</section>

				</div>
			</div>



		</div>



		<!--푸터 --------------------------------------------------------------------------- -->


		<div class="footer"></div>

	</div>

	<script type="text/javascript">
	    $(document).ready(function(){
	        
	        $('#city_select').change(function(e){
	            var ccode = $("#city_select option:selected").val();
	            var cname = $("#city_select option:selected").text();
	             
	            $('#city_name').val(cname);
	            $('#city_code').val(ccode);
	        });
	    
	    });	
	    
	 	function hospital_reg(){
	 		
	 		location.href="<c:url value='/hospital_reg${pg.sc.queryString}'/>";
	 	}
	 	
	 	function delete_ok(h_id) {
	 	    
	 	    if (confirm("정말 삭제하시겠습니까??") == true) { // 확인
	 	        location.href = "<c:url value='/hospital_delete${pg.sc.queryString}&h_id=" + h_id + "'/>";
	 	    } else { // 취소
	 	        return false;
	 	    }
	 	}
	 	
	 	function init_list(){
	 		location.href="<c:url value='/hospital_info'/>";
	 	}
	</script>

</body>
</html>