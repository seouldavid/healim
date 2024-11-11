<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찜한 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	font-family:; /* 모든 글자에 Dongle 폰트 적용 */
	background-color: #fdfdfd;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: inherit; /* 기본 텍스트 색상을 유지 */
	text-align: center;
	font-size: 70px;
}

a:visited {
	color: inherit; /* 방문 후에도 색상 유지 */
}

a:hover, a:active {
	color: inherit; /* 마우스를 올리거나 활성화 상태일 때도 색상 유지 */
}

.container {
	width: 70%; /* 원하는 너비 조정 */
	max-width: 1200px;
	margin: 0 auto; /* 가로 중앙 정렬 */
	padding: 20px;
	background-color: #fdfdfd;
}

.header {
	text-align: center;
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 20px;
}

/* 로고 스타일 */
.logo {
	display: flex;
	justify-content: center; /* 가로 방향 중앙 정렬 */
	margin-bottom: 20px; /* 로고와 헤더 간격 */
}

.tabs {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.tab {
	padding: 10px 20px;
	cursor: pointer;
	font-size: 25px;
}

.tab.active {
	font-weight: bold;
	border-bottom: 3px solid lightblue;
}

.facility-list {
	display: none;
	font-size: 30px;
}

.facility-list.active {
	display: block;
}

.facility-item {
	display: flex;
	align-items: center;
	background-color: white;
	padding: 15px;
	margin-bottom: 15px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.facility-item img {
	width: 80px;
	height: 80px;
	border-radius: 10px;
	margin-right: 15px;
}

.facility-details {
	flex-grow: 1;
	font-size: 30px;
}

.facility-details h3 {
	margin: 0;
	font-size: 25px;
}

.facility-details p {
	margin: 5px 0 0;
	color: gray;
}

.heart {
	cursor: pointer;
	width: 30px;
	height: 30px;
}

.heart.active {
	/* filter: invert(35%) sepia(83%) saturate(1875%) hue-rotate(325deg)
		brightness(99%) contrast(106%); */
	
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
	position: fixed;
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
</style>
</head>
<body>

	<!-- 사이드바 -->
	<div class="sidebar">
		<a href="/myPage">계정 정보</a> <a href="/zzim">손길 목록</a> <a
			href="/recent">최근 본 요양시설</a> <a href="/inq">문의내역</a> <a
			href="/myPost">내가 쓴 글</a>
	</div>
	<div class="topper">
		<h1>
			<a href="/home"><img src="/resources/img/main.png"></a>
		</h1>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">

		<div class="header">손길 목록</div>

		<!-- 요양병원, 요양원 선택 탭 -->
		<div class="tabs">
			<div class="tab active" id="hospitalTab"
				onclick="showFacility('hospital')">요양병원</div>
			<div class="tab" id="homeTab" onclick="showFacility('home')">요양원</div>
		</div>

		<!-- 요양병원 목록 -->
		<div class="facility-list active" id="hospitalList">
			<p id="hospitalCount">총 ${pickList.size()}개의 시설이 있어요</p>

			<!-- 병원 정보 예시 -->
			<c:forEach var="k" items="${pickList}">
			<div class="facility-item" data-id="${k.h_id}">
			
				<!-- 병원 이미지 -->
				<img src="resources/img/5.jpg" alt="병원 이미지"
					onclick="location.href='/hospitalDetail?h_id=${k.h_id}&imgSrc=#'">
					
				<!-- 병원 상세 정보 -->	
				<div class="facility-details"
					onclick="location.href='/hospitalDetail?h_id=${k.h_id}&imgSrc=#'">
					<h3>${k.h_name}</h3>
					<p>${k.addr}</p>
				</div>
				
				<!-- 병원 찜 하트 아이콘 -->
				<img src="resources/img/heart2.jpg" alt="찜 하트" class="heart active"
					onclick="toggleHeart(this, ${k.h_id})">
			</div>
			</c:forEach>
			<!-- 여기에 추가 데이터 입력 가능 -->
		</div>

		<!-- 요양원 목록 -->
		<div class="facility-list" id="homeList">
			<p id="homeCount">총 ${nPickList.size()}개의 시설이 있어요</p>

			<!-- 요양원 정보 예시 -->
			<c:forEach var="k" items="${nPickList}">
			<div class="facility-item">
			
				<!-- 요양원 이미지 -->
				<img src="resources/img/6.jpg" alt="요양원 이미지"
					onclick="location.href='/hospitalDetail?h_id=${k.h_id}&imgSrc=#'">
					
				<!-- 요양원 상세 정보 -->		
				<div class="facility-details"
					onclick="location.href='/hospitalDetail?h_id=${k.h_id}&imgSrc=#'">
					<h3>${k.h_name}</h3>
					<p>${k.addr}</p>
				</div>
				
				<!-- 요양원 찜 하트 아이콘 -->
				<img src="resources/img/heart2.jpg" class="heart active"
					onclick="toggleHeart(this, ${k.h_id})">
			</div>
			</c:forEach>
			<!-- 여기에 추가 데이터 입력 가능 -->
		</div>
	</div>

	<script>
		function showFacility(type) {
			var hospitalTab = document.getElementById('hospitalTab');
			var homeTab = document.getElementById('homeTab');
			var hospitalList = document.getElementById('hospitalList');
			var homeList = document.getElementById('homeList');

			if (type === 'hospital') {
				hospitalTab.classList.add('active');
				homeTab.classList.remove('active');
				hospitalList.classList.add('active');
				homeList.classList.remove('active');
			} else {
				hospitalTab.classList.remove('active');
				homeTab.classList.add('active');
				hospitalList.classList.remove('active');
				homeList.classList.add('active');
			}
		}

		function toggleHeart(heart, h_id) {
			// 하트 아이콘 상태 변경
			heart.classList.toggle('active');
			
			if (heart.classList.contains('active')) {
				heart.src = 'resources/img/heart2.jpg'; // 찬 하트 이미지
		    } else {
		        heart.src = 'resources/img/heart11.jpg'; // 빈 하트 이미지
		    }
			
			if (!heart.classList.contains('active')) {	
	            $.ajax({
	                url: '/removePick', // 찜 삭제 처리 URL
	                type: 'POST',
	                data: { h_id: h_id },
	                dataType: 'json',
	                success: function(response) {
	                    if (response.status === 'success') {
	                        // 삭제 성공 시 해당 리스트 항목을 DOM에서 제거
	                        const item = heart.closest('.facility-item');
	                        item.parentNode.removeChild(item);
	                        
	                     	// 응답 데이터 확인
	                        console.log('서버 응답1:', response);
	                        
	                        // 시설 수 업데이트
	                        updateFacilityCount(response.hPickCount, response.nPickCount);
			} else {
				alert("찜 삭제에 실패했습니다.");
                heart.classList.add('active'); // 실패 시 다시 찜 상태로 복구
                heart.src = 'resources/img/heart2.jpg';
			}
		},
		error: function() {
            alert("서버 오류로 인해 찜 삭제에 실패했습니다.");
            heart.classList.add('active'); // 오류 시 다시 찜 상태로 복구
            heart.src = 'resources/img/heart2.jpg'; // 다시 찬 하트 이미지
        	}
    	});
	}
}
		
		function updateFacilityCount(hPickCount, nPickCount){
			const hospitalCountElement = document.getElementById('hospitalCount');
		    const homeCountElement = document.getElementById('homeCount');
		    console.log('서버 응답2:', hPickCount);
		    console.log('서버 응답3:', nPickCount);
		    console.log('hospitalCountElement:', hospitalCountElement);
		    var elem = document.getElementById('hospitalCount');
		    elem.innerText = '테스트 업데이트';
		    
		    console.log('hPickCount:', hPickCount, 'Type:', typeof hPickCount);
		    
		        if (hPickCount > 0) {
		            hospitalCountElement.innerText = '총 ' + hPickCount + '개의 시설이 있어요';
		        } else {
		            hospitalCountElement.textContent = "찜한 요양병원이 없습니다.";
		        }
		 

		        if (nPickCount > 0) {
		            homeCountElement.textContent = '총 ' + nPickCount + '개의 시설이 있어요';
		        } else {
		            homeCountElement.textContent = "찜한 요양원이 없습니다.";
		        }
		    
		}
		</script>
		
		
<!-- 		<script>

		// 병원과 요양원 목록의 개수를 계산하여 표시하는 함수
		 function showFacility(type) {
		function updateFacilityCount() {
			var hospitalItems = document
					.querySelectorAll('#hospitalList .facility-item').length;
			var homeItems = document
					.querySelectorAll('#homeList .facility-item').length;

			document.getElementById('hospitalCount').innerText = `총 ${hospitalItems} 개의 시설이 있어요`;
			document.getElementById('homeCount').innerText = `총 ${homeItems} 개의 시설이 있어요`;
			
			console.log("병원 개수:" + hospitalItems);
			console.log("요양원 개수:" + homeItems);
			 document.addEventListener('DOMContentLoaded', updateFacilityCount);
			
		}


		// 페이지 로드 시 시설 개수 업데이트
		window.onload = updateFacilityCount;
	</script> -->

</body>
</html>