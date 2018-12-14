<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.post" %>
<%@ page import="post.post_DAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Clean Blog - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="css/clean-blog.min.css" rel="stylesheet">

  </head>

  <body>
  
  	<%

  	
		String UID=null;
		if(session.getAttribute("uid") !=null)
		{
			UID = (String) session.getAttribute("uid");
			session.setAttribute("uid", UID);
		}
	%>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="main.jsp">MY BLOG</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="main.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="post.jsp">Post</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="free_board.jsp">Free_Board</a>
            </li>  
            <li class="nav-item">
              <a class="nav-link" href="qna.jsp">Q&A</a>
            </li>           
 
		    <%
				if( UID == null) {
			%>
		
			<li class="nav-item">
              	<a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="join.jsp">Sign Up</a>
            </li>
			<%
				}else {
			%>   
			<li class="nav-item">
              <a class="nav-link" href="my_page.jsp">My_Page</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logoutAction.jsp">Logout</a>
            </li>
 			<%
				}
			%>         
          </ul>          
        </div>
      </div>
    </nav>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('img/about-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="page-heading">
              <h1>About Me</h1>
              <span class="subheading">This is what I do.</span>
            </div>
          </div>
        </div>
      </div>
    </header>

	<%
		int bbsID=1;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		post_DAO post = new post_DAO();	
	%>


    <!-- Main Content -->
	<div class="container">
		<h3 align="center"> 게시글 보기 </h3>
		<form method="post" action="post_updateAction.jsp?bbsId=<%=bbsID%>">
		<table class="table table-hover">
			<tbody>
				<%
				
					post list = post.getBbs(bbsID);
				%>
				<tr>
					<td> 글번호 </td>
					<td><%= list.getBbsID() %></td>
				</tr>
				<tr>
					<td> 글제목 </td>
					<td><input type="text" class="form-control" value=<%= list.getBbsTitle().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %> name="bbsTitle" maxlength="50"></td>
				</tr>
				<tr>
					<td> 글내용 </td>
					<td><textarea type="text" class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%= list.getBbsContent()%></textarea></td>
				</tr>

				<tr>
					<td> 첨부파일 </td>
					<td> <%= list.getBbsFileName() %> </a></td>
				</tr>
				<tr>
					<td> 유효성 확인 </td>
					<td><%= list.getBbsAvailable() %></td>
				</tr>
				<tr>
                    <td colspan="3">
                        <input type="submit" class="btn btn-primary" value="저장">
                        <a href="post.jsp" class="btn btn-primary">목록</a>
                        <a onClick="return confirm('정말로 삭제하겠습니까?')" href="post_deleteAction.jsp?bbsId=<%=list.getBbsID() %>" class="btn btn-primary">삭제</a>
                    </td>
 				</tr>
				
			</tbody>		
		</table>
		
		
	</form>
	<!-- 
	<a href="free_board.jsp" class="btn btn-primary">목록</a>
	<a href="free_board_updateAction.jsp?bbsID=<%=list.getBbsID() %>" class="btn btn-primary">수정</a>
	<a onClick="return confirm('정말로 삭제하겠습니까?')" href="free_board_deleteAction.jsp?bbsId=<%=list.getBbsID() %>" class="btn btn-primary">삭제</a>
	-->
	</div>
 	<hr>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <ul class="list-inline text-center">
              <li class="list-inline-item">
                <a href="https://twitter.com/woojong92">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="https://www.facebook.com/woojong92">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="https://github.com/woojong92">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
            </ul>
            <p class="copyright text-muted">Copyright &copy; Your Website 2018</p>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/clean-blog.min.js"></script>

  </body>

</html>
