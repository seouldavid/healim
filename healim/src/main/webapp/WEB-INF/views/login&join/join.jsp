<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
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
            margin-top: 40px; /* 로고 아래 여백 추가 */
        }

        .topper {
            text-align: center; /* 중앙 정렬 */
            margin-bottom: 20px; /* 컨테이너와의 여백 */
        }

        .topper img {
            width: 300px; /* 로고 크기 조정 */
            height: auto; /* 비율에 맞게 높이 자동 조정 */
        }

        h2 {
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .input-group1 {
            text-align: right;
        }

        .input-group2 {
            text-align: right;
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
            margin-right: 5px;
        }

        .signup-button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .signup-button:hover {
            background-color: #0056b3;
        }
        
        .signup-button:disabled {
            background-color: lightgray;
            cursor: not-allowed;
        }

        .certification-button {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: auto;
            font-size: 14px;
        }

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

    <nav class="floating-nav">
        <ul>
            <li><img src="/resources/img/hom4.jpg" alt="홈 이미지"> <a href="/home">홈</a></li>
            <li><img src="/resources/img/sangdam.jpg" alt="상담 사례 이미지"><a href="/consult_main">상담<br>사례</a></li>
            <li><img src="/resources/img/sisul.jpg" alt="시설 찾기 이미지"> <a href="/region_selected">시설<br>찾기</a></li>
            <li><img src="/resources/img/my.jpg" alt="마이 페이지 이미지"> <a href="/myPage">마이<br>페이지</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="topper">
            <h1>
                <a href="/home"><img src="/resources/img/main.png"></a>
            </h1>
        </div>
        <h2>회원가입</h2>
        
        
        <!-- 이메일 전송 폼 -->
       	<form action="/email_send" method="post" id="emailForm">
            <div class="input-group">
            <label for="email">이메일</label>
            <input type="email" name="mber_id" id="mber_id"
                value="${mber_id}" 
                pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" 
                placeholder="아이디로 사용할 이메일을 입력해 주세요." required>
          	<button type="button" id="checkEmailButton" style="margin-top: 10px;">중복 확인</button>
            <span id="emailCheckResult"></span>
            </div>
            <div class="input-group1">
                <button type="submit" id="sendAuthButton" disabled>인증번호 보내기</button>
            </div>
        </form>
        
        <!-- 인증번호 확인 폼 -->
        <form action="/email_send_chk" method="post" id="authForm">
            <div class="input-group">
                <label for="authNumber">인증번호</label>
                <input type="number" name="authNumber" id="authNumber" 
                value="${authNumber}"
                placeholder="인증번호를 입력하세요." maxlength="6" required>
                <input type="hidden" name="mber_id" value="${mber_id}">
            </div>
            <div class="input-group2">
                <button type="button" id="authCheckButton">인증번호 확인</button>
            </div>
        </form>    
        
       		<!-- 회원가입 폼 --> 
        	<form method="post" action="/join_ok" id="signupForm">
            <div class="input-group">
                <label for="nickname">닉네임</label> 
                <input type="text" name="mber_nm" id="mber_nm" placeholder="닉네임을 입력하세요. (2~20자)" maxlength="20" required>
            </div>
            <div class="input-group">
                <label for="phone">전화번호</label> 
                <input type="tel" name="mbtlnum"  id="mbtlnum" pattern="010-\d{4}-\d{4}" title="010-XXXX-XXXX 형식의 11자리 숫자를 입력해 주세요." placeholder="전화번호를 입력하세요." required>
            </div>
            
            <!-- 전화번호 인증 폼             
            	<div class="input-group">
                <label for="phone-certification">전화번호 인증번호</label> 
                <input type="number" id="phone-certification" placeholder="전화번호 인증번호 입력" required>
            </div>
            <div class="input-group1">
                <button type="submit" class="certification-button">인증번호 보내기</button>
            </div> -->
            
            <div class="input-group">
                <label for="password">비밀번호</label>
                <div class="password-container"> 
	                <input type="password" name="password" id="password" placeholder="영문, 숫자, 특수문자가 모두 포함된 8~20자" 
	                pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}"
	                title="영문, 숫자, 특수문자가 모두 포함된 8~20자 비밀번호를 입력하세요." required>
	                <button type="button" class="toggle-password" onclick="togglePassword('password')">보기</button>
            	</div>
            	
            </div>
            <div class="input-group">
                <label for="confirm-password">비밀번호 확인</label>
                <div class="password-container"> 
	                <input type="password" name="confirm_password" id="confirm_password" placeholder="비밀번호를 다시 입력하세요." required>
	                <button type="button" class="toggle-password" onclick="togglePassword('confirm_password')">보기</button>
	                <input type="hidden" name="mber_id" value="${mber_id}">
            	</div>
            </div>
            
            <div class="checkbox-group">
                <label><input type="checkbox" id="termsCheckbox" required> 이용약관 동의</label> 
                <label><input type="checkbox" id="privacyCheckbox" required> 개인정보 처리 수집 및 이용 동의</label>
                <label><input type="checkbox"> 마케팅 메일 수신 동의 (선택)</label>
            </div>
            <button type="submit" class="signup-button" disabled>가입</button>
            </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
	<script type="text/javascript">
	
	// 비밀번호 표시/숨기기 기능
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
        // 초기 로드 시 세션 스토리지에서 중복 여부와 메시지 가져오기
        let isEmailChecked = sessionStorage.getItem("isEmailChecked") === "true";
        let isAuthChecked = false;
        
        // 세션에 저장된 메시지가 있다면 출력
        const emailCheckMessage = sessionStorage.getItem("emailCheckMessage");
        if (isEmailChecked && emailCheckMessage) {
            $('#emailCheckResult').text(emailCheckMessage).css('color', 'green');
            $('#sendAuthButton').prop('disabled', false); // 인증 버튼 활성화
        } else {
            $('#sendAuthButton').prop('disabled', true); // 초기 상태 비활성화
        }

        // 이메일 입력 필드에서 키가 입력될 때마다 중복 상태 초기화
        $('#mber_id').on('input', function () {
            isEmailChecked = false;
            sessionStorage.removeItem("isEmailChecked");
            sessionStorage.removeItem("emailCheckMessage");
            $('#emailCheckResult').text(''); // 메시지 제거
            $('#sendAuthButton').prop('disabled', true); // 인증 버튼 비활성화
        });

        // 이메일 중복 확인 버튼 클릭 시 AJAX 요청
        $('#checkEmailButton').on('click', function () {
            const email = $('#mber_id').val();
            if (email === '') {
                alert('이메일을 입력하세요.');
                return;
            }
            
            $.ajax({
                url: '/checkEmail',
                type: 'POST',
                data: { mber_id: email },
                success: function (response) {
                    if (response === 'available') {
                        $('#emailCheckResult').text('사용 가능한 이메일입니다.').css('color', 'green');
                        isEmailChecked = true;
                        sessionStorage.setItem("isEmailChecked", "true");
                        sessionStorage.setItem("emailCheckMessage", "사용 가능한 이메일입니다.");
                        $('#sendAuthButton').prop('disabled', false); // 인증번호 보내기 버튼 활성화
                    } else {
                        $('#emailCheckResult').text('이미 사용 중인 이메일입니다.').css('color', 'red');
                        isEmailChecked = false;
                        sessionStorage.setItem("isEmailChecked", "false");
                        sessionStorage.setItem("emailCheckMessage", "이미 사용 중인 이메일입니다.");
                        $('#sendAuthButton').prop('disabled', true); // 중복일 경우 버튼 비활성화
                    }
                    validateForm();
                },
                error: function () {
                    alert('이메일 중복 확인 중 오류가 발생했습니다.');
                }
            });
        });

        // 인증번호 확인
        $('#authCheckButton').on('click', function () {
            const authNumber = $('#authNumber').val();
            if (authNumber === '') {
                alert('인증번호를 입력하세요.');
                return;
            }

            $.ajax({
                url: '/email_send_chk',
                type: 'POST',
                data: {
                    authNumber: authNumber,
                    mber_id: $('#mber_id').val()
                },
                success: function (response) {
                    if (response.authSuccess) {
                        alert('인증번호가 확인되었습니다.');
                        isAuthChecked = true;
                        sessionStorage.setItem("isAuthChecked", "true");

                        // 인증번호 입력란과 이메일 입력란을 읽기 전용으로 설정
                        $('#authNumber').prop('readonly', true);
                        $('#mber_id').prop('readonly', true);

                        validateForm();  // 가입 버튼 활성화 검증
                    } else {
                        alert('인증번호가 일치하지 않습니다.');
                        isAuthChecked = false;
                        sessionStorage.setItem("isAuthChecked", "false");
                    }
                },
                error: function () {
                    alert('인증번호 확인 중 오류가 발생했습니다.');
                }
            });
        });

        // 입력 필드 또는 체크박스 변경 시 폼 유효성 검증
        $('#mber_id, #authNumber, #mber_nm, #mbtlnum, #password, #confirm_password, input[type="checkbox"]').on('input change', function () {
            validateForm();
        });

        // 폼의 모든 필드 및 체크박스가 올바르게 채워졌는지 확인하는 함수
        function validateForm() {
            const email = $('#mber_id').val().trim();
            const nickname = $('#mber_nm').val().trim();
            const phone = $('#mbtlnum').val().trim();
            const password = $('#password').val().trim();
            const confirmPassword = $('#confirm_password').val().trim();
            const termsChecked = $('#termsCheckbox').is(':checked') && $('#privacyCheckbox').is(':checked');

            if (email !== '' && isAuthChecked && nickname !== '' &&
                phone !== '' && password !== '' && confirmPassword !== '' &&
                termsChecked && isEmailChecked) {
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