<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" />
</head>
<body>
<!-- 회원가입 완료 알림창 -->
		<c:if test="${not empty result}">
				<script>
					alert("${result}");
				</script>
		</c:if>
		
		<!-- URL에 'logout' 파라미터가 있으면 알림 표시 -->
		<script>
		
			// URL에 'logout' 파라미터가 있으면 알림 표시
			if (new URLSearchParams(window.location.search).has('logout')) {
			    alert("로그아웃 되었습니다.");
			}
		
		</script>
		

<script>

	// URL에 'logout' 파라미터가 있으면 알림 표시
	if (new URLSearchParams(window.location.search).has('logout')) {
	    alert("로그아웃 되었습니다.");
	}

</script>
	
<h1><a href="/home"><img src="/resources/img/main.png"></a></h1>
	
<nav class="top-nav">
    <ul class="nav-list">
        <li><a href="/region_select">요양원/요양병원 찾기</a></li>
        <li><a href="/mainBoard">문의</a></li>
        <li><a href="/myPage">마이페이지</a></li>
        
        <c:choose>
            <c:when test="${not empty sessionScope.sessionUser}"> <!-- 사용자가 로그인한 경우 -->
                <li><a href="/logout">로그아웃</a></li>
                <c:if test="${sessionScope.sessionUser.user_level == 'S' || sessionScope.sessionUser.user_level == 'A'}"> <!-- 관리자 확인 -->
                    <li><a href="/index">관리자 페이지</a></li>
                </c:if>
            </c:when>
            <c:otherwise> <!-- 사용자가 로그인하지 않은 경우 -->
                <li><a href="/login">로그인</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>
	<nav class="floating-nav">
  <ul>
    <li>
      <img src="/resources/img/hom4.jpg" alt="홈 이미지">
      <a href="/home">홈</a>
    </li>
    <li>
      <img src="/resources/img/sangdam.jpg" alt="상담 사례 이미지">
      <a href="/consult_main">상담<br>사례</a>
    </li>
    <li>
      <img src="/resources/img/sisul.jpg" alt="시설 찾기 이미지">
      <a href="/region_selected">시설<br>찾기</a>
    </li>
    <li>
      <img src="/resources/img/my.jpg" alt="마이 페이지 이미지">
      <a href="/myPage">마이<br>페이지</a>
    </li>
  </ul>
</nav>

	<script type="text/javascript">
		window.onscroll = function() {
			// 화면 스크롤 값을 확인
			var topNavHeight = document.querySelector('nav.top-nav').offsetHeight; // 위쪽 네비게이션 높이
			var floatingNav = document.querySelector('.floating-nav');

			if (window.pageYOffset > topNavHeight) {
				// 스크롤이 위쪽 네비게이션 높이보다 아래로 내려가면
				floatingNav.style.display = 'block'; // 플로팅 네비게이션 보이기
			} else {
				floatingNav.style.display = 'none'; // 플로팅 네비게이션 숨기기
			}
		};
	</script>
	<header>
		<h1>우리 부모님 모실 요양병원 - 경기도는 헤아림에서</h1>
	</header>

	
	
	
<div class="search-bar-section">

    <form action="/map" method="GET"> <!-- /search 컨트롤러로 요청 전송 -->
    <div class="search-bar">
        <div class="dropdown">
            <select id="province-select" name="province">
                <option value="경기도">경기도</option>
                <!-- 다른 도 옵션 추가 가능 -->
            </select>
        </div>
        <div class="dropdown">
            <input type="text" id="city-input" name="city" placeholder="시/군/구" value="전체" readonly>
            <!-- 토글 화살표 아이콘 추가 -->
            <span class="toggle-arrow">&#9662;</span> <!-- ▼ 모양 화살표 -->
        </div>
        <input type="text" name="keyword" placeholder="검색어를 입력하세요" id="search-input">
        <button type="submit">
            <span class="text">검색</span>
        </button>
    </div>
</form>

    <!-- 시/군/구 리스트 (4줄 정렬) -->
   <div class="city-list" id="city-list">
    <div data-city="전체">전체</div>
    <div data-city="안산시">안산시</div>
    <div data-city="수원시">수원시</div>
    <div data-city="성남시">성남시</div>
    <div data-city="용인시">용인시</div>
    <div data-city="부천시">부천시</div>
    <div data-city="안양시">안양시</div>
    <div data-city="화성시">화성시</div>
    <div data-city="평택시">평택시</div>
    <div data-city="시흥시">시흥시</div>
    <div data-city="광명시">광명시</div>
    <div data-city="김포시">김포시</div>
    <div data-city="군포시">군포시</div>
    <div data-city="광주시">광주시</div>
    <div data-city="이천시">이천시</div>
    <div data-city="오산시">오산시</div>
    <div data-city="안성시">안성시</div>
    <div data-city="의왕시">의왕시</div>
    <div data-city="하남시">하남시</div>
    <div data-city="여주시">여주시</div>
    <div data-city="양평군">양평군</div>
    <div data-city="과천시">과천시</div>
    <div data-city="고양시">고양시</div>
    <div data-city="남양주시">남양주시</div>
    <div data-city="의정부시">의정부시</div>
    <div data-city="파주시">파주시</div>
    <div data-city="양주시">양주시</div>
    <div data-city="구리시">구리시</div>
    <div data-city="포천시">포천시</div>
    <div data-city="동두천시">동두천시</div>
    <div data-city="가평군">가평군</div>
    <div data-city="연천군">연천군</div>
</div>

</div>

<script>
    // city-input 클릭 시 토글 기능
    document.getElementById('city-input').addEventListener('click', function() {
        var cityList = document.getElementById('city-list');
        if (cityList.style.display === "none" || cityList.style.display === "") {
            cityList.style.display = "grid"; // 목록 보이기
        } else {
            cityList.style.display = "none"; // 목록 숨기기
        }
    });

    // 도시 목록에서 선택 시 값 반영 및 목록 숨기기
    var cityItems = document.querySelectorAll('.city-list div');
    cityItems.forEach(function(item) {
        item.addEventListener('click', function() {
            var selectedCity = this.getAttribute('data-city');
            document.getElementById('city-input').value = selectedCity; // 선택한 값 반영
            document.getElementById('city-list').style.display = "none"; // 목록 숨기기
        });
    });
</script>


	<!--  추천병원, 병원리뷰, 입원정보(장기요양등급) -->

	<div class="features">

		<div class="feature">
		<a href="/recommend?value=손길순">
			<img src="/resources/img/11.png" alt="추천 병원">
			<h2>추천 받으세요!</h2>
			<p>
				헤아림을 통해 상황에 맞는<br> 요양병원,시설 추천받고<br> 병원,시설 담당자의 상담을 받아보세요!
			</p>
			</a>
		</div>
		<div class="feature">
		<a href="/region_selected">
			<img src="/resources/img/22.png" alt="병원 리뷰">
			<h2>찾으시나요?</h2>
			<p>
				내 위치에 가까운 요양기관을<br> 찾으시나요? 가까운 요양기관만<br> 쉽게 검색할 수 있어요!
			</p>
			</a>
		</div>
		<div class="feature">
		<a href="/cost">
			<img src="/resources/img/44.png" alt="요양 비용 " >
			<h2>장기요양비용은?</h2>
			<p>
				장기요양비용 궁금하세요?<br>자가문진을 통해 테스트해보시고<br>바로 결과 받아보세요!
			</p>
			</a>
			
		</div>
	</div>
	
	<div class="statistics">
		<h2 style="display: block; text-align: center;">헤아림 서비스 데이터는
			공공데이터 포털에서 제공합니다.</h2>
		<div class="stat">
		   <img src="/resources/img/310.png" alt="310개">
			
			<p>총 310여 개의 요양원의 정보를 조회할 수 있습니다.</p>
		</div>
		<div class="stat">
		   <img src="/resources/img/friendhospital.png" alt="병원 협진">
			
			<p>50여 개의 주요 대형병원과
협진 시스템을 맺었습니다.</p>
		</div>
		<div class="stat">
		   <img src="/resources/img/kyunggi.png" alt="이용자">
			
			<p>1400만명 경기도민
대상으로 서비스를 제공합니다.</p>
		</div>
	</div>
	<div class="theme-section">
    <h2>헤아림 테마별 찾기</h2>
    <p>원하시는 테마별로 요양병원·시설을 찾아볼 수 있습니다.</p>
 <div class="theme-icons">
        <div class="theme-item" onclick="location.href='/recommend?value=치매순'" >
            <img src="/resources/img/brain.png" alt="치매">
            <p>치매</p>
        </div>
        <div class="theme-item" onclick="location.href='/recommend?value=내위치순'">
            <img src="/resources/img/hands.png" alt="내위치">
            <p>내위치</p>
        </div>
        <div class="theme-item" onclick="location.href='/hospitalList'">
            <img src="/resources/img/level.png" alt="최근 개원">
            <p>최근 개원</p>
        </div>
         <div class="theme-item" onclick="location.href='/recommendRank?value=등급순'">
            <img src="/resources/img/location.png" alt="등급순">
            <p>등급순</p>
        </div>
        <div class="theme-item" onclick="location.href='/recommend?value=손길순'">
            <img src="/resources/img/newbie.png" alt="손길순">
            <p>손길순</p>
        </div>
    </div>
</div>

</div>

	</div>
	<br>
	<div class="pick-section">
		<!-- 헤아림픽 -->
		<div class="pick-main">
			<h2>헤아림 Pick!</h2>
			<p>헤아림이 추천하는 평점, 후기가 우수한 시설입니다.</p>
		</div>
		<div class="pick-container">
			<!-- 카드 1 -->
			<a href="/hospitalDetail?h_id=1225&imgSrc=#" class="pick-card">
				<img src="/resources/img/5.jpg" alt="요양병원"   >
				<div class="tags">
					<span>정신건강</span> <span>내과/신경과</span>
				</div>
				<div class="title">경기도립 노인 전문 남양주 병원</div>
			</a>

			<!-- 카드 2 -->
			<a href="/hospitalDetail?h_id=9&imgSrc=#" class="pick-card">
				<img src="/resources/img/6.jpg" alt="요양병원" >
				<div class="tags">
					<span>물리치료</span> <span>재활의학과</span>
				</div>
				<div class="title">(의) 현당의료재단 늘봄요양병원</div>
			</a>

			<!-- 카드 3 -->
			<a href="/hospitalDetail?h_id=472&imgSrc=#" class="pick-card">
				<img src="/resources/img/9.jpg" alt="요양원">
				<div class="tags">
					<span>물리치료</span> <span>양/한방</span>
				</div>
				<div class="title">(고양) 서울요양원</div>
			</a>

			<!-- 카드 4 -->
			<a href="/hospitalDetail?h_id=432&imgSrc=#" class="pick-card">
				<img src="/resources/img/10.jpg" alt="요양원" >
				<div class="tags">
					<span>소규모</span> <span>양/한방</span>
				</div>
				<div class="title">E.S.H 엘림복지원</div>
			</a>
		</div>
	</div>
	<div class="tip-section">
    <h2>헤아림 꿀팁</h2>
    <p>헤아림의 다양한 정보를 확인할 수 있습니다.</p>
    <div class="tip-cards">
    <a href="/honey1">
        <div class="tip-card">
            <img src="/resources/img/11.jpg" alt="만성피로" > <!-- 이미지 대신 블록으로 처리 -->
            <div class="tip-content">
                <p>항상 피곤하다면 만성피로</p>
          
            </div>
        </div>
        </a>
        <a href="/honey2">
        <div class="tip-card">
            <img src="/resources/img/12.jpg" alt="우울증" >  <!-- 이미지 대신 블록으로 처리 -->
            <div class="tip-content">
                <p>버려야 할 우울증 악화 습관</p>
           
            </div>
        </div>
        </a>
         <a href="/honey3">
        <div class="tip-card">
            <img src="/resources/img/13.jpg" alt="노년기" >  <!-- 이미지 대신 블록으로 처리 -->
            <div class="tip-content">
                <p>노년기의 건강관리</p>
          
            </div>
        </div>
        </a>
    </div>
</div>
	
	<hr>
<div class="board-header">
     <a href="/mainBoard"><h2>헤아림 게시판</h2>더보기 ></a>
    <p>헤아림의 공지사항 및 다양한 정보를 확인할 수 있습니다.</p>
   
</div>

<div class="faq-section">
    <div class="faq-item">
        <img src="/resources/img/17.jpg" alt="자주 묻는 질문" style="border-radius: 10px;">
        <p>궁금한 사항 자주하는 질문으로 확인하세요.</p>
    </div>
    <div class="faq-item">
        <img src="/resources/img/15.jpg" alt="카카오톡" style="border-radius: 10px;">
        <p>카카오톡에서 헤아림을 검색하세요. <strong>@HEALIM</strong></p>
    </div>
    <div class="faq-item">
        <img src="/resources/img/16.jpg" alt="고객문의" style="border-radius: 10px;">
        <p>고객문의 <strong>02-0000-0000</strong><br>(평일 오전 10시~오후 5시)</p>
    </div>
</div>



	<!-- 푸터 -->
	<footer class="footer">
		<ul>
			<li><a href="/introduce"> 헤아림 소개 </a><a href="/termsOfService"> 이용약관 </a>
			<a href="/privacyPolicy"> 개인정보처리방침 </a><a href="/locationPolicy"> 위치정보
					이용약관 </a></li>
		</ul>
		<ul>
			<li>주소: 서울특별시 마포구 백범로 23 케이터틀 3층
			<li>
		</ul>
		<p>고객센터: 080-000-0000 | 운영시간: 09:00 ~ 18:00</p>
	</footer>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $.ajax({
        url: '/popup_upload',
        method: 'GET',
        dataType: 'json',
        success: function(response) {
         
            
			


            $.each(response, function(index, data) {
            	
            	const start_time = new Date(data.pu_start_time.replace(" ","T"));
            	const end_time = new Date(data.pu_end_time.replace(" ","T"));
            	if(new Date() <start_time || new Date() >end_time){
    				return true;
    			}
            	const hasCookieKey = name => 
                document.cookie
                    .split("; ")
                    .map(cookie => cookie.split("=")[0])
                    .includes(name);
                if(hasCookieKey(data.pu_id)){
                	return true;
                }
            	
            	const f_name = data.f_name;
            	const pu_id = data.pu_id;
            	const popupWidth = data.pu_width ; 
                const popupHeight = data.pu_height; 
                const positionX = data.pu_x;
                const positionY = data.pu_y;              
                window.open(
                    "/popup_show?pu_id="+pu_id+"&f_name="+f_name, 
                    "popupWindow" + index, 
                    "width=" + (popupWidth) + ",height="+(popupHeight)+ ",left="+(positionX)+ ",top="+(positionY)
                );
            console.log("popupWidth, popupHeight, positionX, positionY:", popupWidth, popupHeight, positionX, positionY);
            });
        },
        error: function(error) {
            console.error('Error loading popup data:', error);
        }
    });
});
</script>
	
	
	
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">
  // 쿠키 설정 함수
  function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + '=' + encodeURIComponent(value) + '; path=/; expires=' + todayDate.toUTCString() + ';';
  }

  // 쿠키 가져오기 함수
  function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0) return decodeURIComponent(c.substring(nameEQ.length, c.length));
    }
    return null;
  }

  // 팝업 열기 함수
  function popUp() {
    const value = getCookie('healimpopup1');
    if (!value) {
      window.open("popupmembership", "", "width=570px, height=600px");
    }
  }

  // 페이지 로드 시 팝업 체크
  window.onload = function () {
    popUp();
  };

  // 팝업 닫기 버튼 클릭 시 쿠키 설정
  function closeWin(key) {
    var todaycloseyn = document.getElementById("todaycloseyn");
    if (todaycloseyn.checked) {
      setCookie('healimpopup' + key, 'Y', 1); // 하루 동안 쿠키 유지
      window.close();
    }
  }
</script>

  
  
</body>
</html>