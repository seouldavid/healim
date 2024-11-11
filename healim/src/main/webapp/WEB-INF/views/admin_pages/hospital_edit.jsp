<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/resources/css/admin.css" rel="stylesheet" />
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
    .btn {
    background-color: rgb(236, 236, 236); 
    border: none; 
    color: black; 
    padding: 6px 12px; 
    font-size: 16px; 
    cursor: pointer; 
    border-radius: 5px; 
    margin-left: 30px; 
    }
    .btn:hover {
    text-decoration: underline; 
    }
	.button-container {
    background-color: #F7F7F7; 
    display: flex;
    justify-content: center; 
    align-items: center; 
	}
    .num-right{
    text-align: right;
    }
</style>   
<script type="text/javascript">
  <c:if test="${updatechk == 'S'}">
 	 alert("수정 되었습니다.");
  </c:if>
</script>    
</head>

<body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" > </script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수

			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.address;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }

			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("extraAddress").value = '';
			                }

			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('zipcode').value = data.zonecode;
			                document.getElementById('addr').value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById('extraAddress').focus();
			            }
			        }).open();
		}
	</script>
    <!--탑1 --------------------------------------------------------------------------- -->
    <div class="page">
    <div class="top1">
        <div><img class="bt_header" href="#" src="/resources/img/admin_img/logo.png" alt="header" /></div>        
        <div class="administrator">ADMINISTRATOR</div>
        <div class="gohome">
	        <div></div>
	        <div class="house">
		        <a href="/home">
			        <img class="houseimg" src="/resources/img/admin_img/check_img.svg">
			        <button class="homepagebutton"  style="cursor: pointer;">홈페이지</button>
		        </a>
	        </div>
	        <div class="logoutbox">
		        <a href="/login">
			        <img class="houseimg" src="/resources/img/admin_img/right-from-bracket-solid.svg">
			        <button class="logoutbutton" style="cursor: pointer;">로그아웃</button>
		        </a>
	        </div>
        </div>
    </div>
    
<!--탑2 --------------------------------------------------------------------------- -->



    <div class="main">
        
<!-- 네비게이션--------------------------------------------------------------------------- -->
        <div class="nav">
            <ul class="nav_button">
                <li><a href="/index"><img class="nav_img" src="/resources/img/admin_img/button-0.svg"
                      alt="메인페이지 " /></a></li>
                <li><a href="/member"><img class="nav_img" src="/resources/img/admin_img/button-1.svg"
                      alt="회원관리" /></a></li>
                <li><a href="/admin_board"><img class="nav_img" src="/resources/img/admin_img/button-2.svg"
                      alt="게시판 관리" /></a></li>
                <li><a href="/hospital_info"><img class="nav_img" src="/resources/img/admin_img/button-3.svg"
                      alt="병원정보수정" /></a></li>
                <li><a href="/admin"><img class="nav_img" src="/resources/img/admin_img/button-4.svg"
                      alt="관리자관리" /></a></li>
             </ul>

        </div>


<!-- 메인 테이블--------------------------------------------------------------------------- -->

        <div class="content">
    <div class="top2">
        <div class="top2text">
            <h2> 요양원/요양병원 수정 </h2>
        </div>   
   

    </div>

            <!-- 테이블 박스 -->
            <div class="tablebox">
                <section>
            <form  method="post" enctype="multipart/form-data">
            <table class="">
                <thead> 
                    <tr class="headrow">
                        <th  class="firsthead">구분</th><th colspan="7">내 용</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>기관명</td><td> 
                        <input class="titleinput" type="text" name="h_name" id="h_name" value="${hvo.h_name }" required></td>
                        <td>요양원/병원 구분</td>
                        <td>
                            <select class="search-option" name="h_type" id="h_type" style="width:165px;">
								<option value="N" ${hvo.h_type =='N' ? "selected" : ""}>요양원</option>
								<option value="H" ${hvo.h_type =='H' ? "selected" : ""}>요양병원</option>
							</select>
                         </td>
                        <td>개원일</td>
                        <td><input type="text" name="open_date" id="open_date" value="${hvo.open_date }" required></td> 
                    </tr>
                    <tr>
                       <td>운영주체</td>
                        <td>
                            <select class="search-option" name="operator" style="width:165px;">
                                <option value="해당없음" ${hvo.operator =='' ? "selected" : ""}>해당없음</option>
								<option value="개인" ${hvo.operator =='개인' ? "selected" : ""}>개인</option>
								<option value="법인" ${hvo.operator =='법인' ? "selected" : ""}>법인</option>
							</select>
                      
                    	<td>지역</td>
						<td>
							<select name="city_select" id="city_select" style="width:165px;">
								<c:forEach var="k" items="${list}">
									<c:choose>
										<c:when test="${hvo.city_code == k.city_code}">
											<option value="${k.city_code}" selected>${k.city_name}</option>
										</c:when>
										<c:otherwise>
											<option value="${k.city_code}">${k.city_name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
						<!--  <td><input type="text" name="city_name" id="city_name" value="${hvo.city_name }"></td>  -->
                        <td>전화번호</td><td><input type="text" name="tel_no" id="tel_no" value="${hvo.tel_no}" required ></td>
					</tr>
                    <tr>
                        <td>우편번호</td>
                         <td><input type="text" name="zipcode"  id="zipcode" value="${hvo.zipcode}" required>
                             <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br> 
                        </td>
                        <td>주소</td>
                        <td>
                            <input type="text" name="addr" id="addr"   value="${hvo.addr}" size="60" required>
                            <input type="text" name="extraAddress" id="extraAddress"  value="${hvo.extraAddress}" size="30" >
                        </td>                    
                        <td>e-mail</td><td><input  type="text" name="email" id="email" value="${hvo.email}"> </td>
                    </tr>
                    <tr>
                        
                        <td>병원면적</td><td><input class="num-right" type="number" name="area" id="area value="${hvo.area}">&nbsp;m2</td>
                        <td>병실 수</td><td><input class="num-right" type="number" name="room_cnt" id="room_cnt" value="${hvo.room_cnt}"></td>
                        <td>병상 수</td><td><input class="num-right" type="number" name="bed_cnt" id="bed_cnt" value="${hvo.bed_cnt}"></td> 
                    </tr>
                    <tr>
                        <td>등급</td>
                        <td>
                        <select class="search-option" name="grade"  id="grade" style="width:165px;">
                            <option value="해당없음" ${hvo.grade =='' ? "selected" : ""}>해당없음</option>
                            <option value="1등급" ${hvo.grade =='1등급'|| hvo.grade =='A등급' ? "selected" : ""}>1등급/A등급</option>
                            <option value="2등급" ${hvo.grade =='2등급'|| hvo.grade =='B등급' ? "selected" : ""}>2등급/B등급</option>
                            <option value="3등급" ${hvo.grade =='3등급'|| hvo.grade =='C등급' ? "selected" : ""}>3등급/C등급</option>
                            <option value="4등급" ${hvo.grade =='4등급'|| hvo.grade =='D등급' ? "selected" : ""}>4등급/D등급</option>
                            <option value="5등급" ${hvo.grade =='5등급'|| hvo.grade =='E등급' ? "selected" : ""}>등급없음</option>

                        </select>
                        </td>
                        <td>수용정원</td><td><input class="num-right" type="number" name="reg_cnt" id="reg_cnt" value="${hvo.reg_cnt}"></td>
                        <td>현재원</td><td><input  class="num-right" type="number"  name="curr_cnt" id="curr_cnt" value="${hvo.curr_cnt}"></td>
                        
                    </tr>
                    <tr>
                        <td>의사수</td><td><input  class="num-right" type="number" name="doc_cnt" id="doc_cnt" value="${hvo.doc_cnt}" required> </td>
                        <td>사회복지사 수</td><td><input class="num-right" type="number" name="social_cnt" id="social_cnt" value="${hvo.social_cnt}"></td>
                        <td>간호사 수</td><td><input class="num-right" type="number" name="nurse_cnt" id="nurse_cnt" value="${hvo.nurse_cnt}"></td>
                        
                    </tr>
                    </tr>
                        <td>요양보호사수</td><td><input class="num-right" type="number" name="nutri_cnt" id="nutri_cnt" value="${hvo.nutri_cnt}"></td>
                        <td>비고</td><td><input type="text" name="remarks" id="remarks" size="90"  value="${hvo.remarks}"></td>
                        <td>영양사 수</td><td><input class="num-right"  type="number" name="care_cnt"  id="care_cnt" value="${hvo.care_cnt}"></td>
                    <tr>
                        <td>진료과목</td><td colspan="5"><input type="text"  name="treatment"  id="treatment" size="240"  value="${hvo.treatment}"></td>
                    </tr>
                    <tr>
					    <td>첨부파일1</td>
					    <td colspan="1">
					        <div class="preview"></div>
					        <input type="file"  name ="file_1" id="file_1" style="width: 300px;" value="${hvo.f_name1}">
					        <c:choose>
								<c:when test="${empty hvo.f_name1}">
									<b>첨부파일없음</b>
								</c:when>
								<c:otherwise>
									<a href="/hospital_download?f_name=${hvo.f_name1}">
									<img src="/resources/upload/${hvo.f_name1}" style="width: 80px"></a><br>${hvo.f_name1}
								</c:otherwise>
							</c:choose>
					        
					    </td>
					    <td>첨부파일2</td>
					    <td colspan="1">
					        <div class="preview"></div>
					        <input type="file" name ="file_2" id="file_2" style="width: 300px;" value="${hvo.f_name2}"> 
					        <c:choose>
								<c:when test="${empty hvo.f_name2}">
									<b>첨부파일없음</b>
								</c:when>
								<c:otherwise>
									<a href="/hospital_download?f_name=${hvo.f_name2 }">
									<img src="/resources/upload/${hvo.f_name2}" style="width: 80px"></a><br>${hvo.f_name2}
								</c:otherwise>
							</c:choose>
					    </td>
					   
					</tr>
                    <tr>
                        <td colspan="6">
                            <div class="button-container">
                                 <input type="hidden" name="h_id" value="${hvo.h_id}">
                                 <input type="hidden" name="city_code" id="city_code" value="${hvo.city_code}" >
                                 <input type="hidden" name="city_name" id="city_name" value="${hvo.city_name}">
                                 <input type="hidden" name="ori_f_name1" id="ori_f_name1" value="${hvo.f_name1}">
                                 <input type="hidden" name="ori_f_name2" id="ori_f_name2" value="${hvo.f_name2}">
                                 
                               <!--   $('select[name=city_select]').val();  -->
                                 
                        		 <button type="button" id="saveBtn" class="btn" onClick="edit_ok(this.form)"><i class="fa fa-floppy-o"></i>저장</button>
                        		 <button type="button" id="deleteBtn" class="btn" onClick="delete_ok(this.form)"><i class="fa fa-trash "></i>삭제</button>
     							 <button type="button" id="cancelBtn" class="btn" onClick="cancel(this.form)"><i class="fa fa-ban"></i> 취소</button>
    							 <button type="button" id="listBtn" class="btn" onClick="list(this.form)"><i class="fa fa-list"></i> 목록</button>
                    		</div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
          
        </section>

            </div>
        </div>



    </div>

	<script type="text/javascript">
	    $(document).ready(function(){
	        
	        $('#city_select').change(function(e){
	            var ccode = $("#city_select option:selected").val();
	            var cname = $("#city_select option:selected").text();
	             
	            $('#city_name').val(cname);
	            $('#city_code').val(ccode);
	        });
	    
	    });	
	    
	 	function edit_ok(f) {
	 		
			f.action = "/hospital_editok${sc.queryString}";
			f.submit();
	 		/* location.href="<c:url value='/hospital_editok${sc.queryString}&h_id=${hvo.h_id}'/>"; */
	 		
	    }
	 	function cancel(f){
	 		location.href="<c:url value='/hospital_edit${sc.queryString}&h_id=${hvo.h_id}'/>";
	 	}
	 	
	 	function list(f){
	 		location.href="<c:url value='/hospital_info${sc.queryString}'/>";
	 	}
	 	function delete_ok(f){
	 		
	 		 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

	 			 location.href="<c:url value='/hospital_delete${sc.queryString}&h_id=${hvo.h_id}'/>";

	 		 }else{   //취소

	 			 return false;
	 		 }
	 		
	 		
	 	}
	</script>
	
<!-- // 		function check_fild(){
// 				/* 아이디 유효성 검사 */
//  				if(document.querySelector("#h_name").value.length == 0){ // myform.id.value == "" 이것도 가능
					
// // 					//document.querySelector("#remarks").focus(); // 포커스를 이동시켜 바로 아이디를 입력할 수 있게
// // 					document.querySelector("#remarks").value = "비고란 채우기"
					
// // 				}
				
// 			document.querySelector("#remarks").value = "비고란 채우기1515";
			
			
//  			} -->


<!--푸터 --------------------------------------------------------------------------- -->


         <div class="footer"></div> 

    </div>
    


</body>
</html>