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

		int pageNumber=1;
		if(request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
  	
		String UID="null";
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
				if( UID.equals("null")) {
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
              <h1>POST</h1>
              <span class="subheading">This is what I do.</span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이미지</th>
					<th>작성일</th>
				</tr>	
			</thead>	
			<tbody>
				<%
					post_DAO post_DAO = new post_DAO();
					ArrayList<post> list = post_DAO.getList(pageNumber);
					for(int i=0; i< list.size(); i++){
				%>
				<tr>
					<td><%= list.get(i).getBbsID() %></td>
					<td><a href="post_view.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <%= list.get(i).getBbsTitle().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %> </a></td>
					<td><a href="post_view.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <img src="post_read.jsp?bbsID=<%=list.get(i).getBbsID()%>" width="200" onerror="this.src='no_img.jpg'" > </a></td>
					<td><%= list.get(i).getBbsDate() %></td>
				</tr>
				<%
					}
				%>
			</tbody>		
		</table>
		<%
			if(pageNumber != 1) {
		%>
			<a href="post.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arraw-left">이전</a>
		<%
			} 
			if(post_DAO.nextPage(pageNumber+1)) {
		%>
			<a href="post.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arraw-right">다음</a>
		<%
			}
		%>

		<%
			if(UID.equals("Admin")){
		%>
			<a href="post_write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		<%
			}
		%>	
			
			
		
	</div>

    

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