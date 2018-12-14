<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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
	
	<!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
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
    


  <div class="container">

 
      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h3 class="featurette-heading">아일랜드 더블린에 있는 모허절벽 <span class="text-muted"></span></h3>
          <p class="lead">모허 절벽은 아일랜드 클래어 주 버런 남서쪽에 위치한 절벽이다. 대서양에서 우뚝 솟은 절벽의 높이는 해그스 헤드에서 120m, 8km 떨어진 가장 높은 지점인 오브라이언 탑의 정북쪽으로 214m에 달한다. </p>
        </div>
        <div class="col-md-5">
          <img src="img/모허절벽.jpg" alt="모허절벽" width=500 height=500>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h3 class="featurette-heading">이탈리아 피렌체의 두우모성당 <span class="text-muted"></span></h3>
          <p class="lead">피렌체 대성당은 이탈리아의 피렌체에 있는 대성당이다. 정식 명칭은 ‘꽃의 성모 마리아’라는 뜻의 산타 마리아 델 피오레 대성당이다. 필리포 브루넬레스키가 설계한 돔으로 유명하며, 실외는 하얀색으로 윤곽선을 두른 초록색과 분홍색의 대리석 판으로 마감되어 있다</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img src="img/두우모.jpg" alt="두우모성당" width=500 height=500>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">아이슬란드, 요쿨살론<span class="text-muted"></span></h2>
          <p class="lead">요쿨살론은 아이슬란드 자연의 정수가 모여있는 곳 중 하나입니다. 요쿨살론 근처의 검은 해변은 커다란 얼음 덩어리가 다이아몬드처럼 햇살 아래에서 빛나고 있어 다이아몬드 해변이라고 불리기도 합니다. 일 년 내내 수 천명의 사람들이 이 곳에 이끌려 찾아오고 멋진 사진들을 건져갑니다. 그리고 이제는 유명한 영화촬영장소로도 각광받고 있습니다.</p>
        </div>
        <div class="col-md-5">
          <img src="img/빙하.jpg" alt="요쿨살롱" width=500 height=500>
        </div>
      </div>

      <hr class="featurette-divider">
    </div>

      <!-- /END THE FEATURETTES -->

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
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="js/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/js/bug-workaround.js"></script>
  </body>

</html>