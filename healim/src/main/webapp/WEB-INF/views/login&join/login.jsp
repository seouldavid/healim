<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%@ page import="java.util.Arrays"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="styles.css">
<!-- 외부 CSS 파일 연결 -->
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

body {
	font-family: Arial, sans-serif;
	background-color: #e7f1ff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background-color: white;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px;
	text-align: center;
}

.logo {
	font-size: 24px;
	color: #333;
	text-decoration: none;
	display: block;
	margin-bottom: 20px;
}

h2 {
	margin-bottom: 20px;
}

.input-group {
	margin-bottom: 15px;
	text-align: left;
}

.input-group label {
	display: block;
	margin-bottom: 5px;
}

.input-group input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.remember-me {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 10px; /* 추가: 체크박스와 다른 요소 간의 공간 */
}

.remember-me input {
	margin-right: 5px; /* 체크박스와 라벨 사이의 간격 */
}

.find-link {
	font-size: 12px;
	color: #007bff;
	text-decoration: none;
}

.find-link:hover {
	text-decoration: underline;
}

.login-button {
	background-color: #007bff;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
}

.login-button:hover {
	background-color: #0056b3;
}

.social-login {
	margin-top: 20px;
}

.social-icons {
	display: flex;
	justify-content: center;
	gap: 15px;
}

.social-icons img {
	width: 30px;
	height: 30px;
}

.signup-text {
	margin-top: 20px;
}

.signup-link {
	color: #007bff;
	text-decoration: none;
}

.signup-link:hover {
	text-decoration: underline;
}

.logo {
	font-size: 60px;
	color: #333;
	text-decoration: none;
	display: block;
	margin-bottom: 20px;
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
</head>
<body>
	<!-- 로그인 실패 시 알림 표시 -->
	<c:if test="${not empty error}">
			<script type="text/javascript">
			alert("${error}");
			</script>
	</c:if>
	<!-- 로그인 실패 시 알림 표시 끝 -->

	<!-- '아이디 기억' 유무 확인 -->
	<c:set var="rememberedUserId" value="" />
	<%
	String rememberedUserId = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		rememberedUserId = Arrays.stream(cookies).filter(cookie -> "rememberedUserId".equals(cookie.getName())).findFirst()
		.map(Cookie::getValue).orElse(""); // id 정보가 없을 경우 빈 문자열
	}
	request.setAttribute("rememberedUserId", rememberedUserId);
	%>
	<!-- '아이디 기억' 유무 확인 끝 -->

	<div class="topper">
		<h1>
			<a href="/home"><img src="/resources/img/main.png"></a>
		</h1>
	</div>

	<nav class="floating-nav">
		<ul>
			<li><img src="/resources/img/hom4.jpg" alt="홈 이미지"> <a
				href="/home">홈</a></li>
			<li><img src="/resources/img/sangdam.jpg" alt="상담 사례 이미지"><a
				href="/consult_main">상담<br>사례
			</a></li>
			<li><img src="/resources/img/sisul.jpg" alt="시설 찾기 이미지"><a
				href="/region_selected">시설<br>찾기
			</a></li>
			<li><img src="/resources/img/my.jpg" alt="마이 페이지 이미지"><a
				href="/myPage">마이<br>페이지
			</a></li>
		</ul>
	</nav>

	<div class="container">
		<h2>로그인</h2>
		<form method="post" action="/login_login">
			<div class="input-group">
				<label for="mber_id">이메일</label> <input type="email" id="mber_id"
					name="mber_id" placeholder="아이디를 입력하세요."
					value="<%=rememberedUserId%>" required>
			</div>
			<div class="input-group">
				<label for="password">비밀번호</label>
				<div style="position: relative;">
					<input type="password" id="password" name="password"
						placeholder="비밀번호 입력" required />
					<button type="button" id="togglePassword"
						style="position: absolute; right: 10px; top: 10px; cursor: pointer;">
						A</button>
				</div>
			</div>
			<div class="remember-me">
				<label> <input type="checkbox" id="remember" name="remember"
					<%=rememberedUserId != null && !rememberedUserId.isEmpty() ? "checked" : ""%>>
					아이디 기억
				</label>
			</div>

			<button type="submit" class="login-button">로그인</button>
		</form>
		<div class="social-login">
			<span>또는</span>
			<div class="social-icons">
				<a href="https://www.kakao.com" target="_blank"> <img
					src="resources/img/kakao.jpg" alt="KakaoTalk"
					style="border-radius: 10px;">
				</a> <a href="https://www.naver.com" target="_blank"> <img
					src="resources/img/naver.jpg" alt="Naver"
					style="border-radius: 10px;">
				</a>
			</div>
		</div>
		<p class="signup-text">
			아직 회원이 아니신가요? <a href="/join" class="signup-link">회원가입</a>
		</p>
	</div>

	<!-- 비밀번호 가리기/보이기 기능 -->
	<script>
		document.getElementById('togglePassword').addEventListener('click',
				function() {
					const passwordInput = document.getElementById('password');
					const inputType = passwordInput.getAttribute('type');

					// 현재 input의 타입이 'password'이면 'text'로 변경하고, 아니면 'password'로 변경
					if (inputType === 'password') {
						passwordInput.setAttribute('type', 'text');
						this.textContent = '●'; // 아이콘 변경 (볼 때)
					} else {
						passwordInput.setAttribute('type', 'password');
						this.textContent = 'A'; // 아이콘 변경 (안 볼 때)
					}
				});
	</script>
	<!-- 비밀번호 가리기/보이기 기능 끝-->
	<!-- 아이디 기억 체크박스 기능 -->
	<script>
		window.onload = function() {
			const rememberedUserId = '<c:out value="${rememberedUserId}" />';
			if (rememberedUserId) {
				document.getElementById('remember').checked = true;
			}
		};
	</script>
	<!-- 아이디 기억 체크박스 기능 끝-->
</body>
</html>