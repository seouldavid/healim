<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
  

<style>
    body {

      background-color: #fdfdfd;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* 화면 높이를 기준으로 중앙 정렬 */
      padding-left: 0px; /* 사이드바 공간 확보 */
    }

    .container {
    
      background-color: white;
      padding: 40px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 400px;
      text-align: center;
      font-size: 25px;
    }

    .logo {
      font-size: 80px;
      color: #333;
      text-decoration: none;
      display: block;
      margin-bottom: 20px;
    }

    h2 {
      margin-bottom: 20px;
      font-size: 40px;
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

    .checkbox-group {
      text-align: left;
      margin-bottom: 15px;
    }

    .checkbox-group input {
      margin-right: 5px; /* 체크박스와 라벨 사이의 간격 */
    }

    .signup-button {
      background-color: #0379b9;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
    }

    .signup-button:hover {
      background-color: #6dd0df;
    }
    
    .signup-button:disabled {
            background-color: lightgray;
            cursor: not-allowed;
     }

    /* 비밀번호와 변경 버튼을 같은 행에 배치 */
    .input-group-password {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 15px;
    }

    .input-group-password input {
      flex: 1;
      margin-right: 10px; /* 버튼과의 간격 */
    }

    .change-button {
      background-color: #037aba;
      color: #eaf2f8;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .change-button:hover {
      background-color: #6dd0df;
    }

    /* 사이드바 스타일 */
    .sidebar {
      position: fixed;
      left: 0;
      top: 0;
      width: 200px;
      height: 100%;
      background-color: #ceeafb; /* 배경색과 동일하게 */
      color: black;
      display: flex;
      flex-direction: column;
      justify-content: center; /* 세로 가운데 정렬 */
      align-items: center; /* 가로 가운데 정렬 */
      box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
      font-weight: bold;
    }

    .sidebar a {
      display: block;
      color: #000000;
      padding: 10px 20px;
      text-decoration: none;
      font-size: 25px; /* 글자 크기 줄임 */
      text-align: center;
    }

    .sidebar a:hover {
      background-color: #9cd2ec; /* 호버시 배경색 변경 */
      border-radius: 5px;
    }
	.topper {
		position:fixed;
		top: 0px;
		left: 50%;
		   transform: translateX(-50%);
	        justify-content: center;
	        z-index: 10; /* 다른 요소 위로 배치 */
	}
	.topper img {
		width: 300px;
		height: auto;
		display: inline-block;
		margin-top: 0px;
	
		
	}
	
	.email-container {
	        position: relative;
	        width: 100%;
	}
	
	.input-group input,
	.email-container input {
	        width: 100%; /* input이 컨테이너 크기만큼 */
	        box-sizing: border-box; /* 패딩 포함 너비 계산 */
	}
	
	.helper-text {
	        position: absolute;
	        right: 10px; /* 오른쪽 여백 */
	        top: 30%;
	        color: #999;
	        font-size: 10pt;
	        pointer-events: none;
	}
	
	/* 비밀번호 토글 버튼 스타일 */
    .password-container {
        display: flex;
        align-items: center;
    }

    .password-container input {
        flex: 1;
        box-sizing: border-box;
    }

    .toggle-password {
        margin-left: 5px;
        padding: 6px;
        background-color: #ccc;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .toggle-password:hover {
        background-color: #bbb;
    }
</style>

</head>
<body>
  <div class="topper">
		<h1>
			<a href="/home"><img src="/resources/img/main.png"></a>
		</h1>
	</div>
	
	<c:if test="${not empty editchk}">
			<script>
				alert("${editchk}");
			</script>
	</c:if>
<!-- 사이드바 -->
<div class="sidebar">
  <a href="/myPage">계정 정보</a>
  <a href="/zzim">손길 목록</a>
  <a href="/recent">최근 본 요양시설</a>
  <a href="/inq">문의내역</a>
  <a href="/myPost">내가 쓴 글</a>
</div>

<div class="container">
  
  <h2>계정정보</h2>
  <form action="/myPage_update" id="signupForm" method="post">
    <div class="input-group">
      <label for="mber_nm">이름</label>
      <input type="text" id="mber_nm" name="mber_nm" placeholder="이름을 입력하세요." maxlength="20" value="${jvo.mber_nm}"required>
    </div>
    
    <div class="input-group">
      <label for="mber_id">이메일</label>
      <div class="email-container">
      <input type="email" id="mber_id" name="mber_id" value="${jvo.mber_id}" disabled>
      <span class="helper-text">이메일 변경은 문의 바랍니다.</span>
    </div>
      <input type="hidden" name="mber_id" value="${jvo.mber_id}">
    </div>
    
    <div class="input-group">
      <label for="password">비밀번호</label>
      <div class="password-container">
      <input type="password" id="password" name="password" placeholder="영문, 숫자, 특수문자가 모두 포함된 8~20자" 
      pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}" required>
      <button type="button" class="toggle-password" onclick="togglePassword('password')">보기</button>
      </div>
    </div>
    
    <div class="input-group">
      <label for="confirm_password">비밀번호 확인</label>
      <div class="password-container">
      <input type="password" id="confirm_password" name="confirm_password" placeholder="비밀번호 다시 입력해주세요" required>
      <button type="button" class="toggle-password" onclick="togglePassword('confirm_password')">보기</button>
      </div>
    </div>
    
    <div class="input-group">
      <label for="mbtlnum">전화번호</label>
      <input type="tel" id="mbtlnum" name="mbtlnum" placeholder="전화번호 입력해주세요." value="${jvo.mbtlnum}" 
      pattern="010-\d{4}-\d{4}" title="010-XXXX-XXXX 형식의 11자리 숫자를 입력해 주세요." required>
    </div>
    <button type="submit" class="signup-button" disabled>변경사항 저장</button>
  </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

 //비밀번호 표시/숨기기 기능
 function togglePassword(fieldId) {
    const passwordField = document.getElementById(fieldId);
    const toggleButton = passwordField.nextElementSibling;
    
    if (passwordField.type === "password") {
        passwordField.type = "text";
        toggleButton.textContent = "숨기기";
    } else {
        passwordField.type = "password";
        toggleButton.textContent = "보기";
    }
 }
 
 $(document).ready(function () {
     // 입력 필드 또는 체크박스 변경 시 폼 유효성 검증
     $('#mber_id, #mber_nm, #mbtlnum, #password, #confirm_password').on('input change', function () {
         validateForm();
     });

     // 폼의 모든 필드 및 체크박스가 올바르게 채워졌는지 확인하는 함수
     function validateForm() {
         const email = $('#mber_id').val().trim();
         const nickname = $('#mber_nm').val().trim();
         const phone = $('#mbtlnum').val().trim();
         const password = $('#password').val().trim();
         const confirmPassword = $('#confirm_password').val().trim();

         if (email !== '' && nickname !== '' &&
             phone !== '' && password !== '' && confirmPassword !== '') {
             $('.signup-button').prop('disabled', false);
         } else {
             $('.signup-button').prop('disabled', true);
         }
     }

     // 가입 버튼 클릭 시 비활성화 상태 확인
     $('#signupForm').on('submit', function (event) {
         if ($('.signup-button').prop('disabled')) {
             event.preventDefault();
             alert('모든 필드를 올바르게 입력하고 이메일 중복 여부를 확인해 주세요.');
         }
     });

     // 비밀번호 확인 검증
     $('#confirm_password').on('keyup', function () {
         const password = $('#password').val();
         const confirmPassword = $('#confirm_password').val();
         if (password !== confirmPassword) {
             $('#confirm_password')[0].setCustomValidity('비밀번호가 일치하지 않습니다.');
         } else {
             $('#confirm_password')[0].setCustomValidity('');
         }
     });
 });
 </script>
</body>
</html>