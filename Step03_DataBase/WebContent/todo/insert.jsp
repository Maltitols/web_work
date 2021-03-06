<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 전송했을때 한글 깨지지 않도록 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");
	//1. 폼전송되는 이름과 주소를 추출해서
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");
	//MemberDto 객체에 담기 
	TodoDto dto=new TodoDto(0, content, regdate);
	//2. MemberDao 객체를 이용해서 DB 에 저장하고 
	TodoDao dao=TodoDao.getInstance();
	boolean isSuccess=dao.insert(dto);
	//3. 응답한다.
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.container{
		padding-top:100px;
	}
</style>
</head>
<body>
<div class="container">
	<%if(isSuccess){ %>
		<p class="alert alert-success"> 
			<strong><%=content %></strong> 를 테이블에 저장했습니다.
			<a href="list.jsp">확인</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">
			저장 실패 했습니다.
			<a class="alert-ling" href="insertform.jsp">다시 시도</a>
		</p>
	<%} %>
</div>
</body>
</html> 
</html>