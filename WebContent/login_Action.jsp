<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.member_DAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.member" scope="page" />
<jsp:setProperty name="member" property="uid" />
<jsp:setProperty name="member" property="passwd" />

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
	
		if( member.getUid() ==null || member.getPasswd() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	
		String UID=null;
		if(session.getAttribute("uid") !=null)
		{
			UID = (String) session.getAttribute("uid");
		}
		if(UID != null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어 있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		member_DAO member_DAO = new member_DAO();
	
		int result = member_DAO.login(member.getUid(), member.getPasswd());
		
		if( result == 1)
		{
			session.setAttribute("uid", member.getUid()); //현재 세션에 userID에 대한 기록을 남기고 image_main.jsp 호출
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if( result == 0)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		else if( result == -1)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		else if( result == -2)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생하였습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		else if( result == -3)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('삭제된 아이디 입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	%>

</body>
</html>