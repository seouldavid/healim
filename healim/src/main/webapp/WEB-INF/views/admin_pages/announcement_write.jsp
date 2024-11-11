<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcement_Write</title>
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
                        <td colspan="2" >작성자</td><td colspan="2" align="left">
                        <h2><input type="text" name="mber_nm" value="닉네임을 입력하세요." required></h2></td>
                    </tr>
                    <tr>
                        <td colspan="2">제목</td><td colspan="2" align="left">
                        <h2><input type="text" name="wr_subject" required></h2></td>
                        
                    </tr>
                    <tr>
                        <td colspan="2">내용</td>
                        <td colspan="2" align="left"><textarea rows="10" cols="60" name="wr_content" required></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">첨부파일</td>
                        <td align="left"><input type="file" name="file_name"></td>
                    </tr>
                    <tr>
                        <td colspan="4" >
			       	 	 <input type="hidden" name="cPage"  value="${cPage}" >
			       		 <input type="button" value="목록" onclick="notice_list(this.form)" >
			        	 <input type="button" value="등록" onclick="notice_write_ok(this.form)">
			        	 <input type="reset" value="취소" >
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
		function notice_write_ok(f) {
			for (let i = 0; i < f.elements.length; i++) {
				if(f.elements[i].value == ""){
					if(i==3 || i==4)  continue ;
					alert(f.elements[i].name + "를 입력하세요");
					f.elements[i].focus();
					return;
				}
			}
			f.action="/notice_write_ok" ;
			f.submit();
			
		}
	</script>
	

</body>
</html>