<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="free_board.free_board_DAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="free_board.free_board" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="bbs" property="bbsFileName" />


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
		
		free_board_DAO free_board_DAO = new free_board_DAO();
		
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
			int result;
			
			if(bbs.getBbsFileName()==null){
				result = free_board_DAO.write( UID, bbs.getBbsTitle(), bbs.getBbsContent());
			}else{
				result = free_board_DAO.write( UID, bbs.getBbsTitle(), bbs.getBbsContent(), bbs.getBbsFileName() );
			}

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
				script.println("location.href = 'free_board.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>