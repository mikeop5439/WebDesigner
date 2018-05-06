<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Epic &mdash; Fully Responsive Free HTML5 Bootstrap Website Template by FREEHTML5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5" />
<meta name="keywords" content="free html5, free template, free bootstrap, website template, html5, css3, mobile first, responsive" />

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

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">
<!-- Google Fonts -->
<link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic|Roboto:400,300,700' rel='stylesheet' type='text/css'>
<!-- Animate -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon -->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/style.css">

<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="js/jquery.waypoints.min.js"></script>
<!-- Magnific Popup -->
<script src="js/jquery.magnific-popup.min.js"></script>

<!-- Main JS -->
<script src="js/main.js"></script>

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<script src="js/jquery.form.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<style>
h1:hover {
	border: 1px dashed #000;
}
}
img:hover {
	border: 1px dashed #000;
}
}
.textarea {
	width: 100%;
	height: 100px;
	background: none;
	z-index: 9
}
.note {
	line-height: 20px;
	padding: 3px 5px;
}
</style>
<script>
$(document).ready(function(){
  $(".txtarea").hover(function(){
    $(this).children("div").children(".txtmodl").css("display","block");
    },function(){
    $(this).children("div").children(".txtmodl").css("display","none");
  });
	$(".fh5co-item-text-wrap").hover(function(){
    $(this).children("div").children("h2").children(".imgmodal").css("display","block");
    },function(){
    $(this).children("div").children("h2").children(".imgmodal").css("display","none");
  });
});
	function getParm(name) {
        var search = document.location.search;
        //alert(search);
        var pattern = new RegExp("[?&]" + name + "\=([^&]+)", "g");
        var matcher = pattern.exec(search);
        var items = null;
        if (null != matcher) {
            try {
                items = decodeURIComponent(decodeURIComponent(matcher[1]));
            } catch (e) {
                try {
                    items = decodeURIComponent(matcher[1]);
                } catch (e) {
                    items = matcher[1];
                }
            }
        }
        return items;
    };
	
	function updateimg(){
		
	}
	function changetxt(id){
		$("#txtsubmit").attr("onclick","setTxt('"+id+"')");
		
	};
	
	function setTxt(id){
		$("#"+id).empty();
		$("#"+id).append($("#txtinput").val())
	}
	function changeimg(id){
		var word="user_id"
		var parm=getParm(word);
		$("#imgsubmit").attr("onclick","updateimg()");
		$("#classphoto").attr("onchange","get(this,'"+id+"')")
		$("#imgid").val(id);
		$("#imgout").attr("src",$("#"+id)[0].src)
		console.log(parm);
		$("#user_id").val(""+parm);
		console.log($("#user_id").val())
		
	}
	function get(node,id){
            var userAgent=navigator.userAgent;
            //适用谷歌和火狐的浏览器传入路径
            if(userAgent.indexOf("Chrome")!=-1||userAgent.indexOf("Firefox")!=-1){
				$("#imgout").attr("src",window.URL.createObjectURL(node.files.item(0)))
            }
            //适用IE浏览器传入路径
            if(userAgent.indexOf("MSIE")!=-1){
                img.src=node.value;
            }
		   $("#"+id).attr("src",window.URL.createObjectURL(node.files.item(0)))

	}
	function updateimg() {
        var option = {
            url : '${pageContext.request.contextPath }/maker/updateimg.action',
            type : 'POST',
            dataType : 'json',
            headers : {"ClientCallMode" : "ajax"}, //添加请求头部
            success : function(data) {
            }
            };
        $("#form1").ajaxSubmit(option);
        queryModalfiyLimit($("#nowpage").val());
    }
</script>
</head>
<body>

<!-- Loader -->
<div class="fh5co-loader"></div>
<div id="fh5co-logo"> <a href="index.html" class="transition"><i class="icon-camera"></i><em><span class="icon-home"></span></em></a> </div>
<div id="fh5co-main" role="main">
  <div class="container">
    <div class="fh5co-grid">
      <div class="fh5co-col-1">
        <div class="fh5co-intro padding-right">
          <h1 class="txtarea"><font id="txt1">I'm Jean Smith  I'm a Photographer. I love capture life.</font>
            <div style="float: right;float: "><i data-toggle="modal" data-target="#myModal" class="txtmodl undisplay icon-circle-with-plus" onClick="changetxt('txt1')"></i></div>
          </h1>
          <ul class="fh5co-social">
            <li><a href="#"><i class="icon-twitter-with-circle"></i></a></li>
            <li><a href="#"><i class="icon-facebook-with-circle"></i></a></li>
            <li><a href="#"><i class="icon-instagram-with-circle"></i></a></li>
            <li><a href="#"><i class="icon-dribbble-with-circle"></i></a></li>
          </ul>
        </div>
        <div class="fh5co-item"> <a class="transition animate-box"> <img class="outimges" id="img1" src="images/img1.jpg" alt="Free HTML5 Website Template by FreeHTML5.co">
          <div class="fh5co-item-text-wrap">
            <div class="fh5co-item-text">
                <h2> <i data-toggle="modal" data-target="#myModal1" class="imgmodal undisplay icon-circle-with-plus1" onClick="changeimg('img1')"></i> </h2>
            </div>
          </div>
          </a> </div>
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
        <div class="fh5co-item"> <a  class="transition animate-box"> <img class="outimges" id="img2" src="images/img2.jpg" alt="Free HTML5 Website Template by FreeHTML5.co">
          <div class="fh5co-item-text-wrap">
            <div class="fh5co-item-text">
                <h2> <i data-toggle="modal" data-target="#myModal1" class="imgmodal undisplay icon-circle-with-plus1" onClick="changeimg('img2')"></i></h2>
            </div>
          </div>
          </a> </div>
        <div class="fh5co-item"> <a  class="transition animate-box"> <img class="outimges" id="img7" src="images/img7.jpg" alt="Free HTML5 Website Template by FreeHTML5.co">
          <div class="fh5co-item-text-wrap">
            <div class="fh5co-item-text">
                <h2> <i data-toggle="modal" data-target="#myModal1" class="imgmodal undisplay icon-circle-with-plus1" onClick="changeimg('img7')"></i></h2>
            </div>
          </div>
          </a> </div>
        <div class="fh5co-item"> <a class="transition animate-box"> <img class="outimges" id="img8" src="images/img8.jpg" alt="Free HTML5 Website Template by FreeHTML5.co">
          <div class="fh5co-item-text-wrap">
            <div class="fh5co-item-text">
              <h2> <i data-toggle="modal" data-target="#myModal1" class="imgmodal undisplay icon-circle-with-plus1" onClick="changeimg('img8')"></i> </h2>
            </div>
          </div>
          </a> </div>
      </div>
      <div class="fh5co-col-2">
        <div class="fh5co-item"> <a class="transition animate-box"> <img class="outimges" id="img3" src="images/img3.jpg" alt="Free HTML5 Website Template by FreeHTML5.co">
          <div class="fh5co-item-text-wrap">
            <div class="fh5co-item-text">
              <h2> <i data-toggle="modal" data-target="#myModal1" class="imgmodal undisplay icon-circle-with-plus1" onClick="changeimg('img3')"></i> </h2>
            </div>
          </div>
          </a> </div>
        <div class="fh5co-item"> <a class="transition animate-box"> <img class="outimges" id="img4" src="images/img4.jpg" alt="Free HTML5 Website Template by FreeHTML5.co">
          <div class="fh5co-item-text-wrap">
            <div class="fh5co-item-text">
              <h2> <i data-toggle="modal" data-target="#myModal1" class="imgmodal undisplay icon-circle-with-plus1" onClick="changeimg('img4')"></i> </h2>
            </div>
          </div>
          </a> </div>
        <div class="fh5co-item"> <a class="transition animate-box"> <img class="outimges" id="img5" src="images/img5.jpg" alt="Free HTML5 Website Template by FreeHTML5.co">
          <div class="fh5co-item-text-wrap">
            <div class="fh5co-item-text">
              <h2> <i data-toggle="modal" data-target="#myModal1" class="imgmodal undisplay icon-circle-with-plus1" onClick="changeimg('img5')"></i> </h2>
            </div>
          </div>
          </a> </div>
        <div class="fh5co-item"> <a class="transition animate-box"> <img class="outimges" id="img6" src="images/img6.jpg" alt="Free HTML5 Website Template by FreeHTML5.co">
          <div class="fh5co-item-text-wrap">
            <div class="fh5co-item-text">
              <h2> <i data-toggle="modal" data-target="#myModal1" class="imgmodal undisplay icon-circle-with-plus1" onClick="changeimg('img6')"></i> </h2>
            </div>
          </div>
          </a> </div>
        <div id="fh5co-footer" class="padding-left">
          <h1 class="txtarea"><font id="txt2">I'm Jean Smith  I'm a Photographer. I love capture life.</font>
            <div style="float: right;float: "><i data-toggle="modal" data-target="#myModal" class="txtmodl undisplay icon-circle-with-plus" onClick="changetxt('txt2')"></i></div>
          </h1>
          <ul class="fh5co-social">
            <li><a href="#"><i class="icon-twitter-with-circle"></i></a></li>
            <li><a href="#"><i class="icon-facebook-with-circle"></i></a></li>
            <li><a href="#"><i class="icon-instagram-with-circle"></i></a></li>
            <li><a href="#"><i class="icon-dribbble-with-circle"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h4  id="myModalLabel" style="text-align: center;"> 修改 </h4>
      </div>
      <div style="padding:10px;">
        <form id="form" class="bs-example bs-example-form" role="form" action="" method="post" enctype="multipart/form-data">
          <div style="margin-bottom: 20px;" >
            <textarea id="txtinput" class="textarea" onfocus="document.getElementById('note').style.display='none'" onblur="if(value=='')document.getElementById('note').style.display='block'"></textarea>
            <div id="note" class="note"> <font color="#777">在这里写入你想修改的文字......</font> </div>
          </div>
          <center>
            <div >
              <button id="txtsubmit" type="button" class="btn btn-default" data-dismiss="modal" >提交</button>
            </div>
          </center>
        </form>
      </div>
    </div>
    <!-- /.modal-content --> 
  </div>
  <!-- /.modal --> 
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h4  id="myModalLabel" style="text-align: center;"> 修改 </h4>
      </div>
      <div style="padding:10px;">
        <form id="form1" class="bs-example bs-example-form" role="form" action="" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <center>
              <div><img id="imgout" src="" width="300px;" height="500px;"></div>
            </center>
            <center>
              <label class="sr-only" for="classphoto">文件输入</label>
              <input id="imgid" name="imgid"  type="hidden" >
              <input id="user_id" name="user_id"  value="" type="hidden" >
              <input id="prod_id" name="prod_id"  value="12" type="hidden" >

              <input type="file" id="classphoto" name="classphoto" >
              
            </center>
          </div>
          <center>
            <div >
              <button id="imgsubmit" type="button" class="btn btn-default" data-dismiss="modal" onclick="updateimg()">提交</button>
            </div>
          </center>
        </form>
      </div>
    </div>
    <!-- /.modal-content --> 
  </div>
  <!-- /.modal --> 
</div>
</body>
</html>
