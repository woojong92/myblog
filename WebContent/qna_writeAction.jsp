<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="QnA.QnA_DAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="QnA.QnA" scope="page" />
<jsp:setProperty name="bbs" property="bbsUserID"/>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload to Database Demo</title>
</head>
<body>
	<%
	
		String UID=null;
		
		if(session.getAttribute("uid") !=null)
		{
			UID = (String) session.getAttribute("uid");
			
		}
		
		System.out.println(UID);
		
		QnA_DAO QnA_DAO = new QnA_DAO();
		
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			int result = QnA_DAO.write( UID, bbs.getBbsTitle(), bbs.getBbsContent());
			
			
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패하였습니다.')");
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
		}
	%>
</body>
</html>