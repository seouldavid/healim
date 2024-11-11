<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/resources/css/admin.css" rel="stylesheet" />
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
    .btn {
    background-color: rgb(236, 236, 236); 
    border: none; 
    color: black; 
    padding: 6px 12px; 
    font-size: 16px; 
    cursor: pointer; 
    border-radius: 5px; 
    margin-left: 30px; 
    }
    .btn:hover {
    text-decoration: underline; 
    }
	.button-container {
    background-color: #F7F7F7; 
    display: flex;
    justify-content: center; 
    align-items: center; 
	}
    .num-right{
    text-align: right;
    }
        textarea {
        width: 80%;  
        max-width: 100%;  
        min-width: 50%;  
        box-sizing: border-box;  
        resize: vertical; 
    }
	th {
    	min-width: 200px; 
    	height: 1.2em; 
	}
</style>   
<script type="text/javascript">
  <c:if test="${updatechk == 'S'}">
 	 alert("수정 되었습니다.");
  </c:if>
</script>    
</head>

<body>

    <!--탑1 --------------------------------------------------------------------------- -->
    <div class="page">
    <div class="top1">
        <div><img class="bt_header" href="#" src="/resources/img/admin_img/logo.png" alt="header" /></div>        
        <div class="administrator">ADMINISTRATOR</div>
        <div class="gohome">
	        <div></div>
	        <div class="house">
		        <a href="/home">
			        <img class="houseimg" src="/resources/img/admin_img/check_img.svg">
			        <button class="homepagebutton"  style="cursor: pointer;">홈페이지</button>
		        </a>
	        </div>
	        <div class="logoutbox">
		        <a href="/login">
			        <img class="houseimg" src="/resources/img/admin_img/right-from-bracket-solid.svg">
			        <button class="logoutbutton" style="cursor: pointer;">로그아웃</button>
		        </a>
	        </div>
        </div>
    </div>
    
<!--탑2 --------------------------------------------------------------------------- -->



    <div class="main">
        
<!-- 네비게이션--------------------------------------------------------------------------- -->
        <div class="nav">
            <ul class="nav_button">
                <li><a href="/index"><img class="nav_img" src="/resources/img/admin_img/button-0.svg"
                      alt="메인페이지 " /></a></li>
                <li><a href="/member"><img class="nav_img" src="/resources/img/admin_img/button-1.svg"
                      alt="회원관리" /></a></li>
                <li><a href="/admin_board"><img class="nav_img" src="/resources/img/admin_img/button-2.svg"
                      alt="게시판 관리" /></a></li>
                <li><a href="/hospital_info"><img class="nav_img" src="/resources/img/admin_img/button-3.svg"
                      alt="병원정보수정" /></a></li>
                <li><a href="/admin"><img class="nav_img" src="/resources/img/admin_img/button-4.svg"
                      alt="관리자관리" /></a></li>
             </ul>

        </div>


<!-- 메인 테이블--------------------------------------------------------------------------- -->


   

  <div class="content">
    <div class="top2">
        <div class="top2text">
            <h2> 환경 설정 </h2>
        </div>   
    </div>

            <!-- 테이블 박스 -->
            <div class="tablebox">
                <section>
            <form id="configForm" action="/config_Ok" method="POST" >
            <table>
                <tbody>
                    <tr>
                        <th>사이트 제목<strong>필수</strong></th>
                        <td><input type="text" name="cf_title" value="${acfvo.cf_title}" id="cf_title" required size="40"></td>
                        <th>최고관리자<strong>필수</strong></th>
                        <td>
                        <select id="cf_admin" name="cf_admin" required style="width:165px;">
    						<option value="">선택안함</option>
    						<option value="admin" ${acfvo.cf_admin == 'admin' ? "selected" : ""}>admin</option>
						</select>
                        </td>
                    </tr>
                    <tr>
                        <th>관리자 메일 주소<strong>필수</strong></th>
                        <td>
                            <span>관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다. <br>    
                                    (회원가입, 인증메일, 테스트, 회원메일발송 등에서 사용)  </span> <br>                      
                            <input type="text" name="cf_admin_email" value="${acfvo.cf_admin_email}" id="cf_admin_email" required placeholder="필수입력" size="40"> <br>
                            <span>name@abc.co.kr 과 같은 도메인 형식으로 설정할것을 권장합니다.</span>                                                    
                        </td>
                        <th>관리자 메일 발송이름<strong>필수</strong></th>
                        <td>
                            <span>관리자가 보내고 받는 용도로 사용하는 메일의 발송이름을 입력합니다.<br>(회원가입, 인증메일, 테스트, 회원메일발송 등에서 사용)</span> <br>                            
                            <input type="text" name="cf_admin_email_name" value="헤아림" id="cf_admin_email_name" required placeholder="필수입력" value="${acfvo.cf_admin_email_name}" size="40">
                        </td>
                    </tr>
                    <tr>

                    </tr>
                    <tr>
                        <th scope="row">닉네임 수정</th>
                        <td>수정하면 <input type="text" name="cf_nick_modify" value="${acfvo.cf_nick_modify}" id="cf_nick_modify"  size="3"> 일 동안 바꿀 수 없음</td>
                        <th scope="row">정보공개 수정</th>
                        <td>수정하면 <input type="text" name="cf_open_modify" value="${acfvo.cf_open_modify}" id="cf_open_modify"  size="3"> 일 동안 바꿀 수 없음</td>
                    </tr>
                    <tr>
                        <th>단어 필터링</th>
                        <td colspan="3">
                            <span>입력된 단어가 포함된 내용은 게시할 수 없습니다. 단어와 단어 사이는 ,로 구분합니다.</span>                            
                            <textarea name="cf_filter" id="cf_filter" rows="7">${acfvo.cf_filter}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>본인확인 필수</th>
                        <td>
                            <span>회원가입 때 본인확인을 필수로 할지 설정합니다.</span>                            
                            <input type="checkbox" name="cf_cert_req" value="${acfvo.cf_cert_req}" id="cf_cert_req" ${acfvo.cf_cert_req == 1 ? 'checked' : ''}>  예
                        </td>
                        <th scope="row">휴대폰번호 입력</th>
                        <td>
                            <input type="checkbox" name="cf_use_hp" value="${acfvo.cf_use_hp}" id="cf_use_hp" ${acfvo.cf_use_hp == 1 ? 'checked' : ''}> 보이기
                            <input type="checkbox" name="cf_req_hp" value="${acfvo.cf_req_hp}" id="cf_req_hp" ${acfvo.cf_req_hp == 1 ? 'checked' : ''}> 필수입력
                        </td>
                    </tr>
                        <th>아이디,닉네임 금지단어</th>
                        <td colspan="3">
                            <span>회원아이디, 닉네임으로 사용할 수 없는 단어를 정합니다. 쉼표 (,) 로 구분</span>                            
                            <textarea name="cf_prohibit_id" id="cf_prohibit_id" rows="5" >${acfvo.cf_prohibit_id}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>회원가입약관</th>
                        <td colspan="3"><textarea name="cf_stipulation" id="cf_stipulation" rows="10">${acfvo.cf_stipulation}</textarea></td>
                    </tr>
                    <tr>
                        <th>개인정보처리방침</th>
                        <td colspan="3"><textarea id="cf_privacy" name="cf_privacy" rows="10">${acfvo.cf_privacy}</textarea></td>
                    </tr>
                    <tr>
                        <th>소셜로그인설정</th>
                        <td colspan="3">
                            <span>소셜로그인을 사용합니다. </span>                           
                             <input type="checkbox" name="cf_social_login_use" value="${acfvo.cf_social_login_use}" ${acfvo.cf_social_login_use == 1 ? 'checked' : ''} id="cf_social_login_use" > 사용
                        </td>
                    </tr>
                    <tr>
                        <th>소셜로그인설정</th>
                        <td colspan="3">
                            <div>
                                <input type="checkbox" name="cf_naver_use" id="cf_naver_use" value="${acfvo.cf_naver_use}" ${acfvo.cf_naver_use == 1 ? 'checked' : ''}>
                                네이버 로그인을 사용합니다
                                <div>
                                    <h3>네이버 CallbackURL</h3>
                                    <input type="text" name="cf_naver_callback" id="cf_naver_callback" size="45" value="${acfvo.cf_naver_callback}">
                                </div>
                            </div>
                            <div>
                                <input type="checkbox" name="cf_kakao_use" id="cf_kakao_use" value="${acfvo.cf_kakao_use}" ${acfvo.cf_kakao_use == 1 ? 'checked' : ''}>
                                카카오 로그인을 사용합니다
                                <div>
                                    <h3>카카오 로그인 Redirect URI</h3>
                                    <input type="text" name="cf_kakao_redirect" id="cf_kakao_redirect" size="45" value="${acfvo.cf_kakao_redirect}">
                                    
                                </div>
                            </div>
                            
                        </td>
                    </tr>
                    <tr>
                        <th>네이버 Client ID</th>
                        <td>
                            <input type="text" name="cf_naver_clientid" value="${acfvo.cf_naver_clientid}" id="cf_naver_clientid" size="40"> 
                        </td>
                        <th>네이버 Client Secret</th>
                        <td>
                            <input type="text" name="cf_naver_secret" value="${acfvo.cf_naver_secret}" id="cf_naver_secret" size="45">
                        </td>
                    </tr>
                    <tr>
                        <th>카카오 REST API 키</th>
                        <td>
                            <input type="text" name="cf_kakao_rest_key" value="${acfvo.cf_kakao_rest_key}" id="cf_kakao_rest_key" size="40">
                        </td>
                        <th>카카오 Client Secret</th>
                        <td>
                            <input type="text" name="cf_kakao_client_secret" value="${acfvo.cf_kakao_client_secret}" id="cf_kakao_client_secret"  size="45">
                        </td>
                    </tr>
                    <tr>
                        <th>카카오 JavaScript 키</th>
                        <td colspan="3">
                            <input type="text" name="cf_kakao_js_apikey" value="${acfvo.cf_kakao_js_apikey}" id="cf_kakao_js_apikey"  size="45">
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                   <tr>
                        <td colspan="6">
                            <div class="button-container">
                                 <input type="hidden" name="cf_id" value="${acfvo.cf_id}">
                                 
                               <!--   $('select[name=city_select]').val();  -->
                                 
                        		 <button type="button" id="saveBtn" class="btn btn-write" onClick="edit_ok(this.form)"><i class="fa fa-floppy-o"></i>저장</button>
     							 <button type="button" id="cancelBtn" class="btn btn-cancel" onClick="cancel(this.form)"><i class="fa fa-ban"></i> 취소</button>
    							 
                    		</div>
                        </td>
                    </tr>
                
                </tfoot>
            </table>
        </form>
          
        </section>                
	<script type="text/javascript">
	// 	 cf_cert_req,   cf_use_hp , cf_req_hp , cf_naver_use , cf_kakao_use , cf_social_login_use 체그 박스 체크 여부에 따라 값 변경

		$(document).ready(function() {
		    $('#cf_cert_req').change(function() {
		        if ($(this).is(':checked')) {
		            $(this).val(1);
		        } else {
		            $(this).val(0);
		        }
		    });
		    $('#cf_use_hp').change(function() {
		        if ($(this).is(':checked')) {
		            $(this).val(1);
		        } else {
		            $(this).val(0);
		        }
		    });
		    $('#cf_req_hp').change(function() {
		        if ($(this).is(':checked')) {
		            $(this).val(1);
		        } else {
		            $(this).val(0);
		        }
		    });
		    $('#cf_social_login_use').change(function() {
		        if ($(this).is(':checked')) {
		            $(this).val(1);
		        } else {
		            $(this).val(0);
		        }
		    });
		    $('#cf_naver_use').change(function() {
		        if ($(this).is(':checked')) {
		            $(this).val(1);
		        } else {
		            $(this).val(0);
		        }
		    });
		    $('#cf_kakao_use').change(function() {
		        if ($(this).is(':checked')) {
		            $(this).val(1);
		        } else {
		            $(this).val(0);
		        }
		    });
		});
	  

	    function edit_ok(f) {
	        if (f.checkValidity()) {
	        	f.submit(); // 유효성 검사 통과 시 제출
	        } else {
	            alert("필수 입력 항목을 모두 채워주세요.");
	        }
	    }
	    
	 	function cancel(f){
	 		location.href="/config";
	 	}
 	

</script>

	</script>
</body>
</html>