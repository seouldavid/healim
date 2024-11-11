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
            <h2> 요양원 신규 등록 </h2>
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
            <form action="/hospital_info" method="get">
            <table class="">
                <thead> 
                    <tr class="headrow">
                        <th  class="firsthead">구분</th><th colspan="5">내 용</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>기관명</td><td colspan="5"> <input class="titleinput" type="text" placeholder="여기에 제목이 들어갑니다."></td>
                    </tr>
                    <tr>
                        <td>지역</td><td><input type="text"></td><td >주소</td><td colspan="3"><input type="text"></td>
                    </tr>
                    <tr>
                        <td>등급</td>
                        <td>
                        <select>
                        	<option>A등급</option>
                        	<option>B등급</option>
                        	<option>C등급</option>
                        	<option>D등급</option>
                        	<option>E등급</option>
                        	<option>등급제외</option>
                        </select>
                        </td>
                        <td>병상정보</td><td colspan="3"><input type="text"></td>
                    </tr>
                    <tr>
                        <td>의사 수</td><td><input type="text"></td><td>간호사 수</td><td colspan="3"><input type="text"></td>
                    </tr>
                    <tr>
                        <td>사회복지사 수</td><td><input type="text"></td><td>요양보호사 수</td><td><input type="text"></td><td>영양사 수</td><td><input type="text"></td>
                    </tr>
                    
                    <tr>
                    <td>기타</td>
                    <td colspan="5"><textarea cols="150" rows="20" placeholder="추가 사항을 입력해 주세요"></textarea></td>
                    </tr>
                    <tr>
                       	<td>첨부파일</td><td colspan="5"><div class="preview"></div> <input type="file"><input type="reset">삭제 </td>
                    </tr>
                    <tr>
                        <td colspan="6"><input type="submit" value="등록"><button id="button1" type="reset" onclick="location.href='/hospital_info'">취소</button></td>
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