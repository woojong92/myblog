<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="free_board.free_board" %>
<%@ page import="free_board.free_board_DAO" %>
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

		free_board free_board = new free_board_DAO().getBbs(bbsId);
		free_board_DAO free_board_DAO = new free_board_DAO();
		int result = free_board_DAO.update(bbsId, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
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
			script.println("location.href = 'free_board.jsp'");
			script.println("</script>");
		}
	
	%>

</body>
</html>