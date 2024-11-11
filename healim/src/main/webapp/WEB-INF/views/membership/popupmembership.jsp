<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
    //쿠키설정    
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + '=' + escape(value) + '; path=/; expires=' + todayDate.toGMTString() + ';'
    }

    // 쿠키 불러오기
    function getCookie(name) {
        var obj = name + "=";
        var x = 0;
        while (x <= document.cookie.length) {
            var y = (x + obj.length);
            if (document.cookie.substring(x, y) == obj) {
                if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                    endOfCookie = document.cookie.length;
                return unescape(document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf(" ", x) + 1;

            if (x == 0) break;
        }
        return "";
    }

    // 닫기 버튼 클릭시
    function closeWin(key) {
        var todaycloseyn = document.getElementById("todaycloseyn");
        if (todaycloseyn.checked) {
            setCookie('healimpopup' + key, 'Y', 1);
            window.close();
        }
    }

</script>

<style type="text/css">
    img {
        width: 400px;
        height: auto;
        display: block;
        margin: 0 auto;
        border-radius: 10px;
    }
    
    body{
     background-color: #F5F5F5; 
    }

    .button_area {
        position: fixed;
        bottom: 20px; /* 화면의 하단에서 20px 위에 위치 */
        right: 20px; /* 화면의 오른쪽에서 20px 왼쪽에 위치 */
        background-color: white;
        padding: 10px;
        border-radius: 10px;
        
    }

    .topper {
        position: fixed;
        top: 0px;
        left: 50%; /* 가운데 정렬을 위해 50% */
        transform: translateX(-50%); /* 왼쪽으로 절반 이동하여 정중앙으로 */
        text-align: center; /* 가운데 정렬 */
    }

    .topper img {
        width: 300px;
        height: auto;
        display: inline-block;
        margin-top: 10px;
    }

    .content {
        text-align: center; /* 내용 가운데 정렬 */
        margin-top: 100px; /* 로고 아래쪽 여백 */
    }

    .content p {
        font-size: 18px;
        margin-top: 10px;
    }

</style>
</head>
<body>

<div>
    <div class="topper">
        <h1><a href="/home"><img src="/resources/img/main.png" alt="Healim Logo"></a></h1>
    </div>

    <div class="content">
        <p>당신의 소중한 하루를 함께합니다.</p>
        <a href="#" target="_parent" onclick="move()">
            <img src="resources/img/111.jpg" alt="">
        </a>
    </div>

    <div class="button_area">
        <input class="window" type="checkbox" id="todaycloseyn" value="Y"> 오늘 하루 이 창을 열지 않습니다.
        <a href='#' onclick="closeWin(1);"><button>닫기</button></a>
    </div>
</div>
    

    <script>
        function move() {
            opener.move();
            self.close();
        }
    </script>

</body>
</html>