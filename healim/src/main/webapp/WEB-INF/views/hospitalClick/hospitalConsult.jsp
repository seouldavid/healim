<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 상담</title>
<style>
body {
	margin: 0 auto;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: white;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
}

.section-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.question {
	font-size: 16px;
	font-weight: bold;
	color: #333;
	margin-bottom: 5px;
	cursor: pointer;
}

.answer {
	font-size: 14px;
	color: #007bff; /* 파란색으로 "답변완료" 처리 */
	margin-bottom: 15px;
}

.answer span {
	color: #888;
}

.question-box {
	margin-bottom: 20px;
	border-bottom: 1px solid #e0e0e0;
	padding-bottom: 10px;
}

/* content-area 스타일 */
.content-area {
	margin-top: 10px;
	display: none; /* 기본적으로 숨김 처리 */
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery 추가 -->

<script>
	// 질문 클릭 시 상세 내용을 토글하는 함수
	function toggleDetail(element, url) {
		var contentArea = $(element).find('.content-area');

		if (contentArea.is(':visible')) {
			// 이미 열려있는 경우 닫음
			contentArea.slideUp();
		} else {
			// 열려있지 않으면 AJAX로 세부 내용을 불러옴
			$.ajax({
				url : url, // 요청 보낼 URL
				type : 'GET', // 요청 방식 (GET)
				success : function(response) {
					// 서버 응답을 contentArea에 삽입
					contentArea.html(response).slideDown();
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error('AJAX Error: ' + status + ' - ' + error);
				}
			});
		}
	}
</script>

</head>
<body>

	<div class="container">
		<div class="section-title">온라인 상담</div>
			
			<c:if test="${empty list}">
					<h3>상담내역이 없습니다.</h3>
			</c:if>
			
			
		<!-- 질문 클릭 시 서버에서 데이터를 받아오는 부분 -->
		<c:forEach var="k" items="${list}">
			<div class="question-box"
				onclick="toggleDetail(this, '/hospitalConsultDetail?wr_id=${k.wr_id}')">
				<!--수정필요  -->
				<div class="question">
					<c:choose>
						<c:when test="${empty k.parent_id}">
							<a>${k.wr_subject}</a>
						</c:when>
						<c:otherwise>
							<a style="color: gray"> ㄴ ${k.wr_subject}</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="answer">
					<c:choose>
				
					<c:when test="${k.childCount != null && k.childCount != 0 && k.parent_id == null}">		
            	 답변완료
            </c:when>
						
						<c:when test="${(k.childCount == null || k.childCount == 0) && k.parent_id == null}">
            	답변대기
            </c:when>
						<c:otherwise>
							<a style="color: gray">답변</a>
						</c:otherwise>
					</c:choose>
					<br>
					<span>이용자 이름 : ${k.mber_nm}</span><br>
					<span>(${k.daysDifference} 일전 상담)</span>

				</div>
				<!-- 서버에서 데이터를 받아서 삽입할 위치 -->
				<div class="content-area"></div>
			</div>
		</c:forEach>
	</div>


</body>
</html>
