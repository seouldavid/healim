<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
</head>
<style>
body {
	width: auto%;
	align-items: center;
}

.topper1 {
	width: 100px; /* 원하는 크기로 조정 */
	height: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
	position: relative;
}

.topper1 img {
	width: 300px; /* 로고 이미지의 크기를 조정 */
	height: auto;
	text-align: center;
}

.header {
	text-align: center;
	margin-top: 10px;
}

.logo {
	font-size: 80px;
	color: #333;
	text-decoration: none;
	display: block;
	margin-bottom: 20px;
	text-align: center;
	text-decoration-style: solid;
}

body {
	font-family: Arial, sans-serif;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 600px; /* 지도의 높이를 600px로 키움 */
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 300px;
	height: 100%; /* 높이를 지도의 100%로 설정 */
	padding: 10px;
	background-color: rgba(255, 255, 255, 0.8);
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	z-index: 2;
	overflow-y: auto; /* 내용이 길어질 경우 스크롤바 추가 */
}

.option {
	margin-bottom: 10px;
}

.option input[type="text"] {
	width: 80%;
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

.option button {
	padding: 6px 10px;
	font-size: 14px;
	color: #fff;
	background-color: #5a67d8;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.option button:hover {
	background-color: #4c51bf;
}

#placesList {
	list-style: none;
	padding: 0;
	margin: 0;
}

#placesList li {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#placesList li h5 {
	font-size: 16px;
	margin: 0;
}

#placesList li .tel {
	font-size: 14px;
	color: #999;
}

#pagination {
	margin-top: 10px;
	text-align: center;
}

#pagination a {
	margin: 0 5px;
	padding: 5px 10px;
	background-color: #f1f1f1;
	border-radius: 5px;
	color: #333;
	text-decoration: none;
}

#pagination a.on {
	background-color: #5a67d8;
	color: white;
}
/* 네비게이션 스타일 */
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

.footer-nav div {
	text-align: center;
	cursor: pointer;
}

.footer-nav img {
	width: 30px;
	height: 30px;
}

.footer-nav span {
	display: block;
	margin-top: 5px;
	font-size: 12px;
	color: #555;
}

.footer-nav {
	width: 100%;
	padding: 15px;
	background-color: #ffffff;
	position: fixed;
	bottom: 0;
	display: flex;
	justify-content: space-around;
	box-shadow: 0px -4px 8px rgba(0, 0, 0, 0.1);
}

.footer-nav div {
	text-align: center;
	cursor: pointer;
}

.footer-nav img {
	width: 30px;
	height: 30px;
}

.footer-nav span {
	display: block;
	margin-top: 5px;
	font-size: 12px;
	color: #555;
}
</style>
</head>
<body>

	<div class="topper1">
		<a href="/home"><img src="resources/img/main.png"></a>

	</div>
	<hr>

	<div class="map_wrap" id="map"></div>
	<hr>

	<div class="footer-nav">
		<div onclick="location.href='home'">
			<img src="/resources/img/hom4.jpg" alt="홈"> <span>홈</span>
		</div>
		<div onclick="location.href='region_selected'">
			<img src="/resources/img/sisul.jpg" alt="시설찾기"> <span>시설찾기</span>
		</div>
		<div onclick="location.href='consult_main'">
			<img src="/resources/img/sangdam.jpg" alt="상담사례"> <span>상담사례</span>
		</div>
		<div onclick="location.href='myPage'">
			<img src="/resources/img/my.jpg" alt="마이페이지"> <span>마이페이지</span>
		</div>
	</div>

	<!-- 수정된 자바스크립트 파일 로딩 -->

	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f548e1d389e3b8ae5804cac96623033&libraries=services"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.4143, 127.4681), // 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//마커를 표시할 위치와 title 객체 배열입니다 
		
		var positions = [<c:forEach var="k" items="${h_list}"> {
			title : "${k.h_name}",
			latlng : new kakao.maps.LatLng(${k.latitude}, ${k.longitude}),
			h_name:"${k.h_name}",
		}<c:if test="${!fn:contains(k, 'last')}">,</c:if>
		</c:forEach>
		];

		//마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage,
				clickable: true,
				
			// 마커 이미지 
			});
			
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				
			});
		}
		
		
/* 		var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);  */
	</script>



</body>
</html>