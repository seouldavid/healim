<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역 선택</title>
<style>
.topper {
	position: fixed;
	top: 0px;
	left: 44%;
	justify-content: center;
}

.topper img {
	width: 300px;
	height: auto;
	display: inline-block;
	margin-top: 10px;
}

a {
	text-decoration: none;
	color: inherit;
	text-align: center;
	font-size: 20px;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	background-color: #e7f1ff;
	overflow: hidden;
}

.container {
	width: 60%;
	max-width: 600px;
	max-height: 90vh;
	overflow-y: auto;
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h2 {
	text-align: center;
}

.region-selection {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
	padding: 30px;
	font-weight: bold;
	color: #3f50b4;
	font-size: 20px;
}

.district-grid {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	gap: 10px;
	margin-bottom: 20px;
}

.district-grid label {
	padding: 10px;
	border: 1px solid #ccc;
	background-color: white;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
	transition: background-color 0.3s ease;
}

.district-grid input {
	display: none;
}

.district-grid input:checked+label {
	background-color: #007bff;
	color: white;
}

.bottom-bar {
	display: flex;
	justify-content: space-around;
	padding-top: 20px;
}

.bottom-bar button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.bottom-bar button:hover {
	background-color: #0056b3;
}

/* 플로팅 네비게이션 스타일 */
.floating-nav {
	position: fixed;
	top: 50%;
	left: 20px;
	transform: translateY(-50%);
	width: 80px;
	background-color: #fff;
	border-radius: 15px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 10px;
	text-align: center;
	opacity: 0.8;
}

.floating-nav ul {
	list-style-type: none;
	padding: 0;
}

.floating-nav li {
	margin: 30px 0;
	text-align: center;
}

.floating-nav img {
	width: 40px;
	height: 40px;
	display: block;
	margin: 0 auto 10px;
}

.floating-nav a {
	text-decoration: none;
	color: #000;
	font-size: 14px;
	display: block;
	text-align: center;
}

.floating-nav a:hover {
	text-decoration: underline;
}
</style>
<script>
    function resetSelection() {
      const checkboxes = document.querySelectorAll('.district-grid input[type="checkbox"]');
      checkboxes.forEach((checkbox) => {
        checkbox.checked = false; // 모든 체크박스의 선택 해제
      });
    }
  </script>
</head>
<body>
	<div class="topper">
		<h1>
			<a href="/home"><img src="/resources/img/main.png"></a>
		</h1>
	</div>

	<div class="container">

		<h2>[지역 선택]</h2>

		<div class="region-selection">
			<img src="resources/img/ping.png" alt="현위치 이미지"
				style="width: 30px; height: auto;"> <a href="/map">현위치</a>
		</div>

		<form action="/search_location">
			<div class="district-grid">
	<c:forEach var="k" items="${list}">
	<c:if test="${k != null}">
				<input type="checkbox" id="${k}" value="${k}" name="district">
				<label for="${k}">${k}</label>
	</c:if>
	</c:forEach>
				<!--     <input type="checkbox" id="goyang" value="고양시" name="district">
    <label for="goyang">고양시</label>

    <input type="checkbox" id="seongnam" value="성남시" name="district">
    <label for="seongnam">성남시</label>

    <input type="checkbox" id="ansan" value="안산시" name="district">
    <label for="ansan">안산시</label>

    <input type="checkbox" id="anyang" value="안양시" name="district">
    <label for="anyang">안양시</label>

    <input type="checkbox" id="hwaseong" value="화성시" name="district">
    <label for="hwaseong">화성시</label>

    <input type="checkbox" id="namyangju" value="남양주시" name="district">
    <label for="namyangju">남양주시</label>

    <input type="checkbox" id="yeoju" value="여주시" name="district">
    <label for="yeoju">여주시</label>

    <input type="checkbox" id="hanam" value="하남시" name="district">
    <label for="hanam">하남시</label>

    <input type="checkbox" id="paju" value="파주시" name="district">
    <label for="paju">파주시</label>

    <input type="checkbox" id="guri" value="구리시" name="district">
    <label for="guri">구리시</label>

    <input type="checkbox" id="bucheon" value="부천시" name="district">
    <label for="bucheon">부천시</label>

    <input type="checkbox" id="uijeongbu" value="의정부시" name="district">
    <label for="uijeongbu">의정부시</label>

    <input type="checkbox" id="uiwang" value="의왕시" name="district">
    <label for="uiwang">의왕시</label>

    <input type="checkbox" id="pyeongtaeg" value="평택시" name="district">
    <label for="pyeongtaeg">평택시</label>

    <input type="checkbox" id="siheung" value="시흥시" name="district">
    <label for="siheung">시흥시</label>

    <input type="checkbox" id="gwangmyeong" value="광명시" name="district">
    <label for="gwangmyeong">광명시</label>

    <input type="checkbox" id="gwangju" value="광주시" name="district">
    <label for="gwangju">광주시</label>

    <input type="checkbox" id="osan" value="오산시" name="district">
    <label for="osan">오산시</label>

    <input type="checkbox" id="gwacheon" value="과천시" name="district">
    <label for="gwacheon">과천시</label>

    <input type="checkbox" id="yangju" value="양주시" name="district">
    <label for="yangju">양주시</label>

    <input type="checkbox" id="icheon" value="이천시" name="district">
    <label for="icheon">이천시</label>

    <input type="checkbox" id="gimpo" value="김포시" name="district">
    <label for="gimpo">김포시</label>

    <input type="checkbox" id="pochen" value="포천시" name="district">
    <label for="pochen">포천시</label>

    <input type="checkbox" id="dongducheon" value="동두천시" name="district">
    <label for="dongducheon">동두천시</label>

    <input type="checkbox" id="anseong" value="안성시" name="district">
    <label for="anseong">안성시</label>

    <input type="checkbox" id="malbok" value="말복시" name="district">
    <label for="malbok">말복시</label>

    <input type="checkbox" id="geunpo" value="군포시" name="district">
    <label for="geunpo">군포시</label>

    <input type="checkbox" id="yongin" value="용인시" name="district">
    <label for="yongin">용인시</label>

    <input type="checkbox" id="yeoncheon" value="연천군" name="district">
    <label for="yeoncheon">연천군</label> -->
			</div>

			<div class="bottom-bar">
				<button onclick="resetSelection()">초기화</button>
				<button onclick="location.href='next_page.html'">다음</button>
			</div>
		</form>

	</div>

	<nav class="floating-nav">
		<ul>
			<li><img src="/resources/img/hom4.jpg" alt="홈 이미지"> <a
				href="/home">홈</a></li>
			<li><img src="/resources/img/sangdam.jpg" alt="상담 사례 이미지">
				<a href="/consult_main">상담<br>사례
			</a></li>
			<li><img src="/resources/img/sisul.jpg" alt="시설 찾기 이미지"> <a
				href="/region_selected">시설<br>찾기
			</a></li>
			<li><img src="/resources/img/my.jpg" alt="마이 페이지 이미지"> <a
				href="/myPage">마이<br>페이지
			</a></li>
		</ul>
	</nav>





</body>
</html>