<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="globals.css" />
<link rel="stylesheet" href="styleguide.css" />
<link rel="stylesheet" href="style.css" />
<style>
.topper {
   position: fixed;
   top: 0;
   width: 100%;
   text-align: center;
   z-index: 1000;
   background-color: #ffffff;
   padding-top: 5px; /* 상단 패딩을 줄임 */
   padding-bottom: 5px; /* 하단 패딩을 줄임 */
   box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.topper img {
   width: 200px;
   height: auto;
}

a {
   text-decoration: none;
   color: inherit; /* 기본 텍스트 색상을 유지 */
}

a:visited {
   color: inherit; /* 방문 후에도 색상 유지 */
}

a:hover, a:active {
   color: inherit; /* 마우스를 올리거나 활성화 상태일 때도 색상 유지 */
}

body {
   font-family: 'Arial', sans-serif;
   margin: 0;
   padding: 0;
   display: flex;
   flex-direction: column;
   align-items: center;
   background-color: #e7f1ff;
}

.header {
   width: 100%;
   padding: 20px;
   background-color: #ffffff;
   box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
   text-align: center;
   font-size: 24px;
   font-weight: bold;
   color: #333;
   position: sticky;
   top: 0;
   z-index: 1000;
}

.category {
   display: flex;
   justify-content: center;
   gap: 30px;
   margin: 100px 0 10px 0; /* 상단 여백을 100px로 조정 */
}

.category select {
   margin-left: 30px;
}

.category button {
   padding: 10px 15px;
   border: none;
   background-color: #ffffff;
   color: #000000;
   border-radius: 5px;
   margin: 0 5px;
   cursor: pointer;
}

.category button:hover {
   background-color: #dbe1e7;
}

.hidden {
   display: none;
}

.facility-list {
   width: 90%;
   max-width: 800px;
   margin: 20px auto;
   text-align: center;
}

.gyeonggi-link {
   font-size: 30px;
   font-weight: bold;
   color: #007bff;
   text-decoration: none;
   margin-bottom: 20px;
   display: inline-block;
}

.gyeonggi-link:hover {
   color: #0056b3; /* 파란색으로 변경 */
   text-decoration: underline; /* 강조를 위해 밑줄 추가 */
}

.facility-item {
   background-color: #ffffff;
   margin-bottom: 20px;
   padding: 15px;
   box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
   border-radius: 10px;
   display: flex;
   align-items: center;
   justify-content: center; /* 가로 정렬 중앙 */
   text-align: center; /* 텍스트 중앙 정렬 */
   gap: 15px;
   cursor: pointer;
}

.facility-img {
   width: 80px;
   height: 80px;
   border-radius: 10px;
   object-fit: cover; /* 이미지가 박스에 맞게 채워짐 */
}

.facility-item img {
   width: 80px;
   height: 80px;
   border-radius: 10px;
}

.facility-details {
   flex: 1;
   text-align: center; /* 텍스트 중앙 정렬 */
   margin-left: 0; /* 왼쪽 여백 제거 */
}

.facility-details h3 {
   margin: 0;
   font-size: 18px;
   font-weight: bold;
   color: #333;
}

.facility-details p {
   margin: 5px 0;
   font-size: 14px;
   color: #555;
}

.rounded-box {
   padding: 5px 10px;
   background-color: #f1f1f1;
   border-radius: 15px;
   font-size: 12px;
   display: inline-block;
   margin-right: 5px;
}

.footer-nav {
   width: 70%;
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

.category-dropdown {
   display: none; /* 기본적으로 숨김 */
   margin-left: 30px; /* 여백 추가 */
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

.facility-list {
   display: none;
}

.facility-list.active {
   display: block;
}

.tab {
   font-size: 20px;
   cursor: pointer;
   font-weight: normal;
   color: #333;
   padding: 5px;
}

.tab.active {
   font-weight: bold;
   color: blue;
   border-bottom: 2px solid blue;
}

.logoimg {
   width: 300px; /* 로고 크기를 150px로 지정 */
   display: block;
   margin: 10px auto; /* 이미지 중앙 정렬 및 위쪽 여백 */
}



.paging {
    display: flex;
    list-style: none; /* 기본 리스트 스타일 제거 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
}

.paging li {
    margin: 0 5px; /* 각 페이지 번호 간격 조절 */
}

.paging li a {
    text-decoration: none; /* 링크 밑줄 제거 */
    color: #007bff; /* 기본 링크 색상 */
    padding: 8px 12px; /* 클릭 영역 넓히기 */
    border: 1px solid #007bff; /* 테두리 추가 */
    border-radius: 4px; /* 둥근 모서리 */
    transition: background-color 0.3s, color 0.3s; /* 부드러운 전환 효과 */
}

.paging li a:hover {
    background-color: #007bff; /* 호버 시 배경색 */
    color: white; /* 호버 시 글자색 */
}

.paging li span {
    padding: 8px 12px; /* 현재 페이지 표시와 동일한 패딩 */
    border: 1px solid #ccc; /* 기본 테두리 추가 */
    border-radius: 4px; /* 둥근 모서리 */
    background-color: #f8f9fa; /* 현재 페이지 색상 */
    color: #333; /* 현재 페이지 글자색 */
}

.paging li span.now {
    font-weight: bold; /* 현재 페이지 강조 */
    background-color: #007bff; /* 현재 페이지 강조 색상 */
    color: white; /* 현재 페이지 글자색 흰색 */
}

</style>
</head>
<body>

   <div class="logoheader" onclick="location.href='/home'">
      <img class="logoimg" src="/resources/img/main.png">
   </div>

   <div class="category">
      <span class="tab"
         onclick="location.href='/region_selected?facilityType=H'"
         id="hospitalTab">요양병원</span> <span class="tab"
         onclick="location.href='/region_selected?facilityType=N'"
         id="homeTab">요양원</span>
   </div>

   <!-- 요양원 리스트 -->
   <c:forEach var="k" items="${list3}" varStatus="status">
      <c:if test="${facilityType == 'N' }">
        <c:set var="totalImages" value="20" />
        <c:set var="imageNumber" value="${(status.index % totalImages) + 1}" />
        
      <div class="facility-list active" id="hospitalList">
         <div class="facility-item" onclick="goToDetail('${k.h_id}', 'N', this)">

             <img src="/resources/img2/${(imageNumber + (paging.nowPage - 1) * paging.getNumPerPage()) % 20 + 1}.jpg" alt="시설 이미지" class="facility-img">
            <div class="facility-details">
               <h3>${k.h_name}</h3>
               <p>${k.addr}</p>
               <div>
                  <span class="rounded-box">${k.grade}</span>
               </div>
            </div>
         </div>
      </div>
   </c:if>   
   
   <!-- 요양병원 리스트 -->
   <c:if test="${facilityType == 'H' }">
        <c:set var="totalImages" value="20" />
        <c:set var="imageNumber" value="${(status.index % totalImages) + 1}" />
        
        <div class="facility-list active" id="hospitalList">
            <div class="facility-item" onclick="goToDetail('${k.h_id}', 'H', this)">
                <img src="/resources/img3/${(imageNumber + (paging.nowPage - 1) * paging.getNumPerPage() ) % 17+1}.jpg" alt="시설 이미지" class="facility-img">
                <div class="facility-details">
                    <h3>${k.h_name}</h3>
                    <p>${k.addr}</p>
                    <div>
                        <span class="rounded-box">${k.grade}</span>
                    </div>
                </div>
            </div>
        </div>
    
    </c:if>
   
   </c:forEach>


   <!--    <div class="facility-list" id="homeList">
      <p>총 1개의 요양원이 있어요</p>
      <div class="facility-item" onclick="location.href='/hospitalDetail'">
         <img src="/resources/img/8.jpg" alt="시설 이미지" class="facility-img">
         <div class="facility-details">
            <h3>서울요양원</h3>
            <p>서울 강남구 테헤란로 123</p>
            <div>
               <span class="rounded-box">1등급</span> <span class="rounded-box">중형</span>
               <span class="rounded-box">설립 3년</span>
            </div>
         </div>
      </div>
   </div> -->

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

   <!-- 페이지기법 -->
<table>
    <tfoot>
        <tr>
            <td>
                <ol class="paging">
                    <li>
                        <c:choose>
                            <c:when test="${paging.nowPage > 1}">
                               <!-- 이전 버튼을 클릭하면 5페이지씩 이동, 1페이지 이하로 가면 1페이지로 고정 -->
                                <a href="/region_selected?facilityType=${facilityType}&cPage=${paging.nowPage - 1}">이전</a>
                            </c:when>
                            <c:otherwise>
                                <span>이전</span> 
                            </c:otherwise>
                        </c:choose>
                    </li>

                    <c:set var="currentBlock" value="${(paging.nowPage - 1) / 5}" />
                    <c:set var="startPage" value="${currentBlock * 5 + 1}" />
                    <c:set var="endPage" value="${startPage + 4}" />
                    
                    <c:if test="${endPage > paging.totalPage}">
                        <c:set var="endPage" value="${paging.totalPage}" />
                    </c:if>

                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
                        <li>
                            <c:choose>
                                <c:when test="${i == paging.nowPage}">
                                    <span class="now">${i}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="/region_selected?facilityType=${facilityType}&cPage=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:forEach>

                    <li>
                        <c:choose>
                            <c:when test="${endPage < paging.totalPage}">
                                <a href="/region_selected?facilityType=${facilityType}&cPage=${paging.nowPage + 5}">다음</a>
                            </c:when>
                            <c:otherwise>
                                <span>다음</span> 
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ol>
            </td>
        </tr>
    </tfoot>
</table>













   <script>
  /*       function showFacility(type) {
         const hospitalList = document.getElementById('hospitalList');
         const homeList = document.getElementById('homeList');
         const hospitalTab = document.getElementById('hospitalTab');
         const homeTab = document.getElementById('homeTab');

         if (type === 'hospital') {
            hospitalList.classList.add('active');
            homeList.classList.remove('active');
            hospitalTab.classList.add('active');
            homeTab.classList.remove('active');
            
         } else {
            hospitalList.classList.remove('active');
            homeList.classList.add('active');
            hospitalTab.classList.remove('active');
            homeTab.classList.add('active');
         }
      } */
      function showFacility(Id) {
         console.log(Id);
         let tabs = document.querySelectorAll('.tab');
         tabs.forEach(element=>{element.classList.remove('active');}); //색깔 떼어내기
         let element = document.getElementById(Id);
         element.classList.add('active');   
      } 
      
      <c:if test="${facilityType == 'A' }">
      showFacility("all");
      </c:if>
      <c:if test="${facilityType == 'H' }">
      showFacility("hospitalTab");
      </c:if>
      <c:if test="${facilityType == 'N' }">
      showFacility("homeTab");
      </c:if>
   </script>
   
   <!-- 시설별  이미지 디테일로 보내는 함수 -->
   <script type="text/javascript">
      function goToDetail(h_id, facilityType, element){
         const imgSrc = element.querySelector('.facility-img').src;
         const imgPath = imgSrc.replace(window.location.origin, '');
         
         let detailUrl = '';
         detailUrl = '/hospitalDetail?h_id=' + h_id + '&imgSrc=' + encodeURIComponent(imgPath);

         location.href = detailUrl;
      }
   </script>

</body>
</html>