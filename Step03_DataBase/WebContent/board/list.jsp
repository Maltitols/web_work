<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
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
	</ol>
	<h1>게시글 목록 입니다.</h1>
	<table class="table table-bordered">
	
		<thead>
			<tr>
				<th>글 번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<%
			//BoardDao 객체를 이용해서 글 목록을 얻어온다. 
			List<BoardDto> list=BoardDao.getInstance().getList();
		%>
		<tbody>
		<%for(BoardDto tmp: list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>	
		</tbody>
	</table>
	<a href="insertform.jsp">새글 추가 하러 가기</a>
</div>
<%-- /include/footer.jsp --%>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
