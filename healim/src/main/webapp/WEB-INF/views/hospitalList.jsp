<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">

    <title>최근 본 요양시설</title>
    <style>
        body {
            /* font-family: 'Dongle', sans-serif; */
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
            font-size: 70px;
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
            width: 100px; /* 원하는 크기로 조정 */
            height: 100px;
            object-fit: cover; /* 이미지의 비율을 유지하면서 잘 맞춤 */
            border-radius: 10px;
            margin-right: 15px;
        }
        .facility-details h3 {
            margin: 0;
            font-size: 40px;
            
        }

       .facility-details p {
    margin: 5px 0;
    color: gray;
    font-size: 20px;
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
    
    
.open-date {
    color: #007bff; 
    font-weight: bold; 
    font-size: 24px;
    margin-top: 10px; 
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
    <div class="logo">
        <a href="/home"><img class="logoimg" src="/resources/img/main.png"></a>
    </div>
<div class="container">

    <div class="header">헤아림 ${value}</div>

    <div class="tabs">
        <div class="tab active" id="hospitalTab" onclick="location.href='/hospitalList?facility2=H2'">요양병원</div>
        <div class="tab" id="homeTab" onclick="location.href='/hospitalList?facility2=N2'">요양원</div>
    </div>


	<c:forEach var="k" items="${hospitalList}" varStatus="status">
    <c:if test="${facility2 == 'H2'}">
        <c:set var="totalImages" value="20" />
        <c:set var="imageNumber" value="${(status.index % totalImages) + 1}" />
        <div class="facility-item" onclick="location.href='/hospitalDetail?h_id=${k.h_id}'">
            <span class="facility-number">${status.index + 1}. </span> <!-- 번호 추가 -->
            <img src="/resources/img2/${imageNumber}.jpg" alt="병원 이미지">
            <div class="facility-details">
                <h3>${k.h_name}</h3>
                <p>주소: ${k.addr}</p>
                <h3><p>개원일: ${k.open_date}</p></h3>
            </div>  
        </div>
    </c:if>
    
    <c:if test="${facility2 == 'N2'}">
        <c:set var="totalImages" value="20" />
        <c:set var="imageNumber" value="${(status.index % totalImages) + 1}" />
        <div class="facility-item" onclick="location.href='/hospitalDetail?h_id=${k.h_id}'">
            <span class="facility-number">${status.index + 1}. </span> <!-- 번호 추가 -->
            <img src="/resources/img3/${imageNumber}.jpg" alt="병원 이미지">
            <div class="facility-details">
                <h3>${k.h_name}</h3>
                <p>주소: ${k.addr}</p>
                <h3><p class="open-date">개원일: ${k.open_date}</p></h3>
            </div>  
        </div>
    </c:if>
</c:forEach>

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

 





<%-- <!-- 페이지기법 -->
	<table>
		<tfoot>
			<tr>
				<td>
					<ol class="paging">
						<li><c:choose>
								<c:when test="${paging.nowPage > 1}">
									<!-- 이전 버튼을 클릭하면 5페이지씩 이동, 1페이지 이하로 가면 1페이지로 고정 -->
									<a
										href="/hospitalList?facility2=${facility2}&cPage=${paging.nowPage - 5 <= 1 ? 1 : paging.nowPage - 5}">이전</a>
								</c:when>
								<c:otherwise>
									<span>이전</span>
								</c:otherwise>
							</c:choose></li>

						<c:set var="currentBlock" value="${(paging.nowPage - 1) / 5}" />
						<c:set var="startPage" value="${currentBlock * 5 + 1}" />
						<c:set var="endPage" value="${startPage + 4}" />

						<c:if test="${endPage > paging.totalPage}">
							<c:set var="endPage" value="${paging.totalPage}" />
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li><c:choose>
									<c:when test="${i == paging.nowPage}">
										<span class="now">${i}</span>
									</c:when>
									<c:otherwise>
										<a
											href="/hospitalList?facility2=${facility2}&cPage=${i}">${i}</a>
									</c:otherwise>
								</c:choose></li>
						</c:forEach>

						<li><c:choose>
								<c:when test="${endPage < paging.totalPage}">
									<a
										href="/hospitalList?facility2=${facility2}&cPage=${paging.nowPage + 5}">다음</a>
								</c:when>
								<c:otherwise>
									<span>다음</span>
								</c:otherwise>
							</c:choose></li>
					</ol>
				</td>
			</tr>
		</tfoot>
	</table>

 --%>


<!-- <script>
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

    window.onload = function() {
        showFacility('hospital'); // 기본으로 요양병원 탭을 보여줍니다.
    }
</script> -->
<script>
	function showFacility(Id) {
			console.log(Id);
			let tabs = document.querySelectorAll('.tab');
			tabs.forEach(element=>{element.classList.remove('active');}); //색깔 떼어내기
			let element = document.getElementById(Id);
			element.classList.add('active');	
		} 

		
		
	 	<c:if test="${facility2 == 'H2' }">
		showFacility("hospitalTab");
		</c:if>
		<c:if test="${facility2 == 'N2' }">
		showFacility("homeTab");
		</c:if> 
</script>


</body>
</html>