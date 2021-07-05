<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//thisPage 파라미터 명으로 전달되는 문자열 읽어오기
	String thisPage = request.getParameter("thisPage");
	//null 이면 빈 문자열 대입
	if(thisPage==null){
		thisPage="";
	}
	
	//로그인 된 아이디 읽어오기
	String id = (String)session.getAttribute("id");
	UsersDto dto = new UsersDto();
	if(id!=null){ //id가 null이 아니면 db에서 가입 정보 얻어오기
		dto=UsersDao.getInstance().getData(id);
	}
%>
	<nav class="navbar navbar-light navbar-expand-sm" style="background-color: #79E5CB;">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/images/shuttlecock_main.png" width="40" height="40">
				High-clear!
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto">
				<li class="nav-item">
					<a class="nav-link" href="">홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">공지사항</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">자유게시판</a>
				</li>
			</ul>
			<%if(id==null){ %>
				<a class="btn btn-info btn-sm me-2" 
				href="<%=request.getContextPath()%>/users/signupform.jsp">
					회원가입
				</a>
				<a class="btn btn-success btn-sm me-2" 
				href="<%=request.getContextPath()%>/users/loginform.jsp">
					로그인
				</a>
			<%}else{ %>
				<%if(dto.getProfile()==null) {%>
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle me-2" viewBox="0 0 16 16">
						<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				<%}else{ %>
					<img class="me-2" id="profileImage" 
					src="<%=request.getContextPath() %><%=dto.getProfile() %>" width="50" height="50" />
				<%} %>
				<span class="navbar-text me-2">
					<a href="${pageContext.request.contextPath}/users/private/info.jsp">
						<%=id %>
					</a>님 로그인 중
				</span>
				<a class="btn btn-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">
					로그아웃
				</a>
			<%} %>
			</div>
      </div>
   </nav>
