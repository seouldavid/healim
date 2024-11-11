<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이용 후기</title>
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

.rating-section {
	text-align: center;
	margin-bottom: 30px;
}

.rating-number {
	font-size: 48px;
	font-weight: bold;
	margin-bottom: 10px;
}

.rating-stars {
	margin-bottom: 10px;
}

.rating-distribution {
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}

.rating-bar {
	width: 100px;
	height: 10px;
	background-color: #ddd;
	margin: 0 5px;
	position: relative;
}

.rating-bar-filled {
	height: 100%;
	background-color: #4caf50;
	position: absolute;
	top: 0;
	left: 0;
}

.review-button {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	display: inline-block;
	border: none;
}

.review {
	margin-bottom: 30px;
	border-top: 1px solid #e0e0e0;
	padding-top: 20px;
}

.review-header {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.review-rating {
	font-size: 24px;
	margin-right: 10px;
	color: #fbc02d;
}

.review-name {
	font-size: 16px;
	color: #555;
}

.review-content {
	font-size: 14px;
	color: #333;
	margin-bottom: 10px;
}

.review-response {
	font-size: 14px;
	color: #555;
	background-color: #f1f1f1;
	padding: 10px;
	border-radius: 5px;
}

.review-date {
	font-size: 12px;
	color: #888;
	margin-top: 5px;
}

.starselection, option {
	font-size: 34px;
	margin-right: 10px;
	color: #fbc02d;
}

textarea {
	width: 90%;
	height: 15vh;
	resize: none;
}
/*         select{
        border: none;
        } */
</style>
</head>
<body>
	<div class="container">
	
		<!-- 후기 입력 상자 -->
		<form action="/reviewWrite" method="post">
			<div class="review">
				<div class="review-header">
					<div class="review-rating">
						<select name="h_score" class="starselection">
							<option value="5">⭐⭐⭐⭐⭐</option>
							<option value="4">⭐⭐⭐⭐</option>
							<option value="3">⭐⭐⭐</option>
							<option value="2">⭐⭐</option>
							<option value="1">⭐</option>
						</select>
					</div>
					<div class="review-name">닉네임 : ${mbvo.mber_nm}</div>
				</div>
				<div>
					<textarea rows="10" cols="30" name="wr_content" placeholder="비방,욕설 등의 후기는 삭제될 수 있습니다."></textarea>
				</div>
				<button type="submit" class="review-button">후기 남기기</button>
				<input type="hidden" name="bbs_id" value="REVIEW"> <input
					type="hidden" name="h_id" value="${hvo.h_id}"> <input
					type="hidden" name="sort_ordr" value="0"> <input
					type="hidden" name="mber_id" value="${mbvo.mber_id}"> <input
					type="hidden" name="mber_nm" value="${mbvo.mber_nm}"> <input
					type="hidden" name="password" value="${mbvo.password}">
			</div>
		</form>

		<!-- 리뷰 for문  -->
		<c:forEach var="k" items="${list}">
		<form action="/reviewDelete">
			<div class="review">
				<div class="review-header">
					<div class="review-rating">
						<c:forEach var="i" begin="1" end="${k.h_score}">
                    ⭐
                </c:forEach>
					</div>
					<div class="review-name">${k.mber_nm}</div>
					<div class="review-date">( ${k.daysDifference}일 전)</div>
				</div>
				<br>
				<div class="review-content">${k.wr_content}</div>
			</div>
			<c:if test="${k.mber_id==mbvo.mber_id}">
				<input type="hidden" name="h_id" value="${k.h_id}">
				<input type="hidden" name="bbs_id" value="${k.bbs_id}">
				<input type="hidden" name="wr_id" value="${k.wr_id}">
				<input type="submit" value="삭제하기">
			</c:if>
			</form>
		</c:forEach>

	</div>
</body>
</html>
