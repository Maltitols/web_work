<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 아이디, 비번 읽어와서
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//2. db에서 유효한 정보인지 확인하고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=UsersDao.getInstance().isValid(dto);
	//3. 유효한 정보이면 로그인 처리, 아니면 빠꾸
	if(isValid){
		//로그인 되었다는 의미에서 session에 "id"라는 키값으로 아이디를 저장한다
		session.setAttribute("id", id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<%if(isValid){ %>
		<p>
			<strong><%=id %></strong> 회원님 로그인 되었습니다.
			<a href="../index.jsp">확인</a>
		</p>
	<%}else{ %>
		<p>
			아이디 혹은 비밀번호가 틀렸습니다
			<a href="loginform.jsp">다시 로그인 하러 가기</a>
		</p>
	<%} %>
</div>
</body>
</html>