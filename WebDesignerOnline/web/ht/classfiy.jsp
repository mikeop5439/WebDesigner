<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/ht/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	function seachuser() {
        var user_name=$("#seachinput").val();
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/users/queryUserByName.action",
            data:"user_name="+user_name,
            dataType:"json",
            success:function(data){
                $("#tableinsert").empty();
                $.each(data,function(index,content){
                    $("#user_id").val(content.user_id);
                    $("#user_falge").val(content.user_flage);
                    var date = "/Date("+content.user_register+")/";
                    var tr=$("<tr></tr>");
                    var flag_txt;
                    if(content.user_flage==0){
                        flag_txt="普通用户"
                        var button=$("<button></button>").attr("id","fat-btn").attr("data-loading-text","loading...").addClass("btn btn-primary btn-sm").attr("data-toggle","modal").attr("data-target","#myModal").append("任命");

                    }else if(content.user_flage==1){
                        flag_txt="资源管理员"
                        var button=$("<button></button>").attr("id","fat-btn").attr("data-loading-text","loading...").addClass("btn btn-primary btn-sm").attr("data-toggle","modal").attr("data-target","#myModal").append("卸任");

                    }else if(content.user_flage==2){
                        flag_txt="站长"
                    }
                    var td1=$("<td></td>").append(content.user_name);
                    var td2=$("<td></td>").append(getDateTime(ConvertJSONDateToJSDate(date)));
                    var td3=$("<td></td>").attr("id","flage").append(flag_txt);
                    var td4=$("<td></td>").append(button);
                    tr.append(td1).append(td2).append(td3).append(td4);
                    $("#tableinsert").append(tr)
                });
            }
        });
    }
    function setManager() {
        var user_id=$("#user_id").val();
        if($("#user_falge").val()==0){
            console.log("任命");
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath }/users/setManager.action",
                data:"user_id="+user_id,
                dataType:"json",
                success:function(data){
                    $("#flage").empty();
                    $("#flage").append("资源管理员");
                    $("#fat-btn").empty();
                    $("#fat-btn").append("卸任");
                    $("#user_falge").val(1);
                }
            });
		}else{
            console.log("卸任");
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath }/users/nosetManager.action",
                data:"user_id="+user_id,
                dataType:"json",
                success:function(data){
                    $("#flage").empty();
                    $("#flage").append("普通用户");
                    $("#fat-btn").empty();
                    $("#fat-btn").append("任命");
                    $("#user_falge").val(0);
                }
            });
		}
    }
</script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#"><span>米拉</span>后台管理系统</a>
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
    <li class="active"><a href="index.html"><span class="glyphicon glyphicon-dashboard"></span> 分类管理</a></li>
    <li><a href="widgets.html"><span class="glyphicon glyphicon-th"></span> 资源管理</a></li>
    <li><a href="manager.jsp"><span class="glyphicon glyphicon-list-alt"></span> 权限管理</a></li>
    <li><a href="charts.html"><span class="glyphicon glyphicon-stats"></span> 数据分析</a></li>
    <li><a href="forms.html"><span class="glyphicon glyphicon-pencil"></span> Forms</a></li>
    <li><a href="panels.html"><span class="glyphicon glyphicon-info-sign"></span> Alerts &amp; Panels</a></li>
    <li class="parent "> <a href="#"> <span class="glyphicon glyphicon-list"></span> Dropdown <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> </a>
      <ul class="children collapse" id="sub-item-1">
        <li> <a class="" href="#"> <span class="glyphicon glyphicon-share-alt"></span> Sub Item 1 </a> </li>
        <li> <a class="" href="#"> <span class="glyphicon glyphicon-share-alt"></span> Sub Item 2 </a> </li>
        <li> <a class="" href="#"> <span class="glyphicon glyphicon-share-alt"></span> Sub Item 3 </a> </li>
      </ul>
    </li>
    <li role="presentation" class="divider"></li>
    <li><a href="login.html"><span class="glyphicon glyphicon-user"></span> Login Page</a></li>
  </ul>
  <div class="attribution">Template by <a href="http://www.medialoot.com/item/lumino-admin-bootstrap-template/">Medialoot</a></div>
</div>
<!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div class="row">
    <ol class="breadcrumb">
      <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
      <li class="active">权限管理</li>
    </ol>
  </div>
  <!--/.row-->
  
  <div class="row">
    <div class="col-lg-12">
      <h1 class="page-header">Tables</h1>
    </div>
  </div>
  <!--/.row     <input id="seachinput" class="form-control" type="text" placeholder="Search">    <button class="btn btn-default" type="button" name="refresh" title="Refresh" onclick="seachuser()"><i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
			-->
  
  <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default">
        <div class="panel-heading">权限管理</div>
        <div class="panel-body">
          <div class="fixed-table-toolbar">
            <div class="columns btn-group pull-right">
              <button class="btn btn-default" type="button" name="refresh" title="Refresh" onclick="seachuser()"><i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
              <button class="btn btn-default" type="button" name="toggle" title="Toggle"  data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon glyphicon-plus"></i></button>
              <div class="keep-open btn-group" title="Columns">
                
              </div>
            </div>
            <div class="pull-right search">
              <input id="seachinput" class="form-control" type="text" placeholder="Search">
            </div>
          </div>
          <table class="table table-striped">
            <thead>
              <tr>
                <th>分类名称</th>
                <th>分类描述</th>
               
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>001</td>
                <td>Rammohan </td>
                <td> <button class="btn btn-default" type="button" name="toggle" title="Toggle" data-toggle="modal" data-target="#myModal1"> <i class="glyphicon glyphicon  glyphicon-pencil"></i></button></td>
              
              </tr>
              <tr>
                <td>002</td>
                <td>Smita</td>
                <td> <button class="btn btn-default" type="button" name="toggle" title="Toggle" data-toggle="modal" data-target="#myModal1"><i class="glyphicon glyphicon  glyphicon-pencil"></i></button></td>
                
              </tr>
              <tr>
                <td>003</td>
                <td>Rabindranath</td>
                <td> <button class="btn btn-default" type="button" name="toggle" title="Toggle" data-toggle="modal" data-target="#myModal1"><i class="glyphicon glyphicon  glyphicon-pencil"></i></button></td>
               
              </tr>
            </tbody>
          </table>
          <div class="pull-right pagination">
            <ul class="pagination">
              <li class="page-first disabled"><a href="javascript:void(0)">&lt;&lt;</a></li>
              <li class="page-pre disabled"><a href="javascript:void(0)">&lt;</a></li>
              <li class="page-number active disabled"><a href="javascript:void(0)">1</a></li>
              <li class="page-next disabled"><a href="javascript:void(0)">&gt;</a></li>
              <li class="page-last disabled"><a href="javascript:void(0)">&gt;&gt;</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--/.row--> 
  
</div>
<!--/.main--> 

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <input type="hidden" id="user_id">
        <input type="hidden" id="user_falge">
        <h4  id="myModalLabel" style="text-align: center;"> 增加 </h4>
      </div>
      <div style="padding:10px;">
	<form class="bs-example bs-example-form" role="form">
		<div class="input-group">
			<span class="input-group-addon">分类名称</span>
			<input type="text" class="form-control" placeholder="99">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-addon">分类名称</span>
			<input type="text" class="form-control" placeholder="00">
		</div>
		<br>
	<div>
	
	上下架状态&nbsp&nbsp&nbsp&nbsp
	
	<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked> 选项 1
	</label>
	<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="option2"> 选项 2
	</label>
</div>
	<br>
	
	
	<div class="form-group">
	
	<div>分类图片&nbsp&nbsp&nbsp&nbsp <img src="../毕业设计/images/about-pic1.png" width="100px;" height="100px;"></div>
		<label class="sr-only" for="inputfile">文件输入</label>
		<input type="file" id="inputfile">
	</div>
	
	<center><button type="submit" class="btn btn-default" >提交</button></center>
		
		
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
        <input type="hidden" id="user_id">
        <input type="hidden" id="user_falge">
        <h4  id="myModalLabel" style="text-align: center;"> 修改 </h4>
      </div>
      <div style="padding:10px;">
	<form class="bs-example bs-example-form" role="form">
		<div class="input-group">
			<span class="input-group-addon">分类名称</span>
			<input type="text" class="form-control" placeholder="99">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-addon">分类名称</span>
			<input type="text" class="form-control" placeholder="00">
		</div>
		<br>
	<div>
	
	上下架状态&nbsp&nbsp&nbsp&nbsp
	
	<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked> 选项 1
	</label>
	<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="option2"> 选项 2
	</label>
</div>
	<br>
	
	
	<div class="form-group">
	
	<div>分类图片&nbsp&nbsp&nbsp&nbsp <img src="../毕业设计/images/about-pic1.png" width="100px;" height="100px;"></div>
		<label class="sr-only" for="inputfile">文件输入</label>
		<input type="file" id="inputfile">
	</div>
	
	<center><button type="submit" class="btn btn-default" >提交</button></center>
		
		
	</form>
</div>
    </div>
    <!-- /.modal-content --> 
  </div>
  <!-- /.modal --> 
<script src="${pageContext.request.contextPath}/ht/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/ConvertDate.js"></script>
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
</body>
</html>
