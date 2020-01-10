<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/reset.jsp</title>
</head>
<body>
<%
	request.removeAttribute("myName");
	//session.removeAttribute("yourName");
	//한번에 싹 지워버리고 싶으면
	session.invalidate();//session 초기화
	application.removeAttribute("ourName");
%>
<p>모든 영역에 있는 내용을 삭제 했습니다</p>
<a href="other.jsp">확인하러 가기</a>
</body>
</html>