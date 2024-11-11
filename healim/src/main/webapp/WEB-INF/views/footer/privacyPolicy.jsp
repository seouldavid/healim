<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤아림 - 개인정보처리방침</title>
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
		<div class="logoheader" onclick="location.href='/home'">
			<img class="logoimg" src="/resources/img/main.png">
		</div>
		
		<h1>개인정보처리방침</h1>

		<div class="section">
			<h2>제1조 (목적)</h2>
			<hr>
			<p>본 개인정보처리방침은 헤아림(이하 "회사"라 함)이 제공하는 플랫폼 서비스(이하 "서비스"라 함)를 이용하는
				회원의 개인정보를 보호하고 그와 관련된 고충을 원활하게 처리할 수 있도록 하기 위한 방침입니다.</p>
		</div>

		<div class="section">
			<h2>제2조 (개인정보의 수집항목 및 방법)</h2>
			<hr>
			<p>회사는 서비스 제공을 위해 다음과 같은 개인정보를 수집하고 있습니다.</p>
			<ol>
				<li>회원가입 시: 이름, 이메일, 비밀번호, 전화번호</li>
				<li>서비스 이용 과정에서: 서비스 이용 기록, 접속 IP 정보, 쿠키, 결제 기록</li>
			</ol>
			<p>회사는 다음과 같은 방법으로 개인정보를 수집합니다.</p>
			<ul>
				<li>회원가입 및 서비스 이용 과정에서 회원이 직접 입력하는 정보</li>
				<li>서비스 사용 중 자동으로 생성되는 정보</li>
			</ul>
		</div>

		<div class="section">
			<h2>제3조 (개인정보의 수집 및 이용목적)</h2>
			<hr>
			<p>회사는 수집한 개인정보를 다음의 목적을 위해 사용합니다.</p>
			<ol>
				<li>회원관리: 회원제 서비스 이용에 따른 본인확인, 회원 식별, 불량 회원의 부정 이용 방지</li>
				<li>서비스 제공: 맞춤형 요양시설 추천, 예약 및 상담 서비스 제공</li>
				<li>마케팅 및 광고: 신규 서비스 안내, 이벤트 정보 제공</li>
				<li>서비스 개선: 고객 문의 처리, 설문조사 및 통계 분석을 통한 서비스 개선</li>
			</ol>
		</div>

		<div class="section">
			<h2>제4조 (개인정보의 보유 및 이용기간)</h2>
			<hr>
			<p>회사는 원칙적으로 개인정보의 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의
				정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
			<ol>
				<li>회원탈퇴 시 보유 개인정보
					<ul>
						<li>보존항목: 이름, 이메일, 서비스 이용 기록</li>
						<li>보존근거: 서비스 이용의 혼선 방지, 회원 문의 대응</li>
						<li>보존기간: 회원탈퇴 후 1년</li>
					</ul>
				</li>
				<li>관련 법령에 따른 보유 정보
					<ul>
						<li>계약 또는 청약철회 등에 관한 기록: 5년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
						<li>전자금융 거래에 관한 기록: 5년 (전자금융거래법)</li>
						<li>소비자의 불만 또는 분쟁 처리에 관한 기록: 3년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
					</ul>
				</li>
			</ol>
		</div>

		<div class="section">
			<h2>제5조 (개인정보의 제3자 제공)</h2>
			<hr>
			<p>회사는 회원의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 다음의 경우에는 예외로 합니다.</p>
			<ol>
				<li>회원이 사전에 동의한 경우</li>
				<li>법령의 규정에 의하거나, 수사 목적으로 법령에 따라 수사기관의 요청이 있는 경우</li>
				<li>서비스 제공을 위해 필요한 경우로서, 요양시설에 예약 및 상담 요청 정보를 제공하는 경우</li>
			</ol>
		</div>

		<div class="section">
			<h2>제6조 (개인정보의 처리 위탁)</h2>
			<hr>
			<p>회사는 원활한 서비스 제공을 위해 개인정보 처리를 외부 전문 업체에 위탁할 수 있습니다. 회사는 위탁 계약 시
				개인정보 보호법에 따라 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.</p>
		</div>

		<div class="section">
			<h2>제7조 (개인정보의 파기 절차 및 방법)</h2>
			<hr>
			<p>회사는 개인정보의 수집 및 이용 목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 개인정보 파기 절차 및
				방법은 다음과 같습니다.</p>
			<ol>
				<li>파기 절차: 회원이 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져 내부 방침 및
					기타 관련 법령에 따라 일정 기간 저장된 후 파기됩니다.</li>
				<li>파기 방법: 전자적 파일 형태의 정보는 복구가 불가능한 방법으로 영구 삭제하고, 종이에 출력된 개인정보는
					분쇄기로 분쇄하거나 소각하여 파기합니다.</li>
			</ol>
		</div>

		<div class="section">
			<h2>제8조 (회원의 권리와 그 행사 방법)</h2>
			<hr>
			<p>회원은 언제든지 자신의 개인정보를 조회하거나 수정할 수 있으며, 개인정보 제공에 대한 동의를 철회할 수
				있습니다. 또한, 회원은 회사가 보유하고 있는 본인의 개인정보에 대한 열람을 요구할 수 있으며, 잘못된 정보에 대해 정정
				또는 삭제를 요청할 수 있습니다.</p>
			<p>회원의 개인정보 조회 및 수정은 '내 정보 관리' 메뉴에서 직접 할 수 있으며, 동의 철회 및 삭제 요청은
				고객센터를 통해 가능합니다.</p>
		</div>

		<div class="section">
			<h2>제9조 (개인정보의 안전성 확보 조치)</h2>
			<hr>
			<p>회사는 회원의 개인정보를 안전하게 관리하기 위하여 다음과 같은 조치를 취하고 있습니다.</p>
			<ol>
				<li>개인정보의 암호화: 회원의 비밀번호는 암호화되어 저장 및 관리되며, 중요한 데이터는 파일 및 전송 데이터를
					암호화하거나 파일 잠금 기능을 사용하여 보호됩니다.</li>
				<li>해킹 등에 대비한 기술적 대책: 회사는 해킹이나 악성 코드에 의한 개인정보 유출을 방지하기 위해
					보안프로그램을 설치하고 주기적으로 점검 및 갱신을 시행하고 있습니다.</li>
				<li>개인정보 취급 직원의 최소화: 개인정보를 취급하는 직원을 최소화하고 관련 직원에게 교육을 실시하여 개인정보
					보호의 중요성을 인식시키고 있습니다.</li>
			</ol>
		</div>

		<div class="section">
			<h2>제10조 (개인정보 보호책임자)</h2>
			<hr>
			<p>회사는 개인정보 처리에 관한 업무를 총괄하여 책임지고, 개인정보 처리와 관련한 회원의 불만 처리 및 피해 구제
				등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p>
			<ul>
				<li>개인정보 보호책임자: 홍길동</li>
				<li>연락처: 031-123-4567</li>
				<li>이메일: privacy@hearim-platform.or.kr</li>
			</ul>
		</div>

		<div class="section">
			<h2>제11조 (개인정보처리방침의 변경)</h2>
			<hr>
			<p>이 개인정보처리방침은 2024년 10월 1일부터 적용됩니다. 회사는 법령이나 서비스의 변경사항을 반영하기 위해
				개인정보처리방침을 변경할 수 있으며, 변경된 사항은 웹사이트를 통해 공지합니다.</p>
		</div>
	</div>
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
