<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Resi Bootstrap Template</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/responsive-slider.css" rel="stylesheet">
  <link rel="stylesheet" href="css/animate.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link href="css/style.css" rel="stylesheet">
  <!-- =======================================================
    Theme Name: Resi
    Theme URL: https://bootstrapmade.com/resi-free-bootstrap-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>
<style>
    li{
        font-size: 12px;
    }
    </style>
<body>
  <header>
    <div class="container">
      <div class="row">
        <nav class="navbar navbar-default" role="navigation">
          <div class="container-fluid">
            <div class="navbar-header">
              <div class="navbar-brand">
                <a href="index.html"><h1>Freelancer</h1></a>
              </div>
            </div>
            <div class="menu">
              <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active"><a href="home.jsp">Home</a></li>
                <li role="presentation" ><a href="MyProfile.jsp">MyProfile</a></li>
                
                 <li role="presentation"><a href="Devchangepwd.jsp">ChangePassword</a></li>
                 
                  
                  <li role="presentation"><a href="ProjectList.jsp">Project Lists</a></li>
                  <li role="presentation"><a href="AcceptedProjects.jsp">Accepted Project Lists</a></li>
                  
                  <li role="presentation"><a href="../Guest/index.html">Logout</a></li>
                  
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </header>

    <div class="slider" style="margin-top: 100px">
    <div id="about-slider">
      <div id="carousel-slider" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators visible-xs">
          <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-slider" data-slide-to="1"></li>
          <li data-target="#carousel-slider" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner">
          <div class="item active">
            <img src="img/slide1.jpg" class="img-responsive" alt="">
            <div class="carousel-caption">
              <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.3s">
                <h2><span>Clean & Modern Design Template</span></h2>
              </div>
              <div class="col-md-10 col-md-offset-1">
                <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.6s">
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing</p>
                </div>
              </div>
              <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.9s">
               
              </div>
            </div>
          </div>

          <div class="item">
            <img src="img/slide2.jpg" class="img-responsive" alt="">
            <div class="carousel-caption">
              <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="1.0s">
                <h2>Fully Responsive</h2>
              </div>
              <div class="col-md-10 col-md-offset-1">
                <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.6s">
                  <p>Lorem ipsum dolor sit amet consectetur adipisicing</p>
                </div>
              </div>
              <div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="1.6s">
                <form class="form-inline">
                 
                </form>
              </div>
            </div>
          </div>
        </div>

        <a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
					<i class="fa fa-angle-left"></i>
				</a>

        <a class=" right carousel-control hidden-xs" href="#carousel-slider" data-slide="next">
					<i class="fa fa-angle-right"></i>
				</a>
      </div>
      <!--/#carousel-slider-->
    </div>
    <!--/#about-slider-->
  </div>
  <!--/#slider-->
  
  
  
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery-2.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
  <script src="js/responsive-slider.js"></script>
  <script src="js/wow.min.js"></script>
  <script>
    wow = new WOW({}).init();
  </script>
