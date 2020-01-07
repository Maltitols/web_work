<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//1. 폼 전송되는 파라미터 추출
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");
	//2. MemberDao 객체를 이용해서 DB 에 수정 반영
	TodoDto dto=new TodoDto(num, content, regdate);
	boolean isSuccess=TodoDao.getInstance().update(dto);
	//3. 응답
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("수정 했습니다.");
		location.href="list.jsp";
	</script>
<%}else{ %>
	<script>
		alert("수정 실패!");
		location.href="list.jsp";
	</script>
<%} %>
</body>
</html>