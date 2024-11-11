<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 신규 등록</title>
    <link href="/resources/css/admin.css" rel="stylesheet" />
</head>
<body>
    <!-- 탑1 --------------------------------------------------------------------------- -->
    <div class="page">
        <div class="top1">
            <div>
                <img class="bt_header" src="/resources/img/admin_img/logo.png" alt="header" />
            </div>
            <div class="administrator">ADMINISTRATOR</div>
            <div class="gohome">
                <div></div>
                <div class="house">
                    <a href="/home"> <img class="houseimg" src="/resources/img/admin_img/check_img.svg">
                        <button class="homepagebutton" style="cursor: pointer;">홈페이지</button>
                    </a>
                </div>
                <div class="logoutbox">
                    <a href="/login"> <img class="houseimg" src="/resources/img/admin_img/right-from-bracket-solid.svg">
                        <button class="logoutbutton" style="cursor: pointer;">로그아웃</button>
                    </a>
                </div>
            </div>
        </div>

        <!-- 메인 --------------------------------------------------------------------------- -->
        <div class="main">
            <!-- 네비게이션 -->
            <div class="nav">
                <ul class="nav_button">
                    <li><a href="/index"><img class="nav_img" src="/resources/img/admin_img/button-0.svg" alt="메인페이지 " /></a></li>
                    <li><a href="/member"><img class="nav_img" src="/resources/img/admin_img/button-1.svg" alt="회원관리" /></a></li>
                    <li><a href="/admin_board"><img class="nav_img" src="/resources/img/admin_img/button-2.svg" alt="게시판 관리" /></a></li>
                    <li><a href="/hospital_info"><img class="nav_img" src="/resources/img/admin_img/button-3.svg" alt="병원정보수정" /></a></li>
                    <li><a href="/admin"><img class="nav_img" src="/resources/img/admin_img/button-4.svg" alt="관리자관리" /></a></li>
                </ul>
            </div>

            <!-- 메인 테이블 -->
            <div class="content">
                <div class="top2">
                    <div class="top2text">
                        <h2>관리자 신규 등록</h2>
                    </div>
                </div>
                <div class="tablebox">
                    <section>
                        <form action="/admin_add" method="post">
                            <table>
                                <thead>
                                    <tr class="headrow">
                                        <th class="firsthead">구분</th>
                                        <th colspan="5">내 용</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>아이디</td>
                                        <td colspan="5">
                                            <input name="admin_id" type="text" placeholder="관리자 ID">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>비밀번호</td>
                                        <td colspan="5">
                                            <input type="password" name="admin_pw" placeholder="비밀번호">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>권한레벨</td>
                                        <td colspan="5">
                                            <select name="authority_level">
                                                <option value="super">슈퍼관리자</option>
                                                <option value="normal">일반관리자</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>상태</td>
                                        <td colspan="5">
                                            <input type="text" name="status" placeholder="상태 (예: 활성)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>최근접속</td>
                                        <td colspan="5">
                                            <input type="text" name="last_visit" placeholder="최근 접속 (예: YYYY-MM-DD)">
                                        </td>
                                    </tr>
                                    <!-- 관리 권한 체크박스 추가 -->
                                    <tr>
                                        <td>관리 권한</td>
                                        <td colspan="5">
                                            <label><input type="checkbox" name="chat_management" value="true"> 채팅 관리</label><br>
                                            <label><input type="checkbox" name="popup_management" value="true"> 팝업 관리</label><br>
                                            <label><input type="checkbox" name="board_management" value="true"> 게시판 관리</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <input type="submit" value="등록">
                                            <button type="button" onclick="location.href='/admin'">취소</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </section>
                </div>
            </div>
        </div>

        <!-- 푸터 -->
        <div class="footer"></div>
    </div>
</body>
</html>
