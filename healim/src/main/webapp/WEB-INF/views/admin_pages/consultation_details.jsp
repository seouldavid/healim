<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 화면</title>
    <link href="resources/css/styles_1.css" rel="stylesheet" />
  </head>

  <body>
    <header>
      <div class="header_wrap">
        <img
          class="bt_header"
          href="#"
          src="resources/img/Button-header.jpg"
          alt="header"
        />
        <h1 class="title">ADMINISTRATOR</h1>
      </div>
      <div class="header_wrap2">
        <div class="button_wrap">
          <img style="width: 20px" src="resources/img/check_img.svg" />
          <a style="font-size: 15px" href="#">홈페이지</a>
        </div>
        <a class="logout" href="#"> 로그아웃</a>
      </div>
    </header>

    <nav class="nav">
      <ul class="nav_button">
        <li>
          <a href="#"
            ><img
              class="nav_img"
              src="resources/img/button-0.svg"
              alt="메인페이지 "
          /></a>
        </li>
        <li>
          <a href="#"
            ><img
              class="nav_img"
              src="resources/img/button-1.svg"
              alt="회원관리"
          /></a>
        </li>
        <li>
          <a href="#"
            ><img
              class="nav_img"
              src="resources/img/button-2.svg"
              alt="게시판 관리"
          /></a>
        </li>
        <li>
          <a href="#"
            ><img
              class="nav_img"
              src="resources/img/button-3.svg"
              alt="병원정보수정"
          /></a>
        </li>
        <li>
          <a href="#"
            ><img
              class="nav_img"
              src="resources/img/button-4.svg"
              alt="관리자관리"
          /></a>
        </li>
      </ul>
    </nav>

    <div class="main_title">
      <h1>게시판 관리</h1>
    </div>

    <main>
      <section style="margin-bottom: 80px">
        <!-- 탭 메뉴 -->
        <ul class="menu">
          <li><a href="">전체</a></li>
          <li><a href="">공지사항</a></li>
          <li><a href="">문의사항</a></li>
          <li><a href="">상담내역</a></li>
        </ul>

        <!-- 테이블 표 -->
        <form action="" method="post" >
	        <table>
	          <thead>
	            <tr>
	              <th><input type="checkbox" /></th>
	              <th>그룹</th>
	              <th>작성자</th>
	              <th>제목</th>
	              <th>생성일시</th>
	              <th>SNS 사용</th>
	              <th>검색 사용</th>
	              <th>부가기능</th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr>
	              <td><input type="checkbox" /></td>
	              <td>상담내역</td>
	              <td>DragonCat007</td>
	              <td><a href="" class="">2024년 10월 추가 서버 점검 안내</a></td>
	              <td>2024-10-10 09:08:30</td>
	              <td><input type="checkbox" checked /></td>
	              <td><input type="checkbox" checked /></td>
	              <td>
	              	<input type="button" value="답변" onclick="">
					<input type="button" value="삭제" onclick="">
					<input type="hidden" name="" value="">
				  </td>	
	            </tr>
	          </tbody>
	        </table>
        </form>
        <form action="" method="post">
	        <div class="gray_bt">
	          <button style="margin-top: 10px;">선택 숨김</button>
	        </div>
        </form>
      </section>

    </main>
    <footer>
      <p>&copy; 4조 관리자 시스템</p>
    </footer>
  </body>
</html>