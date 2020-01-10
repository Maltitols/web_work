<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
		
	String savedPwd=BoardDao.getInstance().getData(num).getPwd();
	boolean isSuccess=false;
	if(savedPwd.equals(pwd)){
		//BoardDto 객체에 수정할 글의 정보를 담아서 
		BoardDto dto=new BoardDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		//DB 에 수정 반영하기 
		isSuccess=BoardDao.getInstance().update(dto);	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/update.jsp</title>
</head>
<body>
<div class="container">
	<%if(isSuccess){ %>
		<p><%=num %> 번 글을 수정했습니다.</p>
		<a href="list.jsp">확인</a>
	<%}else{ %>
		<p>수정 실패! 비밀번호를 확인 하세요.</p>
		<a href="updateform.jsp?num=<%=num %>">다시 시도</a>
	<%} %>
</div>
</body>
</html>