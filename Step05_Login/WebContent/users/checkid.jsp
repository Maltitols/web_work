<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//ajax 요청과 함꼐 inputId 라는 파라미터명으로 전달된 몬자열 읽어오기
	String inputId=request.getParameter("inputId");
	//DB에 존자하ㅏ는 아이디인지 확인
	boolean isExist=UsersDao.getInstance().isExist(inputId);
	//존재여부를 json 형식으로 응답
%>
{"isExist": <%=isExist %>}