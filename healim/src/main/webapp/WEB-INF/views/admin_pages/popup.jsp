<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <h2 > 팝업창 등록</h2>
        </div>   
   

    </div>
            <div class="searchsection">
                <!-- 검색창  /  빈 div 건드리지 마시오 -->
                <div></div>
                       
            </div>
            <!-- 테이블 박스 -->
            <div class="tablebox">
                <section>
            <form action="/popup_add" method="post" enctype="multipart/form-data">
            <table class="">
                <thead> 
                    <tr class="headrow">
                        <th  class="firsthead">구분</th><th colspan="3">팝업창 내용</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td >제목</td><td colspan="3"> <input class="pu_title" name="pu_title" type="text" placeholder="여기에 제목이 들어갑니다."></td>
                    </tr>
                    <tr>
                        <td >시작일시</td><td><input type="datetime-local" name="pu_start_time"> <input type="button" value="검색"></td><td >종료일시</td><td><input type="datetime-local" name="pu_end_time"> <input type="button" value="검색"></td>
                    </tr>
                    <tr>
                        <td>팝업위치</td> <td colspan="4"><input type="text" name="pu_x" value="X좌표"> px <input type="text" name="pu_y" value="Y좌표"> px </td>
                    </tr>
                    <tr>
                        <td>팝업레이어 크기</td> <td colspan="4"><input type="text" name="pu_height" value="높이"> px <input type="text" name="pu_width" value="너비"> px </td>
                    </tr>
                    <tr>
                        <div>
                        <td >내용</td><td colspan="3"><div class="preview">이미지파일 미리보기</div> <input type="file" name="file_name"><input type="reset">삭제 </td>
                    </div>
                    </tr>
                    
                    
                    <tr>
                        <td colspan="4"><input type="submit" value="등록"><button id="button1" type="reset" onclick="location.href='/index'">취소</button></td>
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