<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>网上商城</title>
		<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/static/img/index/bitbug_favicon.ico" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/static/css/index/serch.css" />
		<script src="${ pageContext.request.contextPath }/static/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ pageContext.request.contextPath }/static/js/template-web.js" type="text/javascript" charset="utf-8"></script>
		<script >
			$(function () {
				$.ajax({
					url:'${pageContext.request.contextPath}/product/kind',
                    type:'get',
					dataType:'json',
					async:true,
					success:function (res){
						var json={'catelist':res.catelist,
						'hotmap':res.hotmap,
						'newmap':res.newmap};
						var text1=template('cate_list',json);
						var text2=template('hot_map',json);
						var text3=template('new_map',json);
						$('#cate_ul').html(text1);
                        $('#hot_div').html(text2);
                        $('#new_div').html(text3);
                    },
					error:function () {
						alert('查询失败')
                    }


				})
				$('#search').click(function () {
					if($('#sercontent').val()==null){
					    alert('输入不能为空')
					    return false;
					}
					if(!isNaN($('#sercontent').val())){
                        alert('输入不能为数字')
                        return false;
					}
                    $.ajax({
                        url:'${pageContext.request.contextPath}/go/sendtext',
						data:{'content':$('#sercontent').val()},
                        type:'get',
                        dataType:'json',
                        async:true,
                        success:function (res){
                            alert('为你匹配中')
							 window.location.href='${pageContext.request.contextPath}/go/search/${content}';
                        },
                        error:function () {
                            alert('查询失败')
                        }

                    })
                })
            })
		</script>
	</head>
	<body>
		<!--首页头部-->
		<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
			<div class="container">
				<ul class="nav navbar-nav">
					<li>
						<a href="${ pageContext.request.contextPath }/go/index">商城首页</a>
					</li>
					<c:if test="${login_user == null }">
						<li>
							<a href="#" data-toggle="modal" data-target="#myModal1">登录</a>
						</li>
						<li>
							<a href="#" data-toggle="modal" data-target="#myModal2">注册</a>
						</li>
					</c:if>
					<c:if test="${login_user != null }">
						<li>
							<a href="#">欢迎您  : ${ login_user.username }</a>
						</li>
					</c:if>
					<!--搜索框部分-->

						<form action="#" method="get" class="navbar-left navbar-form">
							<input id="sercontent" type="text" class="form-control" style="width: 300px;" placeholder="请输入要搜索的内容${ pageContext.request.contextPath }/res" />
							<button class="btn btn-primary" id="search">搜索</button>
						</form>
					<c:if test="${login_user != null }">
					<li>
						<a href="${ pageContext.request.contextPath }/go/set/1">订单中心</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/go/set/2">收藏夹</a>
					</li>
						<li>
							<a href="${ pageContext.request.contextPath }/go/set/3">我的店铺</a>
						</li>
					</c:if>
					<c:if test="${login_user != null }">
						<li>
							<a class="pull-right" href="${ pageContext.request.contextPath }/go/logout">退出</a>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>

		<hr class="divider" />
		<!--产品分类内容部分-->
		<div class="container" style="padding-top: 50px">
			<div class="col-lg-4">
				<p class="alert alert-danger">所有产品分类</p>
				<ul class="nav pro_class" id="cate_ul">

				</ul>
				<script type="text/html" id="cate_list">
					{{each catelist as value i}}
					<li>
						<a href="${ pageContext.request.contextPath }/go/second/{{value.id}}">{{value.cname}}</a>
					</li>
					{{/each}}
				</script>
			</div>
			<!--轮播图-->
			<div class="col-lg-8" style="padding-top: 70px">
				<div id="myCarousel" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<a href="#"><img src="${ pageContext.request.contextPath }/static/img/index/lunbo/1.jpg" alt="First slide"></a>
						</div>
						<div class="item">
							<a href="#"><img src="${ pageContext.request.contextPath }/static/img/index/lunbo/2.jpg" alt="Second slide"></a>
						</div>
						<div class="item">
							<a href="#"><img src="${ pageContext.request.contextPath }/static/img/index/lunbo/3.jpg" alt="Third slide"></a>
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<hr class="divider" />
		<!--产品信息部分-->
		<div class="container">
			<!--1-->
			<div class="panel panel-info">
				<div class="panel-heading">
					热门商品
				</div>
				<div class="panel-body" id="hot_div">

				</div>
				<script type="text/html" id="hot_map">
					{{each hotmap as value i}}
					<div class="thumbnail col-lg-3">
						<a href="${ pageContext.request.contextPath }/product/detail/{{value.proid}}"><img src="${ pageContext.request.contextPath }/static/img/products/{{value.cover}}" alt="${ pageContext.request.contextPath }/res."></a>
						<div class="caption">
							<h3>{{value.proname}}</h3>
							<p >销量:<span>{{value.prosales}}</span ></p>
						</div>
					</div>
					{{/each}}
				</script>
			</div>
			<!--2-->
			<div class="panel panel-info">
				<div class="panel-heading">
					最新商品
				</div>
				<div class="panel-body" id="new_div">

				</div>
				<script type="text/html" id="new_map">
					{{each newmap as value i}}
					<div class="thumbnail col-lg-3" style="height: 320px">
						<a style="height: 160px" href="${ pageContext.request.contextPath }/product/detail/{{value.proid}}"><img src="${ pageContext.request.contextPath }/static/img/products/{{value.cover}}" alt="${ pageContext.request.contextPath }/res."></a>
						<div class="caption" style="margin-bottom: -10px">
							<h3 >{{value.proname}}</h3>
						</div>
					</div>
					{{/each}}

				</script>
			</div>
		</div>
		<!--登录,注册弹出框-->
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div style="width: 400px;" class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">用户登录/注册</h4>
					</div>
					<div class="modal-body">
						<form action="${ pageContext.request.contextPath }/user/login" method="post">
							<input type="text" name="username" class="form-control" placeholder="用户名"/>
							<br />
							<input type="password" name="password" class="form-control" placeholder="密码"/>
							<br />
							<button class="btn btn-success">登录</button>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
			<div style="width: 400px;" class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel1">用户登录/注册</h4>
					</div>
					<div class="modal-body">
						<form action="${ pageContext.request.contextPath }/user/reg" method="post">
							<input type="text" name="username" class="form-control" placeholder="用户名"/>
							<br />
							<input type="password" name="password" class="form-control" placeholder="密码"/>
							<br />
							<button class="btn btn-warning">注册</button>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<hr class="divider" />
		<div class="text-center navbar-inverse">
			<ul class="foot_links" style="list-style: none;color: white;">
				<li class="link_map">
					<a target="_blank" href="//ieg.tencent.com/">网上商城</a>
					<span class="f_line">|</span><a target="_blank" href="//game.qq.com/contract.shtml">霸王条款</a><span class="f_line">|
					</span><a target="_blank" href="//game.qq.com/privacy_guide.shtml">隐私保护指引</a><span class="f_line">
						|</span><a target="_blank" href="//game.qq.com/hr/">java开发招聘</a><span class="f_line">|</span><a target="_blank" href="//kf.qq.com/">客服投诉</a><span class="f_line">|
						</span><a target="_blank" href="//game.qq.com/gnav/">地图设计</a><span class="f_line">|</span><a target="_blank" href="//game.qq.com/portal2010/business.htm">商务合作</a><span class="f_line">
							|</span><a target="_blank" href="//www.qq.com/">泡泡网</a><span class="f_line">|</span><a target="_blank" href="//www.qq.com/map/">网站导航</a></li><li class="copyright_zh">
				<a target="_blank" href="//www.tencent.com/law/mo_law.shtml?/law/copyright.htm">个人版权所有</a></li>
				<span class="f_line"></span> 出版物号：ISBN 978-7-89989-145-2<span class="f_line">|</span>全国文化市场统一举报电话：12318 </li></ul>
		</div>
	</body>
</html>