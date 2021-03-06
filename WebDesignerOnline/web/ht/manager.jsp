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
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>MiLaDesigner</span>系统管理平台</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> ${sessionScope.username} <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							
							<li><a href="${pageContext.request.contextPath }/users/quitUser.action"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
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
			<li id="manager_jsp" class="active"><a href="manager.jsp"><span class="glyphicon glyphicon-list-alt"></span> 权限管理</a></li>
			<li id="analysis_jsp" class="parent">
				<a href="#">
					<span class="glyphicon glyphicon-stats"></span> 数据分析 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li class="active">
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
				<li class="active">权限管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">权限管理</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">管理用户权限</div>
					<div class="panel-body">
						<table data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
						    <tr>
						        <th data-field="user_name" data-sortable="true" >用户名</th>
						        <th data-field="user_register" data-sortable="true">注册时间</th>
						        <th data-field="user_flage"  data-sortable="true">用户标识</th>
						        <th data-field="price" data-sortable="true">操作</th>
						    </tr>
						    </thead>
						    <tbody id="tableinsert">
							<tr >
								<td colspan="4">No matching records found</td>


							</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
		
		
		
		
	</div><!--/.main-->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<input type="hidden" id="user_id">
				<input type="hidden" id="user_falge">
				<h4  id="myModalLabel" style="text-align: center;">
					你确认更改吗？
				</h4>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
				关闭
				</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="setManager()">
					确认
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>
	
	
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
<script type="text/javascript">
    $(document).ready(function(){

	})
</script>
</body>

</html>
