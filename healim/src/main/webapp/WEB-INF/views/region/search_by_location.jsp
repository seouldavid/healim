<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&display=swap"
	rel="stylesheet">

<title>최근 본 요양시설</title>
<style>
body {
	/* font-family: 'Dongle', sans-serif; */
	
	font-weight: 10px;
	background-color: #e7f1ff;
	margin: 0;
	padding: 0;
	font-size: 25px;
}

.logo {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

a {
	text-decoration: none;
	color: inherit;
	text-align: center;
	/*font-size: 70px;*/
}

.container {
	
	width: 90%;
	max-width: 800px;
	margin: 20px auto;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.header {
	text-align: center;
	font-size: 50px;
	font-weight: bold;
	margin-bottom: 20px;
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
	border-bottom: 3px solid #007bff;
}

.facility-list {
	display: none;
}

.facility-list.active {
	display: block;
}

.facility-item {
	display: flex;
	align-items: center;
	border-bottom: 1px solid #ddd;
	padding: 15px 0;
	cursor: pointer;
}

.facility-item img {
    width: 60px;  /* 너비 고정 */
    height: 60px; /* 높이 고정 */
    object-fit: cover;  /* 비율을 유지하면서 크기 맞추기 */
    border-radius: 10px;
    margin-right: 15px;
}

.facility-details h3 {
	margin: 0;
	font-size: 30px;
}

.facility-details p {
	margin: 5px 0 0;
	color: gray;
	text-align: left;
	font-size: 17px;
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
	width: 300px; /* 로고 크기를 300px로 지정 */
	display: block;
	margin: 10px auto;
}

.disable {
	color: silver;
}

.pagination {
	display: flex;
	justify-content: center;
	list-style: none;
	gap: 20px;
}

.now {
	border: 1px solid black;
	background: black;
	color: white;
	font-weight: bold;
}

ol {
	padding-left: 0px;
}

ol li:hover {
	border: 1px solid #474747;
	background: #474747;
	color: white;
	font-weight: bold;
}

li {
	border: 1px solid white;
	padding: 0px 12px;
	border-radius: 50%;
}

</style>
</head>
<body>
	<div class="logo">
		<a href="/home"><img class="logoimg" src="/resources/img/main.png"></a>
	</div>
	<div class="container" id="container">

		<div class="header">헤아림</div>
		<%
		//선택한 도시 다시 컨트롤러로 전송
		String[] values = request.getParameterValues("district");
		StringBuffer sb = new StringBuffer();
		if (values != null) {
			for (String value : values) {
				sb.append("district=");
				sb.append(java.net.URLEncoder.encode(value, "UTF-8"));
				sb.append("&");
			}
		}
		%>

		<div class="tabs">
			<div class="tab active" id="all"
				onclick="location.href='/search_location?<%=sb.toString()%>facilityType=A'">전체</div>
			<div class="tab" id="hospitalTab"
				onclick="location.href='/search_location?<%=sb.toString()%>facilityType=H'">요양병원</div>
			<div class="tab" id="homeTab"
				onclick="location.href='/search_location?<%=sb.toString()%>facilityType=N'">요양원</div>
		</div>




		<c:forEach var="k" items="${hospital_list}" varStatus="status">

		<c:if test="${facilityType == 'A' }">
	 <c:set var="totalImages" value="20" />
    <c:set var="imageNumber" value="${(status.index % totalImages) + 1}" />
			<div class="facility-list active" id="homeList">
				<div class="facility-item"
					onclick="location.href='/hospitalDetail?h_id=${k.h_id}';">
					<img src="/resources/img3/${imageNumber + (paging.nowPage -1) * paging.getNumPerPage()}.jpg" alt="${k.h_name}">
					<div class="facility-details">
						<h3>${k.h_name}</h3>
						<p>${k.addr}</p>
					</div>
				</div>
			</div>
			
			</c:if>
			
			
		<c:if test="${facilityType == 'H' }">
	 <c:set var="totalImages" value="20" />
    <c:set var="imageNumber" value="${(status.index % totalImages) + 1}" />
    
			<div class="facility-list active" id="homeList">
				<div class="facility-item"
					onclick="location.href='/hospitalDetail?h_id=${k.h_id}';">
					<img src="/resources/img2/${imageNumber + (paging.nowPage -1) * paging.getNumPerPage()}.jpg" alt="시설이미지">
					<div class="facility-details">
						<h3>${k.h_name}</h3>
						<p>${k.addr}</p>
					</div>
				</div>
			</div>
			
			</c:if>
			
			
		<c:if test="${facilityType == 'N' }">
	 <c:set var="totalImages" value="20" />
    <c:set var="imageNumber" value="${(status.index % totalImages) + 1}" />
    
			<div class="facility-list active" id="homeList">
				<div class="facility-item"
					onclick="location.href='/hospitalDetail?h_id=${k.h_id}';">
					<img src="/resources/img4/${imageNumber + (paging.nowPage -1) * paging.getNumPerPage()}.jpg" alt="${k.h_name}">
					<div class="facility-details">
						<h3>${k.h_name}</h3>
						<p>${k.addr}</p>
					</div>
				</div>
			</div>
			
			</c:if>
			
			
		</c:forEach>







		<ol class="pagination">
			<c:choose>
				<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
					<li class="disable">이전으로</li>
				</c:when>
				<c:otherwise>
					<li><a
						href="/search_location?<%=sb.toString()%>facilityType=${facilityType}&cPage=${paging.beginBlock - paging.pagePerBlock}">이전으로</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}"
				step="1" var="k">

				<%-- 현재페이지 (링크X)와 현재 페이지가 아닌 것을 구분하자. --%>
				<c:if test="${k == paging.nowPage }">
					<li class="now">${k}</li>
				</c:if>
				<c:if test="${k != paging.nowPage }">
					<li><a
						href="/search_location?<%=sb.toString()%>facilityType=${facilityType}&cPage=${k}">${k}</a></li>
				</c:if>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.endBlock >= paging.totalPage }">
					<li class="disable">다음으로</li>
				</c:when>
				<c:otherwise>
					<li><a
						href="/search_location?<%=sb.toString()%>facilityType=${facilityType}&cPage=${paging.beginBlock + paging.pagePerBlock}">다음으로</a></li>
				</c:otherwise>
			</c:choose>

		</ol>






	</div>
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



	<script>
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

</body>
</html>