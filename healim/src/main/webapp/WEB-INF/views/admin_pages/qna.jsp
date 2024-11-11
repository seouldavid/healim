<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuestionsQna</title>
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
            <h2 > 문의 내역</h2>
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
            <form action="/consultation_ans_ok?cPage='${cPage}'" method="post"  enctype="multipart/form-data">
            <table class="">
                <thead> 
                    <tr class="headrow">
                        <th colspan="2" class="firsthead">구분</th><th colspan="2">문의내용</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td colspan="2">제목</td><td colspan="2"><h2>${bovo.wr_subject}</h2></td>
                    </tr>
                    <tr>
                        <td colspan="2">내용</td><td colspan="2">${bovo.wr_content}</td>
                    </tr>
                    <tr>
                        <td colspan="2">답변 내용</td><td colspan="2"><Textarea name="wr_couns_ans" rows="15" cols="100" placeholder="여기에 내용이 들어갑니다."></Textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">첨부파일</td><td><input type="file" name="file_name"><input type="reset" value="삭제"></td>
                    </tr>
                    <tr>
                        <td colspan="4" >
                        <input type="hidden" name="wr_id"  value="${bovo.wr_id}" >
			        	<input type="hidden" name="cPage"  value="${cPage}" >
                        <input type="button" value="목록" onclick="questions_list(this.form)" >
                        <input type="submit" value="등록">
                        <button id="button1" type="reset">취소</button></td>
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
	function questions_list(f) {
		f.action="/questions_list";
		f.submit();
	}
    
    </script>


</body>
</html>