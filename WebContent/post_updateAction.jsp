<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="post.post" %>
<%@ page import="post.post_DAO" %>
<%@ page import="java.io.PrintWriter" %>


<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
	
		int bbsId=0;
		if(request.getParameter("bbsId") != null)
		{
			bbsId = Integer.parseInt(request.getParameter("bbsId"));
		}

		post post = new post_DAO().getBbs(bbsId);
		post_DAO post_DAO = new post_DAO();
		int result = post_DAO.update(bbsId, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
		if( result == -1)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else 
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href = 'post.jsp'");
			script.println("</script>");
		}
	
	%>

</body>
</html>