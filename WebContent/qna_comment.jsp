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
	
		int bbsID=0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}

		QnA QnA = new QnA_DAO().getBbs(bbsID);
		QnA_DAO QnA_DAO = new QnA_DAO();
		int result = QnA_DAO.comment(bbsID, request.getParameter("comment"));
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
