<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<base target="_blank" />
<title>Modal</title>
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
    function setpage(allpage,nowpage) {
        var i=1;
        var page_id="nowpage";
        var page_pre=nowpage-1;
        var page_next=nowpage+1;
        $("#nowpage").val(nowpage);
        $("#allpage").val(allpage);
        $("#pageUl").empty();
        $("#pageUl").append("<li class='page-first'><a href='javascript:queryModalByClassfiy(1)'>&lt;&lt;</a></li>");
        $("#pageUl").append("<li class='page-pre '><a href='javascript:queryModalByClassfiy("+page_pre+")'>&lt;</a></li>");
        for(i;i<=allpage;i++){
            page_id="nowpage";
            page_id=page_id+i;
            $("#pageUl").append("<li id='"+page_id+"' class='page-number '><a href='javascript:queryModalByClassfiy("+i+")'>"+i+"</a></li>");
        }
        $("#pageUl").append("<li class='page-next '><a href='javascript:queryModalByClassfiy("+page_next+")'>&gt;</a></li>");
        $("#pageUl").append("<li class='page-last '><a href='javascript:queryModalByClassfiy("+allpage+")'>&gt;&gt;</a></li>");
        page_id="nowpage"+nowpage;
        var id="#"+page_id;
        $("ul.pageUl li").removeClass("active");
        $(id).addClass("active");
    }
    function queryModalByClassfiy(nowpage) {
        var spec_id=GetQueryString("spec_id");
        var params = '{"spec_id":"'+spec_id+'","now_page":"'+nowpage+'"}';
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/seach/queryModalByClassfiy.action",
            data:params,
            contentType:'application/json;charset=utf-8',
            success:function(data){
                setpage(data.allpage,nowpage);
                $("#div_classfiy").empty();

               if((data.prods).length>4){
                    var diva=$("<div></div>").addClass("entertain_box wow fadeInLeft").attr("data-wow-delay","0.4s");
                    var divb=$("<div></div>").addClass("entertain_box wow fadeInLeft").attr("data-wow-delay","0.4s");

                    $.each(data.prods,function(index,content){
                        if (index<=3) {
                            var div1=$("<div></div>").addClass("col-md-3 grid_box");
                            var div2=$("<div></div>").addClass("grid_box2");
                            var a1=$("<a></a>").attr("href","${pageContext.request.contextPath}/maker/getMaker.action?user_id="+"<%=session.getAttribute("user_id")%>"+"&prod_id="+content.prod_id).addClass("swipebox").attr("title","Image Title").attr("rel","external").attr("onclick","insertUserProd("+content.prod_id+")");
                            var a2=$("<a></a>").attr("href","${pageContext.request.contextPath}"+content.service_src).append(content.prod_name).attr("rel","external").attr("onclick","insertUserProd("+content.prod_id+")");
                            var img=$("<img></img>").attr("src","${pageContext.request.contextPath}"+content.prod_image_src).addClass("img-responsive").attr("alt","").css("width","500px").css("height","374px");
                            var span=$("<span></span>").addClass("zoom-icon");
                            var h=$("<h4></h4>");
                            var p=$("<p></p>").append(content.prod_desc);
                            div1.append(a1.append(img).append(span)).append(div2.append(h.append(a2)).append(p));
                            diva.append(div1);
                        }else {
                            var div1=$("<div></div>").addClass("col-md-3 grid_box");
                            var div2=$("<div></div>").addClass("grid_box2");
                            var a1=$("<a></a>").attr("href","${pageContext.request.contextPath}/maker/getMaker.action?user_id="+"<%=session.getAttribute("user_id")%>"+"&prod_id="+content.prod_id).addClass("swipebox").attr("title","Image Title").attr("rel","external").attr("onclick","insertUserProd("+content.prod_id+")");
                            var a2=$("<a></a>").attr("href","${pageContext.request.contextPath}"+content.service_src).append(content.prod_name).attr("rel","external").attr("onclick","insertUserProd("+content.prod_id+")");
                            var img=$("<img></img>").attr("src","${pageContext.request.contextPath}"+content.prod_image_src).addClass("img-responsive").attr("alt","").css("width","500px").css("height","374px");
                            var span=$("<span></span>").addClass("zoom-icon");
                            var h=$("<h4></h4>");
                            var p=$("<p></p>").append(content.prod_desc);
                            div1.append(a1.append(img).append(span)).append(div2.append(h.append(a2)).append(p));
                            divb.append(div1);
                        }
                    });
                    var diveclear= $("<div></div>").addClass("clearfix");
                    $("#div_classfiy").append(diva.append(diveclear)).append(divb);
                }else {
                    var div=$("<div></div>").addClass("entertain_box wow fadeInLeft").attr("data-wow-delay","0.4s");
                    $.each(data.prods,function(index,content){
                        var div1=$("<div></div>").addClass("col-md-3 grid_box");
                        var div2=$("<div></div>").addClass("grid_box2");
                        var a1=$("<a></a>").attr("href","${pageContext.request.contextPath}/maker/getMaker.action?user_id="+"<%=session.getAttribute("user_id")%>"+"&prod_id="+content.prod_id).addClass("swipebox").attr("title","Image Title").attr("rel","external").attr("onclick","insertUserProd("+content.prod_id+")");
                        var a2=$("<a></a>").attr("href","${pageContext.request.contextPath}"+content.service_src).append(content.prod_name).attr("rel","external").attr("onclick","insertUserProd("+content.prod_id+")");
                        var img=$("<img></img>").attr("src","${pageContext.request.contextPath}"+content.prod_image_src).addClass("img-responsive").attr("alt","").css("width","500px").css("height","374px");
                        var span=$("<span></span>").addClass("zoom-icon");
                        var h=$("<h4></h4>");
                        var p=$("<p></p>").append(content.prod_desc);
                        div1.append(a1.append(img).append(span)).append(div2.append(h.append(a2)).append(p));
                        div.append(div1);
                        $("#div_classfiy").append(div);
                    });
                }
            }
        });
    }
</script>
	<script>
		function insertUserProd(prod_id) {
		    var user_name='<%=session.getAttribute("username")%>';
            var params = '{"user_name":"'+user_name+'","prod_id":"'+prod_id+'"}';
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath }/seach/insertUserProd.action",
                data:params,
                contentType:'application/json;charset=utf-8',
                success:function(data){
                }
            });
        }
        function GetQueryString(name)
        {
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
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
					<h2>第二步：选择模板</h2>
					<span> </span>
					<h1>选择一款中意的模版： 1、选择分类   2、选择模板  3、修改模板</h1>
					<a href="#intro"  class="scroll"><label class="downarrow"> </label></a>
				</div>
				<!-- /header-info -->
			<!-- /header -->
			</div>
   
   
   
   <div id="intro" class="living_middle">
   	  <div id="div_classfiy" class="container">

		 </div>	
     </div>
       <div  style="float: none;  display: block;  margin-left: auto;  margin-right: auto; text-align: center;background-color: #f3f1f2;  " >
              <input type="hidden" id="nowpage" value="1">
              <input type="hidden" id="allpage" value="1">
            <ul id="pageUl" class="pagination">
              <li class="page-first "><a href="javascript:void(0)">&lt;&lt;</a></li>
              <li class="page-pre "><a href="javascript:void(0)">&lt;</a></li>
              <li class="page-number active "><a href="javascript:void(0)">1</a></li>
                <li class="page-number  "><a href="javascript:void(0)">2</a></li>
                <li class="page-next "><a href="javascript:void(0)">&gt;</a></li>
              <li class="page-last "><a href="javascript:void(0)">&gt;&gt;</a></li>
            </ul>
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
                                             queryModalByClassfiy(1);
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