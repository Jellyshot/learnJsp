
function joinchk() {

	let m_id = document.getElementById("demo-id");
	let m_name = document.getElementById("demo-name");
	let m_passwd = document.getElementById("demo-passwd");
	let m_cpasswd = document.getElementById("demo-cpasswd");
	let m_phone = document.getElementById("demo-phone");
	let m_zipcode = document.getElementById("sample6_postcode");
	let m_address01 = document.getElementById("sample6_address");
	let m_address02 = document.getElementById("sample6_detailAddress");
	
	if (m_id.value == ""){
		alert("아이디를 입력하세요");
		m_id.focus();
		return false;
	}
	
	
	/*let idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,25}$/;*/
	let idCheck = /^(?=.*[a-zA-Z0-9]).{4,25}$/;
	if(!idCheck.test(m_id.value)){
		alert("아이디는 대소영문자와 숫자를 사용하여 4~25자로 작성해 주세요")
		m_id.focus();
		return false;
	}
	
	if(m_name.value == ""){
		alert("이름을 입력해 주세요");
		m_name.focus();
		return false;
	}
	
	if(m_passwd.value == ""){
		alert("비밀번호를 입력해 주세요");
		m_passwd.focus();
		return false;
	}
	
	let passwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,24}$/; 
	if (!passwdCheck.test(m_passwd.value)){
		alert("비밀번호는 대소영문자와 숫자, 특수문자를 혼합하여 8~24자리로 작성해 주세요");
		m_passwd.focus();
		return false;
	}
	
	if(m_passwd.value != m_cpasswd.value){
		alert("비밀번호를 다시 한번 확인해 주세요");
		m_cpasswd.focus();
		return false;
	}
	
	if(m_phone.value == ""){
		alert("전화번호를 입력해 주세요");
		m_phone.focus()	;
		return false;
	}
	
	let phoneCheck = /^[0-9]{10,11}$/;
	if(!phoneCheck.test(m_phone.value)){
		alert("전화번호는 숫자만 입력해 주세요");
		m_phone.focus();
		return false;
	}
	
	if(m_zipcode.value == ""){
		alert("우편번호를 입력해 주세요");
		m_zipcode.focus();
		return false;
	}
	
	if(m_address01.value == ""){
		alert("주소를 입력해 주세요");
		m_address01.focus();
		return false;
	}
	
	if(m_address02.value ==""){
		alert("상세주소를 입력해 주세요");
		m_address02.focus();
		return false;
	}
	
	
	/*alert("회원가입에 성공하였습니다.");*/
	document.join_form.submit();	
		
	
}