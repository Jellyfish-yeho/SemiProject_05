<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	boolean isSuccess=CafeDao.getInstance().addLikeCount(num);

%>
{"isSuccess":<%=isSuccess %>}