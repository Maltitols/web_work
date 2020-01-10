<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 글 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	//2. 수정할 글 정보 읽어오기
	BoardDto dto=BoardDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/updateform.jsp</title>
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
		<li>글 수정 폼</li>
	</ol>
	<h1>글 수정 폼 입니다.</h1>
	<p>글번호 : <strong><%=dto.getNum() %></strong></p>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<div>
			<label for="writer">작성자</label>
			<input type="text" id="writer" name="writer" value="<%=dto.getWriter() %>" disabled/>
			<input type="hidden" name="writer" value="<%=dto.getWriter() %>" />
		</div>
		<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" value="<%=dto.getTitle() %>"/>
		</div>
		<div>
			<label for="content">내용</label>
			<textarea name="content" id="content" cols="30" rows="10"><%=dto.getContent() %></textarea>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" name="pwd" placeholder="저장된 비밀번호 입력..."/>
		</div>
		<button type="submit">수정</button>
		<button type="reset">취소</button>
	</form>
</div>
<%-- /include/footer.jsp --%>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>