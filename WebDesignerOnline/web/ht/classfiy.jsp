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

<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/ht/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/ht/js/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">

    function setpage(allpage,nowpage) {
        var i=1;
        var page_id="nowpage";
        var page_pre=nowpage-1;
        var page_next=nowpage+1;
        $("#nowpage").val(nowpage);
        $("#allpage").val(allpage);
        $("#pageUl").empty();
        $("#pageUl").append("<li class='page-first'><a href='javascript:queryClassfiyLimit(1)'>&lt;&lt;</a></li>");
        $("#pageUl").append("<li class='page-pre '><a href='javascript:queryClassfiyLimit("+page_pre+")'>&lt;</a></li>");
        for(i;i<=allpage;i++){
            page_id="nowpage";
            page_id=page_id+i;
            $("#pageUl").append("<li id='"+page_id+"' class='page-number '><a href='javascript:queryClassfiyLimit("+i+")'>"+i+"</a></li>");
        }
        $("#pageUl").append("<li class='page-next '><a href='javascript:queryClassfiyLimit("+page_next+")'>&gt;</a></li>");
        $("#pageUl").append("<li class='page-last '><a href='javascript:queryClassfiyLimit("+allpage+")'>&gt;&gt;</a></li>");
        page_id="nowpage"+nowpage;
        var id="#"+page_id;
        $("ul.pageUl li").removeClass("active");
        $(id).addClass("active");
    }
    function setpageofseach(allpage,nowpage) {
        var i=1;
        var page_id="nowpage";
        var page_pre;
        if(  nowpage-1<=0){
            page_pre=1;
        }
        var page_next=nowpage+1;
        $("#nowpage").val(nowpage);
        $("#allpage").val(allpage);
        $("#pageUl").empty();
        $("#pageUl").append("<li class='page-first'><a href='javascript:seachClassfiyLimit(1)'>&lt;&lt;</a></li>");
        $("#pageUl").append("<li class='page-pre '><a href='javascript:seachClassfiyLimit("+page_pre+")'>&lt;</a></li>");
        for(i;i<=allpage;i++){
            page_id="nowpage";
            page_id=page_id+i;
            $("#pageUl").append("<li id='"+page_id+"' class='page-number '><a href='javascript:seachClassfiyLimit("+i+")'>"+i+"</a></li>");
        }
        $("#pageUl").append("<li class='page-next '><a href='javascript:seachClassfiyLimit("+page_next+")'>&gt;</a></li>");
        $("#pageUl").append("<li class='page-last '><a href='javascript:seachClassfiyLimit("+allpage+")'>&gt;&gt;</a></li>");
        page_id="nowpage"+nowpage;
        var id="#"+page_id;
        $("ul.pageUl li").removeClass("active");
        $(id).addClass("active");
    }

    function queryClassfiyLimit(nowpage) {
        $("#tableinsert").empty();
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/classfiy/queryClassLimit.action?nowpage="+nowpage,
            contentType:'application/json;charset=utf-8',
            success:function(data){
                setpage(data.allpage,nowpage);
                $.each(data.classfiy,function(index,content){
                    var tr=$("<tr></tr>");
                    var button=$("<button></button>").addClass("btn btn-default").attr("type","button").attr("name","toggle").attr("title","修改").attr("data-toggle","modal").attr("data-target","#myModal1").attr("onclick","setClass("+content.spec_id+")").append($("<i></i>").addClass("glyphicon glyphicon  glyphicon-pencil"));
                    var td1=$("<td></td>").append(content.spec_name);
                    var td2=$("<td></td>").append(content.spec_desc);
                    var td3=$("<td></td>").append(button);
                    tr.append(td1).append(td2).append(td3);
                    $("#tableinsert").append(tr);
                });
            }
        });
    }
    function setClass(spec_id) {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/classfiy/queryClassById.action?spec_id="+spec_id,
            contentType:'application/json;charset=utf-8',
            success:function(data){
                spec_id
                $("#u_spec_id").val(data.spec_id);
                $("#u_spec_name").val(data.spec_name);
                $("#u_spec_desc").val(data.spec_desc);
                if(data.spec_status_cd==12){
                    $("#u_spec_status_cd_12").attr("checked","");
                    $("#u_spec_status_cd_22").removeAttr("checked","");
                }else {
                    $("#u_spec_status_cd_12").removeAttr("checked","");
                    $("#u_spec_status_cd_22").attr("checked","");
                }
                $("#u_spec_image_src").attr("src","${pageContext.request.contextPath}/"+data.spec_image_src+"");
            }
        });
    }
    function updateClass() {
        var option = {
            url : '${pageContext.request.contextPath }/classfiy/updateClass.action',
            type : 'POST',
            dataType : 'json',
            headers : {"ClientCallMode" : "ajax"}, //添加请求头部
            success : function(data) {
            }
            };
        $("#form1").ajaxSubmit(option);
        queryClassfiyLimit($("#nowpage").val());
    }
    function insertClass() {
        var option = {
            url : '${pageContext.request.contextPath }/classfiy/insertClass.action',
            type : 'POST',
            dataType : 'json',
            headers : {"ClientCallMode" : "ajax"}, //添加请求头部
            success : function(data) {
            }
        };
        $("#form2").ajaxSubmit(option);
        queryClassfiyLimit($("#nowpage").val());
    }
    function seachClassfiyLimit(nowpage) {
        $("#tableinsert").empty();
        var keywords=$("#keywords").val();
        var params = '{"keywords":"'+keywords+'","nowpage":"'+nowpage+'"}';
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/classfiy/seachClassLimit.action",
            data:params,
            contentType:'application/json;charset=utf-8',
            success:function(data){
                setpageofseach(data.allpage,nowpage);
                $.each(data.classfiy,function(index,content){
                    var tr=$("<tr></tr>");
                    var button=$("<button></button>").addClass("btn btn-default").attr("type","button").attr("name","toggle").attr("title","修改").attr("data-toggle","modal").attr("data-target","#myModal1").attr("onclick","setClass("+content.spec_id+")").append($("<i></i>").addClass("glyphicon glyphicon  glyphicon-pencil"));
                    var td1=$("<td></td>").append(content.spec_name);
                    var td2=$("<td></td>").append(content.spec_desc);
                    var td3=$("<td></td>").append(button);
                    tr.append(td1).append(td2).append(td3);
                    $("#tableinsert").append(tr);
                });
            }
        });
    }
</script>
</head>

<body >
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
    <li><a href="modal.html"><span class="glyphicon glyphicon-th"></span> 资源管理</a></li>
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
        <div class="panel-heading">分类管理</div>
        <div class="panel-body">
          <div class="fixed-table-toolbar">
            <div class="columns btn-group pull-right">
              <button class="btn btn-default" type="button" name="refresh" title="Refresh" onclick="seachClassfiyLimit(1)"><i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
              <button class="btn btn-default" type="button" name="toggle" title="Toggle"  data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon glyphicon-plus"></i></button>
              <div class="keep-open btn-group" title="Columns">
                
              </div>
            </div>
            <div class="pull-right search">
              <input id="keywords" class="form-control" type="text" placeholder="Search">
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
            <tbody id="tableinsert">

            </tbody>
          </table>
          <div class="pull-right pagination">
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
        <h4  id="myModalLabel" style="text-align: center;"> 增加 </h4>
      </div>
      <div style="padding:10px;">
	<form id="form2" class="bs-example bs-example-form" role="form" action="" method="post" enctype="multipart/form-data">
		<div class="input-group">
			<span class="input-group-addon">分类名称</span>
			<input type="text" class="form-control" placeholder="请输入分类名称...." name="spec_name" id="i_spec_name">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-addon">分类描述</span>
			<input type="text" class="form-control" placeholder="请输入分类描述...." name="spec_desc" id="i_spec_desc">
		</div>
		<br>
	<div>
	
	上下架状态&nbsp&nbsp&nbsp&nbsp
	
	<label class="radio-inline">
		<input type="radio"  name="spec_status_cd" id="i_spec_status_cd_12" value="12" > 上架
	</label>
	<label class="radio-inline">
		<input type="radio" name="spec_status_cd" id="i_spec_status_cd_22"  value="22"> 下架
	</label>
</div>
	<br>
	
	
	<div class="form-group">
	
	<div>分类图片&nbsp&nbsp&nbsp&nbsp <img id="i_spec_image_src" src="" width="100px;" height="100px;"></div>
		<label class="sr-only" for="iclassphoto">文件输入</label>
		<input type="file" id="iclassphoto" name="iclassphoto" onchange="document.getElementById('iclassphoto').value=this.value" >
	</div>
	
	<center><button type="button" class="btn btn-default" data-dismiss="modal" onclick="insertClass()">提交</button></center>
		
		
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
		<div class="input-group">
			<span class="input-group-addon">分类名称</span>
            <input type="hidden" class="form-control" name="spec_id" id="u_spec_id">
            <input type="text" class="form-control" name="spec_name" id="u_spec_name">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-addon">分类描述</span>
			<input type="text" class="form-control"  name="spec_desc" id="u_spec_desc">
		</div>
		<br>
	<div>
	
	上下架状态&nbsp&nbsp&nbsp&nbsp
	
	<label class="radio-inline">
		<input type="radio" name="spec_status_cd" id="u_spec_status_cd_12" value="12" > 上架
	</label>
	<label class="radio-inline">
		<input type="radio" name="spec_status_cd" id="u_spec_status_cd_22"  value="22"> 下架
	</label>
</div>
	<br>
	
	
	<div class="form-group">
	
	<div>分类图片&nbsp&nbsp&nbsp&nbsp <img id="u_spec_image_src" src="" width="100px;" height="100px;"></div>
		<label class="sr-only" for="classphoto">文件输入</label>
		<input type="file" id="classphoto" name="classphoto" onchange="document.getElementById('classphoto').value=this.value" >
	</div>
	
	<center><button type="button" class="btn btn-default" data-dismiss="modal" onclick="updateClass()">提交</button></center>
		
		
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
<script src="${pageContext.request.contextPath}/ht/js/jquery.form.js"></script>
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
            queryClassfiyLimit(1);
        })
    </script>
</body>
</html>
