<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>만성 피로 정보</title>
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
	<div class="logoheader" onclick="location.href='/home'">
		<img class="logoimg" src="/resources/img/main.png">
	</div>

	<section>
		<header>
			<h1>항상 피곤하다면 만성피로</h1>
		</header>
		<div class="info">
			<span>건강 정보</span> <span>질병 관리</span>
		</div>

		<div class="buttons">
			<button>공유하기</button>

		</div>
		<img alt="" src="/resources/img/honey/tired1.webp">
		<h2>만성 피로란?</h2>
		<hr>
		<p>만성 피로는 피로감이 6개월 이상 지속되는 상태로, 일반적인 휴식이나 수면으로도 개선되지 않는 피로를 말합니다.
			이 상태는 단순한 피로와는 다르며, 일상 생활에 지장을 줄 정도로 심각할 수 있습니다. 이는 바이러스 감염 후 회복되지 못한
			신체의 기능 저하와 같은 복잡한 원인에 의해 발생할 수 있습니다.</p>

		<p>만성 피로는 현대 생활에서 점점 더 흔해지고 있으며, 많은 사람들에게 일상 생활에서 집중력 저하와 신체적 고통을
			유발합니다. 전 세계적으로 많은 의료진과 연구진이 만성 피로의 원인과 치료법을 연구하고 있지만, 아직까지 확실한 원인은
			밝혀지지 않았습니다.</p>

		<h2>주요 증상</h2>
		<hr>
		<p>만성 피로는 다양한 신체적, 정신적 증상으로 나타날 수 있습니다. 다음은 대표적인 증상입니다:</p>
		<ul>
			<li>장기간 지속되는 심한 피로감</li>
			<li>근육통, 관절통</li>
			<li>기억력 저하, 집중력 부족</li>
			<li>두통</li>
			<li>수면 장애</li>
			<li>림프절 압통</li>
			<li>목이나 인후통</li>
			<li>스트레스에 대한 저항력 감소</li>
			<li>기운이 없는 상태에서의 현기증 및 혼란</li>
			<li>체력 감소와 낮은 지구력</li>
		</ul>
		<img alt="" src="/resources/img/honey/tired3.webp">
		<h2>만성 피로의 원인</h2>
		<hr>
		<p>만성 피로의 원인은 명확하지 않으나, 다음과 같은 요인들이 복합적으로 작용할 수 있습니다:</p>
		<ul>
			<li>스트레스</li>
			<li>면역 체계의 이상</li>
			<li>바이러스 감염 (특히 감염 후 증상)</li>
			<li>호르몬 불균형</li>
			<li>환경적 요인 (예: 대기오염, 알레르기 반응)</li>
			<li>불규칙한 생활 습관</li>
			<li>심리적 요인, 예: 우울증, 불안증</li>
		</ul>
		<img alt="" src="/resources/img/honey/tired2.webp">
		<h2>만성 피로의 심각성</h2>
		<hr>
		<p>만성 피로는 단순한 일시적 피로와는 달리, 몇 년 동안 지속될 수 있으며, 그로 인해 개인의 사회적, 직업적 삶에
			큰 영향을 미칠 수 있습니다. 일부 환자들은 심각한 신체적 증상으로 인해 일상 생활의 기본적인 활동조차 수행하기
			어려워집니다. 특히, 일부 연구에서는 만성 피로가 우울증 및 불안증과 연관될 수 있다고 경고하고 있습니다.</p>

		<p>또한, 만성 피로 증상은 시간 경과에 따라 악화될 수 있으며, 많은 환자들은 점진적으로 증상이 심해져 의료
			전문가의 도움을 받게 됩니다. 신체적 활동이 제한되면 정신적인 부담이 증가하고, 이로 인해 만성 피로 증상이 더욱 복합적이고
			고통스러워질 수 있습니다.</p>

		<h2>만성 피로의 치료 방법</h2>
		<hr>
		<p>만성 피로는 아직 정확한 치료법이 없으나, 증상을 완화시키는 방법들이 존재합니다:</p>
		<ul>
			<li>균형 잡힌 식사와 규칙적인 운동</li>
			<li>충분한 수면과 휴식</li>
			<li>스트레스 관리 (명상, 요가 등)</li>
			<li>약물 치료 (필요 시 의사 처방)</li>
			<li>심리치료와 상담 치료</li>
			<li>자연 요법 및 대체 의학 (아로마 테라피, 한방 치료)</li>
		</ul>

		<h2>생활 습관 개선</h2>
		<hr>
		<p>만성 피로를 관리하기 위해서는 생활 습관을 개선하는 것이 중요합니다. 규칙적인 수면 패턴을 유지하고, 스트레스를
			줄이기 위한 다양한 활동을 시도하는 것이 도움이 됩니다. 또한, 영양소가 풍부한 음식을 섭취하고 적절한 운동을 통해 신체의
			면역력을 강화하는 것이 좋습니다.</p>

		<p>자신의 한계를 인식하고 과도한 신체 활동을 피하는 것도 중요합니다. 너무 많은 활동은 만성 피로 증상을 더욱
			악화시킬 수 있으며, 체력을 회복하기 위해서는 활동과 휴식의 적절한 균형을 유지해야 합니다.</p>

		<h2>예방과 관리</h2>
		<hr>
		<p>만성 피로를 예방하는 가장 좋은 방법 중 하나는 스트레스 관리입니다. 명상, 호흡 운동, 그리고 요가와 같은 이완
			기법은 스트레스를 줄이고 피로를 예방하는 데 도움이 됩니다. 또한, 과로를 피하고 일정한 일과를 유지하는 것도 중요합니다.
			스트레스를 줄이기 위해 건강한 사회적 관계를 유지하고, 자신을 돌보는 시간을 가지는 것이 필요합니다.</p>

		<p>만성 피로 증상이 지속될 경우, 전문가의 진단을 받아 정확한 원인을 파악하고 적절한 치료를 받는 것이 중요합니다.</p>
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