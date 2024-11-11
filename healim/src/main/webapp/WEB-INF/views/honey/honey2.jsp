<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>우울증 정보</title>
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
			<h1>우울증 정보</h1>
		</header>
		<div class="info">
			<span>정신 건강</span> <span>우울증 관리</span>
		</div>

		<div class="buttons">
			<button>공유하기</button>
		</div>
		<img alt="" src="/resources/img/honey/despression1.jpeg">
		<h2>우울증이란?</h2>
		<hr>
		<p>우울증은 단순한 일시적 기분 저하와는 다른 심각한 정신 건강 문제로, 장기간 지속되는 깊은 슬픔, 무기력감, 흥미
			상실 등을 특징으로 합니다. 우울증은 개인의 일상 생활, 직업, 관계 등에 큰 영향을 미치며, 적절한 치료와 관리가
			필요합니다.</p>

		<h2>우울증의 주요 증상</h2>
		<hr>
		<p>우울증은 다양한 증상으로 나타날 수 있으며, 다음과 같은 증상이 2주 이상 지속된다면 전문가의 진단을 받아보는
			것이 중요합니다:</p>
		<ul>
			<li>지속적인 슬픔, 무기력감</li>
			<li>일상적인 활동에 대한 흥미와 즐거움 상실</li>
			<li>수면 장애 (불면증 또는 과다수면)</li>
			<li>식욕 감소 또는 과도한 식욕</li>
			<li>집중력 저하 및 결정 장애</li>
			<li>피로감 및 에너지 부족</li>
			<li>자살 생각 또는 자해 충동</li>
			<li>타인과의 관계에서의 거리감 또는 소외감</li>
		</ul>
		<img alt="" src="/resources/img/honey/despression2.jpeg">
		<h2>우울증 악화에 영향을 미치는 습관들</h2>
		<hr>
		<p>우울증이 악화되는 원인은 다양하지만, 일상 생활에서의 부정적인 습관들이 증상을 더 심화시킬 수 있습니다. 이러한
			습관들을 인지하고 교정하는 것이 우울증을 완화하는 데 중요합니다.</p>

		<h3>1. 불규칙한 수면 패턴</h3>
		<p>불규칙한 수면 시간과 수면 부족은 우울증을 악화시킬 수 있는 주요 요인입니다. 수면은 정신 건강을 유지하는 데
			중요한 역할을 하며, 부족한 수면은 감정 조절 능력을 저하시킵니다. 규칙적인 수면 패턴을 유지하고, 매일 일정한 시간에
			잠자리에 드는 것이 필요합니다.</p>

		<h3>2. 지나친 음주 및 흡연</h3>
		<p>일부 사람들은 스트레스를 해소하기 위해 음주나 흡연에 의존하지만, 이러한 습관들은 장기적으로 우울증을 악화시킬 수
			있습니다. 알코올은 뇌의 신경전달물질에 영향을 주어 우울감을 더 심하게 만들 수 있으며, 흡연 역시 신경 시스템에 부정적인
			영향을 미칩니다.</p>

		<h3>3. 과도한 소셜 미디어 사용</h3>
		<p>소셜 미디어에서 끊임없이 다른 사람들의 '완벽해 보이는' 삶을 보면서 자신을 비교하는 것은 우울감을 증가시킬 수
			있습니다. 소셜 미디어 사용 시간을 줄이고, 자신만의 시간을 가지며, 오프라인 활동에 참여하는 것이 정신 건강에 긍정적인
			영향을 미칠 수 있습니다.</p>

		<h3>4. 신체 활동 부족</h3>
		<p>신체 활동 부족은 우울증을 악화시키는 요인 중 하나입니다. 운동은 신체적인 건강을 증진시킬 뿐만 아니라, 엔돌핀과
			같은 '행복 호르몬'을 분비하게 하여 기분을 좋게 만듭니다. 가벼운 산책이나 스트레칭이라도 규칙적으로 실시하는 것이
			중요합니다.</p>

		<h3>5. 고립과 사회적 상호작용 부족</h3>
		<p>우울증이 있을 때 다른 사람들과의 상호작용을 피하고 고립되는 경우가 많지만, 이는 오히려 증상을 악화시킬 수
			있습니다. 사회적 지지망을 유지하고 가족, 친구들과의 소통을 지속하는 것이 정신 건강 회복에 도움이 됩니다.</p>

		<h3>6. 불균형한 식사</h3>
		<p>건강에 좋은 음식을 섭취하는 것은 우울증을 예방하고 관리하는 데 큰 도움이 됩니다. 반면, 당분이 높은 음식이나
			가공 식품의 과도한 섭취는 우울증 증상을 악화시킬 수 있습니다. 신선한 야채와 과일, 단백질, 그리고 건강한 지방을 포함한
			균형 잡힌 식단을 유지하는 것이 중요합니다.</p>
		<img alt="" src="/resources/img/honey/despression3.jpeg">
		<h2>우울증 관리 방법</h2>
		<hr>
		<p>우울증을 관리하기 위한 방법은 개인마다 다를 수 있지만, 다음과 같은 방법들이 도움이 될 수 있습니다:</p>
		<ul>
			<li>정기적인 상담 치료 (심리 치료사 또는 정신과 의사와의 대화)</li>
			<li>약물 치료 (필요시 항우울제 처방)</li>
			<li>규칙적인 운동 및 신체 활동</li>
			<li>사회적 상호작용 유지</li>
			<li>명상, 요가, 호흡 운동 등 이완 기법 활용</li>
			<li>긍정적인 생활 습관 유지 (규칙적인 수면, 건강한 식사)</li>
		</ul>

		<h2>결론</h2>
		<hr>
		<p>우울증은 매우 심각한 정신 건강 문제로, 적절한 치료와 관리가 필요합니다. 우울증을 악화시키는 습관을 피하고,
			건강한 생활 습관을 유지하는 것이 중요합니다. 우울증 증상이 장기화되거나 악화될 경우, 전문가의 도움을 받는 것이
			필수적입니다.</p>
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