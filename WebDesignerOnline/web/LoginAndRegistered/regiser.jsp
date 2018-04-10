<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>register</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LoginAndRegistered/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LoginAndRegistered/css/amazeui.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LoginAndRegistered/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LoginAndRegistered/css/component.css" />
<!--[if IE]>
<script src="${pageContext.request.contextPath}/LoginAndRegistered/js/html5.js"></script>
<![endif]-->
<style type="text/css">
a:link {color: #FF0000}
a:visited {color:aliceblue}
a:hover {color: #FF00FF}
a:active {color: #0000FF}
</style>
</head>
<body>

		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
				
                 
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<img src="${pageContext.request.contextPath}/LoginAndRegistered/images/logo.png">
						<form action="${pageContext.request.contextPath }/users/registered.action" name="f" method="post" onSubmit="return checkForm()">
						
							<div id="change_margin_1" class="input_outer">
								<span class="u_user"></span>
								<input name="user_name" id="userName" value=""  class="text" style="color: #FFFFFF !important" type="text" required=" " placeholder="请输入用户名" onBlur="checkUserName()" oninput="checkUserName()" >
								<br>
								<span class="default" id="nameErr" ></span>
								
							</div>
							
							<div style="clear:both;"></div>
							
								<div id="change_margin_2" class="input_outer">
								<span class="us_uer"></span>
								<input name="user_tele" id="userPhone"  class="text" style="color: #FFFFFF !important; "  type="text" required=" " class="input_outer"  placeholder="请输入电话" onBlur="checkUserPhone()" oninput="checkUserPhone()">
								<br>
								<span class="default" id="nametel" ></span>
							</div>
							
							
							<div id="change_margin_2" class="input_outer">
								<span class="us_uer"></span>
								<input  id="userPasword"  class="text" style="color: #FFFFFF !important; " value="" type="password" required=" " placeholder="请输入密码" onBlur="checkPassword()" oninput="checkPassword()">
								<br>
								<span class="default" id="passwordErr" ></span>
							</div>
							
							<div id="change_margin_2" class="input_outer">
								<span class="us_uer"></span>
								<input name="user_password" id="repassword"  class="text" style="color: #FFFFFF !important; " value="" type="password" required=" " placeholder="请再输入一次密码" class="input_outer" onBlur="checkRepassword()" oninput="checkRepassword()">
								<br>
								<span class="default" id="repasswordErr" ></span>
							</div>
							 
							 
							 
							
						    <div id="change_margin_3" class="mb2">
						    <input name="submit" class="act-but submit" type="submit" value="注册"  >
						   
						    </div>
						     <div  style="margin-top: 20px;">
						     <a href="login.jsp"> <p style="font-size: 20px;text-align: center; ">已有账号,请点击这里</p></a>
						    
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		 

		
		<!-- /container -->
		
		
		<script src="${pageContext.request.contextPath}/LoginAndRegistered/js/TweenLite.min.js"></script>
		<script src="${pageContext.request.contextPath}/LoginAndRegistered/js/EasePack.min.js"></script>
		<script src="${pageContext.request.contextPath}/LoginAndRegistered/js/rAF.js"></script>
		<script src="${pageContext.request.contextPath}/LoginAndRegistered/js/demo-1.js"></script>
		
		
		<script type="text/javascript"> 
        function checkForm(){ 
        var nametip = checkUserName(); 
	    var nametel = checkUserPhone();
        var passtip = checkPassword(); 
		var repasstip =checkRepassword ();
 
        return nametip && nametel && passtip && repasstip ; 
  } 
  //验证用户名   
  function checkUserName(){ 
  var username = document.getElementById('userName'); 
  var errname = document.getElementById('nameErr'); 
  var pattern = /^\w{4,8}$/;  //用户名格式正则表达式：用户名要至少三位 
  if(username.value.length == 0){ 
    errname.innerHTML="用户名不能为空"
    errname.className="error"
    return false; 
    } 
  if(!pattern.test(username.value)){ 
    errname.innerHTML="用户长度至少为4，最多为8"
    errname.className="error"
    return false; 
    } 
   else{ 
     errname.innerHTML=""
     errname.className="success"; 
     return true; 
     } 
  } 
 //验证电话  
  function checkUserPhone(){ 
  var username = document.getElementById('userPhone'); 
  var errname = document.getElementById('nametel'); 
  var pattern = /^\w{11,11}$/;  //用户名格式正则表达式：用户名要至少三位 
 
  if(!pattern.test(username.value)){ 
    errname.innerHTML="电话长度为11位"
    errname.className="error"
    return false; 
    } 
   else{ 
     errname.innerHTML=""
     errname.className="success"; 
     return true; 
     } 
  } 
 //验证密码   
function checkPassword(){ 
  var userpasswd = document.getElementById('userPasword').value; 
   
  var errPasswd = document.getElementById('passwordErr'); 
  var pattern = /^[0-9A-Za-z_]\w{7,15}$/; //密码长度在8个字符到16个字符，由字母、数字和"_"组成

  if(!pattern.test(userpasswd)){ 
    errPasswd.innerHTML="密码长度必须在8个字符到16个字符之间"
    errPasswd.className="error"
    return false; 
    } 
   else{ 
     errPasswd.innerHTML=""
     errPasswd.className="success"; 
     return true; 
     } 
  } 
 
	//校正验证密码   
function checkRepassword(){ 
  var userpasswd = document.getElementById('userPasword').value; 
 var reuserpasswd = document.getElementById('repassword').value;
  var reerrPasswd = document.getElementById('repasswordErr'); 
  if(reuserpasswd!==userpasswd){ 
    reerrPasswd.innerHTML="两次输入的密码不一致"
    reerrPasswd.className="error"
    return false; 
    } 
   else{ 
     reerrPasswd.innerHTML=""
     reerrPasswd.className="success"; 
     return true; 
     } 
  } 
 
</script>

	

		
	</body>
</html>