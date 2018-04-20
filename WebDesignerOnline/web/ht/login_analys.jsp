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
				<a class="navbar-brand" href="#"><span>米拉</span>后台管理系统</a>
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
			<li><a href="classfiy.jsp"><span class="glyphicon glyphicon-dashboard"></span> 分类管理</a></li>
			<li><a href="modal.jsp"><span class="glyphicon glyphicon-th"></span> 资源管理</a></li>
			<li><a href="manager.jsp"><span class="glyphicon glyphicon-list-alt"></span> 权限管理</a></li>
			<li class="parent active">
				<a href="#">
					<span class="glyphicon glyphicon-stats"></span> 数据分析 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
				</a>
				<ul class="children collapsein" id="sub-item-1">
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
		<div class="attribution">Template by <a href="http://www.medialoot.com/item/lumino-admin-bootstrap-template/">Medialoot</a></div>
	</div><!--/.sidebar-->
	
	
	
	
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">访问流量</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">访问流量</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">历史时间内系统的访问曲线变化</div>
					<div class="panel-body">
						<div id="main" style="height: 1000%;width: 80%"></div>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
		
		
		
		
	</div><!--/.main-->


	
	
	<script src="${pageContext.request.contextPath}/ht/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/chart-data.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/easypiechart.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/easypiechart-data.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/bootstrap-table.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/ConvertDate.js"></script>
	<script src="${pageContext.request.contextPath}/ht/js/echarts.js"></script>

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
            $.ajax({
                url:"${pageContext.request.contextPath }/analysis/dateAnalysis.action",
                type:"POST",
                contentType:'application/json;charset=utf-8',
                dataType:"json",
                success:function(data){
                    var count=[];
                    var date=[];
                    $.each(data,function(index,content){
                        var time = "/Date("+content.user_accesstime+")/";
                        count.push(content.count);
                        date.push(getDateTime(ConvertJSONDateToJSDate(time)));
                    });
                    console.log(count);
                    console.log(date);
                    var mychart=echarts.init(document.getElementById('main'));
                    option = {
                        tooltip: {
                            trigger: 'axis',
                            position: function (pt) {
                                return [pt[0], '10%'];
                            }
                        },
                        title: {
                            left: 'center',
                            text: '流量分析',
                            subtext: 'data from MiLaDerigner',
                        },
                        toolbox: {
                            feature: {
                                dataZoom: {
                                    yAxisIndex: 'none'
                                },
                                restore: {},
                                saveAsImage: {}
                            }
                        },
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data:date
                        },
                        yAxis: {
                            type: 'value',
                            boundaryGap: [0, '100%']
                        },
                        dataZoom: [{
                            type: 'inside',
                            start: 0,
                            end: 10
                        }, {
                            start: 0,
                            end: 10,
                            handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                            handleSize: '80%',
                            handleStyle: {
                                color: '#fff',
                                shadowBlur: 3,
                                shadowColor: 'rgba(0, 0, 0, 0.6)',
                                shadowOffsetX: 2,
                                shadowOffsetY: 2
                            }
                        }],
                        series: [
                            {
                                name:'访问量',
                                type:'line',
                                smooth:true,
                                symbol: 'none',
                                sampling: 'average',
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'
                                    }
                                },
                                areaStyle: {
                                    normal: {
                                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                            offset: 0,
                                            color: 'rgb(255, 158, 68)'
                                        }, {
                                            offset: 1,
                                            color: 'rgb(255, 70, 131)'
                                        }])
                                    }
                                },
                                data:count
                            }
                        ]
                    };
                    mychart.setOption(option);
                }
            });

        })
	</script>
</body>

</html>
