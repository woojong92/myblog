<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.member_DAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="member.member" scope="page" />
<jsp:setProperty name="member" property="uid" />
<jsp:setProperty name="member" property="passwd" />
<jsp:setProperty name="member" property="name" />
<jsp:setProperty name="member" property="email" />



<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
		String psw=member.getPasswd();
		
	 	if(!psw.equals(request.getParameter("passwd_check"))){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
	 	}
	

	
	 	else if(member.getUid() == null || member.getPasswd() == null ||
				member.getName() == null || member.getEmail()==null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			member_DAO member_DAO = new member_DAO();
			int result = member_DAO.join(member);
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if( result == 1)
			{
				session.setAttribute("uid", member.getUid()); //현재 세션에 userID 세션을 저장하고 image_main.jsp 호출
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>