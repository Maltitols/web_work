<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//post 방식 전송했을 떄 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");
	//폼 전송되는 파라미터 추출하기
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//DB에 저장하고 전송된 내용을 콘솔창에 테스트출력
	System.out.println("name:"+name);
	System.out.println("addr:"+addr);
	//응답
%>
<p><%=name %> 님의 정보를 추가 했습니다.</p>
</body>
</html>