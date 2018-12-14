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
	
		int bbsID=1;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}

		post bbs = new post_DAO().getBbs(bbsID);
		post_DAO bbsDAO = new post_DAO();
		int result = bbsDAO.delete(bbsID);
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