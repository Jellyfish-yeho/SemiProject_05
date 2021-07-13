<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //자세히 보여줄 겔러리 item 번호를 읽어온다.
   int num=Integer.parseInt(request.getParameter("num"));
   //번호를 이용해서 겔러리 item 정보를 얻어온다.
   GalleryDto dto=GalleryDao.getInstance().getData(num);
   
   //로그인된 아이디 (로그인을 하지 않았으면 null 이다)
   String id=(String)session.getAttribute("id");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/shuttlecock_main.png" type="image/x-icon" />
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.card{
		width:80%;
	}
   .img-wrapper img{
   		width: 90%;
   		height: 90%;
   		object-fit: contain;
   }
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
   <jsp:param value="gallery" name="thisPage"/>
</jsp:include>
<div class="container">
	<div class="d-flex justify-content-center align-items-center flex-column my-4">
	   <div class="card text-center mb-3">
		   <div class="img-wrapper d-flex justify-content-center align-items-center">
		      <img class="card-img-top" src="${pageContext.request.contextPath }<%=dto.getImagePath()%>"
		      onerror="this.src='${pageContext.request.contextPath}/images/frown-face.png'"/>	      
		    </div>
			<div class="card-body">
				<p class="card-text fs-3 fw-bold"><%=dto.getTitle() %></p>
				<p class="card-text"><%=dto.getContent() %></p>
				<div class="my-2 align-items-center">
					<span>
						by
				        <% UsersDto dto1=UsersDao.getInstance().getData(dto.getWriter());
				        if(dto1.getProfile()!=null){
			            %>
			            <img width="16" height="16" src="<%=request.getContextPath()%><%=dto1.getProfile()%>"/>
			            <%}else{%>
			            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="listProfile bi bi-person-circle" viewBox="0 0 16 16">
							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
			            <%} %>
					</span>
					<span class="card-text"><strong><%=dto.getWriter() %></strong></span>
				</div>
		         <p><small class="text-muted" style="font-size:0.875rem;"><%=dto.getRegdate() %></small></p>
			</div>
		</div>
	</div>
	<nav>	   
		<ul class="d-flex flex-row ps-0 justify-content-end" style="list-style:none;">	
			<%if(dto.getWriter().equals(id)){ %>
			<li>
				<a class="link-dark text-decoration-none mx-1" href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
			</li>
			<li>
				<a class="link-dark text-decoration-none mx-1" href="private/delete.jsp?num=<%=dto.getNum()%>">삭제</a>
			</li>
			<%} %>  
		</ul>
	
		<ul class="mb-5 d-flex flex-row ps-0 justify-content-center" style="list-style:none;">
		   <%if(dto.getPrevNum()!=0){ %>
			<li>
				<a class="link-success text-decoration-none" href="detail.jsp?num=<%=dto.getPrevNum() %>">
				&lt이전글
				</a>
			</li>  
		   <%} %>
		   	<li class="mx-3">
				<a class="fw-bold link-success text-decoration-none" href="list.jsp">목록보기</a>
			</li>
		   <%if(dto.getNextNum()!=0){ %>
			<li>			   
				<a class="link-success text-decoration-none" href="detail.jsp?num=<%=dto.getNextNum() %>">
				다음글&gt	     	
		      </a>
			</li>	   
		   <%} %>  	    
		</ul>
	   </nav>      
</div>
</body>
</html>

