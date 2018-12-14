<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="QnA.QnA" %>
<%@ page import="QnA.QnA_DAO" %>
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

		QnA QnA = new QnA_DAO().getBbs(bbsId);
		QnA_DAO free_board_DAO = new QnA_DAO();
		int result = free_board_DAO.delete(bbsId);
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
			script.println("location.href = 'qna.jsp'");
			script.println("</script>");
		}
	
	%>

</body>
</html>