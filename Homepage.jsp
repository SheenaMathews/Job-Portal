<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%
    String TaxiId=session.getAttribute("TaxiId").toString();
    String Count="";
    ResultSet rscount=obj.selectData("select count(*) from tbl_booking bk where bk.TaxiId='"+TaxiId+"' and bk.AcceOrRej='NotYet'");
    while(rscount.next())
    {
       Count=rscount.getString("count(*)");
    }
    
    %>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Online Cab.</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />
	
	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<div class="page-inner">
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
                                    <div id="gtco-logo"><a href="Homepage1.jsp">Online Cab <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					
				</div>
			</div>
			
		</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/img_6.jpg)">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					<div class="row row-mt-15em">

						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<span class="intro-text-small">See Our Pricing</span>
							
            <%
    ResultSet r=obj.selectData("select * from tbl_taxiaproval ap where ap.TaxiId='"+TaxiId+"'");
    
        while(r.next())
        {
            if(r.getString("Approval").equals("N"))
            {
                %>
                <label> Your Taxi Needed For Admin Approval, Wait For Admin Approval</label>
                <%
            }
            else
            {
                response.sendRedirect("Homepage1.jsp");
                %>
                <a href="Driving Status.jsp">Status</a>
        <a href="Notification.jsp">Notification <label style="color: red"><%=Count%></label></a>
        <a>Edit My Profile</a>
        <a>Gallery</a>
        <a href="UserFeedBack.jsp">User Feed Back</a>
        <a href="DriverComplaints.jsp">Give Your Complaints</a>
        <table style="width:400px;"> <%
    ResultSet rs1=obj.selectData("select * from tbl_taxiimages reg where reg.TaxiId='"+TaxiId+"'");
    while(rs1.next()) 
    {
        %>
        <tr  >
            <td colspan="2"><img style="width: 100%;height: 400px" src="TaxiImages/<%=rs1.getString("Imagename")%>"></td>
            </tr>
            <%
    }
        %>
        <%
                ResultSet rs=obj.selectData("select * from tbl_taxireg reg where reg.TaxiId='"+TaxiId+"'");
    while(rs.next())
    {
        %>
   
            
            <tr>
                <td>Taxi Name:</td> <td><%=rs.getString("Name")%></td>
            </tr>
            <tr>
                <td>Owner Name:</td> <td><%=rs.getString("OwnerName")%></td>
            </tr>
            <tr>
                <td>Vechicle No :</td> <td><%=rs.getString("VechicleNo")%></td>
            </tr>
            <tr>
                <td>No of Seats :</td> <td><%=rs.getString("NoofSeats")%></td>
            </tr>
            <tr>
                <td>Contact No :</td> <td><%=rs.getString("ContactNo")%></td>
            </tr>
           <%
             }
    %>
        </table> 
      <%      }
        }
    
   %>
        <script>
            function ShowMsg()
            {
                alert("Check The Driving Status Off To Get New call... !");
            }
        </script>	
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	
	

	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

