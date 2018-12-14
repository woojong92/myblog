<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="free_board.free_board" %>
<%@ page import="free_board.free_board_DAO" %>
<% response.setContentType("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>
<body>
	<%
		int bbsID=1;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		free_board bbs = new free_board_DAO().getBbs(bbsID);
		String fileName = bbs.getBbsFileName();
		response.setContentType("application/x-msdownload");
		
		out.clear();//jsp에서 쓰고있는 내장객체를 outputstream을 쓰기위해 해줘야함
		
		String userAgent = request.getHeader("User-Agent");
		if (userAgent.indexOf("MSIE 5.5") > -1) { // MS IE 5.5 이하
			response.setHeader("Content-Disposition", "filename=" + fileName + ";");
		} 
		else {
			response.setHeader("Content-Disposition", "attachment; filename="+ java.net.URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "\\ ") + ";");
		}

		
	    //response.setHeader("Content-Disposition", "attachment;filename="+ bbs.getImageFileName() + ";"); 
		BufferedOutputStream outs = null;
		outs = new BufferedOutputStream(response.getOutputStream());
						
		
		InputStream is = bbs.getBbsFileData();
		
		int length = 0;
		int bufferSize = 1024;
		byte[] buffer = new byte[bufferSize];
		while((length=is.read(buffer))!=-1){
			outs.write(buffer, 0, length);
		}
		is.close();
		outs.close();

	%>
	
</body>
</html>
