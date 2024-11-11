<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 작성 페이지</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

select {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f8f8f8;
	color: #555;
	cursor: pointer;
}

select:hover {
	background-color: #eee;
}

select:focus {
	border-color: #4CAF50;
	outline: none;
	box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
}

body {
	font-family: Arial, sans-serif;
	background-color: #F5F8FC;
}

.container {
	width: 60%;
	margin: 50px auto;
	background-color: #fff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.container h2 {
	margin-bottom: 20px;
	font-size: 24px;
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

.form-group input[type="text"], .form-group textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

.form-group textarea {
	height: 200px;
	resize: none;
}

.file-section {
	margin-top: 10px;
	display: flex;
	align-items: center;
}

.file-section input[type="file"] {
	display: none;
}

.file-name {
	flex: 1;
	color: #555;
}

.file-buttons {
	display: flex;
	gap: 10px;
}

.file-buttons button {
	padding: 5px 10px;
	background-color: #ccc;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	color: #000000;
}

.file-buttons button:hover {
	background-color: #888;
}

.file-buttons .delete {
	background-color: #14cc00;
}

.actions {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
}

.actions button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

.actions .submit {
	background-color: #28a745;
	color: #000000;
}

.actions .submit:hover {
	background-color: #218838;
}

.actions .cancel {
	background-color: #6c757d;
	color: white;
}

.actions .cancel:hover {
	background-color: #5a6268;
}

/* summernote toolbar 수정  */
.note-btn-group {
	width: auto;
}

.note-toolbar {
	width: auto;
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
	<div class="container">
		<form id="postForm" action="/boardOneListUpdateOK" method="post"
			enctype="multipart/form-data">

			<h2>글 작성</h2>
			<!-- bbs_id 값 확인 -->
			<select name="boardType">
				<option value="문의사항"
					<c:if test="${mvo.bbs_id == 'INQU'}">selected</c:if>>문의사항</option>
				<option value="자유게시판"
					<c:if test="${mvo.bbs_id == 'FREE'}">selected</c:if>>자유게시판</option>
			</select>

			<div class="form-group">
				<label for="title"></label> <input type="text" id="title"
					name="wr_subject" placeholder="제목을 입력하세요" value="${mvo.wr_subject}">
			</div>
			<!--textarea는 summernote가 들어감 ( 아래 함수있음)  -->
			<div class="form-group">
				<label for="content"></label>
				<textarea id="content" name="wr_content">${mvo.wr_content}</textarea>
			</div>
			<!-- 파일첨부란 (섬머노트 아님) -->
			<div class="form-group">
				<label for="fileInput">파일 첨부</label>
				<div class="file-section">
					<span class="file-name">파일 이름이 들어갑니다</span>
					<div class="file-buttons">
						<button type="button"
							onclick="document.getElementById('fileInput').click();">첨부</button>
						<button type="button" class="delete" onclick="removeFile()">삭제</button>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty mvo.atch_file_id}">
						<div><input type="file" name="file_name"><b>이전 파일 없음</b> 
						<input type="hidden" name="old_atch_file_id" value=""></div>
					</c:when>
					<c:otherwise>
					<div>
					<input type="file" id="fileInput" name="file_name" onchange="showFileName()"><b><br>(이전파일 : ${mvo.atch_file_id})</b>
					<input type="hidden" name="old_atch_file_id" value="${mvo.atch_file_id}">
					</div>
					</c:otherwise>
					</c:choose>
					<!-- originalfile 문제예상.. -->
					<input type="hidden" name="wr_id" value="${mvo.wr_id}">
					<input type="hidden" name="bbs_id" value="${mvo.bbs_id}">
					<input type="hidden" name="mber_id" value="${mvo.mber_id}">
					<input type="hidden" name="mber_nm" value="${mvo.mber_nm}">
					<input type="hidden" name="password" value="${mvo.password}">
			</div>

			<div class="actions">
				<button type="button" class="cancel" onclick="boardOneList(this.form)">취소</button>
				<input type="submit" class="submit" value="작성완료">
			</div>
		</form>
	</div>

	<nav class="floating-nav">
		<ul>
			<li><img src="/resources/img/hom4.jpg" alt="홈 이미지"> <a
				href="/home">홈 </a></li>
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


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.js"></script>
	<link href="/resources/css/summernote/summernote-lite.css"
		rel="stylesheet">
	<script type="text/javascript">
		$(function() {
			$("#content").summernote({
				lang : 'ko-KR',
				height : 300,
				focus : true,
				placeholder : "최대 3000자까지 쓸 수 있습니다.",
				callbacks : {
					onImageUpload : function(files, editor) {
						for (let i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
					}
				}
			});
		});

		function sendImage(file, editor) {
			let formData = new FormData();
			formData.append("s_file", file);
			$.ajax({
				url : "/boardSaveImg",
				data : formData,
				method : "post",
				contentType : false,
				processData : false,
				cache : false,
				dataType : "json",
				success : function(data) {
					const path = data.path;
					const fname = data.fname;
					// 이미지를 다운로드 가능한 링크로 삽입
					var imageUrl = path + "/" + fname;
					var link = $('<a>').attr('href', imageUrl) // 다운로드 링크 설정
					.attr('target', '_blank') // 새 탭에서 열기
					.attr('download', fname) // 다운로드 속성 추가
					.html($('<img>').attr('src', imageUrl)); // 이미지 태그 삽입
					$("#content").summernote("editor.insertNode", link[0]);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		}
		function showFileName() {
			const input = document.getElementById('fileInput');
			const fileName = input.files[0] ? input.files[0].name
					: '파일 이름이 들어갑니다';
			document.querySelector('.file-name').textContent = fileName;

		}

		function removeFile() {
			// 파일 입력 폼의 참조를 가져옵니다.
			const fileInput = document.getElementById('fileInput');
			// 파일 입력 폼의 현재 값을 초기화합니다.
			fileInput.value = "";
			// 파일 이름을 표시하는 부분의 텍스트도 초기화합니다.
			document.querySelector('.file-name').textContent = '파일 이름이 들어갑니다';
		}
	</script>
	<script type="text/javascript">
		function boardOneList(f) {
			f.action = "/boardOneList";
			f.submit();
		}
	</script>


</body>
</html>