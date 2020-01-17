<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request에 담긴 String type 얻어내기
	String myName=(String)request.getAttribute("myName");
	//session에 담긴 String type 얻어내기
	String yourName=(String)session.getAttribute("yourName");
	//application에 담긴 String type 얻어내기
	String ourName=(String)application.getAttribute("ourName");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/other.jsp</title>
</head>
<body>
	<p> request의 myName : <string><%=myName %></string></p>
	<p> session의 yourName : <string><%=yourName %></string></p>
	<p> application의 ourName : <string><%=ourName %></string></p>
	
	<p><a href="reset.jsp">삭제하러 가기</a></p>
</body>
</html>