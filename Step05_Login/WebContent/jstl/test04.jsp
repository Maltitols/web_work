<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test04.jsp</title>
</head>
<body>
<%
	request.setAttribute("size", 123456789);
	request.setAttribute("weight", 1234.5678);
%>
<h3>JSTL fmt 테스트</h3>
<p> size : <strong>${size }</strong> byte</p>
<p> size : <strong><fmt:formatNumber value="${size }"/></strong> byte</p>
<p> weight : <strong><fmt:formatNumber value="${weight }" pattern="#,###.## kg"/></strong></p>
</body>
</html>