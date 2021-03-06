<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Gallery</title>
<link href="${pageContext.request.contextPath}/fe/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/fe/css/style.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/fe/css/style1.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/fe/css/animate.css" rel='stylesheet' type='text/css' />

	
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Hotel Deluxe Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->

<script type="text/javascript" src="${pageContext.request.contextPath}/fe/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/fe/js/jquery.easydropdown.js"></script>
<!------ Light Box ------>
<link rel="stylesheet" href="${pageContext.request.contextPath}/fe/css/swipebox.css">
  <!---- start-smoth-scrolling---->
		<script type="text/javascript" src="${pageContext.request.contextPath}/fe/js/move-top.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/fe/js/easing.js"></script>
<script src="${pageContext.request.contextPath}/fe/js/jquery.swipebox.min.js"></script>
    <script type="text/javascript">
		jQuery(function($) {
			$(".swipebox").swipebox();
		});
	</script>

<script src="js/wow.min.js"></script>

<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	function queryAllClassfiy() {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/seach/queryAllClassfiy.action",
            contentType:'application/json;charset=utf-8',
            success:function(data){
                $("#div_classfiy").empty();
                if(data.length>4){
                    var diva=$("<div></div>").addClass("entertain_box wow fadeInLeft").attr("data-wow-delay","0.4s");
                    var divb=$("<div></div>").addClass("entertain_box wow fadeInLeft").attr("data-wow-delay","0.4s");

                    $.each(data,function(index,content){
                        if (index<=3) {
                            var div1=$("<div></div>").addClass("col-md-3 grid_box");
                            var div2=$("<div></div>").addClass("grid_box2");
                            var a1=$("<a></a>").attr("href","${pageContext.request.contextPath}/seach/toModal.action?spec_id="+content.spec_id).addClass("swipebox").attr("title","Image Title").attr("rel","external");
                            var a2=$("<a></a>").attr("href","${pageContext.request.contextPath}/seach/toModal.action?spec_id="+content.spec_id).append(content.spec_name).attr("rel","external");
                            var img=$("<img></img>").attr("src","${pageContext.request.contextPath}"+content.spec_image_src).addClass("img-responsive").attr("alt","").css("width","500px").css("height","374px");
                            var span=$("<span></span>").addClass("zoom-icon");
                            var h=$("<h4></h4>");
                            var p=$("<p></p>").append(content.spec_desc);
                            div1.append(a1.append(img).append(span)).append(div2.append(h.append(a2)).append(p));
                            diva.append(div1);
                        }else {
                            var div1=$("<div></div>").addClass("col-md-3 grid_box");
                            var div2=$("<div></div>").addClass("grid_box2");
                            var a1=$("<a></a>").attr("href","${pageContext.request.contextPath}/seach/toModal.action?spec_id="+content.spec_id).addClass("swipebox").attr("title","Image Title").attr("rel","external");
                            var a2=$("<a></a>").attr("href","${pageContext.request.contextPath}/seach/toModal.action?spec_id="+content.spec_id).append(content.spec_name).attr("rel","external");
                            var img=$("<img></img>").attr("src","${pageContext.request.contextPath}"+content.spec_image_src).addClass("img-responsive").attr("alt","").css("width","500px").css("height","374px");
                            var span=$("<span></span>").addClass("zoom-icon");
                            var h=$("<h4></h4>");
                            var p=$("<p></p>").append(content.spec_desc);
                            div1.append(a1.append(img).append(span)).append(div2.append(h.append(a2)).append(p));
                            divb.append(div1);
                        }
                    });
                    var diveclear= $("<div></div>").addClass("clearfix");
                    $("#div_classfiy").append(diva.append(diveclear)).append(divb);
				}else {
                    var div=$("<div></div>").addClass("entertain_box wow fadeInLeft").attr("data-wow-delay","0.4s");
                    $.each(data,function(index,content){
                        var div1=$("<div></div>").addClass("col-md-3 grid_box");
                        var div2=$("<div></div>").addClass("grid_box2");
                        var a1=$("<a></a>").attr("href","${pageContext.request.contextPath}/seach/toModal.action?spec_id="+content.spec_id).addClass("swipebox").attr("title","Image Title").attr("rel","external");
                        var a2=$("<a></a>").attr("href","${pageContext.request.contextPath}/seach/toModal.action?spec_id="+content.spec_id).append(content.spec_name).attr("rel","external");
                        var img=$("<img></img>").attr("src","${pageContext.request.contextPath}"+content.spec_image_src).addClass("img-responsive").attr("alt","").css("width","500px").css("height","374px");
                        var span=$("<span></span>").addClass("zoom-icon");
                        var h=$("<h4></h4>");
                        var p=$("<p></p>").append(content.spec_desc);
                        div1.append(a1.append(img).append(span)).append(div2.append(h.append(a2)).append(p));
                        div.append(div1);
                        $("#div_classfiy").append(div);
                    });
                }
            }
        });
    }
</script>
    </head>
<body>
	<!-- header -->
			<div id="totop" class="header" style="width: ">
				<div class="container">
				<!-- menu -->
				<div class="menu">
					<span class="menu-icon"> </span>
						<ul>
						<li><a href="${pageContext.request.contextPath }/" class="scroll">首页</a></li>
						<li class="login" style="display: none"><a href="gallery.jsp" class="scroll">模板</a></li>
						
						<li class="unlogin"><a href="login.jsp" >登录</a></li>
						<li class="htlogin" style="display: none"><a href="${pageContext.request.contextPath }/ht/index.jsp" >系统管理平台</a></li>
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
				
			</div>
			
			<!-- header-info -->
				<div class="header-info text-center">
					<h2>第一步：选择分类</h2>
					<span> </span>
					<h1>选择一款中意的模版： 1、选择分类   2、选择模板  3、修改模板</h1>
					<a href="#intro"  class="scroll"><label class="downarrow"> </label></a>
				</div>
				<!-- /header-info -->
			<!-- /header -->
			</div>
   
   
   
   <div id="intro" class="living_middle">
   	  <div id="div_classfiy" class="container">
   	    <%--<div class="entertain_box wow fadeInLeft" data-wow-delay="0.4s">
		   <div class="col-md-3 grid_box">
		   	   <a href="images/p1.jpg" class="swipebox"  title="Image Title"> <img src="images/p1.jpg" class="img-responsive" alt=""><span class="zoom-icon"></span> </a>
		   	  <div class="grid_box2">
			   <h4><a href="#">企业/公司/机构</a></h4>
			   <p>voluptatem sequi</p>
	          </div>
		   </div>
		   <div class="col-md-3 grid_box">
		   	   <a href="images/p2.jpg" class="swipebox"  title="Image Title"> <img src="images/p2.jpg" class="img-responsive" alt=""><span class="zoom-icon"></span> </a>
		   	  <div class="grid_box2">
			   <h4><a href="#">个人</a></h4>
			   <p>voluptatem sequi</p>
	          </div>
		   </div>
		   <div class="col-md-3 grid_box">
		   	   <a href="images/p3.jpg" class="swipebox"  title="Image Title"> <img src="images/p3.jpg" class="img-responsive" alt=""><span class="zoom-icon"></span> </a>
		   	  <div class="grid_box2">
			   <h4><a href="#"> 在线商城</a></h4>
			   <p>voluptatem sequi</p>
	          </div>
		   </div>
		   <div class="col-md-3 grid_box">
		   	   <a href="images/p4.jpg" class="swipebox"  title="Image Title"> <img src="images/p4.jpg" class="img-responsive" alt=""><span class="zoom-icon"></span> </a>
		   	  <div class="grid_box2">
			   <h4><a href="#">一页式网站</a></h4>
			   <p>voluptatem sequi</p>
	          </div>
		   </div>
		   <div class="clearfix"> </div>
		 </div>
		 <div class="entertain_box1 wow fadeInRight" data-wow-delay="0.4s">
		   <div class="col-md-3 grid_box">
		   	   <a href="images/p5.jpg" class="swipebox"  title="Image Title"> <img src="images/p5.jpg" class="img-responsive" alt=""><span class="zoom-icon"></span> </a>
		   	  <div class="grid_box2">
			   <h4><a href="#">设计风格</a></h4>
			   <p>voluptatem sequi</p>
	          </div>
		   </div>
		   <div class="col-md-3 grid_box">
		   	   <a href="images/p6.jpg" class="swipebox"  title="Image Title"> <img src="images/p6.jpg" class="img-responsive" alt=""><span class="zoom-icon"></span> </a>
		   	  <div class="grid_box2">
			   <h4><a href="#">Hotel</a></h4>
			   <p>voluptatem sequi</p>
	          </div>
		   </div>
		   <div class="col-md-3 grid_box">
		   	   <a href="images/p7.jpg" class="swipebox"  title="Image Title"> <img src="images/p7.jpg" class="img-responsive" alt=""><span class="zoom-icon"></span> </a>
		   	  <div class="grid_box2">
			   <h4><a href="#">Hotel</a></h4>
			   <p> voluptatem sequi</p>
	          </div>
		   </div>
		   <div class="col-md-3 grid_box">
		   	   <a href="images/p8.jpg" class="swipebox"  title="Image Title"> <img src="images/p8.jpg" class="img-responsive" alt=""><span class="zoom-icon"></span> </a>
		   	  <div class="grid_box2">
			   <h4><a href="#">Hotel</a></h4>
			   <p>voluptatem sequi</p>
	          </div>
		   </div>
		   <div class="clearfix"> </div>
		 </div>
     </div>--%>
	  </div>
   </div>
   
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
			
 <script type="text/javascript">
									$(document).ready(function() {
                                        if("<%=session.getAttribute("username")%>"!="null" ){
                                            $(".login").css("display","");
                                            $(".unlogin").css("display","none");
                                            if("<%=session.getAttribute("userflag")%>"!="0" ){
                                                $(".htlogin").css("display","");
                                                $(".unhtlogin").css("display","none");
                                            }
                                            queryAllClassfiy();
                                        }
										
									
										
									});
                                    function externallinks() {

                                        if (!document.getElementsByTagName) return;

                                        var anchors = document.getElementsByTagName("a");

                                        for (var i = 0; i < anchors.length; i++) {

                                            var anchor = anchors[i];

                                            if (anchor.getAttribute("href") &&

                                                anchor.getAttribute("rel") == "external")

                                                anchor.target = "_blank";

                                        }

                                    }

                                    window.onload = externallinks;
								</script>
</body>
</html>		