<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcement</title>
    <link href="/resources/css/admin.css" rel="stylesheet" />
   
</head>



<body>
	<!-- 다른 페이지 내용 -->
	<c:if test="${not empty error && error.trim() != ''}">
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
            <h2 >공지 내용 수정</h2>
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
                <section>
            <form action="/notice_list?cPage='${cPage}'" method="post"  enctype="multipart/form-data">
            <table class="">
                <thead> 
                    <tr class="headrow">
                        <th colspan="2" class="firsthead">구분</th><th colspan="2">공지내용</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td colspan="2" >원글 작성자</td><td colspan="2" align="left">
                        <h2>${bovo.mber_nm}</h2></td>
                    </tr>
                    <tr>
                        <td colspan="2">제목 수정</td><td colspan="2" align="left">
                        <h2><input type="text" name="wr_subject" value="${bovo.wr_subject}"></h2></td>
                        
                    </tr>
                    <tr>
                        <td colspan="2">내용 수정</td>
                        <td colspan="2" align="left"><textarea rows="10" cols="60" name="wr_content" required>${bovo.wr_content}</textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">이전 첨부파일</td>
                        <c:choose>
						<c:when test="${empty bovo.atch_file_id}">
							<td><input type="file" name="file_name"><b>:: 이전 파일 없음 ::</b></td>
							<input type="hidden" name="old_f_name" value="">
						</c:when>
						<c:otherwise>
							<td><input type="file" name="file_name"><br><b>${bovo.atch_file_id}</b>
					   			<input type="hidden" name="old_f_name" value="${bovo.atch_file_id}">
							</td>
						</c:otherwise>
					</c:choose>
                    </tr>
                    <tr>
                        <td colspan="4" >
			        	 <input type="hidden" name="wr_id"  value="${bovo.wr_id}" >
			       	 	 <input type="hidden" name="cPage"  value="${cPage}" >
			       		 
			       		 <input type="button" value="목록" onclick="notice_list(this.form)" >
			        	 <input type="button" value="저장" onclick="notice_update_ok(this.form)">
			        	 <input type="button" value="이전으로" onclick="notice_detail(${bovo.wr_id}, ${paging.nowPage})">
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
	<script type="text/javascript">
		function notice_list(f) {
			f.action="/notice_list";
			f.submit();
		}
		function notice_update_ok(f) {
			for (let i = 0; i < f.elements.length; i++) {
				if(f.elements[i].value == ""){
					if(i==3 || i==4)  continue ;
					alert(f.elements[i].name + "를 입력하세요");
					f.elements[i].focus();
					return;
				}
			}
			f.action="/notice_update_ok" ;
			f.submit();
			
		}
		function notice_detail(wr_id, nowPage) {
			location.href = "/notice_detail?wr_id=" + wr_id + "&cPage=" + nowPage;
		}
	</script>
	

</body>
</html>