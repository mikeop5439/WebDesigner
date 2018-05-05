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
		<link href="  ${pageContext.request.contextPath}/fe/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="  ${pageContext.request.contextPath}/fe/js/jquery.min.js"></script>
		 <!-- Custom Theme files -->
		<link href="  ${pageContext.request.contextPath}/fe/css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
   		  <!---- start-smoth-scrolling---->
		<script type="text/javascript" src="  ${pageContext.request.contextPath}/fe/js/move-top.js"></script>
		<script type="text/javascript" src="  ${pageContext.request.contextPath}/fe/js/easing.js"></script>
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
    <meta charset="utf-8">
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
						<li class="login" style="display: none"><a href=" ${pageContext.request.contextPath}/fe/gallery.jsp" >模板</a></li>
						<li><a href="#projects" class="scroll">关于</a></li>
						<li class="unhtlogin"><a href="#contact" class="scroll">联系我们</a></li>
						<li class="unlogin"><a href="   ${pageContext.request.contextPath}/fe/login.jsp" >登录</a></li>
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
						<h2>基于bootstrap模板，快速搭建一个响应式网站</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<p>我们的网站，将传统的编码工作转化为直观的拖拽操作和文字录入。在这里，您仅需花上10分钟便可以完成一个H5响应式网站，您会发现完全不需要编写一行代码，这就是我们网站的神奇之处。</p>
					
				</div>
			</div>
			<!-- intro -->
			<!-- video -->
			<!---- video ---->
				<!---pop-up-box---->
					<script type="text/javascript" src=" ${pageContext.request.contextPath}/fe/js/modernizr.custom.min.js"></script>
					<link href="  ${pageContext.request.contextPath}/fe/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="  ${pageContext.request.contextPath}/fe/js/jquery.magnific-popup.js" type="text/javascript"></script>
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
						<h2>更快，更简单</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
				<p>让您事半功N倍的建站工具
一次编辑，在所有设备下使用</p>
				
			
				</div>
			</div>
			<!-- services -->
			<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
			
			
			<!-- clients -->
			<div class="clients">
				<div class="container">
					<!-- head-section -->
						<div class="head-section text-center">
							<h2>真正的响应式自助建站，自适应所有设备</h2>
							
						</div>
					<!-- /head-section -->
					<!-- service-grids -->
				<div class="service-grids">
					<div class="col-md-4 service-grid text-center">
						<span class="s-icon"> </span>
						<h4>平板</h4>
						
					</div>
					<div class="col-md-4 service-grid text-center">
						<span class="s-icon1"> </span>
						<h4>电脑</h4>
					
					</div>
					<div class="col-md-4 service-grid text-center">
						<span class="s-icon2"> </span>
						<h4>手机</h4>
					
					</div>
					<div class="clearfix"> </div>
				</div>
				<!-- service-grids -->
				</div>
			</div>
			<!-- clients -->
			<div id="projects" class="portfolio text-center">
				<div class="container">
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>免费海量模板随您挑选</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<p>您可以从众多出色的H5模板中挑选出您最喜欢的</p>
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
												   <img src="${pageContext.request.contextPath}/fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href=" ${pageContext.request.contextPath}/fe/modal.jsp">
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
												   <img src=" ${pageContext.request.contextPath}/fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="   ${pageContext.request.contextPath}/fe/modal.jsp">
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
												   <img src="  ${pageContext.request.contextPath}/fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="  ${pageContext.request.contextPath}/fe/modal.jsp">
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
												   <img src="   ${pageContext.request.contextPath}/fe/images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="  ${pageContext.request.contextPath}/fe/ modal.jsp">
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
												   <img src="   images/port-pic1.jpg" title="name" />
											   </div>
											   <a href="   modal.jsp">
												   <div class="portfolio-grid-caption text-center">
													   <h4>Branding</h4>
													   <h5>Metalbrand</h5>
													   <span> </span>
												   </div></a>
										   </div>
									   </div>
					            </div>
				</div>
				<link href="   ${pageContext.request.contextPath}/fe/css/owl.carousel.css" rel="stylesheet">
				<script src="   ${pageContext.request.contextPath}/fe/js/owl.carousel.js"></script>
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
				
			</div>
			<!-- about-us -->
			<div id="about" class="about-us text-center">
				<div class="container">
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>我们拥有强大的团队</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>
					<!-- about-grids -->
					<div class="about-grids">
						<div class="col-md-3 about-grid text-center">
							<div class="about-grid-info">
								<img src="${pageContext.request.contextPath}/fe/images/about-pic1.png" title="name" />
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
								<img src="${pageContext.request.contextPath}/fe/images/about-pic2.png" title="name" />
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
								<img src="${pageContext.request.contextPath}/fe/images/about-pic3.png" title="name" />
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
								<img src="${pageContext.request.contextPath}/fe/images/about-pic1.png" title="name" />
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
		
			<!-- contact -->
			<div id="contact" class="contact">
				<div class="container">
					<!-- head-section -->
					<div class="head-section text-center">
						<h2>联系我们</h2>
						<span> </span>
					</div>
					<!-- /head-section -->
					<!-- contact-grids -->
					<div class="contact-grids">
						<div class="col-md-4 contact-left">
							<h4>地址</h4>
							<ul class="address">
								<li>贵州大学北校区</li>
								<li>189840001236</li>
								<li>(202) 463-5141 </li>
								<li>黑马大楼</li>
							</ul>
							<ul class="social-icons">
								<li><a href="#"><span class="facebook"> </span></a></li>
								<li><a href="#"><span class="twitter"> </span></a></li>
								
							</ul>
						</div>
						<div class="col-md-8 contact-right">
							<form>
								<div class="text-boxs">
									<div class="text-box">
										<input type="text" value="名字" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
									</div>
									<div class="text-box">
										<input type="text" value="邮箱" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
									</div>
									<div class="text-box">
										<input type="text" value="联系电话" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Telephone';}">
									</div>
									<div class="text-box">
										<input type="text" value="地址" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">
									</div>
								</div>
								<div class="subject-box">
									<textarea>留言</textarea>
								</div>
								<input type="submit" value="发送" />
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
						<p>Copyright &copy; 2016.Company name All rights </p>
					</div>
					<div class="footer-right">
						<p><a href="#totop" class="scroll">回到顶部<span> </span></a></p>
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

