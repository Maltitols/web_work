<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파라미터로 넘어오는 글번호를 얻어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB에서 글번호에 해당하는 글정보를 얻어온다.
	BoardDto dto=BoardDao.getInstance().getData(num);
	//3. 글 자세히 보기 페이지를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<!-- jquery+bootstrap javascript 로딩 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

</head>
<body>
<%-- 피 include 되는 jsp 페이지에 파라미터를 전달할수 있음 --%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="freeboard" name="category"/>
</jsp:include>
<div class="container">
	<!-- 현재 페이지의 위치를 좀 더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">목록</a></li>
		<li>글 자세히 보기</li>
	</ol>
	<h1>글 자세히 보기 페이지</h1>
	<table class="table table-bordered">
		<tr>
			<th>글 번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="30" rows="10" disabled><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<form action="delete.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<input type="password" name="pwd" placeholder="비밀번호..."/>
		<button type="submit">삭제</button>
	</form>
	<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
</div>
<%-- /include/footer.jsp --%>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>