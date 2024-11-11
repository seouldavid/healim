<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>진료과목 및 전문의</title>
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
        .icons, .categories {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .icon-item, .category-item {
            text-align: center;
            margin: 10px;
        }
        .icon-item img {
            width: 50px;
            height: 50px;
        }
        .categories {
            flex-wrap: wrap;
        }
        .category-item {
            background-color: #f1f1f1;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
        }
        .description-section {
            margin-top: 30px;
            border-top: 1px solid #e0e0e0;
            padding-top: 20px;
        }
        .description-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .description-content {
            line-height: 1.6;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="section-title">진료과목 및 전문의</div>
        <div class="icons">
            <div class="icon-item">
                <img src="/resources/img/level.png" alt="내과">
                <p>내과</p>
            </div>
            <div class="icon-item">
                <img src="/resources/img/level.png" alt="신경과">
                <p>신경과</p>
            </div>
            <div class="icon-item">
                <img src="/resources/img/level.png" alt="외과">
                <p>외과</p>
            </div>
            <div class="icon-item">
                <img src="/resources/img/level.png" alt="재활의학과">
                <p>재활의학과</p>
            </div>
            <div class="icon-item">
                <img src="/resources/img/level.png" alt="가정의학과">
                <p>가정의학과</p>
            </div>
            <div class="icon-item">
                <img src="/resources/img/level.png" alt="한의학과">
                <p>한의학과</p>
            </div>
        </div>

        <div class="section-title">진료 분야</div>
        <div class="categories">
            <div class="category-item">뇌신경재활</div>
            <div class="category-item">근골격계통증재활</div>
            <div class="category-item">암재활</div>
            <div class="category-item">척추손상재활</div>
        </div>

        <div class="description-section">
            <div class="description-title">의뢰진료안내</div>
            <div class="description-content">
                의뢰환자 진료. 단순의뢰 진료는 하지 않습니다.<br>
                퇴원환자 재방 및 진료공은 가능합니다.
            </div>
        </div>

        <div class="description-section">
            <div class="description-title">입,퇴원안내</div>
            <div class="description-content">
                1일입원당일 (24시간 가능)<br>
                고통을 받는 서류 (입소신청서, 주민등록등본)<br>
                3. 입원 절차 등
            </div>
        </div>

        <div class="description-section">
            <div class="description-title">입원생활안내</div>
            <div class="description-content">
                입원 시 준비물<br>
                생활용품<br>
                실내복, 개인용 멜대, 롤링 기저귀<br>
                치솔, 치약, 가그린, 샴푸, 수건<br>
                양말, 속옷, 세면도구, 샤워타올<br>
                삼푸, 바디워시, 비닐봉지<br>
                남자 환자는 면도기를 반드시 지참<br>
                개인속옷은 환자 취향에 맞게 가져오시면 됩니다.
            </div>
        </div>

        <div class="description-section">
            <div class="description-title">예약안내</div>
            <div class="description-content">
                상담실 전화 002-000-0000 내선 상담번호를 누르시면 됩니다.<br>
                핸드폰문자 010-0000-0000 번호로 상담 가능합니다.<br>
                핸드폰번호 010-0000-0000 (24시간 야간 상담 가능)
            </div>
        </div>

        <div class="description-section">
            <div class="description-title">제증명발급안내</div>
            <div class="description-content">
                보호자 신분증 및 가족관계증명서(사본제출) 등으로<br>
                환자분의 증명서를 발급받을 수 있습니다.<br>
                단, 환자 본인의 신분증이 충분하다고 판단되는 경우 본인 스스로 발급 가능합니다.
            </div>
        </div>
    </div>
</body>
</html>
