<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>송파그랜드요양병원 소개</title>

<style>
body {
   margin: 0 auto;
   padding: 0;
   font-family: Arial, sans-serif;
   background-color: white;
}

.hospital-intro {
   width: 80%;
   margin: 0 auto;
}

/* 병원 정보 상단 */
.hospital-header {
   display: flex;
   flex-direction: column;
   margin-bottom: 20px;
}

.hospital-header h1 {
   font-size: 2em;
   margin-bottom: 10px;
}

/* 병원 등급, 대형, 설립 5년 */
.hospital-info {
   display: flex;
   gap: 10px;
   margin-bottom: 20px;
}

.badge {
   background-color: #f5f5f5;
   border-radius: 12px;
   padding: 5px 10px;
   font-size: 14px;
   font-weight: bold;
   color: #333;
   border: 1px solid #ddd;
}

/* 버튼 스타일 */
.button-group {
   display: flex;
   gap: 15px;
   margin-bottom: 30px;
}

.button-group button {
   padding: 10px 20px;
   border: 1px solid #007bff;
   border-radius: 20px;
   background-color: #007bff;
   color: white;
   font-size: 14px;
   cursor: pointer;
   transition: background-color 0.3s ease;
}

.button-group button:hover {
   background-color: #0056b3;
}

/* 소개글 */
.intro-section {
   margin-bottom: 20px;
}

.intro-section h2 {
   font-size: 1.5em;
   margin-bottom: 10px;
}

.intro-section p {
   font-size: 1.1em;
   line-height: 1.6;
   color: #555;
}

/* 특징 */
.details-section {
   margin-bottom: 20px;
}

.details-section h2 {
   font-size: 1.5em;
   margin-bottom: 10px;
}

.details-section p {
   font-size: 1.1em;
   line-height: 1.6;
   color: #555;
}

/* 평가 등급 */
.rating-section {
   margin-bottom: 20px;
}

.rating-section h2 {
   font-size: 1.5em;
   margin-bottom: 10px;
}

.rating-section p {
   font-size: 1.1em;
   line-height: 1.6;
   color: #555;
}

/* 병상 정보 */
.bed-info {
   margin-bottom: 20px;
}

.bed-info h2 {
   font-size: 1.5em;
   margin-bottom: 10px;
}

/* 의료진 정보 */
.doctor-info {
   margin-bottom: 20px;
}

.doctor-info h2 {
   font-size: 1.5em;
   margin-bottom: 10px;
}

/* 운영 시간 */
.operation-info {
   margin-bottom: 20px;
}

.operation-info h2 {
   font-size: 1.5em;
   margin-bottom: 10px;
}

/* 위치 */
.map-section {
   margin-bottom: 20px;
}

.map-section h2 {
   font-size: 1.5em;
   margin-bottom: 10px;
}

/* 버튼 스타일 */
.button {
   padding: 10px 20px;
   border: none;
   background-color: #007bff;
   color: white;
   border-radius: 5px;
   cursor: pointer;
}

.button:hover {
   background-color: #0056b3;
}
#map {
    width: 100%;
    height: 400px; /* Adjust as needed */
}
</style>
</head>
<body>

   <div class="hospital-intro">
      <!-- 병원 정보 상단 -->
      <section class="hospital-header">
         <h3>${hvo.type_name}</h3>
         <h1>${hvo.h_name}</h1>
         <p>${hvo.city_name}</p>

         <!-- 병원 등급 정보 -->
         <div class="hospital-info">
            <span class="badge">${hvo.grade}</span> <span class="badge">설립
               일 : ${hvo.open_date}</span>
         </div>

         <!-- 찜하기, 위치보기, 공유하기 버튼 -->
         <div class="button-group">
            <button class="button" onclick="alert('손길 완료!'); location.href='/hospitalDetailZzim?h_id=${hvo.h_id}'">손길 (${pick_count})</button>
            <button class="button" onclick="alert('위치보기')">위치보기</button>
            <button id="copyButton">링크 복사</button>
         </div>
      </section>

      <script>
         // 링크 복사하는 코드
         document.getElementById("copyButton").addEventListener("click",
               function() {

                  var url = window.location.href;

                  var textarea = document.createElement("textarea");
                  textarea.value = url;
                  document.body.appendChild(textarea);

                  textarea.select();
                  document.execCommand("copy");

                  document.body.removeChild(textarea);

                  alert("링크가 복사되었습니다!");
               });
      </script>




      <!-- 소개글 -->
      <section class="intro-section">
         <h2>소개글</h2>
         <p>${hvo.h_name}<br> ${hvo.contents}
            <!-- <br><br>
송파구 근내 최대 요양시설과 최신식 의료장비를 구비되어있습니다.<br>
의료등급 1등급, 간호인력 1등급<br>
간병사 보호자분들이 원하시는 보호자간병, 개인간병, 공동간병(2:1, 3:1, 4:1, 6:1) 맞춤 서비스 가능<br>
신규 법적 청산가 거리 적용 1.5미터<br>
코로나확산 대비 음압실(모든 병실 적용)로 구비되어 있음.<br>
면회에 불편이 없고, 추억이 내 부모님이 나를 잊을까 하는 걱정하는 마음에 면회 제한 역시 최소화 하였습니다.<br>
<br>
약 2년간( 코로나 전담병원) 지역과 서울시 보건의료에 이바지 한 병원입니다.<br>
요양병원에 찾아주어야 할 모든 장비 및 시설이 되어있습니다.<br>
<br>
손상, 감염병.<br>
치료들에 최적화 시스템을 갖춘 요양병원입니다.<br>
항상 여러분들을 모실 준비를 하고 있는 송파그랜드요양병원<br>
<br><br><br>
송파그랜드요양병원 김민옥<br> -->

         </p>
         <!-- 여기에 상세 소개글 추가 -->
      </section>

      <!-- 특징 -->
      <section class="details-section">
         <h2>특징</h2>
         <p>${hvo.treatment}<br> ------내용 없음------
            <!-- 말기 암 호스피스케어<br>
욕창 치료 특화 (대학병원, 요양원 등에서 생긴 욕창 치료를 전문적으로 하고있습니다)<br>
한방치료 특화<br>
<br>
인공호흡기, 하이푸 (고압산소)<br>
인퓨전등, 전 병실 ekg 모니터등 장비 구비되어있습니다.<br>
</p> -->
      </section>

      <!-- 평가 등급 -->
      <section class="rating-section">
         <h2>평가등급</h2>
         <p>${hvo.grade}-건강보험심사평가원 평가</p>
      </section>

      <!-- 병상 정보 -->
      <section class="bed-info">
         <h2>병상 정보 및 정원 현황</h2>
         <p>정원 ${hvo.reg_cnt}명, 현재 원 ${hvo.curr_cnt}명</p>
         <p>병상 수 ${hvo.bed_cnt}개, 병실 수 ${hvo.room_cnt}개</p>
      </section>

      <!-- 의료진 정보 -->
      <section class="doctor-info">
         <h2>의료진 정보</h2>
         <p>의사 ${hvo.doc_cnt}명, 간호원 ${hvo.nurse_cnt}명</p>
         <p>요양보호사 ${hvo.care_cnt}명, 영양사 ${hvo.nutri_cnt}명</p>
         <p>사회복지사 ${hvo.social_cnt}명</p>
      </section>

      <!--     운영 정보
    <section class="operation-info">
        <h2>운영 시간</h2>
        <p>월~금: 09:00 ~ 18:00, 토요일: 09:00 ~ 18:00, 일요일: 휴무</p>
        <p>점심시간: 12:30 ~ 13:30</p>
    </section> -->

      <!-- 위치 정보 -->
      <section class="map-section">
         <h2>위치보기</h2>
         <p>${hvo.addr}</p>
         <div id="map"></div>
      </section>

      <script type="text/javascript"
         src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6f548e1d389e3b8ae5804cac96623033&libraries=services&autoload=false"></script>
      <script type="text/javascript">
      window.onload = function () {
         console.log( "hi");
          kakao.maps.load(function () {
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center : new kakao.maps.LatLng(parseFloat(${hvo.latitude}),parseFloat(${hvo.longitude})), // 지도의 중심좌표
            level : 3
         // 지도의 확대 레벨
         };

         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

         //마커가 표시될 위치입니다 
         var markerPosition = new kakao.maps.LatLng(parseFloat(${hvo.latitude}),parseFloat(${hvo.longitude}));

         //마커를 생성합니다
         var marker = new kakao.maps.Marker({
            position : markerPosition
         });
    
         //마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(map);
         
          })
      }
      </script>



   </div>

</body>
</html>
