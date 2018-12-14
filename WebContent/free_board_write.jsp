<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>

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
		}else if(session.getAttribute("uid") ==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.')");
			script.println("history.back()");
			script.println("</script>");
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

    <!-- Main Content -->
    <!--  class="table  table-striped style="text-align: center; border: 3px solid #dddddd"" -->
	<div class="container">
		
			<form action="free_board_writeAction.jsp" method="post" >
			<div class="col-sm-12 col-md-12 col-lg-12">
				<table class="table  table-striped" style="text-align: center; border: 3px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="550"></td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
						</tr>
						<tr>
							<td>파일업로드</td>
						</tr>
						<tr>
							<td>
								<input type="file" class="btn btn-primary pull-left" name="bbsFileName">		
							</td>
						</tr>
					
					</tbody>
				</table>
			</div>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
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
