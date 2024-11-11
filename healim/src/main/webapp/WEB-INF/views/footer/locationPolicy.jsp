<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤아림 - 위치정보 이용약관</title>
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
	<div class="container">
	<div class="logoheader"  onclick="location.href='/home'">
		<img class="logoimg" src="/resources/img/main.png">
	</div>
		<h1>위치정보 이용약관</h1>

		<div class="section">
			<h2>제1조 (목적)</h2><hr>
			<p>본 약관은 헤아림(이하 "회사"라 함)이 제공하는 위치기반 서비스(이하 "서비스"라 함)와 관련하여 회사와
				위치정보주체(이하 "회원"이라 함) 간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
		</div>

		<div class="section">
			<h2>제2조 (위치정보의 수집 및 이용)</h2><hr>
			<p>회사는 회원의 위치정보를 기반으로 다음과 같은 서비스를 제공합니다.</p>
			<ol>
				<li>회원 주변의 요양시설 검색 및 추천 서비스</li>
				<li>회원이 설정한 위치를 기반으로 한 맞춤형 요양시설 정보 제공</li>
				<li>요양시설 방문 상담 및 예약 서비스</li>
			</ol>
			<p>회사는 회원의 위치정보를 수집할 경우, 관련 법령에 따라 회원의 동의를 받아 위치정보를 수집 및 이용합니다.
				위치정보는 회원의 스마트폰 GPS, Wi-Fi, 블루투스 신호 등 다양한 위치기반 기술을 통해 수집됩니다.</p>
		</div>

		<div class="section">
			<h2>제3조 (위치정보의 보유 및 이용기간)</h2><hr>
			<p>회사는 위치기반 서비스를 제공하기 위해 수집된 위치정보를 필요한 범위 내에서만 보유 및 이용합니다. 위치정보는
				해당 서비스 제공을 위해 실시간으로 수집되며, 서비스 제공이 완료되면 지체 없이 파기됩니다. 단, 위치정보 주체의 별도
				동의가 있는 경우 또는 관련 법령에 따라 보존해야 하는 경우에는 예외로 합니다.</p>
		</div>

		<div class="section">
			<h2>제4조 (위치정보의 제3자 제공)</h2><hr>
			<p>회사는 원칙적으로 회원의 위치정보를 외부에 제공하지 않습니다. 다만, 다음의 경우에는 예외로 합니다.</p>
			<ol>
				<li>회원이 사전에 동의한 경우</li>
				<li>법령의 규정에 의하거나, 수사 목적으로 법령에 따라 수사기관의 요청이 있는 경우</li>
				<li>서비스 제공을 위해 불가피하게 제3자에게 위치정보를 제공해야 하는 경우</li>
			</ol>
			<p>위치정보를 제3자에게 제공할 경우, 회사는 회원에게 사전 동의를 받아야 하며, 제공되는 위치정보와 수집 목적을
				명확히 고지합니다.</p>
		</div>

		<div class="section">
			<h2>제5조 (개인위치정보의 보호)</h2><hr>
			<p>회사는 회원의 개인위치정보를 안전하게 관리하기 위해 개인정보 보호법 및 위치정보의 보호 및 이용 등에 관한
				법률에 따라 적절한 보호조치를 취하고 있습니다. 위치정보는 암호화된 상태로 안전하게 저장되며, 불법적인 접근 및 노출을
				방지하기 위해 보안 조치를 시행하고 있습니다.</p>
			<p>또한, 회원의 개인위치정보는 회사가 지정한 책임자에 의해 관리되며, 회원의 동의 없이 제3자에게 제공되지
				않습니다.</p>
		</div>

		<div class="section">
			<h2>제6조 (위치정보주체의 권리)</h2><hr>
			<p>회원은 위치정보의 수집, 이용, 제공에 대한 동의를 언제든지 철회할 수 있습니다. 또한, 회원은 회사가 보유하고
				있는 자신의 위치정보에 대해 열람, 정정, 삭제를 요구할 수 있습니다.</p>
			<p>회원이 위치정보 제공에 대한 동의를 철회하거나 위치정보의 삭제를 요청할 경우, 회사는 지체 없이 이를 처리하며,
				해당 위치기반 서비스 이용이 제한될 수 있음을 고지합니다.</p>
		</div>

		<div class="section">
			<h2>제7조 (위치정보 이용 및 제공 사실 확인자료의 보유)</h2><hr>
			<p>회사는 위치정보 이용 및 제공 사실 확인자료를 위치정보의 보호 및 이용 등에 관한 법률에 따라 6개월 이상
				보관하며, 회원의 요청이 있을 경우 이를 열람할 수 있도록 합니다.</p>
			<p>해당 자료는 회원의 서비스 이용 내역을 확인하거나 법적 분쟁 발생 시 중요한 자료로 사용될 수 있습니다.</p>
		</div>

		<div class="section">
			<h2>제8조 (8세 이하의 아동 등 보호의무자의 권리)</h2><hr>
			<p>회사는 다음에 해당하는 자(이하 "8세 이하의 아동 등"이라 함)의 보호의무자가 그들의 위치정보를 제공하거나
				이용할 수 있도록 동의를 받을 수 있습니다.</p>
			<ol>
				<li>8세 이하의 아동</li>
				<li>피성년후견인</li>
				<li>장애인복지법에 따른 정신적 장애를 가진 자로서 중증장애인에 해당하는 자</li>
			</ol>
			<p>이 경우 보호의무자는 해당 아동 등의 생명이나 신체 보호를 위하여 위치정보 제공에 동의할 수 있으며, 동의
				시에는 보호의무자임을 증명하는 서류를 회사에 제출해야 합니다.</p>
		</div>

		<div class="section">
			<h2>제9조 (위치기반 서비스의 변경 및 중지)</h2><hr>
			<p>회사는 위치기반 서비스의 내용이나 기술적 사양 등을 변경할 수 있으며, 변경 사항은 사전에 회원에게 공지합니다.
			</p>
			<p>또한, 회사는 천재지변, 전쟁, 기술적 문제 등 불가항력적인 사유로 인해 위치기반 서비스를 중지할 수 있으며,
				이 경우 회원에게 지체 없이 통지합니다.</p>
		</div>

		<div class="section">
			<h2>제10조 (면책사항)</h2><hr>
			<p>회사는 다음의 경우에는 책임을 지지 않습니다.</p>
			<ol>
				<li>회원의 부주의로 위치정보가 유출되거나 오용된 경우</li>
				<li>회원이 위치정보 제공에 동의하지 않아 위치기반 서비스를 이용하지 못한 경우</li>
				<li>천재지변 또는 불가항력으로 인해 위치기반 서비스를 제공할 수 없는 경우</li>
			</ol>
		</div>

		<div class="section">
			<h2>제11조 (위치정보관리 책임자 지정)</h2><hr>
			<p>회사는 위치정보를 적절히 관리하고 보호하기 위해 위치정보관리 책임자를 지정하고 있습니다. 위치정보관리 책임자는
				위치정보와 관련된 회원의 불만 처리 및 피해 구제를 담당합니다.</p>
			<ul>
				<li>위치정보관리 책임자: 홍길동</li>
				<li>연락처: 031-123-4567</li>
				<li>이메일: location@hearim-platform.or.kr</li>
			</ul>
		</div>

		<div class="section">
			<h2>제12조 (분쟁의 해결)</h2><hr>
			<p>회사와 회원 간에 발생한 위치정보와 관련된 분쟁은 협의를 통해 해결함을 원칙으로 하며, 협의가 원만하지 않은
				경우 위치정보의 보호 및 이용 등에 관한 법률에 따라 방송통신위원회에 재정을 신청하거나 서울중앙지방법원에 소를 제기할 수
				있습니다.</p>
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