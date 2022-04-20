<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<!-- Main -->
	<div id="main">

		<!-- Post -->
			<section class="post">
				<header class="major">
					<span class="date">${serverTime}</span>
					<h2>회원가입</h2>
				</header>
				<form method="post" action="/member/insert" name="join_form">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							<input type="text" name="m_id" id="demo-id" placeholder="ID" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="m_name" id="demo-name"  placeholder="Name" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="password" name="m_passwd" id="demo-passwd" value="" placeholder="Password" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="password" name="m_cpasswd" id="demo-cpasswd" value="" placeholder="Confirm Password" />
						</div>
						<!-- Break -->
						<div class="col-12">
							<input type="text" name="m_phone" id="demo-phone" value="" placeholder="Phone Number" />
						</div>
						
						
						<!-- 주소 -->
						<div class="col-12">
						<input type="text" id="sample6_postcode" name="m_zipcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" name="m_address01" placeholder="주소"><br>
						<input type="text" id="sample6_detailAddress" name="m_address02" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
						
						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
						    function sample6_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
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
						                    document.getElementById("sample6_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample6_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample6_postcode').value = data.zonecode;
						                document.getElementById("sample6_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample6_detailAddress").focus();
						            }
						        }).open();
						    }
						</script>	
						</div>
					
					
						<script defer src="/resources/js/joinchk.js">			
						</script>
					
					
						<!-- Break -->
						<div class="col-6">
							<ul class="actions">
								<li><input type="button" value="Sign Up" class="primary" onclick="joinchk();" /></li>
								<li><input type="reset" value="Reset" /></li>
							</ul>
						</div>
					</div>
				</form>
				
				
			</section>

	

	</div>
<%@ include file="../include/footer.jsp"%>