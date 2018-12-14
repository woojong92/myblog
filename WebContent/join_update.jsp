<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="member.member" %>
<%@ page import="member.member_DAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Blog</title>

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
            <!-- 
            <li class="nav-item">
              <a class="nav-link" href="about.jsp">About</a>
            </li>            
             -->
            <li class="nav-item">
              <a class="nav-link" href="post.jsp">Post</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="free_board.jsp">Free_Board</a>
            </li>  
            <li class="nav-item">
              <a class="nav-link" href="qna.jsp">Q&A</a>
            </li>           
 
            <!-- 
            <li class="nav-item">
              <a class="nav-link" href="contact.html">Contact</a>
            </li>            
             -->

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
    <header class="masthead" style="background-image: url('img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Ujong's</h1>
              <span class="subheading">A Blog Theme by Start Bootstrap</span>
            </div>
          </div>
        </div>
      </div>
    </header>

 	<%
	
		member_DAO member_DAO = new member_DAO();	
	%>
	  
   <!-- Main Content -->
	<div class="container">
		<h3 align="center"> 회원정보 수정 </h3>
		<form method="post" action="join_updateAction.jsp">
		<table class="table table-hover">
			<tbody>
				<%
						member list = member_DAO.getInfo(UID);
				%>
				<tr>
					<td> 아이디 </td>
					<td><%= list.getUid() %></td>
				</tr>
				<tr>
					<td> 비밀번호 </td>
					<td><input type="password" class="form-control" value=<%= list.getPasswd() %>  name="passwd" maxlength="50"></td>
				</tr>
				<tr>
					<td> 비밀번호 확인 </td>
					<td><input type="password" class="form-control"  name="passwd_check" maxlength="50"></td>
				</tr>
				<tr>
					<td> 이름 </td>
					<td><input type="text" class="form-control" value=<%= list.getName().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %> name="name" maxlength="50"></td>
				</tr>
				<tr>
					<td> 이메일 </td>
					<td><input type="text" class="form-control" value=<%= list.getEmail().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %> name="email" maxlength="50"></td>
				</tr>

				<tr>
                    <td colspan="3">
                        <input type="submit" class="btn btn-primary" value="수정">
                        <a href="my_page.jsp" class="btn btn-primary">뒤로</a>
                        <a href="join_delete.jsp" class="btn btn-primary">회원탈퇴</a>
                    </td>
 				</tr>
				
			</tbody>		
		</table>
		
		
	</form>
 

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