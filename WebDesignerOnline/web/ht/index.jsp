<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Tables</title>
<link href="${pageContext.request.contextPath}/ht/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/ht/css/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/ht/css/bootstrap-table.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/ht/css/styles.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/ht/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/respond.min.js"></script>
<![endif]-->

</head>

<body >
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#"><span>MiLaDesigner</span>系统管理平台</a>
      <ul class="user-menu">
        <li class="dropdown pull-right"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> ${sessionScope.username} <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="${pageContext.request.contextPath }/users/quitUser.action"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  <!-- /.container-fluid --> 
</nav>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
    </form>
    <ul class="nav menu">
        <li ><a href="classfiy.jsp"><span class="glyphicon glyphicon-dashboard"></span> 分类管理</a></li>
        <li><a href="modal.jsp"><span class="glyphicon glyphicon-th"></span> 资源管理</a></li>
        <li><a href="manager.jsp"><span class="glyphicon glyphicon-list-alt"></span> 权限管理</a></li>
        <li class="parent">
            <a href="#">
                <span class="glyphicon glyphicon-stats"></span> 数据分析 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li >
                    <a class="" href="login_analys.jsp">
                        <span class="glyphicon glyphicon-share-alt"></span> 访问流量
                    </a>
                </li>
                <li>
                    <a class="" href="userModal.jsp">
                        <span class="glyphicon glyphicon-share-alt"></span> 模板使用情况
                    </a>
                </li>

            </ul>
        </li>
        <li role="presentation" class="divider"></li>
        <li><a href="${pageContext.request.contextPath}/index.jsp"><span class="glyphicon glyphicon-cloud"></span>用户制作页面</a></li>
    </ul>
    <div class="attribution">Template by 黄鼎运、曾盈</div>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div class="row">
    <ol class="breadcrumb">
      <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
      <li class="active">系统管理平台</li>
    </ol>
  </div>
  <!--/.row-->
  
  <div class="row">
    <div class="col-lg-12">
      <h2 class="page-header" style="text-align:center">欢迎，尊敬的管理员<%=session.getAttribute("username")%></h2>
    </div>
  </div>
  <!--/.row     <input id="seachinput" class="form-control" type="text" placeholder="Search">    <button class="btn btn-default" type="button" name="refresh" title="Refresh" onclick="seachuser()"><i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
			-->
  
  <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default">
        <div class="panel-heading"><center>MiLaDesigner</center></div>
        <div class="panel-body">
          <div class="fixed-table-toolbar">
          <div id="main" style="height: 80%;width: 100%" >
                  <div class="container demo-3" style="width: 100%;height: 100%">
                      <div class="content">
                          <div id="large-header" class="large-header">
                              <canvas id="demo-canvas"></canvas>
                              <h1 class="main-title">Welcome to MiLaDesigner</span></h1>
                          </div>
                      </div>
                  </div><!-- /container -->
              </div>
          </div>


        </div>
      </div>
    </div>
  </div>
  <!--/.row--> 
  
</div>
<!--/.main--> 

<script src="${pageContext.request.contextPath}/ht/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/ConvertDate.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/jquery.form.js"></script>
<script src="js/TweenLite.min.js"></script>
<script src="js/EasePack.min.js"></script>
<script src="js/rAF.js"></script>
<script src="js/demo-3.js"></script>
<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>
    <script type="text/javascript">
        $(document).ready(function(){
            if("<%=session.getAttribute("userflag")%>"==1 ){

                $("#manager_jsp").css("display","none");
                $("#analysis_jsp").css("display","none");
            }
        })
    </script>
</body>
</html>
