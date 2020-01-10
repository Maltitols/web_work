<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/home.jsp</title>
</head>
<body>
<%
	/*
		jsp에서 기본으로 제공해주는 객체중에서
		HttpServletRequest, HttpSession, ServletContext
		type 객체가 있다.
		해당 객체 참조값은
		request, session, application이라는 이름의 지역변수에 들어있다.
		떄로는 어떤 data를 각각의 객체에 저장하고 읽어낼 필요가 있다.
	
	*/
	// .setAtribute(key, value)
	//응답 직전까지 유효(1회성)
	request.setAttribute("myName", "김구라");
	//브라우저 닫기 전까지 유효
	session.setAttribute("yourName", "해골");
	//서버 내리기전까지 유효
	application.setAttribute("ourName", "원숭이");
%>
<h1>scope 테스트 home</h1>
<ul>
	<li><a href="other.jsp">다른 페이지로 이동!</a></li>
</ul>
</body>
</html>