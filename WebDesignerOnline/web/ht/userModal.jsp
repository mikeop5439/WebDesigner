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
<title>使用量分析</title>

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
		<div class="attribution">Template by 黄鼎运、曾盈</div>
	</div><!--/.sidebar-->
	
	
	
	
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">使用量分析</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">使用量分析</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">使用量分析</div>
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
	<script src="${pageContext.request.contextPath}/ht/js/vintage.js"></script>


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
                url:"${pageContext.request.contextPath }/analysis/saleAnalysis.action",
                type:"POST",
                contentType:'application/json;charset=utf-8',
                dataType:"json",
                success:function(data){
                    var maxc=0;
                    var maxp=0;
                    var all=0;
                    var ie=0;
                    var builderJson = {};
                    var charts={};
                    var components={};
                    var downloadJson ={};
                    var themeJson = {};
                    $.each(data.prodsAndCounts,function(index,content){
                        if(index==0){
                            maxc=content.count;
                        }
                        else{
                            if(maxc>=content.count){

                            }else{
                                maxc=content.count;
                            }
                        }
                        all=all+content.count;
                        eval("charts."+content.prods_name+"="+content.count);
                    });
                    $.each(data.classfiyAndCounts,function(index,content){
                        if(index==0){
                            maxp=content.count;
                        }
                        else{
                            if(maxp>=content.count){

                            }else{
                                maxp=content.count;
                            }
                        }
                        ie=ie+content.count;
                        eval("components."+""+content.prods_name+""+"="+content.count);
                    });
                    $.each(data.prodsAndCounts,function(index,content){
                        eval("downloadJson."+content.prods_name+"="+content.count);
                    });
                    $.each(data.classfiyAndCounts,function(index,content){
                        eval("themeJson."+content.prods_name+"="+content.count);
                    });
                    builderJson.charts=charts;
                    builderJson.components=components;
                    builderJson.all=all;
                    builderJson.ie=ie;
                    builderJson.maxc=maxc;
                    builderJson.maxp=maxp;
                    console.log(themeJson);
                    console.log(builderJson);
                    console.log(maxc);
                    console.log(maxp);

                    var mychart=echarts.init(document.getElementById('main'),'vintage');
                    var canvas = document.createElement('canvas');
                    var ctx = canvas.getContext('2d');
                    canvas.width = canvas.height = 100;
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'middle';
                    ctx.globalAlpha = 0.08;
                    ctx.font = '20px Microsoft Yahei';
                    ctx.translate(50, 50);
                    ctx.rotate(-Math.PI / 4);

                    option = {
                        backgroundColor: {
                            type: 'pattern',
                            image: canvas,
                            repeat: 'repeat'
                        },
                        tooltip: {},
                        title: [{
                            text: '模板使用概况 TOP10',
                            subtext: '使用量总计 ' + builderJson.all,
                            x: '25%',
                            textAlign: 'center'
                        }, {
                            text: '模板使用 TOP10',
                            subtext: '使用量总计 ' + Object.keys(downloadJson).reduce(function (all, key) {
                                return all + downloadJson[key];
                            }, 0),
                            x: '75%',
                            textAlign: 'center'
                        }, {
                            text: '分类使用量 TOP10',
                            subtext: '使用量总计 ' + Object.keys(themeJson).reduce(function (all, key) {
                                return all + themeJson[key];
                            }, 0),
                            x: '75%',
                            y: '50%',
                            textAlign: 'center'
                        }],
                        grid: [{
                            top: 50,
                            width: '50%',
                            bottom: '45%',
                            left: 30,
                            containLabel: true
                        }, {
                            top: '55%',
                            width: '50%',
                            bottom: 0,
                            left: 30,
                            containLabel: true
                        }],
                        xAxis: [{
                            type: 'value',
                            min:0,
                            max: builderJson.maxc,
                            splitLine: {
                                show: false
                            }
                        }, {
                            type: 'value',
                            min:0,
                            max: builderJson.maxp,
                            gridIndex: 1,
                            splitLine: {
                                show: false
                            }
                        }],
                        yAxis: [{
                            type: 'category',
                            data: Object.keys(builderJson.charts),
                            axisLabel: {
                                interval: 0,
                                rotate: 30
                            },
                            splitLine: {
                                show: false
                            }
                        }, {
                            gridIndex: 1,
                            type: 'category',
                            data: Object.keys(builderJson.components),
                            axisLabel: {
                                interval: 0,
                                rotate: 30
                            },
                            splitLine: {
                                show: false
                            }
                        }],
                        series: [{
                            type: 'bar',
                            stack: 'chart',
                            z: 3,
                            label: {
                                normal: {
                                    position: 'right',
                                    show: true
                                }
                            },
                            data: Object.keys(builderJson.charts).map(function (key) {
                                return builderJson.charts[key];
                            })
                        }, {
                            type: 'bar',
                            stack: 'chart',
                            silent: true,
                            itemStyle: {
                                normal: {
                                    color: '#eee'
                                }
                            },
                            data: Object.keys(builderJson.charts).map(function (key) {
                                return builderJson.maxc - builderJson.charts[key];
                            })
                        }, {
                            type: 'bar',
                            stack: 'component',
                            xAxisIndex: 1,
                            yAxisIndex: 1,
                            z: 3,
                            label: {
                                normal: {
                                    position: 'right',
                                    show: true
                                }
                            },
                            data: Object.keys(builderJson.components).map(function (key) {
                                return builderJson.components[key];
                            })
                        }, {
                            type: 'bar',
                            stack: 'component',
                            silent: true,
                            xAxisIndex: 1,
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#eee'
                                }
                            },
                            data: Object.keys(builderJson.components).map(function (key) {
                                return builderJson.maxp - builderJson.components[key];
                            })
                        }, {
                            type: 'pie',
                            radius: [0, '30%'],
                            center: ['75%', '25%'],
                            data: Object.keys(downloadJson).map(function (key) {
                                return {
                                    name: key.replace('.js', ''),
                                    value: downloadJson[key]
                                }
                            })
                        }, {
                            type: 'pie',
                            radius: [0, '30%'],
                            center: ['75%', '75%'],
                            data: Object.keys(themeJson).map(function (key) {
                                return {
                                    name: key.replace('.js', ''),
                                    value: themeJson[key]
                                }
                            })
                        }]
                    }
                    mychart.setOption(option);
                }
            });

        })
	</script>
</body>

</html>
