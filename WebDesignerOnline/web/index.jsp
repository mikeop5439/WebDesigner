<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Home</title>
		<link href="${pageContext.request.contextPath}/fe/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="${pageContext.request.contextPath}/fe/js/jquery.min.js"></script>
		 <!-- Custom Theme files -->
		<link href="${pageContext.request.contextPath}/fe/css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
   		  <!---- start-smoth-scrolling---->
		<script type="text/javascript" src="${pageContext.request.contextPath}/fe/js/move-top.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/fe/js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
		 <!---- start-smoth-scrolling---->
		 <meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<script>
            window.onload=function(){
                console.log("!!!!!!!!!!!!!");
                if("<%=session.getAttribute("username")%>"!="null" ){
                    $(".login").css("display","");
                    $(".unlogin").css("display","none");
                    $.ajax({
                        type:"POST",
                        url:"${pageContext.request.contextPath }/recommend/getRecommendByUserId.action?user_id="+"<%=session.getAttribute("user_id")%>",
                        contentType:'application/json;charset=utf-8',
                        success:function(data){
                            $(".owl-wrapper").empty();
                            $.each(data,function(index,content){
                                var div=$("<div></div>").addClass("owl-item");
                                var div1=$("<div></div>").addClass("item");
                                var div2=$("<div></div>").addClass("portfolio-grid");
                                var div3=$("<div></div>").addClass("portfolio-grid-pic");
                                var img=$("<img />").attr("src","${pageContext.request.contextPath}"+content.prod_image_src).css("width","509px").css("height","509px");
                                var a=$("<a></a>").attr("href","${pageContext.request.contextPath}"+content.service_src);
                                var div4=$("<div></div>").addClass("portfolio-grid-caption text-center");
                                var h1=$("<h4></h4>").append(content.prod_name);
                                var h2=$("<h5></h5>").append(content.prod_desc);
                                var span=$("<span></span>")
                                div1.append(div2.append(div3.append(img)).append(a.append(div4.append(h1).append(h2).append(span))));
                                div.append(div1);
                                $(".owl-wrapper").append(div);
                            });
                        }
                    });
                    if("<%=session.getAttribute("userflag")%>"!="0" ){
                        $(".htlogin").css("display","");
                        $(".unhtlogin").css("display","none");
                    }
                }
            }
		</script>
	</head>
	<body>
		<!-- container -->
			<!-- header -->
			<div id="totop" class="header">
				<video autoplay muted volume="0" poster="http://ccdn.goodq.top/caches/2d2bd038d43e773a454cbb4ae76768fb/aHR0cDovL3d3dy5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTYvMDMvZGQ4ZmRhYzcyOTA0ZTBlZmJjYzRlNzM4ZmJiYTMyOWEuanBn.jpg" loop style="width: 100%; height: 100%;object-fit:cover;object-position:center center" class="section-background-video">
					<source type="video/webm" src="http://ccdn.goodq.top/caches/2d2bd038d43e773a454cbb4ae76768fb/aHR0cDovL3d3dy5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTYvMDMvMTIzNC53ZWJt.webm">
					<source type="video/mp4" src="http://ccdn.goodq.top/caches/2d2bd038d43e773a454cbb4ae76768fb/aHR0cDovL3d3dy5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTYvMDMvYXBwbGVfc2luZ19jaGlsZC5tcDQ_p_p100_p_3D.mp4">
				</video>
				<div class="container">
				<!-- menu -->
				<div class="menu">
					<span class="menu-icon"> </span>
					<ul>
						<li><a href="#services" class="scroll">首页</a></li>
						<li class="login" style="display: none"><a href="fe/gallery.jsp" >模板</a></li>
						<li><a href="#projects" class="scroll">关于</a></li>
						<li class="unhtlogin"><a href="#contact" class="scroll">联系我们</a></li>
						<li class="unlogin"><a href="fe/login.jsp" >登录</a></li>
						<li class="htlogin" style="display: none"><a href="ht/index.jsp" >系统管理平台</a></li>
						<li class="login" style="display: none"><a href="${pageContext.request.contextPath }/users/quitUser.action" >退出登录</a></li>
						<div class="clearfix"> </div>
					</ul>
				</div>
				<!-- /menu -->
				<!-- script-for-menu -->
				<script>
					$(document).ready(function(){
						$(".menu ul").hide();
						$("span.menu-icon").click(function(){
							$(".menu ul").slideToggle(500);
						});
						
					});
				</script>
				<!-- /script-for-menu -->
				<!-- header-info -->
				<div class="header-info text-center">
					<h2>做一个属于自己的网站   让世界更好的了解您</h2>
					<span> </span>
					<h1>米拉 引领在线制作网页潮流</h1>
					<a href="#intro"  class="scroll"><label class="downarrow"> </label></a>
				</div>
				<!-- /header-info -->
			</div>
			<!-- /header -->
			</div>
			<!-- intro -->
			<div id="intro" class="intro text-center">
				<div class="container">
					<!-- head-section -->
					<div class="head-section text-center">
						<h2>Meet us</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
					<a href="#services"  class="scroll"><label class="downarrow1"> </label></a>
				</div>
			</div>
			<!-- intro -->
			<!-- video -->
			<!---- video ---->
				<!---pop-up-box---->
					<script type="text/javascript" src="${pageContext.request.contextPath}/fe/js/modernizr.custom.min.js"></script>
					<link href="${pageContext.request.contextPath}/fe/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="${pageContext.request.contextPath}/fe/js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!---//pop-up-box---->
				<div id="small-dialog" class="mfp-hide">
					<iframe > </iframe>
				</div>
				 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
				</script>								  
				</div>
			<!----//fea-video---->
			<div id="price" class="video">
				<a class="play popup-with-zoom-anim" href="#small-dialog"><span> </span></a>
			</div>
			<!-- video -->
			<!-- services -->
			<div id="services" class="services text-center">
				<div class="container">
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>Service</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
				<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
				<!-- service-grids -->
				<div class="service-grids">
					<div class="col-md-4 service-grid text-center">
						<span class="s-icon"> </span>
						<h4>BRANDING</h4>
						<p>Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.</p>
					</div>
					<div class="col-md-4 service-grid text-center">
						<span class="s-icon1"> </span>
						<h4>WEB DEVELOPMENT</h4>
						<p>Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.</p>
					</div>
					<div class="col-md-4 service-grid text-center">
						<span class="s-icon2"> </span>
						<h4>APP DESIGN</h4>
						<p>Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<!-- service-grids -->
				<a href="#projects" class="scroll"><label class="downarrow1"> </label></a>
				</div>
			</div>
			<!-- services -->
			<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
			<!-- shope -->
			<div class="shope text-center">
				<div class="container">
					<a href="#">Check our shope</a>
				</div>
			</div>
			<!-- /shope -->
			<!-- portfolio -->
			<div id="projects" class="portfolio text-center">
				<div class="container">
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>Our latest projects</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
				</div>
				<!-- portfolio-grids -->
				<div class="portfolio-grids text-left">
					 <!-- requried-jsfiles-for owl -->

							 <!-- //requried-jsfiles-for owl -->
							 <!-- start content_slider -->
						       <div id="owl-demo" class="owl-carousel text-center">
									   <div class="item">
										   <div class="portfolio-grid">
											   <div class="portfolio-grid-pic">
												   <img src="/WebDesignerOnline\document\resource\classfiy\images\0.jpg" style="width: 509px; height: 509px;">
											   </div>
											   <a href="/WebDesignerOnlinenull">
												   <div class="portfolio-grid-caption text-center">
													   <h4>test</h4>
													   <h5>test</h5>
													   <span></span>
												   </div>
											   </a>
										   </div>
									   </div>
									   <div class="item"><div class="portfolio-grid"><div class="portfolio-grid-pic"><img src="/WebDesignerOnline\document\resource\prod\images\10.jpg" style="width: 509px; height: 509px;"></div><a href="/WebDesignerOnline\document\resource\prod\src\10\"><div class="portfolio-grid-caption text-center"><h4>宠物</h4><h5>宠物销售页面</h5><span></span></div></a></div></div>
									   <div class="item">
										   <div class="portfolio-grid">
											   <div class="portfolio-grid-pic">
												   <img src="fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="fe/modal.jsp">
												   <div class="portfolio-grid-caption text-center">
													   <h4>Branding</h4>
													   <h5>Metalbrand</h5>
													   <span> </span>
												   </div>
											   </a>
										   </div>
									   </div>

									   <div class="item">
										   <div class="portfolio-grid">
											   <div class="portfolio-grid-pic">
												   <img src="fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="fe/modal.jsp">
												   <div class="portfolio-grid-caption text-center">
													   <h4>Branding</h4>
													   <h5>Metalbrand</h5>
													   <span> </span>
												   </div></a>
										   </div>
									   </div>
									   <div class="item">
										   <div class="portfolio-grid">
											   <div class="portfolio-grid-pic">
												   <img src="fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="fe/modal.jsp">
												   <div class="portfolio-grid-caption text-center">
													   <h4>Branding</h4>
													   <h5>Metalbrand</h5>
													   <span> </span>
												   </div></a>
										   </div>
									   </div>
									   <div class="item">
										   <div class="portfolio-grid">
											   <div class="portfolio-grid-pic">
												   <img src="fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="fe/modal.jsp">
												   <div class="portfolio-grid-caption text-center">
													   <h4>Branding</h4>
													   <h5>Metalbrand</h5>
													   <span> </span>
												   </div></a>
										   </div>
									   </div>
									   <div class="item">
										   <div class="portfolio-grid">
											   <div class="portfolio-grid-pic">
												   <img src="fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="fe/modal.jsp">
												   <div class="portfolio-grid-caption text-center">
													   <h4>Branding</h4>
													   <h5>Metalbrand</h5>
													   <span> </span>
												   </div></a>
										   </div>
									   </div>
					            </div>
				</div>
				<link href="fe/css/owl.carousel.css" rel="stylesheet">
				<script src="fe/js/owl.carousel.js"></script>
				<script>
                    $(document).ready(function() {
                        $("#owl-demo").owlCarousel({
                            items : 5,
                            lazyLoad : false,
                            autoPlay : true,
                            navigation : false,
                            navigationText :  false,
                            pagination : false,
                        });
                    });
				</script>
				<!-- portfolio-grids -->
				<a class="more" href="#">more on behance</a><br />
				<a href="#about" class="scroll"><label class="downarrow1"> </label></a>
			</div>
			<!-- portfolio -->
			<!-- clients -->
			<div class="clients">
				<div class="container">
					<!-- head-section -->
						<div class="head-section text-center">
							<h2>Our partners</h2>
							<span> </span>
						</div>
					<!-- /head-section -->
					<!-- client-list -->
					<div class="client-list text-center">
						<ul>
							<li><a href="#"><img src="${pageContext.request.contextPath}/fe/images/c-logo.png" title="adidas" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/fe/images/c-logo1.png" title="google" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/fe/images/c-logo2.png" title="samsung" /></a></li>
							<li><a href="#"><img src="${pageContext.request.contextPath}/fe/images/c-logo3.png" title="microsoft" /></a></li>
						</ul>
					</div>
					<!-- /client-list -->
				</div>
			</div>
			<!-- clients -->
			<!-- about-us -->
			<div id="about" class="about-us text-center">
				<div class="container">
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>About us</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
					<!-- about-grids -->
					<div class="about-grids">
						<div class="col-md-3 about-grid text-center">
							<div class="about-grid-info">
								<img src="fe/images/about-pic1.png" title="name" />
								<h4>Mike</h4>
								<span>CEO / Founder</span>
								<label> </label>
							</div>
							<div class="about-grid-caption">
								<h5>WE ARE HIRING!</h5>
								<span> </span>
							</div>
						</div>
						<div class="col-md-3 about-grid text-center">
							<div class="about-grid-info">
								<img src="fe/images/about-pic2.png" title="name" />
								<h4>Taylor</h4>
								<span>Graphic Designer</span>
								<label> </label>
							</div>
							<div class="about-grid-caption">
								<h5>WE ARE HIRING!</h5>
								<span> </span>
							</div>
						</div>
						<div class="col-md-3 about-grid text-center">
							<div class="about-grid-info">
								<img src="fe/images/about-pic3.png" title="name" />
								<h4>James</h4>
								<span>Copywriter</span>
								<label> </label>
							</div>
							<div class="about-grid-caption">
								<h5>WE ARE HIRING!</h5>
								<span> </span>
							</div>
						</div>
						<div class="col-md-3 about-grid text-center">
							<div class="about-grid-info">
								<img src="fe/images/about-pic1.png" title="name" />
								<h4>Mike</h4>
								<span>CEO / Founder</span>
								<label> </label>
							</div>
							<div class="about-grid-caption">
								<h5>WE ARE HIRING!</h5>
								<span> </span>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<!-- about-grids -->
					<a href="#contact" class="scroll"><label class="downarrow1"> </label></a>
				</div>
				
			</div>
			<!-- about-us -->
			<!-- latest-twittes -->
			<div class="latest-twittes">
				<div class="container">
					<!-- head-section -->
					<div class="head-section text-center">
						<h2>Latest tweets</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<!-- twittes -->
					<div class="twittes">
						 <script>
							    $(document).ready(function() {
							      $("#owl-demo1").owlCarousel({
							        items : 1,
							        lazyLoad : false,
							        autoPlay : true,
							        navigation : false,
							        navigationText :  false,
							        pagination : true,
							      });
							    });
							    </script>
							 <!-- //requried-jsfiles-for owl -->
							 <!-- start content_slider -->
						       <div id="owl-demo1" class="owl-carousel owl-carousel1 text-center">
					                <div class="item">
					                	<div class="twitt text-center">
											<p>Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.</p>
											<a href="#">Craig</a>
										</div>
					                </div>
					                 <div class="item">
					                	<div class="twitt text-center">
											<p>Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.</p>
											<a href="#">Craig</a>
										</div>
					                </div>
					                 <div class="item">
					                	<div class="twitt text-center">
											<p>Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.</p>
											<a href="#">Craig</a>
										</div>
					                </div>
					            </div>
					</div>
					<!-- twittes -->
				</div>
			</div>
			<!-- latest-twittes -->
			<!-- contact -->
			<div id="contact" class="contact">
				<div class="container">
					<!-- head-section -->
					<div class="head-section text-center">
						<h2>Contact us</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<!-- contact-grids -->
					<div class="contact-grids">
						<div class="col-md-4 contact-left">
							<h4>Address</h4>
							<ul class="address">
								<li>908 New Hampshire Ave NW </li>
								<li>Washington, DC 20037 </li>
								<li>(202) 463-5141 </li>
								<li>Doris Cannon</li>
							</ul>
							<ul class="social-icons">
								<li><a href="#"><span class="facebook"> </span></a></li>
								<li><a href="#"><span class="twitter"> </span></a></li>
								<li><a href="#"><span class="vimeo"> </span></a></li>
								<li><a href="#"><span class="behance"> </span></a></li>
							</ul>
						</div>
						<div class="col-md-8 contact-right">
							<form>
								<div class="text-boxs">
									<div class="text-box">
										<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
									</div>
									<div class="text-box">
										<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
									</div>
									<div class="text-box">
										<input type="text" value="Telephone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Telephone';}">
									</div>
									<div class="text-box">
										<input type="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">
									</div>
								</div>
								<div class="subject-box">
									<textarea>Message</textarea>
								</div>
								<input type="submit" value="Send" />
							</form>
						</div>
						<div class="clearfix"> </div>
					</div>
					<!-- contact-grids -->
				</div>
			</div>
			<!-- contact -->
			<!-- footer -->
			<div class="footer">
				<div class="container"> 
					<div class="footer-left">
						<p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
					</div>
					<div class="footer-right">
						<p><a href="#totop" class="scroll">Back to top<span> </span></a></p>
						<script type="text/javascript">
									$(document).ready(function() {
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
									<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
					</div>
				</div>
			</div>
			<!-- footer -->
		<!-- /container -->
	</body>
</html>

