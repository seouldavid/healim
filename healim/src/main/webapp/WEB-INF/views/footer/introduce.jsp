<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤아림 - 소개</title>
<style>
body {
	width: 80%;
	font-family: Arial, sans-serif;
	background-color: white;
	margin: 0 auto;
	padding: 0;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
}

h1 {
	text-align: center;
	color: #4CAF50;
	margin-bottom: 60px;
}

.section {
	margin-bottom: 40px;
}

.section h2 {
	color: #333;
}

.section p {
	margin: 10px 0;
	text-align: justify;
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
.logoimg {
   width: 300px; /* 로고 크기를 150px로 지정 */
    display: block;
    margin: 10px auto; /* 이미지 중앙 정렬 및 위쪽 여백 */
}
</style>
</head>
<body>
	<div class="container">
	<div class="logoheader"  onclick="location.href='/home'">
		<img class="logoimg" src="/resources/img/main.png">
	</div>
	
	
		<h1>헤아림 소개</h1>

		<div class="section">
			<h2>경기도 요양시설 정보의 중심, 헤아림</h2><hr>
			<p>헤아림은 경기도에 위치한 다양한 요양시설을 한곳에서 쉽게 비교하고 선택할 수 있도록 돕는 플랫폼입니다.
				요양시설을 찾고 계신 가족분들에게 신뢰할 수 있는 정보를 제공하며, 각 시설의 특징과 장점을 자세히 안내하여 어르신들의
				맞춤형 요양시설을 찾는 과정을 간소화하고자 합니다.</p>
			<p>저희 플랫폼은 경기도 전역에 걸쳐 다양한 요양시설 정보를 수집하여 이용자들이 편리하게 접근할 수 있도록 하고
				있으며, 최신 데이터를 바탕으로 신뢰할 수 있는 정보를 제공합니다. 치매전용,위치기반,최근개원순,등급순,손길순 등 필요한
				모든 정보를 손쉽게 비교하여 사용자에게 가장 적합한 요양시설을 선택할 수 있도록 도와드립니다.</p>
		</div>

		<div class="section">
			<h2>사용자 맞춤형 검색 서비스</h2><hr>
			<p>헤아림의 검색 기능은 사용자 친화적으로 설계되어 있습니다. 치매전용,위치기반,최근개원순,등급순,손길순 등을
				입력하면, 해당 조건에 맞는 최적의 요양시설을 추천받을 수 있습니다. 요양시설마다 제공되는 서비스의 세부 사항을 확인할 수
				있고, 시설 사진 및 입소 후기 등을 통해 실제 경험을 바탕으로 한 정보를 얻을 수 있습니다.</p>
			<p>저희는 또한 방문 상담 예약 기능을 통해 시설 관계자와 직접 상담을 주선하며, 이용자들이 보다 쉽게 요양시설과
				소통할 수 있도록 돕습니다. 예약 기능을 통해 간편하게 시설과의 연결을 도와드리며, 맞춤형 안내를 제공하고 있습니다.</p>
		</div>

		<div class="section">
			<h2>믿을 수 있는 정보 제공</h2><hr>
			<p>헤아림은 검증된 요양시설만을 소개하여 사용자가 신뢰할 수 있는 정보를 제공합니다. 저희 플랫폼에 등록된 모든
				요양시설은 철저한 검증 과정을 거쳐 등록되며, 이용자에게 최신의 정확한 정보를 제공하는 것을 최우선으로 하고 있습니다.
				입소 비용, 시설의 인프라, 돌봄 인력의 전문성 등 다양한 요소를 고려하여 요양시설을 평가하고 추천합니다.</p>
			<p>또한, 이용자들의 리뷰와 평가 시스템을 통해 요양시설의 실제 만족도를 반영하여 더욱 신뢰할 수 있는 정보 제공을
				목표로 하고 있습니다. 사용자들은 요양시설 선택 과정에서 필요한 정보를 빠르고 정확하게 얻을 수 있습니다.</p>
		</div>

		<div class="section">
			<h2>지역 사회와 함께하는 플랫폼</h2><hr>
			<p>헤아림은 단순히 정보를 제공하는 데 그치지 않고, 지역 사회와 요양시설 간의 연결을 강화하는 역할을 합니다.
				경기도 전역에 걸친 요양시설과의 협력을 통해, 보다 폭넓은 선택지를 제공하며, 지역 내 다양한 서비스와 연계하여 어르신들과
				가족들의 요양 시설 선택이 원활하게 이루어지도록 돕습니다.</p>
			<p>저희는 지속적으로 지역사회와 소통하며, 사용자들에게 더욱 나은 서비스를 제공하기 위해 노력하고 있습니다.
				가족분들이 믿고 사용할 수 있는 정보 플랫폼으로서의 역할을 다하고 있으며, 언제나 최고의 서비스로 보답하겠습니다.</p>
		</div>

		<div class="section">
			<h2>문의 및 상담</h2><hr>
			<p>헤아림 플랫폼에 대한 더 자세한 정보나 서비스 이용에 관한 상담이 필요하시면 언제든지 저희에게 연락해 주십시오.
				빠른 답변과 성실한 상담으로 도와드리겠습니다.</p>
			<p>
				연락처: 031-123-4567<br> 이메일: info@hearim-platform.or.kr
			</p>
		</div>
	</div>
<br><br><br><br><br><br>
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
