<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//profile (프로필 이미지 경로) 읽어오기
	String profile = request.getParameter("profile");
	//이미지를 바꾸지 않았다면 empty일 때 null 대입해 주기
	if(profile.equals("empty")){
		profile=null;
	}
	//id를 불러와서 dto에 담아 db에 수정 반영하기
	String id=(String)session.getAttribute("id");
	UsersDto dto=new UsersDto();
	dto.setProfile(profile);
	dto.setId(id);
	UsersDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
function swalSuccess(seq){
	Swal.fire({
		title:'수정 성공',
		text: '<%=id %>님, 회원정보가 수정되었습니다.',
		icon: 'success',
		confirmButtonColor: '#198754',
		confirmButtonText: '확인'
	}).then((result) => {
		if (result.value) {
			location.href="<%=request.getContextPath()%>/users/private/info.jsp";
	  }
	})
}
</script>
	<script>
		swalSuccess();
	</script>
</body>
</html>

