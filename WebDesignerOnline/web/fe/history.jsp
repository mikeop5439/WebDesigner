<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Story &mdash; Free Website Template, Free HTML5 Template by freehtml5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="freehtml5.co" />

	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
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

	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fe/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fe/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fe/css/bootstrap.css">
	
	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fe/css/style2.css">

	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/fe/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/fe/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
		<div id="fh5co-aside" style="background-image: url(${pageContext.request.contextPath}/fe/images/image_1.jpg)">
			<div class="overlay"></div>
			<nav role="navigation">
				<ul>
					<li><a href="http://localhost:8080/WebDesignerOnline/index.jsp"><i class="icon-home"></i></a></li>
				</ul>
			</nav>
			<div class="featured">
				<span>Welcome！</span>
				<h2>欢迎 ${sessionScope.username}, 这是您的历史制作记录。</h2>
			</div>
		</div>
		<div id="fh5co-main-content">
			<div class="fh5co-post">
				<c:forEach items="${his}" var="his">
					<div class="fh5co-entry padding">
						<a href="${pageContext.request.contextPath}${his.src}"><img src="${pageContext.request.contextPath}/document/resource/prod/images/${his.prod_id}.jpg" style="width: 100px;height: 100px"></a>
						<div>
							<span class="fh5co-post-date">${his.date}</span>
							<h2><a href="${pageContext.request.contextPath}${his.src}">${his.his_name}</a></h2>
							<p>${his.his_desc}</p>
						</div>
					</div>
				</c:forEach>

				<footer>
					
				</footer>
			</div>
		</div>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/fe/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/fe/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/fe/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/fe/js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="${pageContext.request.contextPath}/fe/js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/fe/js/main.js"></script>

	</body>
</html>

