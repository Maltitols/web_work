<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송 파라미터로 전달되는 삭제할 글 번호와 비밀번호를 읽어온다
	int num=Integer.parseInt(request.getParameter("num"));
	String pwd=request.getParameter("pwd");
	//비밀번호가 일치하는지 확인
	String savedPwd=BoardDao.getInstance().getData(num).getPwd();
	//일치한다면
	boolean isDelete=false;
	if(savedPwd.equals(pwd)){
		//삭제
		isDelete=BoardDao.getInstance().delete(num);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/delete.jsp</title>
</head>
<body>
<div class="container">
	<%if(isDelete){ %>
		<p><%=num %> 번 글을 삭제했습니다.</p>
		<a href="list.jsp">확인</a>
	<%}else{ %>
		<p>삭제 실패!</p>
		<a href="detail.jsp?num=<%=num%>">돌아가기</a>
	<%} %>
</div>
</body>
</html>