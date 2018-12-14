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

		member_DAO member_DAO = new member_DAO();
		member list = member_DAO.getInfo(UID);
		
		String psw_check=list.getPasswd();
		
		if(!psw.equals(psw_check)){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
	 	}
			
					
		int result = member_DAO.delete(UID);
		if( result == -1)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('회원 탈퇴에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else 
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href = 'logoutAction.jsp'");
			script.println("</script>");
		}
		
	%>
	


</body>
</html>