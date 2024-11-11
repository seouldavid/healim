<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신체 상태 및 인지 상태</title>
<style>
.container {
	margin: 0 auto;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: white;
}

.section-title {
	font-size: 24px;
	font-weight: bold;
	color: #007bff;
}

.status-table th, .status-table td {
	padding: 10px;
	border: 1px solid #ddd;
}

.status-table th {
	background-color: #f1f1f1;
	font-weight: bold;
}

textarea {
	width: 70%;
	height: 400px;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 10px; /* 모서리를 둥글게 */
	box-shadow: none; /* 기본 그림자 제거 */
	resize: none; /* 크기 조정 불가 */
	font-size: 16px;
	line-height: 1.5;
	font-family: Arial, sans-serif;
}

textarea:focus {
	outline: none; /* 포커스 시 기본 아웃라인 제거 */
	border-color: #007bff; /* 포커스 시 테두리 색상 변경 */
	box-shadow: none; /* 포커스 시 그림자 제거 */
}

.small {
	color: gray;
	font-size: medium;
}
</style>
</head>
<body>

	<div class="container">

		<div class="hospital-answer">
			<h1>${mvo.wr_subject}</h1>
			<div id="response">${mvo.wr_content}</div>
		</div>
</body>
</html>
