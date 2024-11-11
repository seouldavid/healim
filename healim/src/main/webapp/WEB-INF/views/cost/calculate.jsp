<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL 라이브러리 추가 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>계산 결과</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px auto;
        }
        .result {
            margin-top: 20px;
        }
        .result p {
            font-size: 1.1em;
            margin: 5px 0;
        }
        .result p.exceeded {
            color: red;
        }
    </style>
</head>
<body>
    <div class="result">
        <h2>계산 결과</h2>
        <p><strong>월 한도액:</strong> ${monthlyLimit}원</p>
        <p><strong>총 사용 급여:</strong> ${totalCost}원</p>
        <p><strong>조정된 사용 급여:</strong> ${adjustedCost}원</p>
        <p><strong>공단 지원금:</strong> ${supportAmount}원</p>
        <p><strong>본인 부담금:</strong> ${userPay}원</p>

        <!-- 한도를 초과한 경우에만 빨간색 텍스트 표시 -->
     <c:if test="${isExceeded}">
    <p class="exceeded"><strong>+ ${excessAmount}원</strong> (월 한도 초과 + 본인 부담)</p>
</c:if>

        <p><strong>남은 한도액:</strong> ${remainingLimit}원</p>
    </div>
</body>
</html>
