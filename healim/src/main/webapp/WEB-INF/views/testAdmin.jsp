<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 화면</title>
    <link rel="stylesheet" href="styles.css"> <!-- 스타일 시트 연결 -->
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #3f50b4;
            color: white;
            padding: 15px;
            text-align: center;
        }

        header h1 {
            margin: 0;
        }

        nav {
            position: fixed;
            left: 0;
            top: 60px; /* header 아래 위치 */
            bottom: auto;
            width: 150px;
            background-color: #fff;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav ul li {
            margin-bottom: 10px;
        }

        nav ul li a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: black;
        }

        nav ul li img {
            width: 24px; /* 이미지 크기 조절 */
            height: 24px;
            margin-right: 8px; /* 이미지와 텍스트 간격 */
        }

        main {
            margin-left: 170px; /* 네비게이션 바 너비만큼 마진 */
            padding: 20px;
        }

        section {
            background: white;
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            border-bottom: 2px solid #0044cc;
            padding-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e9e9e9;
        }

        footer {
            background-color: #6e7f99;
            color: white;
            text-align: center;
            padding: 10px;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        .button-group {
            margin-top: 15px;
            text-align: right;
        }

        .button-group button {
            background-color: #607c45;
            color: white;
            border: none;
            padding: 10px;
            margin-right: 5px;
            cursor: pointer;
            border-radius: 5px;
            text-align: right;
        }

        .button-group button:hover {
            background-color: #003399;
        }

    </style>
</head>
<body>
<header>
    <h1>ADMINISTRATOR</h1>
    <a href="#"> 홈페이지</a>
    <a href="#"> 로그인</a>
</header>

<nav>
    <ul>
        <li><a href="#"><img src="" alt="홈페이지"> 홈페이지</a></li>
        <li><a href="#"><img src="" alt="로그인"> 로그인</a></li>
        <li><a href="#"><img src="" alt="회원 관리"> 회원 관리</a></li>
        <li><a href="#"><img src="" alt="설정"> 설정</a></li>
    </ul>
</nav>

<main>
    <section>
        <h2>회원 관리</h2>
        <table>
            <thead>
            <tr>
                <th>회원아이디</th>
                <th>이름</th>
                <th>내부관리</th>
                <th>상태</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>******</td>
                <td>******</td>
                <td>2</td>
                <td>예</td>
            </tr>
            </tbody>
        </table>
        <div class="button-group">
            <button>회원 관리 페이지</button>
        </div>
    </section>

    <section>
        <h2>게시물 관리</h2>
        <table>
            <thead>
            <tr>
                <th>종류</th>
                <th>게시물</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>요양원</td>
                <td>자유게시판</td>
            </tr>
            </tbody>
        </table>
        <div class="button-group">
            <button>게시물 관리 페이지</button>
        </div>
    </section>

    <section>
        <h2>병원 정보 관리</h2>
        <table>
            <thead>
            <tr>
                <th>고급</th>
                <th>병원명</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>요양원</td>
                <td>ICT 요양원</td>
            </tr>
            </tbody>
        </table>
        <div class="button-group">
            <button>병원 정보 관리 페이지</button>
        </div>
    </section>

    <section>
        <h2>Admin 관리</h2>
        <table>
            <thead>
            <tr>
                <th>관리자 아이디</th>
                <th>이름</th>
                <th>내부관리</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>******</td>
                <td>Admin01</td>
                <td>2</td>
            </tr>
            </tbody>
        </table>
        <div class="button-group">
            <button>Admin 관리 페이지</button>
        </div>
    </section>

    <section>
        <h2>팝업창 관리</h2>
        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>상태</th>
                <th>제목</th>
                <th>작성자</th>
                <th>시작일</th>
                <th>종료일</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>팝업중</td>
                <td>10월 이벤트 중</td>
                <td>admin</td>
                <td>2000-10-21</td>
                <td>2000-10-21</td>
            </tr>
            </tbody>
        </table>
        <div class="button-group">
            <button>등록</button>
            <button>수정</button>
            <button>삭제</button>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 4조 관리자 시스템</p>
</footer>
</body>
</html>
