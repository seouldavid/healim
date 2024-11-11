<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>노년기 건강 관리</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #e7f1ff;
	margin: 0;
	padding: 0;
}

header {
	color: #333;
	text-align: center;
	padding: 10px 0;
}

header h1 {
	font-size: 2.5em;
	font-weight: 700;
}

section {
	margin: 40px auto;
	width: 80%;
	background-color: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #333;
	font-weight: bold;
	font-size: 1.5em;
	margin-bottom: 15px;
}

p {
	font-size: 16px;
	line-height: 1.8;
	color: #666;
	margin-bottom: 20px;
}

.info {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
}

.info span {
	background-color: #f4f4f9;
	padding: 10px 20px;
	border-radius: 30px;
	color: #333;
	font-size: 14px;
	font-weight: bold;
}

.buttons {
	margin: 20px 0;
	display: flex;
	gap: 10px;
}

.buttons button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 30px;
	cursor: pointer;
	font-size: 16px;
}

.buttons button:hover {
	background-color: #0056b3;
}

.footer-nav {
	width: 70%;
	padding: 15px;
	background-color: #ffffff;
	position: fixed;
	bottom: 0;
	display: flex;
	justify-content: space-around;
	box-shadow: 0px -4px 8px rgba(0, 0, 0, 0.1);
	left: 0;
	right: 0;
	margin: 0 auto;
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

img {
	width: 20%;
}

.logoimg {
   width: 300px; /* 로고 크기를 300px로 지정 */
    display: block;
    margin: 10px auto; 
}
</style>
</head>
<body>
	<div class="logoheader"  onclick="location.href='/home'">
		<img class="logoimg" src="/resources/img/main.png">
	</div>

	<section>
		<header>
			<h1>노년기 건강 관리</h1>
		</header>
		<div class="info">
			<span>노년기 건강</span> <span>건강 관리 정보</span>
		</div>

		<div class="buttons">
			<button>공유하기</button>

		</div>
		<img alt="" src="/resources/img/honey/silver1.jpg">
		<h2>노년기 건강 관리의 중요성</h2>
		<hr>
		<p>노년기에 접어들면 신체의 자연스러운 변화와 더불어 다양한 건강 문제가 발생할 수 있습니다. 따라서 적극적인 건강
			관리는 노년기의 삶의 질을 향상시키는 데 매우 중요합니다. 신체적인 건강뿐만 아니라 정신적인 건강도 관리해야 하며, 이를
			통해 활기찬 노년을 보낼 수 있습니다.</p>

		<h2>주요 건강 관리 방법</h2>
		<hr>
		<p>노년기에는 다양한 신체적 변화를 겪게 됩니다. 이를 관리하기 위해서는 다음과 같은 방법들이 도움이 될 수
			있습니다:</p>

		<h3>1. 규칙적인 신체 활동</h3>
		<p>운동은 모든 연령에서 중요하지만, 특히 노년기에는 규칙적인 신체 활동이 심혈관계 건강을 유지하고, 근육과 뼈를
			강화하며, 균형 감각을 향상시키는 데 필수적입니다. 가벼운 걷기, 수영, 요가 등은 노년기에 적합한 운동입니다.</p>

		<h3>2. 균형 잡힌 식단</h3>
		<p>노년기에는 영양소가 풍부한 음식을 섭취하는 것이 매우 중요합니다. 신선한 과일, 채소, 통곡물, 단백질이 풍부한
			음식을 섭취하고, 포화지방과 당분이 많은 음식은 피하는 것이 좋습니다. 또한 충분한 수분 섭취도 신체 기능 유지에 도움을
			줍니다.</p>

		<h3>3. 정기적인 건강 검진</h3>
		<p>정기적인 건강 검진은 노년기에 발생할 수 있는 다양한 질병을 조기에 발견하고, 그에 맞는 치료를 받을 수 있도록
			도와줍니다. 특히, 고혈압, 당뇨, 심혈관 질환 등은 정기적으로 관리해야 합니다.</p>

		<h2>정신 건강 관리</h2>
		<hr>
		<p>신체적인 건강과 함께 정신적인 건강도 중요합니다. 노년기에 접어들면 외로움, 우울감, 인지 기능 저하 등의 문제가
			발생할 수 있습니다. 이를 예방하고 관리하기 위해 다음과 같은 방법들이 필요합니다.</p>

		<h3>1. 사회적 활동 유지</h3>
		<p>사회적 상호작용은 정신 건강을 유지하는 데 매우 중요합니다. 친구나 가족과의 교류를 유지하고, 지역사회 모임에
			참여하는 등 사회적인 활동을 지속하는 것이 좋습니다. 고립감을 줄이고 정신적 안정을 유지하는 데 도움이 됩니다.</p>

		<h3>2. 인지 기능 강화</h3>
		<p>노년기에는 인지 기능 저하가 나타날 수 있지만, 이를 예방하기 위한 방법도 존재합니다. 독서, 퍼즐 풀기, 새로운
			취미 배우기 등은 뇌를 활성화시키고 인지 기능을 유지하는 데 도움이 됩니다.</p>

		<h3>3. 스트레스 관리</h3>
		<p>스트레스는 모든 연령에서 건강에 영향을 미칠 수 있으며, 노년기에도 마찬가지입니다. 명상, 요가, 깊은 호흡 운동
			등은 스트레스를 줄이고 마음의 평화를 유지하는 데 도움이 됩니다.</p>
		<img alt="" src="/resources/img/honey/silver2.jpg">
		<h2>노년기 건강을 위한 생활 습관</h2>
		<hr>
		<p>노년기에 건강을 유지하기 위해서는 몇 가지 기본적인 생활 습관을 갖추는 것이 중요합니다:</p>
		<ul>
			<li>규칙적인 수면 패턴 유지</li>
			<li>적절한 식사 시간과 건강한 음식 섭취</li>
			<li>스트레스 관리 및 충분한 휴식</li>
			<li>가벼운 신체 활동을 일상에 포함</li>
			<li>정기적인 건강 검진을 통해 조기 질병 발견</li>
		</ul>
		<img alt="" src="/resources/img/honey/silver3.jpg">

		<h2>노년기 질병 예방</h2>
		<hr>
		<p>노년기에는 다양한 질병의 위험이 증가합니다. 이러한 질병을 예방하기 위해 건강한 생활 습관을 유지하고 정기적으로
			건강을 체크하는 것이 중요합니다. 고혈압, 당뇨, 심혈관 질환 등은 정기 검진을 통해 조기에 발견하고 관리할 수 있습니다.</p>

		<p>백신 접종 또한 노년기에 필수적인 예방 조치 중 하나입니다. 특히, 독감 백신과 폐렴 백신은 노년층에게 권장되며,
			이를 통해 심각한 질병을 예방할 수 있습니다.</p>

		<h2>결론</h2>
		<hr>
		<p>노년기는 신체적, 정신적 건강 관리가 중요한 시기입니다. 규칙적인 운동과 균형 잡힌 식단, 사회적 상호작용을 통해
			건강한 노년을 보낼 수 있습니다. 정기적인 건강 검진을 통해 질병을 예방하고, 건강한 생활 습관을 유지함으로써 삶의 질을
			향상시킬 수 있습니다.</p>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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