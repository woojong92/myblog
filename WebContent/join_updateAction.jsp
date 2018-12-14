<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.member" %>   
<%@ page import="member.member_DAO" %>
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
		String psw=request.getParameter("passwd");
			
	
		String	UID=null;
		if(session.getAttribute("uid") !=null)
		{
			UID = (String) session.getAttribute("uid");
		}

	
		if(request.getParameter("passwd") == null || request.getParameter("passwd_check")==null 
				|| request.getParameter("name") == null || request.getParameter("email")==null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			if(!psw.equals(request.getParameter("passwd_check"))){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
		 	}
			
			
			member_DAO member_DAO = new member_DAO();
			int result = member_DAO.update(UID, request.getParameter("passwd"), request.getParameter("name"),request.getParameter("email"));
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('수정에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else 
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("location.href = 'my_page.jsp'");
				script.println("</script>");
			}
		}
	%>
	


</body>
</html>