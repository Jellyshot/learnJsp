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
		};