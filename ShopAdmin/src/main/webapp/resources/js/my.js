	/*
	function writeform(){
		var thisform = document.writefrm; // thisform변수에 폼 저장
		thisform.method = "post";
		thisform.action = "/board2/insert";
		
		var id_subject = document.getElementById('id_subject').value;
		if(id_subject == ''){
			alert('제목을 입력해야 합니다.');
		} else{
		 thisform.submit(); // thisform 전송	
		 }
		};
		
	function writeform2(){
		var thisform = document.writefrm; // thisform변수에 폼 저장
		thisform.method = "post";
		thisform.action = "/board2/insert";
		
		var id_subject = document.getElementById('id_subject').value;
		if(id_subject == ''){
			alert('제목을 입력해야 합니다.');
		} else{
		 thisform.submit(); // thisform 전송	
		 }
		}; */
		
		
	/* 제이쿼리 사용 */
	/---------------------------------22.03.24 JQuery 학습---------------------------------------/
	// $기호는 변수를 선언하기 위해서, ()는 '선택자(키워드)'를 넣는다.
	
	$(document).ready(function() {		  // 현재 페이지가 시작될 때 처리할 내용을 작성 (ready)
		$("#id_btn").click(function() {   // id_btn을 클릭했을 경우에 이벤트 발생, 버튼이 클릭될 때 처리할 내용을 작성 (click)
			alert('테스트버튼');
			//alert($("#id_subject").val());	// 해당 id위치에 텍스트를 입력하면 그 텍스트가 무엇인지 나타내주는 기능?
			if ($("#id_subject").val() == '') {   // 해당 위치의 값(value)이 공백이라면
				alert('제목을 입력해야 합니다.');
			} else if ($("#id_name").val() == '') {
				alert('이름을 입력해야 합니다.');
			} else if ($("#id_contents").val() == '') {
				alert('내용을 입력해야 합니다.');
			} else {
				$("#id_writeform").attr("method","post"); // attr(attribute) 동적 처리를 위한 지시어
				$("#id_writeform").attr("action","/board2/insert"); // attr 동적 처리를 위한 지시어
				$("#id_writeform").submit();	// 폼에 소속된 객체의 내용을 전송한다.
				
			}
		});
});
