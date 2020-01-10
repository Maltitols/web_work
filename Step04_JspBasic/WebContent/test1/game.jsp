<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//context 경로 얻어오기 "/Step04_JspBasic"
	String cPath=request.getContextPath();
	//강제 리다이렉트
	//리다이렉트 걸땐 절대경로로 거는게 일반적
	//따라서 context 경로가 반드시 필요하다
	response.sendRedirect(cPath+"/test1/study.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/game.jsp</title>
</head>
<body>
<p>game 페이지 입니다.</p>
</body>
</html>