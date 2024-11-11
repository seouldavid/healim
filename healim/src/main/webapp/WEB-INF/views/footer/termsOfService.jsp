<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤아림 - 이용약관</title>
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

.section ol, .section ul {
	margin-left: 20px;
}

.section ol li {
	margin-bottom: 10px;
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

<div class="logoheader"  onclick="location.href='/home'">
		<img class="logoimg" src="/resources/img/main.png">
	</div>
	
	<div class="container">
		<h1>이용약관</h1>

		<div class="section">
			<h2>제1조 (목적)</h2><hr>
			<p>본 약관은 헤아림(이하 "회사"라 함)이 제공하는 플랫폼 서비스(이하 "서비스"라 함)의 이용과 관련하여 회사와
				회원 간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
		</div>

		<div class="section">
			<h2>제2조 (정의)</h2><hr>
			<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
			<ol>
				<li>"서비스"란 회사가 제공하는 요양시설 중개 플랫폼 서비스를 말합니다.</li>
				<li>"회원"이란 회사의 서비스에 접속하여 본 약관에 따라 서비스를 이용하는 자를 의미합니다.</li>
				<li>"요양시설"이란 회사가 회원에게 소개하고 중개하는 노인 요양 및 케어를 제공하는 시설을 의미합니다.</li>
				<li>"계정"이란 회원이 서비스를 이용하기 위해 등록한 이메일 주소와 비밀번호의 조합을 의미합니다.</li>
			</ol>
		</div>

		<div class="section">
			<h2>제3조 (약관의 효력 및 변경)</h2><hr>
			<p>
				1. 본 약관은 서비스를 이용하고자 하는 모든 회원에게 그 효력이 발생합니다. <br> 2. 회사는 합리적인
				이유가 있는 경우 관련 법령을 위반하지 않는 범위에서 본 약관을 변경할 수 있습니다. <br> 3. 회사가 약관을
				변경할 경우, 변경 내용과 적용 일자를 공지합니다. 회원이 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단하고 탈퇴할
				수 있습니다.
			</p>
		</div>

		<div class="section">
			<h2>제4조 (회원가입 및 계정관리)</h2><hr>
			<ol>
				<li>회원은 회사가 정한 절차에 따라 회원가입을 신청하고, 회사는 이러한 신청에 대해 승낙함으로써 회원가입이
					완료됩니다.</li>
				<li>회원은 자신의 계정 정보가 타인에게 노출되지 않도록 해야 하며, 계정 정보가 부정하게 사용된 경우 즉시
					회사에 알려야 합니다.</li>
				<li>회사는 회원이 법령 및 본 약관을 위반하는 경우, 서비스 이용을 제한하거나 계정을 삭제할 수 있습니다.</li>
			</ol>
		</div>

		<div class="section">
			<h2>제5조 (서비스의 제공 및 변경)</h2><hr>
			<p>회사는 회원에게 다음과 같은 서비스를 제공합니다:</p>
			<ol>
				<li>요양시설 정보 제공 및 중개 서비스</li>
				<li>회원 맞춤형 요양시설 추천 서비스</li>
				<li>요양시설 예약 및 상담 서비스</li>
				<li>기타 회사가 정하는 서비스</li>
			</ol>
			<p>회사는 필요한 경우 서비스의 내용을 변경할 수 있으며, 이러한 변경 사항은 사전에 공지합니다.</p>
		</div>

		<div class="section">
			<h2>제6조 (서비스의 이용시간)</h2><hr>
			<p>
				1. 회사는 연중무휴 24시간 서비스를 제공합니다. 다만, 시스템 점검이나 기술적인 이유로 인해 일시적으로 서비스를 중단할
				수 있으며, 이 경우 사전에 공지합니다. <br> 2. 회사는 불가피한 사유가 있을 경우 사전 통지 없이 서비스의
				전부 또는 일부를 일시적으로 중단할 수 있습니다.
			</p>
		</div>

		<div class="section">
			<h2>제7조 (회원의 의무)</h2><hr>
			<p>회원은 다음 행위를 해서는 안 됩니다:</p>
			<ol>
				<li>타인의 계정을 도용하거나 부정하게 사용하는 행위</li>
				<li>서비스의 운영을 방해하거나 회사의 서버 및 네트워크에 무단으로 접근하는 행위</li>
				<li>타인의 명예를 손상시키거나 불이익을 주는 행위</li>
				<li>회사 또는 제3자의 지적 재산권을 침해하는 행위</li>
				<li>기타 법령에 위배되는 행위</li>
			</ol>
		</div>

		<div class="section">
			<h2>제8조 (개인정보 보호)</h2><hr>
			<p>회사는 회원의 개인정보를 관련 법령에 따라 보호하며, 개인정보 처리방침에 따라 이를 관리합니다.</p>
		</div>

		<div class="section">
			<h2>제9조 (면책조항)</h2><hr>
			<ol>
				<li>회사는 회원이 서비스를 이용하여 기대하는 수익을 얻지 못한 것에 대해 책임을 지지 않습니다.</li>
				<li>회사는 회원 간 또는 회원과 제3자 간의 상호 거래에 있어서 발생하는 문제에 대해 책임을 지지 않습니다.
				</li>
				<li>회사는 천재지변, 전쟁, 파업, 정부의 규제 등 불가항력으로 인해 서비스를 제공할 수 없는 경우, 그에
					대한 책임이 면제됩니다.</li>
			</ol>
		</div>

		<div class="section">
			<h2>제10조 (분쟁 해결)</h2><hr>
			<p>본 약관과 관련하여 회사와 회원 간에 발생한 분쟁에 대해서는 대한민국 법을 준거법으로 하며, 분쟁이 발생할 경우
				회사의 소재지 관할 법원을 관할 법원으로 합니다.</p>
		</div>

		<div class="section">
			<h2>부칙</h2><hr>
			<p>이 약관은 2024년 10월 1일부터 적용됩니다.</p>
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
