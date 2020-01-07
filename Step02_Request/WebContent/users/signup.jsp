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
	//post 방식 전송했을 떄 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");
	//폼 전송되는 파라미터 추출하기
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	String gender=request.getParameter("gender");
	String[] hobby=request.getParameterValues("hobby");
	String a=request.getParameter("like");
	String b=request.getParameter("comment");
	//DB에 저장하고 전송된 내용을 콘솔창에 테스트출력
	System.out.println(email);
	System.out.println(pwd);
	System.out.println(gender);
	for(int i=0;i<hobby.length;i++){
		System.out.println(hobby[i]);
	}
	System.out.println(a);
	System.out.println(b);
	//응답
%>
<script>
	alert("<%= email %> 님이 가입하셨습니다.");
</script>
</body>
</html>