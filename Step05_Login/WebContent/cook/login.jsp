<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송된 파라미터 읽어오기
	String id=request.getParameter("id");
	//checkbox를 체크했는지 읽어오기(체크하지 않았으면 null)
	String isSave=request.getParameter("isSave");
	if(isSave!=null){
		//아이디를 쿠키로 저장하기
		Cookie cook=new Cookie("savedId", id);
		//테스트용으로 60초만 유지시켜본다
		cook.setMaxAge(60);
		//응답객체(HttpServletResponse)를 이용해서 쿠키도 같이 응답
		response.addCookie(cook);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p> <%=id %>님 로그인 되었습니다.</p>
<a href="test2.jsp">로그인 폼으로 돌아가기</a>
</body>
</html>