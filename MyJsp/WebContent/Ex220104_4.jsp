<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");
	/* setCharacterEncoding: 한글일 경우 utf-8로 언어설정을 함.(영어는 관계없음) */
	
	String sname = request.getParameter("sname");
	String spwd = request.getParameter("spwd");
	String sage = request.getParameter("sage");
	String sarea = request.getParameter("sarea");
	String syear = request.getParameter("syear");
	String shoby = request.getParameter("shoby");
	/* request : 클라이언트쪽에서 넘어오는 문자열 정보를 가져와 저장할수 있음.*/
	/* 어지간한 데이터베이스 및 정보 전달은 form으로 처리한다. */	
	
	/* 예외처리 하기 */
	/* 이름, 나이 */
	int iage = 0; 
	/* try 안에서 선언해버리면 밖에서는 사용할 수 없기때문에, 전역변수로 사용하기 위해서 try-catch 구문 밖에서 선언함.*/
	boolean flag = true; 
	// flag:예외처리 응용할때 쓰는 변수. 기본값 = 나이가 정상적으로 넘어옴.
	if(sname.trim().length() < 2){ 
	//trim: 이름의 왼쪽과 오른쪽에 있는 공백을 잘라내는 메서드 
		flag = false; 
		//공백을 잘라낸 길이가 2보다 작다면 false처리함.
	}
	try{
		iage = Integer.parseInt(sage); //정수형태의 문자열을 정수로 형변환 
		
		/* 이 부분에서 나이에 정수형이 들어오지 않으면 오류가 발생하므로 예외처리 구문 작성 */
	}catch(Exception e){
//		iage = 25; //잘못된 값이 넘어와 예외가 발생했을 경우 iage의 값을 디폴트 처리함.
		/* 예외처리의 응용 - 예외가 발생되면 이전 페이지로 넘김*/
		flag = false;
	}
	if(flag == false){ //예외가 발생했을 경우 %>
		<script>
			alert("입력 오류: 성명은 2글자이상 적어주세요");
			history.back();//직전 페이지로 이동
		</script>		
<%
	}else{//정상인 경우 정보 출력.
		out.print("성명 : " + sname + "<br>");
		out.print("나이 : " + sage + "<br>");
		out.print("암호 : " + spwd + "<br>");
		out.print("지역 : " + sarea + "<br>");
		out.print("연도 : " + syear + "년도<br>");
		out.print("취미 : " + shoby + "<br>");
	}
%>
</body>
</html>